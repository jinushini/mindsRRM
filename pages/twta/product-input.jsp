<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" action="../twta/TwtaDebugProduct_addOrModify_product-list.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="twtaDebugProduct.id" value="<s:property value="twtaDebugProduct.id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新增产品</legend>
		<table width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="30%">投产编号：</td>
				<td><input type="text" name="twtaDebugProduct.productNum" value="<s:property value='twtaDebugProduct.productNum'/>" class="required"></td>
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