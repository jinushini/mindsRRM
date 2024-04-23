<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function subFrm(){
		window.document.frm.submit();
	}
</script>
<body>
<center>
	<form action="role!updateRole.action" method="post" id="frm">
		<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
   			<tr>
   				<td>角色名称：</td>
   				<td><input name="role.name" value='<s:property value="role.name"/>' type="text"></td>
   			</tr>
   			<tr>
   				<td>角色顺序：</td>
   				<td><input name="role.train" value='<s:property value="role.train"/>' type="text"></td>
   			</tr>
   			<tr>
   				<td>角色类别：</td>
   				<td><input name="role.sort" value='<s:property value="role.sort"/>' type="text"></td>
   			</tr>
   			<tr>
   				<td>系统标识：</td>
   				<td><input name="role.sysCode" value='<s:property value="role.sysCode"/>' type="text"></td>
   			</tr>
   			<tr>
   				<td>备注：</td>
   				<td><input name="role.remark" value='<s:property value="role.remark"/>' type="text"></td>
   			</tr>
		</table>
		<input name="role.id" value='<s:property value="role.id"/>' type="hidden">
		<input type="submit" value="提交">&nbsp;&nbsp;&nbsp; <input type="button" onclick="window.history.back();" value="返回">
	</form>
</center>
</body>
</html>