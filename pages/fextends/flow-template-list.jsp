<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">		
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					流程模板名称：<input type="text" name="paramMap['f.flowTemplateName like']" value="<s:property value="paramMap['f.flowTemplateName like']"/>" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li> -->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../fextends/FlowTemplate_inputFlowTemplateNew_flow-template-create.action" target="dialog" rel="" width='700'><span>新增</span></a></li>
			<li><a class="edit" href="../fextends/FlowTemplate_inputFlowTemplateModify_flow-template-modify.action?flowTemplateId={id}" target="dialog" title="修改模板"><span>修改</span></a></li>	
			<li><a class="delete" href="../fextends/FlowTemplate_deleteFlowTemplate.action?flowTemplateId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>	
			<li><a class="icon" href="../fextends/FlowTemplate_showFlowTemplateDetails_flow-template-details1.action?flowTemplateId={id}" target="navTab" title="添加子模板" rel="flowTemplateconfig"><span>添加子模板</span></a></li>	
			<li><a class="icon" href="../fextends/FlowTemplate_showFlowTemplateDetails_flow-template-details2.action?flowTemplateId={id}" target="navTab" title="添加子流程" rel="flowTemplateconfig"><span>添加子流程</span></a></li>	
		</ul>
	</div>
	<div layoutH="10">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="3%" align="center">序号</th>
					<th width="25%">自定义模板名称</th>
					<th width="20%">模板名称</th>
					<th width="25%">模板描述</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st" var="a">	
			  			  	
				<tr target="id" rel="<s:property value="id"/>" class="tr">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" title="<s:property value="#attr.a.flowTemplateName"/>"><s:property value="flowTemplateName"/></td>
					<td align="center"><s:property value="flowDefName"/></td>
					<td align="center"><s:property value="description"/></td>
					<td align="center">
						<a href="../fextends/FlowTemplate_showFlowTemplate_flow-template-details.action?flowTemplateId=<s:property value='id'/>" target="navTab" rel="flowTemplateconfig" title="模板详情" class="details">详情</a>													
					</td>
				</tr>
					
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

