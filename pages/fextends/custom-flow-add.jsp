<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jd("#cancelBtn").click(function(){
		//navTab.loadUrl("../fextends/FTemplate_showFTemplateList_ftemplate-list.action");
		jd(".class").click();
	})
//-->
</script>
<div class="pageContent">
	<form method="post" id="searchFrm" action="../fextends/HtyFlow_add.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="flowDef.grade" value="0"/>
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>新增流程</b>
			</div>

			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>流程名称</th>
						<td><input name="flowDef.name" type="text" class="required" style="width: 80%"></td>
					</tr>
					<tr>
						<th width='15%'>流程类型</th>
						<td>
							<select name="flowDef.flowKey.id">
								<s:iterator value="list" var="st">
									<option value="<s:property value="id"/>"><s:property value="key"/></option>
								</s:iterator>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>