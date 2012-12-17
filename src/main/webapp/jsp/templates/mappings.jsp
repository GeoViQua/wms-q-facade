<%@page trimDirectiveWhitespaces="true"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:template>
	<jsp:attribute name="content">
					
	<h1 align="center">WMS-Q Facade Configuration</h1>

<dl>
	<c:forEach var="mapping" items="${it.mappings}">
		<dt>Mapping "${mapping.identifier}"</dt>
		<dd>
		WMS Url: <a href="${mapping.url}" target="_blank">${mapping.url}</a>
		<br />
		Layer Mappings to Uncertainty Keyword:
		<ul>
			<c:forEach var="layerMapping" items="${mapping.uncertaintyMappings}">
				<li>"${layerMapping.layerName}" to
					"${layerMapping.uncertaintyKeyword}"</li>
			</c:forEach>
		</ul>
		<br />
		Examples: <br />
		<a
						href="${mapping.url}?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities"
						target="_blank">WMS GetCapabilities 1.3.0</a>
		<a
						href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/${mapping.identifier}/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities"
						target="_blank">WMS-Q GetCapabilities 1.3.0</a>
		<br />
		<a
						href="${mapping.url}?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetCapabilities"
						target="_blank">WMS GetCapabilities 1.1.1</a>
		<a
						href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/${mapping.identifier}/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetCapabilities"
						target="_blank">WMS-Q GetCapabilities 1.1.1</a>


		</dd>
		<br />
		<hr />
		<br />
	</c:forEach>
</dl>
</jsp:attribute>
</t:template>