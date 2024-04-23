<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
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
						型号代号：<input type="text" name="paramMap['p.subType like']" value="<s:property value="paramMap['p.subType like']"/>" />
						产品名称：<input type="text" name="paramMap['p.name like']" value="<s:property value="paramMap['p.name like']"/>" />
						产品代号：<input type="text" name="paramMap['p.code like']" value="<s:property value="paramMap['p.code like']"/>" />
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
			<%-- <li><a href="../zhengji/zhengji!showMokuaiOrderByZhengjiOrderId.action?zhengjiOrderId={id}" class="edit" target="navTab"><span>查看对应模块</span></a></li> --%>
			<%-- <li><a title="申报元器件" href="javascript:;" class="icon declareProduct" ><span>申报元器件</span></a></li> --%>
		</ul>
	</div>
	<div>
		<table class="list_table list" width="180%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="30">整机名称</th>
					<th width="30">整机代号</th>
					<th width="30">整机设计师</th>
					<th width="30">模块名称</th>
					<th width="30">模块代号</th>
					<th width="30">模块设计师</th>
					<th width="40">定制类元器件名称</th>
					<th width="30">型号规格</th>
					<th width="30">申报等级</th>
					<th width="30">申报数量</th>
					<th width="30">生产厂家</th>
					<th width="30">物资经理</th>
					<th width="30">厂家联系人</th>
					<th width="40">浪潮申报是否完成</th>
					<th width="40">器件到货状态跟踪</th>
					<th width="20">备注</th>
					<th width="20">操作</th>
				</tr>
			</thead>
			<tbody>
			  	<tbody class="tbody">
					<s:iterator value="productOrder.childProductOrderSet" status="st">
						<s:if test="subType='元器件' && outsourcingSort='定制类' " >
							
						</s:if>
					</s:iterator>
				</tbody>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
