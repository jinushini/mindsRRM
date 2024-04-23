<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	var s=jd("#summaryDiv").html();
	
	jd("#summaryIframe")[0].contentWindow.document.write(s);

	//双击事件
	jd("tbody tr").dblclick(function(){
		$(this).find(".process").click();
	})
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<div class="pageFormContent" layoutH="58">
		<br/>
		<fieldset>
		<legend>评审会议报告</legend>
			<table class="list_table list" width="98%">
				<tbody>
					<tr >
						<th>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</th>
						<td><s:property value="meeting.code"/></td>
					</tr>
					<tr>
						<th >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</th>
						<td style="color:red;"><s:property value="meeting.security"/></td>
					</tr>
					<tr>
						<th>阶段标记</th>
						<td><s:property value="meeting.stage"/></td>
					</tr>
					<tr>
						<th colspan="2"><s:property value="meeting.code"/></th>
					</tr>
					<tr>
						<th colspan="2" style="font-size: 20px;font-weight: 2;">评审证明书</th>

					</tr>
					<tr>
						<th>产品代号：</th>
						<td><s:property value="meeting.productCode"/></td>
					</tr>
					<tr>
						<th>产品名称：</th>
						<td><s:property value="meeting.productName"/></td>
					</tr>
					<tr>
						<th>所属系统：</th>
						<td><s:property value="meeting.modelName"/></td>
					</tr>
					<tr>
						<th>评审级别：</th>
						<td>
							<s:iterator value="reviewLevels" status="st" >
								<s:if test="value == meeting.reviewLevel">√<s:property value="value"/>&nbsp;&nbsp;</s:if>
								<s:else>□<s:property value="value"/>&nbsp;&nbsp;</s:else>
							</s:iterator>
							<%-- <s:property value="meeting.reviewLevel"/> --%>
						</td>
					</tr>
					<tr>
						<th>评审类别：</th>
						<td>
							<s:iterator value="reviewCategorys" status="st" >
								<s:if test="value == meeting.reviewCategory">√<s:property value="value"/>&nbsp;&nbsp;</s:if>
								<s:else>□<s:property value="value"/>&nbsp;&nbsp;</s:else>
							</s:iterator>
							<%-- <s:property value="meeting.reviewCategory"/> --%>
						</td>
					</tr>
					<tr>
						<th>日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：</th>
						<td><s:date name="meeting.beginDate" format="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<th colspan="1" align="center">评审文件</th>
						<td colspan="3">
							<s:iterator value="meetingFiles" status="st">															
								<s:if test="use=='评审文件'">								
								<div style="float:left;margin:0 5px;clear:both;">								
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>								
								<br />
								</s:if>
							</s:iterator>						
						</td>
					</tr>
					<tr>
						<th colspan="1" align="center">备查文件</th>
						<td colspan="3">
							<s:iterator value="meetingFiles" status="st">								
								<s:if test="use=='备查文件'">
								<div style="float:left;margin:0 5px;clear:both;">							
									<a href="<s:property value="filePath"/>" download="<s:property value='meetingFileName' />" style="color:green"><s:property value="meetingFileName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>
								<br />
								</s:if>
							</s:iterator>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="color: red;">以下是会议纪要</td>
					</tr>
					
					<tr>
						<td colspan="4" style="height: 700px;">
							<iframe frameborder="0" id="summaryIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
								<s:property value="meeting.summaryStr" escape="false"/>
							</iframe>
							<div id="summaryDiv" style="display: none;">
							<s:property value="meeting.summaryStr" escape="false"/>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
		<legend><s:property value="meeting.subject"/>待办事项</legend>
			<table class="list_table list" width="98%">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="20%">待办事项描述</th>
						<th width="40%">待办事项落实情况</th>
						<th width="6%">责任人</th>
						<th width="6%">完成形式</th>
						<th width="6%">要求完成时间</th>
						<th width="6%">状态</th>
						<th width="12%">文档</th>
						<th style="display:none;">查看</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st">
						<tr>
							<td align="center"><s:property value="#st.index+1"/></td>
							<td style="font-weight: bold;"><s:property value="taskDefinitionStr"/></td>
							<td <s:if test="feedbackInfoStr==null">style="color:red;"</s:if>>
								<s:property value="feedbackInfoStr==null?'无':feedbackInfoStr" escape="false"/>
							</td>
							<td align="center" style="font-weight: bold;"><s:property value="receiveUser.name"/></td>
							<td align="center"><s:property value="completeForm"/></td>
							<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd" /></td>
							<td align="center"<s:if test="status==3">style="color:green;"</s:if><s:else>style="color:red;"</s:else>>
								<s:property value="status==3?'已完成':status==0?'已取消':'未完成'"/>							
							</td>							
							<td>
								<s:iterator value="dispatchFiles" status="st">	
									<em style="font-family: YouYuan;"><s:property value="#st.index+1"/>、</em>							
									<a href="<s:property value="taskFile"/>" style="color:green;"><s:property value="taskFileName" /></a><br/>
								</s:iterator>
							</td>
							<td style="display:none;"><a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog" rel="dialog1" class="process">查看</a></td>
						</tr> 
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
		<legend>评审组签名</legend>
			<table class="list_table list" width="98%">
				<thead>
					<tr>
						<!-- <th width="3%">序号</th> -->
						<th width="5%">角色</th>
						<th width="8%">姓名</th>
						<th width="10%">单位</th>
						<th width="10%">职务</th>
						<th width="10%">职称</th>
						<!-- <th width="10%">状态</th> -->
						<th width="10%">签名</th>
						<th width="6%">时间</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="userList" status="st">
						<s:if test="role=='组长'">
							<tr>
								<%-- <td align="center"><s:property value="#st.index+1"/></td> --%>
								<td align="center"><s:property value="role"/></td>
								<td align="center"><s:property value="name"/></td>
								<td align="center"><s:property value="organization"/></td>
								<td align="center"><s:property value="duty"/></td>
								<td align="center"><s:property value="position"/></td>
								<%-- <td align="center"><s:property value="status"/></td> --%>
								<td align="center"><div style="float:center;width:88px;margin:0 5px;clear:both;"><img src="<s:property value="handWritten"/>" style="width:120px;height:40px;"/></div></td>
								<td align="center"><s:date name="readTime" format="yyyy-MM-dd"/></td>
							</tr> 
						</s:if>
					</s:iterator>
					<s:iterator value="userList" status="st">
						<s:if test="role=='组员'">
						<tr>
								<%-- <td align="center"><s:property value="#st.index+1"/></td> --%>
								<td align="center"><s:property value="role"/></td>
								<td align="center"><s:property value="name"/></td>
								<td align="center"><s:property value="organization"/></td>
								<td align="center"><s:property value="duty"/></td>
								<td align="center"><s:property value="position"/></td>
								<%-- <td align="center"><s:property value="status"/></td> --%>
								<td align="center">
									<s:if test="status==1">
										<div style="float:center;width:88px;margin:0 5px;clear:both;"><img src="<s:property value="handWritten"/>" style="width:120px;height:40px;"/></div>
									</s:if>
									<s:else></s:else>
								</td>
								<td align="center"><s:date name="readTime" format="yyyy-MM-dd"/></td>
							</tr> 
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li><a class="button" id="print"href="../meeting/reviewMeeting!printMeeting.action?meetingId=<s:property value='meeting.id'/>"><span>生成报告</span></a></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>