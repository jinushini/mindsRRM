<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--

//-->
</script>

<div class="pageHeader">
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%-- <li><a class="delete" href="../fextends/flowControl!endProcessByProcessInstId.action?processInstId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li> --%>
			<li><a class="delete" href="../fextends/flowControl!endProcesses.action" target="selectedTodo" rel="ids" title="确定要终止吗?"><span>批量终止</span></a></li>
			<li><a class="delete" href="../fextends/flowControl!deleteProcesses.action" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li>
			<li><a class="delete" href="../fextends/flowControl!completeProcesses.action" target="selectedTodo" rel="ids" title="强制完成复查流程下一环节"><span>批量处理复查流程下一环节</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120">
			<thead>
				<tr>
					<th width="5%" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="5%" align="center">序号</th>
					<th width="">任务类型</th>
					<th width="">任务名称</th>
					<th>任务处理人</th>
					<th>流程ID</th>
					<th>创建时间</th>
					<!-- <th>操作</th> -->
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="processInstId"/>">
					<td align="center"><input name="ids" value="<s:property value='processInstId'/>" type="checkbox"></td>
					<td align="center"><s:property value="#st.index+1"/> </td>
					<td align="center"><s:property value="processDefinitionName"/></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="assignee"/></td>
					<td align="center"><s:property value="processInstId"/></td>
					<td align="center"><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<%-- <td align="center">
						<a href="../fextends/flowControl!endProcessByTaskId.action?taskId=<s:property value="id"/>" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a>
					</td> --%>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

