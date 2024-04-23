<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript"> 
</script>
<div class="pageContent">
  <form action="../fextends/test!modify.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  			<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
			<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
		<br/>
	<fieldset>
		<legend>修改</legend>
			<%-- <table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="20%">任务名称</th>
						<th width="20%">子任务</th>
						<th width="20%">处理人</th>
						<th width="12%">任务模板</th>
						<th width="8%">模板详情</th>
						<th width="8%">截止日期</th>
						<th width="5%">操作</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<tr>
						<td align="center"><input name="dispatchList[#index].taskType" value="" size="30%"></td>
						<td align="center"><input name="dispatchList[#index].taskName" value="" size="30%"></td>
						<td align="center">
							<input name="dispatchList[#index].receiveUserId" type="hidden" class="required" readonly="readonly"/>
							<input name="dispatchList[#index].receiveUserName" type="text" class="required" readonly="readonly" onclick="$(this).next().click()" size="50%"/>
							<a title="人员选择" height="410" width="715"
								href="../system/user!findMUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false">
							</a>
						</td>
						<td>
							<select name="dispatchList[#index].taskModel">
								<option value="">----基本版----</option>
								<s:iterator value="list" status="st">
									<option value="<s:property value="key"/>" ><s:property value="value"/></option>
								</s:iterator>
							</select>
						</td>
						<td>
							<!-- <input name="dispatchList[#index].filesource" value="" readonly="readonly" type="text"/> -->
							<input name="dispatchList[#index].taskDefinition" value="" readonly="readonly" type="hidden"/>
							<input name="dispatchList[#index].taskModelNum" style="width:70%;" type="text" suggestFields="taskModelNum,taskDefinition,filesource" suggestUrl="" lookupGroup="dispatchList[#index]" lookupPk="taskModelNum" readonly="readonly" onclick="$(this).next().click()"/>
							<a href="../dispatch/dispatch!inputTaskModel.action" lookupGroup="dispatchList[#index]" lookupPk="taskModelNum"></a>
						</td>
						<td><input name="dispatchList[#index].limdat" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
						<td align="center">					
							<!-- <a name="" href="###" >详情</a>| -->
							<a name="delBtn" href="###" style="color : red;">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset> --%>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>