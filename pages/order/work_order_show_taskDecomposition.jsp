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
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td hidden="hidden"><input type="hidden" class="id" value="<s:property value="id"/>"/></td>
					<td align="center"><s:property value="((treeCode.length())/2==1?0:(treeCode.length())/2==2?1:(treeCode.length())/2==3?2:3)"/></td>
					<%-- <td align="center"><u:index value="#st.index+1"/></td> --%>
					<td align="center"><s:property value="productLib.modelCode"/></td>
					<td align="center"><s:property value="productLib.modelName"/></td>
					<td align="left" >
						<s:if test="treeCode.length()/2==2">—</s:if>
						<s:if test="treeCode.length()/2==3">——</s:if>
						<s:property value="productCode"/>
					</td>
					<td align="center"><s:property value="productName"/></td>
					<td align="left"><s:property value="code"/></td>
					<td align="center"><s:property value="stage"/></td>
					<td align="center"><s:property value="amount"/></td>
					<td align="center"><s:property value="subType.key"/></td>
					<td align="center"><s:property value="grade"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>
					<td align="left"><s:property value="productionCode"/></td>
					<td align="center"><s:date name="startTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:date name="planDelivery" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="productManager.name"/></td>
					<td align="center"><s:property value="qualityManager.name"/></td>
					<td align="center"><s:property value="planManager.name"/></td>
					<td align="center"><s:property value="productionUnit"/></td>
					<td align="center" title=<s:property value="structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="structureHeadName"/></td>
					<td align="center" title=<s:property value="processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="processSupervisorName"/></td>
					<td align="center" id="warehousing">
						<s:if test="isWarehousing == 0">
							<a href="javascript:;" class="warehousing" style="color:red;">纳入产品库</a>
						</s:if>
						<s:else>
							<span style="color:green;">已入库</span>
						</s:else>						
					</td>
				</tr>
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