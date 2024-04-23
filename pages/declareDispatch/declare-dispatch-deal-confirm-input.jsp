<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	$("[type=submit]").click(function(){
		if(jn("[name='approve.resultCn']:checked").val()=="通过"){
			if(jn(".tbody") != null){
				for(var i=0;i<jn(".tbody tr").length;i++){
					if(jn(".tbody tr").eq(i).find(".status").text()!="3"){
						alertMsg.confirm("所有的产品申报结束后才能确认完成！");
						return false;
					}
				}
			}
		}
	})
</script>
<div class="pageContent">
  <form action="../declareDispatch/DeclareDispatchDeal_confirmDeclareDispatchDeal.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
			<div style="font-size:30px;text-align:center;">定制类元器件申报</div>
			<br/>
			<fieldset>
				<legend>父级信息</legend>
				<div style="width:100%;padding:1px 15%;">
					<label style="width: 20%;">产品型号：<s:property value="declareDispatchDeal.productOrder.code"/></label>
					<label style="width: 20%;">产品名称：<s:property value="declareDispatchDeal.productOrder.name"/></label>
					<label style="width: 20%;">主管设计师：<s:property value="declareDispatchDeal.productOrder.singleHead.name"/></label>
					<label style="width: 20%;">申报人：<s:property value="declareDispatchDeal.declareUser.name"/></label>
				</div>
			</fieldset>
			<br/>
		<fieldset>
			<legend>申报跟踪</legend>
			<s:if test='declareDispatchDeal.isDeclare == "无"'>
				<div style="margin:10px 30px;font-size:50px;color:#B8B8B8;">无申报</div>
			</s:if>
			<s:else>
				<table border="0" width="98%" class="edit_table" >
					<thead>
						<tr align="center">
							<th width="3%">状态</th>
							<th width="3%">序号</th>
							<th width="10%">元器件名称</th>
							<th width="10%">型号规格</th>
							<th width="10%">申报等级</th>
							<th width="5%">申报数量</th>
							<th width="5%">生产厂家</th>
							<th width="10%">物资经理</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<s:iterator value="declareDispatchDeal.childProductOrderSet">
							<tr align="center">
								<td class="status" style="display:none;"><s:property value="productDeclare.status"/></td>
								<td style="font-size:30px; color:<s:if test='productDeclare.status == 3'>green</s:if><s:elseif test='productDeclare.status == 0'>gray</s:elseif><s:elseif test='productDeclare.status == 5'>red</s:elseif><s:else>orange</s:else>;">
									<s:property value="productDeclare.status == 0 ? '●' : '●'"/>
								</td>
								<td><s:property value="productDeclare.num"/></td>
								<td><s:property value="name"/></td>
								<td><s:property value="code"/></td>
								<td><s:property value="componentLevel"/></td>
								<td><s:property value="demandNum"/></td>
								<td><s:property value="productDeclare.manufacturer"/></td>
								<td><s:property value="productDeclare.materialManager.name"/></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</s:else>
		</fieldset>
		<fieldset style="display:none;">
			<legend>审核</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过" checked />通过&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="approve.resultCn" value="不通过" />不通过
						</span>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align:center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">确认完成</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>