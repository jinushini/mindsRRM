<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>
<div class="pageContent">
	<div >
		<table class="list_table list" width="100%" style="table-layout:fixed;" >
			<thead>
				<tr>
					<!-- <th width="30">状态</th> -->
					<th width="100">型号代号</th>
					<th width="100">产品名称</th>
					<th width="100">产品代号</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="processInstId" rel="<s:property value="procssInstId"/>">
					<%-- <td align="center" style="font-size:30px; color:<s:if test='status == 3'>green</s:if><s:elseif test='status == 0'>gray</s:elseif><s:elseif test='status == 5'>red</s:elseif><s:else>orange</s:else>;">
						<s:property value="status == 0 ? '●' : '●'"/>
					</td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="modelCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productName"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productCode"/></td>
					<td align="center"><s:property value="checklistId"/>
						<a href="../checklist/checklistAppr!showChecklist.action?checklistId=<s:property value="id"/>" height="700" width="1100" target="dialog" class="details">详情</a><%-- &nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a> --%>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>
