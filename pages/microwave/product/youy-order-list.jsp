<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	//新增订单
	jn("#newSelect").change(function(){
		var data = '<s:property value="data"/>';
		switch(jn("#newSelect").val()){
			case '新建':
				break;
			case 'fill':
				alert("功能正在开发");
				break;
			case 'importZhengj':
				jn("#newSelect").val("新建");
				var url="../microwave/product_ProductOrder_returnjsp_youy-order-add-excel.action";
				navTab.openTab("youy", url, { title:"导入整机订单", fresh:false, data:{data:data} });
				break;
			/* case 'importMok':
				jn("#newSelect").val("新建");
				var url="../microwave/product_ProductOrder_returnjsp_youy-order-add-excel-mok.action";
				navTab.openTab("youy", url, { title:"导入模块订单", fresh:false, data:{} });
				break; */
			default:
				alert("error");
				break;
		}
	});
	
	//批量添加子订单
	jn(".addChildOrderBatch").click(function(){
		var $checkedTrs = jn("[name='ids']:checked");
		if($checkedTrs.length<1){
			alertMsg.error("请至少选择一个订单！");
			return false;
		}
		var ids = "";
		var data = '<s:property value="data"/>';
		for(var i=0;i<$checkedTrs.length;i++){
			ids = ids + $checkedTrs.eq(i).parent().parent().attr("rel") + ", ";
		}
		var url="../microwave/product_ProductOrder_findProdOrderListByIds_child-order-add-batch-input.action";
		navTab.openTab("", url, { title:"批量添加子订单", fresh:false, data:{ids:ids, data:data} });
	})
	
	//批量编辑
	jn(".editOrderBatch").click(function(){
		var $checkedTrs = jn("[name='ids']:checked");
		if($checkedTrs.length<1){
			alertMsg.error("请至少选择一个订单！");
			return false;
		}
		var ids = "";
		var data = '<s:property value="data"/>';
		for(var i=0;i<$checkedTrs.length;i++){
			ids = ids + $checkedTrs.eq(i).parent().parent().attr("rel") + ", ";
		}
		var url="../microwave/product_ProductOrder_findProdOrderListByIds_order-prod-edit-batch-jn.action";
		navTab.openTab("", url, { title:"批量编辑", fresh:false, data:{ids:ids, data:data} });
	})
	
	jn(function(){
		//获取列表行被双击事件
		jn("tbody tr").dblclick(function(){
			jn(this).find(".edit").click();
		})
		//当点击“重置”按钮时将查询输入框全部置空
		/* jn("#reset").click(function(){
			jn("input, #type").val("");
		}) */
	})
	//导出
	jn("#export").click(function(){
		 jn("#searchFrm").attr("action", "../microwave/product_ProductOrder_printOrderYouy.action");
		 jn("#searchFrm").submit();
	});
	
	//查询 
	 jn("#search").click(function(){
		  jn("#searchFrm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchFrm").attr("action", "../microwave/product_ProductOrder_show"+'<s:property value="data"/>'+"_youy-order-list.action");
		  jn("#searchFrm").submit();
	  });
</script>
<div class="pageHeader">
	<form onsubmit="" action="" method="post" id="searchFrm">
		<input type="hidden" name="data" value='<s:property value="data"/>'>
		<div>
			<table class="edit_table" width="100%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">所属项目</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.libCode like']" value="<s:property value="paramMap['m.libCode like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">设备代号</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">主管设计师</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.name like']" value="<s:property value="paramMap['m.singleHead.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">隶属班组</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.teamName like']" value="<s:property value="paramMap['m.teamName like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">计划人员</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.designPlanManager.name like']" value="<s:property value="paramMap['m.designPlanManager.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">专业分类</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.classification like']" value="<s:property value="paramMap['m.classification like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">图纸代号</td>
					<td style="width: 12%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.selProdCode like']" value="<s:property value="paramMap['m.selProdCode like']"/>" style="width:40%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">考核开始</td>
					<td style="width: 12%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.assessPlanBD ge Date']" value="<s:property value="paramMap['m.assessPlanBD ge Date']"/>" style="width:40%;height:18px;" readonly="readonly" onclick="WdatePicker();"/>~
						<input type="text" name="paramMap['m.assessPlanBD le Date']" value="<s:property value="paramMap['m.assessPlanBD le Date']"/>" style="width:40%;height:18px;" readonly="readonly" onclick="WdatePicker();"/>
					</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<button type="botton" id="search" style="height:23px;float:right;"><span style="padding-bottom:3px;font-size:12px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">质量状态</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.qualityState like']" value="<s:property value="paramMap['m.qualityState like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">风险项目</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.riskProj like']" value="<s:property value="paramMap['m.riskProj like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:6%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">验证项目</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.valiProj like']" value="<s:property value="paramMap['m.valiProj like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">班组长</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.teamLead.name like']" value="<s:property value="paramMap['m.teamLead.name like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">任务来源</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.taskSource like']" value="<s:property value="paramMap['m.taskSource like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">产品种类</td>
					<td style="width: 5%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.category like']" value="<s:property value="paramMap['m.category like']"/>" style="width:100%;height:18px;" />
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">预计交付</td>
					<td style="width: 12%;padding:0px 0px 1px;border:hidden;">
						<input readonly="readonly" size="12" type="text" name="paramMap['m.latestDeliveryPD ge Date']" value="<s:property value="paramMap['m.latestDeliveryPD ge Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>~
						<input readonly="readonly" size="12" type="text" name="paramMap['m.latestDeliveryPD le Date']" value="<s:property value="paramMap['m.latestDeliveryPD le Date']"/>" style="width:40%;height:18px;" onclick="WdatePicker();"/>
					</td>
					<td style="width:5%; font-size:12px; text-align: right;padding:0px 3px 0px;border:hidden;">考核结束</td>
					<td style="width: 12%;padding:0px 0px 1px;border:hidden;">
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
					<!-- <option value="fill">手动录入</option>
					<option value="importZhengj">导入整机订单</option> -->
					<!-- <option value="importMok">导入模块订单</option> -->
				</select>
			</li>
			<%-- <li><a href="../microwave/product_ProductOrderRecord_inputRecord_order-record-add.action?id={id}" target="dialog" width="800" height="400" class="icon"><span>更新进度</span></a></li> --%>
			<%-- <li><a title="订单详情" href="../microwave/product_ProductOrder_showProductOrder_youy-order-edit.action?num={id}" class="edit" target="dialog" height="700" width="1100"><span>详情</span></a></li> --%>
			<li><a href="../microwave/product_ProductOrder_deleteProdcutOrderList.action" class="delete" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li>
			<li><a class="edit addChildOrderBatch" ><span>批量添加子订单</span></a></li>
			<li><a class="edit editOrderBatch" ><span>批量编辑</span></a></li>
			<li><a href="../microwave/product_ProductOrder_cloneProductDetailInput_product-detail-clone-input.action?num={id}&&data=<s:property value='data'/>" class="icon" target="dialog" title="性能复制" height="700" width="900"><span>性能复制</span></a></li>
			<li><a title="结构信息" href="../microwave/product_ProductOrder_showProductOrder_youy-order-level-tree.action?num={id}" class="edit" target="navTab" ><span>结构信息</span></a></li>
			<%-- <li><a href="../microwave/product_ProductOrder_returnjsp_youy-order-add-excel-mok.action" class="icon" target="navTab" title="导入模块订单" ><span>导入模块订单</span></a></li> --%>
			<%-- <li><a href="../microwave/product_ProductOrder_addProductOrderInput_zhengji-order-add-input.action" class="add" target="navTab" rel="4"><span>添加新整机</span></a></li> --%>
			<%-- <li><a href="../microwave/product_ProductOrder_addProductOrderInput_mokuai-order-add-input.action?num={id}" class="add" target="navTab" ><span>添加新模块</span></a></li> --%>
			<%-- <li><a class="icon declare" ><span>元器件申报派工</span></a></li> --%>
			<%-- <li><a class="icon delivery" ><span>自验收派工</span></a></li> --%>
		</ul>
	</div>
	<div>
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="17" rowspan="2"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="30" rowspan="2">序号</th>
					<th width="60" rowspan="2">标识码</th>
					<th width="75" rowspan="2">所属项目</th>
					<th width="80" rowspan="2">设备名称</th>
					<th width="150" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">整机设备代号/<br/>模块完整代号</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">主管<br/>设计师</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">考核计划<br/>开始时间</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">考核计划<br/>完成时间</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">预计<br/>交付时间</span></th>
					<th width="75" rowspan="2">研制现状</th>
					<th width="75" rowspan="2">管控措施</th>
					<th width="75" rowspan="2">质量状态</th>
					<th width="75" rowspan="2">风险项目</th>
					<th width="75" rowspan="2">验证项目</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">工程化<br/>分离状态</span></th>
					<th width="75" rowspan="2">研制模式</th>
					<th width="40" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>数量</span></th>
					<th width="40" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">投产<br/>数量</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">隶属<br/>设备名称</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">隶属<br/>设备代号</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">隶属<br/>图纸代号</span></th>
					<th width="75" rowspan="2">任务来源</th>
					<th width="40" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">选用<br/>类型</span></th>
					<th width="40" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">研制<br/>阶段</span></th>
					<th width="75" rowspan="2">专业分类</th>
					<th width="75" rowspan="2">产品种类</th>
					<th width="75" rowspan="2">研制部门</th>
					<th width="75" rowspan="2">隶属班组</th>
					<th width="75" rowspan="2">班组长</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">结构<br/>设计师</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">工艺<br/>设计师</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">设计<br/>计划经理</span></th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">生产<br/>计划经理</span></th>
					<th width="75" rowspan="2">产保工程师</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">质量<br/>管理人员</span></th>
					<th width="75" rowspan="2">外协单位</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">外协单位<br/>负责人</span></th>
					<th width="175" colspan="2">文献综述</th>
					<th width="175" colspan="2">调研报告</th>
					<th width="175" colspan="2">任务书确认</th>
					<th width="175" colspan="2">方案设计/项目建议书</th>
					<th width="175" colspan="2">元器件申报</th>
					<th width="175" colspan="2">设计仿真</th>
					<th width="175" colspan="2">接口单（电、力、热）</th>
					<th width="175" colspan="2">设计报告</th>
					<th width="175" colspan="2">验证件投产</th>
					<th width="175" colspan="2">验证件总结</th>
					<th width="175" colspan="2">图纸绘制</th>
					<th width="175" colspan="2">调试细则</th>
					<th width="175" colspan="2">采购规范/试验大纲</th>
					<th width="175" colspan="2">调测附件</th>
					<th width="175" colspan="2">借用分析报告</th>
					<th width="175" colspan="2">生产准备（元器件齐套）</th>
					<th width="175" colspan="2">电子装联</th>
					<th width="175" colspan="2">调试</th>
					<th width="175" colspan="2">封盖</th>
					<th width="175" colspan="2">环境/筛选试验</th>
					<th width="175" colspan="2">数据判读</th>
					<th width="175" colspan="2">研制总结</th>
					<th width="175" colspan="2">质量数据包审查报告</th>
					<th width="175" colspan="2">交付入库</th>
					<th width="75" rowspan="2">图纸代号</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">MES<br/>产品编号</span></th>
					<th width="75" rowspan="2">用户单位</th>
					<th width="75" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">用户单位<br/>责任人</span></th>
					<th width="70" rowspan="2">操作</th>
				</tr>
				<tr>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
					<th width="100">计划时间</th>
					<th width="100">结束时间</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><input name="ids" value="<s:property value='id'/>" type="checkbox"></td>
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='id'/>"><s:property value="id"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='libCode'/>"><s:property value="libCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='name'/>"><s:property value="name"/></td>
					<s:if test='parentProductOrder==null'>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='code'/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if>"><s:property value="code"/><s:property value="freqInfo"/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if></td>
					</s:if>
					<s:else>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:if test='parentProductOrder.code!=null'><s:property value='parentProductOrder.code'/></s:if><s:else><s:property value='parentProductOrder.selProdCode'/></s:else>/<s:property value='selProdCode'/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if>"><s:if test='parentProductOrder.code!=null'><s:property value='parentProductOrder.code'/></s:if><s:else><s:property value='parentProductOrder.selProdCode'/></s:else>/<s:property value='selProdCode'/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if></td>
					</s:else>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='singleHead.name'/>"><s:property value="singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="assessPlanBD" format="yyyy-MM-dd"/>"><s:date name="assessPlanBD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="assessPlanED" format="yyyy-MM-dd"/>"><s:date name="assessPlanED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="latestDeliveryPD" format="yyyy-MM-dd"/>"><s:date name="latestDeliveryPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='currentState'/>"><s:property value="currentState"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='controlMeasure'/>"><s:property value="controlMeasure"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='qualityState'/>"><s:property value="qualityState"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='riskProj'/>"><s:property value="riskProj"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='valiProj'/>"><s:property value="valiProj"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='enginSeperateState'/>"><s:property value="enginSeperateState"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='researchMode'/>"><s:property value="researchMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='orderNum'/>"><s:property value="orderNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='produceNum'/>"><s:property value="produceNum"/></td>
					<s:if test='parentProductOrder==null'>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdName'/>"><s:property value="parentProdName"/></td>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdCode'/>"><s:property value="parentProdCode"/></td>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdCode'/>"><s:property value="parentSelProdCode"/></td>
					</s:if>
					<s:else>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdName'/>"><s:property value="parentProductOrder.name"/></td>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdCode'/>"><s:property value="parentProductOrder.code"/></td>
						<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='parentProdCode'/>"><s:property value="parentProductOrder.selProdCode"/></td>
					</s:else>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='taskSource'/>"><s:property value="taskSource"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='selectType'/>"><s:property value="selectType"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='phase'/>"><s:property value="phase"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='classification'/>"><s:property value="classification"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='category'/>"><s:property value="category"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='responsibleDept'/>"><s:property value="responsibleDept"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='teamName'/>"><s:property value="teamName"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='teamLead.name'/>"><s:property value="teamLead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='structureManager.name'/>"><s:property value="structureManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='technicalManager.name'/>"><s:property value="technicalManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='designPlanManager.name'/>"><s:property value="designPlanManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='prodPlanManager.name'/>"><s:property value="prodPlanManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='prodAssureManager.name'/>"><s:property value="prodAssureManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='qualityManager.name'/>"><s:property value="qualityManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='outsourceUnit'/>"><s:property value="outsourceUnit"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='outsourceUnitPIC'/>"><s:property value="outsourceUnitPIC"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="literatureReviewPD" format="yyyy-MM-dd"/>"><s:date name="literatureReviewPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="literatureReviewED" format="yyyy-MM-dd"/>"><s:date name="literatureReviewED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="researchReportPD" format="yyyy-MM-dd"/>"><s:date name="researchReportPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="researchReportED" format="yyyy-MM-dd"/>"><s:date name="researchReportED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="taskDocConfirmPD" format="yyyy-MM-dd"/>"><s:date name="taskDocConfirmPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="taskDocConfirmED" format="yyyy-MM-dd"/>"><s:date name="taskDocConfirmED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="schemeDesignDocPD" format="yyyy-MM-dd"/>"><s:date name="schemeDesignDocPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="schemeDesignDocED" format="yyyy-MM-dd"/>"><s:date name="schemeDesignDocED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="yuanqjDeclarePD" format="yyyy-MM-dd"/>"><s:date name="yuanqjDeclarePD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="yuanqjDeclareED" format="yyyy-MM-dd"/>"><s:date name="yuanqjDeclareED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="designSimulatePD" format="yyyy-MM-dd"/>"><s:date name="designSimulatePD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="designSimulateED" format="yyyy-MM-dd"/>"><s:date name="designSimulateED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="interfaceSheetPD" format="yyyy-MM-dd"/>"><s:date name="interfaceSheetPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="interfaceSheetED" format="yyyy-MM-dd"/>"><s:date name="interfaceSheetED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="designReportPD" format="yyyy-MM-dd"/>"><s:date name="designReportPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="designReportED" format="yyyy-MM-dd"/>"><s:date name="designReportED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="cjIntoProductPD" format="yyyy-MM-dd"/>"><s:date name="cjIntoProductPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="cjIntoProductED" format="yyyy-MM-dd"/>"><s:date name="cjIntoProductED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="cjSummaryPD" format="yyyy-MM-dd"/>"><s:date name="cjSummaryPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="cjSummaryED" format="yyyy-MM-dd"/>"><s:date name="cjSummaryED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="drawingPD" format="yyyy-MM-dd"/>"><s:date name="drawingPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="drawingED" format="yyyy-MM-dd"/>"><s:date name="drawingED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="debugDetailPD" format="yyyy-MM-dd"/>"><s:date name="debugDetailPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="debugDetailED" format="yyyy-MM-dd"/>"><s:date name="debugDetailED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="testOutlinePD" format="yyyy-MM-dd"/>"><s:date name="testOutlinePD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="testOutlineED" format="yyyy-MM-dd"/>"><s:date name="testOutlineED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="testAnnexPD" format="yyyy-MM-dd"/>"><s:date name="testAnnexPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="testAnnexED" format="yyyy-MM-dd"/>"><s:date name="testAnnexED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="borrowAnalyseReportPD" format="yyyy-MM-dd"/>"><s:date name="borrowAnalyseReportPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="borrowAnalyseReportED" format="yyyy-MM-dd"/>"><s:date name="borrowAnalyseReportED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="prodPreparePD" format="yyyy-MM-dd"/>"><s:date name="prodPreparePD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="prodPrepareED" format="yyyy-MM-dd"/>"><s:date name="prodPrepareED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="eleAssemblyPD" format="yyyy-MM-dd"/>"><s:date name="eleAssemblyPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="eleAssemblyED" format="yyyy-MM-dd"/>"><s:date name="eleAssemblyED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="debugPD" format="yyyy-MM-dd"/>"><s:date name="debugPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="debugED" format="yyyy-MM-dd"/>"><s:date name="debugED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="capPD" format="yyyy-MM-dd"/>"><s:date name="capPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="capED" format="yyyy-MM-dd"/>"><s:date name="capED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="environmentTestPD" format="yyyy-MM-dd"/>"><s:date name="environmentTestPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="environmentTestED" format="yyyy-MM-dd"/>"><s:date name="environmentTestED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="dataInterpretPD" format="yyyy-MM-dd"/>"><s:date name="dataInterpretPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="dataInterpretED" format="yyyy-MM-dd"/>"><s:date name="dataInterpretED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="researchSummaryPD" format="yyyy-MM-dd"/>"><s:date name="researchSummaryPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="researchSummaryED" format="yyyy-MM-dd"/>"><s:date name="researchSummaryED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="qdpReviewReportPD" format="yyyy-MM-dd"/>"><s:date name="qdpReviewReportPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="qdpReviewReportED" format="yyyy-MM-dd"/>"><s:date name="qdpReviewReportED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="deliveryPD" format="yyyy-MM-dd"/>"><s:date name="deliveryPD" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name="deliveryED" format="yyyy-MM-dd"/>"><s:date name="deliveryED" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='selProdCode'/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if>" class="selProdCode"><s:property value="selProdCode"/><s:if test='freqInfo!=null'>@<s:property value='freqInfo'/></s:if></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='mesCode'/>"><s:property value="mesCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='userUnit'/>"><s:property value="userUnit"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='userUnitPIC'/>"><s:property value="userUnitPIC"/></td>
					<td align="center">
						<a href="../microwave/product_ProductOrder_showProductOrder_youy-order-show.action?num=<s:property value="id"/>&&data=<s:property value="data"/>" height="700" width="1100" target="dialog" class="show">详情</a>&nbsp;&nbsp;|
						<a href="../microwave/product_ProductOrder_showProductOrder_youy-order-edit.action?num=<s:property value="id"/>&&data=<s:property value="data"/>" height="700" width="1100" target="dialog" class="edit">编辑</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<div class="formBar" style="text-align： center;">
		<u:juipage></u:juipage>
	</div>
</div> 
