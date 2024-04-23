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
					key：<input type="text" name="paramMap['s.name like']" value="<s:property value="paramMap['s.name like']"/>" />
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
			<li><a class="add" href="../fextends/systemConfigDetail!inputAdd.action?parentConfigId=<s:property value='parentConfigId'/>" target="navTab" rel="currentNavTab"><span>添加</span></a></li>
			<li><a class="edit" href="../fextends/systemConfigDetail!inputEdit.action?parentConfigId=<s:property value='parentConfigId'/>&systemConfigId={id}" target="navTab" rel="currentNavTab"><span>修改</span></a></li>
			<li><a class="delete" href="../fextends/systemConfigDetail!delete.action?systemConfigId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" href="../fextends/systemConfig!showList.action" target="navTab"><span>返回</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<div layoutH="120">
		<table class="list_table list" width="100%" layoutH="140">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">key</th>
					<th>value</th>
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