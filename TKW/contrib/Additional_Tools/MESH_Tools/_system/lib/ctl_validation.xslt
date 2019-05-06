<xsl:stylesheet version="2.0" xmlns:exp="http://expath.org/ns/file" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:hl7="urn:hl7-org:v3" xmlns:itk="urn:nhs-itk:ns:201005">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<!-- Root Path to TKW -->

		<xsl:variable name="p_tkw" select="'TKW_ROOT/contrib/Additional_Tools/MESH_Tools'"/>
		<xsl:variable name="rp_workflow" select="'/_system/lib/itk_service.xml'"/>
		<xsl:variable name="workflow_ref" select="document(concat('file:///',$p_tkw,$rp_workflow))"/>
		<xsl:variable name="curr_file_ref" select="document(concat('file:///', $p_tkw, '/_system/tmp/fn.xml'))"/>
		<xsl:variable name="curr_file" select="$curr_file_ref/fn"/>
		<xsl:variable name="ref_ctlfile" select="concat($p_tkw, '/_system/tmp/', $curr_file ,'.ctl')"/>
		<xsl:variable name="abs_ref_ctlfile" select="concat('file:///', $p_tkw, '/_system/tmp/',$curr_file ,'.ctl')"/>		
		<xsl:variable name="ctlfile_exists" select="unparsed-text-available($abs_ref_ctlfile)"/> 
 
 
 
		<table>
			<xsl:choose>
				<xsl:when test="$ctlfile_exists = true()">
					<xsl:choose>
						<xsl:when test="document($abs_ref_ctlfile)">
							<tr>
								<td style="color:#008000">
									<xsl:text>Matching CTL file found: </xsl:text>
									<xsl:value-of select="$curr_file_ref"/>
									<xsl:text>.ctl</xsl:text>
								</td>
							</tr>
							<xsl:variable name="ctlfile" select="document($abs_ref_ctlfile)"/>
							<xsl:variable name="ctlfile_DTSControl_exists" select="boolean($ctlfile//DTSControl)"/>
							<xsl:variable name="ctlfile_Version_exists" select="boolean($ctlfile//DTSControl/Version)"/>
							<xsl:variable name="ctlfile_Version" select="$ctlfile//DTSControl/Version"/>
							<xsl:variable name="ctlfile_Version_fixedvalue" select="'1.0'"/>
							<xsl:variable name="ctlfile_AddressType_exists" select="boolean($ctlfile//DTSControl/AddressType)"/>
							<xsl:variable name="ctlfile_AddressType" select="$ctlfile//DTSControl/AddressType"/>
							<xsl:variable name="ctlfile_AddressType_fixedvalue" select="'DTS'"/>
							<xsl:variable name="ctlfile_MessageType_exists" select="boolean($ctlfile//DTSControl/MessageType)"/>
							<xsl:variable name="ctlfile_MessageType" select="$ctlfile//DTSControl/MessageType"/>
							<xsl:variable name="ctlfile_MessageType_fixedvalue" select="'Data'"/>
							<xsl:variable name="ctlfile_From_DTS_exists" select="boolean($ctlfile//DTSControl/From_DTS)"/>
							<xsl:variable name="ctlfile_From_DTS" select="$ctlfile//DTSControl/From_DTS"/>
							<xsl:variable name="ctlfile_To_DTS_exists" select="boolean($ctlfile//DTSControl/To_DTS)"/>
							<xsl:variable name="ctlfile_To_DTS" select="$ctlfile//DTSControl/To_DTS"/>
							<xsl:variable name="ctlfile_Subject_exists" select="boolean($ctlfile//DTSControl/Subject)"/>
							<xsl:variable name="ctlfile_Subject" select="$ctlfile//DTSControl/Subject"/>
							<xsl:variable name="ctlfile_LocalID_exists" select="boolean($ctlfile//DTSControl/LocalId)"/>
							<xsl:variable name="ctlfile_LocalID" select="$ctlfile//DTSControl/LocalId"/>
							<xsl:variable name="ctlfile_DTSId_exists" select="boolean($ctlfile//DTSControl/DTSId)"/>
							<xsl:variable name="ctlfile_DTSId" select="$ctlfile//DTSControl/DTSId"/>
							<xsl:variable name="ctlfile_WorkflowId_exists" select="boolean($ctlfile//DTSControl/WorkflowId)"/>
							<xsl:variable name="ctlfile_WorkflowId" select="$ctlfile//DTSControl/WorkflowId"/>
							<!-- Get the service and interactions from the dat file being validated -->
							<xsl:variable name="datfile_service" select="//itk:DistributionEnvelope/itk:header/@service"/>
							<xsl:variable name="datfile_interaction" select="//itk:DistributionEnvelope/itk:header/itk:handlingSpecification/itk:spec[@key='urn:nhs-itk:ns:201005:interaction']/@value"/>
							<xsl:variable name="datfile_trackingid" select="//itk:DistributionEnvelope/itk:header/@trackingid"/>
							<xsl:variable name="ref_WorkflowId" select="$workflow_ref//itk_services/itk_service[@webservice=$datfile_service]/Domain[interaction/@name=$datfile_interaction]/@mesh_workflow_id"/>
							<!--ACK Version Check -->
							<xsl:choose>
								<xsl:when test="$datfile_service='urn:nhs-itk:services:201005:SendInfrastructureAck-v1-0' and $datfile_interaction='urn:nhs-itk:interaction:ITKInfrastructureAcknowledgement-v1-0'">
									<tr>
										<td style="color:#008000">
											<xsl:text>Acknowledgement Type: ITK 2.1 Infrastructure Ack</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$datfile_service='urn:nhs-itk:services:201005:SendBusinessAck-v1-0' and $datfile_interaction='urn:nhs-itk:interaction:ITKBusinessAcknowledgement-v1-0'">
									<tr>
										<td style="color:#008000">
											<xsl:text>Acknowledgement Type: ITK 2.1 Business Ack</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$datfile_service='urn:nhs-itk:services:201005:sendDistEnvelope' and $datfile_interaction='urn:nhs-itk:interaction:ITKInfrastructureAcknowledgement-v1-0'">
									<tr>
										<td style="color:#008000">
											<xsl:text>Acknowledgement Type: ITK 2.2 Infrastructure Ack</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$datfile_service='urn:nhs-itk:services:201005:sendDistEnvelope' and $datfile_interaction='urn:nhs-itk:interaction:ITKBusinessAcknowledgement-v1-0'">
									<tr>
										<td style="color:#008000">
											<xsl:text>Acknowledgement Type: 2.2 Business Ack</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td style="color:#008000">
									<xsl:text>DAT file Service: </xsl:text>
									<xsl:value-of select="$datfile_service"/>
								</td>
							</tr>
							<tr>
								<td style="color:#008000">
									<xsl:text>DAT file Interaction: </xsl:text>
									<xsl:value-of select="$datfile_interaction"/>
								</td>
							</tr>
							<!--//DTSControl-->
							<xsl:choose>
								<xsl:when test="$ctlfile_DTSControl_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file Root element //DTSControl not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file root element //DTSControl found</xsl:text>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/Version-->
							<xsl:choose>
								<xsl:when test="$ctlfile_Version_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/Version not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_Version != $ctlfile_Version_fixedvalue">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file Version: </xsl:text>
											<xsl:value-of select="$ctlfile_Version"/>
											<xsl:text> does NOT match fixed value: </xsl:text>
											<xsl:value-of select="$ctlfile_Version_fixedvalue"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file Version validated: </xsl:text>
											<xsl:value-of select="$ctlfile_Version"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/AddressType-->
							<xsl:choose>
								<xsl:when test="$ctlfile_AddressType_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/AddressType not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_AddressType != $ctlfile_AddressType_fixedvalue">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file AddressType: </xsl:text>
											<xsl:value-of select="$ctlfile_AddressType"/>
											<xsl:text> does NOT match fixed value: </xsl:text>
											<xsl:value-of select="$ctlfile_AddressType_fixedvalue"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file AddressType validated: </xsl:text>
											<xsl:value-of select="$ctlfile_AddressType"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/MessageType-->
							<xsl:choose>
								<xsl:when test="$ctlfile_MessageType_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/MessageType not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_MessageType != $ctlfile_MessageType_fixedvalue">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file MessageType: </xsl:text>
											<xsl:value-of select="$ctlfile_MessageType"/>
											<xsl:text> does NOT match fixed value: </xsl:text>
											<xsl:value-of select="$ctlfile_MessageType_fixedvalue"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file MessageType validated: </xsl:text>
											<xsl:value-of select="$ctlfile_MessageType"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/From_DTS-->
							<xsl:choose>
								<xsl:when test="$ctlfile_From_DTS_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/From_DTS not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_From_DTS = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/From_DTS is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file From_DTS validated: </xsl:text>
											<xsl:value-of select="$ctlfile_From_DTS"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/To_DTS-->
							<xsl:choose>
								<xsl:when test="$ctlfile_To_DTS_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/To_DTS not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_To_DTS = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/To_DTS is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file To_DTS validated: </xsl:text>
											<xsl:value-of select="$ctlfile_To_DTS"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/Subject-->
							<xsl:choose>
								<xsl:when test="$ctlfile_Subject_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/Subject not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_Subject = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/Subject is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file Subject validated: </xsl:text>
											<xsl:value-of select="$ctlfile_Subject"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/LocalId-->
							<xsl:choose>
								<xsl:when test="$ctlfile_LocalID_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/LocalId not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_LocalID = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/LocalId is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_LocalID != $datfile_trackingid">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file LocalID does NOT match DAT file trackingid</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="color:#900000">
											<xsl:text>CTL File LocalID: </xsl:text>
											<xsl:value-of select="$ctlfile_LocalID"/>
										</td>
									</tr>
									<tr>
										<td style="color:#900000">
											<xsl:text>DAT File trackingid: </xsl:text>
											<xsl:value-of select="$datfile_trackingid"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_LocalID = $datfile_trackingid">
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file LocalID matches DAT file trackingid</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Unable to retreive DAT file trackingid for validation</xsl:text>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/DTSId-->
							<xsl:choose>
								<xsl:when test="$ctlfile_DTSId_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/DTSId not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_DTSId = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/DTSId is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file DTSId validated: </xsl:text>
											<xsl:value-of select="$ctlfile_DTSId"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<!--//DTSControl/WorkflowId-->
							<xsl:choose>
								<xsl:when test="$ctlfile_WorkflowId_exists = false()">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Mandatory element //DTSControl/WorkflowId not found</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_WorkflowId = ''">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file //DTSControl/WorkflowId is present but NOT populated</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_WorkflowId != $ref_WorkflowId">
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: CTL file WorkflowID: '</xsl:text>
											<xsl:value-of select="$ctlfile_WorkflowId"/>
											<xsl:text>' does not match the expected WorkflowId: '</xsl:text>
											<xsl:value-of select="$ref_WorkflowId"/>
											<xsl:text>' for: </xsl:text>
										</td>
									</tr>
									<tr>
										<td style="color:#900000">
											<xsl:text>Service: </xsl:text>
											<xsl:value-of select="$datfile_service"/>
										</td>
									</tr>
									<tr>
										<td style="color:#900000">
											<xsl:text>Interaction: </xsl:text>
											<xsl:value-of select="$datfile_interaction"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$ctlfile_WorkflowId = $ref_WorkflowId">
									<tr>
										<td style="color:#008000">
											<xsl:text>CTL file WorkflowID: </xsl:text>
											<xsl:value-of select="$ctlfile_WorkflowId"/>
											<xsl:text> matches the expected WorkflowId: '</xsl:text>
											<xsl:value-of select="$ref_WorkflowId"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td style="color:#900000">
											<xsl:text>ERROR: Unable to retrieve reference file for validation of WorkFlowId</xsl:text>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td style="color:#900000">
									<xsl:text> ERROR: CTL exists but could not be processed</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="color:#900000">
									<xsl:text>Please check well-formedness of the CTL file</xsl:text>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td style="color:#900000">
							<xsl:text> ERROR: No CTL File found, DAT file validation only has been performed</xsl:text>
						</td>
					</tr>
					<tr>
						<td style="color:#900000">
							<xsl:text>For MESH validation please place a copy of the .ctl file into the TKW\CDA_MESH_Messages_For_Validation folder</xsl:text>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
</xsl:stylesheet>
