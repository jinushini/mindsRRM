<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../../common.jsp" %>
<html>
	<head>
		<title></title>
		<script type="text/javascript" src="../../js/component/My97DatePicker/WdatePicker.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$(".query-button").click(function(){
					window.location.href="paramConfig!showParamConfigById.action?paramConfigId="+$(this).parent().parent().attr("id");
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
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" status="st" id="e">
					<tr id="<s:property value="#attr.e.id"/>">
						<td nowrap="nowrap"><u:index value="#st.index+1"/></td>
						<td nowrap="nowrap"><s:property value="#attr.e.name"/></td>
						<td nowrap="nowrap"><s:property value="#attr.e.value"/></td>
						<td nowrap="nowrap">
							<input type="button" class="query-button"/>
						</td>
					</tr>
				</s:iterator>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5"><u:page/></td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>