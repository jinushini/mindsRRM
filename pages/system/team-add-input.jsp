<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
<form method="post" enctype="multipart/form-data" action='../fextends/team!addNewTeam.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
    <div class="pageFormContent" layoutH="53">
	   	<table class="edit_table" width="98%" style="margin-top:10%">	
			<tr>
				<td style="text-align: right;width: 30%;">班组隶属处室：</td>
				<td>
					<select name="teamVo.organization.id">
						<s:iterator value="list" status="st">
							<option value="<s:property value="id"/>" class="option"><s:property value="fullName"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;" nowrap="nowrap">班组名称：</td>
				<td><input type="text" name="teamVo.name" class="required"/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">班组长：</td>
				<td>
					<input name="teamVo.leadIds" type="hidden" class="required">
					<input name="teamVo.leadNames" type="text" onclick="$(this).next().click()" readonly="readonly" class="required" placeholder="班组长和班组成员不要重复">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">班组成员：</td>
				<td>
					<input name="teamVo.memberIds" type="hidden" class="required">
					<input name="teamVo.memberNames" type="text" onclick="$(this).next().click()" readonly="readonly" class="required" placeholder="班组长和班组成员不要重复">
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