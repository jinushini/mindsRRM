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
			<!-- 		<th width="20">状态</th>
					<th width="20" align="center">序号</th> -->
					<th width="200">复查主题</th>
					<th width="150">创建人</th>
					<th width="100">截止日期</th>				
					<th width="20">操作</th>				
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st" var="a">
				<tr target="id" rel="<s:property value="id"/>">
				<%-- 	<td align="center" <s:if test="status==3">style="color:green;font-size:30px"</s:if><s:elseif test="status==2">style="color:orange;font-size:30px"</s:elseif><s:else>style="color:red;font-size:30px"</s:else>>●</td>
					<td align="center"><u:index value="#st.index+1"/></td> --%><!-- 隐藏状态序号 -->
					<td align="center"><s:property value="reviewBillName"/></td>
					<td align="center"><s:property value="tableManager.name"/></td>
					<td align="center"><s:date name="limdat" format="yyyy-MM-dd"/></td>		
					<td align="center"><a href="../review/review!showReviewBill.action?reviewBillId=<s:property value='id'/>" target="navTab" rel="" class="details"><span>详情</span></a></td>	
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

