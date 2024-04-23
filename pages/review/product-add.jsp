<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../review/Product_addProduct.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新建复查产品</legend>
		<table width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<td hidden="hidden"><input type="hidden" name="xid" class="required" readonly="readonly"></td>
				<td>
					<input type="text" name="code" class="required" readonly="readonly" value="" suggestFileld="code,name,xid" suggestUrl="" lookupGroup="productLib" lookupPk="id" onclick="$(this).next().attr('href','../product/ProductLib_showList_productLib-list-dialog.action');$(this).next().click()">
					<a title="选择型号" class="model" href="###" lookupGroup="" lookupPk="id" target="dialog" width="1080" height="600" ></a>
				</td>
					
				<td align="center">分系统：</td>
				<td><input type="text" name="product.modelName"></td>
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><input type="text" name="product.productCode"></td>
				<td align="center">产品名称：</td>
				<td><input type="text" name="product.productName"></td>
			</tr>
			<tr>
				<td align="center">产品类别：</td>
				<td><input type="text" name="product.type"></td>
				<td align="center">生产编号：</td>
				<td><input type="text" name="product.productionCode"></td>
			</tr>			
			<tr>
				<td align="center">生产单位：</td>
				<td><input type="text" name="product.productionUnit"></td>
				<td align="center">单机主管：</td>
				<td colspan="1">
					<input name="product.singleHead.id" type="hidden" class="required">
					<input name="product.singleHead.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
				</td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../review/product!showProductList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>