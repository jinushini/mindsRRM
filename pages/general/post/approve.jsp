<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../general/post_PostAppr_approve.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="id" type="hidden" value="<s:property value="post.id"/>">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务详情</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">任务来源：</td>
				<td>
					<s:property value="post.category" />
				</td>
			</tr>
			<tr>
				<td width="10%" align="center">任务名称：</td>
				<td width="40%"><a href="../general/post_Post_showDetails_post-show-<s:property value='post.template' />.action?id=<s:property value='post.id'/>" target="dialog" rel="" width="680" height="650"><s:property value="post.title"/></a></td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset>
		<legend>任务审核</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td  width="30%" align="center">审批结论：</td>
				<td width="70%">
					<span class="required">
						<input type="radio" name="result" value="0">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="result" value="1"/>不通过
					</span>
				</td>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="comments" style="width: 90%;" rows="5" cols=""></textarea></td>
			</tr>
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>