<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/user!showUserList.action")
	})
//-->
</script>
<div class="pageContent">
<form method="post" enctype="multipart/form-data" id="searchFrm" action='../fextends/user!<s:property value="op"/>.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="user.id" value="<s:property value="user.id"/>"/>
    <div class="pageFormContent" layoutH="53">
	   	<table class="edit_table" width="98%" style="margin-top:10%">	
	   		
			<tr>
				<td  style="text-align: right;">登录名：</td>
				<td><input type="text" name="user.loginName" value="" class="required" /> </td>
			</tr>
			<tr>
				<td style="text-align: right;" nowrap="nowrap">密码：</td>
				<td><input style="color: grey" type="text" name="user.password" value="888888" readonly="true" class="required"/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">用户姓名：</td>
				<td><input type="text" name="user.name" value="" class="required"/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">部门：</td>
				<td>
					<select name="user.organization.id">
						<s:iterator value="list" status="st">
							<option value="<s:property value="id"/>" class="option"><s:property value="fullName"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">工号：</td>
				<td><input type="text" name="user.staffId" value="" class="required"/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">职务：</td>
				<td><input type="text" name="user.duty" value=""/> </td>
			</tr>
			<tr>
				<td style="text-align: right;">职称：</td>
				<td><input type="text" name="user.position" value=""/> </td>
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