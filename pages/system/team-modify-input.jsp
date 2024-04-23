<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
	<form method="post" enctype="multipart/form-data" action='../fextends/team!modifyTeam.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
    <input name="teamVo.id" type="hidden" value="<s:property value="teamVo.id"/>">
    <div class="pageFormContent" layoutH="53">
	   	<table class="edit_table" width="98%" style="margin-top:10%">	
			<tr>
				<td style="text-align: right;width: 30%;">班组隶属部门：</td>
				<td>
					<select name="teamVo.organization.id">
						<s:iterator value="list" status="st">
							<!-- 下拉框默认选择 -->
							<option value="<s:property value="id"/>" <s:if test='id==teamVo.organization.id'>selected</s:if>><s:property value="fullName"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;" nowrap="nowrap">班组名称：</td>
				<td><input type="text" name="teamVo.name" value='<s:property value='teamVo.name' />' class="required"/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">班组长：</td>
				<td>
					<input type="hidden" name="teamVo.leadIds" value='<s:property value="teamVo.leadIds" />' class="required">
					<input type="text" name="teamVo.leadNames" value='<s:property value="teamVo.leadNames" />' onclick="$(this).next().click()" readonly="readonly" class="required" placeholder="班组长和班组成员不要重复">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">班组成员：</td>
				<td>
					<input type="hidden" name="teamVo.memberIds" value='<s:property value="teamVo.memberIds" />' class="required">
					<input type="text" name="teamVo.memberNames" value='<s:property value="teamVo.memberNames" />' onclick="$(this).next().click()" readonly="readonly" class="required" placeholder="班组长和班组成员不要重复">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
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