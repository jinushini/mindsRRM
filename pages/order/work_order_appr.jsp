<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" action="../order/orderAppr!leaderAppr.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>订单审核</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">型号代号：</td>
				<td><s:property value="order.productLib.modelCode"/></td>
				<td align="center">型号名称：</td>
				<td><s:property value="order.productLib.modelName"/></td>
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><s:property value="order.productCode"/></td>
				<td align="center">产品名称：</td>
				<td><s:property value="order.productName"/></td>
			</tr>
			<tr>
				<td align="center">去型号化代号：</td>
				<td><s:property value="order.code"/></td>
				<td align="center">阶段：</td>
				<td><s:property value="order.stage"/></td>
			</tr>
			<tr>
				<td align="center">产品种类：</td>
				<td><s:property value="order.subType.key"/></td>
				<td align="center">数量：</td>
				<td><s:property value="order.amount"/></td>
			</tr>
			<tr>
				<td align="center">元器件等级：</td>
				<td><s:property value="order.grade"/></td>
				<td align="center">生产编号：</td>
				<td><s:property value="order.productionCode"/></td>
			</tr>
			<tr>
				<td align="center">开始时间：</td>
				<td><s:date name="order.startTime" format="yyyy-MM-dd"/></td>
				<td align="center">计划交付时间：</td>
				<td><s:date name="order.planDelivery" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center">生产单位：</td>
				<td><s:property value="order.productionUnit"/></td>
				<td align="center">单机主管：</td>
				<td><s:property value="order.singleHead.name"/></td>
			</tr>
			<tr>
				<td align="center">产品保证：</td>
				<td><s:property value="order.productManager.name"/></td>
				<td align="center">质量管理：</td>
				<td><s:property value="order.qualityManager.name"/></td>
			</tr>
			<tr>
				<td align="center">计划管理：</td>
				<td><s:property value="order.planManager.name"/></td>
				<td align="center">结构主管：</td>
				<td><s:property value="order.structureHeadName"/></td>
			<tr>
			<tr>
				<td align="center">工艺主管：</td>
				<td><s:property value="order.processSupervisorName"/></td>
				<td align="center">审批人：</td>
				<td><s:property value="order.auditorName"/></td>

			</tr>
		</table>		
	</fieldset>
	
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td  width="30%" align="center">审批结论：</td>
				<td width="70%">
					<span class="required">
						<input type="radio" name="approve.resultCn" value="同意">同意&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="订单修改">修改订单&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="废弃">废弃</td>
					</span>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="approve.comments" style="width: 90%;" rows="10" cols=""></textarea></td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>