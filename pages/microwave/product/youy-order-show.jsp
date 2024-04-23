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
	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>订单详情</legend>
		<table width="98%" class="edit_table" width="98%" style="margin:5px auto;">
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
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
</div>