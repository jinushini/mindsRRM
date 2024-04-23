<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>会议详情</legend>
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><s:property value="meeting.subject"/></td>
					</tr>
					<tr>
						<th width='15%'>会议地点</th>
						<td colspan="3"><s:property value="meeting.address"/></td>
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<td ><s:date name="meeting.beginDate" format="yyyy-MM-dd HH:mm"/></td>
						<th width='15%'>结束时间</th>
						<td ><s:date name="meeting.endDate" format="yyyy-MM-dd HH:mm"/></td>
					</tr>
					<tr>
						<th width='15%'>主持人</th>
						<td ><s:property value="meeting.host.name"/></td>
						<th width='15%'>召集人</th>
						<td ><s:property value="meeting.convener.name"/></td>
					</tr>
					<tr>
						<th width='15%'>参会人</th>
						<td colspan="3"><s:property value="meeting.participantName"/></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">返回</button></div></div></li>
			</ul>
		</div>
	</form>
</div>