<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
</script>
<div class="pageContent">
  <form class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend style="color:red; font-size:20px"><s:property value="order.typeCode"/></legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">型号代号：</td>
				<td><s:property value="order.typeCode"/></td>
				<td align="center">型号名称：</td>
				<td><s:property value="order.typeName"/></td>
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
				<td><s:property value="order.type"/></td>
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
				<td><s:date name="order.beginDate" format="yyyy-MM-dd"/></td>
				<td align="center">完成时间：</td>
				<td><s:date name="order.completeDate" format="yyyy-MM-dd"/></td>
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
				<td><s:property value="order.auditor.name"/></td>
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