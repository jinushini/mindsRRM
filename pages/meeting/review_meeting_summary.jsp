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
		navTab.loadUrl("../meeting/reviewMeeting!inputSignInFormMofidy.action?meetingId=<s:property value="meeting.id"/>&&taskId=<s:property value="taskId"/>&&processInstId=<s:property value="processInstId"/>")
	})
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn("#itemList").find("tr").length>1){
			$(this).parent().parent().remove();
		}else{
			/* alertMsg.error("操作失败！"); */
			$(this).parent().parent().find("input").val("");
		}
	});
	
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
	
	//添加评审文档按钮
	jn("[name=addFileBtn]").click(function(){
		var $itemList=jn("#fileitemList");
	
		//增加新的一行
		var $newItem=$itemList.find(".reviewFile:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn(".edit_table").find(".reviewFile").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	
	//添加评审文档名称按钮
	jn("[name=addFileNameBtn]").click(function(){
		var $itemList=jn("#fileitemList");
	
		//增加新的一行
		var $newItem=$itemList.find(".reviewFileName:first").clone();
		/* $newItem.initUI(); */
		$newItem.attr("style","")
		$newItem.find("[type=text]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn(".edit_table").find(".reviewFileName").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=text]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delFileBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	});
	//删除文件按钮
	jn("[name=del]").click(function(){
		var fileId = $(this).parent().parent().find("input").val();
		//获取当前行
		var $tr = $(this).parent().parent();
		alertMsg.confirm("确认删除", {
			 okCall: function(){				
					$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : "../meeting/ReviewMeetingAppr_delFileById.action",
					data:{
						id:fileId
					}, 
					success : function(data, statusText) {
						alertMsg.correct(data.message);					
						}
					});  
					//删除当前行
					$tr.remove();
			 },
			 cancelCall : function() {}
			});			
	});
	
	//添加备查文档按钮
	jn("[name=addCheckFileBtn]").click(function(){
		var $itemList=jn("#fileList");
	
		//增加新的一行
		var $newItem=$itemList.find(".checkFile:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delCheckFileBtn]").click(function(){
			if(jn(".edit_table").find(".checkFile").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	
	//添加评审文档名称按钮
	jn("[name=addCheckFileNameBtn]").click(function(){
		var $itemList=jn("#fileList");
	
		//增加新的一行
		var $newItem=$itemList.find(".checkFileName:first").clone();
		/* $newItem.initUI(); */
		$newItem.attr("style","")
		$newItem.find("[type=text]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn(".edit_table").find(".checkFileName").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=text]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delCheckFileBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	});
	
	jn(".nopass").change(function(){
		jn(".restart").show();
	});
	jn(".pass").change(function(){
		jn(".restart").hide();
	});
//-->
</script>

<div class="pageContent">
	<form method="post" enctype="multipart/form-data" id="searchFrm" action="../meeting/reviewMeetingAppr!summary.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
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
						
						<th width='15%'>召&nbsp;&nbsp;集&nbsp;&nbsp;人</th>
						<td ><s:property value="meeting.convener.name"/></td>
						<th width='15%'>产&nbsp;&nbsp;&nbsp;&nbsp;保</th>
						<td >
							<input name="meeting.productManager.id" type="hidden" class="required" value="<s:property value="meeting.productManager.id"/>"/>
							<input name="meeting.productManager.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()" value="<s:property value="meeting.productManager.name"/>" style="border:0;font-size:14px;"/>
							<a title="人员选择"  height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
					</tr>
					<tr>
						<th width='15%'>评审组长</th>
						<%-- <td ><s:property value="meeting.host.name"/></td> --%>
						<td >
							<input name="meeting.host.id" type="hidden" class="required" value="<s:property value="meeting.host.id"/>"/>
							<input name="meeting.host.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()" value="<s:property value="meeting.host.name"/>" style="border:0;font-size:14px;"/>
							<a title="人员选择"  height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
					</tr>
					<tr>
						<th width='15%'>评审组员</th>
						<%-- <td colspan="3"><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td> --%>
 						<td colspan="3"><input name="meeting.participantId" type="hidden" class="required" value="<s:property value='meeting.participantId'/>"/>
							<input name="meeting.participantName" type="text" class="required" readonly="readonly" value="<s:property value='meeting.participantName'/>" onclick="jn(this).next().click()" style="border:0;font-size:14px;"/>
							<a title="人员选择"height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档</td>
						<td colspan="3">
							<s:if test="fileList.size!=0">
								<div>评审文件：</div>
								<s:iterator value="fileList" status="st">
									<s:if test="use == '评审文件'">
									<div style="float:left;margin:0 5px;clear:both;">
										<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）点击下载</a>
									</div>
									<br />
									</s:if>
								</s:iterator>
								<br />
							
								<div>备查文件：</div>
								<s:iterator value="fileList" status="st">
									<s:if test="use == '备查文件'">
									<div style="float:left;margin:0 5px;clear:both;">
										<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）点击下载</a>
									</div>
									<br />
									</s:if>
								</s:iterator>
							</s:if>
						</td>
					</tr>					
					<tr>
						<td colspan="4">
							<textarea name="meeting.summary" id="summary" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summary" escape="false"/> </textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" width="98%" class="edit_table" align="center"  id="fileitemList">
					<tr>
						<td style="padding-left: 40px;" colspan="2">上传评审文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileNameBtn">增加评审文件名称</a></td>
					</tr>
					<s:iterator value="fileList" status="st">
						<s:if test="use == '评审文件'">
							<tr>
								<td style="padding-left: 40px;" colspan="2">
									<input type="hidden" value="<s:property value="id"/>"/>
									<div style="float:left;margin:0 5px;clear:both;">
										<s:property value="meetingFileName"/>
									</div>
								</td>
								<td colspan="2"><a name="del" href="javascript:;" style="color : red;">删除</a></td>
							</tr>
						</s:if>
					</s:iterator>
					<tr class="reviewFile">
						<td style="padding-left: 40px;" colspan="2"><input type="file" name="filesource"/></td>
						<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
					<tr class="reviewFileName" style="display: none;">
						<td style="padding-left: 40px;" colspan="2"><input type="text" name="reviewFileNames"/></td>
						<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
			</table>
			<table border="0" width="98%" class="edit_table" align="center" id="fileList">
					<tr>
						<td style="padding-left: 40px;" colspan="2">上传备查文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addCheckFileBtn">继续增加</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addCheckFileNameBtn">增加评审文件名称</a></td>
					</tr>
					<s:iterator value="fileList" status="st">
						<s:if test="use == '备查文件'">
							<tr>
								<td style="padding-left: 40px;" colspan="2">
									<input type="hidden" value="<s:property value="id"/>"/>
									<div style="float:left;margin:0 5px;clear:both;">
										<s:property value="meetingFileName"/>
									</div>
								</td>
								<td colspan="2"><a name="del" href="javascript:;" style="color : red;">删除</a></td>
							</tr>
						</s:if>
					</s:iterator>
					<tr class="checkFile">
						<td style="padding-left: 40px;" colspan="2"><input type="file" name="checkFilesource"/></td>
						<td colspan="2"><a name="delCheckFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
					<tr class="checkFileName" style="display: none;">
						<td style="padding-left: 40px;" colspan="2"><input type="text" name="checkFileNames"/></td>
						<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
			</table>
				
		</fieldset>
		<fieldset>
			<legend>任务处理</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td  width="20%" align="center">评审结论：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.result" value="通过" class="pass" checked="checked">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.result" value="不通过" class="nopass">不通过
						</span>
					</td>
				</tr>
				<tr class="restart" hidden="hidden">
					<td  width="20%" align="center">是否重开：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.reStart" value="1">需要重新开会&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.reStart" value="0" checked="checked">不需要重开
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
						<th width="40%">事项描述</th>
						<th width="15%">责任人</th>
						<th width="10%">完成形式</th>
						<th width="10%">截止日期</th>
						<th width="5%">删除</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<tr>
						<td><input name="meetingDispatchs[#index].itemContent" value="" style="width: 98%;"></td>
						<td>
							<input name="meetingDispatchs[#index].responsibleId" type="hidden">
							<input name="meetingDispatchs[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly">
							<a title="人员选择" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
						<!-- <td>
							<input name="meetingDispatchs[#index].auditorId" type="hidden">
							<input name="meetingDispatchs[#index].auditorName" type="text" onclick="$(this).next().click()" readonly="readonly">
							<a title="人员选择" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td> -->
						<td><input name="meetingDispatchs[#index].completeForm" value="" style="width: 98%;"></td>
						<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
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
				<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="inputBtn" type="button" target="navTab" rel="">完善签到表</button></div></div></li> -->
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>