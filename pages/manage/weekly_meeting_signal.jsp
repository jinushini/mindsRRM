<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	//alert(jn("#summaryIframe").html())
	//jn("#summaryIframe")[0].contentWindow.document.write("<html><body>"+jn("#summaryIframe").html()+"</body></html>");
	var s=jd("#summaryDiv").html();
	
	jd("#summaryIframe")[0].contentWindow.document.write(s);
	
	//添加文档按钮
	jn("[name=addFileBtn]").click(function(){
		var $itemList=jn("#fileitemList");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn(".edit_table").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delFileBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	})
//-->
</script>

<div class="pageContent">
	<form method="post"enctype="multipart/form-data" action="../manage/weeklyMeetingAppr!completeUpcoming.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>任务处理</legend>
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
						<td colspan="3"><s:property value="meeting.participantName"/></td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档</td>
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
		<fieldset>
		<legend>待办事项</legend>
			<table class="list_table edit_table" width="98%">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="65%">待办事项</th>
						<th width="5%">责任人</th>
						<th width="20%" colspan="2">备注</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="meeting.upcomings" status="st">
						<tr>
							<td align="center"><s:property value="#st.index+1"/></td>
							<td><s:property value="itemName"/></td>
							<td align="center"><s:property value="responsible.name"/></td>							
							<td align="center"><s:property value="remark"/></td>
							<td align="center" width="6%" <s:if test="status==1">style="color:green;font-size:10px;"</s:if><s:elseif test="status==0">style="color:red;font-size:10px;"</s:elseif>>
								(<s:property value="status==0?'未完成':'已完成'"/>)						
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			</fieldset>
			<fieldset>
			<legend>待办处理</legend>
				<table class="list_table edit_table" width="98%" id="fileitemList">
					<tbody>
						<tr>
							<td style="color:red;"><s:property value="upcoming.itemName"/></td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea name="upcoming.transaction" class="editor" rows="10" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="upcoming.transaction" escape="false"/> </textarea>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 40px;" colspan="2">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a></td>
						</tr>
						<tr class="file">
							<td style="padding-left: 40px;" colspan="2"><input type="file" name="filesource"/></td>
							<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
						</tr>
				</tbody>
			</table>
		</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="submit">待办任务已完成</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>