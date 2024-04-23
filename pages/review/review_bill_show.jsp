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
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" name="reviewBillId" value="<s:property value="reviewBillId"/>"/>
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				型号代号：<input type="text" name="paramMap['r.modelCode like']" value="<s:property value="paramMap['r.modelCode like']"/>" />
			</li>
			<li>
				分系统：<input type="text" name="paramMap['r.modelName like']" value="<s:property value="paramMap['r.modelName like']"/>" />
			</li>
			<li>
				产品代号：<input type="text" name="paramMap['r.productCode like']" value="<s:property value="paramMap['r.productCode like']"/>" />
			</li>
			<li>
				产品名称：<input type="text" name="paramMap['r.productName like']" value="<s:property value="paramMap['r.productName like']"/>" />
			</li>
			<li>
				产品种类：<input type="text" name="paramMap['r.type like']" value="<s:property value="paramMap['r.type like']"/>" />
			</li>
			<li>
				单机主管：<input type="text" name="paramMap['r.singleHead.name like']" value="<s:property value="paramMap['r.singleHead.name like']"/>" />
			</li>
		</ul>
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
			<li><a class="edit" href="../review/review!inputReviewRequestModify.action?processInstId={id}" target="navTab" rel=""><span>编辑</span></a></li>
			<li><a class="edit" href="../fextends/taskQuery!approveList.action?processInstId={id}" height="410" width="700" target="dialog"><span>查看进度</span></a></li>
			
		</ul>
	</div>
	<div layoutH="90">
		<table border="0" class="list_table list" width="100%" layoutH="135" style="table-layout:fixed;">
			<tbody>
				<s:iterator value="list" status="st" var="a">
					<tr <s:if test="#st.index!=0">style="display:none;"</s:if>>					
						<th width="40">状态</th>
						<th width="40" align="center">序号</th>
						<th width="100">型号代号</th>					
						<th width="150">分系统</th>
						<th width="150">产品代号</th>
						<th width="200">产品名称</th>
						<th width="100">产品种类</th>					
						<th width="80">单机主管</th>	
						<s:iterator value="#attr.a.reviewRequests" status="st" var="b">
							<th width="300"><s:property value="#attr.b.item"/></th>	
						</s:iterator>	
						<th width="300">相关文件</th>	
					</tr>
				
					<tr target="id" rel="<s:property value="processInstId"/>">
						<td align="center" <s:if test="status==3">style="color:green;font-size:30px"</s:if><s:elseif test="status==2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>●</td>
						<td align="center"><u:index value="#st.index+1"/></td>
						<td align="center"><s:property value="modelCode"/></td>
						<td align="center"><s:property value="modelName"/></td>
						<td align="center"><s:property value="productCode"/></td>
						<td align="center"><s:property value="productName"/></td>
						<td align="center"><s:property value="type"/></td>
						<td align="center"><s:property value="singleHead.name"/></td>	
						<s:iterator value="#attr.a.reviewRequests" var="b">
							<td align="center"><s:property value="resultStr" escape="false"/></td>	
						</s:iterator>						
						<td align="center">
							<s:iterator value="#attr.a.reviewFiles" var="c">
								<a href="<s:property value='filePath'/>" download="<s:property value='reviewFileName' />"><s:property value="reviewFileName"/></a><br/>								
							</s:iterator>
						</td>	
					</tr>
				</s:iterator>	
			</tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

