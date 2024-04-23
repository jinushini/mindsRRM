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
				<td align="center" style="font-weight: bold;">设备代号：</td>
				<td><s:property value="productOrder.code"/></td>
				<td align="center" style="font-weight: bold;">设备名称：</td>
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
				<td align="center" style="font-weight: bold;">图纸代号：</td>
				<td><s:property value="productOrder.selProdCode"/></td>
				<td align="center" style="font-weight: bold;">MES系统生产编号：</td>
				<td><s:property value="productOrder.mesCode"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单数量：</td>
				<td><s:property value="productOrder.orderNum"/></td>
				<td align="center" style="font-weight: bold;">研制阶段：</td>
				<td><s:property value="productOrder.phase"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">研制模式：</td>
				<td><s:property value="productOrder.researchMode"/></td>
				<td align="center" style="font-weight: bold;">主管设计师：</td>
				<td><s:property value="productOrder.singleHead.name"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">合同编号：</td>
				<td><s:property value="productOrder.orderCode"/></td>
				<td align="center" style="font-weight: bold;">计划管理：</td>
				<td><s:property value="productOrder.designPlanManager.name"/></td>
			<tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单完成形式：</td>
				<td><s:property value="productOrder.completeTarget"/></td>
				<td align="center" style="font-weight: bold;">任务来源：</td>
				<td><s:property value="productOrder.taskSource"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">分院考核计划开始时间：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.assessPlanBD.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.assessPlanBD" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.assessPlanBD" format="yyyy-MM-dd"/></td> --%>
				<td align="center" style="font-weight: bold;">分院考核计划完成时间：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.assessPlanED.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.assessPlanED" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.assessPlanED" format="yyyy-MM-dd"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">实际开始时间：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.actualBD.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.actualBD" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.actualBD" format="yyyy-MM-dd"/></td> --%>
				<td align="center" style="font-weight: bold;">实际完成时间：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.actualED.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.actualED" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.actualED" format="yyyy-MM-dd"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">交付情况：</td>
				<td><s:property value="productOrder.deliveryState"/></td>
				<td align="center" style="font-weight: bold;">最新计划交付时间：</td>
				<td><s:date name="productOrder.latestDeliveryPD" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">当前研制状态：</td>
				<td><s:property value="productOrder.currentState"/></td>
			<tr>
			</tr>
				<td align="center" style="font-weight: bold;">当前存在问题：</td>
				<td colspan="3"><s:property value="productOrder.currentIssue"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">专业分类：</td>
				<td><s:property value="productOrder.classification"/></td>
				<td align="center" style="font-weight: bold;">产品种类：</td>
				<td><s:property value="productOrder.category"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">选用类型：</td>
				<td><s:property value="productOrder.selectType"/></td>
				<%-- <td align="center" style="font-weight: bold;">模块数量：</td>
				<td><s:property value="productOrder.modelNum"/></td> --%>
			</tr>
			<tr>
				<%-- <td align="center" style="font-weight: bold;">成熟度：</td>
				<td><s:property value="productOrder.maturity"/></td> --%>
				<td align="center" style="font-weight: bold;">订单年度：</td>
				<td><s:property value="productOrder.orderYear"/></td>
			<!-- </tr>
			<tr> -->
				<td align="center" style="font-weight: bold;">责任部门：</td>
				<td><s:property value="productOrder.responsibleDept"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">用户单位：</td>
				<td><s:property value="productOrder.userUnit"/></td>
				<td align="center" style="font-weight: bold;">用户单位责任人：</td>
				<td><s:property value="productOrder.userUnitPIC"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品设计：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.designDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.designDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.designDate" format="yyyy-MM-dd"/></td> --%>
				<td align="center" style="font-weight: bold;" >结构件加工：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.structureDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.structureDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.structureDate" format="yyyy-MM-dd"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件齐套：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.yuanqjDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.yuanqjDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.yuanqjDate" format="yyyy-MM-dd"/></td> --%>
				<td align="center" style="font-weight: bold;">模块齐套：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.modelDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.modelDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.modelDate" format="yyyy-MM-dd"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品装调：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.machineDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.machineDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.machineDate" format="yyyy-MM-dd"/></td> --%>
				<td align="center" style="font-weight: bold;">测试试验：</td>
				<td>
					<s:if test="new java.util.Date().getYear()-productOrder.testDate.getYear()>19">已完成</s:if>
					<s:else><s:date name="productOrder.testDate" format="yyyy-MM-dd"/></s:else>
				</td>
				<%-- <td><s:date name="productOrder.testDate" format="yyyy-MM-dd"/></td> --%>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">投产方式：</td>
				<td><s:property value="productOrder.produceMode"/></td>
				<td align="center" style="font-weight: bold;">投产数量：</td>
				<td><s:property value="productOrder.produceNum"/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件等级：</td>
				<td><s:property value="productOrder.yuanqjLevel"/></td>
				<td align="center" style="font-weight: bold;">指令方式：</td>
				<td><s:property value="productOrder.instructionMode"/></td>
			</tr>
			<%-- <tr>
				<td align="center" style="font-weight: bold;">产品类别：</td>
				<td><s:property value="productOrder.subType"/></td>
			</tr> --%>
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