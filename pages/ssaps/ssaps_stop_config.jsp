<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action='../ssaps/ssapsController!stopSubProcess.action' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input name="subFlowId" type="hidden" value="<s:property value="subFlowId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<input name="flowClassId" type="hidden" value="<s:property value="flowClassId"/>">
	<input name="flowClassName" type="hidden" value="<s:property value="flowClassName"/>">
	<input name="wasteVo.operationType" type="hidden" value="stop">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="ssapsNodeData.flowName"/>--任务处理</legend>
		<table bssaps="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">作废原因：</td>
				<td>
				<textarea name="wasteVo.wasteCause" style="width: 90%;" rows="5" cols="" class="required"></textarea>
				</td>
			</tr>			
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>