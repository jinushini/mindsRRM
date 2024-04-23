<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
//会议签到
jn("#meetingSign").click(function(){
	$.post("../manage/MeetingSign_signMeeting.action",{}, navTabAjaxDone, "json");
	/* $.post("../manage/weeklyMeeting!changeNotice.action", {state:state,deploymentId:deploymentId}, navTabAjaxDone, "json"); */
});
//评审会签到
jn("#ReviewSign").click(function(){
	$.post("../manage/MeetingSign_signReview.action",{}, navTabAjaxDone, "json");
});
	 
</script>
<div class="pageContent">
  <form id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
		<br/>
		<h1>干掉会议签到</h1>
		<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="meetingSign" type="button">会议签到</button></div></div></li>
		<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="ReviewSign" type="button">评审会签到</button></div></div></li>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>