<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
	jn("#viewImgBtn").click(function(){
		window.open("../fextends/flowDefined!viewImage.action?deploymentId="+jn(".selected").attr("rel"));	
	})
//-->
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					流程名称：<input type="text" name="flowDefinedName" value="<s:property value="flowDefinedName"/>" />
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
			<li><a class="add" href="../fextends/flowDeploy!inputZipDeploy.action" target="navTab" rel="currentNavTab"><span>部署新流程</span></a></li>
			<li><a class="icon" href="../fextends/flowDefined!findFlowByDeploymentKey.action?deploymentId={id}" target="navTab"><span>查看历史版本</span></a>
			<li><a class="icon" id='viewImgBtn'  rel=""><span>查看流程图</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120">
			<thead>
				<tr>
					<th width="5%" align="center">序号</th>
					<th width="">流程定义ID</th>
					<th>流程名称</th>
					<th>流程定义key</th>
					<th>最新版本</th>
					<th width="">资源名称bpmn文件</th>
					<th width="">资源名称png文件</th>
					<th width="">部署对象ID</th>
					<th width="">流程描述</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="deploymentId"/>">
					<td align="center"><s:property value="#st.index+1"/> </td>
					<td align="center"><s:property value="id"/></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="key"/></td>
					<td align="center"><s:property value="version"/></td>
					<td align="center"><s:property value="resourceName"/></td>
					<td align="center"><s:property value="diagramResourceName"/></td>
					<td align="center"><s:property value="deploymentId"/></td>
					<td align="center" >
						<s:if test="description.length>10"><s:property value="description.substring(0,10)"/>...</s:if>
						<s:else><s:property value="description"/> </s:else>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

