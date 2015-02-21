<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
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

	<xsl:template match='xslthl:keyword'  mode="xslthl">
		<fo:inline font-weight="bold" color="#7F0055"><xsl:apply-templates/></fo:inline>
	</xsl:template>
	
	<xsl:template match='xslthl:comment'  mode="xslthl">
		<fo:inline color="#3F5F5F"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:oneline-comment'  mode="xslthl">
		<fo:inline color="#3F5F5F"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:multiline-comment'  mode="xslthl">
		<fo:inline color="#3F5FBF"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:tag'  mode="xslthl">
		<fo:inline  color="#3F7F7F"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:attribute'  mode="xslthl">
		<fo:inline color="#7F007F"><xsl:apply-templates/></fo:inline>
	</xsl:template>
	
	<xsl:template match='xslthl:value'  mode="xslthl">
		<fo:inline color="#2A00FF"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:string'  mode="xslthl">
		<fo:inline color="#2A00FF"><xsl:apply-templates/></fo:inline>
	</xsl:template>
	
	<xsl:template match='xslthl:number' mode="xslthl">
		<fo:inline color="#7F007F"><xsl:apply-templates/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:annotation' mode="xslthl">
		<fo:inline color="gray"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<xsl:template match='xslthl:directive' mode="xslthl">
		<fo:inline color="#7F0055"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>

	<!-- Not sure which element will be in final XSLTHL 2.0 -->
	<xsl:template match='xslthl:doccomment|xslthl:doctype' mode="xslthl">
		<fo:inline font-weight="bold" color="#3F5F5F"><xsl:apply-templates mode="xslthl"/></fo:inline>
	</xsl:template>
</xsl:stylesheet>
