<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	//查询 
	 jn("#search").click(function(){
		  //var url = "<s:property value='page.url'/>";
		  var url = "../general/seal_Seal_showList_seal-list.action";
		  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchForm").attr("action", url);
	  });
	
	jn(".use").click(function(){
		var num = jn(this).parent().find("input[name='use']").val();
		var id = jn(this).parent().find("input[name='id']").val();
		num = num == 0 ? 1 : 0;
		var url = "../general/seal_Seal_useSeal.action";
		$.post(url, {num:num,id:id}, navTabAjaxDone, "json");
	});
	
</script>

<div class="pageHeader">
<form id="searchForm" method="post">
	<input type="hidden" id="currentUserId" value="<s:property value="currentUser.id"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					公章名称：<input type="text" name="paramMap['t.title like']" value="<s:property value="paramMap['t.title like']"/>" />
				</td>
				<td>
					公章类型：<input type="text" name="paramMap['t.type like']" value="<s:property value="paramMap['t.type like']"/>" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="search">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../general/seal_Seal_enterAddOrEdit_seal-add-edit.action?op=1" target="dialog" rel="" width='750' height='450'><span>新增</span></a></li>
			<li><a class="edit" href="../general/seal_Seal_enterAddOrEdit_seal-add-edit.action?op=0&id={id}" target="dialog" rel="" width='750' height='450'><span>编辑</span></a></li>
			<li><a class="delete" href="../general/seal_Seal_delete.action?id={id}" title="确定删除吗？" target="ajaxTodo" rel="id"><span>删除</span></a></li>
			<li><a class="icon" href="#" ><span>记录</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="10%">上传时间</th>
					<th width="30%">公章名称</th>
					<th width="30%">公章图标</th>
					<th width="10%">公章类型</th>
					<th width="10%">启用状态</th>
					<th width="5%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
					<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="id"><s:property value="id"/></td>
					<td align="center"><s:date name="createDate" format="yyyy-MM-dd"/></td>
					<td align="center" title="<s:property value="title"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="title"/></td>
					<td align="center"><img src='<s:property value="filePath"/>' width="100" height="100"/></td>
					<td align="center"><s:property value="type"/></td>
					<td align="center" <s:if test="use == 1">style="color:green;font-size:30px" title="已启用"</s:if><s:else>style="color:red;font-size:30px" title="已过期"</s:else>>
						●
					</td>
					<td align="center">
						<input hidden="hidden" name="use" value="<s:property value='use'/>"/>
						<input hidden="hidden" name="id" value="<s:property value='id'/>"/>
						<button class="use"><s:if test="use == 1">停用</s:if><s:else>启用</s:else></button>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

