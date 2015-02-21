<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version='1.0'>

	<!-- 语言环境 -->
	<xsl:param name="l10n.gentext.language" select="'zh_CN'" />
	<!-- 图标文件路径 -->
	<xsl:param name="callout.graphics.path">resources/callouts/</xsl:param>
	<xsl:param name="admon.graphics.path">resources/admonitions/</xsl:param>

	<!-- section 编号包含模块的编号 -->
	<xsl:param name="section.label.includes.component.label" select="0" />
	<!-- 自动标号 -->
	<xsl:param name="part.autolabel" select="0" />
	<xsl:param name="chapter.autolabel" select="0" />
	<xsl:param name="section.autolabel" select="0" />
	<!-- 页面 toc 中，section 的深度为0，只显示part、chapter -->
    <xsl:param name="toc.section.depth" select="1"/>

	<!-- 脚注的格式 -->    
    <xsl:param name="footnote.number.format">1</xsl:param>
    <xsl:param name="table.footnote.number.format">1</xsl:param>
    
	<!-- 修改title的位置，图片的话位于图片之后 -->
	<xsl:param name="formal.title.placement">
		figure after
		example before
		equation before
		table before
		procedure before
	</xsl:param>

	<!-- 设置生成toc的格式 -->
	<xsl:param name="generate.toc">
		appendix 			toc,title
		article/appendix 	nop
		article 			toc,title
		book 				toc,title
		chapter 			toc,title
		part 				toc,title
		preface 			toc,title
		qandadiv 			toc
		qandaset 			toc
		reference 			toc,title
		sect1 				toc
		sect2 				toc
		sect3 				toc
		sect4 				toc
		sect5 				toc
		section 			toc
		set 				toc,title
	</xsl:param>


	<!-- 显示格式 -->
    <!-- 章节显示错误，空格被#代替 -->
    <xsl:param name="local.l10n.xml" select="document('')"/>
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="zh_cn">
            <l:context name="title-numbered">
                <l:template name="part" text="第 %n 部分 %t"/>
                <l:template name="chapter" text="第 %n 章 %t"/>
                <l:template name="section" text="%n %t"/>
            </l:context>
        </l:l10n>
    </l:i18n>

<!--设置处理图片的格式-->
	<xsl:template name="is.graphic.format">
		<xsl:param name="format"></xsl:param>
		<xsl:if test="$format = 'SVG'
			or $format = 'PNG'
			or $format = 'JPG'
			or $format = 'JPEG'
			or $format = 'linespecific'
			or $format = 'GIF'
			or $format = 'GIF87a'
			or $format = 'GIF89a'
			or $format = 'BMP'
			or $format = 'SWF'">1</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
