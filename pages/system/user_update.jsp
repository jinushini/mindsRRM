<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/user!showUserList.action")
	});
	$(function(){
		$("#btn").click(function(){
			$("#pwd").val("888888");
			
		})
		
		//部门select下拉框默认选中
		jn("#type").val(jn("#organId").val());
	});
//-->
</script>

<div class="pageContent">
<form method="post" enctype="multipart/form-data" id="searchFrm" action='../fextends/user!<s:property value="op"/>.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="user.id" value="<s:property value="user.id"/>"/>
	
    <div class="pageFormContent" layoutH="53" >
   	<table class="edit_table" width="98%" height="98%" style="table-layout:fixed;">	
		<tr>
			<td style="text-align: right;">登录名：</td>
			<td style="width:70%"><input type="text" name="user.loginName" value="<s:property value="user.loginName"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;" nowrap="nowrap">密码：</td>
			<td>
				<input id="pwd" type="password" name="user.password" value="<s:property value="user.password" />" readonly="readonly"/> 
				<input id="btn" type="button" value="重置"/>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">用户姓名：</td>
			<td><input type="text" name="user.name" value="<s:property value="user.name"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">工号：</td>
			<td><input type="text" name="user.staffId" value="<s:property value="user.staffId"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">部门：</td>
			<td>
				<input type="hidden" value="<s:property value='user.organization.id'/>" id="organId"/>
				<select name="user.organization.id" id="type">
					<s:iterator value="list" status="st">
						<option value="<s:property value="id"/>" class="option"><s:property value="fullName"/></option>
					</s:iterator>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">职务：</td>
			<td><input type="text" name="user.duty" value="<s:property value="user.duty"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">职称：</td>
			<td><input type="text" name="user.position" value="<s:property value="user.position"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">工作负荷量：</td>
			<td><input type="text" name="user.workLoad" value="<s:property value="user.workLoad"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">工作难度系数：</td>
			<td><input type="text" name="user.difficult_degree" value="<s:property value="user.difficult_degree"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">收益值：</td>
			<td><input type="text" name="user.gainVal" value="<s:property value="user.gainVal"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">经验值：</td>
			<td><input type="text" name="user.expVal" value="<s:property value="user.expVal"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">专业素养值：</td>
			<td><input type="text" name="user.professionVal" value="<s:property value="user.professionVal"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">威望值：</td>
			<td><input type="text" name="user.prestigeVal" value="<s:property value="user.prestigeVal"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">擅长领域：</td>
			<td><input type="text" name="user.skilledField" value="<s:property value="user.skilledField"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">个性签名：</td>
			<td><input type="text" name="user.signature" value="<s:property value="user.signature"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">
				手写签名：<br/><br/>
				<div style="color:red;">
					(上传新签名前请先删除旧签名)
				</div>
				
			</td>
			<td>
				<div class="upload-wrap">
					<input type="file" name="handWritten" accept="" class="valid" style="left: 0px;">
					<div class="thumbnail">
						<img src="<s:property value="user.handWritten"/>" style="max-width: 80px; max-height: 80px">
						<a class="del-icon" href="ajaxDone.html"></a>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">系统标识：</td>
			<td><input type="text" name="user.sysCode" value="<s:property value="user.sysCor54rfrfrfrfrfrfrfrfrf4de"/>"/> </td>
		</tr>
		<tr>
			<td style="text-align: right;">描述：</td>
			<td><input type="text" name="user.remark" value="<s:property value="user.remark"/>"/> </td>
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