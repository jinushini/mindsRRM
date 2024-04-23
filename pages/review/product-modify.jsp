<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../review/Product_modifyProduct.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="product.id" hidden="hidden" value="<s:property value="product.id"/>"/>
	<div class="pageFormContent" layoutH="56"><br/>
	<fieldset>
		<legend>修改产品表</legend>
		<table bproduct="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<td><input type="text" name="product.modelCode" value="<s:property value="product.modelCode"/>"></td>
				<td align="center">分系统：</td>
				<td><input type="text" name="product.modelName" value="<s:property value="product.modelName"/>"></td>
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><input type="text" name="product.productCode" value="<s:property value="product.productCode"/>"></td>
				<td align="center">产品名称：</td>
				<td><input type="text" name="product.productName" value="<s:property value="product.productName"/>"></td>
			</tr>
			<tr>
				<td align="center">产品类别：</td>
				<td><input type="text" name="product.type" value="<s:property value="product.type"/>"></td>
				<td align="center">生产编号：</td>
				<td><input type="text" name="product.productionCode" value="<s:property value="product.productionCode"/>"></td>
			</tr>			
			<tr>
				<td align="center">生产单位：</td>
				<td><input type="text" name="product.productionUnit" value="<s:property value="product.productionUnit"/>"></td>
				<td align="center">单机主管：</td>
				<td colspan="1">
					<input name="product.singleHead.id" type="hidden" class="required" value="<s:property value="product.singleHead.id"/>">
					<input name="product.singleHead.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly" value="<s:property value="product.singleHead.name"/>">
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