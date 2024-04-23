<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action='../ssaps/ssapsAppr!handelForce.action' class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend style="font-size: 24px;">流程详情：<span style="font-size: 26px; color : red;"><s:property value="ssaps.productDetail.name"/>（<s:property value="ssaps.productDetail.code"/>）</span></legend>
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
												<%@ include file='ssaps_list_model_show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='ssaps_list_model_show.jsp'%> 
											</li>
										</s:else>									
									</s:iterator>
								</ul>
							</s:if>
							<s:elseif test="futureNodes.contains(#attr.a.nodesName)">
								<h1 class="comingsoon-head">
								<s:property value="#attr.a.nodesName"/>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>
								<ul class="comingsoon-body">
									<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='ssaps_list_model_show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='ssaps_list_model_show.jsp'%> 
											</li>
										</s:else>									
									</s:iterator>
								</ul>															
							</s:elseif>
							<s:else>
								<h1 class="ongoing-head">
								<s:property value="#attr.a.nodesName"/>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>	
								<ul class="ongoing-body">
									<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='ssaps_list_model_show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='ssaps_list_model_show.jsp'%> 
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
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>