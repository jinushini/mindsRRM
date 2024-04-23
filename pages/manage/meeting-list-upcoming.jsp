<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript"> 
jn(function() { //可实现合并单元格,上下行来比较
    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length;
    var totalRows = jn("#tbl").find("tr").length;
    for ( var i = 2; i < totalCols+3; i++) {
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

//导出Excel  
  jn("#excel").click(function(){
	  var url = "../manage/weeklyMeeting!printDispatchs.action";
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

//下拉选项操作
jn(".options").change(function(){
	var op = jn(this).find("option:selected").attr("name");
	var taskId = jn(this).parent().find(".taskId").eq(0).val();
	var processInstId = jn(this).parent().find(".processInstId").eq(0).val();
	var id = jn(this).parent().find(".id").eq(0).val();
	var options = {};
	options.width=850;
	options.height=410;
	var dname = "";
	if(op == "appr"){
		dname="待办事项审核";
		var url = "../dispatch/DispatchItem_inputApprInDialog_dispatch-item-appr.action?taskId="+taskId;
		$.pdialog.open(url, "", dname, options);
	}else if(op == "transfer"){
		dname="待办事项移交";
		var url = "../dispatch/DispatchItem_enterTransferPage_dispatch-item-transfer.action?id="+id;
		$.pdialog.open(url, "", dname, options);
	}else if(op == "pro"){
		dname="待办事项进度";
		var url = "../fextends/taskQuery!approveList.action?processInstId="+processInstId;
		$.pdialog.open(url, "", dname, options);
	}else if(op == "stop"){
		stopProcess(this,id);
	}else if(op == "del"){
		delData(this,id);
	}else if(op == "start"){
		startProcess(this,id);
	}else if(op == "op"){
		dname = "请赐予我天赋！";
		alertMsg.error(dname);
	}
});

//删除操作
function delData(obj, id){
	alertMsg.confirm("确定要彻底该待办事项吗？", {
		okCall:function(){
			$.ajax({
				global:false,
				async : false,
				type:'POST',
				dataType:'json',
				url:'../dispatch/DispatchItem_deleteDispatch.action',
				data:{
					id:id
				},
				success:function(data,statusText){
					if(data.message == "success"){
						jn("#"+id).remove();
						alertMsg.correct(data.message);	
					}
				}
			})
		},
		cancelCall:function(){
		}
	})
}

//终止操作
function stopProcess(obj, id){
	alertMsg.confirm("确定要终止该待办事项吗？", {
		okCall:function(){
			$.ajax({
				global:false,
				async : false,
				type:'POST',
				dataType:'json',
				url:'../dispatch/DispatchItem_wasteProcess.action',
				data:{
					id:id
				},
				success:function(data,statusText){
					if(data.message == "success"){
						jn(obj).parent().parent().find(".status").attr("style","color:gray;font-size:30px");
						alertMsg.correct(data.message);	
					}
				}
			})
		},
		cancelCall:function(){
		}
	})
}

//启动操作
function startProcess(obj, id){
	alertMsg.confirm("确定要直接启动该待办事项吗？", {
		okCall:function(){
			$.ajax({
				global:false,
				async : false,
				type:'POST',
				dataType:'json',
				url:'../dispatch/DispatchItem_startDispatch.action',
				data:{
					id:id
				},
				success:function(data,statusText){
					if(data.message == "success"){
						jn(obj).parent().parent().find(".status").attr("style","color:orange;font-size:30px");
						alertMsg.correct(data.message);	
					}else if(data.message == "error"){
						alertMsg.error(data.message);
					}
				}
			})
		},
		cancelCall:function(){
		}
	})
}

//-->
</script>

<div class="pageHeader">
	<form id="searchForm" onsubmit="" action="" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					会议名称：<input type="text" id="receiveUser" name="paramMap['d.taskName like']" value='<s:property value="paramMap['d.taskName like']"/>' />
				</td>
				<td>
					责任人：<input type="text" id="receiveUser" name="paramMap['d.receiveUser.name like']" value='<s:property value="paramMap['d.receiveUser.name like']"/>' />
				</td>
				<td>
					派工人：<input type="text" id="dispatchManager" name="paramMap['d.dispatchManager.name like']" value="<s:property value="paramMap['d.dispatchManager.name like']"/>" />
				</td>
				<td>
					只看：
					<select name="paramMap['d.status like']">
						<option value="">---状态---</option>
						<option value="3">已完成</option>
						<option value="2">未完成</option>
						<option value="5">未启动</option>
					</select>
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
					<th width="2%">序号</th>
					<th width="4%">创建日期</th>
					<th width="15%">会议名称</th>
					<th width="25%">待办事项描述</th>
					<th width="28%">待办事项落实情况</th>
					<th width="4%">派工人</th>
					<th width="4%">责任人</th>
					<th width="4%">截止日期</th>
					<th width="4%">完成日期</th>
					<th width="4%">超期</th>
					<th width="2%">状态</th>
					<th width="4%">操作</th>
					
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" id="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" width="20%" id="date"><s:date name="createDate" format="MM-dd"/> </td>
					<td title="<s:property value='taskName'/>"><s:property value="taskName"/></td>
					<td title="<s:property value='taskDefinitionStr' escape='false'/>"><s:property value="taskDefinitionStr"/><s:if test="initialDispatch != null"><a href="../dispatch/DispatchItem_findHistory_dispatch-item-history.action?id=<s:property value='id'/>" target="dialog" height="410" width="700" title="历史回溯"><img src="../../img/history.png" width="18" hight="18"></a></s:if></td>
					<td><s:property value="feedbackInfoStr" escape="false"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="dispatchManager.name"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="receiveUser.name"/></td>
					<td align="center" width="20%" class="planEndDate"><s:date name="scheduleDate.planEndDate" format="MM-dd"/> </td>
					<td align="center" width="20%" id="date"><s:date name="scheduleDate.actualEndDate" format="MM-dd"/> </td>
					<td align="center" width="20%" 
						<s:if test="status !=3 && scheduleDate.actualEndDate == null">
							<s:if test="(new java.util.Date().getTime()-scheduleDate.planEndDate.getTime())/1000/60/60/24>0">
								style="color:red"
							</s:if>
						</s:if>
					>
						<s:if test="status !=3 && scheduleDate.actualEndDate == null">
							<s:property value="(new java.util.Date().getTime()-scheduleDate.planEndDate.getTime())/1000/60/60/24>0?(new java.util.Date().getTime()-scheduleDate.planEndDate.getTime())/1000/60/60/24+'天':''"/>
						</s:if>
						<s:else>
							<s:property value="(scheduleDate.actualEndDate.getTime()-scheduleDate.planEndDate.getTime())/1000/60/60/24>0?(scheduleDate.actualEndDate.getTime()-scheduleDate.planEndDate.getTime())/1000/60/60/24+'天':''"/>
						</s:else>
					</td>
					<td align="center" class="status" 
						<s:if test="status == 3">style="color:green;font-size:30px" </s:if>
						<s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif>
						<s:elseif test="status == 0"> style="color:gray;font-size:30px" </s:elseif>
						<s:elseif test="status == 5" > style="color:red;font-size:30px" </s:elseif>
					>
						<s:property value="status == 3 ? '●' : '●'"/>
					</td>
					<%-- <td align="center">
						<s:if test="currentUser.id == dispatchManager.id && (needSign != 1 || isSign ==1)">
							<a href="../manage/weeklyMeeting!showDispatchTrack.action?meetingId=<s:property value="parentClassId"/>" target="navTab" rel="meetingTrack">操作</a>&nbsp;|
						</s:if>
						<s:else>
							<a href="../manage/weeklyMeeting!showMeeting.action?meetingId=<s:property value="parentClassId"/>" target="dialog" width='900' height='800' class="details">详情</a>&nbsp;|
						</s:else>
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">进度</a>
					</td> --%>
					<td align="center" class="ops">
						<input type="hidden" class="taskId" value="<s:property value='taskId'/>">
						<input type="hidden" class="id" value="<s:property value='id'/>">
						<input type="hidden" class="processInstId" value="<s:property value='processInstId'/>">
							<select class="options">
								<option name="op">操作</option>
								<s:if test="currentUser.id == dispatchManager.id && (needSign != 1 || isSign ==1)">
									<s:if test="businessStatus == 2 && taskId != null">
										<option name="appr">审核</option>
									</s:if>
									<s:if test="status == 5 && processInstId == null">
										<option name="start">启动</option>
										<option name="del">删除</option>
									</s:if>
									<option name="transfer">移交</option>
									<s:if test="status == 1 || status == 2">
										<option name="stop">终止</option>
									</s:if>
									
								</s:if>
								<option name="pro">进度</option>
							</select>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

