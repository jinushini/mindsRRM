<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

jn("#new").change(function(){
	switch(jn("#new").val()){
		case '新增订单':
			break;
		case 'fill':
			jn("#new").val("新增产品");
			var url="../twta/TwtaDebugProduct_input_product-input.action";
			navTab.openTab("", url, { title:"新建产品", fresh:false, data:{} });
			break;
		case 'excel':
			alert("暂未开通");
			return;
			/* jn("#new").val("新增产品");
			var url="../product/product!inputByExcel.action";
			navTab.openTab("", url, { title:"Excel导入产品", fresh:false, data:{} });
			break; */
		default:
			alert("error");	
			break;
	}
})

</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				投产编号：<input type="text" name="paramMap['t.productNum like']" value="<s:property value="paramMap['t.productNum like']"/>" />
			</li>
			<%-- <li>
				型号产品代号：<input type="text" name="paramMap['p.code like']" value="<s:property value="paramMap['p.code like']"/>" />
			</li>
			<li>
				研制阶段：<input type="text" name="paramMap['p.phase like']" value="<s:property value="paramMap['p.phase like']"/>" />
			</li>
			<li>
				单机分类：<input type="text" name="paramMap['p.subType.value like']" value="<s:property value="paramMap['p.subType.value like']"/>" />
			</li>
			<li>
				投产编号：<input type="text" name="paramMap['p.productNum like']" value="<s:property value="paramMap['p.productNum like']"/>" />
			</li>
			<li>
				单机主管设计师：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
			</li> --%>

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
			<li style="margin-right:5px;">
				<select style="width:120px;" id="new">
					<option value="新增产品" selected>----新增产品----</option>
					<option value="fill">手动填写</option>
					<option value="excel">EXCEL导入</option>
				</select>
			</li>
			<li><a class="edit" href="../twta/TwtaDebugProduct_input_product-input.action?id={id}" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../twta/TwtaDebugProduct_delete.action?id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="115" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th align="center" width="100">投产编号</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="productNum"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

