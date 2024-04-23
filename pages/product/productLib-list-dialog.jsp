<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

	//带回按钮
	jd(".btnSelect").click(function(){
		var id = jd(this).parent().parent().find(".id").val();
		var code = jd(this).parent().parent().find(".code").val();
		var name = jd(this).parent().parent().find(".name").val();
		var href = "javascript:$.bringBack({xid : '"+id+"', code:'"+code+"', name:'"+name+"'})";
		jd(this).attr("href",href);
	});
</script>

<div class="pageHeader">
	<form onsubmit="return dialogSearch(this);" action="../product/ProductLib_showList_productLib-list-dialog.action" method="post">
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
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="10%" align="center">选择</th>
					<th width="10%" align="center">序号</th>
					<th width="40%">型号代号</th>
					<th width="40%">型号名称</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td hidden="hidden"><input type="text" class="id" value="<s:property value='id'/>"/><input type="text" class="code" value="<s:property value='modelCode'/>"/><input type="text" class="name" value="<s:property value='modelName'/>"/></td>
					<td align="center"><a class="btnSelect" href="" title="查找带回">选择</a></td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="modelCode"/></td>
					<td align="center"><s:property value="modelName"/></td>		
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage dialog="true"></u:juipage>
	</div>
</div>

