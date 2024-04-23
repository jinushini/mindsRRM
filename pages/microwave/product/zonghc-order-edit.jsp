<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	/* //提交按钮
	jn("#submit").click(function(){
		var num = <s:property value="num"/>;
		if(num==1){
			alert("功能暂未开放！");
			return false;
		}
		return true;
	})
	*/
	//校验日期格式
	function checkDate(obj){
		var reg =  /^(\d{4})-(\d{1,2})-(\d{1,2})$/;
		var val = obj.value;
		if(!reg.test(val) || !(RegExp.$2 <= 12) || !(RegExp.$3 <= 31)){
			alert("请输入正确的日期格式");
			obj.focus;
		}
	}
</script>
<div class="pageContent">
  <form method="post" action="../microwave/product_ProductOrder_saveOrEdit_order-list.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="num" value="<s:property value="num"/>"/>
	<input type="hidden" name="productOrder.id" value="<s:property value="productOrder.id"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:if test="num != null">编辑</s:if><s:else>新增</s:else>订单</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">所属项目：</td>
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
				<td align="center" style="font-weight: bold;">图纸代号：</td>
				<td><input type="text" name="productOrder.selProdCode" value="<s:property value='productOrder.selProdCode'/>"></td>
				<td align="center" style="font-weight: bold;">MES系统生产编号：</td>
				<td><input type="text" name="productOrder.mesCode" value="<s:property value='productOrder.mesCode'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单数量：</td>
				<td><input type="text" name="productOrder.orderNum" value="<s:property value='productOrder.orderNum'/>" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
			
				<td align="center" style="font-weight: bold;">研制阶段：</td>
				<%-- <td><input type="text" name="productOrder.phase" value="<s:property value='productOrder.phase'/>"></td> --%>
				<td>
					<select name="productOrder.phase">
						<option value="<s:property value='productOrder.phase'/>" disabled selected hidden><s:property value='productOrder.phase'/></option>
						<option value="M" <s:if test="'M' == productOrder.phase">selected='selected'</s:if>>M</option>
						<option value="C" <s:if test="'C' == productOrder.phase">selected='selected'</s:if>>C</option>
						<option value="C-J" <s:if test="'C-J' == productOrder.phase">selected='selected'</s:if>>C-J</option>
						<option value="Z" <s:if test="'Z' == productOrder.phase">selected='selected'</s:if>>Z</option>
						<option value="Z1" <s:if test="'Z1' == productOrder.phase">selected='selected'</s:if>>Z1</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">研制模式：</td>
				<%-- <td><input type="text" name="productOrder.researchingMode" value="<s:property value='productOrder.researchingMode'/>"></td> --%>
				<td>
					<select name="productOrder.researchMode">
						<option value="<s:property value='productOrder.researchMode'/>" disabled selected hidden><s:property value='productOrder.researchMode'/></option>
						<option value="自研" <s:if test="'自研' == productOrder.researchMode">selected='selected'</s:if>>自研</option>
						<option value="外购" <s:if test="'外购' == productOrder.researchMode">selected='selected'</s:if>>外购</option>
						<option value="生产外协" <s:if test="'生产外协' == productOrder.researchMode">selected='selected'</s:if>>生产外协</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">主管设计师：</td>
				<!-- <td><input type="text" name="productOrder.singleHead"></td> -->
				<td>
					<input name="productOrder.singleHead.id" type="hidden" class="required" value="<s:property value='productOrder.singleHead.id'/>">
					<input name="productOrder.singleHead.name" type="text" class="required" value="<s:property value='productOrder.singleHead.name'/>" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">合同编号：</td>
				<td><input type="text" name="productOrder.orderCode" value="<s:property value='productOrder.orderCode'/>"></td>
				<td align="center" style="font-weight: bold;">计划管理：</td>
				<!-- <td><input type="text" name="productOrder.planManager"></td> -->
				<td>
					<input name="productOrder.designPlanManager.id" type="hidden" class="required" value="<s:property value='productOrder.designPlanManager.id'/>">
					<input name="productOrder.designPlanManager.name" type="text" class="required" value="<s:property value='productOrder.designPlanManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">订单完成形式：</td>
				<td><input type="text" name="productOrder.completeTarget" value="<s:property value='productOrder.completeTarget'/>"></td>
				<td align="center" style="font-weight: bold;">任务来源：</td>
				<td>
					<select name="productOrder.taskSource">
						<option value="<s:property value='productOrder.taskSource'/>" disabled selected hidden><s:property value='productOrder.taskSource'/></option>
						<option value="宇航型号" <s:if test="'宇航型号' == productOrder.taskSource">selected='selected'</s:if>>宇航型号</option>
						<option value="宇航能力" <s:if test="'宇航能力' == productOrder.taskSource">selected='selected'</s:if>>宇航能力</option>
						<option value="研发" <s:if test="'研发' == productOrder.taskSource">selected='selected'</s:if>>研发</option>
						<option value="横向" <s:if test="'横向' == productOrder.taskSource">selected='selected'</s:if>>横向</option>
						<option value="所间配套" <s:if test="'所建配套' == productOrder.taskSource">selected='selected'</s:if>>所间配套</option>
						<option value="所内配套" <s:if test="'所内配套' == productOrder.taskSource">selected='selected'</s:if>>所内配套</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">分院考核计划开始时间：</td>
				<td><input name="productOrder.assessPlanBD" readonly="readonly" value="<s:date name='productOrder.assessPlanBD' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">分院考核计划完成时间：</td>
				<td><input name="productOrder.assessPlanED" readonly="readonly" value="<s:date name='productOrder.assessPlanED' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">实际开始时间：</td>
				<td><input name="productOrder.actualBD" readonly="readonly" value="<s:date name='productOrder.actualBD' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">实际完成时间：</td>
				<td><input name="productOrder.actualED" readonly="readonly" value="<s:date name='productOrder.actualED' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">交付情况：</td>
				<td>
					<select name="productOrder.deliveryState">
						<option value="<s:property value='productOrder.deliveryState'/>" disabled selected hidden><s:property value='productOrder.deliveryState'/></option>
						<option value="已完成" <s:if test="'已完成' == productOrder.deliveryState">selected='selected'</s:if>>已完成</option>
						<option value="未完成" <s:if test="'未完成' == productOrder.deliveryState">selected='selected'</s:if>>未完成</option>
						<option value="已取消" <s:if test="'订单取消' == productOrder.deliveryState">selected='selected'</s:if>>订单取消</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">最新计划交付时间：</td>
				<td><input name="productOrder.latestDeliveryPD" readonly="readonly" value="<s:date name='productOrder.latestDeliveryPD' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">当前研制状态：</td>
				<td>
					<select name="productOrder.currentState">
						<option value="<s:property value='productOrder.currentState'/>" disabled selected hidden><s:property value='productOrder.currentState'/></option>
						<option value="未开始" <s:if test="'未开始' == productOrder.currentState">selected='selected'</s:if>>未开始</option>
						<option value="产品设计" <s:if test="'产品设计' == productOrder.currentState">selected='selected'</s:if>>产品设计</option>
						<option value="生产准备" <s:if test="'生产准备' == productOrder.currentState">selected='selected'</s:if>>生产准备</option>
						<option value="产品装调" <s:if test="'产品装调' == productOrder.currentState">selected='selected'</s:if>>产品装调</option>
						<option value="测试试验" <s:if test="'测试试验' == productOrder.currentState">selected='selected'</s:if>>测试试验</option>
						<option value="待交付" <s:if test="'待交付' == productOrder.currentState">selected='selected'</s:if>>待交付</option>
						<option value="" <s:if test="'' == productOrder.currentState">selected='selected'</s:if>></option>
					</select>
				</td>
			</tr>
			<tr>	
				<td align="center" style="font-weight: bold;">当前存在问题：</td>
				<td colspan="3"><input type="text" name="productOrder.currentIssue" value="<s:property value='productOrder.currentIssue'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">专业分类：</td>
				<td>
					<select name="productOrder.classification" class="classification">
						<option value="<s:property value='productOrder.classification'/>" disabled selected hidden><s:property value='productOrder.classification'/></option>
						<option value="普通电源" <s:if test="'普通电源' == productOrder.classification">selected='selected'</s:if>>普通电源</option>
						<option value="模块" <s:if test="'模块' == productOrder.classification">selected='selected'</s:if>>模块</option>
						<option value="微波有源整机" <s:if test="'微波有源整机' == productOrder.classification">selected='selected'</s:if>>微波有源整机</option>
						<option value="微波有源组件" <s:if test="'微波有源组件' == productOrder.classification">selected='selected'</s:if>>微波有源组件</option>
						<option value="固态功率放大器" <s:if test="'固态功率放大器' == productOrder.classification">selected='selected'</s:if>>固态功率放大器</option>
						<option value="行波管放大器" <s:if test="'行波管放大器' == productOrder.classification">selected='selected'</s:if>>行波管放大器</option>
						<option value="普通无源" <s:if test="'普通无源' == productOrder.classification">selected='selected'</s:if>>普通无源</option>
						<option value="输入多工器" <s:if test="'输入多工器' == productOrder.classification">selected='selected'</s:if>>输入多工器</option>
						<option value="输出多工器" <s:if test="'输出多工器' == productOrder.classification">selected='selected'</s:if>>输出多工器</option>
						<option value="无源组件" <s:if test="'无源组件' == productOrder.classification">selected='selected'</s:if>>无源组件</option>
						<option value="微波开关" <s:if test="'微波开关' == productOrder.classification">selected='selected'</s:if>>微波开关</option>
						<option value="元器件" <s:if test="'元器件' == productOrder.classification">selected='selected'</s:if>>元器件</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">产品种类：</td>
				<td><input type="text" name="productOrder.category" readonly="readonly" value="<s:property value='productOrder.category'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">选用类型：</td>
				<%-- <td><input type="text" name="productOrder.selectType" value="<s:property value='productOrder.selectType'/>"></td> --%>
				<td>
					<select name="productOrder.selectType">
						<option value="<s:property value='productOrder.selectType'/>" disabled selected hidden><s:property value='productOrder.selectType'/></option>
						<option value="A" <s:if test="'A' == productOrder.selectType">selected='selected'</s:if>>A</option>
						<option value="B" <s:if test="'B' == productOrder.selectType">selected='selected'</s:if>>B</option>
						<option value="C" <s:if test="'C' == productOrder.selectType">selected='selected'</s:if>>C</option>
						<option value="D" <s:if test="'D' == productOrder.selectType">selected='selected'</s:if>>D</option>
						<option value="E" <s:if test="'E' == productOrder.selectType">selected='selected'</s:if>>E</option>
					</select>
				</td>
				<%-- <td align="center" style="font-weight: bold;">模块数量：</td>
				<td><input type="text" name="productOrder.modelNum" value="<s:property value='productOrder.modelNum'/>"></td> --%>
			</tr>
			<tr>
				<%-- <td align="center" style="font-weight: bold;">成熟度：</td>
				<td><input type="text" name="productOrder.maturity" value="<s:property value='productOrder.maturity'/>"></td>
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
				</td> --%>
				<td align="center" style="font-weight: bold;">订单年度：</td>
				<td><input type="text" name="productOrder.orderYear" value="<s:property value='productOrder.orderYear'/>"></td>
				<td align="center" style="font-weight: bold;">责任部门：</td>
				<td>
					<select name="productOrder.responsibleDept">
						<option value="<s:property value='productOrder.responsibleDept'/>" disabled selected hidden><s:property value='productOrder.responsibleDept'/></option>
						<option value="微波有源事业部" <s:if test="'微波有源事业部' == productOrder.responsibleDept">selected='selected'</s:if>>微波有源事业部</option>
						<option value="微波无源事业部" <s:if test="'微波无源事业部' == productOrder.responsibleDept">selected='selected'</s:if>>微波无源事业部</option>
						<option value="微波功率部件事业部" <s:if test="'微波功率部件事业部' == productOrder.responsibleDept">selected='selected'</s:if>>微波功率部件事业部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">用户单位：</td>
				<td><input type="text" name="productOrder.userUnit" value="<s:property value='productOrder.userUnit'/>"></td>
				<td align="center" style="font-weight: bold;">用户单位责任人：</td>
				<td><input type="text" name="productOrder.userUnitPIC" value="<s:property value='productOrder.userUnitPIC'/>"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">产品设计：</td>
				<%-- <td><input type="text" name="productOrder.designDate" value="<s:date name='productOrder.designDate' format='yyyy-MM-dd'/>" onblur="checkDate(this)"></td> --%>
				<td><input name="productOrder.designDate" readonly="readonly" value="<s:date name='productOrder.designDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">结构件加工：</td>
				<%-- <td><input type="text" name="productOrder.structureDate" value="<s:date name='productOrder.structureDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.structureDate" readonly="readonly" value="<s:date name='productOrder.structureDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件齐套：</td>
				<%-- <td><input type="text" name="productOrder.yuanqjDate" value="<s:date name='productOrder.yuanqjDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.yuanqjDate" readonly="readonly" value="<s:date name='productOrder.yuanqjDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">模块齐套：</td>
				<%-- <td><input type="text" name="productOrder.modelDate" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.modelDate" readonly="readonly" value="<s:date name='productOrder.modelDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>			
			<tr>
				<td align="center" style="font-weight: bold;">产品装调：</td>
				<%-- <td><input type="text" name="productOrder.machineDate" value="<s:date name='productOrder.machineDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.machineDate" readonly="readonly" value="<s:date name='productOrder.machineDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center" style="font-weight: bold;">测试试验：</td>
				<%-- <td><input type="text" name="productOrder.testDate" value="<s:date name='productOrder.testDate' format='yyyy-MM-dd'/>"></td> --%>
				<td><input name="productOrder.testDate" readonly="readonly" value="<s:date name='productOrder.testDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">投产方式：</td>
				<%-- <td><input type="text" name="productOrder.produceMode" value="<s:property value='productOrder.produceMode'/>"></td> --%>
				<td>
					<select name="productOrder.produceMode">
						<option value="<s:property value='productOrder.produceMode'/>" disabled selected hidden><s:property value='productOrder.produceMode'/></option>
						<option value="随整机投" <s:if test="'随整机投' == productOrder.produceMode">selected='selected'</s:if>>随整机投</option>
						<option value="单独投产" <s:if test="'单独投产' == productOrder.produceMode">selected='selected'</s:if>>单独投产</option>
					</select>
				</td>
				<td align="center" style="font-weight: bold;">投产数量：</td>
				<td><input type="text" name="productOrder.produceNum" value="<s:property value='productOrder.produceNum'/>" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
			</tr>
			<tr>
				<td align="center" style="font-weight: bold;">元器件等级：</td>
				<td><input type="text" name="productOrder.yuanqjLevel" value="<s:property value='productOrder.yuanqjLevel'/>"></td>
				<td align="center" style="font-weight: bold;">指令方式：</td>
				<%-- <td><input type="text" name="productOrder.instructionMode" value="<s:property value='productOrder.instructionMode'/>"></td> --%>
				<td>
					<select name="productOrder.instructionMode">
						<option value="<s:property value='productOrder.instructionMode'/>" disabled selected hidden><s:property value='productOrder.instructionMode'/></option>
						<option value="正脉冲" <s:if test="'正脉冲' == productOrder.instructionMode">selected='selected'</s:if>>正脉冲</option>
						<option value="负脉冲" <s:if test="'负脉冲' == productOrder.instructionMode">selected='selected'</s:if>>负脉冲</option>
						<option value="正脉冲矩阵" <s:if test="'正脉冲矩阵' == productOrder.instructionMode">selected='selected'</s:if>>正脉冲矩阵</option>
						<option value="负脉冲矩阵" <s:if test="'负脉冲矩阵' == productOrder.instructionMode">selected='selected'</s:if>>负脉冲矩阵</option>
					</select>
				</td>
			</tr>
			<tr>
				<%-- <td align="center" style="font-weight: bold;">产品类别：</td>
				<td><input type="text" name="productOrder.subType" value="<s:property value='productOrder.subType'/>"></td>
				<td>
					<select name="productOrder.subType">
						<option value="整机" <s:if test="'整机' == productOrder.subType">selected='selected'</s:if>>整机</option>
						<option value="模块" <s:if test="'模块' == productOrder.subType">selected='selected'</s:if>>模块</option>
						<option value="开关" <s:if test="'开关' == productOrder.subType">selected='selected'</s:if>>开关</option>
						<option value="元器件" <s:if test="'元器件' == productOrder.subType">selected='selected'</s:if>>元器件</option>
					</select>
				</td> --%>
				<td align="center" style="font-weight: bold;">备注：</td>
				<td><input type="text" name="productOrder.remarks" value="<s:property value='productOrder.remarks'/>"></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li> -->
		</ul>			
	</div>
   </form>
</div>