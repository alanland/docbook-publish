<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:d="http://docbook.org/ns/docbook"
	exclude-result-prefixes="d" version="1.0">

	<xsl:import href="docbook/fo/docbook.xsl"/>
	<xsl:import href="highlighting/fo-highlighting.xsl"/>
	<xsl:import href="common.xsl"/>

	<!--图片路径-->
	<xsl:param name="keep.relative.image.uris" select="1"/>
	<xsl:param name="img.src.path">./</xsl:param>

	<!-- 显示图表 -->
	<xsl:param name="callout.graphics" select="1"/>
	<xsl:param name="admon.graphics" select="1"/>

	<xsl:param name="callout.graphics.extension">.svg</xsl:param>
	<xsl:param name="admon.graphics.extension">.png</xsl:param>
	<xsl:template match="*" mode="admon.graphic.width">
		<xsl:text>24pt</xsl:text>
	</xsl:template>

	<xsl:param name="fop1.extensions" select="1"/>

	<xsl:param name="ulink.footnotes" select="0"/>
	<xsl:param name="ulink.show" select="0"/>
	<xsl:param name="ulink.hyphenate">&#x200b;</xsl:param>
	<xsl:param name="ulink.hyphenate.chars">/&amp;?</xsl:param>

	<!-- <xsl:param name="paper.type">A4</xsl:param> -->

	<!-- 
	<xsl:param name="body.font.family">'Times','SimSun'</xsl:param> 
	<xsl:param name="body.font.family">'FZKai-Z03'</xsl:param>
	<xsl:param name="body.font.master">10</xsl:param>
	<xsl:param name="title.font.family">'Helvetica','DroidSansFallback'</xsl:param>
	<xsl:param name="dingbat.font.family">'Helvetica','DroidSansFallback'</xsl:param>

	<xsl:param name="monospace.font.family">'DroidSansMono','DroidSansFallback'</xsl:param>
	<xsl:param name="sans.font.family">'Helvetica','DroidSansFallback'</xsl:param>
-->


	<!-- 
	<xsl:param name="generate.toc">
		book toc,title
	</xsl:param>
	 -->

	<xsl:param name="body.start.indent">0pt</xsl:param>

	<xsl:param name="draft.mode">no</xsl:param>

	<!-- 警告框设置 -->
	<xsl:attribute-set name="admonition.properties">
		<!--字体-->
		<xsl:attribute name="font-family">FangSong_GB2312,SimSun</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<!--边框-->
		<!--		<xsl:attribute name="border-left-style">solid</xsl:attribute>-->
		<!--		<xsl:attribute name="border-left-color">black</xsl:attribute>-->
		<!--		<xsl:attribute name="border-left-width">1pt</xsl:attribute>-->
		<!--		<xsl:attribute name="border-left">1px solid</xsl:attribute>-->
		<!--边缘＆填充-->
		<xsl:attribute name="padding">.33em 0 0 5px</xsl:attribute>
		<xsl:attribute name="padding-left">2em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>
		<!-- 背景色 -->
		<xsl:attribute name="background-color">#FFEEFF</xsl:attribute>
		<!-- 背景色 -->
		<xsl:attribute name="background-color">
			<xsl:variable name="node" select="."/>
			<xsl:choose>
				<!--注意-->
				<xsl:when test="name($node)='note'">#ccadcc</xsl:when>
				<!--警告-->
				<xsl:when test="name($node)='warning'">#cc3d3d</xsl:when>
				<!--小心-->
				<xsl:when test="name($node)='caution'">#cc8f52</xsl:when>
				<!--提示-->
				<xsl:when test="name($node)='tip'">#47b247</xsl:when>
				<!--重要-->
				<xsl:when test="name($node)='important'">#66ccff</xsl:when>
				<xsl:otherwise>#069</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="admonition.title.properties">
		<!--字体-->
		<xsl:attribute name="font-family">FangSong_GB2312,SimSun</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
		<!--边框-->
		<!--		<xsl:attribute name="border-left-style">solid</xsl:attribute>-->
		<!--		<xsl:attribute name="border-left-color">black</xsl:attribute>-->
		<!--		<xsl:attribute name="border-left-width">1pt</xsl:attribute>-->
		<!--边缘＆填充-->
		<xsl:attribute name="padding-left">2em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>
		<xsl:attribute name="space-after">0pt</xsl:attribute>
		<!-- 背景色 -->
		<xsl:attribute name="background-color">
			<xsl:variable name="node" select="."/>
			<xsl:choose>
				<!--注意-->
				<xsl:when test="name($node)='note'">#cc99cc</xsl:when>
				<!--警告-->
				<xsl:when test="name($node)='warning'">#990000</xsl:when>
				<!--小心-->
				<xsl:when test="name($node)='caution'">#cc6600</xsl:when>
				<!--提示-->
				<xsl:when test="name($node)='tip'">#009900</xsl:when>
				<!--重要-->
				<xsl:when test="name($node)='important'">#006699</xsl:when>
				<xsl:otherwise>#069</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="formal.title.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.9"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="hyphenate.verbatim" select="0"/>

	<xsl:attribute-set name="monospace.verbatim.properties">
		<xsl:attribute name="font-size">7pt</xsl:attribute>
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">\</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="verbatim.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.8"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="padding">3pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="shade.verbatim" select="1"/>

	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="figure.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="header.content.properties">
		<xsl:attribute name="font-family">FangSong_GB2312,SimSun</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="footer.content.properties">
		<xsl:attribute name="font-family">FangSong_GB2312,SimSun</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>

	<!--段落缩进-->
	<xsl:attribute-set name="para.properties" use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="text-indent">
			<xsl:variable name="node" select="."/>
			<xsl:choose>
				<xsl:when test="name($node)='section'">2em</xsl:when>
				<xsl:when test="name($node)='sect1'">2em</xsl:when>
				<xsl:when test="name($node)='sect2'">2em</xsl:when>
				<xsl:when test="name($node)='sect3'">2em</xsl:when>
				<xsl:when test="name($node)='sect4'">2em</xsl:when>
				<xsl:when test="name($node)='sect5'">2em</xsl:when>
				<xsl:otherwise>0em</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1em</xsl:attribute>
	</xsl:attribute-set>
	<!--表格中的text不进行缩进-->
	<xsl:attribute-set name="table.properties" use-attribute-sets="formal.object.properties">
		<xsl:attribute name="text-indent">0em</xsl:attribute>
		<xsl:attribute name="start-indent">
			<xsl:choose>
				<xsl:when test="@tabstyle = 'smallfont-wide'">0pt</xsl:when>
				<xsl:otherwise>inherit</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:choose>
				<xsl:when test="@tabstyle = 'smallfont-wide'">8pt</xsl:when>
				<xsl:otherwise>inherit</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="emphasis[@role='red']">
		<fo:inline color="#FF0000">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>

</xsl:stylesheet>
