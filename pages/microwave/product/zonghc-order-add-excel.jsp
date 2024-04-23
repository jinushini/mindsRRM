<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action="../microwave/product_ProductOrder_importExcelZonghc_zonghc-order-list.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>订单导入<span style="color : red;">请使用系统提供的excel订单录入模板</span></legend>
		<table border="0" width="98%" class="edit_table" width="98%" style="margin:5px auto;">
			<tr>
				<td style="font-size: 20px;text-align: right;width: 30%;">对应处室</td>
				<td style="font-size: 20px;color:red;">微波所综合管理处</td>
			</tr>
			<tr>
				<td style="text-align: right;">上传Excel文件</td>
				<td><input type="file" name="filesource" /></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li> -->
		</ul>			
	</div>
   </form>
</div>