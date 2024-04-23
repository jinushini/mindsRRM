<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../study/leaveApply!addSheet.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">请假天数：</td>
				<td><input type="text" name="leaveSheet.days" class="required" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
			<tr>
				<td align="center">请假原因：</td>				
				<td>
					<select name="leaveSheet.reason" class="required">
						<option value="">----请假原因----</option>
						<s:iterator value="list" status="st">
							<option value="<s:property value="key"/>"><s:property value="value"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">审批领导：</td>
				<td colspan="3">
					<input name="leaveSheet.auditorId" type="hidden" class="required">
					<input name="leaveSheet.auditorName" type="text" class="required" onclick="jn('#auditor').click()">
					<a title="人员选择" class="btnLook" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false" id="auditor"><span>人员选择</span>
					</a>
				</td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../study/leaveApply!showAllSheet.action?a=a&b=b"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>