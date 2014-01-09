/**
 * Copyright 2012 52°North Initiative for Geospatial Open Source Software GmbH
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.n52.wmsqadapter.application;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.xml.bind.JAXB;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.n52.wmsqadapter.config.Config;
import org.n52.wmsqadapter.config.WMSMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Path("/{wmsId}/wms")
public class WMSResource {

	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Document getCapabilities(@PathParam("wmsId") String wmsId,
			@QueryParam("REQUEST") String requestParam,
			@QueryParam("SERVICE") String serviceParam,
			@Context ServletContext context, @Context HttpServletRequest request) {
		if (serviceParam == null || !serviceParam.equalsIgnoreCase("WMS")) {
			throw new WebApplicationException(Response.serverError()
					.entity("Invalid SERVICE parameter, has to be WMS").build());
		}

		if (requestParam == null
				|| !requestParam.equalsIgnoreCase("GetCapabilities")) {
			throw new WebApplicationException(
					Response.serverError()
							.entity("Invalid REQUEST parameter, this adapter only serves GetCapabilties requests")
							.build());
		}

		Config config = null;
		try {
			// Load config.xml from WEB-INF
			config = JAXB.unmarshal(
					context.getResourceAsStream("/WEB-INF/config.xml"),
					Config.class);
		} catch (Exception e) {
			throw new WebApplicationException(Response.serverError()
					.entity("Error reading configuration file").build());
		}

		WMSMapping wmsMapping = config.getWMSMapping(wmsId);
		if (wmsMapping == null) {
			// No mapping found for specified identifier
			throw new WebApplicationException(Status.NOT_FOUND);
		}

		return getAdaptedCapabilities(wmsMapping, request.getQueryString());
	}

	/**
	 * Gets Capabilities document from the original service as specified in the
	 * wmsMapping parameter. This method augments that result with uncertainty
	 * keywords, matching layer names to keywords.
	 * 
	 * @param wmsMapping
	 * @param queryString
	 *            The request parameters to append to calls to the original
	 *            service
	 * @return
	 */
	private Document getAdaptedCapabilities(WMSMapping wmsMapping,
			String queryString) {
		try {
			DocumentBuilder documentBuilder = DocumentBuilderFactory
					.newInstance().newDocumentBuilder();

			URL url = new URL(wmsMapping.getUrl() + "?" + queryString);
			// Document doc = db.parse(url.openStream());
			URLConnection connection = url.openConnection();
			connection.setReadTimeout(30000);
			connection.setConnectTimeout(30000);
			Document doc = documentBuilder.parse(connection.getInputStream());

			XPathFactory factory = XPathFactory.newInstance();
			XPath xpath = factory.newXPath();

			// Add GetMetadata DCPType
			Element requestNode = (Element) xpath.evaluate(
					"//Capability/Request", doc, XPathConstants.NODE);
			if (requestNode.getElementsByTagName("GetMetadata").getLength() == 0) {
				Element metadataElement = doc.createElement("GetMetadata");

				Element linkElement = doc.createElement("OnlineResource");
				linkElement.setAttribute("xlink:href", wmsMapping.getUrl());
				linkElement.setAttribute("xlink:type", "simple");

				metadataElement.appendChild(doc.createElement("DCPType"))
						.appendChild(doc.createElement("HTTP"))
						.appendChild(doc.createElement("Get"))
						.appendChild(linkElement);

				requestNode.appendChild(metadataElement);
			}

			// Get all layer nodes to add uncertainty keywords
			NodeList layerNodes = (NodeList) xpath.evaluate(
					"//Capability//Layer", doc, XPathConstants.NODESET);
			for (int i = 0; i < layerNodes.getLength(); i++) {
				String layerName = xpath.evaluate("Name/text()",
						layerNodes.item(i));
				String uncertaintyKeyword = wmsMapping
						.getUncertaintyKeyword(layerName);
				if (uncertaintyKeyword != null) {
					Element keywordsNode = (Element) xpath.evaluate(
							"/KeywordList", layerNodes.item(i),
							XPathConstants.NODE);

					if (keywordsNode == null) {
						keywordsNode = (Element) layerNodes.item(i)
								.appendChild(doc.createElement("KeywordList"));
					}

					Element keywordNode = doc.createElement("Keyword");
					keywordNode.setAttribute("vocabulary",
							"http://www.uncertml.org/distributions/");
					keywordNode.setTextContent(uncertaintyKeyword);

					keywordsNode.appendChild(keywordNode);
				}
			}

			return doc;

		} catch (ParserConfigurationException e) {
			throw new WebApplicationException(
					Response.serverError()
							.entity("Error parsing GetCapabilities of adapted service\n"
									+ e.getMessage()).build());
		} catch (MalformedURLException e) {
			throw new WebApplicationException(Response.serverError()
					.entity("Invalid service configuration: " + e.getMessage())
					.build());
		} catch (IOException e) {
			throw new WebApplicationException(Response
					.serverError()
					.entity("Error requesting adapted service\n"
							+ e.getMessage()).build());
		} catch (XPathExpressionException e) {
			throw new WebApplicationException(
					Response.serverError()
							.entity("Error parsing GetCapabilities of adapted service\n"
									+ e.getMessage()).build());
		} catch (SAXException e) {
			throw new WebApplicationException(
					Response.serverError()
							.entity("Error parsing GetCapabilities of adapted service\n"
									+ e.getMessage()).build());
		}
	}
}
