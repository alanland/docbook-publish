<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

	<xsl:import href="docbook/webhelp/xsl/webhelp.xsl" />
	<xsl:import href="highlighting/html-highlighting.xsl" />

	<xsl:param name="webhelp.include.search.tab" select="0" />
	<xsl:param name="webhelp.base.dir">out/webhelp</xsl:param>
	<xsl:param name="webhelp.indexer.language" select="en" />
	<xsl:param name="branding" select="docbook" />
	<xsl:param name="brandname" select="DocBook" />
	<xsl:param name="admon.graphics" select="0" />
	<xsl:param name="suppress.footer.navigation" select="0" />

</xsl:stylesheet>