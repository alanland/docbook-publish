<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

	<xsl:import href="docbook/epub/docbook.xsl" />
	<xsl:import href="highlighting/html-highlighting.xsl" />

	<xsl:import href="common.xsl" />
	
	<xsl:param name="callout.graphics" select="0" />
	<xsl:param name="admon.graphics" select="0" />
	
	<xsl:param name="ignore.image.scaling" select="1" />
	
	<xsl:param name="table.borders.with.css" select="0" />
	<xsl:param name="ade.extensions" select="1"/>
	<xsl:param name="html.stylesheet">resources/style.css</xsl:param>
	<xsl:param name="html.stylesheet.type">text/css</xsl:param>
	<xsl:param name="make.graphic.viewport" select="0" />
	
	<xsl:param name="epub.stylesheet">resources/style.css</xsl:param>
	<xsl:param name="epub.metainf.dir">META-INF/</xsl:param>
	<xsl:param name="epub.oebps.dir">OEBPS/</xsl:param>
	

</xsl:stylesheet>