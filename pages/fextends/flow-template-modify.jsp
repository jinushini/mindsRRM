<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">

</script>

<div class="pageContent">
  <form action="../fextends/flowTemplate!modifyFlowTemplate.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  	<input type="hidden" name="flowTemplate.id" value="<s:property value="flowTemplate.id"/>"/>
  	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新增模板</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="20%">流程模型</th>
						<td><s:property value="flowTemplate.flowDefName"/></td>
						

					</tr>
				</thead>
				<tbody id="itemList">
					<tr class="addTr">
						<th width="20%">模板名称</th>
						<td ><input type="text" name="flowTemplate.flowTemplateName" value="<s:property value="flowTemplate.flowTemplateName"/>" class="required"></td>						
					</tr>
					<tr>
						<th width="20%" align="center">模板描述</th>
						<td ><input type="text" name="flowTemplate.description" value="<s:property value="flowTemplate.description"/>"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>

