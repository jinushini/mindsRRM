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
	jn(".delBtn").click(function(){
		var id = jn(this).parent().parent().attr("id");
		if(id == null){
			if(jn("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				/* alertMsg.error("操作失败！"); */
				$(this).parent().parent().find("input").val("");
			}
		}else{
			deleteDispatch(id);
		}
	})
	function deleteDispatch(id){
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
	}
	//添加按钮
	jn("[name=addBtn]").click(function(){
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
		buildSummary();
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
	
	//通过与不通过的分支
	jn(".nopass").change(function(){
		jn(".restart").show();
		jn(".needSign").hide();
	});
	jn(".pass").change(function(){
		jn(".restart").hide();
		jn(".needSign").show();
	});
	
	//会议形成文件数据采集区
	jn(".meetingType").change(function(){
		buildMeetingFileCode();
	});
	
	//创建文件编号
	function buildMeetingFileCode(){
		var type = jn(".meetingType").find("option:selected").val();
		if(type == "---请选择---"){
			jn(".meetingSponsor").hide();
			jn(".meetingSendTo").hide();
			jn(".meetingCarbonCopy").hide();
			jn("#sponsor").removeAttr("class");
			jn("#sendTo").removeAttr("class");
			jn("#carbonCopy").removeAttr("class");
			jn("#sponsor").val("");
			jn("#sendTo").val("");
			jn("#carbonCopy").val("");
			jn(".fileCode").val("");
			return;
		}
		/* if(type == "其他-QT"){
			jn(".meetingSponsor").show();
			jn(".meetingSendTo").show();
			jn(".meetingCarbonCopy").show();
			jn("#sponsor").removeAttr("class");
			jn("#sendTo").removeAttr("class");
			jn("#carbonCopy").removeAttr("class");
			jn("#sponsor").val("");
			jn("#sendTo").val("");
			jn("#carbonCopy").val("");
		}else{ */
			jn(".meetingSponsor").show();
			jn(".meetingSendTo").show();
			jn(".meetingCarbonCopy").show();
			jn("#sponsor").attr("class","required");
			jn("#sendTo").attr("class","required");
			jn("#carbonCopy").attr("class","required");
		/* } */
		//填充文件编号框
		fillFileCode(type);
	}
	
	//填充文件编号框
	function fillFileCode(type){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../manage/WeeklyMeetingAppr_queryFileCode.action",
			data:{
				type:type
			},
			success : function(data, statusText) {
				jn(".fileCode").val(data);
			}
		}); 
	}
	
	//修改会议主题
	jn(".subject").change(function(){
		var subject = jn("input[name=subject]").val();
		alertMsg.confirm("确认要修改会议主题吗？", {
			okCall : function(){
				
			},
			cancelCall : function(){
				jn(".subject").val(subject);
			}
		})
	});
	
	//页面加载完成
	$(function(){
		//
		//buildMeetingFileCode();
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
		<legend>会议详情</legend>
			<table class="list_table edit_table" width="98%" id="fileitemList">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3">
							<input type="hidden" name="subject" value="<s:property value='meeting.subject'/>"/>
							<input type="text" class="subject" name="meeting.subject" value="<s:property value='meeting.subject'/>" style="border:0;font-size:14px;"/>
						</td>
					</tr>
					<tr>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td>
							<select name="meeting.security" width="50">
								<s:iterator value="securityList" status="st">
									<option value="<s:property value="key"/>" <s:if test="key==meeting.security">selected=selected</s:if>><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>
						<th width='15%'>会议地点</th>
						<td>
							<%-- <s:property value="meeting.address"/> --%>
							<select id="combox" name="meeting.address" width="50">
								<s:iterator value="roomList" status="st">
									<option value="<s:property value="key"/>" <s:if test="key==meeting.address">selected=selected</s:if>><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<%-- <td ><s:date name="meeting.beginDate" format="yyyy-MM-dd HH:mm"/></td> --%>
						<td><input name="meeting.beginDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" class="required" value="<s:date name="meeting.beginDate" format="yyyy-MM-dd HH:mm"/>"></td>
						<th width='15%'>结束时间</th>
						<%-- <td ><s:date name="meeting.endDate" format="yyyy-MM-dd HH:mm"/></td> --%>
						<td><input name="meeting.endDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" class="required" value="<s:date name="meeting.endDate" format="yyyy-MM-dd HH:mm"/>"></td>
					</tr>
					<tr>
						<th width='15%'>主&nbsp;&nbsp;持&nbsp;&nbsp;人</th>
						<%-- <td ><s:property value="meeting.host.name"/></td> --%>
						<td >
							<input name="meeting.host.id" type="hidden" class="required" value="<s:property value="meeting.host.id"/>"/>
							<input name="meeting.host.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()" value="<s:property value="meeting.host.name"/>"/>
							<a title="人员选择"  height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
						<th width='15%'>召&nbsp;&nbsp;集&nbsp;&nbsp;人</th>
						<%-- <td ><s:property value="meeting.convener.name"/></td> --%>
						<td >
							<input name="meeting.convener.id" type="hidden" class="required" value="<s:property value='currentUser.id'/>"/>
							<input name="meeting.convener.name" type="text" class="required" value="<s:property value='currentUser.name'/>" readonly="readonly" onclick="$(this).next().click()"/>
							<a title="人员选择" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
					</tr>
					<tr>
						<th width='15%'>参&nbsp;&nbsp;会&nbsp;&nbsp;人</th>
						<%-- <td colspan="2"><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td> --%>
						<td colspan="3"><input name="meeting.participantId" type="hidden" class="required" value="<s:property value='meeting.participantId'/>"/>
							<input name="meeting.participantName" type="text" class="required" readonly="readonly" value="<s:property value='meeting.participantName'/>" onclick="jn(this).next().click()"/>
							<a title="人员选择"height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文档</td>
						<td colspan="3">
							<s:iterator value="fileList" status="st">
								<div style="float:left;margin:0 5px;clear:both;">
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）点击下载</a>
								</div>
								<br />
							</s:iterator>
						</td>
					</tr>					
					<%-- <tr>
						<td colspan="4">
							<textarea name="meeting.summary" id="summary" class="editor required" rows="30" style="width: 100%;" upImgUrl="../manage/weeklyMeetingAppr!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="meeting.summary" escape="false"/> </textarea>
						</td>
					</tr> --%>
					<%-- <s:include value="meeting.category == '班组周例会'?'meeting_summary_div1.jsp':'meeting_summary_div.jsp'"></s:include> --%>
					<s:if test="meeting.category == '班组周例会'">
						<s:include value="meeting_summary_div1.jsp"></s:include>
					</s:if>
					<s:else>
						<s:include value="meeting_summary_div.jsp"></s:include>
					</s:else>
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
			<legend>生成会议结论</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td  width="20%" align="center">研讨结论：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.result" value="通过" checked="checked" class="pass">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.result" value="不通过" class="nopass">不通过
						</span>
					</td>
				</tr>
				<tr class="restart" style="display: none;">
					<td  width="20%" align="center">是否重开：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.reStart" value="1" >需要重新开会&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.reStart" value="0" checked="checked">不需要重开
						</span>
					</td>
				</tr>
				<tr class="needSign">
					<td  width="20%" align="center">是否需要主持人审核：</td>
					<td width="30%">
						<span class="required">
							<input type="radio" name="meeting.needSign" value="1" >需要&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="meeting.needSign" value="0" checked="checked">不需要
						</span>
					</td>
				</tr>
			</table>
			<legend>请填写生成会议文件所需要的要素</legend>
			<table border="0" width="98%" class="edit_table" align="center" class="meetingFile">
				<tr>
					<td width="20%" align="center">会议分类：</td>
					<td width="30%">
						<span class="required">
							<select name="meeting.type" class="meetingType">
								<option>---请选择---</option>
								<s:iterator value="typeList" var="type">
									<%-- <option value="<s:property value='key'/>-<s:property value='value'/>" <s:if test="value=='QT'">selected="selected"</s:if>><s:property value="key"/></option> --%>
									<option value="<s:property value='key'/>-<s:property value='value'/>"><s:property value="key"/></option>
								</s:iterator>
							</select>
						</span>
					</td>
				</tr>
				<tr class="fileCode">
					<td  width="20%" align="center">文件编号：</td>
					<td width="30%">
							<input type="text" name="meeting.fileCode" value="<s:property value='fileCode'/>" readonly="readonly" class="fileCode required"/>
					</td>
				</tr>
				<tr class="meetingSponsor" style="display: none;">
					<td  width="20%" align="center">主办方：</td>
					<td width="30%">
						<select name="meeting.sponsor" id="sponsor">
							<option selected="selected" value="">---请选择主办方---</option>
							<s:iterator value="sponsorList" var="sponsor">
								<option value="<s:property value='value'/>"><s:property value="key"/></option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr class="meetingSendTo" style="display: none;">
					<td  width="20%" align="center">主送：</td>
					<td width="30%">
						<input type="text" name="meeting.sendTo" id="sendTo" placeholder="微波所各部门、各班组"/>
					</td>
				</tr>
				<tr class="meetingCarbonCopy" style="display: none;">
					<td  width="20%" align="center">抄送：</td>
					<td width="30%">
						<input type="text" name="meeting.carbonCopy" id="carbonCopy" placeholder="所领导、总工、副总工、产品责任人"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
		<legend>待办事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
			<table class="list_table edit_table" width="98%">
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
					<s:if test="list == null || list.size() == 0" >
						<tr>
							<td align="center"><s:property value="#st.index+1"/><input type="hidden" name="meetingDispatchs[#index].id" value="<s:property value='id'/>"/></td>
							<td><input name="meetingDispatchs[#index].itemContent" value="" style="width: 98%;"></td>
							<td>
								<input name="meetingDispatchs[#index].responsibleId" type="hidden">
								<input name="meetingDispatchs[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly">
								<a title="人员选择" height="410" width="715"
									href="../system/user!findMUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td><input name="meetingDispatchs[#index].completeForm" value="" style="width: 98%;"></td>
							<td ><input name="meetingDispatchs[#index].scheduleDate.planEndDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
							<td><a name="delBtn" href="###" style="color : red;">删除</a></td>
						</tr>
					</s:if>
					<s:else>
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
									<%-- <a href="###" class="modify"><span style="color:green;">确认修改</span></a>&nbsp;|&nbsp; --%>
									<a class="delBtn" href="###" style="color : red;">删除</a>
								</td>
							</tr> 
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>通过MINDS系统抄送</legend>
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