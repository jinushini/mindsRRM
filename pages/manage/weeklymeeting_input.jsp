<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
<!--
	jn("#submitBtn").click(function(){
		jn("#result").val(1);
	})
	
	jn("#cancelBtn").click(function(){
		jn("#result").val(2);
		jn(".required").removeClass("required");
	})
//-->
</script>

<div class="pageContent">
	<form method="post" id="searchFrm" action="../manage/weeklyMeeting!writeContent.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<input type="hidden" id="result" name="approve.result" value="">
		<div class="pageFormContent" layoutH="58">
			<br/>
			<br/>
			<div style="text-align: center;font-size: 20px;">
				<b>会议</b>
			</div>
			<table class="list_table edit_table" width="98%">
				<tbody>
					<tr>
						<th width='15%'>会议主题</th>
						<td colspan="3"><input name="meeting.subject" type="text" class="required"></td>
					</tr>
					<tr>
						<th width='15%'>会议地点</th>
						<!-- <td colspan="3"><input name="meeting.address" type="text" class="required"></td> -->
						<td colspan="3">
							<select class="combox" name="meeting.address" class="required">
								<option value="">----会议室----</option>
								<s:iterator value="list" status="st">
									<option value="<s:property value="key"/>"><s:property value="value" /></option>
								</s:iterator>
						</select>
						</td>
					</tr>
					<tr>
						<th width='15%'>开始时间</th>
						<td ><input name="meeting.beginDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" class="required"></td>
						<th width='15%'>结束时间</th>
						<td ><input name="meeting.endDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" class="required"></td>
					</tr>
					<tr>
						<th width='15%'>主持人</th>
						<td >
							<input name="meeting.host.id" type="hidden" class="required">
							<input name="meeting.host.name" type="text" class="required" onclick="$(this).next().click()">
							<a title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
						<th width='15%'>召集人</th>
						<td >
							<input name="meeting.convener.id" type="hidden" class="required">
							<input name="meeting.convener.name" type="text" class="required" onclick="$(this).next().click()">
							<a title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
					</tr>
					<tr>
						<th width='15%'>参会人</th>
						<td colspan="3">
							<input name="meeting.participantId" type="hidden" class="required">
							<input name="meeting.participantName" type="text" class="required" onclick="$(this).next().click()">
							<a title="人员选择" class="btnLook" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>		
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li><a target="ajaxTodo" rel="currentNavTab" class="button" href="../manage/weeklyMeeting!writeContent.action?taskId=<s:property value='taskId'/>&processInstId=<s:property value='processInstId'/>&approve.result=2"><span>等待下次召开</span></a></li>
			</ul>
		</div>
	</form>
</div>