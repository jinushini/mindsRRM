<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelButton").click(function(){
		navTab.loadUrl("../manage/weeklyMeetingAppr!inputSummary.action?taskId=<s:property value="taskId"/>&&processInstId=<s:property value="processInstId"/>")
	})	 	
	
	function f(obj){
		var $trObj = $(obj).parent().parent();//当前行 
		var status = $(obj).val();
		var signInFormId = $trObj.find("[type=hidden]").val();
		$.post("../manage/weeklyMeeting!modifySignInForm.action", {status:status,signInFormId:signInFormId}, navTabAjaxDone, "json");
		jn(obj).parent().parent().find("span").text("");
		jn(obj).parent().parent().find("div").text("");
		if(status == 1){
			jn(obj).parent().parent().find("span").append("<span style='color:green'>出席</span>"); 
		}else if(status == 2){
			jn(obj).parent().parent().find("span").append("<span style='color:red'>缺席</span>");

		}	
		jn(obj).parent().parent().find("div").append("<span style='color:red'>修改成功</span>");
	}  
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="../manage/weeklyMeeting!modifySignInForm.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
			<legend>会议签到状态完善</legend>
			<table class="list_table list" width="100%" layoutH="120">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">会议名称</th>
					<th width="">主持人</th>
					<th width="">召集人</th>
					<th>签到人</th>
					<th>签到状态</th>
					<th width="5%">操作</th>
					<th >备注</th>
				</tr>
			</thead>
			<tbody>
			 <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" hidden="hidden"><input type="hidden" value="<s:property value="id"/>"/></td>
					<td align="center"><s:property value="weeklyMeeting.subject"/></td>
					<td align="center"><s:property value="weeklyMeeting.host.name"/></td>
					<td align="center"><s:property value="weeklyMeeting.convener.name"/></td>
					<td align="center"><s:property value="singalUser.name"/></td>
					<td align="center" class="status" <s:if test="status==1">style="color:green"</s:if><s:elseif test="status==2">style="color:red"</s:elseif>>
						<span><s:property value="status==1?'出席':(status==2?'缺席':'忽略')"/></span>
					</td>
					<td align="center">
							<select name="status" id="select" onchange="f(this)">
								<option value="<s:property value="status"/>"><s:property value="status==1?'出席':(status==2?'缺席':'忽略')"/></option>
								<option value="1">出席</option>
								<option value="2">缺席</option>
							</select>
							
					</td>
					<td align="center"><div style="color:red;"></div></td>
				</tr>
			  </s:iterator>
			  </table>
		</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelButton" type="button">确认</button></div></div></li>
			</ul>
		</div>
	</form>
</div>