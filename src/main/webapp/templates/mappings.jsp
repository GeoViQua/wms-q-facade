<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>WMS-Q Facade Mappings</title>
</head>
<body>

	<h1>WMS-Q Facade Configuration</h1>

	<c:forEach var="mapping" items="${it.mappings}">
		<b>Mapping "${mapping.identifier}"</b>
		<br />
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


		<br />
		<hr />
		<br />
	</c:forEach>

</body>
</html>