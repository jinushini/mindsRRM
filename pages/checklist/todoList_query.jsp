<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
<!--
	
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	
//-->
</script>
<div class="pageHeader">
	<div class="searchBar">
	</div>
</div>
<div class="pageContent" id="lookup">
	<div layoutH="65">
		<table class="list_table list" width="100%" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="35">状态</th>
					<th width="280">待办事项描述</th>
					<th width="130">完成形式</th>
					<th width="100">要求完成时间</th>
					<th width="120">责任人</th>
					<th width="200">待办事项落实情况</th>
					<th width="200">完成情况</th>
					<th width="80">检查人</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="dispatchList" status="st" >
					<tr>
						<td align="center" style="font-size:30px; color:<s:if test='status == 3'>green</s:if><s:elseif test='status == 0'>gray</s:elseif><s:elseif test='status == 5'>red</s:elseif><s:else>orange</s:else>;">
							<s:property value="status == 0 ? '●' : '●'"/>
							<input type="hidden" value="<s:property value='status'/>" class="status"/>
						</td>
						<td align="center" title="<s:property value='taskDefinitionStr'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='taskDefinitionStr'/></td>
						<td align="center" title="<s:property value='completeForm'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='completeForm'/></td>
						<td align="center" title="<s:date name='scheduleDate.planEndDate' format='yyyy-MM-dd'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
						<td align="center" title="<s:property value='receiveUserName'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='receiveUserName'/></td>
						<td align="center" title="<s:property value='feedbackInfoStr'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='feedbackInfoStr' escape="false"/></td>
						<td align="center" title="<s:property value='finishStatus'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value='finishStatus'/></td>
						<td align="center" title="<s:property value='dispatchManager.name'/>" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" class="dispatchManager"><s:property value='dispatchManager.name'/></td>
					</tr>
				</s:iterator>
			</tbody>
			
		</table>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li><a class="button" id="fullScrBtn" ><span>全屏查看</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
</div>