<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	/* jn(function(){
		jn(".code").blur(function(){
			var code = jn(".code").val();
			$.ajax({
				global : false, //(默认: true) 是否触发全局 AJAX 事件
				url : "../microwave_product/ProductOrder_verifyBeforeAddProductOrder.action", //发送请求的地址
				async: true,
				data : {
					data : code
				},//发送到服务器的请求参数
				type : "POST", //请求方式：post或get
				dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
				success : function(data, statusText) {
					if(data.list.length != 0){
						alertMsg.confirm("该产品代号已存在，确定继续新增吗？", {
				 			okCall: function(){
							},
							cancelCall : function() {
								jn(".code").val("");
							}
						}); 
					}
				}
			});
		})
	}) */
	jn("[name='productOrder.productLib.modelCode']").change(function(){
		var productLibId = jn("[name='productOrder.productLib.modelCode']").val();
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件../checklist/checklistAppr!verifyBeforeAdd.action
			url : "../product/productLib!findProductLibById.action", //发送请求的地址
			async: true,
			data : {
				productLibId : productLibId
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var productLib = data.productLib;
				jn("#productLibId").val(productLib.id);
				jn("#modelName").val(productLib.modelName);
			}
		});
	})
</script>
<div class="pageContent">
  <form action="../microwave/product_ProductOrder_addZhengjiOrder_zhengji-order-list.action" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
 	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend>新增整机</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center">型号代号：</td>
					<td>
						<select name="productOrder.productLib.modelCode" style="width:20%;margin-left:1px;">
           					<s:iterator value="list">
           						<option value="<s:property value='id'/>"><s:property value='modelCode'/></option>
           					</s:iterator>
           				</select>
           			</td>
				</tr>
				<tr>
					<td align="center">型号名称：</td>
					<td>
						<input type="hidden" value="<s:property value='list[0].id'/>" name="productOrder.productLib.id" id="productLibId" />
						<input type="text" value="<s:property value='list[0].modelName'/>" name="productOrder.productLib.modelName" id="modelName" class="required" readonly="readonly"/> 
           			</td>
				</tr>
				<tr>
					<td align="center">整机代号：</td>
					<td><input type="text" name="productOrder.code" class="code required"></td>
				</tr>
				<tr>
					<td align="center">整机名称：</td>
					<td><input type="text" name="productOrder.name" class="required"></td>
				</tr>
				<tr>
					<td align="center">主管设计师：</td>
					<td>
						<input type="hidden" class="required" name="productOrder.singleHead.id">
						<input type="text" class="required" name="productOrder.singleHead.name" readonly="readonly" onclick="$(this).next().click()">
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
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" name="confirm" type="submit">提交</button></div></div></li>
			<li><a class="button" href="../inform/message!showAllMsg.action"  target="navTab" ><span>返回</span></a>					
		</ul>
	</div>
   </form>
</div>