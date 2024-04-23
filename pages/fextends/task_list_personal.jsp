<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
//双击事件
jn("tbody tr").dblclick(function(){
	$(this).find(".personalTask").click();
})
//-->
</script>

<!-- <div class="pageHeader">
</div> -->
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
	<div layoutH="50">
		<table class="list_table list" width="100%" layoutH="60"  style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="20%">任务名称</th>
					<th width="10%">节点名称</th>
					<th width="20%">任务归属</th>
					<!-- <th width="15%">任务类型</th> -->
					<th width="10%">责任人</th>
					<!-- <th>流程ID</th> -->
					<th width="10%">创建时间</th>
					<th width="10%">截止时间</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><s:property value="#st.index+1"/> </td>
					<td align="center"><s:property value="taskSource"/></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="taskType"/></td>
					<%-- <td align="center"><s:property value="processDefinitionName"/></td> --%>
					<td align="center" title=<s:property value="assignee"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="assignee"/></td>
					<%-- <td align="center"><s:property value="processInstId"/></td> --%>
					<td align="center"><s:date name="createDate" format="yyyy-MM-dd"/></td>
					<td align="center" 
						<s:if test="closeDate != null">
							<s:if test="(new java.util.Date().getTime()-closeDate.getTime())/1000/60/60/24>0">
								style="color:red"
							</s:if>
						</s:if>
						<s:elseif test="closeDate == null">
							<s:if test="(new java.util.Date().getTime()-createDate.getTime())/1000/60/60/24>0">
								style="color:red"
							</s:if>
						</s:elseif>
					>
						<s:date name="closeDate !=null ? closeDate : createDate" format="yyyy-MM-dd"/>
					</td>
					<%-- <td align="center"><s:date name="closeDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center">
						<a href="<s:property value="formKey"/>?taskId=<s:property value="id"/>&processInstId=<s:property value="processInstId"/>" target="navTab" rel="personalTask" class="personalTask"><span>处理</span></a>|
						<a href="../fextends/flowImage!view.action?processInstId=<s:property value="processInstId"/>" target="navTab"><span>流程图</span></a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>
<u:juipage></u:juipage>
