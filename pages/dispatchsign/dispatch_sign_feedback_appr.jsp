<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//提交时动态区分行号
	jn("[type=submit]").click(function() {
		var $itemTr = jn("#itemList").find("tr").not(":eq(0)");
		for (var i = 0; i < $itemTr.length; i++) {
			var $input = $itemTr.eq(i).find("input");
			var $select = $itemTr.eq(i).find("select");

			for (var j = 0; j < $select.length; j++) {
				$select.eq(j).attr( "name", $select.eq(j).attr("name").replace( "#index", i));
			}
			for (var j = 0; j < $input.length; j++) {
				$input.eq(j).attr( "name", $input.eq(j).attr("name").replace( "#index", i));
			}

		}
	})
</script>
<div class="pageContent">
  <form method="post" action="../dispatchSign/dispatchSignAppr!appr.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>任务审核</legend>
			<table border="0" width="98%" class="edit_table" align="center" id="itemList">
				<tr>
					<th align="center" width="5%">序号</th>
					<th align="center" style="display: none;">待办ID</th>
					<th align="center" width="10%">待办事项描述</th>
					<th align="center" width="15%">待办事项落实情况</th>
					<th align="center" width="10%">文档</th>
					<th align="center" width="7%">责任人</th>
					<th align="center" width="7%">完成形式</th>
					<th align="center" width="7%">截止日期</th>
					<th align="center" width="7%">审批结论</th>
					<th align="center" width="20%">审批意见</th>
				</tr>			
				<s:iterator value="dispatchList" status="st">
					<tr>
						<td align="center"><s:property value="#st.index+1"/></td>
						<td align="center" style="display: none;"><input type="text" name="approveList[#index].dispatchSignId" value="<s:property value="id"/>" readonly="readonly"></td>
						<td><s:property value="taskDefinitionStr"/></td>
						<td><s:property value="feedbackInfoStr" escape="false"/></td>
						<td>
							<s:iterator value="dispatchFiles" status="st">	
									<em style="font-family: YouYuan;"><s:property value="#st.index+1"/>、</em>							
									<a href="<s:property value='filePath'/>" download="<s:property value='taskFileName' />" style="color:green;"><s:property value="taskFileName" /></a><br/>
								</s:iterator>
						</td>
						<td align="center"><s:property value="receiveUserName"/></td>
						<td align="center"><s:property value="completeForm"/></td>
						<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
						<td align="center" width="7%">
							<select id="combox" name="approveList[#index].resultCn" width="10">
								<option value="通过">通过</option>							
								<option value="不通过">不通过</option>							
							</select>
						</td>
						<td align="center"><input type="text" name="approveList[#index].comments" style="border:0;text-align:center;font-size:14px;" ></td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>