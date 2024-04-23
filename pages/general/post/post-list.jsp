<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	//查询 
	 jn("#search").click(function(){
		  //var url = "<s:property value='page.url'/>";
		  var url = "../general/post_Post_showList_post-list.action";
		  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchForm").attr("action", url);
	  });
	
	jn("select[name='temp']").change(function(){
		var temp = jn(this).val();
		var title="新建公文";
		switch(temp){
			case 'temp1':
				var url="../general/post_Post_enterAddOrEdit_post-add-edit-temp1.action?op=1";
				navTab.openTab("", url, { title:title, fresh:false, data:{} });
				break;
			case 'temp2':
				var url="../general/post_Post_enterAddOrEdit_post-add-edit-temp2.action?op=1";
				navTab.openTab("", url, { title:title, fresh:false, data:{} });
				break;
			default:
				alert("error");	
				break;
		}
	});
	
</script>

<div class="pageHeader">
<form id="searchForm" method="post">
	<input type="hidden" id="currentUserId" value="<s:property value="currentUser.id"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					公文名称：<input type="text" name="paramMap['t.title like']" value="<s:property value="paramMap['t.title like']"/>" />
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
			<li>
				<select name="temp">
					<option>---请选择模板---</option>
					<option value="temp1">公文1</option>
					<option value="temp2">公文2</option>
				</select>
			</li>
			<%-- <li><a class="add" href="../general/post_Post_enterAddOrEdit_post-add-edit.action?op=1" target="navTab" rel="currentNavTab"><span>新增</span></a></li> --%>
			<%-- <li><a class="edit" href="../general/post_Post_enterAddOrEdit_post-add-edit.action?op=0&id={id}" target="navTab" rel="currentNavTab"><span>编辑</span></a></li> --%>
			<%-- <li><a class="delete" href="../general/post_Post_delete.action?id={id}" title="确定删除吗？" target="ajaxTodo" rel="id"><span>删除</span></a></li> --%>
			<%-- <li><a class="icon" href="#" ><span>记录</span></a></li> --%>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="15%">编号</th>
					<th width="30%">标题</th>
					<th width="10%">发布日期</th>
					<th width="8%">发布人</th>
					<th width="8%">签发人</th>
					<th width="10%">分类</th>
					<th width="8%">状态</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
					<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="code"/></td>
					<td align="center" title="<s:property value="title"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="title"/></td>
					<td align="center"><s:date name="publishDate" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="publisher.name"/></td>
					<td align="center"><s:property value="signUser.name"/></td>
					<td align="center"><s:property value="category"/></td>
					<td align="center"><s:property value="state==0?'已作废':state==1?'待发布':'已发布'"/></td>
					<s:if test="currentUser.id == publisher.id">
						<td align="center">
							<s:if test="status == 5 && state == 1">
								<a href="../general/post_Post_startProcess.action?id=<s:property value='id'/>" target="ajaxTodo">提交审核</a>
							</s:if>
							<s:elseif test="status == 3 && state == 1">
								<a href="../general/post_Post_publish.action?id=<s:property value='id'/>" target="ajaxTodo">发布公文</a>
							</s:elseif>
							<a href="../general/post_Post_showDetails_post-show-<s:property value='template'/>.action?id=<s:property value="id"/>" height="800" width="900" target="dialog" class="details">详情</a>
							<s:if test="state != 2">
								<a href="../general/post_Post_enterAddOrEdit_post-add-edit-<s:property value='template'/>.action?op=0&id=<s:property value="id"/>" height="800" width="900" target="navTab" class="details">编辑</a>
							</s:if>
						</td>
					</s:if>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

