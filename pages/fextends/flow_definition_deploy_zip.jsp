<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../fextends/flowDeploy!deployByZip.action" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<!-- <tr>
				<td align="center">流程名称：</td>
				<td><input name="flowDefinitionName" class="required"> </td>
			</tr> -->
			<tr>
				<td align="center">流程文件：</td>
				<td><input type="file" id="flowDefinition" name="flowDefinition" class="required"> </td>
			</tr>
			<tr>
				<td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
				<td width="70%">
						<%-- <span class="required">
							<input type="radio" name="options" value="是">是&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="option" value="否" checked="checked">否
						</span> --%>
						<select name="options" class="required">
								<option value="common">通用</option>
								<option value="sub">子流程</option>
								<option value="parent">父流程</option>								
							</select>
					</td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">部署</button></div></div></li>
			<li><a class="button" href="../fextends/flowDefined!queryLatestVersion.action" target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>