<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
	//取消会议
	jn("#cancel").click(function(){
		var taskId = <s:property value='taskId'/>;
		var processInstId = <s:property value='processInstId'/>;
		alertMsg.confirm("确认取消会议？", {
		 okCall: function(){
			$.post("../manage/weeklyMeetingAppr!cancleMeeting.action", {taskId:taskId,processInstId:processInstId}, navTabAjaxDone, "json");
		 },
		 cancelCall : function() {}
		});	
	})
	
	//添加文档按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn(".list_table");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	

		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delBtn]").click(function(){
			if(jn(".edit_table").find(".file").length>1){
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
	
	//生成模板按钮	
	jn("#saveBtn").click(function(){
		alertMsg.confirm("确认保存会议模板？", {
			 okCall: function(){
				$.post("../manage/weeklyMeeting!saveTemplate.action", jn("#form").serialize(), navTabAjaxDone, "json");
			 },
			 cancelCall : function() {}
			});	 
	});	
	//载入模板
	jn("#loadBtn").click(function(){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../manage/weeklyMeeting!getTemplate.action",
			data:{
				"templateId":jn("#template").val()
			},
			success : function(data, statusText) {
				if(data.msg == "模板不存在！"){
					alertMsg.error(data.msg);
				}else{
					var jsondata = $.parseJSON(data);
					var beginDate = jsondata.beginDate.replace(" ","T");
					var endDate = jsondata.endDate.replace(" ","T");
					jn("[name='meeting.subject']").val(jsondata.subject);
					jn("[name='meeting.security']").val(jsondata.security);
			        jn("[name='meeting.address']").val(jsondata.address);
			        jn("[name='meeting.beginDate']").val(beginDate);
			        jn("[name='meeting.endDate']").val(endDate); 
			        jn("[name='meeting.host.id']").val(jsondata.hostId);
			        jn("[name='meeting.host.name']").val(jsondata.hostName);
			        jn("[name='meeting.convener.id']").val(jsondata.convenerId);
			        jn("[name='meeting.convener.name']").val(jsondata.convenerName);
			        jn("[name='meeting.participantId']").val(jsondata.participantId);
			        jn("[name='meeting.participantName']").val(jsondata.participantName);
				}
			}
		}); 
	});	
	//删除模板
	jn("#delBtn").click(function(){
		var id = jn("#template").val();
		alertMsg.confirm("确认保存会议模板？", {
			 okCall: function(){
				$.post("../manage/weeklyMeeting!deleteTemplate.action", {templateId:jn("#template").val()}, navTabAjaxDone, "json");
				jn("#template option[value="+id+"]").remove();
			 },
			 cancelCall : function() {}
			});	  
	});	
	
	
//-->
</script>

<div class="pageContent">
 	<form method="post" enctype="multipart/form-data" id="form" action="../manage/weeklyMeeting!writeContent.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);"> 
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<!-- <input type="hidden" id="result" name="approve.result" value=""> -->
		<div class="pageFormContent" layoutH="58">
		<fieldset>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>	
					<td algin="left" width="10%">当前会议室:</td>			
					<td style="text-align: center;font-size: 20px;height: 30px;" id="room" colspan="2"></td>
					<td align="center" width="15%">选择其他会议室：</td>				
					<td align="left" width="15%">
						<select id="combox" name="address" width="50">
							<option value="">----会议室----</option>
							<s:iterator value="list" status="st">
								<option value="<s:property value="key"/>"><s:property value="value"/></option>							
							</s:iterator>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>		
			<span class="space" style="font-size: 18px;">
			    Week:
			    <a href="javascript:dp.startDate = dp.startDate.addDays(-7); dp.update();" style="font-size: 18px;color:green;">上一周</a>
			    |
			    <a href="javascript:dp.startDate = dp.startDate.addDays(7); dp.update();" style="font-size: 18px;color:green;">下一周</a>
			</span>
			<div>
				<div id="dp" style="display: none;"></div><br/>
			</div>			
		</fieldset> 
			<table class="list_table edit_table" width="98%" id="itemList">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><input name="meeting.subject" type="text" value="<s:property value='meeting.subject' />" class="required" readonly="readonly" placeholder="请在上图拖拽创建会议主题">
						</td>
					</tr>
					
					<tr>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td align="left">
							<select name="meeting.security" width="50">
								<s:iterator value="securityList" status="st">
									<option value="<s:property value="key"/>"><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>	
						<th width='15%'>会议地点</th>
							<td colspan="3"><input name="meeting.address" type="text" class="required" readonly="readonly" placeholder="请在上图下拉列表创建会议地点">
						</td>						
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<!-- <td ><input name="meeting.beginDate" readonly="readonly" type="text" class="required"></td> -->
						<td><input name="meeting.beginDate" type="text" class="required" readonly="readonly" placeholder="拖拽创建开始时间，可拖拽改变调整时间">
						<th width='15%'>结束时间</th>
						<!-- <td ><input name="meeting.endDate" readonly="readonly" type="text" class="required"></td> -->
						<td><input name="meeting.endDate" type="text" class="required" readonly="readonly" placeholder="拖拽创建结束时间，可拖拽改变调整时间">
					</tr>
					<tr>
						<th width='15%'>主持人</th>
						<td >
							<input name="meeting.host.id" type="hidden" class="required"/>
							<input name="meeting.host.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()"/>
							<a title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
						<th width='15%'>召集人</th>
						<td >
							<input name="meeting.convener.id" type="hidden" class="required" value="<s:property value='currentUser.id'/>"/>
							<input name="meeting.convener.name" type="text" class="required" value="<s:property value='currentUser.name'/>" readonly="readonly"  onclick="$(this).next().click()"/>
							<a title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
					</tr>
					<tr>
						<th width='15%'>参会人</th>
						<td colspan="3">
							<input name="meeting.participantId" type="hidden" class="required"/>
							<input name="meeting.participantName" type="text" class="required" readonly="readonly" onclick="$(this).next().click()"/>
							<a title="人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 40px;" colspan="4">相关文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
					</tr>
					<tr class="file">
						<td style="padding-left: 40px;width:50%;" colspan="2"><input type="file" name="filesource" /></td>
						<td colspan="2"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><select id="template" name="templateName" width="50">
							<option value="">----会议模板----</option>
							<s:iterator value="templateList" status="st">
								<option value="<s:property value="id"/>"><s:property value="templateName"/></option>							
							</s:iterator>
						</select></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="loadBtn" type="button">载入模板</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="delBtn" type="button">删除模板</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="button">生成模板</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<%-- <li><a target="ajaxTodo" rel="currentNavTab" class="button" href="../manage/weeklyMeeting!writeContent.action?taskId=<s:property value='taskId'/>&processInstId=<s:property value='processInstId'/>&approve.result=2"><span>等待下次召开</span></a></li> --%>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancel" type="button" style="color:red">删除流程</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script src="../../js/daypilot-all.min.js" type="text/javascript"></script> 
<script type="text/javascript">
	<!--	
	var dp = new DayPilot.Calendar("dp");
	dp.theme = "calendar_green";
	dp.viewType = "Week"; 
	dp.locale = "zh-cn"; 
	
	dp.showEventStartEnd = true;
	dp.headerDateFormat = "yyyy-MM-dd(dddd)";
    dp.timeRangeSelectingStartEndEnabled = true;
    
    /* dp.heightSpec = "Fixed";
    dp.height = 400;
    */
    dp.crosshairType = "Full";
    
    var beginDate;
	var endDate;
	var subject;
	 // event creating
    dp.onTimeRangeSelected = function (args) {
    	var meetingSubject = jn("[name='meeting.subject']").val();
        var name = prompt("会议主题:", meetingSubject);
        dp.clearSelection();
        if (!name) return;
        var e = new DayPilot.Event({
            start: args.start,
            end: args.end,
            id: DayPilot.guid(),
            resource: args.resource,
            text: name,
            backColor: "#fe4164"
        });
        dp.events.add(e);   
      //传递数据
        meetingdata(args,name);  
        dp.message("创建会议");       
             
    };
 	
 	// event resizing
    dp.onEventResized = function (args) {
    	//传递数据
        meetingdataResize(args);
        dp.message("修改时间: " + args.e.text());
      	
    };
    
 	// event moving
    dp.onEventMoved = function (args) {
    	//传递数据
        meetingdataResize(args); 
        dp.message("移动: " + args.e.text());
     	     
    };
    
    dp.eventDeleteHandling = "Update";
 	// event delete
    dp.onEventDelete = function(args) {
    	//清空数据.  	
        cleanMeetingdata();
        alert("移除: " + args.e.text());
        
    };
    
   /*  dp.onEventClick = function(args) {
        alert("占用时间: " + args.e.id());
    }; */
    
	dp.init();
	$.ajax({
		global : false,
		type : 'post',
		dataType : "json",
		url : "../manage/weeklyMeeting!showRoom.action",
		data : {
			start : dp.visibleStart().toString(),
			end : dp.visibleEnd().toString(),
			address : 'A5楼101会议室（大）'
		},
		success : function(data, statusText) {
			$("#room").text("A5楼101会议室（大）").css("color","red");
			dp.events.list = data;
			dp.update();
		}
	});
	
	$(function() {
		//下拉选项
		$("#combox").change(function() {
			$("#room").text($("#combox").val()).css("color","red");
			$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../manage/weeklyMeeting!showRoom.action",
				data : {
					start : dp.visibleStart().toString(),
					end : dp.visibleEnd().toString(),
					address : $("#combox").val()
				},
				success : function(data, statusText) {
					dp.events.list = data;
					dp.update();
					//清空数据
				    cleanMeetingdata();
				}
			});
		});
	});
	
	//传递数据
	function meetingdata(args,name){
		beginDate = args.start;
        endDate = args.end;
        subject = name;		
      	//填写会议单
    	meetingwrite(beginDate,endDate,endDate);
	}
	//传递数据
	function meetingdataResize(args){
		beginDate = args.e.start();
        endDate = args.e.end();
        subject = args.e.text();	
      	//填写会议单
    	meetingwrite(beginDate,endDate,endDate);
	}
	
	//填写会议单
	function meetingwrite(beginDate,endDate,endDate){
		jn("[name='meeting.subject']").val(subject);
        jn("[name='meeting.address']").val(jn("#room").text());
        jn("[name='meeting.beginDate']").val(beginDate);
        jn("[name='meeting.endDate']").val(endDate);
	}
	
	//清空数据
    function cleanMeetingdata(){
    	/* jn("[name='meeting.subject']").val(""); */
        jn("[name='meeting.address']").val("");
        jn("[name='meeting.beginDate']").val("");
        jn("[name='meeting.endDate']").val("");
	}
//-->
</script>