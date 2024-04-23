<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	
</script>
	<div>
		<table class="list_table list" width="100%" layoutH="30" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="20%">最新计划交付时间</th>
					<th width="20%">当前研制阶段</th>
					<th width="50%">当前存在问题</th>
					<th width="5%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center"><s:date name="currentDate" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="currentPhase"/></td>
					<td align="center"><s:property value="currentIssue"/></td>
					<td align="center"><s:property value="checklistId"/>
						<a href="../microwave/product_ProductOrderRecord_showDetails_order-record-show.action?id=<s:property value="id"/>" height="350" width="700" target="dialog" class="new_record">详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
