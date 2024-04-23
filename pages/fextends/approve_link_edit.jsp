<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/approveLink!showList.action?parentConfigId=<s:property value="parentConfigId"/>");
	})
//-->
</script>
<div class="pageContent">
	<form method="post" id="searchFrm" action="../fextends/approveLink!edit.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>修改流程配置</b>
			</div>
			<input name="flowDefinedConfig.flowDefinedConfig.id" type="hidden" value="<s:property value="flowDefinedConfig.flowDefinedConfig.id"/>">
			<input name="flowDefinedConfig.id" type="hidden" value="<s:property value="flowDefinedConfig.id"/>">
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>流程环节名称</th>
						<td><input name="flowDefinedConfig.name" type="text" class="required" value="<s:property value="flowDefinedConfig.name"/>"></td>
					</tr>
					<tr>
						<th width='15%'>审批人员姓名</th>
						<td>
							<input name="flowDefinedConfig.value" type="hidden"  value="<s:property value="flowDefinedConfig.value"/>">
							<input name="flowDefinedConfig.displayValue" type="text" value="<s:property value="flowDefinedConfig.displayValue"/>" style="width: 50%;">
							<a title="LIST1人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a></td>
					</tr>
					<tr>
							<th width='15%'>URL</th>
							<td>
							<input name="flowDefinedConfig.url" type="text" value="<s:property value="flowDefinedConfig.url"/>" style="width: 50%;">
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