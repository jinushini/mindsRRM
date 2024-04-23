<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
$(function(){
	
	//提交按钮
	 jn("[type=submit]").click(function() {
		var $itemTr = jn("#itemList").find("tr");
		 if($itemTr.length == 2){
			 var $input = $itemTr.eq(1).find("input");
				for(var j = 0; j< $input.length; j++){				
					var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("]"));
					$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ 0 ));					
				}
		}else{
			for (var i = 1; i < $itemTr.length+1; i++) {
				var $input = $itemTr.eq(i).find("input");
								
					for(var j = 0; j< $input.length; j++){				
						var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("]"));
						//alert(name);
						$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ (i-1)));
						
						//alert($input.eq(j).attr("name"));
					}
				}
		}
	});  
	
	/* jn("#print").click(function(){			
		var url = "../exceltoword/exceltoword!scword.action";
		
		jn("#print").attr("href", url);
	    
	}); */
	// 
})
</script>

<div class="pageContent">
	
	<br/>
	<div><h1 align="center" style="color:red;font-size: 18px">数据读取完毕，请点击页面下方“点击下载生成的报告”按钮下载文档</h1></div>
	<br/>
	<form  id="searchForm" action="../exceltoword/exceltoword!scword.action" method="post" class="pageForm required-validate" onsubmit="return navTabSearch;" >
	 <table class="table" width="100%" layoutH="145">
		 <thead style="height: 20px">		 
			
			<tr>
				<th width="40" style="height: 30px"><h1 align="left" style="color:black;font-size: 12px">文档书签</h1></th>
				<th width="40" style="height: 30px"><h1 align="left" style="color:black;font-size: 12px">图片说明</h1></th>
				<th width="40" style="height: 30px"><h1 align="left" style="color:black;font-size: 12px">图片路径</h1></th>
			</tr>		
		</thead> 
		<tbody id="itemList">
		        <tr hidden="hidden">
		        
		        <td ><input type="text" style="width:100%" name="realwordfilepath" readonly="readonly" value="<s:property value="realwordfilepath"/>"></td>
		        <td ><input type="text" style="width:100%" name="realexcelfilepath" readonly="readonly" value="<s:property value="realexcelfilepath"/>"></td>
		        <td ></td>
		        </tr>
		        <s:iterator value="imagemarklist" status="statusVar">
					  <tr> 
					      <td ><input type="text" style="width:100%" name="imagemarklist[index]"  value="<s:property value="imagemarklist[#statusVar.index]"/>"></td>
					      <td ><input type="text" style="width:100%" name="imagecontlist[index]"  value="<s:property value="imagecontlist[#statusVar.index]"/>"></td>
					      <td ><input type="text" style="width:100%" name="imagepathlist[index]" readonly="readonly" value="<s:property value="imagepathlist[#statusVar.index]"/>"></td>
					  </tr>
				</s:iterator>
		      <%-- <s:iterator id="data1" value="#request.stagedata.data" status="d1">		
			<tr target="sid_user" rel="1">
			<s:iterator id="data2" value="#request.data1" status="d2">
				<td><s:property value="#data2"/></td>
				</s:iterator>
			</tr>	
			</s:iterator> --%>
		</tbody>
	</table> 
	<%-- <div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>

		<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="0" currentPage="1"></div>

	</div> --%>
	<div class="formBar" style="height: 70px">
	    <ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">点击下载生成的报告</button></div></div></li>
				<!-- <li><div class="button"><div class="buttonContent"><a type="button" class="" id="print">打印环境试验各阶段温度对比数据</a></div></div></li> -->				
			</ul>
	</div>
	</form>
	
</div>
