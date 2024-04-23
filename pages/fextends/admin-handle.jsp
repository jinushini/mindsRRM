<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
//会议签到
jn("#meetingSign").click(function(){
	var beginDate = jn("#meetingForm").find("input[name=beginDate]").eq(0).val();
	var endDate = jn("#meetingForm").find("input[name=endDate]").eq(0).val();
	if(beginDate == "" || endDate == ""){
		alertMsg.error("请选择开始和结束时间！");
		return;
	}
	alertMsg.confirm("确定要操作吗？", {
		okCall : function(){
			$.post("../fextends/AdminHandle_signMeeting.action", jn("#meetingForm").serialize(), navTabAjaxDone, "json");
		},
		cancleCall : function(){}
	})
});
//评审会签到
jn("#rmeetingForm").click(function(){
	var beginDate = jn("#rmeetingForm").find("input[name=beginDate]").eq(0).val();
	var endDate = jn("#rmeetingForm").find("input[name=endDate]").eq(0).val();
	if(beginDate == "" || endDate == ""){
		alertMsg.error("请选择开始和结束时间！");
		return;
	}
	alertMsg.confirm("确定要操作吗？", {
		okCall : function(){
			$.post("../fextends/AdminHandle_signReview.action", jn("#rmeetingForm").serialize(), navTabAjaxDone, "json");
		},
		cancleCall : function(){}
	})
});
	 
//启动历史未启动的定时任务
jn("#startPlan").click(function(){
	var beginDate = jn("#planForm").find("input[name=beginDate]").eq(0).val();
	var endDate = jn("#planForm").find("input[name=endDate]").eq(0).val();
	if(beginDate == "" || endDate == ""){
		alertMsg.error("请选择开始和结束时间！");
		return;
	}
	alertMsg.confirm("确定要操作吗？", {
		okCall : function(){
			$.post("../fextends/AdminHandle_startDispatchPlan.action", jn("#planForm").serialize(), navTabAjaxDone, "json");
		},
		cancleCall : function(){}
	})
});
	 
</script>
<div class="pageContent">
  <form id="meetingForm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" >
		<fieldset>
		<legend>干掉会议签到</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<tbody>
					<tr>
						<td><label>开始时间</label><input name="beginDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><label>结束时间</label><input name="endDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><div class="buttonActive"><div class="buttonContent"><button id="meetingSign" type="button">会议签到</button></div></div></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
   </form>
  <form id="rmeetingForm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" >
		<fieldset>
		<legend>干掉评审会签到</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<tbody>
					<tr>
						<td><label>开始时间</label><input name="beginDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><label>结束时间</label><input name="endDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><div class="buttonActive"><div class="buttonContent"><button id="ReviewSign" type="button">评审会签到</button></div></div></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
   </form>
  <form id="planForm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" >
		<fieldset>
		<legend>启动历史未启动的定时任务</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<tbody>
					<tr>
						<td><label>开始时间</label><input name="beginDate" class="required" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><label>结束时间</label><input name="endDate" class="required" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td><div class="buttonActive"><div class="buttonContent"><button id="startPlan" type="button">启动流程</button></div></div></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</div>
   </form>
</div>