<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	//新增订单
	jn("#newSelect").change(function(){
		switch(jn("#newSelect").val()){
			case '新建':
				break;
			case 'fill':
				alert("功能正在开发");
				break;
				/* jn("#newSelect").val("新建");
				var options={};
				 options.width = 1100;
				 options.height = 700;
				var url="../microwave/product_ProductOrder_showOrderDetailZonghc_zonghc-order-edit.action";
				$.pdialog.open(url, "new_msg", "新建订单", options);
				break; */
			case 'excel':
				jn("#newSelect").val("新建");
				var url="../microwave/product_ProductOrder_returnjsp_zonghc-order-add-excel.action";
				/* var options={};
				 options.width = 1100;
				 options.height = 700;
				$.pdialog.open(url, "new_msg", "综合处订单Excel导入", options); */
				navTab.openTab("zonghc", url, { title:"综合处订单Excel导入", fresh:false, data:{} });
				/* navTab.reload(url); */
				break;
			default:
				alert("error");
				break;
		}
	});
	
	//显示进度
	jn(".current").click(function(){
		var currentUser = jn("#currentUser").val();
		var planManager = jn(this).parent().find(".planManager").eq(0).val();
		if(currentUser != planManager)return;
		var id = jn(this).parent().attr("rel");
		var options={};
		options.width = 800;
		options.height = 450;
		var url = "../microwave/product_ProductOrderRecord_showDetails_order-record-show.action?productOrderId="+id;
		$.pdialog.open(url, "new_record", "更新进度", options);
	});
	
	jn(function(){
		//获取列表行被双击事件
		jn("tbody tr").dblclick(function(){
			jn(this).find(".details").click();
		})
		//当点击“重置”按钮时将查询输入框全部置空
		/* jn("#reset").click(function(){
			jn("input, #type").val("");
		}) */
	})
	//导出
	jn("#export").click(function(){
		 jn("#searchFrm").attr("action", "../microwave/product_ProductOrder_printOrderZonghc.action");
		 jn("#searchFrm").submit();
	});
	
	//查询 
	 jn("#search").click(function(){
		 jn("#searchFrm").attr("onsubmit", "return navTabSearch(this);");
		 jn("#searchFrm").attr("action", "../microwave/product_ProductOrder_showOrderListZonghc_zonghc-order-list.action");
		 jn("#searchFrm").submit();
	 });
</script>
<div class="pageHeader">
	<form onsubmit="" action="" method="post" id="searchFrm">
		<div class="searchBar" layoutH="770">
			<table class="edit_table" width="100%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">所属项目</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.libCode like']" value="<s:property value="paramMap['m.libCode like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">设备代号</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">设备名称</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.name like']" value="<s:property value="paramMap['m.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">计划经理</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.designPlanManager.name like']" value="<s:property value="paramMap['m.designPlanManager.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:7%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">专业分类</td>
					<td style="width: 15%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.classification like']" value="<s:property value="paramMap['m.classification like']"/>" style="width:40%;height:18px;" />
					</td>
					<td style="width:7%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">考核开始时间</td>
					<td style="width: 18%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.assessPlanBD ge Date']" value="<s:property value="paramMap['m.assessPlanBD ge Date']"/>" style="width:40%;height:18px;" readonly="readonly" onclick="WdatePicker();"/>~
						<input type="text" name="paramMap['m.assessPlanBD le Date']" value="<s:property value="paramMap['m.assessPlanBD le Date']"/>" style="width:40%;height:18px;" readonly="readonly" onclick="WdatePicker();"/>
					</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<button type="botton" id="search" style="height:23px;float:right;"><span style="padding-bottom:3px;font-size:12px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">MES编号</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.mesCode like']" value="<s:property value="paramMap['m.mesCode like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">图纸代号</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.selProdCode like']" value="<s:property value="paramMap['m.selProdCode like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:7%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">责任部门</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.responsibleDept like']" value="<s:property value="paramMap['m.responsibleDept like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">主管设计师</td>
					<td style="width: 6%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.name like']" value="<s:property value="paramMap['m.singleHead.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:7%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">预计交付时间</td>
					<td style="width: 18%;padding:0px 0px 1px;border:hidden;">
						<input readonly="readonly" size="12" type="text" name="paramMap['m.latestDeliveryPD ge Date']" value="<s:property value="paramMap['m.latestDeliveryPD ge Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>~
						<input readonly="readonly" size="12" type="text" name="paramMap['m.latestDeliveryPD le Date']" value="<s:property value="paramMap['m.latestDeliveryPD le Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>
					</td>
					<td style="width:7%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">考核结束时间</td>
					<td style="width: 18%;padding:0px 0px 1px;border:hidden;">
						<input readonly="readonly" size="12" type="text" name="paramMap['m.assessPlanED ge Date']" value="<s:property value="paramMap['m.assessPlanED ge Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>~
						<input readonly="readonly" size="12" type="text" name="paramMap['m.assessPlanED le Date']" value="<s:property value="paramMap['m.assessPlanED le Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>
					</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<button type="botton" id="export" style="height:23px;float:right;"><span style="padding-bottom:3px;font-size:12px;">导出</span></button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li style="margin-right:5px;">
				<select style="width:120px;" id="newSelect">
					<option value="新建" selected>----添加新订单----</option>
					<option value="fill">手动录入</option>
					<option value="excel">EXCEL导入</option>
				</select>
			</li>
			<li><a href="../microwave/product_ProductOrderRecord_inputRecord_order-record-add.action?id={id}" target="dialog" width="800" height="400" class="icon"><span>更新进度</span></a></li>
			<li><a href="../microwave/product_ProductOrder_showOrderDetailZonghc_zonghc-order-edit.action?num={id}" class="edit" target="dialog" height="700" width="1100"><span>编辑</span></a></li>
			<li><a href="../microwave/product_ProductOrder_deleteProdcutOrder.action" class="delete" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<div>
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="17"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="30">序号</th>
					<th width="100">所属项目</th>
					<th width="100">设备名称</th>
					<th width="100">设备代号</th>
					<th width="100">图纸代号</th>
					<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">MES系统<br/>生产编号</span></th>
					<th width="40"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>数量</span></th>
					<th width="40"><span style="font-size:15px;padding:0 0 2px 2px;">研制<br/>阶段</span></th>
					<th width="70">研制模式</th>
					<th width="80"><span style="font-size:15px;padding:0 0 2px 2px;">主管设计师</span></th>
					<th width="100">合同编号</th>
					<th width="70">计划主管</th>
					<th width="100">订单完成形式</th>
					<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">考核计划<br/>开始时间</span></th>
					<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">考核计划<br/>完成时间</span></th>
					<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">实际<br/>开始时间</span></th>
					<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">实际<br/>完成时间</span></th>
					<th width="70">交付情况</th>
					<th width="70"><span style="font-size:15px;padding:0 0 2px 2px;">最新计划<br/>交付时间</span></th>
					<th width="200">当前研制状态</th>
					<th width="200">当前存在问题</th>
					<th width="120">专业分类</th>
					<th width="70">产品种类</th>
					<th width="60"><span style="font-size:15px;padding:0 0 2px 2px;">选用<br/>类型</span></th>
					<!-- <th width="40">模块数量</th> -->
					<!-- <th width="60">成熟度</th> -->
					<th width="60">订单年度</th>
					<th width="100">责任部门</th>
					<th width="100">用户单位</th>
					<th width="70"><span style="font-size:15px;padding:0 0 2px 2px;">用户单位<br/>责任人</span></th>
					<th width="70">任务来源</th>
					<th width="100">产品设计</th>
					<th width="100">结构件加工</th>
					<th width="100">元器件齐套</th>
					<th width="100">模块齐套</th>
					<th width="100">产品装调</th>
					<th width="100">测试试验</th>
					<th width="70">投产方式</th>
					<th width="40"><span style="font-size:15px;padding:0 0 2px 2px;">投产<br/>数量</span></th>
					<th width="50"><span style="font-size:15px;padding:0 0 2px 2px;">元器件<br/>等级</span></th>
					<th width="100">指令方式</th>
					<!-- <th width="60">产品类别</th> -->
					<th width="100">备注</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><input name="ids" value="<s:property value='id'/>" type="checkbox"></td>
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='libCode'/>"><s:property value="libCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='name'/>"><s:property value="name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='code'/>"><s:property value="code"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='selProdCode'/>"><s:property value="selProdCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='mesCode'/>"><s:property value="mesCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='orderNum'/>"><s:property value="orderNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='phase'/>"><s:property value="phase"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='researchMode'/>"><s:property value="researchMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='singleHead.name'/>"><s:property value="singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='orderCode'/>"><s:property value="orderCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='designPlanManager.name'/>"><input type="hidden" class="planManager" value="<s:property value='designPlanManager.id'/>" /><s:property value="designPlanManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='completeTarget'/>"><s:property value="completeTarget"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='assessPlanBD' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-assessPlanBD.getYear()>19">已完成</s:if><s:else><s:date name="assessPlanBD" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='assessPlanBD' format='yyyy-MM-dd'/>"><s:date name="assessPlanBD" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='assessPlanED' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-assessPlanED.getYear()>19">已完成</s:if><s:else><s:date name="assessPlanED" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='assessPlanED' format='yyyy-MM-dd'/>"><s:date name="assessPlanED" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='actualBD' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-actualBD.getYear()>19">已完成</s:if><s:else><s:date name="actualBD" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='actualBD' format='yyyy-MM-dd'/>"><s:date name="actualBD" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='actualED' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-actualED.getYear()>19">已完成</s:if><s:else><s:date name="actualED" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='actualED' format='yyyy-MM-dd'/>"><s:date name="actualED" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='deliveryState'/>"><s:property value="deliveryState"/></td>
					<td align="center" class="current" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='latestDeliveryPD' format='yyyy-MM-dd'/>"><s:date name="latestDeliveryPD" format="yyyy-MM-dd"/></td>
					<td align="center" class="current" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='currentState'/>"><s:property value="currentState"/></td>
					<td align="center" class="current" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='currentIssue'/>"><s:property value="currentIssue"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='classification'/>"><s:property value="classification"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='category'/>"><s:property value="category"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='selectType'/>"><s:property value="selectType"/></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='modelNum'/>"><s:property value="modelNum"/></td> --%>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='maturity'/>"><s:property value="maturity"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='orderYear'/>"><s:property value="orderYear"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='responsibleDept'/>"><s:property value="responsibleDept"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='userUnit'/>"><s:property value="userUnit"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='userUnitPIC'/>"><s:property value="userUnitPIC"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='taskSource'/>"><s:property value="taskSource"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='designDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-designDate.getYear()>19">已完成</s:if><s:else><s:date name="designDate" format="yyyy-MM-dd"/></s:else></td>
<%-- 					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='designDate' format='yyyy-MM-dd'/>"><s:date name="designDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='structureDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-structureDate.getYear()>19">已完成</s:if><s:else><s:date name="structureDate" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='structureDate" format='yyyy-MM-dd'/>"><s:date name="structureDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='yuanqjDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-yuanqjDate.getYear()>19">已完成</s:if><s:else><s:date name="yuanqjDate" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='yuanqjDate' format='yyyy-MM-dd'/>"><s:date name="yuanqjDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='modelDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-modelDate.getYear()>19">已完成</s:if><s:else><s:date name="modelDate" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='modelDate" format='yyyy-MM-dd'/>"><s:date name="modelDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='machineDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-machineDate.getYear()>19">已完成</s:if><s:else><s:date name="machineDate" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='machineDate' format='yyyy-MM-dd'/>"><s:date name="machineDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='testDate' format='yyyy-MM-dd'/>"><s:if test="new java.util.Date().getYear()-testDate.getYear()>19">已完成</s:if><s:else><s:date name="testDate" format="yyyy-MM-dd"/></s:else></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='testDate' format='yyyy-MM-dd'/>"><s:date name="testDate" format="yyyy-MM-dd"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='produceMode'/>"><s:property value="produceMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='produceNum'/>"><s:property value="produceNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='yuanqjLevel'/>"><s:property value="yuanqjLevel"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='instructionMode'/>"><s:property value="instructionMode"/></td>
					<%-- <td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='subType'/>"><s:property value="subType"/></td> --%>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='remarks'/>"><s:property value="remarks"/></td>
					<td align="center"><s:property value="checklistId"/>
						<a href="../microwave/product_ProductOrder_showOrderDetailZonghc_zonghc-order-show.action?num=<s:property value="id"/>" height="700" width="1100" target="dialog" class="details">详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
