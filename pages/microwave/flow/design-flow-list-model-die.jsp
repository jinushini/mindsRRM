<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
	<%@include file="design-flow-list-model-status.jsp" %>
	<s:property value="#attr.b.flowName" /> （<s:property value="#attr.b.responsibleName==null?'未配置':#attr.b.responsibleName"/>）	
	<span class="action-period">执行时间：<s:date name="#attr.b.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.b.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>		
	<span class="ssaps-list-sub-model">
		<%@include file="design-flow-list-sub-model-show.jsp" %>
	</span>
	<input id="subFlowId" type="hidden" name="subFlowId" value="<s:property value="#attr.b.id"/>" readonly="readonly">
	
	<s:if test="#attr.b.status==5">
		<a class="setUserA" title="设置启动" target="dialog" height="350" width="720"><img src="../../img/setting.gif"></a>
		<div class="setUserDiv" style="display:none;">
			<span style="float:left; font-size:16px;">责任人：</span>
			<input name="auditorId" type="hidden" class="required" value="<s:property value="#attr.b.responsibleUser.id"/>"/>
			<input name="auditorName" type="text" class="required" value="<s:property value="#attr.b.responsibleUser.name"/>" onclick="$(this).next().click()" readonly="readonly" size="10%"/>
			<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
		</div>											
	</s:if>
	<s:elseif test="#attr.b.status==3">
		<div class="setUserDiv" style="display:none;">
			<span style="float:left; font-size:16px;">责任人：</span>
			<input name="auditorId" type="hidden" class="required" value="<s:property value="#attr.b.responsibleUser.id"/>"/>
			<input name="auditorName" type="text" class="required" value="<s:property value="#attr.b.responsibleUser.name"/>" onclick="$(this).next().click()" readonly="readonly" size="10%"/>
		</div>
		<a href="<s:property value="#attr.b.subFlowDetailsPath" />" class="detailsA" target="dialog" height="450" width="850" title="子任务详情"><img src="../../img/details.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" target="dialog" height="450" width="850"><img src="../../img/view.gif" title="查看子任务进度"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	</s:elseif>
	<s:else>
		<div class="setUserDiv" style="display:none;">
			<span style="float:left; font-size:16px;">责任人：</span>
			<input name="auditorId" type="hidden" class="required" value="<s:property value="#attr.b.responsibleUser.id"/>"/>
			<input name="auditorName" type="text" class="required" value="<s:property value="#attr.b.responsibleUser.name"/>" onclick="$(this).next().click()" readonly="readonly" size="10%"/>
			<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
		</div>
		<a href="<s:property value="#attr.b.subFlowDetailsPath" />" class="detailsA" target="dialog" height="450" width="850" title="子任务详情"><img src="../../img/details.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" target="dialog" height="450" width="850"><img src="../../img/view.gif" title="查看子任务进度"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	</s:else>
