<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<%-- <table class="searchContent">
			<tr>
				<td>
					子任务：<input type="text" name="paramMap['d.taskName like']" value="<s:property value="paramMap['d.taskName like']"/>" />
				</td>
				<td>
					任务名称：<input type="text" name="paramMap['d.taskType like']" value="<s:property value="paramMap['d.taskType like']"/>" />
				</td>
				<td>
					派工人：<input type="text" name="paramMap['d.dispatchManager.name like']" value="<s:property value="paramMap['d.dispatchManager.name like']"/>" />
				</td> 
				<td>
					状态：<input type="text" name="paramMap['d.taskState like']" value="<s:property value="paramMap['d.taskState like']"/>" />
				</td> 
			</tr>
		</table> --%>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../ssaps/ssaps!difineFlow.action" target="navTab" rel="currentNavTab"><span>流程配置</span></a></li>
			<li><a class="add" href="../ssaps/ssaps!inputReview.action" target="navTab" rel="currentNavTab"><span>启动固放流程</span></a></li>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="3%">状态</th>
					<th width="3%" align="center">序号</th>
					<th width="25%">流程定义名称</th>
					<th width="35%">流程定义Key</th>
					<th width="7%">流程部署ID</th>
					<th width="7%">通用数据</th>
					<th width="7%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center" id="taskState" <s:if test="status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="status == 0 ? '●' : '●'"/>
					</td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" title="<s:property value="flowDefName"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="flowDefName"/></td>
					<td align="center" title="<s:property value="flowDefKey"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="flowDefKey"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="deploymentId"/></td>
					<td></td>
					<td align="center">
						<a href="../ssaps/ssaps!showSSAPS.action" height="450" width="850" target="dialog">详情</a>&nbsp| 
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

