<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
</script>
<div class="pageContent">
  <form action="../microwave/product_ProductDeclare_modifyCustomYuanqjDeclare.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<input name="productDeclare.id" type="hidden" value="<s:property value='productDeclare.id'/>" /></td>
	<div class="pageFormContent" layoutH="56">
		<br/>
			<div style="font-size:30px;text-align:center;">定制类元器件修改</div>
			<br/>
			<fieldset>
				<legend>父级信息</legend>
				<div style="width:100%;padding:1px 15%;">
					<label style="width: 20%;">产品型号：<s:property value="productDeclare.productOrder.parentProductOrder.code"/></label>
					<label style="width: 20%;">产品名称：<s:property value="productDeclare.productOrder.parentProductOrder.name"/></label>
					<label style="width: 20%;">主管设计师：<s:property value="productDeclare.productOrder.parentProductOrder.singleHead.name"/></label>
				</div>
			</fieldset>
			<br/>
		<fieldset>
			<legend>元器件详情</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td width="20%" align="center">定制类元器件名称：</td>
					<td width="30%"><input name="productDeclare.productOrder.name" value="<s:property value='productDeclare.productOrder.name'/>" class="required" style="width:90%;text-align:center;" /></td>
					<td align="center" width="20%">元器件型号规格：</td>
					<td>
						<input name="productDeclare.productOrder.code" value="<s:property value='productDeclare.productOrder.code'/>" class="required" style="width:90%;text-align:center;" />
					</td>
				</tr>
				<tr>
					<td align="center">元器件申报等级：</td>
					<td >
						<select name="productDeclare.productOrder.componentLevel" style="width:90%;text-align:center;" >
							<option value="FM" <s:if test='productDeclare.productOrder.componentLevel=="FM"'>selected</s:if>>FM</option>
							<option value="普军级" <s:if test='productDeclare.productOrder.componentLevel=="普军级"'>selected</s:if>>普军级</option>
							<option value="CAST C" <s:if test='productDeclare.productOrder.componentLevel=="CAST C"'>selected</s:if>>CAST C</option>
							<option value="CAST B" <s:if test='productDeclare.productOrder.componentLevel=="CAST B"'>selected</s:if>>CAST B</option>
							<option value="EM" <s:if test='productDeclare.productOrder.componentLevel=="EM"'>selected</s:if>>EM</option>
							<option value="自定义">自定义</option>						
						</select>
					</td>
					<td align="center">申报数量：</td>
					<td >
						<input name="productDeclare.productOrder.demandNum" value="<s:property value='productDeclare.productOrder.demandNum'/>" class="required" style="width:90%;text-align:center;" />
					</td>
				</tr>
				<tr>
					<td align="center" width="20%">生产厂家：</td>
					<td width="30%">
						<select name="productDeclare.manufacturer" style="width:90%;text-align:center;" >
							<option value="13所" <s:if test='productDeclare.manufacturer=="13所"'>selected</s:if>>13所</option>
							<option value="970" <s:if test='productDeclare.manufacturer=="970"'>selected</s:if>>970</option>
							<option value="43所" <s:if test='productDeclare.manufacturer=="43所"'>selected</s:if>>43所</option>
							<option value="55所" <s:if test='productDeclare.manufacturer=="55所"'>selected</s:if>>55所</option>
							<option value="海创" <s:if test='productDeclare.manufacturer=="海创"'>selected</s:if>>海创</option>
							<option value="自定义" <s:if test='productDeclare.manufacturer=="CAST C"'>selected</s:if>>自定义</option>						
						</select>
					</td>	
					<td align="center">物资经理：</td>
					<td>
						<input type="hidden" name="productDeclare.materialManager.id" class="required"value="<s:property value='productDeclare.materialManager.id'/>">
						<input type="text" name="productDeclare.materialManager.name" class="required" value="<s:property value='productDeclare.materialManager.name'/>" readonly="readonly" onclick="$(this).next().click()" style="width:90%;text-align:center;">
						<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>
					</td>
				</tr>
				
			</table>
		</fieldset>
		
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>