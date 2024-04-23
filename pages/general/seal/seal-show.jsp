<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	var s=jd("#contentDiv").html();
	
	jd("#contentIframe")[0].contentWindow.document.write(s);
</script>
<div class="pageContent">
  <form method="post" action=""  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56" width="80%">
		<br/>
	<fieldset>
		<legend><s:property value='item.name'/>详情</legend>
		<table border="0" width="95%" class="edit_table" align="center">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">事项名称：</td>
				<td><s:property value='item.name'/></td>
				<td align="center" style="font-weight: bold;">事项要求：</td>
				<td><s:property value='item.demand'/></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">完成目标：</td>
				<td><s:property value='item.target'/></td>
				<td align="center" style="font-weight: bold;">年度：</td>
				<td><s:property value='item.years'/></td>
			</tr>
			<tr>
				<%-- <td align="center" style="font-weight: bold;">提前提醒时间：</td>
				<td><s:property value='item.ahead'/></td> --%>
				<td align="center" style="font-weight: bold;">事项来源：</td>
				<td>
					<s:property value='item.source'/>
				</td>
			<!-- </tr>
			<tr> -->
				<td align="center" style="font-weight: bold;">责任人：</td>
				<td>
					<s:property value='item.receiverNames'/>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">是否需要审批环节：</td>
				<td>
					<s:property value="item.needApprove == 1 ? '是' : '否'"/>
				</td>
			</tr>
			
			<tr>
				<td style="font-weight: bold;" colspan="4">事项描述：</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 400px;">
					<iframe frameborder="0" id="contentIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					</iframe>
					<div id="contentDiv" style="display:none;"><s:property value="item.contentStr" escape="false"/></div>
				</td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认</button></div></div></li> -->
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>