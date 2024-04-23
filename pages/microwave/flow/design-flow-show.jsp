<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend style="font-size: 24px;">流程详情：<span style="font-size: 26px; color : red;"><s:property value="productDesignPro.productDesign.productBasic.name"/>（<s:property value="productDesignPro.productDesign.productBasic.code"/>）</span></legend>
			<div class="flow-frame">
				<s:iterator value="productDesignPro.flowRun.nodes" status="st" var="a">
					<div class="stage">
						<div id="<u:index value='#st.index+1'/>">
							<s:if test="diedNodes.contains(#attr.a.flowDefName)">
								<h1 class="complated-head">
									<s:property value="#attr.a.flowDefName"/>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>
								<ul class="complated-body">
									<s:iterator value="#attr.a.flowRunDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='design-flow-list-model-show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='design-flow-list-model-show.jsp'%> 
											</li>
										</s:else>									
									</s:iterator>
								</ul>
							</s:if>
							<s:elseif test="futureNodes.contains(#attr.a.flowDefName)">
								<h1 class="comingsoon-head">
								<s:property value="#attr.a.flowDefName"/>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>
								<ul class="comingsoon-body">
									<s:iterator value="#attr.a.flowRunDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='design-flow-list-model-show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='design-flow-list-model-show.jsp'%> 
											</li>
										</s:else>									
									</s:iterator>
								</ul>															
							</s:elseif>
							<s:else>
								<h1 class="ongoing-head">
								<s:property value="#attr.a.flowDefName"/>
									<span class="action-period">执行时间：<s:date name="#attr.a.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>至<s:date name="#attr.a.scheduleDate.planEndDate" format="yyyy-MM-dd"/></span>
								</h1>	
								<ul class="ongoing-body">
									<s:iterator value="#attr.a.flowRunDatas" var="b">
										<s:if test="(#attr.b.flowType == '质量')||(#attr.b.checklistType != null)">
											<li class="quality">
												<%@ include file='design-flow-list-model-show.jsp'%> 
											</li>
										</s:if>
										<s:else>
											<li>
												<%@ include file='design-flow-list-model-show.jsp'%> 
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