<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

jn("#newSelect").change(function(){
	switch(jn("#newSelect").val()){
		case '新建':
			break;
		case 'fill':
			jn("#newSelect").val("新建");
			var url="../review/Product_inputAddProduct_product-add.action";
			navTab.openTab("", url, { title:"新建", fresh:false, data:{} });
			break;
		case 'excel':
			jn("#newSelect").val("新建");
			var url="../review/Product_enterImportExcel_product-add-excel.action";
			navTab.openTab("", url, { title:"Excel导入订单", fresh:false, data:{} });
			break;
		default:
			alert("此功尚未修炼！");	
			break;
	}
});
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				型号代号：<input type="text" name="paramMap['p.modelCode like']" value="<s:property value="paramMap['p.modelCode like']"/>" />
			</li>
			<li>
				分系统：<input type="text" name="paramMap['p.modelName like']" value="<s:property value="paramMap['p.modelName like']"/>" />
			</li>
			<li>
				产品代号：<input type="text" name="paramMap['p.productCode like']" value="<s:property value="paramMap['p.productCode like']"/>" />
			</li>
			<li>
				产品名称：<input type="text" name="paramMap['p.productName like']" value="<s:property value="paramMap['p.productName like']"/>" />
			</li>
			<li>
				产品种类：<input type="text" name="paramMap['p.type like']" value="<s:property value="paramMap['p.type like']"/>" />
			</li>
			<li>
				单机主管：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
			</li>

		</ul>
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
			<%-- <li><a class="add" href="../review/product!inputAddProduct.action" target="navTab" rel=""><span>添加</span></a></li> --%>
			<li>
				<select id="newSelect">
					<option value="新建" selected>----添加复查产品----</option>
					<option value="fill">手动录入</option>
					<option value="excel">EXCEL导入</option>
				</select>
			</li>
			
			<li><a class="edit" href="../review/Product_inputModifyProduct_product-modify.action?productId={id}" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../review/Product_deleteProduct.action?productId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="144" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th width="100">型号代号</th>
					<th width="150">分系统</th>
					<th width="150">单机代号</th>
					<th width="200">单机名称</th>
					<th width="90">产品种类</th>					
					<th width="100">生产编号</th>					
					<th width="80">单机主管</th>					
					<th width="100">生产单位</th>					
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="modelCode==null ? productLib.modelCode : modelCode"/></td>
					<td align="center"><s:property value="modelName"/></td>
					<td align="center"><s:property value="productCode"/></td>
					<td align="center"><s:property value="productName"/></td>
					<td align="center"><s:property value="type"/></td>
					<td align="center"><s:property value="productionCode"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>					
					<td align="center"><s:property value="productionUnit"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

