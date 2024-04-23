<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
jd(function(){
	var s=jd("#feedbackDiv").html();
	jd("#feedbackIframe")[0].contentWindow.document.write(s); 
	
	jd("#okBtn").click(function(){
		var taskId = jd("input[name='taskId']").val();
		var processInstId = jd("input[name='processInstId']").val();
		var id = jd("input[name='id']").val();
		var resultCn = jd("input:radio[name='approve.resultCn']:checked").val();
		var comments = jd("textarea").val();
		$.ajax({
			global:false,
			async : false,
			type:'POST',
			dataType : 'json',
			url : '../dispatch/DispatchItem_apprInDialog.action',
			data : {
				taskId:taskId,
				resultCn:resultCn,
				comments:comments
			},
			success : function(data, statusText){
				jn("#"+id).find(".status").removeAttr("style");
				if(data.message==5){
					jn("#"+id).find(".status").text("已完成");
					jn("#"+id).find(".status").attr("style","color:green;");
				}else if(data.message==1){
					jn("#"+id).find(".status").text("待反馈");
					jn("#"+id).find(".status").attr("style","color:red;");
				}
				jn("#"+id).find(".appr").attr("style","display:none;");
				jd("#cancelBtn").click();
			}
		})
	}) 
	
})
</script>
<div class="pageContent">
  <!-- <form method="post" action="../dispatch/DispatchAppr_apprInDialog_meetingTrack.action" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);"> -->
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<input name="id" type="hidden" value="<s:property value="dispatch.id"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务详情</legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td width="10%" align="center">任务名称：</td>
				<td width="40%"><s:property value="dispatch.taskName"/></td>
				<td align="center" width="10%">任务归属：</td>
				<td width="40%">
					<s:if test='dispatch.referenceLink != null'>
						<a href="<s:property value='dispatch.referenceLink'/>" height="450" width="850" target="dialog" title="<s:property value='dispatch.taskType' />" style="color:green;"><s:property value="dispatch.taskType" /></a>
					</s:if>
					<s:else>
						<s:property value="dispatch.taskType" />
					</s:else>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="1">任务描述：</td>
				<td colspan="4">
					<div style="clear:both;line-height:20px;"><s:property value="dispatch.taskDefinitionStr" escape="false"/></div>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">截止日期：</td>
				<td width="30%"><s:date name="dispatch.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>	
				<td align="center">完成时间：</td>
				<td><s:date name="dispatch.feedbackDate" format="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="center">反馈人：</td>
				<td><s:property value="dispatch.receiveUser.name"/></td>
				<td align="center">完成状态：</td>
				<td <s:if test="dispatch.feedbackState == 0">style="color:red;" </s:if><s:else>style="color:green;"</s:else>>
					<s:property value="dispatch.feedbackState == 1?'完成':'未完成'"/>
				</td>
			</tr>
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
				<td colspan="1" style="color: red;" align="center">反馈信息：</td>
				<td colspan="3" style="height: 300px;">
					<iframe frameborder="0" id="feedbackIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					</iframe>
					<div id="feedbackDiv" style="display: none;"><s:property value="dispatch.feedbackInfoStr" escape="false"/></div> 
					<%-- <div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatch.feedbackInfoStr" escape="false"/></div> --%>
				</td>
				<%-- <td colspan="3">
					<div style="clear:both;line-height:20px;height: auto;"><s:property value="dispatch.feedbackInfoStr" escape="false"/></div>
				</td> --%>
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
						<input type="radio" name="approve.resultCn" value="通过" checked="checked">通过&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="approve.resultCn" value="不通过"/>不通过
					</span>
				</td>
			</tr>
			<tr>
				<td align="center">审批意见：</td>
				<td><textarea name="approve.comments" style="width: 90%;" rows="5" cols=""></textarea></td>
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
   <!-- </form> -->
</div>