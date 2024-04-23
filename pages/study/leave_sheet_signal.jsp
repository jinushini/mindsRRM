<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" action="../study/leaveSheetAppr!signal.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td width="20%" align="center">请假天数：</td>
				<td width="30%"><s:property value="leaveSheet.days"/> </td>
				<td width="20%" align="center">请假原因：</td>
				<td width="30%"><s:property value="leaveSheet.reason"/></td>
			</tr>
			<tr>
				<td align="center">申请人：</td>
				<td><s:property value="leaveSheet.user.name"/></td>
				<td align="center">申请时间：</td>
				<td><s:date name="leaveSheet.createDate" format="yyyy-MM-dd"/></td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td  width="30%" align="center">审批结论：</td>
				<td width="70%">
					<span class="required">
						<input type="radio" name="approve.resultCn" value="同意">同意&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不同意">不同意</td>
					</span>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="approve.comments" style="width: 90%;" rows="5" cols=""></textarea></td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">提交</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>