<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
							  xmlns:dc="http://purl.org/dc/elements/1.1/"
							  xmlns:syn-sub="http://xml.mfd-consult.dk/syn-sub/"
							  xmlns:foaf="http://xmlns.com/foaf/0.1/"
							  xmlns:dcterms="http://purl.org/dc/terms/">
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
	<rdf:RDF>		
<xsl:comment>
Generated by <xsl:value-of select="$version"/>.
SingleSub itself (not the output) is copyright (C) 2005 SolidMatrix Technologies, Inc.
SingleSub itself (not the output) is licensed under the Apache License, Version 2.0.
</xsl:comment>
		<rdf:Description rdf:about="http://singlesub.sf.net">
			<dc:title><xsl:value-of select="opml/head/title"/></dc:title>
			<dc:creator><xsl:value-of select="opml/head/ownerName"/> (<xsl:value-of select="opml/head/ownerEmail"/>)</dc:creator>
			<dc:rights>Copyright (C) 2005 Yakov Shafranovich</dc:rights>
			<dc:date><xsl:value-of select="opml/head/dateCreated"/></dc:date>
			<dc:description>This RDF list contains a list of subscribe URLs for different RSS aggregators. It is automatically
				generated from the corresponding OPML file. The format for each entry is
				described at http://xml.mfd-consult.dk/syn-sub/.
			</dc:description>
 		</rdf:Description>
		
	 	<xsl:apply-templates select="//outline[@type='subscribe']">
 			<xsl:sort select="@text"/>
 		</xsl:apply-templates>
 		 
	</rdf:RDF>
	</xsl:template>

	<xsl:template match="outline[@type='subscribe']">
		<syn-sub:Aggregator rdf:about="{@subscribeUrl}">
			<dc:title><xsl:value-of select='@text'/></dc:title>
			<dc:description>Click to subscribe to this feed via <xsl:value-of select='@text'/>.</dc:description>
			<dcterms:isPartOf rdf:resource="{@htmlUrl}"/>
			<xsl:if test="@iconUrl">
				<dcterms:hasPart rdf:resource="{@iconUrl}"/>
			</xsl:if>			

			<foaf:maker>
			<foaf:Person>
				<foaf:name><xsl:value-of select='/opml/head/ownerName'/></foaf:name>
				<foaf:mbox rdf:resource="mailto:{/opml/head/ownerEmail}"/>
				<foaf:homepage rdf:resource="http://www.shaftek.org/"/>
			</foaf:Person>
			</foaf:maker>
		
		</syn-sub:Aggregator>
	</xsl:template>

	<xsl:template match="text()">
	</xsl:template>


</xsl:stylesheet>