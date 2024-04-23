<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	//添加文档按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemlist");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	
	
		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delBtn]").click(function(){
			if(jn("#itemlist").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	});
//-->
</script>

<div class="pageContent">
	<form method="post" enctype="multipart/form-data" id="searchFrm" action="../meeting/reviewMeetingAppr!signIn.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
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
								<s:iterator value="fileList" status="st">
									<div style="float:left;margin:0 5px;clear:both;">
										<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
									</div>
									<br />
								</s:iterator>
							</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>会议签到</legend>
			<table border="0" width="98%" class="edit_table list_table" align="center">
				<tr>
					<td  width="30%" align="center">签到：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="signInForm.status" value="1">出席&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="signInForm.status" value="2" checked="checked">缺席
						</span>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
		<legend>提供文档</legend>
			<table border="0" width="98%" class="edit_table" align="center" id="itemlist">
				<tr>
					<td style="padding-left: 40px;" colspan="4">相关文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
				</tr>
				<tr class="file">
					<td style="padding-left: 40px;width:50%;"><input type="file" name="filesource" /></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
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