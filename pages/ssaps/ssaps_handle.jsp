<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){		
		//启动设置链接
		jn(".setUserA").click(function(){
			var subFlowId = jn(this).parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().find("input[name=processInstId]").val();
			var url = "../ssaps/ssapsConfig!inputSubProcessConfig.action?subFlowId=" + subFlowId + "&processInstId=" + processInstId;
			jn(this).attr("href",url);
		});
		//重启设置链接
		jn(".reSetUserA").click(function(){
			var subFlowId = jn(this).parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().find("input[name=processInstId]").val();
			var flowClassId = jn(this).parent().find("input[name=flowClassId]").val();
			var flowClassName = jn(this).parent().find("input[name=flowClassName]").val();
			var url = "../ssaps/ssapsConfig!inputRestartSubProcessConfig.action?subFlowId="+subFlowId + "&processInstId=" + processInstId + "&flowClassId=" + flowClassId + "&flowClassName=" + flowClassName;
			jn(this).attr("href",url);
		});
		//作废设置链接
		jn(".setStopA").click(function(){
			var subFlowId = jn(this).parent().find("input[name=subFlowId]").val();
			var processInstId = jn(this).parent().find("input[name=processInstId]").val();
			var flowClassId = jn(this).parent().find("input[name=flowClassId]").val();
			var flowClassName = jn(this).parent().find("input[name=flowClassName]").val();
			var url = "../ssaps/ssapsConfig!inputStopSubProcessConfig.action?subFlowId="+subFlowId + "&processInstId=" + processInstId + "&flowClassId=" + flowClassId + "&flowClassName=" + flowClassName;
			jn(this).attr("href",url);
		});

		//强制执行按钮
		jn(".forceBtn").click(function(){
			jn(".required").removeClass();
			var taskId = jn("input[name=taskId]").val();
			var processInstId = jn("input[name=processInstId]").val();
			alertMsg.confirm("确认强制完成", {
				 okCall: function(){				 
					 $.post("../ssaps/ssapsAppr!handelForce.action", {taskId:taskId,processInstId:processInstId}, navTabAjaxDone, "json"); 
				 },
				 cancelCall : function() {}
			});
			
		});
	});

</script>
<div class="pageContent">
  <form method="post" action='../ssaps/ssapsAppr!handelForce.action' class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend style="font-size: 24px;">流程控制：<span style="font-size: 26px; color : red;"><s:property value="ssaps.productDetail.name"/>（<s:property value="ssaps.productDetail.code"/>）</span></legend>
			<div class="flow-frame">
				<s:iterator value="ssaps.nodes" status="st" var="a">
					<div class="stage">
						<div id="<u:index value='#st.index+1'/>">
							<s:if test="diedNodes.contains(#attr.a.nodesName)">
								<h1 class="complated-head">
									<s:property value="#attr.a.nodesName"/>								
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>
								<ul class="complated-body">
								<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
									<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
										<li class="quality">
											<%@ include file='ssaps_list_model_die.jsp'%> 
										</li>
									</s:if>
									<s:else>
										<li>
											<%@ include file='ssaps_list_model_die.jsp'%> 
										</li>
									</s:else>
										
								</s:iterator>
							</ul>
							</s:if>
							<s:elseif test="futureNodes.contains(#attr.a.nodesName)">
								<h1 class="comingsoon-head">
									<s:property value="#attr.a.nodesName"/>
									<a href="../ssaps/ssaps!inputModifySsapsNode.action?ssapsNodeId=<s:property value="#attr.a.id"/>" width="750" target="dialog" title="编辑阶段信息"><input type="hidden" value="<s:property value="#attr.a.id"/>"><img src="../../img/edit.gif"></a>
									<a href="../ssaps/ssapsConfig!inputSuperFlowNodeConfigInTask.action?parentNodeId=<s:property value="#attr.a.id"/>&&processInstId=<s:property value="processInstId"/>&&mark=runPage" target="dialog" width="1050" height="480" title="新增子任务"><img src="../../img/new.gif"></a>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>	
								<ul class="comingsoon-body">
									<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='ssaps_list_model.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='ssaps_list_model.jsp'%> 
											</li>
										</s:else>
											
									</s:iterator>
								</ul>					
							</s:elseif>	
							<s:else>
								<h1 class="ongoing-head">
									<s:property value="#attr.a.nodesName"/>
									<a href="../ssaps/ssaps!inputModifySsapsNode.action?ssapsNodeId=<s:property value="#attr.a.id"/>" width="750" target="dialog" title="编辑阶段信息"><input type="hidden" value="<s:property value="#attr.a.id"/>"><img src="../../img/edit.gif"></a>
									<a href="../ssaps/ssapsConfig!inputSuperFlowNodeConfigInTask.action?parentNodeId=<s:property value="#attr.a.id"/>&&processInstId=<s:property value="processInstId"/>&&mark=runPage" target="dialog" width="1050" height="480" title="新增子任务"><img src="../../img/new.gif"></a>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>	
								<ul class="ongoing-body">
									<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='ssaps_list_model.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='ssaps_list_model.jsp'%> 
											</li>
										</s:else>
											
									</s:iterator>
								</ul>
							</s:else>						
							
						</div>
					</div>
				</s:iterator>
			</div>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button class="forceBtn" type="button">强制完成</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>