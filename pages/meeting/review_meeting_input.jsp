<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--
	//添加评审文档按钮
	jn("[name=addFileBtn]").click(function(){
		var $itemList=jn("#fileitemList");
	
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
	
	//生成模板按钮	
	jn("#saveBtn").click(function(){
		alertMsg.confirm("确认保存会议模板？", {
			 okCall: function(){
				$.post("../meeting/reviewMeeting!saveTemplate.action", jn("#form").serialize(), navTabAjaxDone, "json");
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
			url : "../meeting/reviewMeeting!getTemplate.action",
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
					
					jn("[name='meeting.code']").val(jsondata.code);
					jn("[name='meeting.stage']").val(jsondata.stage);
					jn("[name='meeting.productCode']").val(jsondata.productCode);
					jn("[name='meeting.productName']").val(jsondata.productName);
					jn("[name='meeting.modelName']").val(jsondata.modelName);
					jn("[name='meeting.reviewLevel']").val(jsondata.reviewLevel);
					jn("[name='meeting.reviewCategory']").val(jsondata.reviewCategory); 
									
					jn("[name='meeting.subject']").val(jsondata.subject);
					jn("[name='meeting.security']").val(jsondata.security);
			        jn("[name='meeting.address']").val(jsondata.address);
			        jn("[name='meeting.beginDate']").val(beginDate);
			        jn("[name='meeting.endDate']").val(endDate); 
			        jn("[name='meeting.host.id']").val(jsondata.hostId);
			        jn("[name='meeting.host.name']").val(jsondata.hostName);
			        jn("[name='meeting.convener.id']").val(jsondata.convenerId);
			        jn("[name='meeting.convener.name']").val(jsondata.convenerName);
			        jn("[name='meeting.productManager.id']").val(jsondata.productManagerId);
			        jn("[name='meeting.productManager.name']").val(jsondata.productManagerName);
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
				$.post("../meeting/reviewMeeting!deleteTemplate.action", {templateId:jn("#template").val()}, navTabAjaxDone, "json");
				jn("#template option[value="+id+"]").remove();
			 },
			 cancelCall : function() {}
			});	  
	});	
	
	//校验是否被占用
	jn("#submitBtn").click(function(){
		var address = jn("[name='meeting.address']").val();
		var beginDate = jn("[name='meeting.beginDate']").val();
		var endDate = jn("[name='meeting.endDate']").val();
		$.ajax({
			global : false,
			type : 'post',
			dataType : 'json',
			url : '../manage/WeeklyMeeting_verifyAddress.action',
			data : {
				beginDate : beginDate,
				endDate : endDate,
				address : address
			},
			success : function(data, statusText){
				var result = data.message;
				if(result == 1){
					jn("#form").submit();
				}else{
					alertMsg.error("所选时间段该会议室被占用，请选择其他会议室或更换会议时间段！");
				}
			}
		});
		return false;
	});
	
//-->
</script>

<div class="pageContent">
 	<form method="post" enctype="multipart/form-data" id="form" action="../meeting/reviewMeeting!startReviewMeetingProcess.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);"> 
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<fieldset>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>	
					<td algin="left" width="10%">当前会议室:</td>			
					<td style="text-align: center;font-size: 20px;height: 30px;" id="room" colspan="2"></td>
					<td align="center" width="15%">选择其他会议室：</td>				
					<td align="left" width="15%">
						<select id="combox" name="address" width="50">
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
				<div id="dp1" style="display: none;"></div><br/>
			</div>			
		</fieldset> 
			<table class="list_table edit_table" width="98%" id="itemList">
				<tbody>	
				<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><input name="meeting.subject" type="text" class="required" readonly="readonly" placeholder="请在上图拖拽创建会议主题">
						</td>
					</tr>			
					<tr>					
						<th width='15%'>编&nbsp;&nbsp;&nbsp;&nbsp;号</th>
						<td ><input name="meeting.code" type="text"></td>
						<th width='15%'>密&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td align="left">
							<select name="meeting.security" width="50">
								<s:iterator value="securityList" status="st">
									<option value="<s:property value="key"/>"><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>	
					</tr>
					<tr>	
						<th width='15%'>阶段标记</th>
						<td ><input name="meeting.stage" type="text"></td>													
						<th width='15%'>产品代号</th>
						<td ><input name="meeting.productCode" type="text"></td>
					</tr>
					<tr>
						<th width='15%'>产品名称</th>
						<td ><input name="meeting.productName" type="text"></td>
						<th width='15%'>所属系统</th>
						<td ><input name="meeting.modelName" type="text"></td>
					</tr>
					<tr>
						<th width='15%'>评审级别</th>
						<!-- <td ><input name="meeting.reviewLevel" type="text"></td> -->
						<td align="left">
							<select name="meeting.reviewLevel" width="50">
								<s:iterator value="reviewLevels" status="st">
									<option value="<s:property value="key"/>"><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>
						<th width='15%'>评审类别</th>
						<!-- <td ><input name="meeting.reviewCategory" type="text"></td> -->
						<td align="left">
							<select name="meeting.reviewCategory" width="50">
								<s:iterator value="reviewCategorys" status="st">
									<option value="<s:property value="key"/>"><s:property value="value"/></option>							
								</s:iterator>
							</select>
						</td>						
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
							<input name="meeting.convener.id" type="hidden" class="required" value="<s:property value='currentUser.id'/>" />
							<input name="meeting.convener.name" type="text" class="required" value="<s:property value='currentUser.name'/>" readonly="readonly" onclick="$(this).next().click()"/>
							<a title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
					</tr>
					
					<tr>
						<th width='15%'>开始时间</th>
						<td><input name="meeting.beginDate" type="text" class="required" readonly="readonly" placeholder="拖拽创建开始时间，可拖拽改变调整时间">
						<th width='15%'>结束时间</th>
						<td><input name="meeting.endDate" type="text" class="required" readonly="readonly" placeholder="拖拽创建结束时间，可拖拽改变调整时间">
					</tr>
					<tr>
						<th width='15%'>会议地点</th>
						<td>
							<input name="meeting.address" type="text" class="required" readonly="readonly" placeholder="请在上图下拉列表创建会议地点">
						</td>
						<th width='15%'>产&nbsp;&nbsp;&nbsp;&nbsp;保</th>
						<td>
							<input name="meeting.productManager.id" type="hidden" class="required"/>
							<input name="meeting.productManager.name" type="text" class="required" readonly="readonly" onclick="$(this).next().click()"/>
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
				<table border="0" width="98%" class="edit_table" align="center"  id="fileitemList">
					<tr>
						<td style="padding-left: 40px;" colspan="4">评审文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a></td>
					</tr>
					<tr class="file">
						<td style="padding-left: 40px;width:50%;" colspan="2"><input type="file" name="filesource" /></td>
						<td colspan="2"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
				</table>
				<table border="0" width="98%" class="edit_table" align="center" id="fileList">
					<tr>
						<td style="padding-left: 40px;" colspan="4">备查文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addCheckFileBtn">继续增加</a></td>
					</tr>
					<tr class="checkFile">
						<td style="padding-left: 40px;width:50%;" colspan="2"><input type="file" name="checkFilesource" /></td>
						<td colspan="2"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
				</table>
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
				<li><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">启动会议</button></div></div></li>
 				<li><a class="button" href="../meeting/reviewMeeting!showAllMeetingList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
			</ul>
		</div>
	</form>
</div>
<script src="../../js/daypilot-all.min.js" type="text/javascript"></script> 
<script type="text/javascript">

	var dp = new DayPilot.Calendar("dp1");
	dp.theme = "calendar_green";
	dp.viewType = "Week"; 
	dp.locale = "zh-cn"; 
	dp.allowEventOverlap = false;
	
	dp.showEventStartEnd = true;
	dp.headerDateFormat = "yyyy-MM-dd(dddd)";
    dp.timeRangeSelectingStartEndEnabled = true;
    
    dp.dayBeginsHour = 9;
    dp.dayEndsHour = 18; 
    
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
		url : "../meeting/reviewMeeting!showRoom.action",
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
				url : "../meeting/reviewMeeting!showRoom.action",
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
</script>