<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
<!--
$(function(){
	var num = $("[name='number']").val();
	//上一月
	$("#pre").click(function(){
		var number = --num;
		$("#pre").attr("href","../manage/weeklyMeeting!statistics.action?number="+number);
	});
	//本月
	$("#now").click(function(){
		$("[name='number']").attr("value",0);
		var num = $("[name='number']").val();
		var number = num;
		$("#now").attr("href","../manage/weeklyMeeting!statistics.action?number="+number);
	});
	//下一月
	$("#next").click(function(){
		var number = ++num;
		$("#next").attr("href","../manage/weeklyMeeting!statistics.action?number="+number);
	});
}); 
//-->
</script>
<div class="pageContent" layoutH="10">
	<div style="text-align: center;font-size: 20px;margin-top: 20px;">
		<b><span style="color:red;font-size:20px;"><b><s:property value="month"/>月</b></span>周例会情况汇总表</b>
	</div>	
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" id="pre" href="javascript:;" target="navTab" rel="currentNavTab"><span>上一月</span></a></li>
			<li><a class="icon" id="now" href="javascript:;" target="navTab" rel="currentNavTab"><span>本月</span></a></li>
			<li><a class="icon" id="next" href="javascript:;" target="navTab" rel="currentNavTab" ><span>下一月</span></a></li>
		</ul>
	</div>
	<div layoutH="60">
		<input type="hidden" name="number" value="<s:property value="number"/>">
		<table class="list_table list" width="98%" layoutH="60" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="50">班组名称</th>
					<th width="50">第一周</th>
					<th width="50">第二周</th>
					<th width="50">第三周</th>
					<th width="50">第四周</th>
					<th width="50">总计</th>
					<th width="50">是否完成</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="map" id="entry">
					<tr>					
						<s:set name="to" value="#entry.value.size" /> 
						
						<s:iterator value="#entry.value" status="s">
							<s:if test="#s.first"> 
								<td align="center">
									<s:property value="#entry.key" />
								</td>	
           					</s:if>
           					
         					<s:set name="cont" value="cont"/>
           					<s:set name="total" value="total"/>
	           				<s:set name="level" value="total-cont == 1 ? '完成' : total-cont == 0 ? '完成':'未完成' "/>
							<td align="center" <s:if test="state == 4">style="color:red;font-size:30px" </s:if><s:elseif test="state == 3">style="color:green;font-size:30px"</s:elseif><s:elseif test="state == 0">style="color:white;font-size:30px"</s:elseif><s:else >style="color:Orange;font-size:30px"</s:else>>
								<s:if test="state == 3">
									<a title="会议详情" href="../manage/weeklyMeeting!showMeeting.action?meetingId=<s:property value="meetingId"/>&&processInstId=<s:property value="processInstId"/>" target="dialog" width='900' height='800' style="color:green;font-size:30px">
										●
									</a>
								</s:if>
								<s:elseif test="state == 4">
										●
								</s:elseif>
								<s:elseif test="state == 0">
										●
								</s:elseif>
								<s:else>
									<a title="会议详情" href="../manage/weeklyMeeting!showMeeting.action?meetingId=<s:property value="meetingId"/>&&processInstId=<s:property value="processInstId"/>" target="dialog" width='900' height='800' style="color:Orange;font-size:30px">
										●
									</a>
								</s:else>								
							</td>							
						</s:iterator>

						<td align="center">${cont}/${total}</td>
						<td align="center">${level}</td> 						
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>

