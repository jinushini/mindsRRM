<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//提交按钮
	jn("#submit").click(function(){
		var op = <s:property value="op"/>;
		if(op==1){
			alert("功能暂未开放！");
			return false;
		}
		return true;
	})
	//专业分类和产品种类联动操作
	jn(".classification").change(function(){
		var classification = jn(this).val();
		jn(".category").empty()
		jn(".category").append("<option>---请选择---</option>");
		if("微波有源" == classification){
			jn(".category").append("<option value='低噪声放大器'>低噪声放大器</option>"
				+"<option value='电源'>电源</option>"
				+"<option value='固态放大器'>固态放大器</option>"
				+"<option value='频率源'>频率源</option>"
				+"<option value='微波接收机'>微波接收机</option>"
				+"<option value='微波通道'>微波通道</option>"
				+"<option value='行波管放大器'>行波管放大器</option>");
		}else if("微波无源" == classification){
			jn(".category").append("<option value='普通无源'>普通无源</option>"
				+"<option value='输出多工器'>输出多工器</option>"
				+"<option value='输入多工器'>输入多工器</option>"
				+"<option value='微波开关'>微波开关</option>"
				+"<option value='无源组件'>无源组件</option>");
			
		}
	});
</script>
<div class="pageContent">
  <form method="post" action="../microwave/product_ProductOrder_saveOrEdit_order-list.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="op" value="<s:property value="op"/>"/>
	<input type="hidden" name="productOrder.id" value="<s:property value="productOrder.id"/>"/>
	<input type="hidden" name="productOrder.scheduleDate.id" value="<s:property value="productOrder.scheduleDate.id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="op == 0 ? '编辑' : '新增'"/>订单</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">所属型号：</td>
				<td><input type="text" name="productOrder.libCode" readonly="readonly" value="<s:property value='productOrder.libCode'/>"></td>
				<%-- <td>
					<select name="productOrderOrder.productOrderLib.id">
						<s:iterator value="list">
							<option value="<s:property value="id"/>"><s:property value="modelCode"/></option>
						</s:iterator>
					</select>
				</td> --%>
			</tr>
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">设备代号：</td>
				<td><input type="text" name="productOrder.code" value="<s:property value='productOrder.code'/>"></td>
				<td align="center" style="font-weight: bold;">设备名称：</td>
				<td><input type="text" name="productOrder.name" value="<s:property value='productOrder.name'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品代号：</td>
				<td><input type="text" name="productOrder.selProdType" value="<s:property value='productOrder.selProdType'/>"></td>
				<td align="center" style="font-weight: bold;">MES产品代号：</td>
				<td><input type="text" name="productOrder.MESCode" value="<s:property value='productOrder.MESCode'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">数量：</td>
				<td><input type="text" name="productOrder.orderNum" value="<s:property value='productOrder.orderNum'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">研制阶段：</td>
				<td><input type="text" name="productOrder.phase" value="<s:property value='productOrder.phase'/>"></td>
				<td align="center" style="font-weight: bold;">研制模式：</td>
				<%-- <td><input type="text" name="productOrder.researchingMode" value="<s:property value='productOrder.researchingMode'/>"></td> --%>
				<td>
					<select name="productOrder.researchingMode">
						<option value="自制" <s:if test="'自制' == productOrder.researchingMode">selected='selected'</s:if>>自制</option>
						<option value="外购" <s:if test="'外购' == productOrder.researchingMode">selected='selected'</s:if>>外购</option>
						<option value="横向" <s:if test="'横向' == productOrder.researchingMode">selected='selected'</s:if>>横向</option>
						<option value="所建配套" <s:if test="'所建配套' == productOrder.researchingMode">selected='selected'</s:if>>所建配套</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">单机主管设计师：</td>
				<!-- <td><input type="text" name="productOrder.singleHead"></td> -->
				<td>
					<input name="productOrder.singleHead.id" type="hidden" class="required" value="<s:property value='productOrder.singleHead.id'/>">
					<input name="productOrder.singleHead.name" type="text" class="required" value="<s:property value='productOrder.singleHead.name'/>" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center" style="font-weight: bold;">订单号：</td>
				<td><input type="text" name="productOrder.orderCode" value="<s:property value='productOrder.orderCode'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">计划管理：</td>
				<!-- <td><input type="text" name="productOrder.planManager"></td> -->
				<td>
					<input name="productOrder.planManager.id" type="hidden" class="required" value="<s:property value='productOrder.planManager.id'/>">
					<input name="productOrder.planManager.name" type="text" class="required" value="<s:property value='productOrder.planManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center" style="font-weight: bold;">订单完成形式：</td>
				<td><input type="text" name="productOrder.completeTarget" value="<s:property value='productOrder.completeTarget'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">分院考核计划开始时间：</td>
				<!-- <td><input type="text" name="productOrder.startTime"></td> -->
				<td><input name="productOrder.scheduleDate.planBeginDate" readonly="readonly" value="<s:date name='productOrder.scheduleDate.planBeginDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">分院考核计划完成时间：</td>
				<!-- <td><input type="text" name="productOrder.planDelivery"></td> -->
				<td><input name="productOrder.scheduleDate.planBeginDate" readonly="readonly" value="<s:date name='productOrder.scheduleDate.planEndDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">实际开始时间：</td>
				<!-- <td><input type="text" name="productOrder.startTime"></td> -->
				<td><input name="productOrder.scheduleDate.actualBeginDate" readonly="readonly" value="<s:date name='productOrder.scheduleDate.actualBeginDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">实际完成时间：</td>
				<!-- <td><input type="text" name="productOrder.planDelivery"></td> -->
				<td><input name="productOrder.scheduleDate.actualEndDate" readonly="readonly" value="<s:date name='productOrder.scheduleDate.actualEndDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">交付情况：</td>
				<%-- <td><input type="text" name="productOrder.deliveryState" value="<s:property value='productOrder.deliveryState'/>"></td> --%>
				<td>
					<select name="productOrder.deliveryState">
						<option value="已完成" <s:if test="'已完成' == productOrder.deliveryState">selected='selected'</s:if>>已完成</option>
						<option value="未完成" <s:if test="'未完成' == productOrder.deliveryState">selected='selected'</s:if>>未完成</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">最新计划交付时间：</td>
				<%-- <td><input type="text" name="productOrder.currentDate" value="<s:date name='productOrder.currentDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.currentDate" readonly="readonly" value="<s:date name='productOrder.currentDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">当前研制阶段：</td>
				<%-- <td><input type="text" name="productOrder.currentPhase" value="<s:property value='productOrder.currentPhase'/>"></td> --%>
				<td>
					<select name="productOrder.currentPhase">
						<!-- <option value="" disabled selected hidden>请选择</option> -->
						<option value="单机设计" <s:if test="'单机设计' == productOrder.currentPhase">selected='selected'</s:if>>单机设计</option>
						<option value="生产准备" <s:if test="'生产准备' == productOrder.currentPhase">selected='selected'</s:if>>生产准备</option>
						<option value="整机电装" <s:if test="'整机电装' == productOrder.currentPhase">selected='selected'</s:if>>整机电装</option>
						<option value="整机调试" <s:if test="'整机调试' == productOrder.currentPhase">selected='selected'</s:if>>整机调试</option>
						<option value="测试实验" <s:if test="'测试实验' == productOrder.currentPhase">selected='selected'</s:if>>测试实验</option>
						<option value="待交付" <s:if test="'待交付' == productOrder.currentPhase">selected='selected'</s:if>>待交付</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">当前存在问题：</td>
				<td><input type="text" name="productOrder.currentIssue" value="<s:property value='productOrder.currentIssue'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">专业分类：</td>
				<%-- <td><input type="text" name="productOrder.classification" readonly="readonly" value="<s:property value='productOrder.classification'/>"></td> --%>
				<td>
					<select name="productOrder.classification" class="classification">
						<option>---请选择---</option>
						<option value="微波有源" <s:if test="'微波有源' == productOrder.classification">selected='selected'</s:if>>微波有源</option>
						<option value="微波无源" <s:if test="'微波无源' == productOrder.classification">selected='selected'</s:if>>微波无源</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">产品种类：</td>
				<%-- <td><input type="text" name="productOrder.category" readonly="readonly" value="<s:property value='productOrder.category'/>"></td> --%>
				<td>
					<select name="productOrder.category" class="category">
						<option>---请选择---</option>
						<option value="低噪声放大器" <s:if test="'低噪声放大器' == productOrder.category">selected='selected'</s:if>>低噪声放大器</option>
						<option value="电源" <s:if test="'电源' == productOrder.category">selected='selected'</s:if>>电源</option>
						<option value="固态放大器" <s:if test="'固态放大器' == productOrder.category">selected='selected'</s:if>>固态放大器</option>
						<option value="频率源" <s:if test="'频率源' == productOrder.category">selected='selected'</s:if>>频率源</option>
						<option value="微波接收机" <s:if test="'微波接收机' == productOrder.category">selected='selected'</s:if>>微波接收机</option>
						<option value="微波通道" <s:if test="'微波通道' == productOrder.category">selected='selected'</s:if>>微波通道</option>
						<option value="行波管放大器" <s:if test="'行波管放大器' == productOrder.category">selected='selected'</s:if>>行波管放大器</option>
						<option value="普通无源" <s:if test="'普通无源' == productOrder.category">selected='selected'</s:if>>普通无源</option>
						<option value="输出多工器" <s:if test="'输出多工器' == productOrder.category">selected='selected'</s:if>>输出多工器</option>
						<option value="输入多工器" <s:if test="'输入多工器' == productOrder.category">selected='selected'</s:if>>输入多工器</option>
						<option value="微波开关" <s:if test="'微波开关' == productOrder.category">selected='selected'</s:if>>微波开关</option>
						<option value="无源组件" <s:if test="'无源组件' == productOrder.category">selected='selected'</s:if>>无源组件</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">自制单机继承分类：</td>
				<%-- <td><input type="text" name="productOrder.selectType" value="<s:property value='productOrder.selectType'/>"></td> --%>
				<td>
					<select name="productOrder.selectType">
						<option value="A" <s:if test="'A' == productOrder.selectType">selected='selected'</s:if>>A</option>
						<option value="B" <s:if test="'B' == productOrder.selectType">selected='selected'</s:if>>B</option>
						<option value="C" <s:if test="'C' == productOrder.selectType">selected='selected'</s:if>>C</option>
						<option value="D" <s:if test="'D' == productOrder.selectType">selected='selected'</s:if>>D</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">微波模块：</td>
				<td><input type="text" name="productOrder.modelNum" value="<s:property value='productOrder.modelNum'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">成熟度：</td>
				<%-- <td><input type="text" name="productOrder.maturity" value="<s:property value='productOrder.maturity'/>"></td> --%>
				<td>
					<select name="productOrder.maturity">
						<option value="1" <s:if test="'1' == productOrder.maturity">selected='selected'</s:if>>1</option>
						<option value="2" <s:if test="'2' == productOrder.maturity">selected='selected'</s:if>>2</option>
						<option value="3" <s:if test="'3' == productOrder.maturity">selected='selected'</s:if>>3</option>
						<option value="4" <s:if test="'4' == productOrder.maturity">selected='selected'</s:if>>4</option>
						<option value="5" <s:if test="'5' == productOrder.maturity">selected='selected'</s:if>>5</option>
						<option value="6" <s:if test="'6' == productOrder.maturity">selected='selected'</s:if>>6</option>
						<option value="7" <s:if test="'7' == productOrder.maturity">selected='selected'</s:if>>7</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">订单年度：</td>
				<td><input type="text" name="productOrder.orderYear" value="<s:property value='productOrder.orderYear'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">责任单位：</td>
				<%-- <td><input type="text" name="productOrder.productionUnit" value="<s:property value='productOrder.productionUnit'/>"></td> --%>
				<td>
					<select name="productOrder.productionUnit">
						<option value="有源" <s:if test="'有源' == productOrder.productionUnit">selected='selected'</s:if>>有源</option>
						<option value="无源" <s:if test="'无源' == productOrder.productionUnit">selected='selected'</s:if>>无源</option>
						<option value="功率" <s:if test="'功率' == productOrder.productionUnit">selected='selected'</s:if>>功率</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">用户单位：</td>
				<td><input type="text" name="productOrder.userUnit" value="<s:property value='productOrder.userUnit'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">用户单位责任人：</td>
				<td><input type="text" name="productOrder.userUnitUser" value="<s:property value='productOrder.userUnitUser'/>"></td>
				<td align="center" style="font-weight: bold;">任务来源：</td>
				<%-- <td><input type="text" name="productOrder.taskSource" value="<s:property value='productOrder.taskSource'/>"></td> --%>
				<td>
					<select name="productOrder.taskSource">
						<option value="宇航型号" <s:if test="'宇航型号' == productOrder.taskSource">selected='selected'</s:if>>宇航型号</option>
						<option value="宇航能力" <s:if test="'宇航能力' == productOrder.taskSource">selected='selected'</s:if>>宇航能力</option>
						<option value="研发" <s:if test="'研发' == productOrder.taskSource">selected='selected'</s:if>>研发</option>
						<option value="横向" <s:if test="'横向' == productOrder.taskSource">selected='selected'</s:if>>横向</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">单机设计：</td>
				<%-- <td><input type="text" name="productOrder.designDate" value="<s:date name='productOrder.designDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.designDate" readonly="readonly" value="<s:date name='productOrder.designDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">结构件加工：</td>
				<%-- <td><input type="text" name="productOrder.structuralDate" value="<s:date name='productOrder.structuralDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.structuralDate" readonly="readonly" value="<s:date name='productOrder.structuralDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件齐套：</td>
				<%-- <td><input type="text" name="productOrder.componentsDate" value="<s:date name='productOrder.componentsDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.componentsDate" readonly="readonly" value="<s:date name='productOrder.componentsDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">模块齐套：</td>
				<%-- <td><input type="text" name="productOrder.modelDate" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.modelDate" readonly="readonly" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>			
			<tr>
				<td align="center" style="font-weight: bold;">整机装调：</td>
				<%-- <td><input type="text" name="productOrder.machineDate" value="<s:date name='productOrder.machineDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.modelDate" readonly="readonly" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">测试实验：</td>
				<%-- <td><input type="text" name="productOrder.testDate" value="<s:date name='productOrder.testDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.modelDate" readonly="readonly" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">单机交付：</td>
				<%-- <td><input type="text" name="productOrder.deliveryDate" value="<s:date name='productOrder.deliveryDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.deliveryDate" readonly="readonly" value="<s:date name='productOrder.deliveryDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">投产方式：</td>
				<%-- <td><input type="text" name="productOrder.produceMode" value="<s:property value='productOrder.produceMode'/>"></td> --%>
				<td>
					<select name="productOrder.produceMode">
						<option value="随整机投" <s:if test="'随整机投' == productOrder.produceMode">selected='selected'</s:if>>随整机投</option>
						<option value="单独投产" <s:if test="'单独投产' == productOrder.produceMode">selected='selected'</s:if>>单独投产</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">投产数量：</td>
				<td><input type="text" name="productOrder.produceNum" value="<s:property value='productOrder.produceNum'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件等级：</td>
				<td><input type="text" name="productOrder.componentLevel" value="<s:property value='productOrder.componentLevel'/>"></td>
				<td align="center" style="font-weight: bold;">指令方式：</td>
				<td><input type="text" name="productOrder.instructionMode" value="<s:property value='productOrder.instructionMode'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品类别：</td>
				<%-- <td><input type="text" name="productOrder.subType" value="<s:property value='productOrder.subType'/>"></td> --%>
				<td>
					<select name="productOrder.subType">
						<option value="整机" <s:if test="'整机' == productOrder.subType">selected='selected'</s:if>>整机</option>
						<option value="模块" <s:if test="'模块' == productOrder.subType">selected='selected'</s:if>>模块</option>
						<option value="开关" <s:if test="'开关' == productOrder.subType">selected='selected'</s:if>>开关</option>
						<option value="元器件" <s:if test="'元器件' == productOrder.subType">selected='selected'</s:if>>元器件</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">备注：</td>
				<td><input type="text" name="productOrder.remarks" value="<s:property value='productOrder.remarks'/>"></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>