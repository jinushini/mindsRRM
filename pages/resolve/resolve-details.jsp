<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	});
	
	//入库
	jd(".warehousing").click(function(){
		var orderId = jd(this).parent().parent().find(".id").val();
		var url = "../order/order!saveProductByOrder.action?orderId="+orderId;
		var warehousingText = jd(this).parent();
		$.ajax({
			global : false,
			type : "POST",
			dataType : "json",
			url : url,
			success : function(data, stautsText){
				var msg = data.success;
				if(msg=="SUCCESS"){
					alertMsg.correct("入库成功");
					warehousingText.html("<span Style='color:green;'>入库成功</span>");
				}else if (msg=="WARN") {
					alertMsg.warn("请勿重复入库");
					warehousingText.html("<span Style='color:green;'>已入库</span>");
				}else if (msg=="ERROR") {
					alertMsg.error("请先将其父类订单纳入产品库");
				}
			}
			
		});
	});
</script>
<div class="pageContent">
  <form method="post" action="../order/orderAppr!taskDecomposition.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>分解详情</legend>
		<table class="list_table edit_table" width="98%" style="table-layout:fixed;">
			<thead>
				
				<tr>
					<th width="40" align="center">层级</th>
					<th width="100">型号代号</th>
					<th width="100">型号名称</th>
					<th width="170">产品代号</th>
					<th width="200">产品名称</th>
					<th width="100">去型号化代号</th>
					<th width="80">阶段</th>
					<th width="80">数量</th>
					<th width="100">产品种类</th>
					<th width="80">元器件等级</th>
					<th width="80">单机主管</th>
					<th width="100">生产编号</th>
					<th width="80">开始时间</th>
					<th width="80">计划交付时间</th>
					<th width="80">产品保证</th>
					<th width="80">质量管理</th>
					<th width="80">计划管理</th>
					<th width="100">生产单位</th>					
					<th width="80">结构主管</th>					
					<th width="80">工艺主管</th>					
				</tr>
			</thead>
			<tbody>
				<tr target="id" rel="<s:property value="resolvePro.productDesign.id"/>">
					<td hidden="hidden"><input type="hidden" class="id" value="<s:property value="id"/>"/></td>
					<td align="center"><s:property value="((resolvePro.productDesign.treeCode.length())/2==1?0:(resolvePro.productDesign.treeCode.length())/2==2?1:(resolvePro.productDesign.treeCode.length())/2==3?2:3)"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.productLib.modelCode"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.productLib.modelName"/></td>
					<td align="left" >
						<s:if test="resolvePro.productDesign.treeCode.length()/2==2">—</s:if>
						<s:if test="resolvePro.productDesign.treeCode.length()/2==3">——</s:if>
						<s:property value="resolvePro.productDesign.productBasic.code"/>
					</td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.name"/></td>
					<td align="left"><s:property value="resolvePro.productDesign.productBasic.selProdType"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.phase"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.amount"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.subType"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.componentLevel"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.singleHead.name"/></td>
					<td align="left"><s:property value="resolvePro.productDesign.productBasic.productNum"/></td>
					<td align="center"><s:date name="resolvePro.productDesign.productBasic.planStartTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:date name="resolvePro.productDesign.productBasic.planDeliveryTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.productManager.name"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.qualityManager.name"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.planManager.name"/></td>
					<td align="center"><s:property value="resolvePro.productDesign.productBasic.productionUnit"/></td>
					<td align="center" title=<s:property value="resolvePro.productDesign.productBasic.structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="resolvePro.productDesign.productBasic.structureHeadName"/></td>
					<td align="center" title=<s:property value="resolvePro.productDesign.productBasic.processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="resolvePro.productDesign.productBasic.processSupervisorName"/></td>
				</tr>
		  		<s:iterator value="resolvePro.productDesign.productDesignSet" status="st">
					<tr target="id" rel="<s:property value="id"/>">
						<td hidden="hidden"><input type="hidden" class="id" value="<s:property value="id"/>"/></td>
						<td align="center"><s:property value="((treeCode.length())/2==1?0:(treeCode.length())/2==2?1:(treeCode.length())/2==3?2:3)"/></td>
						<%-- <td align="center"><u:index value="#st.index+1"/></td> --%>
						<td align="center"><s:property value="productBasic.productLib.modelCode"/></td>
						<td align="center"><s:property value="productBasic.productLib.modelName"/></td>
						<td align="left" >
							<s:if test="treeCode.length()/2==2">—</s:if>
							<s:if test="treeCode.length()/2==3">——</s:if>
							<s:property value="productBasic.code"/>
						</td>
						<td align="center"><s:property value="productBasic.name"/></td>
						<td align="left"><s:property value="productBasic.selProdType"/></td>
						<td align="center"><s:property value="productBasic.phase"/></td>
						<td align="center"><s:property value="productBasic.amount"/></td>
						<td align="center"><s:property value="productBasic.subType"/></td>
						<td align="center"><s:property value="productBasic.componentLevel"/></td>
						<td align="center"><s:property value="productBasic.singleHead.name"/></td>
						<td align="left"><s:property value="productBasic.productNum"/></td>
						<td align="center"><s:date name="productBasic.planStartTime" format="yyyy-MM-dd"/></td>
						<td align="center"><s:date name="productBasic.planDeliveryTime" format="yyyy-MM-dd"/></td>
						<td align="center"><s:property value="productBasic.productManager.name"/></td>
						<td align="center"><s:property value="productBasic.qualityManager.name"/></td>
						<td align="center"><s:property value="productBasic.planManager.name"/></td>
						<td align="center"><s:property value="productBasic.productionUnit"/></td>
						<td align="center" title=<s:property value="productBasic.structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productBasic.structureHeadName"/></td>
						<td align="center" title=<s:property value="productBasic.processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productBasic.processSupervisorName"/></td>
					</tr>
					<s:iterator value="productDesignSet" status="st">
						<tr target="id" rel="<s:property value="id"/>">
							<td hidden="hidden"><input type="hidden" class="id" value="<s:property value="id"/>"/></td>
							<td align="center"><s:property value="((treeCode.length())/2==1?0:(treeCode.length())/2==2?1:(treeCode.length())/2==3?2:3)"/></td>
							<%-- <td align="center"><u:index value="#st.index+1"/></td> --%>
							<td align="center"><s:property value="productBasic.productLib.modelCode"/></td>
							<td align="center"><s:property value="productBasic.productLib.modelName"/></td>
							<td align="left" >
								<s:if test="treeCode.length()/2==2">—</s:if>
								<s:if test="treeCode.length()/2==3">——</s:if>
								<s:property value="productBasic.code"/>
							</td>
							<td align="center"><s:property value="productBasic.name"/></td>
							<td align="left"><s:property value="productBasic.selProdType"/></td>
							<td align="center"><s:property value="productBasic.phase"/></td>
							<td align="center"><s:property value="productBasic.amount"/></td>
							<td align="center"><s:property value="productBasic.subType"/></td>
							<td align="center"><s:property value="productBasic.componentLevel"/></td>
							<td align="center"><s:property value="productBasic.singleHead.name"/></td>
							<td align="left"><s:property value="productBasic.productNum"/></td>
							<td align="center"><s:date name="productBasic.planStartTime" format="yyyy-MM-dd"/></td>
							<td align="center"><s:date name="productBasic.planDeliveryTime" format="yyyy-MM-dd"/></td>
							<td align="center"><s:property value="productBasic.productManager.name"/></td>
							<td align="center"><s:property value="productBasic.qualityManager.name"/></td>
							<td align="center"><s:property value="productBasic.planManager.name"/></td>
							<td align="center"><s:property value="productBasic.productionUnit"/></td>
							<td align="center" title=<s:property value="productBasic.structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productBasic.structureHeadName"/></td>
							<td align="center" title=<s:property value="productBasic.processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productBasic.processSupervisorName"/></td>
						</tr>
					</s:iterator>
				</s:iterator>					
			</tbody>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul>
			<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>