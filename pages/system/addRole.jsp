<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
<script type="text/javascript">
	function subFrm(){
		window.document.frm.submit();
	}
</script>
</head>
  
  <body>
   	<form action="role!add.action" method="post" id="frm"  >
   		<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
   			<tr>
   				<td>角色名称：</td>
   				<td><input name="role.name" value="" type="text"></td>
   			</tr>
   			<tr>
   				<td>角色顺序：</td>
   				<td><input name="role.train" value="" type="text"></td>
   			</tr>
   			<tr>
   				<td>角色类别：</td>
   				<td><input name="role.sort" value="" type="text"></td>
   			</tr>
   			<tr>
   				<td>系统标识：</td>
   				<td><input name="role.sysCode" value="" type="text"></td>
   			</tr>
   			<tr>
   				<td>备注：</td>
   				<td><input name="role.remark" value="" type="text"></td>
   			</tr>
		</table>
		<br/>
		<center>
   			<input type="submit" value="提交">
   			&nbsp;&nbsp;&nbsp; <input type="button" onclick="window.history.back();" value="返回">
   		</center>
	</form>
  </body>
</html>
