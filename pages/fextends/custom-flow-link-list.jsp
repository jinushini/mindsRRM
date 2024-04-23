<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">		
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<input type="hidden" name="parentId" value="<s:property value="parentId"/>"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						环节名称：<input type="text" name="paramMap['rfd.name like']" value="<s:property value="paramMap['rfd.name like']"/>" />
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<!-- <li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li> -->
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../fextends/HtyFlow_inputAdd_custom-flow-link-add.action?parentId=<s:property value='parentId'/>" target="dialog" rel="" width='750' height='350'><span>新增</span></a></li>
			<li><a class="edit" href="../fextends/HtyFlow_inputEdit_custom-flow-link-edit.action?id={id}&&parentId=<s:property value='parentId'/>" target="dialog" title="修改" width='750' height='350'><span>修改</span></a></li>	
			<li><a class="delete" href="../fextends/HtyFlow_delete.action?id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>	
			<%-- <li><a class="icon" href="..//fextends/HtyFlow_getFlowList_custom-flow-stage-list.action?parentId={id}" target="navTab" rel="currentNavTab"><span>配置阶段</span></a></li> --%>
			<li><a class="icon" href="../fextends/HtyFlow_goBack_custom-flow-list.action?parentId=<s:property value='parentId'/>" target="navTab" rel="currentNavTab" title="返回上一级"><span>返回</span></a></li>
		</ul>
	</div>
	<div layoutH="10">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="3%" align="center">序号</th>
					<th width="25%">环节名称</th>
					<!-- <th width="25%">环节类型</th> -->
					<th width="25%">环节顺序</th>
					<!-- <th width="10%">操作</th> -->
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">	
			  			  	
				<tr target="id" rel="<s:property value="id"/>" class="tr">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" title="<s:property value="name"/>"><s:property value="name"/></td>
					<%-- <td align="center"><s:property value="flowKey.key"/></td> --%>
					<td align="center"><s:property value="sort"/></td>
					<%-- <td align="center">
						<a href="../fextends/HtyFlow_getFlowDetails_custom-flow-details.action?id=<s:property value='id'/>" target="navTab" title="流程详情" class="details">详情</a>													
					</td> --%>
				</tr>
					
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

