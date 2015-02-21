<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import href="docbook/html/chunk.xsl"/>
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
	<xsl:param name="base.dir">out/chunk/</xsl:param>
	<xsl:param name="chunker.output.encoding">utf-8</xsl:param>
	<xsl:param name="chunker.output.indent">yes</xsl:param>
	<xsl:param name="saxon.character.representation">native</xsl:param>

	<!-- 样式设置 -->
	<xsl:param name="table.borders.with.css" select="0"/>
	<xsl:param name="html.stylesheet">resources/style.css</xsl:param>
	<xsl:param name="html.stylesheet.type">text/css</xsl:param>
	<xsl:param name="make.graphic.viewport" select="0"/>

	<!-- 每个 chapter 一个文件 -->
	<xsl:param name="chunk.section.depth" select="1"/>
	<xsl:param name="chunk.first.sections" select="1"/>


	<!-- convert url-only references to a format that is wrappable -->

	<xsl:template match="ulink" name="ulink">
		<xsl:choose>
			<xsl:when test="count(child::node())=0">
				<a>
					<xsl:if test="@id">
						<xsl:attribute name="name">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="href">
						<xsl:value-of select="@url"/>
					</xsl:attribute>
					<xsl:if test="$ulink.target != ''">
						<xsl:attribute name="target">
							<xsl:value-of select="$ulink.target"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="count(child::node())=0">
						<xsl:call-template name="insertInvisibleBreaks">
							<xsl:with-param name="url" select="@url"/>
							<xsl:with-param name="breakat" select="translate(@url, '/-_:', '____')"
							/>
						</xsl:call-template>
					</xsl:if>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-imports/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="insertInvisibleBreaks">
		<xsl:param name="url"/>
		<xsl:param name="breakat"/>
		<!-- <xsl:message><xsl:value-of select="concat('param:', $url, $breakat)"/></xsl:message> -->
		<xsl:choose>
			<xsl:when test="contains($breakat, '_')">
				<xsl:value-of
					select="substring($url, 1, string-length(substring-before($breakat, '_'))+1)"/>
				<wbr/>
				<xsl:call-template name="insertInvisibleBreaks">
					<xsl:with-param name="url"
						select="substring($url, string-length(substring-before($breakat, '_'))+2)"/>
					<xsl:with-param name="breakat"
						select="substring($breakat, string-length(substring-before($breakat, '_'))+2)"
					/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$url"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="footnotes.attributes">
	<!-- customizable for footnotes attributes -->
	</xsl:template>

</xsl:stylesheet>
