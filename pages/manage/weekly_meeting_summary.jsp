<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#cancelBtn").click(function(){
		navTab.loadUrl("../fextends/taskQuery!showPersonalTask.action")
	})
	//完善签到表按钮
	jn("#inputBtn").click(function(){
		navTab.loadUrl("../manage/weeklyMeeting!inputSignInFormMofidy.action?meetingId=<s:property value="meeting.id"/>&&taskId=<s:property value="taskId"/>&&processInstId=<s:property value="processInstId"/>")
	})
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn("#itemList").find("tr").length>1){
			$(this).parent().parent().remove();
		}else{
			/* alertMsg.error("操作失败！"); */
			$(this).parent().parent().find("input").val("");
		}
	})
	//添加按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find("tr:eq(0)").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jn("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		})
		$newItem.initUI();
		$newItem.find("input").val("");
		//增加一行
		$itemList.append($newItem);
	})
	
	jn("[type=submit]").click(function(){
		var $itemTr=jn("#itemList").find("tr");
		for(var i=0;i<$itemTr.length;i++){
			var $input=$itemTr.eq(i).find("input");
			for(var j=0;j<$input.length;j++){
				$input.eq(j).attr("name",$input.eq(j).attr("name").replace("#index",i));
			}
			
			//有待办事项
			if($input.eq(0).val()!=""&&$input.eq(1).val()=="") {
				alertMsg.error("请选择责任人");
				return false;
			}
		}
	})
	
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
	<form method="post" enctype="multipart/form-data" id="searchFrm" action="../manage/weeklyMeetingAppr!summary.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>任务处理</legend>
			<table class="list_table edit_table" width="98%" id="fileitemList">
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
						<td>
							<s:iterator value="fileList" status="st">
								<div style="float:left;margin:0 5px;clear:both;">
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>
								<br />
							</s:iterator>
						</td>
					</tr>					
					<tr>
						<td colspan="4">
							<textarea name="meeting.summary" id="summary" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summary" escape="false"/> </textarea>
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
		<fieldset>
			<legend>任务处理</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td  width="30%" align="center">研讨结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="meeting.result" value="通过">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.result" value="不通过">不通过
						</span>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
		<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
			<table class="list_table edit_table" width="98%">
				<thead>
					<tr>
						<th width="40%">待办事项</th>
						<th width="30%">责任人</th>
						<th width="15%">备注</th>
						<th width="5%">删除</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<tr>
						<td><input name="upcomings[#index].itemName" value="" style="width: 98%;"></td>
						<td>
							<input name="upcomings[#index].responsibleId" type="hidden">
							<input name="upcomings[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly">
							<a title="人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
						<td><input name="upcomings[#index].remark" value=""></td>
						<td><a name="delBtn" href="###" style="color : red;">删除</a></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>抄送</legend>
				<table border="0" width="98%" class="edit_table" align="center">
					<tr>
						<th width='15%' align="center">抄送人</th>
						<td colspan="3">
							<input name="meeting.carbonCopyId" type="hidden">
							<input name="meeting.carbonCopyName" type="text" readonly="readonly" onclick="$(this).next().click()">
							<a title="人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
					</tr>
			</table>
		</fieldset>	
		</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="inputBtn" type="button" target="navTab" rel="">完善签到表</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>