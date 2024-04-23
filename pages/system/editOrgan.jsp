<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/default.css" />
		<script src="../../js/jquery-1.5.2.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				$("#addRootOrgan").click(function(){
					window.location.href="addOrganization.jsp";
				})
				
				$("#addNextOrganBut").click(function(){
					window.location.href="organization!inputEdit.action?parentOrganId="+$("#organId").val();
				})
			})
			
			function subFrm() {
				window.document.frm.submit();
			}
			function del(){
				
			}
		</script>
	</head>
	<body>
		<H3><FONT color="red"><s:property value="msg"/></FONT></H3>
		<form action="organization!saveOrganization.action" method="post" id="frm">
			<table width="90%" cellspacing="1" cellpadding="2" align="center" class="FORM">
			<input id="organId" name="organization.id" value='<s:property value="organization.id"/>' type="hidden">
			<input name="parentOrganId" value='<s:property value="parentOrganId"/>' type="hidden">
			<tr>
			<td>部门名称：</td>
			<td><input name="organization.name" value="<s:property value="organization.name"/>" type="text"></td>
			</tr>
			<tr>
			<td>部门系统标识：</td>
			<td><input name="organization.sysCode" value="<s:property value="organization.sysCode"/>" type="text"></td>
			</tr>
			<tr>
			<td>部门顺序：</td>
			<td><input name="organization.train" value="<s:property value="organization.train"/>" type="text"></td>
			</tr>
			<tr>
			<td>部门备注：</td>
			<td><input name="organization.remark" value="<s:property value="organization.remark"/>" type="text"></td>
			</tr>
			</table>
			<br>
			<table width="90%" cellspacing="1" cellpadding="2" align="center" class="">
				<tr>
					<td width="40%" style="text-align: center;">
						<input type="submit" id="saveBut" value="保存">
						<s:if test="showDelBtn">
							<input type="button" id="delMenuBtn" value="删除">
						</s:if>
					</td>
					<td width="60%" style="text-align: center;">
						<s:if test="showAddBtn">
							<input type="button" id="addNextOrganBut" value="添加下级菜单">
						</s:if>
						<s:if test='op!="add"'>
							<input type="button" id="addRootOrgan" value="添加一级部门">
						</s:if>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>