<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form method="post" action=""  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务详情</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<%-- <td width="20%" align="center">归属名称：</td>
				<td width="30%" ><s:property value="dispatch.taskSource"/> </td> --%>

				<td width="20%" align="center">任务名称：</td>
				<td width="30%" style="word-wrap:break-word;word-break:break-all;"><s:property value="dispatch.taskName"/> </td>
				<td width="20%"align="center">任务来源：</td>
				<td width="30%" style="word-wrap:break-word;word-break:break-all;">
					<s:if test="dispatch.referenceLink != null">
						<a href="<s:property value="dispatch.referenceLink"/>" target='dialog' width='900' height='700' rel="show" title="详情"><s:property value="dispatch.taskType"/></a>
					</s:if>
					<s:else>
						<s:property value="dispatch.taskType"/>
					</s:else>
				
				</td>
			</tr>
			<tr>
				<td width="20%"align="center">任务详情：</td>
				<td width="30%" colspan="3"><s:property value="dispatch.taskDefinitionStr" escape="false"/></td>
			</tr>
			
			<tr>
				<td align="center">截止日期：</td>
				<td><s:date name="dispatch.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>	

				<td align="center">完成时间：</td>
				<td><s:date name="dispatch.feedbackDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center">责任人：</td>
				<td><s:property value="dispatch.receiveUser != null ? dispatch.receiveUser.name : dispatch.receiveUserName"/></td>
				<td align="center">完成状态：</td>
				<td <s:if test="dispatch.feedbackState == 1">style="color:green;" </s:if><s:else>style="color:red;"</s:else>>
					<s:property value="dispatch.feedbackState == 1?'完成':'未完成'"/>
				</td>
			</tr>
			
			<%-- <tr>
				<td align="center" rowspan="">相关文档：</td>
				<td>
					<s:iterator value="map" status="st" id="i">
						<div style="float:left;margin:0 5px;clear:both;">
							<a href="<s:property value="key"/>" style="color:green"><s:property value="value"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
						</div><br/>
					</s:iterator>
				</td>
			</tr> --%>
			<tr>
				<td align="center" rowspan="">相关文档：</td>				
				<td colspan="3">
				<s:iterator value="fileList" status="st">
					<div style="float:left;margin:0 5px;clear:both;">
						<a href="<s:property value="filePath"/>" download="<s:property value='taskFileName' />" style="color:green"><s:property value="taskFileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
					</div><br/>
				</s:iterator>
				</td>				
			</tr>
			<tr>
				<td align="center" colspan="1">反馈信息：</td>
				<td colspan="3">
					<%-- <iframe frameborder="0" id="feedbackIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
						<s:property value="dispatch.feedbackInfo" escape="false"/>
					</iframe>
					<div id="feedbackDiv" style="display: none;"><s:property value="dispatch.feedbackInfo" escape="false"/></div> --%> 
					<div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatch.feedbackInfoStr" escape="false"/></div>
				</td>
			</tr>
			</table>
		</fieldset>
		<fieldset <s:if test="dispatch.needApprove == 2">style="display:none;"</s:if>>
			<legend>审批信息</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center" rowspan="">审&nbsp;批&nbsp;人：</td>	
					<td><s:property value="approve.taskName == '反馈任务' ? dispatch.auditor.name : approve.userName"/></td>
					<td align="center" rowspan="">审批结论：</td>	
					<td <s:if test="approve.resultCn == 不通过">style="color:red;" </s:if><s:else>style="color:green;"</s:else>>			
					<s:property value="approve.resultCn"/>
				</td>
				</tr>
				<tr>
					<td align="center" colspan="1">审批意见：</td>	
					<td colspan="3">
					<div style="clear:both;line-height:20px;height: auto;"><s:property value="approve.comments" escape="false"/></div>
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