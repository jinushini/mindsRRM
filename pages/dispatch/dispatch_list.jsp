<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	jn(function(){
		var state = jn("#state").val();
		if(state == 0){
			var options={};
			options.width = 800;
			options.height = 500;
			var url="../dispatch/dispatch!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
			$.pdialog.open(url,"new_msg", "查看流程图",options);
		}		
	}); 
	jn("#viewImgBtn").click(function(){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../dispatch/dispatch!flowImage.action";
		$.pdialog.open(url,"new_msg", "查看流程图",options);	
	})
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	//打印  
	jn("#excel").click(function(){
	 var url = "../dispatch/dispatch!printDispatchs.action";
	 jn("#searchForm").attr("onsubmit", "return navTabSearch();");
	 jn("#searchForm").attr("action", url);
	 jn("#searchForm").submit();
	});
	
	//查询 
	 jn("#search").click(function(){
		  //var url = "<s:property value='page.url'/>";
		  var url = "../dispatch/dispatch!showListForOB.action";
		  jn("#searchForm").attr("onsubmit", "return navTabSearch(this);");
		  jn("#searchForm").attr("action", url);
		  jn("#searchForm").submit();
	  });
	
	//终止流程
	jn("#stop").click(function(){
		var dispatchId = jn(".list_table").find(".selected").find(".dispatchId").text();
		var processInstId = jn(".list_table").find(".selected").find(".processInstId").text();
		var status = jn(".list_table").find(".selected").find(".status").text();
		var dispatchManagerId = jn(".list_table").find(".selected").find(".dispatchManagerId").text();
		var currentUserId = jn("#currentUserId").val();
		if(jn("table .selected").length == 0){
			alertMsg.error("请选择信息！");
			return;
		}
		if(dispatchManagerId != currentUserId){
			alertMsg.error("非法操作！");
			return;
		}
		if(status == 3){
			alertMsg.error("该流程已闭环！");
			return;
		}
		alertMsg.confirm("确认废弃该事项？废弃后，该事项所有待办人均无需处理该事项", {
			 okCall: function(){
				$.post("../dispatch/dispatch!wasteProcess.action", {dispatchId:dispatchId,processInstId:processInstId}, navTabAjaxDone, "json");
			 },
			 cancelCall : function() {}
			});
	});
</script>

<div class="pageHeader">
	<form id="searchForm" onsubmit="" action="" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<input type="hidden" id="currentUserId" value="<s:property value="currentUser.id"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					任务名称：<input type="text" name="paramMap['d.taskName like']" value="<s:property value="paramMap['d.taskName like']"/>" />
				</td>
				<%-- <td>
					任务名称：<input type="text" name="paramMap['d.taskType like']" value="<s:property value="paramMap['d.taskType like']"/>" />
				</td> --%>
				<td>
					派工人：<input type="text" name="paramMap['d.dispatchManager.name like']" value="<s:property value="paramMap['d.dispatchManager.name like']"/>" />
				</td> 
				<td>
					责任人：<input type="text" name="paramMap['d.receiveUser.name like']" value="<s:property value="paramMap['d.receiveUser.name like']"/>" />
				</td> 
				<%-- <td>
					状态：<input type="text" name="paramMap['d.taskState like']" value="<s:property value="paramMap['d.taskState like']"/>" />
				</td>  --%>
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
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../dispatch/dispatch!inputAdd.action" target="navTab" rel="currentNavTab"><span>布置任务</span></a></li>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
			<li><div class="buttonActive"><div class="buttonContent"><button id="stop">删除并终止</button></div></div></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="3%">状态</th>
					<th width="3%" align="center">序号</th>
					<th width="35%">任务名称</th>
					<th width="25%">任务描述</th>
					<th width="10%">派工人</th>
					<th width="7%">责任人</th>
					<th width="8%">截止日期</th>									
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" <s:if test="status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="status == 0 ? '●' : '●'"/>
					</td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" style="display:none;" class="dispatchManagerId"><s:property value="dispatchManager.id"/></td>
					<td align="center" style="display:none;" class="status"><s:property value="status"/></td>
					<td align="center" style="display:none;" class="dispatchId"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="processInstId"/></td>
					<td align="center" title="<s:property value="taskName"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="taskName"/></td>
					<td align="center" title="<s:property value="taskDefinitionStr"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="taskDefinitionStr"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="dispatchManager.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="receiveUser.name"/></td>
					<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
					<td align="center">
						<a href="../dispatch/dispatch!showDispatch.action?dispatchId=<s:property value="id"/>" height="450" width="850" target="dialog" class="details">详情</a>&nbsp;|&nbsp;
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

