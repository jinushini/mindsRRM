<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
var s=jn("#actualContentDiv").html();
	
	jn("#actualContentIframe")[0].contentWindow.document.write(s); 
</script>
<div class="pageContent">
  <form method="post" action="../general/timed_DispatchPlanAppr_approve.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="dispatchPlan.id" type="hidden" value="<s:property value="dispatchPlan.id"/>">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务详情</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td width="10%" align="center">任务名称：</td>
				<td width="40%"><s:property value="dispatchPlan.item.name"/></td>
				<td align="center" width="15%">任务来源：</td>
				<td>
					<s:property value="dispatchPlan.item.source" />
				</td>
			</tr>
			<tr>
				<td align="center" colspan="1">任务描述：</td>
				<td colspan="4">
					<div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatchPlan.planContentStr == null ? dispatchPlan.item.contentClobStr : dispatchPlan.planContentStr" escape="false"/></div>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">截止日期：</td>
				<td><s:date name="dispatchPlan.deadline" format="yyyy-MM-dd"/></td>		
			</tr>
			<%-- <tr>
				<td align="center">反馈人：</td>
				<td><s:property value="dispatchPlan.receiveUser.name"/></td>
				<td align="center">完成状态：</td>
				<td <s:if test="dispatchPlan.feedbackState == 0">style="color:red;" </s:if><s:else>style="color:green;"</s:else>>
					<s:property value="dispatchPlan.feedbackState == 1?'完成':'未完成'"/>
				</td>
			</tr> --%>
			
			<tr>
				<td align="center" rowspan="">相关文档：</td>				
				<td colspan="3">
				<s:iterator value="fileList" status="st">
					<div style="float:left;margin:0 5px;clear:both;">
						<a href="<s:property value="filePath"/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
					</div><br/>
				</s:iterator>
				</td>				
			</tr>
			<tr>
				<td colspan="1" style="color: red;" align="center">反馈信息：</td>
				<td colspan="3" style="height: 300px;">
					<iframe frameborder="0" id="actualContentIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					</iframe>
					<div id="actualContentDiv" style="display: none;"><s:property value="dispatchPlan.actualContentStr" escape="false"/></div> 
					<%-- <div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatchPlan.feedbackInfoStr" escape="false"/></div> --%>
				</td>
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