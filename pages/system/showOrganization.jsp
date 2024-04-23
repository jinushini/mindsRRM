<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/tld/user_tag.tld" prefix="u"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/main.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		
			function inputEdit(id) {
				window.location.href = "organization!update.action?id=" + id;
			}
			function add() {
				window.location.href = "addOrganization.jsp"
			}
			function addOrganizationSon(id) {
				window.location.href = "organizationSon!addSon.action?id="
						+ id
			}
		</script>
	</head>
	<body>
		<form action="organization!showAllOrganization.action" method="post">
			<input type="text" name="name">
			<input type="submit" name="" class="query-button" value="查询">
			<input type="button" name="" value="添加" onclick=add();>
		</form>
		<br>
		<table width="100%" cellspacing="1" cellpadding="2" align="center" class="table">
			<thead>
				<tr>
					<th>
						部门名称
					</th>
					<th>
						系统标示
					</th>
					<th>
						备注
					</th>
					<th>
						操作
					</th>
				</tr>
			</thead>
			<s:iterator value="list" var="e" status="st">
				<tr>
					<td>
						<s:property value="name" />
					</td>
					<td>
						<s:property value="sysCode" />
					</td>
					<td>
						<s:property value="remark" />
					</td>
					<td>
						<center>
							<input type="button" value="修改"
								onclick="inputEdit('<s:property value="#attr.e.id"/>')">
							<input type="button" value="添加子部门"
								onclick="addOrganizationSon('<s:property value="#attr.e.id"/>')">
						</center>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td align="right" colspan="5">
					<u:page></u:page>
				</td>
			</tr>
		</table>
	</body>
</html>