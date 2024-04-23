<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

</script>
<div class="pageContent">
  <form method="post" action="../microwave/product_ProductDesign_add.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="taskId" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	<input type="hidden" name="productDesign.id" value="<s:property value="productDesign.id"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:if test="productDesign.id != null">订单完善</s:if><s:else>订单录入</s:else></legend>
		<table border="0" width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="15%">型号代号：</td>
				<td align="center">
					<select name="productDesign.productBasic.productLib.id">
						<s:iterator value="list">
							<option value="<s:property value="id"/>" <s:if test="id == productDesign.productBasic.productLib.id">selected="selected"</s:if>><s:property value="modelCode"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">产品代号：</td>
				<td><input type="text" name="productDesign.productBasic.code" value='<s:property value="productDesign.productBasic.code"/>'></td>
				<td align="center">产品名称：</td>
				<td><input type="text" name="productDesign.productBasic.name" value='<s:property value="productDesign.productBasic.name"/>'></td>
			</tr>
			<tr>
				<td align="center">去型号化代号：</td>
				<td><input type="text" name="productDesign.productBasic.selProdType" value='<s:property value="productDesign.productBasic.selProdType"/>'></td>
				<td align="center">研制阶段：</td>
				<td><input type="text" name="productDesign.productBasic.phase" value='<s:property value="productDesign.productBasic.phase"/>'></td>
			</tr>
			<tr>
				<td align="center">产品种类：</td>
				<td align="center">
					<select name="productDesign.productBasic.subType">
						<option value="单机" <s:if test="productDesign.productBasic.subType == '单机'">selected</s:if>>单机</option>
						<option value="模块" <s:if test="productDesign.productBasic.subType == '模块'">selected</s:if>>模块</option>
						<option value="开关" <s:if test="productDesign.productBasic.subType == '开关'">selected</s:if>>开关</option>
					</select>
				</td>
				<td align="center">关重件：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.criticalParts" value='<s:property value="productDesign.productBasic.criticalParts"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.criticalParts">
						<option value="null" <s:if test="productDesign.productBasic.criticalParts == 'null'">selected</s:if>>空</option>
						<option value="G" <s:if test="productDesign.productBasic.criticalParts == 'G'">selected</s:if>>G</option>
						<option value="Z" <s:if test="productDesign.productBasic.criticalParts == 'Z'">selected</s:if>>Z</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">元器件等级：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.componentLevel" value='<s:property value="productDesign.productBasic.componentLevel"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.componentLevel">
						<option value="宇航级" <s:if test="productDesign.productBasic.componentLevel == '宇航级'">selected</s:if>>宇航级</option>
						<option value="其他" <s:if test="productDesign.productBasic.componentLevel == '其他'">selected</s:if>>其他</option>
					</select>
				</td>
				<td align="center">研制模式：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.researchingMode" value='<s:property value="productDesign.productBasic.researchingMode"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.researchingMode">
						<option value="自研" <s:if test="productDesign.productBasic.researchingMode == '自研'">selected</s:if>>自研</option>
						<option value="外协" <s:if test="productDesign.productBasic.researchingMode == '外协'">selected</s:if>>外协</option>
					</select>
				</td>
				
			</tr>
			<tr>
				<td align="center">成熟度：</td>
				<td><input type="text" name="productDesign.productBasic.maturity" value='<s:property value="productDesign.productBasic.maturity"/>'></td>
				<td align="center">所属分系统：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.type" value='<s:property value="productDesign.productBasic.type"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.type">
						<option value="型号" <s:if test="productDesign.productBasic.type == '型号'">selected</s:if>>型号</option>
						<option value="分系统" <s:if test="productDesign.productBasic.type == '分系统'">selected</s:if>>分系统</option>
						<option value="子系统" <s:if test="productDesign.productBasic.type == '子系统'">selected</s:if>>子系统</option>
						<option value="单机" <s:if test="productDesign.productBasic.type == '单机'">selected</s:if>>单机</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">基线产品来源代号：</td>
				<td><input type="text" name="productDesign.productBasic.selProdSourceCode" value='<s:property value="productDesign.productBasic.selProdSourceCode"/>'></td>
				<td align="center">基线产品来源名称：</td>
				<td><input type="text" name="productDesign.productBasic.selProdSourceName" value='<s:property value="productDesign.productBasic.selProdSourceName"/>'></td>
			</tr>
			<tr>
				<td align="center">是否配套：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.isMatch" value='<s:property value="productDesign.productBasic.isMatch"/>'></td> --%>
				<td>
					<input type="radio" name="productDesign.productBasic.isMatch" value='<s:property value="1"/>' <s:if test="productDesign.productBasic.isMatch == '1'">selected</s:if>>是
					<input type="radio" name="productDesign.productBasic.isMatch" value='<s:property value="0"/>' <s:if test="productDesign.productBasic.isMatch == '0'">selected</s:if>>否
				</td>
				<td align="center">任务来源：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.taskSource" value='<s:property value="productDesign.productBasic.taskSource"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.taskSource">
						<option value="null" <s:if test="productDesign.productBasic.taskSource == 'null'">selected</s:if>>---请选择---</option>
						<option value="分院内部" <s:if test="productDesign.productBasic.taskSource == '分院内部'">selected</s:if>>分院内部</option>
						<option value="分院外部" <s:if test="productDesign.productBasic.taskSource == '分院外部'">selected</s:if>>分院外部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">选用类型：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.selectType" value='<s:property value="productDesign.productBasic.selectType"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.selectType">
						<option value="null" <s:if test="productDesign.productBasic.selectType == 'null'">selected</s:if>>---请选择---</option>
						<option value="A" <s:if test="productDesign.productBasic.selectType == 'A'">selected</s:if>>A</option>
						<option value="B" <s:if test="productDesign.productBasic.selectType == 'B'">selected</s:if>>B</option>
						<option value="C" <s:if test="productDesign.productBasic.selectType == 'C'">selected</s:if>>C</option>
						<option value="D" <s:if test="productDesign.productBasic.selectType == 'D'">selected</s:if>>D</option>
						<option value="E" <s:if test="productDesign.productBasic.selectType == 'E'">selected</s:if>>E</option>
					</select>
				</td>
				<td align="center">单套使用数量：</td>
				<td><input type="text" name="productDesign.productBasic.singleModuleCount" value='<s:property value="productDesign.productBasic.singleModuleCount"/>'></td>
			</tr>
			<tr>
				<td align="center">指令方式：</td>
				<%-- <td><input type="text" name="productDesign.productBasic.instructionMode" value='<s:property value="productDesign.productBasic.instructionMode"/>'></td> --%>
				<td align="center">
					<select name="productDesign.productBasic.instructionMode">
						<option value="null" <s:if test="productDesign.productBasic.instructionMode == 'null'">selected</s:if>>---请选择---</option>
						<option value="正脉冲" <s:if test="productDesign.productBasic.instructionMode == '正脉冲'">selected</s:if>>正脉冲</option>
						<option value="负脉冲" <s:if test="productDesign.productBasic.instructionMode == '负脉冲'">selected</s:if>>负脉冲</option>
						<option value="正脉冲矩阵" <s:if test="productDesign.productBasic.instructionMode == '正脉冲矩阵'">selected</s:if>>正脉冲矩阵</option>
						<option value="正脉冲矩阵" <s:if test="productDesign.productBasic.instructionMode == '正脉冲矩阵'">selected</s:if>>正脉冲矩阵</option>
					</select>
				</td>
				<td align="center">开关工号：</td>
				<td><input type="text" name="productDesign.productBasic.switchNum" value='<s:property value="productDesign.productBasic.switchNum"/>'></td>
			</tr>
			<tr>
				<td align="center">批次号：</td>
				<td><input type="text" name="productDesign.productBasic.deliveryNumber" value='<s:property value="productDesign.productBasic.deliveryNumber"/>'></td>
				<td align="center">生产编号：</td>
				<td><input type="text" name="productDesign.productBasic.productNum" value='<s:property value="productDesign.productBasic.productNum"/>'></td>
			</tr>
			
			<tr>
				<td align="center">计划开始时间：</td>
				<td ><input name="productDesign.productBasic.planStartTime" readonly="readonly" class="startDate" value='<s:date name="productDesign.productBasic.planStartTime" format="yyyy-MM-dd" />' onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').focus();} })" type="text"></td>
				<td align="center">计划交付时间：</td>
				<td ><input name="productDesign.productBasic.planDeliveryTime" readonly="readonly" class="endDate" value="<s:date name="productDesign.productBasic.planDeliveryTime" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();} })" type="text"></td>
			</tr>
			<tr>
				<td align="center">生产单位：</td>
				<td><input type="text" name="productDesign.productBasic.productionUnit" value='<s:property value="productDesign.productBasic.productionUnit"/>'></td>
				<td align="center">主管设计师：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.singleHead.id" type="hidden" class="required" value='<s:property value="productDesign.productBasic.singleHead.id"/>'>
					<input name="productDesign.productBasic.singleHead.name" type="text" class="required" value='<s:property value="productDesign.productBasic.singleHead.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">产品保证：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.productManager.id" type="hidden" class="required" value='<s:property value="productDesign.productBasic.productManager.id"/>'>
					<input name="productDesign.productBasic.productManager.name" type="text" class="required" value='<s:property value="productDesign.productBasic.productManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">质量管理：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.qualityManager.id" type="hidden" class="required" value='<s:property value="productDesign.productBasic.qualityManager.id"/>'>
					<input name="productDesign.productBasic.qualityManager.name" type="text" class="required" value='<s:property value="productDesign.productBasic.qualityManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">计划管理：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.planManager.id" type="hidden" class="required" value='<s:property value="productDesign.productBasic.planManager.id"/>'>
					<input name="productDesign.productBasic.planManager.name" type="text" class="required" value='<s:property value="productDesign.productBasic.planManager.name"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">结构主管：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.structureHeadId" type="hidden" class="required" value='<s:property value="productDesign.productBasic.structureHeadId"/>'>
					<input name="productDesign.productBasic.structureHeadName" type="text" value='<s:property value="productDesign.productBasic.structureHeadName"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">工艺主管：</td>
				<td colspan="1">
					<input name="productDesign.productBasic.processSupervisorId" type="hidden" value='<s:property value="productDesign.productBasic.processSupervisorId"/>'>
					<input name="productDesign.productBasic.processSupervisorName" type="text" value='<s:property value="productDesign.productBasic.processSupervisorName"/>' onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<%-- <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab" rel="currentNavTab"><span>返回</span></a> --%>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>