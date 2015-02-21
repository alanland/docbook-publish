<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://icl.com/saxon"
extension-element-prefixes="saxon" version="1.0">

<xsl:import href="docbook/html/docbook.xsl"/>
<xsl:import href="highlighting/html-highlighting.xsl"/>
<xsl:import href="common.xsl"/>

<!-- 显示导航、标注图标 -->
<xsl:param name="callout.graphics" select="1"/>
<xsl:param name="admon.graphics" select="1"/>

<!-- 备注、提示、小心、重要、警告，不指定特殊的样式 -->
<xsl:param name="admon.style">

</xsl:param>

<!-- 图片使用其本身的尺寸 -->
<xsl:param name="ignore.image.scaling" select="1"/>

<!-- 输出文件格式 -->
<xsl:output method="html" encoding="UTF-8" indent="yes" saxon:character-representation="native"/>

<!-- 样式设置 -->
<xsl:param name="table.borders.with.css" select="0"/>
<xsl:param name="html.stylesheet">resources/style.css</xsl:param>
<xsl:param name="html.stylesheet.type">text/css</xsl:param>

<!-- toc 生成方式 -->
<!-- <xsl:param name="generate.toc">book toc,title</xsl:param> -->

<xsl:param name="make.graphic.viewport" select="1"/>



</xsl:stylesheet>
