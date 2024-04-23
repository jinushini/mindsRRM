<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
</script>
<%-- <div class="pageHeader">
<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						任务归属：<input type="text" name="paramMap['c.parentTaskName like']" value="<s:property value="paramMap['c.parentTaskName like']"/>" />
						相关节点：<input type="text" name="paramMap['c.parentNodeName like']" value="<s:property value="paramMap['c.parentNodeName like']"/>" />
						审批时间：
						<input readonly="readonly" size="12" type="text" name="paramMap['c.coinApproveDate ge Date']" value="<s:property value="paramMap['c.coinApproveDate ge Date']"/>" onclick="WdatePicker();"/>至
						<input readonly="readonly" size="12" type="text" name="paramMap['c.coinApproveDate le Date']" value="<s:property value="paramMap['c.coinApproveDate le Date']"/>" onclick="WdatePicker();"/>
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
</div> --%>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><div style="font-size:18px;color:red;margin-top:2px;">金币总数：<s:property value="quantitySum" /></div></li>
		</ul>
	</div>
	<div>
		<table class="list_table list" width="100%" layoutH="50" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th align="center" width="20%">金币归属</th>
					<th align="center" width="20%">相关节点</th>
					<th align="center" width="20%">所得金币</th>
					<th align="center" width="20%">审批时间</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value='id'/>">
					
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentTaskName"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentNodeName"/></td>
					<td align="center"><s:property value="quantity"/></td>
					<td align="center"><s:date name="coinApproveDate" format="yyyy-MM-dd"/></td>
				</tr>
			  </s:iterator>
			</tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>