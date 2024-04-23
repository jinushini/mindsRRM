<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
jn(function() {
	//合并单元格
	var j = 0;
	for (var i = 1; i < jn("#tb tr").length + 1; i++) {
		var $referCol = jn("#tb tr").eq(i - j).find("td:eq(0)");
		var $itemCol = jn("#tb tr").eq(i + 1).find("td:eq(0)");
		if ($itemCol.text() == $referCol.text()) {
			$itemCol.hide();
			j = j + 1;
		} else {
			$referCol.attr("rowspan", j + 1);
			j = 0;
		}
	}
}); 
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="60">
	<table border="0" width="50%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;" id="tb">
		<thead>
			<tr>
				<th align="center" style="background-color: #D8E6F7">处（室）</th>
				<th align="center" style="background-color: #D8E6F7">候选人</th>
				<th align="center" style="background-color: #D8E6F7">票数</th>
			</tr>
		</thead>
		<s:iterator value="result" id="m">
			<s:iterator value="#m.value" status="st">
				<tr>
					<td align="center" style="line-height:2;">
						<s:property value="key"/>
					</td>
					<td align="center">
						<s:property value="item"/>
					</td>
					<td align="center">
						<s:property value="count"/>
					</td>
				</tr>
			</s:iterator>
		</s:iterator>
	</table>
	</div>
</div>


