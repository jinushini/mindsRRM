<%@ page language="java" contentType="text/html; charset=UTF-8"%>	
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<div class="welcome_pad">
	<div class="welcome_word"><s:property value="user.name"/>，您好！</div>
	<div class="app_icon"> <a href="../inform/message!showNewMsg.action" id="message" target="navTab" title="新消息"><i class="fa fa-envelope-o fa-3x icon_width"></i><span><br /><s:if test="messageCount==0"><span>无未读消息</span></s:if><s:else><span><span style="color:red;"><s:property value="messageCount"/></span>条消息</span></s:else></span></a></div>
	<div class="app_icon"> <a href="../manage/weeklyMeeting!inputMeeting.action" id="meeting" target="navTab" title="发起会议"><i class="fa fa-calendar fa-3x icon_width"></i><span>会议申请</span></a></div>
	<div class="app_icon"> <a href="../fextends/user!showPerson.action" id="person" target="navTab" title="个人资料"><i class="fa fa-info-circle fa-3x icon_width"></i> <span>个人信息</span></a></div>
	<div class="app_icon"> <a href="#"><i class="fa fa-check-square-o fa-3x icon_width"></i><span>待办跟踪</span></a> </div>
	<div class="app_icon"> <a href="../fextends/coin!showPersonCoin.action" id="personCoin" target="navTab"><i class="fa fa-usd fa-3x icon_width"></i><span>金币值</span></a> </div>
</div>

