<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

	<xsl:import href="docbook/fo/profile-docbook.xsl"/>
	<xsl:import href="fo_base.xsl"/>

	<!-- 字体集 -->
	<xsl:param name="symbol.font.family" select="'FangSong_GB2312,SimHei,KaiTi_GB2312,SimSun'"/>

	<!-- 各部分字体设置 Courier -->
	<xsl:param name="title.font.family" select="'SimHei,SimSun'"/>
	<xsl:param name="body.font.family" select="'KaiTi_GB2312,SimSun'"/>
	<xsl:param name="body.font.master">10</xsl:param>
	<xsl:param name="sans.font.family" select="'FangSong_GB2312,SimSun'"/>
	<xsl:param name="dingbat.font.family" select="'FangSong_GB2312,SimSun'"/>
	<xsl:param name="monospace.font.family" select="'FangSong_GB2312,SimSun'"/>
	<xsl:param name="note.font.family" select="'FangSong_GB2312,SimSun'"/>

	<!-- 章节显示错误，空格被#代替 -->
	<xsl:param name="local.l10n.xml" select="document('')"/>
	<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
		<l:l10n language="zh_cn">
			<l:context name="title-numbered">
				<l:template name="part" text="第  %n 部分 %t"/>
				<l:template name="chapter" text="第 %n 章 %t"/>
				<l:template name="section" text="%n:%t"/>
				<l:template name="sect1" text="%n:%t"/>
				<l:template name="sect2" text="%n:%t"/>
				<l:template name="sect3" text="%n:%t"/>
				<l:template name="sect4" text="%n:%t"/>
				<l:template name="sect5" text="%n:%t"/>
				<l:template name="table" text="表格 %n %t"/>
			</l:context>
		</l:l10n>
	</l:i18n>

	<!-- 页面边距格式 -->
	<!--正文相对与标题的缩进-->
	<xsl:param name="body.start.indent">0.1in</xsl:param>
	<xsl:param name="title.margin.left">0pc</xsl:param>
	<xsl:param name="admon.textlabel" select="1"/>
	<xsl:template match="note|caution|warning|tip|important">
		<xsl:call-template name="floater">
			<xsl:with-param name="position">left</xsl:with-param>
			<xsl:with-param name="width">0.5in</xsl:with-param>
			<xsl:with-param name="start.indent">0in</xsl:with-param>
			<!--			<xsl:with-param name="start.indent">0.5in</xsl:with-param>-->
			<xsl:with-param name="content">
				<fo:block margin-top="1em" padding="3pt" text-align="center" border="1pt solid grey">
					<fo:external-graphic width="auto" height="auto">
						<xsl:attribute name="src">
							<xsl:call-template name="admon.graphic"/>
						</xsl:attribute>
					</fo:external-graphic>
				</fo:block>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:apply-imports/>
	</xsl:template>
	<!--
<!-\- 列表格式 -\->
<xsl:template name="next.itemsymbol">
	<xsl:param name="itemsymbol" select="'default'"/>
	<xsl:choose>
		<!-\- Change this list if you want to change the order of symbols -\->
		<xsl:when test="$itemsymbol = 'disc'">circle</xsl:when>
		<xsl:when test="$itemsymbol = 'circle'">square</xsl:when>
		<xsl:otherwise>disc</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="itemizedlist.label.markup">
	<xsl:param name="itemsymbol" select="'disc'"/>
	<xsl:choose>
		<xsl:when test="$itemsymbol='none'"/>
		<!-\- <xsl:when test="$itemsymbol='disc'">&#x2022;</xsl:when> -\->
		<xsl:when test="$itemsymbol='disc'">&#9634;</xsl:when>
		<xsl:when test="$itemsymbol='bullet'">&#x2022;</xsl:when>
		<xsl:when test="$itemsymbol='endash'">&#x2013;</xsl:when>
		<xsl:when test="$itemsymbol='emdash'">&#x2014;</xsl:when>
		<!-\- Some of these may work in your XSL-FO processor and fonts -\->

		<xsl:when test="$itemsymbol='square'">&#x25A0;</xsl:when>
		<xsl:when test="$itemsymbol='box'">&#x25A0;</xsl:when>
		<xsl:when test="$itemsymbol='smallblacksquare'">&#x25AA;</xsl:when>
		<xsl:when test="$itemsymbol='circle'">&#x25CB;</xsl:when>
		<xsl:when test="$itemsymbol='opencircle'">&#x25CB;</xsl:when>
		<xsl:when test="$itemsymbol='whitesquare'">&#x25A1;</xsl:when>
		<xsl:when test="$itemsymbol='smallwhitesquare'">&#x25AB;</xsl:when>
		<xsl:when test="$itemsymbol='round'">&#x25CF;</xsl:when>
		<xsl:when test="$itemsymbol='blackcircle'">&#x25CF;</xsl:when>
		<xsl:when test="$itemsymbol='whitebullet'">&#x25E6;</xsl:when>
		<xsl:when test="$itemsymbol='triangle'">&#x2023;</xsl:when>
		<xsl:when test="$itemsymbol='point'">&#x203A;</xsl:when>
		<xsl:when test="$itemsymbol='hand'">
			<fo:inline font-family="Wingdings 2">A</fo:inline>
		</xsl:when>

		<xsl:otherwise>&#x2022;</xsl:otherwise>
	</xsl:choose>
</xsl:template>-->


	<xsl:template name="colspec" match="colspec">
		<fo:table-column column-number="1"
			column-width="1%"/>
	</xsl:template>
	
	<!-- FO处理相同ID引用多次时候报错的问题 -->
	<xsl:template name="object.id">
		<xsl:param name="object" select="."/>
		
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="xid" select="@xml:id"/>
		
		<xsl:variable name="preceding.id"
			select="count(preceding::*[@id = $id])"/>
		
		<xsl:variable name="preceding.xid"
			select="count(preceding::*[@xml:id = $xid])"/>
		
		<xsl:choose>
			<xsl:when test="$object/@id and $preceding.id != 0">
				<xsl:value-of select="concat($object/@id, $preceding.id)"/>
			</xsl:when>
			<xsl:when test="$object/@id">
				<xsl:value-of select="$object/@id"/>
			</xsl:when>
			<xsl:when test="$object/@xml:id and $preceding.xid != 0">
				<xsl:value-of select="concat($object/@xml:id, $preceding.xid)"/>
			</xsl:when>
			<xsl:when test="$object/@xml:id">
				<xsl:value-of select="$object/@xml:id"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="generate-id($object)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
