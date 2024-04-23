<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/flowSeeting!showList.action")
	})
//-->
</script>
<div class="pageContent">
	<form method="post" id="searchFrm" action="../fextends/flowSeeting!edit.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>修改流程配置</b>
			</div>
			<input name="flowDefinedConfig.id" type="hidden" value="<s:property value="flowDefinedConfig.id"/>">
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>流程定义名称</th>
						<td><input name="flowDefinedConfig.name" type="text" class="required" value="<s:property value="flowDefinedConfig.name"/>"></td>
					</tr>
					<tr>
						<th width='15%'>流程名称</th>
						<td><input name="flowDefinedConfig.value" type="text" class="required" value="<s:property value="flowDefinedConfig.value"/>"></td>
					</tr>
					<tr>
						<th width='15%'>备注</th>
						<td>
						<textarea  name="flowDefinedConfig.displayValue"  class="required" rows="4"  style="width: 90%;"><s:property value="flowDefinedConfig.displayValue"/></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" id="cancelBtn">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>