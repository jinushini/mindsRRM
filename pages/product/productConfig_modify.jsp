<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../product/productConfig!modify.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="config.id" hidden="hidden" value="<s:property value="config.id"/>"/>
	<div class="pageFormContent" layoutH="56"><br/>
	<fieldset>
		<legend>修改类目</legend>
		<table bproduct="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">名称：</td>
				<td><input type="text" name="config.key" value="<s:property value="config.key"/>"></td>
			</tr>
			<tr>
				<td align="center">描述：</td>
				<td><input type="text" name="config.value" value="<s:property value="config.value"/>"></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../product/productConfig!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>