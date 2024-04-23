<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" action='../microwave/product_Delivery_addDeliveryDispatch.action' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input type="hidden" name="delivery.productOrder.id" value="<s:property value='num'/>" />
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>人员选择</legend>
		<table bssaps="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">执行人：</td>
				<td colspan="1">
					<input type="hidden" class="required" name="delivery.receiveUser.id" value="<s:property value='productOrder.singleHead.id'/>">
					<input type="text" class="required" name="delivery.receiveUser.name" readonly="readonly" onclick="$(this).next().click()" value="<s:property value='productOrder.singleHead.name'/>">
					<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
					</a>
				</td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>