<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
</script>
<div class="pageContent">
  <form class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="productOrderId" value="<s:property value="productOrderId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend style="color:red; font-size:20px">最新进度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="../microwave/product_ProductOrderRecord_showList_order-record-list.action?productOrderId=<s:property value="productOrderId"/>" style="color : green;" target="dialog" rel="record_hi"width="750" height="400">历史记录</a></legend>
		<table bproductOrder="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">最新计划交付时间：</td>
				<td><s:date name="productOrderRecord.currentDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center">当前研制阶段：</td>
				<td><s:property value="productOrderRecord.currentPhase"/></td>
			</tr>
			<tr>
				<td align="center">处理人：</td>
				<td><s:property value="productOrderRecord.operator.name"/></td>
			</tr>
			<tr>
				<td align="center">当前存在问题：</td>
				<td><textarea readonly="readonly" rows="5" cols="60"><s:property value="productOrderRecord.currentIssue"/></textarea></td>
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