<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../../common.jsp" %>
<html>
	<head>
		<title>个人自查</title>
		<SCRIPT type="text/javascript">
			$(function(){
				$(".save-button").click(function(){
					$("#frm").submit();
				})
			})
		</SCRIPT>
	</head>
	<body>
		<form action="paramConfig!save.action" id="frm" method="post">
		<input type="hidden" value='<s:property value="paramConfigId"/>' name="paramConfigId">
		<input type="hidden" value='<s:property value="paramConfig.id"/>' name="paramConfig.id">
		<table id="listTable" align="center" width="90%" border="0" cellpadding="10" class="edit-table">
			<tbody>
				<tr>
					<th>参数名：</th>
					<td><input type="text" name="paramConfig.name" value='<s:property value="paramConfig.name"/>'/> </td>
				</tr>
				<tr>
					<th>参数值：</th>
					<td><input type="text" value='<s:property value="paramConfig.value"/>' name="paramConfig.value"></td>
				</tr>
			</tbody>
		</table>
		</form>
		<br/>
		<center>
			<input type="button" class="save-button">
			<input type="button" class="back-button" onClick="window.history.back();">
		</center>
		<br/>
	</body>
</html>