<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
</script>

<div>
	<div style="text-align: center;font-size: 20px;margin-top: 10px; margin-bottom: 10px;">
		<b>党支部活动完成情况汇总表</b>
	</div>	
</div>
<div class="pageContent">
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="3%" align="center">序号</th>
					<th width="10%">事项来源</th>
					<th width="10%">事项名称</th>
					<s:set name="count" value="0"/>
					<s:iterator value="list">
						<s:set name="count" value="#count > plans.size ? #count : plans.size"/>
				  	</s:iterator>
				  	<s:bean name="org.apache.struts2.util.Counter" id="counter">
				  		<s:param name="first" value="1"/>
				  		<s:param name="last" value="#count"/>
				  		<s:iterator>
				  			<th><s:property/></th>
				  		</s:iterator>
				  	</s:bean>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
					<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><s:property value="#st.count"/></td>
					<td align="center" title="<s:property value="unit"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="unit"/></td>
					<td align="center" title="<s:property value="name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
					<s:iterator value="plans" status="p">
						<s:if test="status == 3">
							<td align="center" title="<s:property value='actualContentStr' escape='false'/>"> <a href="../general/timed_DispatchPlan_show_plan-show.action?id=<s:property value="id"/>" width="780" height="550" target="dialog" class="details"><span style="font-size:15px; color:green;"><s:date name="remindTime" format="MM-dd"/></span></a></td>
						</s:if>
						<s:elseif test="status == 2">
							<td align="center" title="<s:property value='planContentStr' escape='false'/>"> <a href="../general/timed_DispatchPlan_show_plan-show.action?id=<s:property value="id"/>" width="780" height="550" target="dialog" class="details"><span style="font-size:15px; color:orange;"><s:date name="remindTime" format="MM-dd"/></span></a></td>
						</s:elseif>
						<s:else>
							<td align="center" title="<s:property value='planContentStr' escape='false'/>"><a href="../general/timed_DispatchPlan_show_plan-show.action?id=<s:property value="id"/>" width="780" height="550" target="dialog" class="details"><span style="font-size:15px; color:red;"><s:date name="remindTime" format="MM-dd"/></span></a></td>
						</s:else>
					</s:iterator>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

