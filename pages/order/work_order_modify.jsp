<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../order/orderAppr!updateOrder.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="order.id" value="<s:property value="order.id"/>">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="order.processInstId" type="hidden" value="<s:property value="order.processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<td>
					<%-- <input type="text" name="order.productLib.modelCode" value="<s:property value="order.productLib.modelCode" />"> --%>
					<select name="order.productLib.id">
						<s:iterator value="modelList">
							<option value="<s:property value="id"/>" <s:if test="id == order.productLib.id">selected="selected"</s:if>><s:property value="modelCode"/></option>
						</s:iterator>
					</select>
				</td>
				<%-- <td align="center" width="15%">型号名称：</td>
				<td><input type="text" name="order.productLib.modelName" value="<s:property value="order.productLib.modelName" />"></td> --%>
			</tr>
			<tr>
				<td align="center" width="15%">产品代号：</td>
				<td><input type="text" name="order.productCode" value="<s:property value="order.productCode" />"></td>
				<td align="center" width="15%">产品名称：</td>
				<td><input type="text" name="order.productName" value="<s:property value="order.productName" />"></td>
			</tr>
			<tr>
				<td align="center" width="15%">去型号化代号：</td>
				<td><input type="text" name="order.code" value="<s:property value="order.code" />"></td>
				<td align="center" width="15%">阶段：</td>
				<td><input type="text" name="order.stage" value="<s:property value="order.stage" />"></td>
			</tr>
			<tr>
				<td align="center" width="15%">产品种类：</td>
				<td>
					<%-- <input type="text" name="order.subType.key" value="<s:property value="order.subType.key" />"> --%>
					<select name="order.subType.id">
						<s:iterator value="classlist">
							<option value="<s:property value="id"/>" <s:if test="id == order.subType.id">selected="selected"</s:if>><s:property value="key"/></option>
						</s:iterator>
					</select>
				</td>
				<td align="center" width="15%">数量：</td>
				<td><input type="text" name="order.amount" value="<s:property value="order.amount" />"></td>
			</tr>
			<tr>
				<td align="center" width="15%">元器件等级：</td>
				<td><input type="text" name="order.grade" value="<s:property value="order.grade" />"></td>
				<td align="center" width="15%">生产编号：</td>
				<td><input type="text" name="order.productionCode" value="<s:property value="order.productionCode" />"></td>
			</tr>
			<tr>
				<td align="center" width="15%">开始时间：</td>
				<td ><input name="order.startTime" readonly="readonly" class="startDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').focus();} })" type="text" value="<s:date name="order.startTime" format="yyyy-MM-dd"/>"></td>
				<td align="center" width="15%">计划交付时间：</td>
				<td ><input name="order.planDelivery" readonly="readonly" class="endDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();} })" type="text" value="<s:date name="order.planDelivery" format="yyyy-MM-dd"/>"></td>
			</tr>
			<tr>
				<td align="center" width="15%">生产单位：</td>
				<td><input type="text" name="order.productionUnit" value="<s:property value="order.productionUnit" />"></td>
				<td align="center" width="15%">单机主管：</td>
				<td colspan="1">
					<input name="order.singleHead.id" type="hidden" value="<s:property value="order.singleHead.id" />">
					<input name="order.singleHead.name" type="text" value="<s:property value="order.singleHead.name" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">产品保证：</td>
				<td colspan="1">
					<input name="order.productManager.id" type="hidden" value="<s:property value="order.productManager.id" />">
					<input name="order.productManager.name" type="text" value="<s:property value="order.productManager.name" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center" width="15%">质量管理：</td>
				<td colspan="1">
					<input name="order.qualityManager.id" type="hidden" value="<s:property value="order.qualityManager.id" />">
					<input name="order.qualityManager.name" type="text" value="<s:property value="order.qualityManager.name" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">计划管理：</td>
				<td colspan="1">
					<input name="order.planManager.id" type="hidden" value="<s:property value="order.planManager.id" />">
					<input name="order.planManager.name" type="text" value="<s:property value="order.planManager.name" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">结构主管：</td>
				<td colspan="1">
					<input name="order.structureHeadId" type="hidden" value="<s:property value="order.structureHeadId" />">
					<input name="order.structureHeadName" type="text" value="<s:property value="order.structureHeadName" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">工艺主管：</td>
				<td colspan="1">
					<input name="order.processSupervisorId" type="hidden" value="<s:property value="order.processSupervisorId" />">
					<input name="order.processSupervisorName" type="text" value="<s:property value="order.processSupervisorName" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center" width="15%">审批人：</td>
				<td colspan="3">
					<input name="order.auditorId" type="hidden" value="<s:property value="order.auditorId" />">
					<input name="order.auditorName" type="text" value="<s:property value="order.auditorName" />" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>