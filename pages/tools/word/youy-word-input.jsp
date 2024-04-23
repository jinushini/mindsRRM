<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action="../tools/word_WordDataDeal_exportDealWord.action" class="pageForm required-validate" >
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>有源模块测试数据按规则排序</legend>
		<table border="0" width="98%" class="edit_table" width="98%" style="margin:5px auto;">
			<tr>
				<td style="font-size: 20px;text-align: right;width: 30%;">功能</td>
				<td style="font-size: 20px;color:red;">微波有源模块测试单据比对排序</td>
			</tr>
			<tr>
				<td style="text-align: right;">上传Word源文件</td>
				<td><input type="file" name="fileA" /></td>
			</tr>
			<tr>
				<td style="text-align: right;">上传对比数据的Excel文件</td>
				<td><input type="file" name="fileB" /></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>