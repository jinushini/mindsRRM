<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
jn("#cancel").click(function(){
	var taskId = <s:property value='taskId'/>;
	var processInstId = <s:property value='processInstId'/>;
	alertMsg.confirm("确认取消会议？", {
		 okCall: function(){
		  $.post("../meeting/reviewMeetingAppr!cancleMeeting.action", {taskId:taskId,processInstId:processInstId}, navTabAjaxDone, "json");
		 },
		 cancelCall : function() {}
		});	
});			
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="../meeting/reviewMeetingAppr!signIn.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<input type="hidden" id="result" name="approve.result" value="">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>任务处理</legend>
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><s:property value="meeting.subject"/></td>
					</tr>
					<tr>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td style="color:red;"><s:property value="meeting.security"/></td>
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
						<th width='15%'>产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保</th>
						<td><s:property value="meeting.productManager.name"/></td>
					</tr>
					<tr>
						<th width='15%'>参&nbsp;&nbsp;会&nbsp;&nbsp;人</th>
						<td colspan="3"><s:property value="meeting.participantName"/></td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档</td>
						<td colspan="3">
							<s:iterator value="fileList" status="st">
								<div style="float:left;margin:0 5px;clear:both;">
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>
								<br />
							</s:iterator>
						</td>
					</tr>					
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>会议签到（个人签到）</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td  width="30%" align="center">签到：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="signInForm.status" value="1" checked="checked">出席&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="signInForm.status" value="2">缺席
						</span>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend style="color:green;">已签到人员</legend>
			<table class="list_table list" width="100%" >
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">签到人工号</th>
					<th>签到人姓名</th>
					<th>签到状态</th>
				</tr>
			</thead>
			<tbody>
			 <s:iterator value="signInlist" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center"><s:property value="singalUser.staffId"/></td>
					<td align="center"><s:property value="singalUser.name"/></td>
					<td align="center" <s:if test="status==1">style="color:green"</s:if><s:elseif test="status==2">style="color:red"</s:elseif>>
						<s:property value="status==0?'未签':(status==1?'出席':'缺席')"/>
						
					</td>
				</tr>
			  </s:iterator>
			  </table>
			<legend style="color:red;">未签到人员</legend>
			<table class="list_table list" width="100%" >
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">签到人工号</th>
					<th>签到人姓名</th>
					<th>签到状态</th>
				</tr>
			</thead>
			<tbody>
			 <s:iterator value="noSignInlist" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center"><s:property value="singalUser.staffId"/></td>					
					<td align="center"><s:property value="singalUser.name"/></td>
					<td align="center" >
					  <span class="required">
					  	<input type="hidden" name="listVo[<s:property value="#st.index"/>].id" value="<s:property value="id"/>">
					  	<input type="hidden" name="listVo[<s:property value="#st.index"/>].taskId" value="<s:property value="taskId"/>">
						<input type="radio" name="listVo[<s:property value="#st.index"/>].status" value="1" checked="checked"/>出席&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="listVo[<s:property value="#st.index"/>].status" value="2"/>缺席
					  </span>
					</td>
				</tr>
			  </s:iterator>
			  </table>
		</fieldset>
		</div>
		<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancel" type="button" style="color:red">取消会议</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">确认</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div> 
	</form>
</div>