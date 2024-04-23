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
		var url="../manage/weeklyMeeting!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
		$.pdialog.open(url,"new_msg", "查看流程图",options);
	}		
}); 
jn("#viewImgBtn").click(function(){
	var options={};
	options.width = 800;
	options.height = 500;
	var url="../manage/weeklyMeeting!flowImage.action";
	$.pdialog.open(url,"new_msg", "查看流程图",options);	
})

jn(function () { //可实现合并单元格,上下行来比较
    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length;
    var totalRows = jn("#tbl").find("tr").length;
    for ( var i = 0; i < totalCols+1; i++) {
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
})
//-->
</script>

<div class="pageContent" >
	<div layoutH="0">
		<table class="list_table list" width="100%"style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th    colspan="2">时间</th>
					<th>会议名称</th>
					<th>主持人</th>
					<th>地点</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<%-- <td align="center"><u:index value="#st.index+1"/></td> --%>
					<td align="center" width="20%" id="date"><s:date name="beginDate" format="E"/><br/><s:date name="beginDate" format="MM-dd"/> </td>
					<td align="center" width="80%"><s:date name="beginDate" format="HH:mm"/>-<s:date name="endDate" format="HH:mm"/> </td>
					<td align="center" title=<s:property value="subject"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="subject"/></td>
					<td align="center" title=<s:property value="host.name"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="host.name"/></td>
					
					<td align="center" title=<s:property value="address"/><s:property value="meetingRoom.position"/>-<s:property value="meetingRoom.meetingName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="address"/><s:property value="meetingRoom.position"/>-<s:property value="meetingRoom.meetingName"/></td>
					<td align="center">
						<a href="../manage/weeklyMeeting!showMeeting.action?meetingId=<s:property value="id"/>" target="dialog" width='600' height='500' class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

