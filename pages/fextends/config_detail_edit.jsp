<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/systemConfigDetail!showList.action?parentConfigId=<s:property value="parentConfigId"/>")
	})
//-->
</script>
<div class="pageContent">
	<form method="post" id="searchFrm" action="../fextends/systemConfigDetail!edit.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>修改配置明细</b>
			</div>
			<!-- 下面两句的ID值关系没搞清楚 -->
			<input name="systemConfig.systemConfig.id" type="hidden" value="<s:property value="parentConfigId"/>">
			<input name="systemConfig.id" type="hidden" value="<s:property value="systemConfig.id"/>">
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>key</th>
						<td><input name="systemConfig.key" type="text" class="required" value="<s:property value="systemConfig.key"/>"></td>
					</tr>
					<tr>
						<th width='15%'>value</th>
						<td>
							<input name="systemConfig.hiddenValue" type="hidden" class="required" value="<s:property value="systemConfig.hiddenValue"/>">
							<input name="systemConfig.value" type="text" class="required" value="<s:property value="systemConfig.value"/>">
							<a title="LIST1人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
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