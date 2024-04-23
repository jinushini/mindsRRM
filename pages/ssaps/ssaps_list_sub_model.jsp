<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
	<s:iterator value="#attr.b.nodeDatas" var="c">
		<%@include file="ssaps_list_sub_model_status.jsp" %>
		<s:property value="#attr.c.flowName" /> （<s:property value="#attr.b.responsibleName==null?'未配置':#attr.c.responsibleName"/>）	
		<span class="action-period">执行时间：<s:date name="#attr.c.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.c.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>		
	</s:iterator>
