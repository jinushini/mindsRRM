<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				型号代号：<input type="text" name="paramMap['p.modelCode like']" value="<s:property value="paramMap['p.modelCode like']"/>" />
			</li>
			<li>
				型号名称：<input type="text" name="paramMap['p.modelName like']" value="<s:property value="paramMap['p.modelName like']"/>" />
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
			<li><a class="add" href="../product/productLib!inputAdd.action" target="navTab" rel=""><span>添加</span></a></li>
			<li><a class="edit" href="../product/productLib!inputModify.action?productLibId={id}" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../product/productLib!delete.action?productLibId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<%-- <li><a class="icon" href="../product/productLibConfig!showList.action?parentId={id}" target="navTab" rel=""><span>配置明细</span></a></li> --%>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="117" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th width="100">型号代号</th>
					<th width="150">型号名称</th>				
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="modelCode"/></td>
					<td align="center"><s:property value="modelName"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

