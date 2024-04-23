<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form action="../fextends/ImportRecords_importRecords.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend></legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="20%">完整类名</th>
						<th width="10%">记录数（纯数字）</th>
						
					</tr>
				</thead>
				<tbody id="itemList">
					<tr>
						<td align="center"><input name="name" value="" style="width:90%;" class="required"></td>
						<td align="center">
							<input type="text" name="records" type="hidden" class="required" onkeyup = "value=value.replace(/[^\d]/g,'')"/>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>