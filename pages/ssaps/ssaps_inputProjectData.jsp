<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("#selectTemplate").change(function(){
		jn("#showNodes").empty();
		var flowTemplateId = jn("#selectTemplate").val();
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../ssaps/ssaps!showNodes.action",
			data:{
				flowTemplateId:flowTemplateId
			}, 
			success : function(data, statusText) {
				if(data != "nothing"){
					//解析json字符串
					var obj = eval('(' + data + ')');
					jn("#showNodes").append(
							"<tr>"
							+ "<td align='center'>阶段 </td>"
							+ "<td align='center'>开始时间</td>"
							+ "<td align='center'>结束时间</td>"
							+ "</tr>");
					for(var i in obj){
						jn("#showNodes").append(
								"<tr>"
								+ "<td align='center'>" + obj[i].nodesName + "<input name='flowNodesVoList[" + i +"].nodesName' type='hidden' value='"+ obj[i].nodesName +"'><input name='flowNodesVoList[" + i +"].nodesId' type='hidden' value='"+ obj[i].nodesId +"'></td>"
								+ "<td align='center'><input name='flowNodesVoList[" + i +"].scheduleDate.planBeginDate' readonly='readonly' onclick='WdatePicker();' type='text'></td>"							
								+ "<td align='center'><input name='flowNodesVoList[" + i +"].scheduleDate.planEndDate' readonly='readonly' onclick='WdatePicker();' type='text'></td>"
								+ "</tr>");
					}
					
					jn("#showNodes").show();
					
				}
				}
			});
	}); 
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../ssaps/ssaps!saveProjectData.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>任务录入</legend>
		<table bssaps="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<td><input type="text" name="ssaps.typeCode"></td>
				<td align="center" width="15%">型号名称：</td>
				<td align="center" width="35%"><input type="text" name="ssaps.typeName"></td>
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><input type="text" name="ssaps.productCode"></td>
				<td align="center">产品名称：</td>
				<td><input type="text" name="ssaps.productName"></td>
			</tr>
			<tr>
				<td align="center">分系统：</td>
				<td><input type="text" name="ssaps.modelName"></td>
				<td align="center">密级：</td>
				<td align="left">
					<select name="ssaps.security" width="50">
						<s:iterator value="securityList" status="st">
							<option value="<s:property value="key"/>"><s:property value="value"/></option>							
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">去型号化代号：</td>
				<td><input type="text" name="ssaps.code"></td>
				<td align="center">阶段：</td>
				<td><input type="text" name="ssaps.stage"></td>
			</tr>
			<tr>
				<td align="center">产品种类：</td>
				<td><input type="text" name="ssaps.type"></td>
				<td align="center">数量：</td>
				<td><input type="text" name="ssaps.amount"></td>
			</tr>
			<tr>
				<td align="center">元器件等级：</td>
				<td><input type="text" name="ssaps.grade"></td>
				<td align="center">生产编号：</td>
				<td><input type="text" name="ssaps.productionCode"></td>
			</tr>
			<tr>
				<td align="center">开始时间：</td>
				<td ><input name="ssaps.beginDate" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center">计划交付时间：</td>
				<td ><input name="ssaps.planDelivery" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center">生产单位：</td>
				<td><input type="text" name="ssaps.productionUnit"></td>
				<td align="center">单机主管：</td>
				<td colspan="1">
					<input name="ssaps.singleHead.id" type="hidden" class="required">
					<input name="ssaps.singleHead.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">产品保证：</td>
				<td colspan="1">
					<input name="ssaps.productManager.id" type="hidden" class="required">
					<input name="ssaps.productManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">质量管理：</td>
				<td colspan="1">
					<input name="ssaps.qualityManager.id" type="hidden" class="required">
					<input name="ssaps.qualityManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">计划管理：</td>
				<td colspan="1">
					<input name="ssaps.planManager.id" type="hidden" class="required">
					<input name="ssaps.planManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">模块计划管理：</td>
				<td colspan="1">
					<input name="ssaps.modelPlanManager.id" type="hidden" class="required">
					<input name="ssaps.modelPlanManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">结构主管：</td>
				<td colspan="1">
					<input name="ssaps.structureHeadId" type="hidden" class="">
					<input name="ssaps.structureHeadName" type="text" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">工艺主管：</td>
				<td colspan="1">
					<input name="ssaps.processSupervisorId" type="hidden">
					<input name="ssaps.processSupervisorName" type="text" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">选择模板：</td>
				<td>
					<select name="flowTemplateId" class="required" id="selectTemplate">
						<option value="">----流程模板----</option>
						<s:iterator value="list" status="st">
							<option value="<s:property value="id"/>"><s:property value="flowTemplateName"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
		</table>
		<table width="98%" class="edit_table" align="center" id="showNodes" style="display: none;">
		</table>
	</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<%-- <li><a class="button" href="../ssaps/ssaps!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>