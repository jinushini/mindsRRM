<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>详情--<s:property value="devPro.flowRun.flowName"/></legend>
			<table bproduct="0" width="98%" class="list_table list" align="center">
				<tr>
					<th align="center" width="3%">层级</th>
					<th align="center" width="25%">名称</th>
					<th align="center" width="10%">操作</th>
					<th align="center" width="10%">标准工时（天）</th>
					<th align="center" width="15%">计划开始时间</th>
					<th align="center" width="15%">计划结束时间</th>
					<th align="center" width="10%">计划工时（天）</th>
					<th align="center" width="12%">处理人</th>
				</tr>
				<s:iterator value="devPro.flowRun.nodes" var="a">
					<tr class="node" level="1">
						<td align="center">1</td>
						<td style="color: green;"><s:property value="#attr.a.flowDefName"/></td>
						<td align="center"></td>
						<td align="center"><s:property value="scheduleDate.standardHours"/></td>
						<td align="center"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
						<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
						<td align="center"><s:property value="scheduleDate.manHours"/></td>
						<td align="center"><s:property value="resopnsibleUser.name"/></td>
					</tr>
					<s:iterator value="#attr.a.flowRunDatas" var="b">
						<tr class="customflow" level="2">
							<td align="center">2<input name="flowRunNodeVoList[#index].level" type="hidden" value="2"></td>
							<td style="color: blue;"><span style="color: blue;">|—|</span><s:property value="#attr.b.flowName"/></td>
							<td align="center"></td>
							<td align="center"><s:property value="scheduleDate.standardHours"/></td>
							<td align="center"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
							<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
							<td align="center"><s:property value="scheduleDate.manHours"/></td>
							<td align="center"><s:property value="resopnsibleUser.name"/></td>
						</tr>
						<s:iterator value="#attr.b.subFlowRun.nodes" var="c">
							<tr class="customnode" level="3">
								<td align="center">3<input name="flowRunNodeVoList[#index].level" type="hidden" value="3"></td>
								<td style="color: red;"><span style="color: red;">|——|</span><s:property value="#attr.c.flowDefName"/></td>
								<td align="center"><s:property value="scheduleDate.standardHours"/></td>
								<td align="center"></td>
								<td align="center"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
								<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
								<td align="center"><s:property value="scheduleDate.manHours"/></td>
								<td align="center"><s:property value="resopnsibleUser.name"/></td>
							</tr>
							<s:iterator value="#attr.c.flowRunDatas" var="d">
								<tr class="actflow" level="4">
									<td align="center">4<input name="flowRunNodeVoList[#index].level" type="hidden" value="4"></td>
									<td style="color: orange;"><span style="color: red;">|———|</span><s:property value="#attr.d.flowName"/></td>
									<td align="center"><s:property value="scheduleDate.standardHours"/></td>
									<td align="center"></td>
									<td align="center"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
									<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
									<td align="center"><s:property value="scheduleDate.manHours"/></td>
									<td align="center"><s:property value="responsibleUser.name"/></td>
								</tr>
							</s:iterator>
						</s:iterator>
					</s:iterator>
				</s:iterator>
			</table>
		</fieldset>
	</div>
   </form>
</div>