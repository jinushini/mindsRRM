<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
//-->
</script>

<div class="pageContent">
	<%-- <div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div> --%>
	<div layoutH="30">
		<table class="list_table list" width="100%" layoutH="36" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">任务名称</th>
					<th width="">待办人</th>
					<th width="">审批结论</th>
					<th width="20%">审批意见</th>
					<th>开始时间</th>
					<th>结束时间</th>
					
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr>
					<td align="center"><s:property value="#st.index+1"/> </td>
					<td align="center"><s:property value="taskName"/></td>
					<td align="center"><s:property value="userName"/></td>
					<td align="center"><s:property value="resultCn"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='comments'/>"><s:property value="comments"/></td>
					<td align="center"><s:date name="startDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td align="center"><s:date name="endDate" format="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><a target="_blank" class="button" href="../fextends/flowImage!view.action?processInstId=<s:property value="processInstId"/>"><span>查看流程图</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>
	</div>
</div>

