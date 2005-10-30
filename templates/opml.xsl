<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method = "xml" encoding="utf-8" indent="yes"/>	

	<xsl:param name="version"/>

<!--
#
#   SingleSub v0.1.1
#   Written by Yakov Shafranovich
#
#   A Project of SolidMatrix Research
#   Website: http://singlesub.sourceforge.net
#   Email:  research@solidmatrix.com
#   
#   Copyright (C) 2005 SolidMatrix Technologies, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
-->

		<xsl:template match="/">
		<opml version="1.0">
<xsl:comment>
Generated by <xsl:value-of select="$version"/>.
SingleSub itself (not the output) is copyright (C) 2005 SolidMatrix Technologies, Inc.
SingleSub itself (not the output) is licensed under the Apache License, Version 2.0.
</xsl:comment>
 			<xsl:apply-templates select="opml/head"/>
 			<xsl:apply-templates select="opml/body"/>
 		</opml>
	</xsl:template>

	<xsl:template match="@*|node()">
  		<xsl:copy>
    		<xsl:apply-templates select="@*|node()"/>
  		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>