<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	var s=jd("#summaryDiv").html();
	jd("#summaryIframe")[0].contentWindow.document.write(s);
	
	jd("#preview").click(function(){
		jd("#cancelBtn").click();
	})
//-->
</script>
<div class="pageFormContent" layoutH="58">
	<div id="printId">
		<div id="wenjian_neirong">
		  <div id="miji">密级：<s:property value="meeting.security"/></div>
		  <div id="taitou"><img src="../../img/file_title.png" width="1863" height="266" alt="空间微波技术研究所文件" longdesc="#" /></div>
		<div id="wenjian_bianhao_he_qianfa">
		  <div id="wenjian_bianhao"><s:property value="meeting.fileCode"/></div>
		  <div id="qianfa">签发：<s:property value="meeting.host.name"/></div>
		</div>
		  <div id="huiyi_xinxi">
		    <div id="huiyi_xinxi_biaoti"><s:property value="meeting.subject"/></div>
		    <div id="huiyi_xinxi_neirong">
		      <table>
		        <tr>
		          <th scope="row">会议名称：</th>
		          <td><s:property value="meeting.subject"/></td>
		        </tr>
		        <tr>
		          <th scope="row">主持人：</th>
		          <td><s:property value="meeting.host.name"/></td>
		        </tr>
		        <tr>
		          <th scope="row">主办单位：</th>
		          <td><s:property value="meeting.sponsor"/></td>
		        </tr>
		        <tr>
		          <th scope="row">时间：</th>
		          <td><s:date name="meeting.beginDate" format="yyyy年MM月dd日"/></td>
		        </tr>
		        <tr>
		          <th scope="row">地点：</th>
		          <td><s:property value="meeting.address"/></td>
		        </tr>
		        <tr>
		          <th scope="row">参加人员：</th>
		          <td><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td>
		        </tr>
		      </table>
		    </div>
		    <div id="huiyi_zhengwen_biaoti">会议内容</div>
		    <div id="huiyi_zhengwen_neirong">
		      	<iframe frameborder="0" id="summaryIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					<s:property value="meeting.summaryStr" escape="false"/>
				</iframe>
				<div id="summaryDiv" style="display: none;"><s:property value="meeting.summaryStr.replaceAll('㊣', '')" escape="false"/></div>
				<%-- <s:property value="meeting.summaryStr.replaceAll('㊣', '')" escape="false"/> --%>
		    </div>
		    <div id="huiyi_chengsong">
		      <table>
		        <tr>
		          <th scope="row">主送：</th>
		          <td><s:property value="meeting.sendTo"/></td>
		        </tr>
		        <tr>
		          <th scope="row">抄送：</th>
		          <td><s:property value="meeting.carbonCopy"/></td>
		        </tr>
		        <tr>
		          <th scope="row">编写单位：</th>
		          <td><s:property value="meeting.sponsor"/>  <span><s:date name="meeting.issuedDate" format="yyyy年MM月dd日"/>印发</span></td>
		        </tr>
		      </table>
		    </div>
		  </div>
		</div>
		<div id="wenjian_fujian">
			<div id="wenjian_fujian_taitou">附件:</div>
		    <div id="wenjian_fujian_biaoti">待办事项清单</div>
		    <div id="wenjian_fujian_biaoge">
		    	<table>
				  <tr>
				    <th scope="col" width="3%">序号</th>
				    <th scope="col" width="20%">待办事项描述</th>
				    <th scope="col" width="5%">责任人</th>
				    <th scope="col" width="5%">完成形式</th>
				    <th scope="col" width="9%">要求完成时间</th>
				  </tr>
				  <s:iterator value="list" status="st">
					<tr class="taskList">
						<td align="center"><s:property value="#st.index+1"/></td>
						<td><s:property value="taskDefinitionStr"/></td>
						<td align="center"><s:property value="receiveUser.name"/></td>
						<td align="center"><s:property value="completeForm"/></td>
						<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy年MM月dd日" /></td>
					</tr> 
					</s:iterator>
				</table>
		    </div>
		</div>
	</div>
</div>
<div class="formBar">
	<ul>
		<s:if test="meeting.convener.id == currentUser.id"><li><a class="button" href="../manage/WeeklyMeeting_enterEditMeeting_meeting-summary-edit.action?meetingId=<s:property value='meeting.id'/>" target="dialog" width='900' height='800'><span>修改纪要</span></a></li></s:if>
		<li><a class="button" id="preview" target="navTab" href="../manage/WeeklyMeeting_printMeeting_meeting-signal-print.action?meetingId=<s:property value='meeting.id'/>"><span>打印预览（PDF）</span></a></li>
		<s:if test="meeting.category=='班组周例会'"><li><a class="button" id="print"href="../manage/WeeklyMeetingJsoupReport_createTeamStudyFile.action?meetingId=<s:property value='meeting.id'/>"><span>班组质量学习单</span></a></li></s:if>
		<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="" id="look">流程查看</button></div></div></li> -->
		<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
	</ul>
</div>
