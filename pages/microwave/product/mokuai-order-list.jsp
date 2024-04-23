<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	jn(".declare").click(function(){
		var productOrderId = jn("table .selected").attr("rel");
		if(productOrderId == null){
			alertMsg.error("请选择信息！");
			return false;
		}
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../declareDispatch/DeclareDispatch_findDeclareDispatchByProductOrderId.action",
			data:{
				num:productOrderId
			}, 
			success : function(data, statusText) {
				if(data != null){
					alertMsg.error(data);
				}else{
					var options={};
					options.width = 700;
					options.height = 300;
					var url = "../declareDispatch/DeclareDispatch_addDeclareDispatchInput_declare-dispatch-add-input.action?num="+ productOrderId +"&data=模块";
					$.pdialog.open(url, "new_msg", "元器件申报派工", options);
				}
				/* if(productOrder.declareDispatch != null){
					alertMsg.error("不能重复派工");
				}else{
					var options={};
					options.width = 700;
					options.height = 300;
					var url = "../declareDispatch/DeclareDispatch_addDeclareDispatchInput_declare-dispatch-add-input.action?num="+ productOrderId +"&data=模块";
					$.pdialog.open(url, "new_msg", "元器件申报派工", options);
				} */
			}
		});
	})
</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						型号代号：<input type="text" name="paramMap['p.subType like']" value="<s:property value="paramMap['p.subType like']"/>" />
						产品名称：<input type="text" name="paramMap['p.name like']" value="<s:property value="paramMap['p.name like']"/>" />
						产品代号：<input type="text" name="paramMap['p.code like']" value="<s:property value="paramMap['p.code like']"/>" />
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a href="../microwave/product_ProductOrder_addProductOrderInput_mokuai-order-add-input.action" class="add" target="navTab" ><span>添加新模块</span></a></li>
			<li><a class="icon declare" ><span>元器件申报派工</span></a></li>
		</ul>
	</div>
	<div >
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="100">模块代号</th>
					<th width="100">模块名称</th>
					<th width="100">模块设计师</th>
					<th width="100">整机代号</th>
					<th width="100">整机名称</th>
					<th width="100">整机设计师</th>
					<th width="100">型号代号</th>
					<th width="100">型号名称</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelName"/></td>
					
					<%-- <td align="center"><s:property value="checklistId"/>
						<a href="../checklist/checklistAppr!showChecklist.action?checklistId=<s:property value="id"/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td> --%>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
