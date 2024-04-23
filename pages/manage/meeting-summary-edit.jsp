<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//页面加载完成
	$(function(){
		resolveSummary();
	})
	
	function resolveSummary(){
		var summary = jd("#summarya").val();
		var summaryArr = summary.split("㊣");
		var summary1 = summaryArr[0];
		var summary2 = summaryArr[1];
		var summary3 = summaryArr[2];
		jd("#summary1").val(summary1);
		jd("#summary2").val(summary2);
		jd("#summary3").val(summary3); 
	}
	
	$("[type=submit]").click(function(){
		var summary1 = jd("#summary1").val();
		var summary2 = jd("#summary2").val();
		var summary3 = jd("#summary3").val();
		var summary = summary1 + "㊣" + summary2 + "㊣" +summary3;
		jd("#summary").val(summary);
	});
	
</script>

<div class="pageContent">
	<form method="post" enctype="multipart/form-data" id="searchFrm" action="../manage/weeklyMeeting!editMeeting.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<input type="hidden" name="meeting.id" value="<s:property value="meeting.id"/>">
		<input type="hidden" name="meeting.convener.id" value="<s:property value="meeting.convener.id"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>修改会议纪要</legend>
			<table class="list_table edit_table" width="98%" id="fileitemList">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3">
							<input type="hidden" name="subject" value="<s:property value='meeting.subject'/>"/>
							<s:property value='meeting.subject'/>
						</td>
					</tr>
					<tr>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td>
							<s:property value="meeting.security"/>
						</td>
						<th width='15%'>会议地点</th>
						<td><s:property value="meeting.address"/></td>
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<td ><s:date name="meeting.beginDate" format="yyyy-MM-dd HH:mm"/></td>
						<th width='15%'>结束时间</th>
						<td ><s:date name="meeting.endDate" format="yyyy-MM-dd HH:mm"/></td>
					</tr>
					<tr>
						<th width='15%'>主&nbsp;&nbsp;持&nbsp;&nbsp;人</th>
						<td ><s:property value="meeting.host.name"/></td>
						<th width='15%'>召&nbsp;&nbsp;集&nbsp;&nbsp;人</th>
						<td ><s:property value="meeting.convener.name"/></td>
					</tr>
					<tr>
						<th width='15%'>参&nbsp;&nbsp;会&nbsp;&nbsp;人</th>
						<td colspan="3"><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td>
						<%-- <td colspan="3"><input name="meeting.participantId" type="hidden" class="required" value="<s:property value='meeting.participantId'/>"/>
							<input name="meeting.participantName" type="text" class="required" readonly="readonly" value="<s:property value='meeting.participantName'/>" onclick="jd(this).next().click()" style="border:0;font-size:14px;"/>
							<a title="人员选择"height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td> --%>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档</td>
						<td colspan="3">
							<s:iterator value="fileList" status="st">
								<div style="float:left;margin:0 5px;clear:both;">
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）点击下载</a>
								</div>
								<br />
							</s:iterator>
						</td>
					</tr>		
					<tr style="display: none;">
						<td colspan="4" style="display: none;">
							<textarea name="" id="summarya" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summaryStr" escape="false"/> </textarea>
						</td>
					</tr>			
					<s:if test="meeting.category == '班组周例会'">
						<s:include value="meeting_summary_div1.jsp"></s:include>
					</s:if>
					<s:else>
						<s:include value="meeting_summary_div.jsp"></s:include>
					</s:else>
					<!-- <tr>
						<td style="padding-left: 40px;" colspan="2">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a></td>
					</tr>
					<tr class="file">
						<td style="padding-left: 40px;" colspan="2"><input type="file" name="filesource"/></td>
						<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr> -->
				</tbody>
			</table>
		</fieldset>
		<%-- <fieldset>
			<legend>生成会议结论</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td  width="20%" align="center">研讨结论：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.result" value="通过" checked="checked" class="pass">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.result" value="不通过" class="nopass">不通过
						</span>
					</td>
				</tr>
				<tr class="restart" style="display: none;">
					<td  width="20%" align="center">是否重开：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.reStart" value="1" >需要重新开会&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.reStart" value="0" checked="checked">不需要重开
						</span>
					</td>
				</tr>
				<tr class="needSign">
					<td  width="20%" align="center">是否需要主持人审核：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.needSign" value="1" >需要&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.needSign" value="0" checked="checked">不需要
						</span>
					</td>
				</tr>
			</table>
			<legend>请填写生成会议文件所需要的要素</legend>
			<table border="0" width="98%" class="edit_table" align="center" class="meetingFile">
				<tr>
					<td width="20%" align="center">会议分类：</td>
					<td width="30%">
						<span class="required">
							<select name="meeting.type" class="meetingType">
								<option>---请选择---</option>
								<s:iterator value="typeList" var="type">
									<option value="<s:property value='key'/>-<s:property value='value'/>" <s:if test="value=='QT'">selected="selected"</s:if>><s:property value="key"/></option>
									<option value="<s:property value='key'/>-<s:property value='value'/>"><s:property value="key"/></option>
								</s:iterator>
							</select>
						</span>
					</td>
				</tr>
				<tr class="fileCode">
					<td  width="20%" align="center">文件编号：</td>
					<td width="30%">
							<input type="text" name="meeting.fileCode" value="<s:property value='fileCode'/>" readonly="readonly" class="fileCode required"/>
					</td>
				</tr>
				<tr class="meetingSponsor" style="display: none;">
					<td  width="20%" align="center">主办方：</td>
					<td width="30%">
						<select name="meeting.sponsor" id="sponsor">
							<option selected="selected" value="">---请选择主办方---</option>
							<s:iterator value="sponsorList" var="sponsor">
								<option value="<s:property value='value'/>"><s:property value="key"/></option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr class="meetingSendTo" style="display: none;">
					<td  width="20%" align="center">主送：</td>
					<td width="30%">
						<input type="text" name="meeting.sendTo" id="sendTo" placeholder="微波所各部门、各班组"/>
					</td>
				</tr>
				<tr class="meetingCarbonCopy" style="display: none;">
					<td  width="20%" align="center">抄送：</td>
					<td width="30%">
						<input type="text" name="meeting.carbonCopy" id="carbonCopy" placeholder="所领导、总工、副总工、产品责任人"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
		<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
			<table class="list_table edit_table" width="98%">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="20%">待办事项描述</th>
						<th width="5%">责任人</th>
						<th width="5%">完成形式</th>
						<th width="5%">要求完成时间</th>
						<th width="5%">操作</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<s:if test="list == null || list.size() == 0" >
						<tr>
							<td align="center"><s:property value="#st.index+1"/><input type="hidden" name="meetingDispatchs[#index].id" value="<s:property value='id'/>"/></td>
							<td><input name="meetingDispatchs[#index].itemContent" value="" style="width: 98%;"></td>
							<td>
								<input name="meetingDispatchs[#index].responsibleId" type="hidden">
								<input name="meetingDispatchs[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly">
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td><input name="meetingDispatchs[#index].completeForm" value="" style="width: 98%;"></td>
							<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
							<td><a name="delBtn" href="###" style="color : red;">删除</a></td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="list" status="st">
							<tr id="<s:property value="id"/>">
								<td align="center"><s:property value="#st.index+1"/><input type="hidden" name="meetingDispatchs[#index].id" value="<s:property value='id'/>"/></td>
								<td style="font-weight: bold;"><input type="text" name="meetingDispatchs[#index].itemContent" value="<s:property value='taskDefinitionStr'/>"/></td>
								<td >
									<input name="meetingDispatchs[#index].responsibleId" type="hidden" class="required" value="<s:property value='receiveUserId'/>"/>
									<input name="meetingDispatchs[#index].responsibleName" value="<s:property value='receiveUserName'/>" type="text" class="receiveUserName required" readonly="readonly" />
									<a title="人员选择" height="410" width="715"
										href="../system/user!findMUser.action" target="dialog"
										rel="selectUser" resizable="false" maxable="false">
									</a>
								</td>
								<td align="center"><input name="meetingDispatchs[#index].completeForm" value="<s:property value='completeForm'/>" style="width: 98%;"></td>
								<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" value="<s:date name='scheduleDate.planEndDate' format='yyyy-MM-dd' />" name="planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
								<td align="center" >
									<a href="###" class="modify"><span style="color:green;">确认修改</span></a>&nbsp;|&nbsp;
									<a class="delBtn" href="###" style="color : red;">删除</a>
								</td>
							</tr> 
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>通过MINDS系统抄送</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<th width='15%' align="center">抄送人</th>
					<td colspan="3">
						<input name="meeting.carbonCopyId" type="hidden">
						<input name="meeting.carbonCopyName" type="text" readonly="readonly" onclick="$(this).next().click()">
						<a title="人员选择" class="btnLook" height="410" width="715"
							href="../system/user!findMUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>
					</td>
				</tr>
			</table>
		</fieldset>	 --%>
		</div>
		<div class="formBar">
			<ul>
				<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="inputBtn" type="button" target="navTab" rel="">完善签到表</button></div></div></li> -->
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>