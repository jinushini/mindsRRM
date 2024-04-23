<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//提交按钮
	jd("#submit").click(function(){
		/* jd("#cancelBtn").click(); */
	})
</script>
<div class="pageContent">
  <form method="post" action="../microwave/product_ProductOrderRecord_addRecord_zonghc-order-list.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="productOrderId" value="<s:property value="id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>更新进度<h7 style="color : red;">（当且仅当登录用户为该产品计划主管时，才能更新生效）</h7></legend>
		<table width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">当前研制阶段：</td>
				<td>
					<select name="productOrderRecord.currentState">
						<option value="未开始">未开始</option>
						<option value="产品设计">产品设计</option>
						<option value="生产准备">生产准备</option>
						<option value="产品装调">产品装调</option>
						<option value="测试试验">测试试验</option>
						<option value="待交付">待交付</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td align="center">最新计划交付时间：</td>
				<td><input name="productOrderRecord.latestDeliveryPD" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center">当前存在问题：</td>
				<td>
					<textarea name="productOrderRecord.currentIssue" cols="70" rows="5" maxlength="100"> </textarea>
				</td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>