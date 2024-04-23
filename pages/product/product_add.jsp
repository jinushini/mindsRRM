<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">

	//提交按钮
	jn("#submit").click(function(){
		//单机分类select下拉框默认选中
		var subTypeId = jn("#subTypeSelectId").val();
		//单机子类select下拉框默认选中
		var djClassId = jn("#djClassSelectId").val();
		//研制模式select下拉框默认选中
		var researchingModeId = jn("#researchingModeSelectId").val();
		if(subTypeId==0){
			alertMsg.error("单机分类未选择");
			return false;
		}
		if(djClassId==0){
			alertMsg.error("单机子类未选择");
			return false;
		}
		if(researchingModeId==0){
			alertMsg.error("研制模式未选择");
			return false;
		}
		return true;
	})
</script>
<div class="pageContent">
  <form method="post" action="../product/product!add.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input type="hidden" name="msg" value="<s:property value="msg"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>新增产品</legend>
		<table width="98%" class="edit_table" align="center">
			<tr>
				<td align="center" width="30%">所属型号：</td>
				<!-- <td><input type="text" name="product.productLib"></td> -->
				<td>
					<select name="product.productLib.id">
						<s:iterator value="modelList">
							<option value="<s:property value="id"/>"><s:property value="modelCode"/></option>
						</s:iterator>
					</select>
				</td>
				<td align="center" width="30%">型号产品代号：</td>
				<td><input type="text" name="product.code"></td>
			</tr>
			<tr>
				<td align="center">型号产品名称：</td>
				<td><input type="text" name="product.name"></td>
				<td align="center">研制阶段：</td>
				<td><input type="text" name="product.phase"></td>
			</tr>
			<tr>
				<td align="center">单机分类/专业分类/产品种类：</td>
				<!-- <td><input type="text" name="product.subType"></td> -->
				<td>
					<select name="product.subType.id" id="subTypeSelectId">
						<option value="0">---请选择---</option>
						<s:iterator value="classlist">
							<option value="<s:property value="id"/>"><s:property value="key"/></option>
						</s:iterator>
					</select>
				</td>
				<td align="center">单机子类<!-- （字典表） -->：</td>
				<!-- <td><input type="text" name="product.djClass"></td> -->
				<td>
					<select name="product.djClass.id" id="djClassSelectId">
						<option value="0">---请选择---</option>
						<s:iterator value="subclasslist">
							<option value="<s:property value="id"/>"><s:property value="key"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>			
			<tr>
				<td align="center">关重件<!-- （值为：G/Z/空） -->：</td>
				<!-- <td><input type="text" name="product.criticalParts"></td> -->
				<td>
					<select name="product.criticalParts">
						<option value="">---请选择---</option>
						<option value="G">G</option>
						<option value="Z">Z</option>
					</select>
				</td>
				<td align="center">研制模式<!-- （字典表） -->：</td>
				<!-- <td><input type="text" name="product.researchingMode"></td> -->
				<td>
					<select name="product.researchingMode.id" id="researchingModeSelectId">
						<option value="0">---请选择---</option>
						<s:iterator value="patternlist">
							<option value="<s:property value="id"/>"><s:property value="key"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">需求数量<!-- （默认1，除开关，模块外） -->：</td>
				<td><input type="text" name="product.num"></td>
				<td align="center">节点类型<!-- （值为：型号/分系统/子系统/单机） -->：</td>
				<!-- <td><input type="text" name="product.type"></td> -->
				<td>
					<select name="product.type">
						<option value="型号">型号</option>
						<option value="分系统">分系统</option>
						<option value="子系统">子系统</option>
						<option value="单机">单机</option>
					</select>
				</td>
			</tr>
			<tr>
				<!-- <td align="center">来源(null:不需此属性,1:上传的,2:手动增加)：</td>
				<td><input type="text" name="product.source"></td> -->
				<td align="center">产品成熟度：</td>
				<td><input type="text" name="product.maturity"></td>
			</tr>
			<tr>
				<td align="center">型谱产品名称 /去型号化代号<!-- (第一级|null) -->：</td>
				<td><input type="text" name="product.selProdType"></td>
				<!-- <td align="center">基线产品来源代号 (基础库平台|Avidm4) E类为null：</td>
				<td><input type="text" name="product.selProdSourceCode"></td> -->
			</tr>
			<!-- <tr>
				<td align="center">基线产品来源名称（第二级分类|型号代号）：</td>
				<td><input type="text" name="product.selProdSourceName"></td>
			</tr> -->
			<!-- <tr>
				<td align="center">基线产品-基线产品代号 (型谱单机代号|型号单机代号对应A4的代号)：</td>
				<td><input type="text" name="product.selProductCode"></td>
				<td align="center">基线产品-基线产品名称 (型谱单机名称|型号单机名称)：</td>
				<td><input type="text" name="product.selProductName"></td>
			</tr> -->
			<%-- <tr>
				<td align="center">最新应用型号：</td>
				<td><input type="text" name="product.latestApplication"></td>
				<td align="center">产品图纸所属阶段：</td>
				<!-- <td><input type="text" name="product.prodDrawingPhase"></td> -->
				<td>
					<select name="product.prodDrawingPhase">
						<option value="C">C</option>
						<option value="C-J">C-J</option>
						<option value="D">D</option>
						<option value="Z">Z</option>
						<option value="M">M</option>
					</select>
				</td>
			</tr> --%>
			<%-- <tr>
				<td align="center">产品类型(E类)：</td>
				<td><input type="text" name="product.productType"></td>
				<td align="center">选用类型/鉴定状态类型(A B C D E)：</td>
				<!-- <td><input type="text" name="product.selectType"></td> -->
				<td>
					<select name="product.selectType">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
					</select>
				</td>
			</tr> --%>
			<!-- <tr>
				<td align="center">鉴定件数量：</td>
				<td><input type="text" name="product.identiftyPartsNum"></td>
				<td align="center">选用后产品成熟度：</td>
				<td><input type="text" name="product.selectedMaturity"></td>
			</tr> -->
			<!-- <tr>
				<td align="center">选用后产品代号：</td>
				<td><input type="text" name="product.selectedProductCode"></td>
				<td align="center">更改原因分类(手填)：</td>
				<td><input type="text" name="product.changeCauseType"></td>
			</tr> -->
			<tr>
				<td align="center">投产编号/产品编号/生产编号：</td>
				<td><input type="text" name="product.productNum"></td>
				<td align="center">单机主管设计师：</td>
				<!-- <td><input type="text" name="product.singleHead"></td> -->
				<td>
					<input name="product.singleHead.id" type="hidden" class="required">
					<input name="product.singleHead.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">开始时间：</td>
				<!-- <td><input type="text" name="product.startTime"></td> -->
				<td><input name="product.startTime" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
				<td align="center">计划交付时间：</td>
				<!-- <td><input type="text" name="product.planDelivery"></td> -->
				<td><input name="product.planDelivery" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td>
			</tr>
			<tr>
				<!-- <td align="center">实际交付时间：</td> -->
				<!-- <td><input type="text" name="product.actualDelivery"></td> -->
				<!-- <td><input name="product.actualDelivery" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"></td> -->
				<td align="center">是否配套：</td>
				<!-- <td><input type="text" name="product.isMatch"></td> -->
				<td>
					<input type="radio" name="product.isMatch" checked="checked" value="true"/>是
					<input type="radio" name="product.isMatch" value="false"/>否
				</td>
			</tr>
			<tr>
				<td align="center">模块代号：</td>
				<td><input type="text" name="product.moduleCode"></td>
				<td align="center">模块设计师：</td>
				<!-- <td><input type="text" name="product.moduleDesigner"></td> -->
				<td>
					<input name="product.moduleDesigner.id" type="hidden" class="required">
					<input name="product.moduleDesigner.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">单台单机模块数量：</td>
				<td><input type="text" name="product.singleModuleCount"></td>
				<td align="center">模块装机数量：</td>
				<td><input type="text" name="product.ModuleCount"></td>
			</tr>
			<tr>
				<td align="center">指令方式：</td>
				<td><input type="text" name="product.instructionMode"></td>
				<td align="center">开关工号：</td>
				<td><input type="text" name="product.switchNum"></td>
			</tr>
			<tr>
				<td align="center">交付编号：</td>
				<td><input type="text" name="product.deliveryNumber"></td>
			</tr>
			<tr>
				<td align="center">元器件等级：</td>
				<td><input type="text" name="product.componentLevel"></td>
				<td align="center">产品保证：</td>
				<!-- <td><input type="text" name="product.productManager"></td> -->
				<td>
					<input name="product.productManager.id" type="hidden" class="required">
					<input name="product.productManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">质量管理：</td>
				<!-- <td><input type="text" name="product.qualityManager"></td> -->
				<td>
					<input name="product.qualityManager.id" type="hidden" class="required">
					<input name="product.qualityManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">计划管理：</td>
				<!-- <td><input type="text" name="product.planManager"></td> -->
				<td>
					<input name="product.planManager.id" type="hidden" class="required">
					<input name="product.planManager.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="510"
						href="../system/user!findUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">结构主管：</td>
				<!-- <td><input type="text" name="product.structureHeadId"></td>
				<td align="center">结构主管姓名：</td>
				<td><input type="text" name="product.structureHeadName"></td> -->
				<td>
					<input name="product.structureHeadId" type="hidden" class="required">
					<input name="product.structureHeadName" type="text" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
				<td align="center">工艺主管：</td>
				<!-- <td><input type="text" name="product.processSupervisorId"></td>
				<td align="center">工艺主管姓名：</td>
				<td><input type="text" name="product.processSupervisorName"></td> -->
				<td>
					<input name="product.processSupervisorId" type="hidden" class="required">
					<input name="product.processSupervisorName" type="text" onclick="$(this).next().click()" readonly="readonly">
					<a title="人员选择" height="410" width="715"
						href="../system/user!findMUser.action" target="dialog"
						rel="selectUser" resizable="false" maxable="false">
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">编码（条码）：</td>
				<td><input type="text" name="product.barCode"></td>
				<td align="center">备注：</td>
				<td><input type="text" name="product.remarks"></td>
			</tr>
			<!-- <tr>
				<td align="center">单机主管：</td>
				<td colspan="1">
					<input name="product.singleHead.id" type="hidden" class="required">
					<input name="product.singleHead.name" type="text" class="required" onclick="$(this).next().click()" readonly="readonly">
					<a height="410" width="510" href="../system/user!findUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
				</td>
			</tr>  -->
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../product/product!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
		</ul>			
	</div>
   </form>
</div>