<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
</script>
<div class="pageContent">
	<form id="form" method="post" class="pageForm required-validate">
		<div class="pageFormContent" layoutH="56">
	  		<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
			<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
			<input type="hidden" name="isNew" value="<s:property value="isNew"/>">
			<br/>
			<fieldset>
		<legend>待办事项</legend>
			<table class="list_table edit_table" width="98%" id="tb">
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="20%">待办事项描述</th>
						<th width="40%">待办事项落实情况</th>
						<th width="5%">责任人</th>
						<th width="5%">完成形式</th>
						<th width="5%">要求完成时间</th>
						<th width="5%">状态</th>
						<th width="12%">文档</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st">
						<tr id="<s:property value="processInstId"/>">
							<td align="center"><s:property value="#st.index+1"/><s:if test="initialDispatch != null"><a href="../dispatch/DispatchItem_findHistory_"></s:if></td>
							<td style="font-weight: bold;"><s:property value="taskDefinitionStr"/></td>
							<td <s:if test="feedbackInfoStr==null">style="color:red;"</s:if>>
								<s:property value="feedbackInfoStr==null?'无':feedbackInfoStr" escape="false"/>
							</td>
							<td align="center" style="font-weight: bold;"><s:property value="receiveUser.name"/></td>
							<td align="center"><s:property value="completeForm"/></td>
							<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd" /></td>
							<td class="status" align="center"<s:if test="businessStatus==3||businessStatus==5">style="color:green;"</s:if><s:elseif test="businessStatus==4">style="color:gray;"</s:elseif><s:else>style="color:red;"</s:else>>
								<s:property value="businessStatus==1?'待反馈':businessStatus==2?'待审核':businessStatus==3?'已移交':businessStatus==4?'已取消':businessStatus==5?'已完成':''"/>						
							</td>							
							<td>
								<s:iterator value="dispatchFiles" status="st">	
									<em style="font-family: YouYuan;"><s:property value="#st.index+1"/>、</em>							
									<a href="<s:property value="filePath"/>" download="<s:property value='taskFileName' />" style="color:green;"><s:property value="taskFileName" /></a><br/>
								</s:iterator>
							</td>
							
						</tr> 
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		</div>
	</form>
</div>