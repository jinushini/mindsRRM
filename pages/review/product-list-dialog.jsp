<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	//清空按钮
	jd("#cancle").click(function(){
		$.cookie("idStr","");
	});
	
	jd(function(){
		var idStr = $.cookie("idStr");
		if(idStr != null){
			var ids = idStr.split(",");
			for(var i = 0 ; i < ids.length ; i ++ ){
				if(ids[i] != ""){
					var id = ids[i];
					var tagerInput = jd("input[name='ids']");
					for(var j = 0 ; j < tagerInput.length ; j ++){
						var targetVal = tagerInput.eq(j).val();
						if(targetVal == id){
							tagerInput.eq(j).attr("checked","checked");
						}
					}
				}
			}
			
		}
	});
	
	//复选框点击事件
	function onchecked(obj){
		var idStr = "";
		idStr = $.cookie("idStr");
		var id = jd(obj).val();
		if(idStr != null){
			idStr = idStr.replaceAll(id + ",","");
		}
		//移除
		delJN(id);
		if(obj.checked){
			if(idStr != null){
				idStr += id + ",";
			}else{
				idStr = id + ",";
			}
			//填充
			fillJN(obj, id);
		}
		$.cookie("idStr",idStr);
		
		//排序
		sortJN();
	}
	
	//填充
	function fillJN(obj, id){
		var targetTbody = jn("#selected");
		var targetTr = jd(obj).parent().parent();
		var modelCode = targetTr.find(".modelCode").text();
		var modelName = targetTr.find(".modelName").text();
		var productCode = targetTr.find(".productCode").text();
		var productName = targetTr.find(".productName").text();
		var type = targetTr.find(".type").text();
		var productionCode = targetTr.find(".productionCode").text();
		var singleHead = targetTr.find(".singleHead").text();
		var productionUnit = targetTr.find(".productionUnit").text();
		var tr = "<tr id="+id+">"+
				"<td align='center' class='num'></td>"+
				"<td align='center' class='modelCode'>"+modelCode+"</td>"+
				"<td align='center' class='modelName'>"+modelName+"</td>"+
				"<td align='center' class='productCode'>"+productCode+"</td>"+
				"<td align='center' class='productName'>"+productName+"</td>"+
				"<td align='center' class='type'>"+type+"</td>"+
				"<td align='center' class='singleHead'>"+singleHead+"</td>"+
				"<td align='center'><a name='delProductBtn' href='javascript:;' style='color : red;'>移除</a></td>"+											
				"</tr>";
		targetTbody.append(tr);
		
		//排序
		//sort();
	}
	
	//移除
	function delJN(id){
		var targetTbody = jn("#selected");
		var targetTr = targetTbody.find("#"+id+"");
		targetTr.remove();
	}
	
	//排序
	function sortJN(){
		var targetTbody = jn("#selected");
		var targetTrs = targetTbody.find("tr");
		var len = targetTrs.length;
		for(var i = 0 ; i < len ; i ++){
			targetTrs.eq(i).find(".num").text(i+1);
		}
	}
	
</script>
<div class="pageHeader">
	<form onsubmit="return dialogSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" id="state" value="<s:property value="userSetting.state"/>"/>
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				型号代号：<input type="text" name="paramMap['p.modelCode like']" value="<s:property value="paramMap['p.modelCode like']"/>" />
			</li>
			<li>
				分系统：<input type="text" name="paramMap['p.modelName like']" value="<s:property value="paramMap['p.modelName like']"/>" />
			</li>
			<li>
				产品代号：<input type="text" name="paramMap['p.productCode like']" value="<s:property value="paramMap['p.productCode like']"/>" />
			</li>
			<li>
				产品名称：<input type="text" name="paramMap['p.productName like']" value="<s:property value="paramMap['p.productName like']"/>" />
			</li>
			<li>
				产品种类：<input type="text" name="paramMap['p.type like']" value="<s:property value="paramMap['p.type like']"/>" />
			</li>
			<li>
				单机主管：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
			</li>

		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<!-- <li><div class="buttonActive"><div class="buttonContent"><button id="cancle" type="button">清空</button></div></div></li> -->
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="118" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">选择</th>
					<th width="40" align="center">序号</th>
					<th width="80">型号代号</th>
					<th width="110">分系统</th>
					<th width="150">单机代号</th>
					<th width="200">单机名称</th>
					<th width="90">产品种类</th>					
					<th width="100">生产编号</th>					
					<th width="80">单机主管</th>					
					<th width="100">生产单位</th>					
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>" onclick="onchecked(this)" /></td>
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center" class="modelCode"><s:property value="modelCode==null ? productLib.modelCode : modelCode"/></td>
					<td align="center" class="modelName"><s:property value="modelName"/></td>
					<td align="center" class="productCode"><s:property value="productCode"/></td>
					<td align="center" class="productName"><s:property value="productName"/></td>
					<td align="center" class="type"><s:property value="type"/></td>
					<td align="center" class="productionCode"><s:property value="productionCode"/></td>
					<td align="center" class="singleHead"><s:property value="singleHead.name"/></td>					
					<td align="center" class="productionUnit"><s:property value="productionUnit"/></td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage dialog="true"></u:juipage>
	</div>
</div>

