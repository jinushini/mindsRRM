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
		
		//部署按钮
		jn("#deployment").click(function(){
			var id = <s:property value="flowDef.id"/>
			//$.post("../fextends/HtyFlow_deploymentFlow.action", {"id" : id} );
			$.ajax({
				async:false,
				global : false,
				type : 'post',
				dataType : "json",
				url:"../fextends/HtyFlow_deploymentFlow.action",
				data:{"id" : id},
				success : function(data, statusText){
					alertMsg.correct(data.message);
				}
				
				
			});
		});
	});
	
	//合并单元格
	function mergeCell(){//可实现合并单元格,上下行来比较
	    var totalCols = jn("#tbl").find("tr:eq(1)").find("td:eq(1)").length; 	
	    var totalRows = jn("#tbl").find(".tr").length;
	    for ( var i = 0; i < totalCols+1; i++) {
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
					<th width="20%">流程名称</th>
					<th width="15%">环节名称</th>
					<!-- <th width="15%">阶段名称</th> -->
				</tr>
			</thead>
			<tbody>
				<s:set name="a" value="flowDef"></s:set>
	  			<s:iterator value="flowDef.nodes" var="b">
	  				<s:if test="#attr.b.nodes.size() == 0">
	  					<tr class="tr">
							<td align="center"><s:property value="#attr.a.name"/></td>
							<td align="center"><s:property value="#attr.b.name"/></td>	
						</tr>
	  				</s:if>		  
					<%-- <s:iterator value="#attr.b.nodes" var="c">
						<tr class="tr">
							<td align="center"><s:property value="#attr.a.name"/></td>
							<td align="center"><s:property value="#attr.b.name"/></td>	
							<td align="center"><s:property value="#attr.c.name" /></td>		
						</tr>
					</s:iterator> --%>
				</s:iterator>
			 </tbody>
		</table>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="deployment" type="submit">部署</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
</div>

