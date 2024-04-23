<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--

//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value='page.url'/>" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					名称：<input type="text" name="paramMap['t.key like']" value="<s:property value="paramMap['t.key like']"/>" />
				</td>
			</tr>
			
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../fextends/HtyFlow_inputAddFlowDefKey_custom-flow-key-config-add.action" target="navTab" rel="currentNavTab"><span>添加</span></a></li>
			<li><a class="edit" href="../fextends/HtyFlow_inputEditFlowDefKey_custom-flow-key-config-edit.action?id={id}" target="navTab" rel="currentNavTab"><span>修改</span></a></li>
			<li><a class="delete" href="../fextends/HtyFlow_deleteFlowDefKey.action?id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="120">
		<table class="list_table list" width="100%" layoutH="140">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">名称</th>
					<th width="">key值</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value='id'/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value='key'/></td>
					<td align="center"><s:property value='value'/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<u:juipage></u:juipage>
</div>