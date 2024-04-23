<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<style type="text/css">
	.contentDiv{
          position: relative;
		  top: 10px;
		  width: 350px;
		  max-height: 250px;           /* 设置最大高度，当高度达到此值时出现滚动条 */
		  z-index: 10;
		  background-color: #E0E5E5; 
		  box-shadow:0px 0px 10px #000;   /* 外阴影 */
		  display: none;   /* 默认隐藏 */
	}

</style>
<script type="text/javascript">
	
	//双击事件
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	function showdiv(obj){
		var contentDiv = jn(obj).parent().find(".contentDiv").eq(0);
		contentDiv.attr("style","display:block; font-size:18px;");
		
	}
	
	function hidediv(obj){
		var contentDiv = jn(obj).parent().find(".contentDiv").eq(0);
		contentDiv.attr("style","display:none;");
		
	}
	
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
					<th width="15%">事项来源</th>
					<th width="15%">事项名称</th>
					<s:set name="count" value="12"/>
				  	<s:bean name="org.apache.struts2.util.Counter" id="counter">
				  		<s:param name="first" value="1"/>
				  		<s:param name="last" value="#count"/>
				  		<s:iterator>
				  			<th><s:property/>月</th>
				  		</s:iterator>
				  	</s:bean>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" id="map" status="ls">
			  	<s:iterator value="#map" id="mk" status="ms">
					<tr target="id" rel="<s:property value="#mk.key.id"/>">
						<td align="center"><s:property value="#ls.count"/></td>
						<td align="center" title="<s:property value="#mk.key.team"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="#mk.key.team"/></td>
						<td align="center" title="<s:property value="#mk.key.name"/>" style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="#mk.key.name"/></td>
			  			<s:iterator value="#mk.value" id="mmk" status="mms">
			  				<td>
			  					<s:iterator value="#mmk.value" id="mmv" status="mmvs">
			  						<div >
				  						<a href="../general/timed_DispatchPlan_show_plan-show.action?id=<s:property value="id"/>" width="780" height="550" target="dialog" onmouseover="showdiv(this)" onmouseout="hidediv(this)">
					  						<div <s:if test="#mmv.status == 3">style="font-size:18px; text-align:center; color:green;"</s:if><s:elseif test="#mmv.status == 2">style="font-size:18px; text-align:center; color:orange;"</s:elseif><s:else>style="font-size:18px; text-align:center; color:red;"</s:else>>
					  							<s:date name="#mmv.deadline" format="MM-dd"/>
					  						</div>
				  						</a>
										<div class="contentDiv" style="display:none;"><s:date name="#mmv.deadline" format="MM-dd"/></br><s:property value="#mmv.status == 3 ? #mmv.actualContentStr : #mmv.planContentStr" escape="false"/></div>
			  						</div>
			  					</s:iterator>
			  				</td>
			  			</s:iterator>
			  			<td hidden="hidden">
			  				<a href="../general/timed_DispatchPlanItem_enterAddOrModify_item-show.action?id=<s:property value='#mk.key.id'/>" width="780" height="550" target="dialog" class="details"><s:property value='#mk.key.name'/>详情</a>
			  			</td>
			  		</tr>
			  	</s:iterator>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
</div>

