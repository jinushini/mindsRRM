<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
	//流程图
	jn(function(){
		var state = jn("#state").val();
		if(state == 0){
			var options={};
			options.width = 800;
			options.height = 500;
			var url="../study/leaveApply!flowImage.action?deploymentId=<s:property value='userSetting.deploymentId'/>";
			$.pdialog.open(url,"new_msg", "查看流程图",options);
		}		
	}); 
	//查看流程图
	jn("#viewImgBtn").click(function(){
		var options={};
		options.width = 800;
		options.height = 500;
		var url="../study/leaveApply!flowImage.action";
		$.pdialog.open(url,"new_msg", "查看流程图",options);	
	})
//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<%-- <td>
					申请人：<input type="text" name="paramMap['user.name like']" value="<s:property value="paramMap['user.name like']"/>" />
				</td> --%>
				<td colspan="2">
					创建时间：
					<input readonly="readonly" size="12" type="text" name="paramMap['l.createDate ge Date']" value="<s:property value="paramMap['l.createDate ge Date']"/>" onclick="WdatePicker();"/>至
					<input readonly="readonly" size="12" type="text" name="paramMap['l.createDate le Date']" value="<s:property value="paramMap['l.createDate le Date']"/>" onclick="WdatePicker();"/>
				</td>
			</tr>
		</table>
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
			<li><a class="add" href="../study/leaveApply!inputAdd.action" target="navTab" rel="currentNavTab"><span>添加申请单</span></a></li>
			<li><a class="icon" href="../study/leaveApply!startProcess.action?leaveSheetId={id}" target="ajaxTodo"><span>启动流程</span></a></li>
			<li><a class="icon" id='viewImgBtn' ><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">申请人</th>
					<th>请假天数</th>
					<th>请假原因</th>
					<th>申请时间</th>
					<th>流程编号</th>
					<th>流程查看</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="user.name"/></td>
					<td align="center"><s:property value="days"/></td>
					<td align="center"><s:property value="reason"/></td>
					<td align="center"><s:date name="createDate" format="yyyy-MM-dd"/> </td>
					<td align="center"><s:property value="processInsId"/></td>
					<td align="center">
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInsId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

