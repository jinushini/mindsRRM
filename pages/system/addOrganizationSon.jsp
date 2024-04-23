<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
	</head>
	<script type="text/javascript">
	function subFrm() {
		window.document.frm.submit();
	}
	function del(){
		
	}
</script>
	<body>
		<center>
			<form action="organizationSon!addOrganizationSon.action" method="post"
				id="frm">
				<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
				<input name="organization.id"
					value='<s:property value="organization.id"/>' type="hidden">
					<tr>
				<td>部门名称：</td>
				<td><s:property value="organization.name"/></td>
				</tr>
				<tr>
				<td>系统标识：</td>
				<td><s:property value="organization.sysCode"/></td>
				</tr>
				<tr>
				<td>顺序：</td>
				<td><s:property value="organization.train"/></td>
				</tr>
				<tr>
				<td>备注：</td>
				<td><s:property value="organization.remark"/></td>
				</tr>
				<tr>
				<td>子部门名称：</td>
				<td><input name="organizationSon.name" value="" type="text"></td>
				</tr>
				<tr>
				<td>子部门系统标识：</td>
				<td><input name="organizationSon.sysCode" value="" type="text"></td>
				</tr>
				<tr>
				<td>子部门顺序：</td>
				<td><input name="organizationSon.train" value="" type="text"></td>
				</tr>
				<tr>
				<td>子部门备注：</td>
				<td><input name="organizationSon.remark" value="" type="text"></td>
				</tr>
				</table>
				<input type="submit" value="提交"> &nbsp; <input type="button" onclick="del();" value="删除">
			</form>
		</center>
	</body>
</html>