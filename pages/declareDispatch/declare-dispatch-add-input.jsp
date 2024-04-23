<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action='../declareDispatch/DeclareDispatch_addDeclareDispatch.action' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input type="hidden" name="declareDispatch.productOrder.id" value="<s:property value='num'/>" />
	<input type="hidden" name="declareDispatch.subType" value="<s:property value='data'/>" /> 
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>人员选择</legend>
		<table bssaps="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">申报人：</td>
				<td colspan="1">
					<input name="declareDispatch.declareUserIds" type="hidden" class="required" value="<s:property value='productOrder.singleHead.id'/>"  >
					<input name="declareDispatch.declareUserNames" type="text" class="required" onclick="$(this).next().click()" readonly="readonly" value="<s:property value='productOrder.singleHead.name'/>" >
					<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
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