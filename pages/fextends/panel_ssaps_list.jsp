<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>
<div class="pageContent">
	<div layoutH="90">
		<table class="list_table list" width="100%" style="table-layout:fixed;">
			<thead>
				<tr>
					<!-- <th width="40">状态</th>
					<th width="40">序号</th> -->
					<th width="40" style="display:none;">ID</th>
					<th width="40" style="display:none;">流程实例ID</th>
					<th width="100">型号代号</th>
					<th width="100">型号名称</th>
					<th width="130">产品代号</th>
					<th width="150">产品名称</th>
					<th width="80">单机主管</th>
					<th width="80">计划管理</th>
					<th width="80">产品保证</th>
					<th width="80">质量管理</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
				<%-- 	<td align="center" id="taskState" <s:if test="status == 3">style="color:green;font-size:30px" </s:if><s:elseif test="status == 2">style="color:orange;font-size:30px"</s:elseif><s:elseif test="status == 0">style="color:gray;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>
						<s:property value="status == 0 ? '●' : '●'"/>
					</td>
					<td align="center"><u:index value="#st.index+1"/></td> --%>
					<!-- 大流程隐藏序号和状态 -->
					<td align="center" style="display:none;" class="ssapsId"><s:property value="id"/></td>
					<td align="center" style="display:none;" class="processInstId"><s:property value="processInstId"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productLib.modelCode"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productLib.modelName"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.code"/></td>
					<td align="center" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.name"/></td>
					<td align="center" title="<s:property value="projectLeader.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.singleHead.name"/></td>
					<td align="center" title="<s:property value="projectLeader.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.planManager.name"/></td>
					<td align="center" title="<s:property value="projectLeader.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.productManager.name"/></td>
					<td align="center" title="<s:property value="projectLeader.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productDetail.qualityManager.name"/></td>
					<td align="center">
						<a href="../ssaps/ssaps!showSSAPS.action?ssapsId=<s:property value="id"/>" target="navTab" class="details">详情</a>
						<%-- &nbsp;| 
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a> --%>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

