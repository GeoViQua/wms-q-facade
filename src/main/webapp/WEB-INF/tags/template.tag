<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%@tag
	description="Template based on https://wiki.52north.org/pub/Intranet/WebsiteTemplateDocumentation/index.html"
	pageEncoding="ISO-8859-1"%>
<%@attribute name="content" fragment="true"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>WMS-Q Facade</title>
<link href="http://52north.org/templates/52n/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet"
	href="http://52north.org/templates/52n/css/external-sites-template/external-site_52n-template-2011_site.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="http://52north.org/templates/52n/css/external-sites-template/external-site_52n-template-2011_print.css"
	type="text/css" media="print" />
<link rel="stylesheet"
	href="http://52north.org/templates/52n/52n_menus/52n_cssmenu/52n.cssmenu.css"
	type="text/css" />

<meta name="author" content="h.hopmann@52north.org" />
<meta name="Date-Creation-yyyymmdd" content="20121217" />
<meta name="Date-Revision-yyyymmdd" content="20121217" />
<meta http-equiv="Content-Language" content="en" />
</head>
<body class="composite">
	<div id="bg_h"></div>
	<div id="navigation_h">
		<div id="wopper" class="wopper">
			<div id="ja-mainnavwrap">
				<div id="ja-mainnav">
					<ul id="ja-cssmenu" class="clearfix">
						<li><a href="http://geoviqua.dev.52north.org/greenland"
							class="menu-item1" title="Greenland"><span class="menu-title">Greenland</span></a></li>
						<li><a href="http://52north.org/communities/geostatistics/"
							class="menu-item2" title="Geostatistics Community"><span
								class="menu-title">Geostatistics Community</span></a></li>
						<li class="menu-item1"><a
							href="https://wiki.52north.org/bin/view/Geostatistics/GeoViQua"
							class="menu-item3" title="GeoViQua Wiki"><span
								class="menu-title">GeoViQua Wiki</span></a></li>
						<li class="menu-item4"><a
							href="http://52north.org/communities/" class="menu-item4"
							title="52&deg;North Initiative"><span class="menu-title">52&deg;North
									Initiative</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper">
		<a
			title="52&deg;North Initiative for Geospatial Open Source Software GmbH"
			href="http://52north.org/"> <span><img border="0"
				src="http://52north.org/templates/52n/images/52n-logo.gif"
				alt="52&deg;North Logo" /></span>
		</a> <br /> <br />
		<!-- LeftColumn kann deaktiviert werden, aber dann sollte in dieser Datei die Eigenschaft padding der Klasse #bodyColumn angepasst werden. Z.B. padding: 0 10px 0 10px; -->
		<div id="leftColumn">
			<div id="navcolumn">
				<h5>Navigation</h5>
				<ul>
					<li><a title="Config" href="./">Home</a></li>
					<li><a title="Config" href="config.html">Configuration</a></li>
				</ul>
			</div>
		</div>
		<div id="bodyColumn">
			<div id="contentBox">
				<div class="section">
					<!-- hier kommt der eigentliche Inhalt der Seite -->
					<jsp:invoke fragment="content" />
					<br />
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="f_top">
			<div id="f_navigation">
				<div class="fn_box">
					<h3>Communities</h3>
					<ul class="fn_list">
						<li><a href="http://52north.org/communities/sensorweb/">Sensor
								Web</a></li>
						<li><a href="http://52north.org/communities/geoprocessing">Geoprocessing</a></li>
						<li><a href="http://52north.org/communities/ilwis/overview">ILWIS</a></li>
						<li><a
							href="http://52north.org/communities/earth-observation/overview">Earth
								Observation</a></li>
						<li><a href="http://52north.org/communities/security/">Security
								&amp; Geo-RM</a></li>
						<li><a href="http://52north.org/communities/semantics/">Semantics</a></li>
						<li><a
							href="http://52north.org/communities/geostatistics/overview">Geostatistics</a></li>
						<li><a href="http://52north.org/communities/3d-community">3D
								Community</a></li>
						<li><a
							href="http://52north.org/communities/metadata-management-community/">Metadata
								Management</a></li>
					</ul>
				</div>
				<div class="fn_box">
					<h3>Get Involved</h3>
					<ul class="fn_list">
						<li><a
							href="http://52north.org/about/get-involved/partnership-levels">Partnership
								Levels</a></li>
						<li><a
							href="http://52north.org/about/get-involved/license-agreement">License
								Agreement</a></li>
					</ul>
				</div>
				<div class="fn_box">
					<h3>Affiliations</h3>
					<p>The 52&deg;North affiliations:</p>
					<a href="http://www.opengeospatial.org/" target="_blank"
						title="OGC Assiciate Members"><img border="0" alt=""
						src="http://52north.org/images/logos/ogc.gif" /></a> <br /> <a
						href="http://www.sensorweb-alliance.org/" target="_blank"
						title="Sensor Web Alliance"><img border="0" alt=""
						src="http://52north.org/images/logos/swa.gif" /></a>
				</div>
				<div class="fn_box">
					<h3>Cooperation partners</h3>
					<p>The 52&deg;North principal cooperation partners</p>
					<table cellpadding="0" border="0">
						<tbody>
							<tr>
								<td><a href="http://ifgi.uni-muenster.de/" target="_blank"
									title="Institute for Geoinformatics"><img height="40"
										border="0" width="117" alt=""
										src="http://52north.org/images/logos/ifgi.gif" /></a></td>
								<td><a href="http://www.conterra.de/" target="_blank"
									title="con terra GmbH"><img height="40" border="0"
										width="81" alt=""
										src="http://52north.org/images/logos/conterra_new.png" /></a></td>
							</tr>
							<tr>
								<td><a href="http://www.esri.com/" target="_blank"
									title="ESRI"><img height="40" border="0" width="110" alt=""
										src="http://52north.org/images/logos/esri_new.gif" /></a></td>
								<td><a href="http://www.itc.nl/" target="_blank"
									title="International Institute for Geo-Information  Science and Earth    Observation"><img
										height="40" border="0" width="34" alt=""
										src="http://52north.org/images/logos/itc.gif" /></a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div id="f_bottom">
			<ul>
				<li><a href="http://52north.org/about/contact">Contact</a></li>
				<li><a href="http://52north.org/about/imprint">Imprint</a></li>
			</ul>
			<small>Copyright &copy; </small>
			<script type="text/javascript">
			<!--
				var now = new Date();
				document.write("<small>" + now.getFullYear() + "</small>");
			//-->
			</script>
			<noscript>
				<small>2012</small>
			</noscript>
			<small>52&deg;North Initiative for Geospatial Open Source
				Software GmbH. All Rights Reserved.</small>
		</div>
	</div>
</body>
</html>
