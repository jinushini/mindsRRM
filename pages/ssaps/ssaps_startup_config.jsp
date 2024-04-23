<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

//提交前给节点金币集合加编号
$("[type=submit]").click(function() {
	for(var j=0;j<jd(".nodeCoinSet div").length;j++){
		$thisInputs = jd(".nodeCoinSet div").eq(j).find("input");
		for(var z=0;z<$thisInputs.length;z++){
			$thisInputs.eq(z).attr("name", $thisInputs.eq(z).attr("name").replace("#seq",j));
		}
	}
});
</script>
<div class="pageContent">
  <form method="post" action='../ssaps/ssapsController!startSubProcess.action' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input name="subFlowId" type="hidden" value="<s:property value="subFlowId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<input name="wasteVo.operationType" type="hidden" value="startup">
	<input name="wasteVo.scheduleDate.id" type="hidden" value="<s:property value='ssapsNodeData.scheduleDate.id'/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="ssapsNodeData.flowName"/>--参数配置</legend>
		<table bssaps="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center">任务名称</td>
				<td><input name="wasteVo.flowName" type="text" value="<s:property value="ssapsNodeData.flowName"/>"></td>
			</tr>
			<tr>
				<td align="center">开始时间</td>
				<td><input class="startDate" name="wasteVo.scheduleDate.planBeginDate" readonly="readonly" value="<s:date name="ssapsNodeData.scheduleDate.planBeginDate" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().parent().find('.dates').val(Math.abs(Date.parse($(this).val())-Date.parse($(this).parent().parent().parent().find('.endDate').val()))/1000/60/60/24+1);$(this).parent().parent().parent().find('.endDate').focus();} })"></td>
			</tr>
			<tr>
				<td align="center">结束时间</td>
				<td><input class="endDate" name="wasteVo.scheduleDate.planEndDate" readonly="readonly" value="<s:date name="ssapsNodeData.scheduleDate.planEndDate" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " ></td>
			</tr>
			<tr>
				<td align="center">工时/天</td>
				<td><input class="dates" name="wasteVo.scheduleDate.manHours" value="<s:property value="ssapsNodeData.scheduleDate.manHours"/>"></td>
			</tr>
			<tr>
				<td align="center">流程责任人：</td>
				<td colspan="1">
					<input name="wasteVo.responsibleId" type="hidden" class="required" value="<s:property value="ssapsNodeData.responsibleId"/>">
					<input name="wasteVo.responsibleName" type="text" class="required" onclick="$(this).next().click()" readonly="readonly"" value="<s:property value="ssapsNodeData.responsibleName"/>">
					<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">节点金币：</td>
				<td class="nodeCoinSet">
					<s:iterator value="ssapsNodeData.coinSet" >
						<div style="font-size:16px;width:100%">
							<input type="hidden" name="wasteVo.coinList[#seq].parentNodeName" value="<s:property value="parentNodeName" />" />
							<label style="width:20%;float:left;"><s:property value="parentNodeName" />:</label><input type="text" name="wasteVo.coinList[#seq].quantity" value="<s:property value='quantity'/>" style="padding:1px 1px; border:1px solid #ccc; height:15px; width:80%;"/>	<br/>
						</div>
					</s:iterator> 
				</td>
			</tr>		
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">启动</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>