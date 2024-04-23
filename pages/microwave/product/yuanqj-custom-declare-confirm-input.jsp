<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	$("[type=submit]").click(function(){
		if(jn("[name='approve.resultCn']:checked").val()=="否"){
			alertMsg.warn("请在浪潮申报完成后再提交");
			return false;
		}
		
	})
</script>
<div class="pageContent">
  <form action="../microwave/product_ProductDeclare_confirmCustomYuanqjDeclare.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
			<div style="font-size:30px;text-align:center;">定制类元器件浪潮申报确认</div>
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
					<td width="30%"><s:property value="productDeclare.productOrder.name"/></td>
					<td align="center" width="20%">元器件型号规格：</td>
					<td>
						<s:property value="productDeclare.productOrder.code" />
					</td>
				</tr>
				<tr>
					<td align="center">元器件申报等级：</td>
					<td >
						<s:property value="productDeclare.productOrder.componentLevel"/>
					</td>
					<td align="center">申报数量：</td>
					<td >
						<s:property value="productDeclare.productOrder.demandNum"/>
					</td>
				</tr>
				<tr>
					<td align="center" width="20%">生产厂家：</td>
					<td width="30%"><s:property value="productDeclare.manufacturer"/></td>	
					<td align="center">物资经理：</td>
					<td><s:property value="productDeclare.materialManager.name"/></td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>审核</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td width="25%" align="center">浪潮申报是否已完成：</td>
					<td width="25%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="是" checked>是&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="approve.resultCn" value="否"/>否
						</span>
					</td>
					<td width="25%" align="center">厂家联系人：</td>
					<td width="25%" align="center">
						<input type="text" name="productDeclare.factoryLink" />
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">相关文档：</td>
					<td style="text-align: left;">
						<s:iterator value="productDeclare.productDeclareFileSet" status="st">
							<a href='<s:property value="filePath"/>' style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a></br>
						</s:iterator>
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