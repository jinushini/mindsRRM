<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">		 
	 jn(function () { 
		//合并单元格
		 mergeCell();		 	
	});
	
	//合并单元格
	function mergeCell(){//可实现合并单元格,上下行来比较
	    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length; 		
	    var totalRows = jn("#tbl").find(".tr").length;
	    for ( var i = 0; i < totalCols; i++) {
	        for ( var j = totalRows-1; j >= 1; j--) {
	            startCell = jn("#tbl").find(".tr").eq(j).find("td").eq(i);
	            targetCell = jn("#tbl").find(".tr").eq(j - 1).find("td").eq(i);
	            if (startCell.text() == targetCell.text() && targetCell.text() != "") {
	                targetCell.attr("rowSpan", (startCell.attr("rowSpan")==undefined)?2:(eval(startCell.attr("rowSpan"))+1));
	                startCell.remove();
	            }
	        }
	    }
	}
	jn("#submitBtn").click(function(){
		var processInstId = jn("input[name=processInstId]").val();
		if(processInstId != ""){
			alertMsg.error("该项目已启动！");
		}
	});
</script>

<div class="pageContent">
	<form action="../ssaps/ssaps!startSSAPSProcess.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
  			<input type="hidden" name="processInstId" value="<s:property value="ssaps.processInstId"/>">
  		
		<br/>
		<table class="list_table list" width="100%" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<th width="25%">流程名称</th>
					<th width="20%">流程节点</th>
					<th width="8%">操作</th>
					<th width="40%">子流程</th>
				</tr>
			</thead>
			<tbody>
			  	<s:iterator value="ssaps.nodes" var="a">		  				  			  	
					<tr target="id" rel="<s:property value="id"/>" class="tr">
						<td align="center" title="<s:property value="ssaps.projectName"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="ssaps.productDetail.name"/>（<s:property value="ssaps.productDetail.code"/>）</td>
						<td align="center"><s:property value="#attr.a.nodesName"/><br/>（<s:date format="yyyy-MM-dd" name="#attr.a.scheduleDate.planBeginDate"/>至<s:date format="yyyy-MM-dd" name="#attr.a.scheduleDate.planEndDate"/>）</td>	
						<td align="center">
							<a href="../ssaps/ssapsConfig!inputSuperFlowNodeConfig.action?parentNodeId=<s:property value="#attr.a.id"/>" target="dialog" width="1050" height="480">编辑</a>
							<s:if test="#attr.a.ssapsNodeDatas.size() != 0">
									&nbsp;&nbsp;|&nbsp;&nbsp;<a href="../ssaps/ssapsConfig!inputSuperFlowNodeRelation.action?parentNodeId=<s:property value="#attr.a.id"/>" target="dialog" width="1050" height="480" mask="true">关联</a>
							</s:if>
						</td>
						<td align="center">
							<table style="width: 100%;height: 100%;">
							<s:iterator value="#attr.a.ssapsNodeDatas" var="b">
								<tr>										
									<td align="center" style="border-bottom-style: 0.1px"><s:property value="#attr.b.flowName" /></td>										
								</tr>
								</s:iterator>
							</table>
						</td>
					</tr>					
				</s:iterator>
			 </tbody>
		</table>
	</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">启动</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
		<u:juipage></u:juipage>
   </form>
</div>

