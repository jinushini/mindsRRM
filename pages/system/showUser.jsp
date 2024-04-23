<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="../../css/jquery.treeview.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#saveBut").click(function(){
			$("#frm").submit();	
		});
		$("#addMenuBut").click(function(e){
			e.preventDefault();
			window.location.href="menu!inputAdd.action?menuId="+$("[name='menu.id']").val();
		});
		
		if('<s:property value="op"/>'=='add'){
			$("#addMenuBut").hide();
		}
		
	});
</script>
</head>

<body>
   <form action='user!<s:property value="op"/>.action' method="post" id="frm">
   <input type="hidden" name="user.id" value="<s:property value="user.id"/>"/>
	<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
		<tr>
			<td>登录名：</td>
			<td><input type="text" name="user.loginName" value="<s:property value="user.loginName"/>"/> </td>
		</tr>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="user.name" value="<s:property value="user.name"/>"/> </td>
		</tr>
		<tr>
			<td>工号：</td>
			<td><input type="text" name="user.staffId" value="<s:property value="user.staffId"/>"/> </td>
		</tr>
		<tr>
			<td nowrap="nowrap">密码：</td>
			<td><input type="text" name="user.password" value="<s:property value="user.password"/>"/> </td>
		</tr>
		<tr>
			<td>系统标识：</td>
			<td><input type="text" name="user.sysCode" value="<s:property value="user.sysCode"/>"/> </td>
		</tr>
		<tr>
			<td>描述：</td>
			<td><input type="text" name="user.remark" value="<s:property value="user.remark"/>"/> </td>
		</tr>
	</table>
	<br/>
	<center>
		<input type="button" id="saveBut" value="保存">
		&nbsp;&nbsp;&nbsp; <input type="button" onclick="window.history.back();" value="返回">
	</center>
   </form>
</body>
</html>