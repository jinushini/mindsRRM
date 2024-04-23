<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">

$(function(){
	
	//提交按钮
	jd("[type=submit]").click(function() {
		//修改Tr行数据
		var $modifyTr = jd("#itemList").find(".modifyTr");
		/* for(var i = 0; i < $modifyTr.length; i++){
			var $input = $modifyTr.eq(i).find("input[type='text']").val();
			var $select = $modifyTr.eq(i).find(".preFlow").find("option:selected").val();
			if($input == $select){
				alertMsg.error("关联关系设置有误，不允许设置自身");
				return false;
			}
		} */
		for(var i = 0; i < $modifyTr.length; i++){
			var $input = $modifyTr.eq(i).find("input[type='text']");
			var $select = $modifyTr.eq(i).find("select");
			
			for(var j = 0; j< $select.length; j++){
				var name = $select.eq(j).attr("name").substring($select.eq(j).attr("name").indexOf("[")+1,$select.eq(j).attr("name").indexOf("]"));
				$select.eq(j).attr("name",$select.eq(j).attr("name").replace(name,  i ));
			}				
				var name = $input.attr("name").substring($input.attr("name").indexOf("[")+1,$input.attr("name").indexOf("]"));
				$input.attr("name",$input.attr("name").replace(name,  i ));		
							
		}
		
		
	});
	
	//打印按钮
	
	/* jn("#print").click(function(){			
		var url = "../readzkword/readzkword!stagedataexcel.action";
		
		jn("#print").attr("href", url);
	    
	}); */
})
</script>

<div class="pageContent">
  <form action="../readzkword/readzkword!stagedataexcel.action" id="searchForm" method="post" class="pageForm required-validate" onsubmit="return navTabSearch;" >
  		<div class="pageFormContent" layoutH="56">
  		
		<br/>
	<fieldset>
		<legend><s:property value="flowTemplateNode.nodesName"/></legend>
		
				<div style="font-size:30px;"  align="center">各阶段测试项目对比配置表</div>	
				  
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;" >
				
				<thead>
				    
					<tr>
						<th width="20%">验收测试项目</th>
						<th width="13%">初测测试项目</th>
	                    <th width="13%">力学后测试项目</th>
						<th width="13%">热真空测试项目</th>
						<th width="13%">热循环测试项目</th>
	                    <th width="13%">温循老炼测试项目</th>
						<th width="13%">高温老炼测试项目</th>
					</tr>
				</thead>
				<tbody id="itemList">
					<s:iterator value="ysitem" status="st" var="a">
						<tr class="modifyTr">
							<td align="center" ><input type="text" readonly="readonly"  name="ysList[#index]" value="<s:property value="#attr.a"/>"></td>							
							<td align="center">
								<select name="cList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="citem" status="st" var="b">
										<option value="<s:property value="#attr.b"/>"> <s:property value="#attr.b"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center">
								<select name="lxhList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="lxhitem" status="st" var="c">
										<option value="<s:property value="#attr.c"/>"> <s:property value="#attr.c"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center">
								<select name="zkList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="zkitem" status="st" var="d">
										<option value="<s:property value="#attr.d"/>"> <s:property value="#attr.d"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center">
								<select name="wxList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="wxitem" status="st" var="e">
										<option value="<s:property value="#attr.e"/>"> <s:property value="#attr.e"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center">
								<select name="wxllList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="wxllitem" status="st" var="f">
										<option value="<s:property value="#attr.f"/>"> <s:property value="#attr.f"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center">
								<select name="gwllList[#index]" class="preFlow">
										<option value="0">无</option>
									<s:iterator value="gwllitem" status="st" var="g">
										<option value="<s:property value="#attr.g"/>"> <s:property value="#attr.g"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
	</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交并打印excel表格</button></div></div></li>
				<!-- <li><div class="button"><div class="buttonContent"><a type="button" class="" id="print">打印环境试验各阶段温度对比数据</a></div></div></li> -->				
			</ul>
		</div>
   </form>
</div>
						
	    
