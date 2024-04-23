<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	
	/* jn("[type=reset]").click(function() {
		var $targetInput = jn(".searchContent").find("input");
		for (var i = 0; i < $targetInput.length; i++) {
			alert(i);
			alert($targetInput.eq(i).val());
			$targetInput.eq(i).attr(value,"");
			alert($targetInput.eq(i).val());
		}
	}); */
	jn("#edit").click(function(){
		var test = jn("input[name='ids']:checked");
		var idStr = "";
		test.each(function(){
			idStr += jn(this).val()+","; 
		});
		idStr = idStr.substring(0, idStr.length-1);
		var url = "../review/review!inputAddReviewRequest.action?idStr =" + idStr;
		//navTab.openTab("../review/review!inputAddReviewRequest.action?idStr =" + idStr);
		navTab.openTab("", url, { title:"添加复查项目", fresh:false, data:{} });

	});
	
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" name="reviewBillId" value="<s:property value="reviewBillId"/>"/>
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				型号代号：<input type="text" name="paramMap['p.modelCode like']" value="<s:property value="paramMap['p.modelCode like']"/>" />
			</li>
			<li>
				分系统：<input type="text" name="paramMap['p.modelName like']" value="<s:property value="paramMap['p.modelName like']"/>" />
			</li>
			<li>
				产品代号：<input type="text" name="paramMap['p.productCode like']" value="<s:property value="paramMap['p.productCode like']"/>" />
			</li>
			<li>
				产品名称：<input type="text" name="paramMap['p.productName like']" value="<s:property value="paramMap['p.productName like']"/>" />
			</li>
			<li>
				产品种类：<input type="text" name="paramMap['p.type like']" value="<s:property value="paramMap['p.type like']"/>" />
			</li>
			<li>
				单机主管：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<!-- <li><div class="buttonActive"><div class="buttonContent"><button type="reset">重置</button></div></div></li> -->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a id="edit" class="edit" href="javaScript:;"><span>添加复查项目</span></a></li>
		</ul>
	</div>
	<form action="##" enctype="multipart/form-data" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" >	
		<div layoutH="90">
			<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
				<thead>
					<tr>
						<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
						<th width="100">型号代号</th>
						<th width="150">分系统</th>
						<th width="150">单机代号</th>
						<th width="200">单机名称</th>
						<th width="100">产品种类</th>									
						<th width="80">单机主管</th>									
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="st">
						<tr target="id" rel="<s:property value="id"/>">
							<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
							<td align="center"><s:property value="modelCode==null?productLib.modelCode:modelCode"/></td>
					<td align="center"><s:property value="modelName"/></td>
					<td align="center"><s:property value="productCode"/></td>
					<td align="center"><s:property value="productName"/></td>
					<td align="center"><s:property value="type"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>								
						</tr>
					 </s:iterator>
				</tbody>
				</table>
			<%-- <u:juipage></u:juipage> --%>
		</div>
	</form>
</div>

