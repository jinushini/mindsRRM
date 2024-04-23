<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">	

	 /* jn(function() {
		//合并单元格
		var j = 0;
		for (var i = 1; i < jn("#tbl tr").length + 1; i++) {
			var $referCol = jn("#tbl tr").eq(i - j).find("td:eq(0)");
			var $itemCol = jn("#tbl tr").eq(i + 1).find("td:eq(0)");
			alert($itemCol.text());
			alert($referCol.text());
			if ($itemCol.text() == $referCol.text()) {
				$itemCol.hide();
				j = j + 1;
			} else {
				$referCol.attr("rowspan", j + 1);
				j = 0;
			}
		}

	});  */
	 
	 jn(function () { 
		//合并单元格
		 mergeCell();
		//下拉选项
		jn("#combox").change(function() {
			var deploymentId =  jn("#combox").val();
				var url = "../fextends/flowTemplate!showFlowTemplate.action?deploymentId="+deploymentId;
				navTab.loadUrl(url);					
		});
		 	
	});
	
	//合并单元格
	function mergeCell(){//可实现合并单元格,上下行来比较
	    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length; 		
	    var totalRows = jn("#tbl").find(".tr").length;
	    for ( var i = 0; i < totalCols + 1; i++) {
	        for ( var j = totalRows-1; j >= 1; j--) {
	            startCell = jn("#tbl").find(".tr").eq(j).find("td").eq(i);
	            targetCell = jn("#tbl").find(".tr").eq(j - 1).find("td").eq(i);
	            if (startCell.text() == targetCell.text() && targetCell.text() != "") {
	                targetCell.attr("rowSpan", (startCell.attr("rowSpan")==undefined)?2:(eval(startCell.attr("rowSpan"))+1));
	                startCell.hide();
	            }
	        }
	    }
	}
</script>
<div class="pageContent">
	<div layoutH="30">
		<table class="list_table list" width="100%" layoutH="30" style="table-layout:fixed;" id="tbl">
			<thead>
				<tr>
					<!-- <th width="3%" align="center">序号</th> -->
					<th width="25%">模板名称</th>
					<th width="20%">环节名称</th>
					<th width="8%">操作</th>
					<th width="40%">子流程</th>
				</tr>
			</thead>
			<tbody>
			  	<s:set name="a" value="flowTemplate"></s:set>	 	
	  			<s:iterator value="#attr.a.nodes" var="b">		
					<tr target="id" rel="<s:property value="id"/>" class="tr">
						<%-- <td align="center"><u:index value="#st.index+1"/></td> --%>
						<td align="center" title="<s:property value="#attr.a.flowTemplateName"/>"><s:property value="#attr.a.flowTemplateName"/></td>
						<td align="center"><s:property value="#attr.b.flowDefName"/></td>	
						<td align="center">
							<a href="../fextends/FlowTemplate_inputFlowTemplateNodeConfig_flow-template-node-config.action?flowTemplatelNodeId=<s:property value="#attr.b.id"/>&&flowTemplateId=<s:property value="flowTemplateId"/>" target="dialog" width="1050" height="480" mask="true" title="编辑子流程">编辑</a>														
							<s:if test="#attr.b.flowTemplateNodesDatas.size() != 0">
								&nbsp;&nbsp;|&nbsp;&nbsp;<a href="../fextends/flowTemplate!inputFlowTemplateNodeRelation.action?flowTemplatelNodeId=<s:property value="#attr.b.id"/>&&flowTemplateId=<s:property value="flowTemplateId"/>" target="dialog" width="1050" height="480" mask="true">关联</a>
							</s:if>
						</td>
						<td align="center">
							<table style="width: 100%;">
							<s:iterator value="#attr.b.flowTemplateNodesDatas" id="d">
								<tr>										
									<td align="center" style="border-bottom-style: 0.1px"><s:property value="#attr.d.flowName" /></td>										
								</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
				</s:iterator>
			
			 </tbody>
		</table>
		
		<%-- <u:juipage></u:juipage> --%>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
</div>

