<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
$(function(){
	
	jn("#print").click(function(){			
		var url = "../readzkword/readzkword!manydataexcel.action";
		
		jn("#print").attr("href", url);
	    
	});
})
</script>

<div class="pageContent">
	
	<%-- <table class="table" width="100%" layoutH="138">
		<thead>		 
			<tr>
			<s:iterator id="data1" value="#request.stagedata.datahead" status="d1">
				
				<th width="120">${data1}</th>
				
			</s:iterator>
			</tr>			
		</thead>
		<tbody>
		      <s:iterator id="data1" value="#request.stagedata.data" status="d1">
		      
				
			<tr target="sid_user" rel="1">
			<s:iterator id="data2" value="#request.data1" status="d2">
				<td><s:property value="#data2"/></td>
				</s:iterator>
			</tr>
			
			</s:iterator>
		</tbody>
	</table> --%>
	<%-- <div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>

		<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="0" currentPage="1"></div>

	</div> --%>
	<br/>
	    <ul>
			<%-- <li ><a id="exceloutput" style="margin-left:10px;" class="button" target="ajax" rel="jbsxBox"><span>打印excel</span></a></li> --%>
			<li><div class="button"><div class="buttonContent"><a type="button" class="" id="print">打印同类产品对比数据</a></div></div></li>			
	    </ul>
</div>
