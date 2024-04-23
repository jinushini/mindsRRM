<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	
	//添加按钮
	jn(".addBtn").click(function(){
		var $itemList=jn("#itemList");
		var $trLen=$itemList.find("tr").length;
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
		$newItem.find("td:eq(0)").text($trLen+1);
		$newItem.find(".receiveUserName").attr("onclick","$(this).next().click()");//onclick="$(this).next().click()"
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
			if($input.eq(0).val()!=""&&$input.eq(2).val()=="") {
				alertMsg.error("请选择责任人");
				return false;
			}
			//有待办事项
			if($input.eq(0).val()!=""&&$input.eq(4).val()=="") {
				alertMsg.error("请选择截止日期");
				return false;
			}
		}
	})
	
	jn(".delBtn").click(function(){
		var id = jn(this).parent().parent().attr("id");
		alertMsg.confirm("确认要删除待办事项吗？", {
			okCall : function(){
				var url = "../dispatch/DispatchItem_deleteDispatch.action";
				$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : url,
					data:{
						id:id
					},
					success : function(data, statusText) {
						alertMsg.correct(data.message);
						jn("#"+id).remove();
					}
				}); 
			},
			cancelCall : function(){
				jn(this).val(modifyValue);
			}
		})
	});
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="../manage/WeeklyMeetingAppr_confirm.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<input type="hidden" name="meeting.id" value="<s:property value="meeting.id"/>">
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
						<td colspan="4">
							<textarea name="meeting.summary" id="summary" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summaryStr" escape="false"/> </textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
		<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="color : green;" class="addBtn">点击新增待办事项</a></legend>
			<table class="list_table edit_table" width="98%" id="tb">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="20%">待办事项描述</th>
						<th width="5%">责任人</th>
						<th width="5%">完成形式</th>
						<th width="5%">要求完成时间</th>
						<th width="5%">操作</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<s:if test="list == null || list.size() == 0">
						<tr id="<s:property value="id"/>">
							<td align="center"><s:property value="#st.index+1"/><input type="hidden" name="meetingDispatchs[#index].id" value=""/></td>
							<td style="font-weight: bold;"><input type="text" name="meetingDispatchs[#index].itemContent" value=""/></td>
							<td >
								<input name="meetingDispatchs[#index].responsibleId" type="hidden" class="required" value=""/>
								<input name="meetingDispatchs[#index].responsibleName" value="" type="text" onclick="$(this).next().click()" class="receiveUserName required" readonly="readonly" />
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td align="center"><input name="meetingDispatchs[#index].completeForm" value="" style="width: 98%;"></td>
							<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" value="" name="planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
							<td align="center" >
								<a class="delBtn" href="###" style="color : red;">删除</a>
							</td>
						</tr> 
					</s:if>
					<s:iterator value="list" status="st">
						<tr id="<s:property value="id"/>">
							<td align="center"><s:property value="#st.index+1"/><input type="hidden" name="meetingDispatchs[#index].id" value="<s:property value='id'/>"/></td>
							<td style="font-weight: bold;"><input type="text" name="meetingDispatchs[#index].itemContent" value="<s:property value='taskDefinitionStr'/>"/></td>
							<td >
								<input name="meetingDispatchs[#index].responsibleId" type="hidden" class="required" value="<s:property value='receiveUserId'/>"/>
								<input name="meetingDispatchs[#index].responsibleName" value="<s:property value='receiveUserName'/>" type="text" class="receiveUserName required" readonly="readonly" />
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td align="center"><input name="meetingDispatchs[#index].completeForm" value="<s:property value='completeForm'/>" style="width: 98%;"></td>
							<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" value="<s:date name='scheduleDate.planEndDate' format='yyyy-MM-dd' />" name="planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
							<td align="center" >
								<a class="delBtn" href="###" style="color : red;">删除</a>
							</td>
						</tr> 
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>