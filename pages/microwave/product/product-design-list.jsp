<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	jn("#newSelect").change(function(){
		switch(jn("#newSelect").val()){
			case '新建':
				break;
			case 'fill':
				jn("#newSelect").val("新建");
				var url="../microwave/product_ProductDesign_enterAdd_design-add.action";
				navTab.openTab("", url, { title:"新建", fresh:false, data:{} });
				break;
			/* case 'excel':
				jn("#newSelect").val("新建");
				var url="../order/order!inputOrderByExcel.action";
				navTab.openTab("", url, { title:"Excel导入订单", fresh:false, data:{} });
				break; */
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
		<table class="searchContent">
			<tr>
				<td>
					型号代号：<input type="text" name="paramMap['p.productBasic.productLib.modelCode like']" value="<s:property value="paramMap['p.productBasic.productLib.modelCode like']"/>" />
				</td>
				<td>
					产品代号：<input type="text" name="paramMap['p.productBasic.code like']" value="<s:property value="paramMap['p.productBasic.code like']"/>" />
				</td>
				<td>
					单机主管：<input type="text" name="paramMap['p.productBasic.singleHead.name like']" value="<s:property value="paramMap['p.productBasic..singleHead.name like']"/>" />
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
			<li style="margin-right:5px;">
				<select style="width:120px;" id="newSelect">
					<option value="新建" selected>----新建----</option>
					<option value="fill">手动录入</option>
					<option value="excel">EXCEL导入</option>
				</select>
			</li>
			<li><a class="edit" href="javascript:;" onclick="alert('此功尚未修炼！');" target="" rel="currentNavTab"><span>修改</span></a></li>
			<li><a class="delete" href="javascript:;" onclick="alert('此功尚未修炼！');" target="" rel="currentNavTab"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th width="100">产品代号</th>
					<th width="100">产品名称</th>
					<th width="100">主管设计师</th>
					<th width="100">分类</th>
					<th width="100">属性</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="id"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="processInstId"/></td>
					<td align="center"><s:property value="code"/></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>
					<td align="center"><s:property value="catagory"/></td>
					<td align="center"><s:property value="subType"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

