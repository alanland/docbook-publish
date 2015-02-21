<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xslthl="http://xslthl.sf.net"
                exclude-result-prefixes="xslthl"
                version='1.0'>

<!-- ********************************************************************
     $Id: highlight.xsl 8419 2009-04-29 20:37:52Z kosek $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     and other information.

     ******************************************************************** -->

	<xsl:import href="../docbook/highlighting/common.xsl"/>
	<xsl:param name="highlight.source" select="1"/>
	<xsl:param name="highlight.default.language" select="xml" />
	<xsl:param name="highlight.xslthl.config">file:///f:/ZhuXiao/Programs/MAP/WMS-MAP/misc/docbook-publish/xsl/docbook/highlighting/xslthl-config.xml</xsl:param>
	
	<xsl:template match='xslthl:keyword' mode="xslthl">
		<span class="hl-keyword"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:comment' mode="xslthl">
		<span class="hl-comment"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:oneline-comment' mode="xslthl">
		<span class="hl-comment"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:multiline-comment' mode="xslthl">
		<span class="hl-multiline-comment"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:tag' mode="xslthl">
		<span class="hl-tag"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:attribute' mode="xslthl">
		<span class="hl-attribute"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:value' mode="xslthl">
		<span class="hl-value"><xsl:value-of select='.'/></span>
	</xsl:template>
	
	<xsl:template match='xslthl:string' mode="xslthl">
		<span class="hl-string"><xsl:value-of select='.'/></span>
	</xsl:template>
	
	<xsl:template match='xslthl:number' mode="xslthl">
		<span class="hl-number"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:annotation' mode="xslthl">
		<span class="hl-annotation"><xsl:value-of select='.'/></span>
	</xsl:template>

	<xsl:template match='xslthl:directive' mode="xslthl">
		<span class="hl-directive"><xsl:value-of select='.'/></span>
	</xsl:template>

	<!-- Not sure which element will be in final XSLTHL 2.0 -->
	<xsl:template match='xslthl:doccomment|xslthl:doctype' mode="xslthl">
		<span class="hl-doctype"><xsl:value-of select='.'/></span>
	</xsl:template>
</xsl:stylesheet>