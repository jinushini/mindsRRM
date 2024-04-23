<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	jd("#cancelBtn").click(function(){
		jd(".close").click();
	})
	
	//点击增加新数据
	jd(".addBtn").click(function(){
		var $thisTbody = jd("table").find(".tbody");
		//新一行(新加一行)
		var $newTr = jd("table").find(".modelTr").clone();
		$newTr.removeAttr("style");
		$newTr.attr("class","newTr");
		$newTr.find("input").addClass("required");
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		$thisTbody.append($newTr);
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)在进行删除时，直接删除该行
		jd(".delBtn").click(function(){
			jd(this).parent().parent().remove();
			//阻止事件冒泡
			event.stopPropagation();
		});
	});
	
	//在没有点击“新增一行”之前的行，即原本存在的“展示行”在删除时
	jd(".delBtn").click(function(){
		var $thisTr = jd(this).parent().parent();
		$thisTr.remove();
	});
	
	//提交按钮
	jd("[type=submit]").click(function() {
		if(jd("[type='checkbox']:checked").length<1){
			alertMsg.confirm("至少选择一项内容进行复制！");
			return false;
		}
		if(jn("[type='text']").length<1){
			alertMsg.confirm("至少填写一个目标订单！");
			return false;
		}
		for(var i=0;i<jd(".targetOrderId:visible").length;i++){
			var $targetOrderId = jd(".targetOrderId:visible").eq(i);
			if($targetOrderId.val().trim()=='<s:property value="productOrder.id"/>'){
				$targetOrderId.attr("style", "border-color:red;width:99%;text-align:center;");
				alertMsg.error("目标订单标识码不能与源订单一样！");
				return false;
			}else{
				$targetOrderId.attr("style", "width:99%;text-align:center;");
			}
		}
		for(var i=0;i<jd(".tbody").length;i++){
			var $thisTbody = jd(".tbody").eq(i);
			//给新增的“输入行”数据加name
			var $newTrs = $thisTbody.find(".newTr");
			for(var j=0;j<$newTrs.length;j++){
				$newTrs.eq(j).find("input").attr("name", "data");
			}
		}
	});
</script>
<div class="pageHeader">
	<div class="searchBar">	
	</div>
</div>
<div class="pageContent" layoutH="20">
	<form action="../microwave/product_ProductOrder_cloneProductDetail_<s:property value="data"/>.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<div layoutH="70" style="margin:30px 30px -25px; font-size:16px;line-height: 28px;">
			<table width="100%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th style="width:80%;font-weight:bolder;font-size:16px;" colspan="2">源订单</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>
							<label style="font-size:15px;">标识码：<span style="color:red;font-size:16px;"><s:property value="productOrder.id"/></span></label>
							<input type="hidden" name="num" value="<s:property value="productOrder.id"/>" />
						</td>
						<td><label style="font-size:15px;">设备代号：<span style="color:red;font-size:16px;"><s:property value="productOrder.code"/></span></label></td>
					</tr>
				</tbody>
			</table>
			<div class="divider"></div>
			<table width="100%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th style="width:80%;font-weight:bolder;font-size:16px;" colspan="3">请选择此次复制的内容</th>
					</tr>
				</thead>
				<tbody>
					<tr style="border:none;">
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="name" />设备名称：<span style="color:red;font-size:16px;"><s:property value="productOrder.name"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="selProdCode" />图纸代号：<span style="color:red;font-size:16px;"><s:property value="productOrder.selProdCode"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="phase" />研制阶段：<span style="color:red;font-size:16px;"><s:property value="productOrder.phase"/></span></label></td>
					</tr>
					<tr style="border:none;">
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="teamName" />隶属班组：<span style="color:red;font-size:16px;"><s:property value="productOrder.teamName"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="teamLead" />班组长：<span style="color:red;font-size:16px;"><s:property value="productOrder.teamLead.name"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="prodPlanManager" />生产计划经理：<span style="color:red;font-size:16px;"><s:property value="productOrder.prodPlanManager.name"/></span></label></td>
					</tr>
					<tr style="border:none;">
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="structureManager" />结构设计师：<span style="color:red;font-size:16px;"><s:property value="productOrder.structureManager.name"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="technicalManager" />工艺设计师：<span style="color:red;font-size:16px;"><s:property value="productOrder.technicalManager.name"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="prodAssureManager" />产保工程师：<span style="color:red;font-size:16px;"><s:property value="productOrder.prodAssureManager.name"/></span></label></td>
					</tr>
					<tr style="border:none;">
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="qualityManager" />质量管理人员：<span style="color:red;font-size:16px;"><s:property value="productOrder.qualityManager.name"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="outsourceUnit" />外协单位：<span style="color:red;font-size:16px;"><s:property value="productOrder.outsourceUnit"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="outsourceUnitPIC" />外协单位负责人：<span style="color:red;font-size:16px;"><s:property value="productOrder.outsourceUnitPIC"/></span></label></td>
					</tr>
					<tr style="border:none;">
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="childProductOrderSet" /><span style="color:red;font-size:16px;font-weight:bold;">子订单结构</span></label></td>
						<%-- <td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="outsourceUnit" />外协单位：<span style="color:red;font-size:16px;"><s:property value="productOrder.outsourceUnit"/></span></label></td>
						<td style="border:none;"><label style="font-size:15px;"><input type="checkbox" name="msg" value="outsourceUnitPIC" />外协单位负责人：<span style="color:red;font-size:16px;"><s:property value="productOrder.outsourceUnitPIC"/></span></label></td> --%>
					</tr>
				</tbody>
			</table>
			<div class="divider"></div>
			请在下面输入框中填写目标订单的标识码（每行填一个，无效标识码被忽略）<br/>
			
			<table width="100%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th style="width:80%;font-weight:bolder;font-size:16px;">目标订单标识码&nbsp;&nbsp;&nbsp;<a class="addBtn" href="javascript:;" style="color:green;font-weight:border;font-size:14px;">增加一行</a></th>
						<th style="width:20%;font-weight:bolder;font-size:16px;">操作</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<tr class="modelTr" align="center" style="display:none;">
						<td><input type="text" style="width:99%;text-align:center;" class="targetOrderId" /></td>
						<td><a href="javascript:;" class="delBtn" style="color:red;" >删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>	
		<div class="formBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li> -->
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>