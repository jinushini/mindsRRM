<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" name="parentId" value="<s:property value="parentId"/>"/>
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				名称：<input type="text" name="paramMap['p.key like']" value="<s:property value="paramMap['p.key like']"/>" />
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
			<li><a class="add" href="../product/productConfigEditer!inputAdd.action?parentId=<s:property value='parentId'/>" target="navTab" rel=""><span>添加</span></a></li>
			<li><a class="edit" href="../product/productConfigEditer!inputModify.action?configId={id}" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../product/productConfigEditer!delete.action?configId={id}&parentId=<s:property value='parentId'/>" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="icon" href="../product/productConfig!showList.action" target="navTab" rel=""><span>返回</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="117" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th width="100">名称</th>
					<th width="150">描述</th>				
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="key"/></td>
					<td align="center"><s:property value="value"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

