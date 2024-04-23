<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
	function subFrm() {
		window.document.frm.submit();
	}
</script>
	<body>
		<center>
			<form action="organization!updateOrganization.action" method="post"
				id="frm">
				<input name="organization.id"
					value='<s:property value="organization.id"/>' type="hidden">
				部门名称：
				<input name="organization.name"
					value='<s:property value="organization.name"/>' type="text">
				<br>
				系统标识：
				<input name="organization.sysCode"
					value='<s:property value="organization.sysCode"/>' type="text">
				<br>
				顺序：
				<input name="organization.train"
					value='<s:property value="organization.train"/>' type="text">
				<br>
				备注：
				<input name="organization.remark"
					value='<s:property value="organization.remark"/>' type="text">
				<br>
				<input type="submit" value="提交">
			</form>
		</center>
	</body>
</html>