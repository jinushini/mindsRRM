<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/WEB-INF/tld/user_tag.tld" prefix="u" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function inputEdit(oid){
		window.location.href="role!update.action?oid="+oid;
	}
	function addRole(){
		window.location.href = "addRole.jsp"
	}
</script>
</head>
<body>
<form action="role!showRole.action"  method="post">
	<input type="text" name="name">
	<input type="submit" name="" value="查询">
	<input type="button" name="" value="添加" onclick="addRole();"/>
</form>
<table cellpadding="0" cellspacing="0" border="1" bordercolor="black" width="100%" align="center">
	<thead>
		<tr>
			<th>序号</th>
			<th>角色名称</th>
			<th>角色顺序</th>
			<th>角色类别</th>
			<th>系统标识</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<s:iterator value="list" var="e" status="st">
		<tr>
			<td><u:index value="#st.index+1" /></td>
			<td><s:property value="name"/></td>
			<td><s:property value="train"/></td>
			<td><s:property value="sort"/></td>
			<td><s:property value="sysCode"/></td>
			<td><s:property value="remark"/></td>
			<td>
				<input type="button" value="修改" onclick="inputEdit('<s:property value="#attr.e.id"/>')">
			</td>
		</tr>
	</s:iterator>
	<tr>
		<td align="right" colspan="7"><u:page></u:page></td>
	</tr>
</table>

</body>
</html>