<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					主题：<input type="text" name="paramMap['w.subject like']" value="<s:property value="paramMap['w.subject like']"/>" />
				</td>
				<td colspan="2">
					开会时间：
					<input readonly="readonly" size="12" type="text" name="paramMap['w.beginDate ge Date']" value="<s:property value="paramMap['w.beginDate ge Date']"/>" onclick="WdatePicker();"/>至
					<input readonly="readonly" size="12" type="text" name="paramMap['w.beginDate le Date']" value="<s:property value="paramMap['w.beginDate le Date']"/>" onclick="WdatePicker();"/>
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
			<li><a class="icon" href="../manage/weeklyMeeting!showMeetingRoom.action" target="navTab" rel=""><span>会议室占用情况</span></a></li>
			<li><a class="icon" href="../manage/weeklyMeeting!queryMeetingList.action" target="navTab" rel="currentNavTab"><span>全部会议</span></a></li>
			
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="30">序号</th>
					<th width="160" colspan="2">时间</th>
					<th width="180">会议名称</th>
					<th width="80">主持人</th>
					<th width="80">召集人</th>
					<th width="">参会人</th>
					<th width="160">地点</th>
					<!-- <th width="">流程编号</th> -->
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" width="20%" id="date"><s:date name="beginDate" format="E"/> </td>
					<td align="center" width="80%"><s:date name="beginDate" format="HH:mm"/>-<s:date name="endDate" format="HH:mm"/> </td>
					<td align="center" title=<s:property value="subject"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="subject"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="host.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="convener.name"/></td>
					<td align="center" title=<s:property value="participantName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="participantName"/></td>
					<td align="center" title=<s:property value="address"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="address"/></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="processInstId"/></td> --%>
					<td align="center">
						<a href="../manage/weeklyMeeting!showQueryMeeting.action?meetingId=<s:property value="id"/>" target="dialog" width="600" height="400" >详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

