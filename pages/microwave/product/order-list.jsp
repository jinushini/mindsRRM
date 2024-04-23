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
				alert("此功尚未修炼！");
				break;
				/* jn("#newSelect").val("新建");
				var url="../microwave/product_ProductOrder_inputEdit_order-add-edit.action?op=1";
				navTab.openTab("", url, { title:"新建订单", fresh:false, data:{} });
				break; */
			case 'excel':
				jn("#newSelect").val("新建");
				var url="../microwave/product_ProductOrder_enterImportExcel_zhengji-order-add-excel.action";
				navTab.openTab("", url, { title:"Excel导入订单", fresh:false, data:{} });
				break;
			default:
				alert("此功尚未修炼！");
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
	
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	//导出
	jn("#export").click(function(){
		var url = "../microwave/product_ProductOrder_printOrder.action";
		 jn("#searchForm").attr("onsubmit", "return navTabSearch();");
		 jn("#searchForm").attr("action", url);
		 jn("#searchForm").submit();
	});
	
	//查询 
	 jn("#search").click(function(){
		  //var url = "<s:property value='page.url'/>";
		  var url = "../microwave/product_ProductOrder_showOrderList_order-list.action";
		  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchForm").attr("action", url);
		  jn("#searchForm").submit();
	  });
	
</script>
<div class="pageHeader">
	<form id="searchForm" onsubmit="" action="" method="post">
		<input type="hidden" id="currentUser" value="<s:property value='currentUser.id'/>">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						所属项目：<input type="text" name="paramMap['p.libCode like']" value="<s:property value="paramMap['p.libCode like']"/>" />
						设备名称：<input type="text" name="paramMap['p.name like']" value="<s:property value="paramMap['p.name like']"/>" />
						设备代号：<input type="text" name="paramMap['p.code like']" value="<s:property value="paramMap['p.code like']"/>" />
						计划管理：<input type="text" name="paramMap['p.planManager.name like']" value="<s:property value="paramMap['p.planManager.name like']"/>" />
						设计主管：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="search">查询</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="export">导出</button></div></div></li>
				</ul>
			</div>
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
			<li><a href="../microwave/product_ProductOrder_inputEdit_order-add-edit.action?id={id}&op=0" class="edit" target="navTab"><span>编辑</span></a></li>
			<li><a href="../microwave/product_ProductOrder_deleteProdcutOrder.action" class="delete" target="selectedTodo" rel="ids" title="确定要删除吗?"><span>批量删除</span></a></li>
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
					<th width="17"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="30">序号</th>
					<th width="100">所属项目</th>
					<th width="100">设备名称</th>
					<th width="100">设备代号</th>
					<th width="100">产品代号</th>
					<th width="100">MES产品代号</th>
					<th width="40">数量</th>
					<th width="60">研制阶段</th>
					<th width="60">研制模式</th>
					<th width="60">单机主管</th>
					<th width="100">订单号</th>
					<th width="60">计划主管</th>
					<th width="100">订单完成形式</th>
					<th width="100" style="word-wrap:break-word;">分院考核计划开始时间</th>
					<th width="100" style="word-wrap:break-word;">分院考核计划完成时间</th>
					<th width="100" style="word-wrap:break-word;">实际开始时间</th>
					<th width="100">实际完成时间</th>
					<th width="60">交付情况</th>
					<th width="100" style="word-wrap:break-word;">最新计划交付时间</th>
					<th width="200">当前研制阶段</th>
					<th width="200">当前存在问题</th>
					<th width="60">专业分类</th>
					<th width="100">产品种类</th>
					<th width="100" style="word-wrap:break-word;">自制单机继承分类</th>
					<th width="40" style="word-wrap:break-word;">模块数量</th>
					<th width="60">成熟度</th>
					<th width="60">订单年度</th>
					<th width="60">责任单位</th>
					<th width="100">用户单位</th>
					<th width="60" style="word-wrap:break-word;">用户单位责任人</th>
					<th width="60">任务来源</th>
					<th width="100">单机设计</th>
					<th width="100">结构件加工</th>
					<th width="100">元器件齐套</th>
					<th width="100">模块齐套</th>
					<th width="100">整机装调</th>
					<th width="100">测试实验</th>
					<th width="100">单机交付</th>
					<th width="60">投产方式</th>
					<th width="40" style="word-wrap:break-word;">投产数量</th>
					<th width="50" style="word-wrap:break-word;">元器件等级</th>
					<th width="100">指令方式</th>
					<th width="60">产品类别</th>
					<th width="100">备注</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><input name="ids" value="<s:property value='id'/>" type="checkbox"></td>
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="libCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="selProdType"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="MESCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="orderNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="phase"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="researchingMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="orderCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="hidden" class="planManager" value="<s:property value='planManager.id'/>" /><s:property value="planManager.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="completeTarget"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.planBeginDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.actualBeginDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.actualEndDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="deliveryState"/></td>
					<td align="center" class="current"><s:date name="currentDate" format="yyyy-MM-dd"/></td>
					<td align="center" class="current"><s:property value="currentPhase"/></td>
					<td align="center" class="current"><s:property value="currentIssue"/></td>
					<td align="center"><s:property value="classification"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="category"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="selectType"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="modelNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="maturity"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="orderYear"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productionUnit"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="userUnit"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="userUnitUser"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="taskSource"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="designDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="structuralDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="componentsDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="modelDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="machineDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="testDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="deliveryDate" format="yyyy-MM-dd"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="produceMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="produceNum"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="componentLevel"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="instructionMode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="subType"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="remarks"/></td>
					<td align="center"><s:property value="checklistId"/>
						<a href="../microwave/product_ProductOrder_showDetials_order-show.action?id=<s:property value="id"/>" height="700" width="1100" target="dialog" class="details">详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
