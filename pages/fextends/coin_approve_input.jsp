<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
	jn("a").click(function(){
		var $thisTr = jn(this).parent().parent();
		var processInstId = $thisTr.find(".processInstId").val();
		var quantity = $thisTr.find(".quantity").val();
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../fextends/coin!coinApprove.action",
			data:{
				"processInstId":processInstId,
				"quantity":quantity
			},
			success : function(data, statusText) {
				alertMsg.correct("Success");
				$thisTr.remove();
			}
		});
	})
	
</script>
<div class="pageHeader">
<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						任务名称：<input type="text" name="paramMap['c.parentTaskName like']" value="<s:property value="paramMap['c.parentTaskName like']"/>" />
						节点名称：<input type="text" name="paramMap['c.parentNodeName like']" value="<s:property value="paramMap['c.parentNodeName like']"/>" />
						金币得主姓名：<input type="text" name="paramMap['c.coinOwnerName like']" value="<s:property value="paramMap['c.coinOwnerName like']"/>" />
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
	<form action="../ssaps/ssapsConfig!modifySuperFlowNodeConfig.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="45">
			<table class="list_table list" width="100%" style="table-layout:fixed;" >
				<thead>
					<tr align="center">
						<th width="30%">任务归属</th>
						<th width="20%">金币节点</th>
						<th width="20%">金币得主</th>
						<th width="20%">金币数量</th>
						<th width="5%">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st">
						<tr align="center">
							<td><s:property value="parentTaskName"/></td>
							<td><s:property value="parentNodeName"/></td>
							<td><s:property value="coinOwnerName"/></td>
							<td>
								<input type="hidden" class="processInstId" value="<s:property value='processInstId'/>">
								<input class="quantity" style="width:50px;text-align:center;" value="<s:property value='quantity'/>">
							</td>
							<td><a href="##"><span>确认</span></a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<u:juipage></u:juipage>
	</form>
	
</div>

