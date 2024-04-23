<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("[name='approve.resultCn']").change(function(){
		if(jn(this).val()=="通过"){
			jn(".fileUpload").show();
		}
		if(jn(this).val()=="不通过"){
			jn(".fileUpload").hide();
		}
	})

	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#fileUpload");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	
	
		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name='delBtn']").click(function(){
			if(jn("#fileUpload").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	})
	
	$("[type=submit]").click(function(){
		if(jn("[name='approve.resultCn']:checked").val()=="不通过"){
			jn(".fileUpload").remove();
		}
	})
</script>
<div class="pageContent">
  <form action="../microwave/product_ProductDeclare_approveCustomYuanqjDeclare.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
			<div style="font-size:30px;text-align:center;">定制类元器件审批</div>
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
				<tr>
					<td align="center" width="20%">申报人：</td>
					<td width="30%"><s:property value="productDeclare.declareUser.name"/></td>	
					<td align="center">提交日期：</td>
					<td><s:date name="productDeclare.createDate" format="yyyy-MM-dd HH:mm"/></td>
				</tr>
				
			</table>
		</fieldset>
		
		<fieldset>
			<legend>审核</legend>
			<table border="0" width="98%" class="edit_table" align="center" id="fileUpload">
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过" checked>通过&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="approve.resultCn" value="不通过"/>不通过
						</span>
					</td>
				</tr>
				<tr class="fileUpload">
					<td style="text-align: left;" colspan="4">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
				</tr>
				<tr class="file fileUpload">
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="file" name="file"/></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
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