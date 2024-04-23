<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
jn(function() { //可实现合并单元格,上下行来比较
    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length;
    var totalRows = jn("#tbl").find("tr").length;
    for ( var i = 2; i < totalCols+4; i++) {
        for ( var j = totalRows-1; j >= 1; j--) {
            startCell = jn("#tbl").find("tr").eq(j).find("td").eq(i);
            targetCell = jn("#tbl").find("tr").eq(j - 1).find("td").eq(i);
            if (startCell.text() == targetCell.text() && targetCell.text() != "") {
                targetCell.attr("rowSpan", (startCell.attr("rowSpan")==undefined)?2:(eval(startCell.attr("rowSpan"))+1));
                startCell.hide();
            }
        }
    }
});
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	});
	
</script>

<div class="pageHeader">
	<%-- <form id="searchForm" onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
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
			</tr>
		</table>
		<div class="subBar" style="display: none;">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="search">查询</button></div></div></li>
			</ul>
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="excel">导出Excel</button></div></div></li>
			</ul>
		</div>
	</div>
	</form> --%>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../general/timed_DispatchPlan_enterAddOrModify_plan-add-edit.action?op=0&num=0&itemId=<s:property value='itemId'/>" target="dialog" rel="plan-add-modify" width="780" height="550"><span>新增</span></a></li>
			<li><a class="add" href="../general/timed_DispatchPlan_enterAddOrModify_plan-add-edit.action?op=1&num=0&id={id}&itemId=<s:property value='itemId'/>" target="dialog" rel="plan-add-modify" width="780" height="550"><span>编辑</span></a></li>
			<li><a class="delete" href="../general/timed_DispatchPlan_delete.action" title="确定删除吗？" target="selectedTodo" rel="ids"><span>批量删除</span></a></li>
			<%-- <li><a class="config" href="../general/timed_DispatchPlanItem_enterAddOrModify_item-add-edit.action?id={id}" target="navTab" rel="plan"><span>计划</span></a></li> --%>
		</ul>
	</div>
	<div layoutH="40">
		<table class="list_table list" width="100%" layoutH="68" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="2%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="3%" align="center">序号</th>
					<th width="8%">事项名称</th>
					<th width="30%">事项描述</th>
					<th width="30%">计划完成情况</th>
					<th width="8%">提醒日期</th>
					<th width="8%">截止日期</th>
					<th width="5%">状态</th>
					<th width="5%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
					<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><input name="ids" <s:if test="businessStatus == 1">type="checkbox"</s:if><s:else>style="display:none;" type=""</s:else> value="<s:property value='id'/>" ></td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="dispatchId"><s:property value="id"/></td>
					<td align="center" ><s:property value="item.name"/></td>
					<td align="center">
						<s:property value="item.contentStr" escape="false"/>
					</td>
					<td>
						<s:property value="planContentStr" escape="false"/>
					</td>
					<td align="center" ><s:date name="remindTime" format="yyyy-MM-dd"/></td>
					<td align="center" ><s:date name="deadline" format="yyyy-MM-dd"/></td>
					<td align="center" <s:if test="businessStatus == 1">style="color:red;"</s:if><s:elseif test="businessStatus == 3">style="color:green;"</s:elseif><s:elseif test="businessStatus == 2">style="color:orange;"</s:elseif><s:else>style="color:red;"</s:else>>
						<s:property value="businessStatus == 1 ? '未提醒' : businessStatus == 2 ? '已提醒' : businessStatus == 3 ? '已完成' : 'bug'"/>
						</td>
					<td align="center"><a href="../general/timed_DispatchPlan_show_plan-show.action?id=<s:property value="id"/>" width="780" height="550" target="dialog" class="details">详情</a>&nbsp;|&nbsp;
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

