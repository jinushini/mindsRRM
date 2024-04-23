<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../product/productConfigEditer!add.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	<input type="hidden" name="config.productConfig.id" value="<s:property value='parentId'/>"/>
		<br/>
	<fieldset>
		<legend>新增类目</legend>
		<table width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" >名称：</td>
				<td><input type="text" name="config.key" class="required"></td>
			</tr>
			<tr>
				<td align="center">描述：</td>
				<td><input type="text" name="config.value"></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../product/productConfigEditer!showList.action?parentId=<s:property value='parentId'/>"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>