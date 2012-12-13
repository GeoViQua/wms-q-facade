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
package org.n52.wmsqadapter.config;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "WMSMapping")
public class WMSMapping {

	@XmlAttribute(name = "id")
	private String identifier;
	@XmlElement(name = "URL")
	private String url;

	@XmlElementWrapper(name = "UncertaintyMappings")
	@XmlElement(name = "UncertaintyMapping")
	private List<UncertaintyMapping> uncertaintyMappings = new ArrayList<UncertaintyMapping>();

	public String getIdentifier() {
		return identifier;
	}

	public List<UncertaintyMapping> getUncertaintyMappings() {
		return uncertaintyMappings;
	}

	public String getUrl() {
		return url;
	}

	public String getUncertaintyKeyword(String layerName) {
		for (UncertaintyMapping mapping : uncertaintyMappings) {
			if (mapping.getLayerName().equals(layerName)) {
				return mapping.getUncertaintyKeyword();
			}
		}

		return null;
	}
}
