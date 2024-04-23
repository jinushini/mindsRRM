<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>										
	<%@include file="ssaps_list_model_status.jsp" %>
	<s:property value="#attr.b.flowName" /> （<s:property value="#attr.b.responsibleName==null?'未配置':#attr.b.responsibleName"/>）	
	<span class="action-period">执行时间：<s:date name="#attr.b.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.b.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>																																		
	<span class="ssaps-list-sub-model">
		<%@include file="ssaps_list_sub_model.jsp" %>
	</span>
	<s:if test="#attr.b.status != 5">
		<a href="<s:property value="#attr.b.subFlowDetailsPath" />" class="detailsA" target="dialog" height="450" width="850" title="子任务详情"><img src="../../img/details.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
		<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" target="dialog" height="450" width="850"><img src="../../img/view.gif" title="查看子任务进度"></a>	
	</s:if>										
