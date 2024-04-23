<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	//查询 
	 jn("#search").click(function(){
		  //var url = "<s:property value='page.url'/>";
		  var url = "../general/timed_DispatchPlanItem_showList_item-list.action";
		  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchForm").attr("action", url);
		  //jn("#searchForm").submit();
	  });
	
	//汇总
	jn("#summary").click(function(){
		 var url = "../general/timed_DispatchPlanItem_showSummary_item-statistics.action";
		 jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		 jn("#searchForm").attr("action", url);
		 //jn("#searchForm").submit();
	});
	
</script>

<div class="pageHeader">
<form id="searchForm" method="post">
	<input type="hidden" id="currentUserId" value="<s:property value="currentUser.id"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					项目名称：<input type="text" name="paramMap['d.name like']" value="<s:property value="paramMap['d.name like']"/>" />
				</td>
				<td>
					创建人：<input type="text" name="paramMap['d.creater.name like']" value="<s:property value="paramMap['d.creater.name like']"/>" />
				</td>
				<td>
					事项来源：<input type="text" name="paramMap['d.source like']" value="<s:property value="paramMap['d.source like']"/>" />
				</td> 
				<td>
					年度：<input type="text" name="paramMap['d.years eq']" value="<s:property value="paramMap['d.years like']"/>" />
				</td> 
				<td>
					党支部：<input type="text" name="paramMap['d.unit like']" value="<s:property value="paramMap['d.unit like']"/>" />
				</td> 
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="search">查询</button></div></div></li>
			</ul>
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="summary">数据汇总</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../general/timed_DispatchPlanItem_enterAddOrModify_item-add-edit.action?op=1" target="dialog" rel="" width='900' height='800'><span>新增</span></a></li>
			<li><a class="edit" href="../general/timed_DispatchPlanItem_enterAddOrModify_item-add-edit.action?op=0&id={id}" target="dialog" rel="" width='900' height='800'><span>修改</span></a></li>
			<li><a class="delete" href="../general/timed_DispatchPlanItem_deleteById.action?id={id}" title="确定删除吗？" target="ajaxTodo" rel="ids"><span>删除</span></a></li>
			<%-- <li><a class="icon" href="../general/timed_DispatchPlanItem_enterAddOrModify_item-add-edit.action?id={id}" target="navTab" rel="plan"><span>计划</span></a></li> --%>
			<li><a class="icon" href="../general/timed_DispatchPlan_showListByItemId_plan-list.action?itemId={id}" target="navTab" rel="plan"><span>编排计划</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<!-- <th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"></th> -->
					<th width="3%" align="center">序号</th>
					<th width="3%">状态</th>
					<th width="30%">事项名称</th>
					<th width="15%">事项要求</th>
					<th width="15%">完成目标</th>
					<th width="7%">年度</th>
					<th width="7%">创建人</th>
					<th width="6%">事项来源</th>									
					<th width="19%">党支部</th>									
					<th width="4%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
					<tr target="id" rel="<s:property value="id"/>">
					<%-- <td align="center"><input name="ids" value="<s:property value='id'/>" type="checkbox"></td> --%>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" <s:if test="isPlan == 0">style="color:red;" </s:if><s:elseif test="isPlan == 1">style="color:green;"</s:elseif>>
						<s:property value="isPlan == 0 ? '未排' : '已排'"/>
					</td>
					<td align="center" style="display:none;" class="dispatchId"><s:property value="id"/></td>
					<td align="center" title="<s:property value="name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
					<td align="center" title="<s:property value="demand"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="demand"/></td>
					<td align="center" title="<s:property value="target"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="target"/></td>
					<td align="center" title="<s:property value="years"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="years"/></td>
					<td align="center" title="<s:property value="creater.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="creater.name"/></td>
					<td align="center" title="<s:property value="source"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="source"/></td>
					<td align="center" title="<s:property value="team"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="team"/></td>
					<td align="center">
						<a href="../general/timed_DispatchPlanItem_enterAddOrModify_item-show.action?id=<s:property value='id'/>" width="780" height="550" target="dialog" class="details">详情</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

