<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jd("#cancelBtn").click(function(){
		//navTab.loadUrl("../fextends/HtyFlow_getFlowList_custom-flow-stage-list.action");
		jd(".class").click();
	})
//-->
</script>
<div class="pageContent">
	<form method="post" id="searchFrm" action="../fextends/HtyFlow_edit.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="flowDef.grade" value="2"/>
		<input type="hidden" name="flowDef.parentFlow.id" value='<s:property value="parentId" />'/>
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>修改阶段</b>
			</div>
			<input name="flowDef.id" type="hidden" value="<s:property value="flowDef.id"/>">
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>阶段名称</th>
						<td><input name="flowDef.name" type="text" class="required" value="<s:property value="flowDef.name"/>"></td>
					</tr>
					<tr>
						<th width='15%'>阶段顺序</th>
						<td><input name="flowDef.sort" type="text" class="required" value="<s:property value="flowDef.sort"/>" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
					</tr>
					<%-- <tr>
						<th width='15%'>流程类型</th>
						<td>
							<select name="flowDef.flowKey.id" value="">
								<s:iterator value="list" var="st">
									<option value='<s:property value="id"/>' <s:if test="flowDef.flowKey.id == id">selected="selected"</s:if>><s:property value="key"/></option>
								</s:iterator>	
							</select>
						</td>
					</tr> --%>
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