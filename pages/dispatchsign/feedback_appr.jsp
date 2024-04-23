<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
/* var s=jn("#feedbackDiv").html();
	
	jn("#feedbackIframe")[0].contentWindow.document.write(s); */ 
</script>
<div class="pageContent">
  <form method="post" action="../dispatchSign/dispatchSignAppr!appr.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务处理----任务反馈审核</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td width="30%" align="center">任务名称：</td>
				<td width="70%" colspan="2"><s:property value="dispatch.taskType"/> </td>
			</tr>
			<tr>
				<td align="center">子任务名称：</td>
				<td colspan="2"><s:property value="dispatch.taskName"/></td>
			</tr>
			<tr><td align="center" width="15%">截止日期：</td>
				<td><s:date name="dispatch.limdat" format="yyyy-MM-dd"/></td>	
			</tr>
			<tr>
				<td align="center">完成时间：</td>
				<td colspan="2"><s:date name="dispatch.feedbackDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center">反馈人：</td>
				<td colspan="2"><s:property value="dispatch.receiveUser.name"/></td>
			</tr>
			<tr>
				<td align="center">完成状态：</td>
				<td colspan="2" <s:if test="dispatch.feedbackState == 0">style="color:red;" </s:if><s:else>style="color:green;"</s:else>>
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
				<td>
				<s:iterator value="fileList" status="st">
					<div style="float:left;margin:0 5px;clear:both;">
						<a href="<s:property value='filePath'/>" download="<s:property value='taskFileName' />" style="color:green"><s:property value="taskFileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
					</div><br/>
				</s:iterator>
				</td>				
			</tr>
			<tr>
				<td colspan="3" style="color: red;">反馈信息：</td>
			</tr>
			<tr>
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
	
	<fieldset>
		<legend>任务处理</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td  width="30%" align="center">审批结论：</td>
				<td width="70%">
					<span class="required">
						<input type="radio" name="approve.resultCn" value="通过">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过"/>不通过
					</span>
				</td>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="approve.comments" style="width: 90%;" rows="10" cols=""></textarea></td>
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