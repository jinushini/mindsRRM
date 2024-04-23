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
	<form method="post" id="searchFrm" action="../fextends/flowSeeting!add.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>新增流程配置</b>
			</div>

			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>流程定义名称</th>
						<td><input name="flowDefinedConfig.name" type="text" class="required" style="width: 80%"></td>
					</tr>
					<tr>
						<th width='15%'>流程名称</th>
						<td><input name="flowDefinedConfig.value" type="text" class="required"></td>
					</tr>
					<tr>
						<th width='15%'>备注</th>
						<td><input name="flowDefinedConfig.displayValue" type="text" class="required"></td>
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