<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../order/order!startOrderProcess.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	<input type="hidden" name="order.id" value="<s:property value="order.id"/>">
	<input type="hidden" id="result" name="approve.result" value="">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:if test="order.id != null">订单完善</s:if><s:else>订单录入</s:else></legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<!-- <td><input type="text" name="order.typeCode"></td> -->
				<td align="center">
					<select name="order.productLib.id">
						<s:iterator value="modelList">
							<option value="<s:property value="id"/>" <s:if test="id == order.productLib.id">selected="selected"</s:if>><s:property value="modelCode"/></option>
						</s:iterator>
					</select>
				</td>
				<!-- <td align="center">型号名称：</td>
				<td><input type="text" name="order.typeName"></td> -->
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><input type="text" name="order.productCode" value='<s:property value="order.productCode"/>'></td>
				<td align="center">产品名称：</td>
				<td><input type="text" name="order.productName" value='<s:property value="order.productName"/>'></td>
			</tr>
			<tr>
				<td align="center">去型号化代号：</td>
				<td><input type="text" name="order.code" value='<s:property value="order.code"/>'></td>
				<td align="center">阶段：</td>
				<td><input type="text" name="order.stage" value='<s:property value="order.stage"/>'></td>
			</tr>
			<tr>
				<td align="center">产品种类：</td>
				<!-- <td><input type="text" name="order.type"></td> -->
				<td align="center">
					<select name="order.subType.id">
						<s:iterator value="classlist">
							<option value="<s:property value="id"/>" <s:if test="id == order.subType.id">selected</s:if>><s:property value="key"/></option>
						</s:iterator>
					</select>
				</td>
				<td align="center">数量：</td>
				<td><input type="text" name="order.amount" value='<s:property value="order.amount"/>'></td>
			</tr>
			<tr>
				<td align="center">元器件等级：</td>
				<td><input type="text" name="order.grade" value='<s:property value="order.grade"/>'></td>
				<td align="center">生产编号：</td>
				<td><input type="text" name="order.productionCode" value='<s:property value="order.productionCode"/>'></td>
			</tr>
			<tr>
				<td align="center">开始时间：</td>
				<td ><input name="order.startTime" readonly="readonly" class="startDate" value='<s:date name="order.startTime" format="yyyy-MM-dd" />' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').focus();} })" type="text"></td>
				<td align="center">计划交付时间：</td>
				<td ><input name="order.planDelivery" readonly="readonly" class="endDate" value="<s:date name="order.planDelivery" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();} })" type="text"></td>
			</tr>
			<tr>
				<td align="center">生产单位：</td>
				<td><input type="text" name="order.productionUnit" value='<s:property value="order.productionUnit"/>'></td>
				<td align="center">单机主管：</td>
				<td colspan="1">
					<input name="order.singleHead.id" type="hidden" class="required" value='<s:property value="order.singleHead.id"/>'>
					<input name="order.singleHead.name" type="text" class="required" value='<s:property value="order.singleHead.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">产品保证：</td>
				<td colspan="1">
					<input name="order.productManager.id" type="hidden" class="required" value='<s:property value="order.productManager.id"/>'>
					<input name="order.productManager.name" type="text" class="required" value='<s:property value="order.productManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">质量管理：</td>
				<td colspan="1">
					<input name="order.qualityManager.id" type="hidden" class="required" value='<s:property value="order.qualityManager.id"/>'>
					<input name="order.qualityManager.name" type="text" class="required" value='<s:property value="order.qualityManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">计划管理：</td>
				<td colspan="1">
					<input name="order.planManager.id" type="hidden" class="required" value='<s:property value="order.planManager.id"/>'>
					<input name="order.planManager.name" type="text" class="required" value='<s:property value="order.planManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">结构主管：</td>
				<td colspan="1">
					<input name="order.structureHeadId" type="hidden" class="required" value='<s:property value="order.structureHeadId"/>'>
					<input name="order.structureHeadName" type="text" value='<s:property value="order.structureHeadName"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">工艺主管：</td>
				<td colspan="1">
					<input name="order.processSupervisorId" type="hidden" value='<s:property value="order.processSupervisorId"/>'>
					<input name="order.processSupervisorName" type="text" value='<s:property value="order.processSupervisorName"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">审批人：</td>
				<td colspan="1">
					<input name="order.auditorId" type="hidden" class="required" value='<s:property value="order.auditorId"/>'>
					<input name="order.auditorName" type="text" class="required" value='<s:property value="order.auditorName"/>' onclick="$(this).next().click()" readonly="readonly">
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
			<%-- <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab" rel="currentNavTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>