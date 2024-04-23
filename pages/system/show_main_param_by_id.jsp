<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../../common.jsp" %>
<html>
	<head>
		<title></title>
		<script type="text/javascript" src="../../js/component/My97DatePicker/WdatePicker.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$(".add-button").click(function(){
					window.location.href="paramConfig!inputEdit.action?paramConfigId=<s:property value="paramConfigId"/>"
				});
				
				$(".edit-button").click(function(){
					if(getSelectedRowOid()==undefined){
						alert('请选择要修改的数据！');
						return ;
					}
					window.location.href="paramConfig!inputEdit.action?paramConfigId=<s:property value="paramConfigId"/>&paramConfig.id="+getSelectedRowOid();
				});
				
			})
		</SCRIPT>
	</head>
	<body>
	  <form action="onDutyStaff!setStaffSort.action" id="frm">
	  </form>
		<table id="listTable" align="center" width="100%" border="0" cellpadding="10" class="table dataTable">
			<thead>
				<tr>
					<th>序号</th>
					<th>参数名</th>
					<th>参数值</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" status="st" id="e">
					<tr id="<s:property value="#attr.e.id"/>">
						<td nowrap="nowrap"><u:index value="#st.index+1"/></td>
						<td nowrap="nowrap"><s:property value="#attr.e.name"/></td>
						<td nowrap="nowrap"><s:property value="#attr.e.value"/></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<center>
			<input type="button" class="add-button">
			<input type="button" class="edit-button">
		</center>
	</body>
</html>