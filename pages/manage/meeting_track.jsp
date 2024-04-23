<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	var s=jn("#summaryDiv").html();
	
	jn("#summaryIframe")[0].contentWindow.document.write(s);
	
	var feedbackDiv = jn(".feedbackDiv");
	console.log(feedbackDiv);
	var feedbackIframe = jn(".feedbackIframe");
	for(var i = 0 ; i < feedbackDiv.length ; i ++){
		var feedback = feedbackDiv.eq(i).html();
		console.log(feedback);
		feedbackIframe[i].contentWindow.document.write(feedback)
	}
	
	$(function(){
		//合并单元格
		var j = 0;
		for (var i = 1; i < jn("#tb tr").length + 1; i++) {
			var $referCol = jn("#tb tr").eq(i - j).find("td:eq(1)");
			var $itemCol = jn("#tb tr").eq(i + 1).find("td:eq(1)");
			if ($itemCol.text() == $referCol.text()) {
				$itemCol.hide();
				j = j + 1;
			} else {
				$referCol.attr("rowspan", j + 1);
				j = 0;
			}
		}
	})
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".process").click();
	})
	
	jn(".stop").click(function(){
		var id = jn(this).parent().parent().parent().attr("id");
		alertMsg.confirm("确定要终止该待办事项吗？", {
			okCall:function(){
				$.ajax({
					global:false,
					async : false,
					type:'POST',
					dataType:'json',
					url:'../dispatch/DispatchItem_wasteProcess.action',
					data:{
						id:id
					},
					success:function(data,statusText){
						if(data.message == "success"){
							jn("#"+id).find(".status").text("已取消");
							jn("#"+id).find(".stop").attr("style","display:none;");
							alertMsg.correct(data.message);	
						}
					}
				})
			},
			cancelCall:function(){
			}
		})
	})
	
	//新增待办事项
	jn(".add").click(function(){
		var id = jn("#tb").find("tr").eq(1).attr("id");
		var href="../dispatch/DispatchItem_enterTransferPage_dispatch-item-add.action?id="+id+"&isNew=true&isStart=true";
		jn(this).attr("href",href);
	});
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>会议详情</legend>
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><s:property value="meeting.subject"/></td>
					</tr>
					<tr>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td style="color:red;"><s:property value="meeting.security"/></td>
						<th width='15%'>会议地点</th>
						<td><s:property value="meeting.address"/></td>
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<td ><s:date name="meeting.beginDate" format="yyyy-MM-dd HH:mm"/></td>
						<th width='15%'>结束时间</th>
						<td ><s:date name="meeting.endDate" format="yyyy-MM-dd HH:mm"/></td>
					</tr>
					<tr>
						<th width='15%'>主&nbsp;&nbsp;持&nbsp;&nbsp;人</th>
						<td ><s:property value="meeting.host.name"/></td>
						<th width='15%'>召&nbsp;&nbsp;集&nbsp;&nbsp;人</th>
						<td ><s:property value="meeting.convener.name"/></td>
					</tr>
					<tr>
						<th width='15%'>参&nbsp;&nbsp;会&nbsp;&nbsp;人</th>
						<td colspan="3"><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档：</td>
						<td colspan="3">
							<div style="color:gray;">会议前下发文档：</div><br/>
							<s:iterator value="fileList" status="st">															
								<s:if test="remark==0">								
								<div style="float:left;margin:0 5px;clear:both;">								
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>								
								<br />
								</s:if>
							</s:iterator>															
							<br/>
							<div style="color:gray;">会议后上传文档：</div><br/>
							<s:iterator value="fileList" status="st">								
								<s:if test="remark==1">
								<div style="float:left;margin:0 5px;clear:both;">							
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>
								<br />
								</s:if>
							</s:iterator>							
						</td>
					</tr>	
					<tr>
						<td colspan="4" style="color: red;">以下是会议纪要</td>
					</tr>
					
					<tr>
						<td colspan="4" style="height: 700px;">
							<iframe frameborder="0" id="summaryIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
								<s:property value="meeting.summaryStr" escape="false"/>
							</iframe>
							<div id="summaryDiv" style="display: none;"><s:property value="meeting.summaryStr" escape="false"/></div>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<s:if test="list == null || list.size != 0">
		<fieldset>
			<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a height="410" width="700" target="dialog" style="color : green;" class="add">点击新增待办事项</a></legend>
			<table class="list_table edit_table" width="98%" id="tb">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="20%">待办事项描述</th>
						<th width="40%">待办事项落实情况</th>
						<th width="5%">责任人</th>
						<th width="5%">完成形式</th>
						<th width="5%">要求完成时间</th>
						<th width="5%">状态</th>
						<th width="12%">文档</th>
						<th width="12%">操作</th>
						<th style="display:none;">查看</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st">
						<tr id="<s:property value="id"/>">
							<td align="center"><s:property value="#st.index+1"/></td>
							<td style="font-weight: bold;"><s:property value="taskDefinitionStr"/><s:if test="initialDispatch != null"><a href="../dispatch/DispatchItem_findHistory_dispatch-item-history.action?id=<s:property value='id'/>" target="dialog" height="410" width="700" title="历史回溯"><img src="../../img/history.png" width="18" hight="18"></a></s:if></td>
							<%-- <td <s:if test="feedbackInfoStr==null">style="color:red;"</s:if>>
								<s:property value="feedbackInfoStr==null?'无':feedbackInfoStr" escape="false"/>
							</td> --%>
							<td style="height: 100px;">
								<iframe frameborder="0" class="feedbackIframe" src="javascript:;" style="width:100%;height: 100%;">
									<s:property value="feedbackInfoStr" escape="false"/>
								</iframe>
								<div class="feedbackDiv" style="display: none;"><s:property value="feedbackInfoStr" escape="false"/></div>
							</td>
							<td align="center" style="font-weight: bold;"><s:property value="receiveUser.name"/></td>
							<td align="center"><s:property value="completeForm"/></td>
							<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd" /></td>
							<%-- <td class="status" align="center"<s:if test="status==3">style="color:green;"</s:if><s:else>style="color:red;"</s:else>>
								<s:property value="status==3?'已完成':status==0?'已取消':'未完成'"/>						
							</td> --%>							
							<td class="status" align="center"<s:if test="businessStatus==3||businessStatus==5">style="color:green;"</s:if><s:elseif test="businessStatus==4">style="color:gray;"</s:elseif><s:else>style="color:red;"</s:else>>
								<s:property value="businessStatus==1?'待反馈':businessStatus==2?'待审核':businessStatus==3?'已移交':businessStatus==4?'已取消':businessStatus==5?'已完成':''"/>						
							</td>							
							<td>
								<s:iterator value="dispatchFiles" status="st">	
									<em style="font-family: YouYuan;"><s:property value="#st.index+1"/>、</em>							
									<a href="<s:property value="filePath"/>" style="color:green;" download="<s:property value='taskFileName' />"><s:property value="taskFileName" /></a><br/>
								</s:iterator>
							</td>
							<td align="center" class="option">
								<span class="span1">									
									<s:if test="businessStatus!=3">
										<s:if test="businessStatus==2">
											<a href="../dispatch/DispatchItem_inputApprInDialog_dispatch-item-appr.action?processInstId=<s:property value='processInstId'/>&taskId=<s:property value="taskId"/>" height="410" width="700" target="dialog" rel="appr" class="appr"><span style="display:inline-block;">审核</span>&nbsp;|&nbsp;</a>
										</s:if>
										<a href="../dispatch/DispatchItem_enterTransferPage_dispatch-item-transfer.action?id=<s:property value='id'/>&isNew=false&isStart=true" height="410" width="700" target="dialog" rel="transfer" class="transfer"><span style="display:inline-block;">移交</span>&nbsp;|&nbsp;</a>
										<s:if test="businessStatus!=3&&businessStatus!=4&&businessStatus!=5">
											<a class="stop"><span style="display:inline-block;">终止</span></a>
										</s:if>
									</s:if>
									<s:else>
										<span><span style="display:inline-block;">无操作</span></span>
									</s:else>
								</span>
							</td>
							<td style="display:none;"><a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog" rel="process" class="process">查看进度</a></td>
						</tr> 
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		</s:if>
		</div>
		<div class="formBar">
			<ul>
				<li><a class="button" id="preview" target="navTab" href="../manage/WeeklyMeeting_printMeeting_meeting-signal-print.action?meetingId=<s:property value='meeting.id'/>"><span>打印预览（PDF）</span></a></li>
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="" id="print">生成打印</button></div></div></li> -->
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="" id="look">流程查看</button></div></div></li> -->
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>