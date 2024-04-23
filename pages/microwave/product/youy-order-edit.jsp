<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//提交按钮
	/* jn("#submit").click(function(){
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
	}); */
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
</script>
<div class="pageContent">
  <form action="../microwave/product_ProductOrder_modifyOrderDetail_<s:property value="data"/>.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="productOrder.id" value="<s:property value="productOrder.id"/>"/>
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>订单详情</legend>
		<table width="98%" class="edit_table" width="98%" style="margin:5px auto;">
			<s:if test="1 == 1">
				<tr>
					<td align="right" width="25%" style="font-weight: bold;">所属项目</td>
					<td><input type="text" name="productOrder.libCode" value="<s:property value='productOrder.libCode'/>"></td>
					<td align="right" width="25%" style="font-weight: bold;">是否新研</td>
					<td>
						<select name="productOrder.isNewResearch" >
							<option value="是" <s:if test='productOrder.isNewResearch=="是"'>selected="selected"</s:if>>是</option>
							<option value="否" <s:if test='productOrder.isNewResearch=="否"'>selected="selected"</s:if>>否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" width="25%" style="font-weight: bold;">用户单位</td>
					<td><input type="text" name="productOrder.userUnit" value="<s:property value='productOrder.userUnit'/>"></td>
					<td align="right" width="25%" style="font-weight: bold;">用户单位责任人</td>
					<td><input type="text" name="productOrder.userUnitPIC" value="<s:property value='productOrder.userUnitPIC'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设备名称</td>
					<td><input type="text" name="productOrder.name" value="<s:property value='productOrder.name'/>"></td>
					<td align="right" style="font-weight: bold;">设备代号</td>
					<td><input type="text" name="productOrder.code" value="<s:property value='productOrder.code'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">图纸代号</td>
					<td><input type="text" name="productOrder.selProdCode" value="<s:property value='productOrder.selProdCode'/>"></td>
					<td align="right" style="font-weight: bold;">频点信息</td>
					<td><input type="text" name="productOrder.freqInfo" value="<s:property value='productOrder.freqInfo'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">MES投产编号</td>
					<td><input type="text" name="productOrder.mesCode" value="<s:property value='productOrder.mesCode'/>"></td>
					<td align="right" style="font-weight: bold;">隶属设备名称</td>
					<td>
						<s:if test='productOrder.parentProductOrder==null'>
							<input type="text" name="productOrder.parentProdName" value='<s:property value="productOrder.parentProdName"/>'>
						</s:if>
						<s:else>
							<s:property value="productOrder.parentProductOrder.name"/>
						</s:else>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">隶属设备代号</td>
					<td>
						<s:if test='productOrder.parentProductOrder==null'>
							<input type="text" name="productOrder.parentProdCode" value='<s:property value="productOrder.parentProdCode"/>'>
						</s:if>
						<s:else>
							<s:property value="productOrder.parentProductOrder.code"/>
						</s:else>
					</td>
					<td align="right" style="font-weight: bold;">隶属设备图纸代号</td>
					<td>
						<s:if test='productOrder.parentProductOrder==null'>
							<input type="text" name="productOrder.parentSelProdCode" value='<s:property value="productOrder.parentSelProdCode"/>'>
						</s:if>
						<s:else>
							<s:property value="productOrder.parentProductOrder.selProdCode"/>
						</s:else>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">订单数量</td>
					<td><input type="text" name="productOrder.orderNum" value="<s:property value='productOrder.orderNum'/>"></td>
					<td align="right" style="font-weight: bold;">投产数量</td>
					<td><input type="text" name="productOrder.produceNum" value="<s:property value='productOrder.produceNum'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">任务来源</td>
					<td>
						<select name="productOrder.taskSource">
							<option value="<s:property value='productOrder.taskSource'/>" disabled selected hidden><s:property value='productOrder.taskSource'/></option>
							<option value="宇航型号" <s:if test="'宇航型号' == productOrder.taskSource">selected='selected'</s:if>>宇航型号</option>
							<option value="宇航能力" <s:if test="'宇航能力' == productOrder.taskSource">selected='selected'</s:if>>宇航能力</option>
							<option value="研发" <s:if test="'研发' == productOrder.taskSource">selected='selected'</s:if>>研发</option>
							<option value="横向" <s:if test="'横向' == productOrder.taskSource">selected='selected'</s:if>>横向</option>
							<option value="所间配套" <s:if test="'所间配套' == productOrder.taskSource">selected='selected'</s:if>>所间配套</option>
							<option value="所内配套" <s:if test="'所内配套' == productOrder.taskSource">selected='selected'</s:if>>所内配套</option>
						</select>
					</td>
					<td align="right" style="font-weight: bold;">选用类型</td>
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
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">研制阶段</td>
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
					<td align="right" style="font-weight: bold;">专业分类</td>
					<td>
						<select name="productOrder.classification">
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
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">产品种类</td>
					<td><input type="text" name="productOrder.category" value="<s:property value='productOrder.category'/>"></td>
					<td align="right" style="font-weight: bold;">责任部门</td>
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
					<td align="right" style="font-weight: bold;">工程化分离状态</td>
					<td><input type="text" name="productOrder.enginSeperateState" value="<s:property value='productOrder.enginSeperateState'/>"></td>
					<td align="right" style="font-weight: bold;">研制模式</td>
					<td>
						<select name="productOrder.researchMode">
							<option value="<s:property value='productOrder.researchMode'/>" disabled selected hidden><s:property value='productOrder.researchMode'/></option>
							<option value="自研" <s:if test="'自研' == productOrder.researchMode">selected='selected'</s:if>>自研</option>
							<option value="外购" <s:if test="'外购' == productOrder.researchMode">selected='selected'</s:if>>外购</option>
							<option value="生产外协" <s:if test="'生产外协' == productOrder.researchMode">selected='selected'</s:if>>生产外协</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">隶属班组</td>
					<td>
						<select name="productOrder.teamName">
							<option value="<s:property value='productOrder.teamName'/>" disabled selected hidden><s:property value='productOrder.teamName'/></option>
							<option value="整机组" <s:if test="'整机组' == productOrder.teamName">selected='selected'</s:if>>整机组</option>
							<option value="通道组" <s:if test="'通道组' == productOrder.teamName">selected='selected'</s:if>>通道组</option>
							<option value="新技术组" <s:if test="'新技术组' == productOrder.teamName">selected='selected'</s:if>>新技术组</option>
						</select>
					</td>
					<td align="right" style="font-weight: bold;">班组长</td>
					<td>
						<input name="productOrder.teamLead.id" type="hidden" value="<s:property value='productOrder.teamLead.id'/>">
						<input name="productOrder.teamLead.name" type="text" value="<s:property value='productOrder.teamLead.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计计划经理</td>
					<td>
						<input name="productOrder.designPlanManager.id" type="hidden" value="<s:property value='productOrder.designPlanManager.id'/>">
						<input name="productOrder.designPlanManager.name" type="text" value="<s:property value='productOrder.designPlanManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
					<td align="right" style="font-weight: bold;">生产计划经理</td>
					<td>
						<input name="productOrder.prodPlanManager.id" type="hidden" value="<s:property value='productOrder.prodPlanManager.id'/>">
						<input name="productOrder.prodPlanManager.name" type="text" value="<s:property value='productOrder.prodPlanManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">主管设计师</td>
					<td>
						<input name="productOrder.singleHead.id" type="hidden" value="<s:property value='productOrder.singleHead.id'/>">
						<input name="productOrder.singleHead.name" type="text" value="<s:property value='productOrder.singleHead.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
					<td align="right" style="font-weight: bold;">结构设计师</td>
					<td>
						<input name="productOrder.structureManager.id" type="hidden" value="<s:property value='productOrder.structureManager.id'/>">
						<input name="productOrder.structureManager.name" type="text" value="<s:property value='productOrder.structureManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">工艺设计师</td>
					<td>
						<input name="productOrder.technicalManager.id" type="hidden" value="<s:property value='productOrder.technicalManager.id'/>">
						<input name="productOrder.technicalManager.name" type="text" value="<s:property value='productOrder.technicalManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
					<td align="right" style="font-weight: bold;">产保工程师</td>
					<td>
						<input name="productOrder.prodAssureManager.id" type="hidden" value="<s:property value='productOrder.prodAssureManager.id'/>">
						<input name="productOrder.prodAssureManager.name" type="text" value="<s:property value='productOrder.prodAssureManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">质量管理人员</td>
					<td>
						<input name="productOrder.qualityManager.id" type="hidden" value="<s:property value='productOrder.qualityManager.id'/>">
						<input name="productOrder.qualityManager.name" type="text" value="<s:property value='productOrder.qualityManager.name'/>" onclick="$(this).next().click()" readonly="readonly">
						<a title="人员选择" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false">
						</a>
					</td>
					<td align="right" style="font-weight: bold;"></td>
					<td></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">生产厂家/外协单位</td>
					<td><input type="text" name="productOrder.outsourceUnit" value="<s:property value='productOrder.outsourceUnit'/>"></td>
					<td align="right" style="font-weight: bold;">外协单位负责人</td>
					<td><input type="text" name="productOrder.outsourceUnitPIC" value="<s:property value='productOrder.outsourceUnitPIC'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">分院考核计划开始时间</td>
					<%-- <input name="productOrder.currentDate" value="<s:date name='productOrder.currentDate' format='yyyy-MM-dd'/>"  onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字" type="text"> --%>
					<td><input type="text" name="productOrder.assessPlanBD" value="<s:date name='productOrder.assessPlanBD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">分院考核计划完成时间</td>
					<td><input type="text" name="productOrder.assessPlanED" value="<s:date name='productOrder.assessPlanED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">预计交付时间</td>
					<td><input type="text" name="productOrder.latestDeliveryPD" value="<s:date name='productOrder.latestDeliveryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">当前研制状态</td>
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
					<td align="right" style="font-weight: bold;">管控措施</td>
					<td><input type="text" name="productOrder.controlMeasure" value="<s:property value='productOrder.controlMeasure'/>"></td>
					<td align="right" style="font-weight: bold;">质量状态</td>
					<td><input type="text" name="productOrder.qualityState" value="<s:property value='productOrder.qualityState'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">风险项目</td>
					<td><input type="text" name="productOrder.riskProj" value="<s:property value='productOrder.riskProj'/>"></td>
					<td align="right" style="font-weight: bold;">验证项目</td>
					<td><input type="text" name="productOrder.valiProj" value="<s:property value='productOrder.valiProj'/>"></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">文献综述_计划时间</td>
					<td><input type="text" name="productOrder.literatureReviewPD" value="<s:date name='productOrder.literatureReviewPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">文献综述_结束时间</td>
					<td><input type="text" name="productOrder.literatureReviewED" value="<s:date name='productOrder.literatureReviewED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调研报告_计划时间</td>
					<td><input type="text" name="productOrder.researchReportPD" value="<s:date name='productOrder.researchReportPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">调研报告_结束时间</td>
					<td><input type="text" name="productOrder.researchReportED" value="<s:date name='productOrder.researchReportED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">任务书确认_计划时间</td>
					<td><input type="text" name="productOrder.taskDocConfirmPD" value="<s:date name='productOrder.taskDocConfirmPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">任务书确认_结束时间</td>
					<td><input type="text" name="productOrder.taskDocConfirmED" value="<s:date name='productOrder.taskDocConfirmED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">方案设计/项目建议书_计划时间</td>
					<td><input type="text" name="productOrder.schemeDesignDocPD" value="<s:date name='productOrder.schemeDesignDocPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">方案设计/项目建议书_结束时间</td>
					<td><input type="text" name="productOrder.schemeDesignDocED" value="<s:date name='productOrder.schemeDesignDocED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">元器件申报_计划时间</td>
					<td><input type="text" name="productOrder.yuanqjDeclarePD" value="<s:date name='productOrder.yuanqjDeclarePD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">元器件申报_结束时间</td>
					<td><input type="text" name="productOrder.yuanqjDeclareED" value="<s:date name='productOrder.yuanqjDeclareED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计仿真_计划时间</td>
					<td><input type="text" name="productOrder.designSimulatePD" value="<s:date name='productOrder.designSimulatePD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">设计仿真_结束时间</td>
					<td><input type="text" name="productOrder.designSimulateED" value="<s:date name='productOrder.designSimulateED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">接口单（电、力、热）_计划时间</td>
					<td><input type="text" name="productOrder.interfaceSheetPD" value="<s:date name='productOrder.interfaceSheetPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">接口单（电、力、热）_结束时间</td>
					<td><input type="text" name="productOrder.interfaceSheetED" value="<s:date name='productOrder.interfaceSheetED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计报告_计划时间</td>
					<td><input type="text" name="productOrder.designReportPD" value="<s:date name='productOrder.designReportPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">设计报告_结束时间</td>
					<td><input type="text" name="productOrder.designReportED" value="<s:date name='productOrder.designReportED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">验证件投产_计划时间</td>
					<td><input type="text" name="productOrder.cjIntoProductPD" value="<s:date name='productOrder.cjIntoProductPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">验证件投产_结束时间</td>
					<td><input type="text" name="productOrder.cjIntoProductED" value="<s:date name='productOrder.cjIntoProductED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">验证件总结_计划时间</td>
					<td><input type="text" name="productOrder.cjSummaryPD" value="<s:date name='productOrder.cjSummaryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">验证件总结_结束时间</td>
					<td><input type="text" name="productOrder.cjSummaryED" value="<s:date name='productOrder.cjSummaryED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">图纸绘制_计划时间</td>
					<td><input type="text" name="productOrder.drawingPD" value="<s:date name='productOrder.drawingPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">图纸绘制_结束时间</td>
					<td><input type="text" name="productOrder.drawingED" value="<s:date name='productOrder.drawingED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调试细则_计划时间</td>
					<td><input type="text" name="productOrder.debugDetailPD" value="<s:date name='productOrder.debugDetailPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">调试细则_结束时间</td>
					<td><input type="text" name="productOrder.debugDetailED" value="<s:date name='productOrder.debugDetailED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">采购规范/试验大纲_计划时间</td>
					<td><input type="text" name="productOrder.testOutlinePD" value="<s:date name='productOrder.testOutlinePD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">采购规范/试验大纲_结束时间</td>
					<td><input type="text" name="productOrder.testOutlineED" value="<s:date name='productOrder.testOutlineED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调测附件_计划时间</td>
					<td><input type="text" name="productOrder.testAnnexPD" value="<s:date name='productOrder.testAnnexPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">调测附件_结束时间</td>
					<td><input type="text" name="productOrder.testAnnexED" value="<s:date name='productOrder.testAnnexED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">借用分析报告_计划时间</td>
					<td><input type="text" name="productOrder.borrowAnalyseReportPD" value="<s:date name='productOrder.borrowAnalyseReportPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">借用分析报告_结束时间</td>
					<td><input type="text" name="productOrder.borrowAnalyseReportED" value="<s:date name='productOrder.borrowAnalyseReportED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">生产准备（元器件齐套）_计划时间</td>
					<td><input type="text" name="productOrder.prodPreparePD" value="<s:date name='productOrder.prodPreparePD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">生产准备（元器件齐套）_结束时间</td>
					<td><input type="text" name="productOrder.prodPrepareED" value="<s:date name='productOrder.prodPrepareED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">电子装联_计划时间</td>
					<td><input type="text" name="productOrder.eleAssemblyPD" value="<s:date name='productOrder.eleAssemblyPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">电子装联_结束时间</td>
					<td><input type="text" name="productOrder.eleAssemblyED" value="<s:date name='productOrder.eleAssemblyED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调试_计划时间</td>
					<td><input type="text" name="productOrder.debugPD" value="<s:date name='productOrder.debugPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">调试_结束时间</td>
					<td><input type="text" name="productOrder.debugED" value="<s:date name='productOrder.debugED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">封盖_计划时间</td>
					<td><input type="text" name="productOrder.capPD" value="<s:date name='productOrder.capPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">封盖_结束时间</td>
					<td><input type="text" name="productOrder.capED" value="<s:date name='productOrder.capED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">环境/筛选试验_计划时间</td>
					<td><input type="text" name="productOrder.environmentTestPD" value="<s:date name='productOrder.environmentTestPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">环境/筛选试验_结束时间</td>
					<td><input type="text" name="productOrder.environmentTestED" value="<s:date name='productOrder.environmentTestED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">数据判读_计划时间</td>
					<td><input type="text" name="productOrder.dataInterpretPD" value="<s:date name='productOrder.dataInterpretPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">数据判读_结束时间</td>
					<td><input type="text" name="productOrder.dataInterpretED" value="<s:date name='productOrder.dataInterpretED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">研制总结_计划时间</td>
					<td><input type="text" name="productOrder.researchSummaryPD" value="<s:date name='productOrder.researchSummaryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">研制总结_结束时间</td>
					<td><input type="text" name="productOrder.researchSummaryED" value="<s:date name='productOrder.researchSummaryED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">质量数据包审查报告_计划时间</td>
					<td><input type="text" name="productOrder.qdpReviewReportPD" value="<s:date name='productOrder.qdpReviewReportPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">质量数据包审查报告_结束时间</td>
					<td><input type="text" name="productOrder.qdpReviewReportED" value="<s:date name='productOrder.qdpReviewReportED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">交付入库_计划时间</td>
					<td><input type="text" name="productOrder.deliveryPD" value="<s:date name='productOrder.deliveryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
					<td align="right" style="font-weight: bold;">交付入库_结束时间</td>
					<td><input type="text" name="productOrder.deliveryED" value="<s:date name='productOrder.deliveryED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"   /></td>
				</tr>
			</s:if>
			<s:else>
				<tr>
					<td align="right" width="25%" style="font-weight: bold;">所属项目</td>
					<td colspan="3" style="font-weight: bold;"><s:property value='productOrder.libCode'/></td>
				</tr>
				<tr>
					<td align="right" width="25%" style="font-weight: bold;">用户单位</td>
					<td><s:property value='productOrder.userUnit'/></td>
					<td align="right" width="25%" style="font-weight: bold;">用户单位责任人</td>
					<td><s:property value='productOrder.userUnitPIC'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设备名称</td>
					<td><s:property value='productOrder.name'/></td>
					<td align="right" style="font-weight: bold;">设备代号</td>
					<td><s:property value='productOrder.code'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">产品化代号</td>
					<td><s:property value='productOrder.selProdCode'/></td>
					<td align="right" style="font-weight: bold;">MES投产编号</td>
					<td><s:property value='productOrder.mesCode'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">订单数量</td>
					<td><s:property value='productOrder.orderNum'/></td>
					<td align="right" style="font-weight: bold;">投产数量</td>
					<td><s:property value='productOrder.produceNum'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">模块隶属整机名称</td>
					<td><s:property value='productOrder.parentProdName'/></td>
					<td align="right" style="font-weight: bold;">模块隶属整机代号</td>
					<td><s:property value='productOrder.ParentProdCode'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">任务来源</td>
					<td><s:property value='productOrder.taskSource'/></td>
					<td align="right" style="font-weight: bold;">选用类型</td>
					<td><s:property value='productOrder.selectType'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">研制阶段</td>
					<td><s:property value='productOrder.phase'/></td>
					<td align="right" style="font-weight: bold;">专业分类</td>
					<td><s:property value='productOrder.classification'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">产品种类</td>
					<td><s:property value='productOrder.category'/></td>
					<td align="right" style="font-weight: bold;">研制部门</td>
					<td><s:property value='productOrder.responsibleDept'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">工程化分离状态</td>
					<td><s:property value='productOrder.enginSeperateState'/></td>
					<td align="right" style="font-weight: bold;">研制模式</td>
					<td><s:property value='productOrder.researchMode'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">隶属班组</td>
					<td><s:property value='productOrder.teamName'/></td>
					<td align="right" style="font-weight: bold;">班组长</td>
					<td><s:property value='productOrder.teamLead.name'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计计划经理</td>
					<td><s:property value='productOrder.designPlanManager.name'/></td>
					<td align="right" style="font-weight: bold;">生产计划经理</td>
					<td><s:property value='productOrder.prodPlanManager.name'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">主管设计师</td>
					<td><s:property value='productOrder.singleHead.name'/></td>
					<td align="right" style="font-weight: bold;">结构设计师</td>
					<td><s:property value='productOrder.structureManager.name'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">工艺设计师</td>
					<td><s:property value='productOrder.technicalManager.name'/></td>
					<td align="right" style="font-weight: bold;">产保工程师</td>
					<td><s:property value='productOrder.prodAssureManager.name'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">质量管理人员</td>
					<td><s:property value='productOrder.qualityManager.name'/></td>
					<td align="right" style="font-weight: bold;"></td>
					<td></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">外协单位</td>
					<td><s:property value='productOrder.outsourceUnit'/></td>
					<td align="right" style="font-weight: bold;">外协单位负责人</td>
					<td><s:property value='productOrder.outsourceUnitPIC'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">分院考核计划开始时间</td>
					<td><s:date name='productOrder.assessPlanBD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">分院考核计划完成时间</td>
					<td><s:date name='productOrder.assessPlanED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">预计交付时间</td>
					<td><s:date name='productOrder.latestDeliveryPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">当前研制状态</td>
					<td><s:property value='productOrder.currentState'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">管控措施</td>
					<td><s:property value='productOrder.controlMeasure'/></td>
					<td align="right" style="font-weight: bold;">质量状态</td>
					<td><s:property value='productOrder.qualityState'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">风险项目</td>
					<td><s:property value='productOrder.riskProj'/></td>
					<td align="right" style="font-weight: bold;">验证项目</td>
					<td><s:property value='productOrder.valiProj'/></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">文献综述_计划时间</td>
					<td><s:date name='productOrder.literatureReviewPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">文献综述_结束时间</td>
					<td><s:date name='productOrder.literatureReviewED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调研报告_计划时间</td>
					<td><s:date name='productOrder.researchReportPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">调研报告_结束时间</td>
					<td><s:date name='productOrder.researchReportED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">任务书确认_计划时间</td>
					<td><s:date name='productOrder.taskDocConfirmPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">任务书确认_结束时间</td>
					<td><s:date name='productOrder.taskDocConfirmED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">方案设计/项目建议书_计划时间</td>
					<td><s:date name='productOrder.schemeDesignDocPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">方案设计/项目建议书_结束时间</td>
					<td><s:date name='productOrder.schemeDesignDocED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">元器件申报_计划时间</td>
					<td><s:date name='productOrder.yuanqjDeclarePD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">元器件申报_结束时间</td>
					<td><s:date name='productOrder.yuanqjDeclareED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计仿真_计划时间</td>
					<td><s:date name='productOrder.designSimulatePD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">设计仿真_结束时间</td>
					<td><s:date name='productOrder.designSimulateED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">接口单（电、力、热）_计划时间</td>
					<td><s:date name='productOrder.interfaceSheetPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">接口单（电、力、热）_结束时间</td>
					<td><s:date name='productOrder.interfaceSheetED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">设计报告_计划时间</td>
					<td><s:date name='productOrder.designReportPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">设计报告_结束时间</td>
					<td><s:date name='productOrder.designReportED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">验证件投产_计划时间</td>
					<td><s:date name='productOrder.cjIntoProductPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">验证件投产_结束时间</td>
					<td><s:date name='productOrder.cjIntoProductED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">验证件总结_计划时间</td>
					<td><s:date name='productOrder.cjSummaryPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">验证件总结_结束时间</td>
					<td><s:date name='productOrder.cjSummaryED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">图纸绘制_计划时间</td>
					<td><s:date name='productOrder.drawingPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">图纸绘制_结束时间</td>
					<td><s:date name='productOrder.drawingED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调试细则_计划时间</td>
					<td><s:date name='productOrder.debugDetailPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">调试细则_结束时间</td>
					<td><s:date name='productOrder.debugDetailED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">采购规范/试验大纲_计划时间</td>
					<td><s:date name='productOrder.testOutlinePD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">采购规范/试验大纲_结束时间</td>
					<td><s:date name='productOrder.testOutlineED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调测附件_计划时间</td>
					<td><s:date name='productOrder.testAnnexPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">调测附件_结束时间</td>
					<td><s:date name='productOrder.testAnnexED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">借用分析报告_计划时间</td>
					<td><s:date name='productOrder.borrowAnalyseReportPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">借用分析报告_结束时间</td>
					<td><s:date name='productOrder.borrowAnalyseReportED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">生产准备（元器件齐套）_计划时间</td>
					<td><s:date name='productOrder.prodPreparePD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">生产准备（元器件齐套）_结束时间</td>
					<td><s:date name='productOrder.prodPrepareED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">电子装联_计划时间</td>
					<td><s:date name='productOrder.eleAssemblyPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">电子装联_结束时间</td>
					<td><s:date name='productOrder.eleAssemblyED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">调试_计划时间</td>
					<td><s:date name='productOrder.debugPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">调试_结束时间</td>
					<td><s:date name='productOrder.debugED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">封盖_计划时间</td>
					<td><s:date name='productOrder.capPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">封盖_结束时间</td>
					<td><s:date name='productOrder.capED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">环境/筛选试验_计划时间</td>
					<td><s:date name='productOrder.environmentTestPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">环境/筛选试验_结束时间</td>
					<td><s:date name='productOrder.environmentTestED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">数据判读_计划时间</td>
					<td><s:date name='productOrder.dataInterpretPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">数据判读_结束时间</td>
					<td><s:date name='productOrder.dataInterpretED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">研制总结_计划时间</td>
					<td><s:date name='productOrder.researchSummaryPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">研制总结_结束时间</td>
					<td><s:date name='productOrder.researchSummaryED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">质量数据包审查报告_计划时间</td>
					<td><s:date name='productOrder.qdpReviewReportPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">质量数据包审查报告_结束时间</td>
					<td><s:date name='productOrder.qdpReviewReportED' format='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td align="right" style="font-weight: bold;">交付入库_计划时间</td>
					<td><s:date name='productOrder.deliveryPD' format='yyyy-MM-dd' /></td>
					<td align="right" style="font-weight: bold;">交付入库_结束时间</td>
					<td><s:date name='productOrder.deliveryED' format='yyyy-MM-dd' /></td>
				</tr>
			</s:else>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<s:if test="1 == 1">
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			</s:if>
			<s:else>
				<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</s:else>
			
		</ul>			
	</div>
   </form>
</div>