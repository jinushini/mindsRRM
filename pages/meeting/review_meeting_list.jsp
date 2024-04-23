<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
<!--
//流程图
jn(function(){
	var state = jn("#state").val();
	if(state == 0){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../meeting/reviewMeeting!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
		$.pdialog.open(url,"new_msg", "查看流程图",options);
	}		
}); 
//查看流程图按钮
jn("#viewImgBtn").click(function(){
	var options={};
	options.width = 800;
	options.height = 500;
	var url="../meeting/reviewMeeting!flowImage.action";
	$.pdialog.open(url,"new_msg", "查看流程图",options);	
})

//双击事件
jn("tbody tr").dblclick(function(){
	$(this).find(".details").click();
})

//发起会议
/* jn(".add").click(function(){
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器 
    if(isIE){
    	 var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
         reIE.test(userAgent);
         var fIEVersion = parseFloat(RegExp["$1"]);
         if(fIEVersion <= 8) {
        	 alertMsg.error("请使用火狐浏览器或谷歌浏览器打开");
        	 jn(this).removeAttr("target");
        	 jn(this).attr("href", "#");
         }
    }
}); */

//会议室查询
/* jn(".room").click(function(){
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器 
    if(isIE){
    	 var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
         reIE.test(userAgent);
         var fIEVersion = parseFloat(RegExp["$1"]);
         if(fIEVersion <= 8) {
        	 alertMsg.error("请使用火狐浏览器或谷歌浏览器打开");
        	 jn(this).removeAttr("target");
        	 jn(this).attr("href", "#");
         } 
    }
}); */
//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					主题：<input type="text" name="paramMap['m.subject like']" value="<s:property value="paramMap['m.subject like']"/>" />
				</td>
				<td>
					主持人：<input type="text" name="paramMap['m.host.name like']" value="<s:property value="paramMap['m.host.name like']"/>" />
				</td>
				<td>
					召集人：<input type="text" name="paramMap['m.convener.name like']" value="<s:property value="paramMap['m.convener.name like']"/>" />
				</td>
				<td colspan="2">
					开会时间：
					<input readonly="readonly" size="12" type="text" name="paramMap['m.beginDate ge Date']" value="<s:property value="paramMap['m.beginDate ge Date']"/>" onclick="WdatePicker();"/>至
					<input readonly="readonly" size="12" type="text" name="paramMap['m.beginDate le Date']" value="<s:property value="paramMap['m.beginDate le Date']"/>" onclick="WdatePicker();"/>
				</td>
				
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../meeting/reviewMeeting!inputMeeting.action" target="navTab" rel="currentNavTab"><span>发起会议</span></a></li>
			<li><a class="icon room" href="../meeting/reviewMeeting!showMeetingRoom.action" target="navTab" rel="currentNavTab"><span>会议室查询</span></a></li>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
			<li><a class="icon" href="../meeting/reviewMeeting!showAllUpcoming.action" target="navTab" rel=""><span>会议待办</span></a></li>
			<%-- <li><a class="icon week" href="../meeting/reviewMeeting!queryMeetingListByWeek.action" target="navTab" rel=""><span>本周会议</span></a></li>
			<li><a class="icon query" href="../meeting/reviewMeeting!queryMeetingListByMonth.action" target="navTab" rel=""><span>本月会议</span></a></li>
			<li><a class="icon query" href="../meeting/reviewMeeting!queryMeetingList.action" target="navTab" rel=""><span>全部会议</span></a></li>
			<li><a class="icon" href="../meeting/reviewMeeting!showMeetingList.action" target="navTab" rel=""><span>与我有关</span></a></li> --%>
			
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="3%">序号</th>
					<th width="15%" colspan="2">时间</th>
					<th width="25%">会议名称</th>
					<th width="7%">主持人</th>
					<th width="7%">召集人</th>
					<th width="18%">参会人</th>
					<th width="17%">地点</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
			  	 <s:if test="#st.odd == true">
					<tr target="id" rel="<s:property value="id"/>" bgcolor="#c9cdd2" class="" >
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" width="20%" id="date"><s:date name="beginDate" format="MM-dd"/> </td>
					<td align="center" width="80%"><s:date name="beginDate" format="HH:mm"/>-<s:date name="endDate" format="HH:mm"/> </td>
					<td align="center" title=<s:property value="subject"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="subject"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="host.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="convener.name"/></td>
					<td align="left" title=<s:property value="participantName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="participantName"/></td>
					<td align="center" title=<s:property value="address"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="address"/></td>
					<td align="center">
						<a href="../meeting/reviewMeeting!showMeeting.action?meetingId=<s:property value="id"/>" target="dialog" width='900' height='800' class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
				</s:if>
				<s:else>
				<tr target="id" rel="<s:property value="id"/>" bgcolor=#e7eaee">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" width="20%" id="date"><s:date name="beginDate" format="MM-dd"/> </td>
					<td align="center" width="80%"><s:date name="beginDate" format="HH:mm"/>-<s:date name="endDate" format="HH:mm"/> </td>
					<td align="center" title=<s:property value="subject"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="subject"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="host.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="convener.name"/></td>
					<td align="left" title=<s:property value="participantName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="participantName"/></td>
					<td align="center" title=<s:property value="address"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="address"/></td>
					<td align="center">
						<a href="../meeting/reviewMeeting!showMeeting.action?meetingId=<s:property value="id"/>" target="dialog" width='900' height='800' class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
				</s:else>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

