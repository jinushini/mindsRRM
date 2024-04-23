<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
</script>
<div class="pageContent">
  <form class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend style="color:red; font-size:20px"><s:property value="productOrder.code"/></legend>
		<table bproductOrder="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" style="font-weight: bold;">产品代号：</td>
				<td><s:property value="productOrder.code"/></td>
				<td align="center" style="font-weight: bold;">产品名称：</td>
				<td><s:property value="productOrder.name"/></td>
			</tr>
			<tr>
				
				<s:if test="productOrder.productLib != null">
					<td align="center" style="font-weight: bold;">型号代号：</td>
					<td><s:property value="productOrder.productLib.modelCode"/></td>
					<td align="center" style="font-weight: bold;">型号名称：</td>
					<td><s:property value="productOrder.productLib.modelName"/></td>
				</s:if>
				<s:else>
					<td align="center" style="font-weight: bold;">所属项目：</td>
					<td><s:property value="productOrder.libCode"/></td>
				</s:else>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品代号：</td>
				<td><s:property value="productOrder.selProdType"/></td>
				<td align="center" style="font-weight: bold;">MES代号：</td>
				<td><s:property value="productOrder.MESCode"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">数量：</td>
				<td><s:property value="productOrder.orderNum"/></td>
				<td align="center" style="font-weight: bold;">研制阶段：</td>
				<td><s:property value="productOrder.phase"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">研制模式：</td>
				<td><s:property value="productOrder.researchingMode"/></td>
				<td align="center" style="font-weight: bold;">设计主管：</td>
				<td><s:property value="productOrder.singleHead.name"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单号：</td>
				<td><s:property value="productOrder.orderCode"/></td>
				<td align="center" style="font-weight: bold;">计划管理：</td>
				<td><s:property value="productOrder.planManager.name"/></td>
			<tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单完成形式：</td>
				<td><s:property value="productOrder.completeTarget"/></td>
				<td align="center" style="font-weight: bold;">产品种类：</td>
				<td><s:property value="productOrder.category"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">分院考核计划开始时间：</td>
				<td><s:date name="productOrder.scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
				<td align="center" style="font-weight: bold;">分院考核计划完成时间：</td>
				<td><s:date name="productOrder.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">实际开始时间：</td>
				<td><s:date name="productOrder.scheduleDate.actualBeginDate" format="yyyy-MM-dd"/></td>
				<td align="center" style="font-weight: bold;">实际完成时间：</td>
				<td><s:date name="productOrder.scheduleDate.actualEndDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">交付情况：</td>
				<td><s:property value="productOrder.deliveryState"/></td>
				<td align="center" style="font-weight: bold;">最新计划交付时间：</td>
				<td><s:date name="productOrder.currentDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">当前研制阶段：</td>
				<td><s:property value="productOrder.currentPhase"/></td>
				<td align="center" style="font-weight: bold;">当前存在问题：</td>
				<td><s:property value="productOrder.currentIssue"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">专业分类：</td>
				<td><s:property value="productOrder.currentPhase"/></td>
				<td align="center" style="font-weight: bold;">产品种类：</td>
				<td><s:property value="productOrder.category"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">选用类型：</td>
				<td><s:property value="productOrder.selectType"/></td>
				<td align="center" style="font-weight: bold;">微波模块：</td>
				<td><s:property value="productOrder.modelNum"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">成熟度：</td>
				<td><s:property value="productOrder.maturity"/></td>
				<td align="center" style="font-weight: bold;">订单年度：</td>
				<td><s:property value="productOrder.orderYear"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">责任单位：</td>
				<td><s:property value="productOrder.productionUnit"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">用户单位：</td>
				<td><s:property value="productOrder.userUnit"/></td>
				<td align="center" style="font-weight: bold;">用户单位责任人：</td>
				<td><s:property value="productOrder.userUnitUser"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">任务来源：</td>
				<td><s:property value="productOrder.taskSource"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">单机设计：</td>
				<td><s:date name="productOrder.designDate" format="yyyy-MM-dd"/></td>
				<td align="center" style="font-weight: bold;" >结构件加工：</td>
				<td><s:date name="productOrder.structuralDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件齐套：</td>
				<td><s:date name="productOrder.componentsDate" format="yyyy-MM-dd"/></td>
				<td align="center" style="font-weight: bold;">模块齐套：</td>
				<td><s:date name="productOrder.modelDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">整机装调：</td>
				<td><s:date name="productOrder.machineDate" format="yyyy-MM-dd"/></td>
				<td align="center" style="font-weight: bold;">测试实验：</td>
				<td><s:date name="productOrder.testDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">单机交付：</td>
				<td><s:date name="productOrder.deliveryDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">投产方式：</td>
				<td><s:property value="productOrder.produceMode"/></td>
				<td align="center" style="font-weight: bold;">投产数量：</td>
				<td><s:property value="productOrder.produceNum"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件等级：</td>
				<td><s:property value="productOrder.componentLevel"/></td>
				<td align="center" style="font-weight: bold;">指令方式：</td>
				<td><s:property value="productOrder.instructionMode"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品类别：</td>
				<td><s:property value="productOrder.subType"/></td>
			</tr>
		</table>		
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul>
			<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>