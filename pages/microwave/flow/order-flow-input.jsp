<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("#saveBtn").click(function(){
		var processInstId = jn("#isstart").val("0");
		//处理index
		replaceIndex();
	});
	//处理index
	function replaceIndex(){
		var $tr = jn(".fluwRunConfig").find("tr")
		var $trlen = $tr.length;
		for(var i = 1 ; i < $trlen ; i ++){
			var $input = $tr.eq(i).find("input");
			var $inputlen = $input.length;
			for(var j = 0 ; j < $inputlen ; j ++){
				$name = $input.eq(j).attr("name");
				//flowRunNodeVoList[#index].nodesName
				var $tname = $name.substring($name.indexOf("["),$name.indexOf("."));
				$input.eq(j).attr("name",$name.replace($tname, "["+i+"]"));	
			}
		}
	}
	
	//保存并启动
	jn("#startBtn").click(function(){
		var processInstId = jn("#isstart").val("1");
		//处理index
		replaceIndex();
	});
	
	//删除
	jn("#deleteBtn").click(function(){
		var productOrderProId = jn("#id").val();
		alertMsg.confirm("残忍删除？", {
				okCall:function(){
					alert("此功尚未修炼！");
					//$.post("../manage/weeklyMeeting!deleteTemplate.action", {templateId:jn("#template").val()}, navTabAjaxDone, "json");
				},
				cancleCall:function(){}
		});
	});
</script>
<div class="pageContent">
  <form id="formdata" method="post" enctype="multipart/form-data" action='../microwave/flow_ProductOrderProAppr_saveAndSartProject.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" id="id" name="productOrderProId" value='<s:property value="productOrderPro.id"/>'/>
	<input type="hidden" id="processInstId" name="processInstId" value='<s:property value="productOrderPro.flowRun.processInstId"/>'/>
	<input type="hidden" id="isstart" name="isstart" value=''/>
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>选择产品</legend>
			<table bproduct="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center" width="30%">产品代号：</td>
					<td ><input type="hidden" name="id" value="" class="required" readonly="readonly"></td>
					<td>
						<input name="code" style="width:90%;" type="text" class="required" readonly="readonly" value="" suggestFields="code,name,id" suggestUrl="" lookupGroup="productOrder" lookupPk="code" onclick="$(this).next().attr('href','../microwave/product_ProductOrder_showZhengjiOrderList_order-list-dialog.action');$(this).next().click()"/>
						<a title="选择产品" class="model" href="###" lookupGroup="" lookupPk="code" target="dialog" width="1080" height="600" ></a>
					</td>
					<td align="center">产品名称：</td>
					<td>
						<input name="name" style="width:90%;" type="text"  class="required" readonly="readonly" value="" suggestFields="code,name,id" suggestUrl="" lookupGroup="productOrder" lookupPk="code" onclick="$(this).next().attr('href','../microwave/product_ProductOrder_showZhengjiOrderList_order-list-dialog.action');$(this).next().click()"/>
						<a title="选择产品" class="model" href="###" lookupGroup="" lookupPk="code" target="dialog" width="1080" height="600"></a>
					</td>
				</tr>
							
			</table>
			
			<legend>配置参数--<s:property value="productOrderPro.flowRun.flowName"/></legend>
			<table bproduct="0" width="98%" class="edit_table fluwRunConfig" align="center">
				<tr>
					<td align="center" width="3%">层级</td>
					<td align="center" width="25%">名称</td>
					<td align="center" width="15%">标准工时（天）</td>
					<td align="center" width="15%">计划开始时间</td>
					<td align="center" width="15%">计划结束时间</td>
					<td align="center" width="15%">计划工时（天）</td>
					<td align="center" width="12%">处理人</td>
				</tr>
				<s:iterator value="productOrderPro.flowRun.nodes" var="a">
					<tr class="node" level="1">
						<td align="center">1<input name="flowRunNodeVoList[#index].level" type="hidden" value="1"></td>
						<td style="color: green;"><s:property value="#attr.a.flowDefName"/><input name="flowRunNodeVoList[#index].nodesName" type="hidden" value='<s:property value="#attr.a.flowDefName"/>'><input name="flowRunNodeVoList[#index].nodesId" type="hidden" value='<s:property value="#attr.a.id"/>'></td>
						<td align="center"><input type="text" name="flowRunNodeVoList[#index].scheduleDate.standardHours" readonly="readonly" value='<s:property value="scheduleDate.standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
						<td align="center"><input class="startDate" name="flowRunNodeVoList[#index].scheduleDate.planBeginDate" readonly="readonly" value='<s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).val())+(($(this).parent().parent().find('.dates').val()-1)*1000*60*60*24)));} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
						<td align="center"><input class="endDate" name="flowRunNodeVoList[#index].scheduleDate.planEndDate" readonly="readonly" value='<s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
						<td align="center"><input class="dates" name="flowRunNodeVoList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours!=null?scheduleDate.manHours:scheduleDate.standardHours"/>' onblur="$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).parent().parent().find('.startDate').val())+(($(this).val()-1)*1000*60*60*24)));" style="width:98%;border:0;font-size:15px;text-align:center;" ></td>
						<td align="center">
							<input type="hidden" name="flowRunNodeVoList[#index].handler.id" value='<s:property value="user.id"/>'/>
							<input type="text" name="flowRunNodeVoList[#index].handler.name" value='<s:property value="user.name"/>' readonly="readonly" style="width:98%;border:0;font-size:15px;text-align:center;" />
						</td>
					</tr>
					<s:iterator value="#attr.a.flowRunDatas" var="b">
						<tr class="customflow" level="2">
							<td align="center">2<input name="flowRunNodeVoList[#index].level" type="hidden" value="2"></td>
							<td style="color: blue;"><span style="color: blue;">|——|</span><s:property value="#attr.b.flowName"/><input name="flowRunNodeVoList[#index].nodesName" type="hidden" value='<s:property value="#attr.b.flowName"/>'><input name="flowRunNodeVoList[#index].nodesId" type="hidden" value='<s:property value="#attr.b.id"/>'></td>
							<td align="center"><input type="text" name="flowRunNodeVoList[#index].scheduleDate.standardHours" readonly="readonly" value='<s:property value="scheduleDate.standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							<td align="center"><input class="startDate" name="flowRunNodeVoList[#index].scheduleDate.planBeginDate" readonly="readonly" value='<s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).val())+(($(this).parent().parent().find('.dates').val()-1)*1000*60*60*24)));} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							<td align="center"><input class="endDate" name="flowRunNodeVoList[#index].scheduleDate.planEndDate" readonly="readonly" value='<s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							<td align="center"><input class="dates" name="flowRunNodeVoList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours!=null?scheduleDate.manHours:scheduleDate.standardHours"/>' onblur="$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).parent().parent().find('.startDate').val())+(($(this).val()-1)*1000*60*60*24)));" style="width:98%;border:0;font-size:15px;text-align:center;" ></td>
							<td align="center">
								<input type="hidden" name="flowRunNodeVoList[#index].handler.id" value='<s:property value="user.id"/>'/>
								<input type="text" name="flowRunNodeVoList[#index].handler.name" value='<s:property value="user.name"/>' readonly="readonly" style="width:98%;border:0;font-size:15px;text-align:center;" />
							</td>
						</tr>
						<s:iterator value="#attr.b.subFlowRun.nodes" var="c">
							<tr class="customnode" level="3">
								<td align="center">3<input name="flowRunNodeVoList[#index].level" type="hidden" value="3"></td>
								<td style="color: red;"><span style="color: red;">|————|</span><s:property value="#attr.c.flowDefName"/><input name="flowRunNodeVoList[#index].nodesName" type="hidden" value='<s:property value="#attr.c.flowDefName"/>'><input name="flowRunNodeVoList[#index].nodesId" type="hidden" value='<s:property value="#attr.c.id"/>'></td>
								<td align="center"><input type="text" name="flowRunNodeVoList[#index].scheduleDate.standardHours" readonly="readonly" value='<s:property value="scheduleDate.standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								<td align="center"><input class="startDate" name="flowRunNodeVoList[#index].scheduleDate.planBeginDate" readonly="readonly" value='<s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).val())+(($(this).parent().parent().find('.dates').val()-1)*1000*60*60*24)));} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								<td align="center"><input class="endDate" name="flowRunNodeVoList[#index].scheduleDate.planEndDate" readonly="readonly" value='<s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								<td align="center"><input class="dates" name="flowRunNodeVoList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours!=null?scheduleDate.manHours:scheduleDate.standardHours"/>' onblur="$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).parent().parent().find('.startDate').val())+(($(this).val()-1)*1000*60*60*24)));" style="width:98%;border:0;font-size:15px;text-align:center;" ></td>
								<td align="center">
									<input type="hidden" name="flowRunNodeVoList[#index].handler.id" value='<s:property value="user.id"/>'/>
									<input type="text" name="flowRunNodeVoList[#index].handler.name" value='<s:property value="user.name"/>' readonly="readonly" style="width:98%;border:0;font-size:15px;text-align:center;" />
								</td>
							</tr>
							<s:iterator value="#attr.c.flowRunDatas" var="d">
								<tr class="actflow" level="4">
									<td align="center">4<input name="flowRunNodeVoList[#index].level" type="hidden" value="4"></td>
									<td style="color: orange;"><span style="color: red;">|———————|</span><s:property value="#attr.d.flowName"/><input name="flowRunNodeVoList[#index].nodesName" type="hidden" value='<s:property value="#attr.d.flowName"/>'><input name="flowRunNodeVoList[#index].nodesId" type="hidden" value='<s:property value="#attr.d.id"/>'></td>
									<td align="center"><input type="text" name="flowRunNodeVoList[#index].scheduleDate.standardHours" readonly="readonly" value='<s:property value="scheduleDate.standardHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
									<td align="center"><input class="startDate" name="flowRunNodeVoList[#index].scheduleDate.planBeginDate" readonly="readonly" value='<s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).val())+(($(this).parent().parent().find('.dates').val()-1)*1000*60*60*24)));} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
									<td align="center"><input class="endDate" name="flowRunNodeVoList[#index].scheduleDate.planEndDate" readonly="readonly" value='<s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/>' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
									<td align="center"><input class="dates" name="flowRunNodeVoList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours!=null?scheduleDate.manHours:scheduleDate.standardHours"/>' onblur="$(this).parent().parent().find('.endDate').val(convertToDate(Date.parse($(this).parent().parent().find('.startDate').val())+(($(this).val()-1)*1000*60*60*24)));" style="width:98%;border:0;font-size:15px;text-align:center;" ></td>
									<td align="center">
										<input type="hidden" name="flowRunNodeVoList[#index].handler.id" value='<s:property value="responsibleUser.id"/>'/>
										<input type="text" name="flowRunNodeVoList[#index].handler.name" value='<s:property value="responsibleUser.name"/>' readonly="readonly" onclick="$(this).next().click()" style="width:98%;border:0;font-size:15px;text-align:center;" />
										<a title="人员选择" height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
									</td>
								</tr>
							</s:iterator>
						</s:iterator>
					</s:iterator>
				</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" type="submit">保存</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="startBtn" type="submit">保存并启动</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="deleteBtn" type="button">删除</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>