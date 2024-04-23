<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

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
    
	/*  dp.heightSpec = "Fixed";
    dp.height = 450;
    */
    dp.crosshairType = "Full";
    
 	// bubble, with async loading
   /* dp.bubble = new DayPilot.Bubble({
        onLoad: function(args) {
            var ev = args.source;
            //alert("event: " + ev);
            args.async = true;  // notify manually using .loaded()
            
            // simulating slow server-side load
            setTimeout(function() {
                args.html = "meeting: <br>" + ev.text();
                args.loaded();
            }, 500);
        }
    });  */ 
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
	//下拉框
	$(function() {
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
				}
			});
		});
	});
	
//-->
</script>
<div class="pageContent">

  <form method="post" action="javascript:;" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
		 <fieldset>
			<div style="text-align: center;font-size: 20px;height: 30px;" id="room">会议室</div>
		</fieldset> 
		<fieldset>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center" width="20%">请选择会议室：</td>				
					<td>
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
			<span class="space"  style="font-size: 18px;">
			    Week:
			    <a href="javascript:dp.startDate = dp.startDate.addDays(-7); dp.update();" style="font-size: 18px;color:green;">上一周</a>
			    |
			    <a href="javascript:dp.startDate = dp.startDate.addDays(7); dp.update();" style="font-size: 18px;color:green;">下一周</a>
			</span>	
			<div>
				<div id="dp" style="display: none;"></div><br/>
			</div>
			
		</fieldset> 
	</div>
	
	
	
	
	<div class="formBar" style="text-align： center;">
		<ul style="">
 			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
   
</div>

