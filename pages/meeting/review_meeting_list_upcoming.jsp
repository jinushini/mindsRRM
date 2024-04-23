<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript"> 
jn(function () { //可实现合并单元格,上下行来比较
    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length;
    var totalRows = jn("#tbl").find("tr").length;
    for ( var i = 2; i < totalCols+2; i++) {
        for ( var j = totalRows-1; j >= 1; j--) {
            startCell = jn("#tbl").find("tr").eq(j).find("td").eq(i);
            targetCell = jn("#tbl").find("tr").eq(j - 1).find("td").eq(i);
            if (startCell.text() == targetCell.text() && targetCell.text() != "") {
                targetCell.attr("rowSpan", (startCell.attr("rowSpan")==undefined)?2:(eval(startCell.attr("rowSpan"))+1));
                startCell.remove();
            }
        }
    }
});

//双击事件
jn("tbody tr").dblclick(function(){
	$(this).find(".details").click();
});

//打印  
  jn("#excel").click(function(){
	  var url = "../meeting/reviewMeeting!printDispatchs.action";
	  jn("#searchForm").attr("onsubmit", "return navTabSearch();");
	  jn("#searchForm").attr("action", url);
	  jn("#searchForm").submit();
  });
  
//查询 
  jn("#search").click(function(){
	  var url = "<s:property value='page.url'/>";
	  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
	  jn("#searchForm").attr("action", url);
	  jn("#searchForm").submit();
  }); 

//-->
</script>

<div class="pageHeader">
	<form id="searchForm" onsubmit="return navTabSearch();" action="" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					责任人：<input type="text" id="receiveUser" name="paramMap['d.receiveUser.name like']" value='<s:property value="paramMap['d.receiveUser.name like']"/>' />
				</td>
				<td>
					派工人：<input type="text" id="dispatchManager" name="paramMap['d.dispatchManager.name like']" value="<s:property value="paramMap['d.dispatchManager.name like']"/>" />
				</td>
				<td colspan="2">
					创建时间：
					<input readonly="readonly" id="createDateMin" size="12" type="text" name="paramMap['d.createDate ge Date']" value="<s:property value="paramMap['d.createDate ge Date']"/>" onclick="WdatePicker();"/>至
					<input readonly="readonly" id="createDateMax" size="12" type="text" name="paramMap['d.createDate le Date']" value="<s:property value="paramMap['d.createDate le Date']"/>" onclick="WdatePicker();"/>
				</td>		
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="search">查询</button></div></div></li>
			</ul>
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="excel">导出Excel</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div layoutH="60">
		<table class="list_table list" width="100%" layoutH="90" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="3%">序号</th>
					<th width="7%">创建时间</th>
					<th width="15%">待办名称</th>
					<th width="25%">待办描述</th>
					<th width="7%">派工人</th>
					<th width="7%">责任人</th>
					<th width="7%">截止日期</th>
					<th width="5%">状态</th>
					<th width="7%">操作</th>
					
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" width="20%" id="date"><s:date name="createDate" format="yyyy-MM-dd"/> </td>
					<td align="center" title=<s:property value="taskName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="taskName"/></td>
					<td align="center" title=<s:property value="taskDefinitionStr"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="taskDefinitionStr"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="dispatchManager.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="receiveUser.name"/></td>
					<td align="center" width="20%" id="date"><s:date name="limdat" format="yyyy-MM-dd"/> </td>
					<td align="center" id="taskState" <s:if test="status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="status == 3 ? '●' : '●'"/>
					</td>
					<td align="center">
						<a href="../meeting/reviewMeeting!showMeeting.action?meetingId=<s:property value="parentClassId"/>" target="dialog" width='600' height='500' class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

