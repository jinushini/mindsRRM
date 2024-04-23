<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

	//带回按钮
	jd(".btnSelect").click(function(){
		var id = jd(this).parent().parent().find(".id").val();
		var code = jd(this).parent().parent().find(".code").val();
		var name = jd(this).parent().parent().find(".name").val();
		var href = "javascript:$.bringBack({id : '"+id+"', code:'"+code+"', name:'"+name+"'})";
		/* var href = "javascript:$.bringBack({id : '1001', code:'1', name:'基本版'})"; */
		jd(this).attr("href",href);
	});
</script>

<div class="pageHeader">
	<form onsubmit="return dialogSearch(this);" action="../microwave/product_ProductDesign_showList_design-list-dialog.action" method="post">
	<div class="searchBar">
		<ul class="searchContent" >
			<%-- <li>
				所属型号：<input type="text" name="paramMap['p.productLib.modelCode like']" value="<s:property value="paramMap['p.productLib.modelCode like']"/>" />
			</li> --%>
			<li>
				产品代号：<input type="text" name="paramMap['p.productBasic.code like']" value="<s:property value="paramMap['p.productBasic.code like']"/>" />
			</li>
			<li>
				研制阶段：<input type="text" name="paramMap['p.productBasic.phase like']" value="<s:property value="paramMap['p.productBasic.phase like']"/>" />
			</li>
			<li>
				单机分类：<input type="text" name="paramMap['p.productBasic.subType like']" value="<s:property value="paramMap['p.productBasic.subType like']"/>" />
			</li>
			<li>
				主管设计师：<input type="text" name="paramMap['p.productBasic.singleHead.name like']" value="<s:property value="paramMap['p.productBasic.singleHead.name like']"/>" />
			</li>

		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div layoutH="90">
		<table class="list_table list" width="500%" layoutH="120" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">选择</th>
					<th width="40" align="center">序号</th>
					<th align="center" width="15%">产品代号</th>
	
					<th align="center" width="15%">产品名称</th>
					<th align="center" width="15%">研制阶段</th>
					<th align="center" width="15%">单机分类</th>
	
					<th align="center" width="15%">关重件</th>
					<th align="center" width="15%">研制模式</th>
				
					<th align="center" width="15%">投产编号</th>
					<th align="center" width="15%">主管设计师</td>
				
					<th align="center" width="15%">开始时间</th>
					<th align="center" width="15%">计划交付时间</th>
				
					<th align="center" width="20%">单台单机模块数量</th>
				
					<th align="center" width="15%">指令方式</th>
					<th align="center" width="15%">开关工号</th>
				
					<th align="center" width="15%">元器件等级</th>
					<th align="center" width="15%">产品保证</th>
				
					<th align="center" width="15%">质量管理</th>
					<th align="center" width="15%">计划管理</th>
					<!-- <th align="center" width="15%">结构主管姓名</th>
				
					<th align="center" width="15%">工艺主管姓名</th> -->
				
					<th align="center" width="15%">编码（条码）</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td hidden="hidden"><input type="text" class="id" value="<s:property value='id'/>"/><input type="text" class="code" value="<s:property value='productBasic.code'/>"/><input type="text" class="name" value="<s:property value='productBasic.name'/>"/></td>
					<td align="center"><a class="btnSelect" href="" title="查找带回">选择</a></td>
					<td align="center"><s:property value="#st.index+1"/></td>
					<td align="center"><s:property value="productBasic.code"/></td>
					<td align="center"><s:property value="productBasic.name"/></td>
					<td align="center"><s:property value="productBasic.phase"/></td>
					<td align="center"><s:property value="productBasic.subType"/></td>
					<td align="center"><s:property value="productBasic.criticalParts"/></td>
					<td align="center"><s:property value="productBasic.researchingMode"/></td>
					<td align="center"><s:property value="productBasic.productNum"/></td>
					<td align="center"><s:property value="productBasic.singleHead.name"/></td>
					<td align="center"><s:date name="productBasic.planStartTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:date name="productBasic.planDeliveryTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="productBasic.singleModuleCount"/></td>
					<td align="center"><s:property value="productBasic.instructionMode"/></td>
					<td align="center"><s:property value="productBasic.switchNum"/></td>
					<td align="center"><s:property value="productBasic.componentLevel"/></td>
					<td align="center"><s:property value="productBasic.productManager.name"/></td>
					<td align="center"><s:property value="productBasic.qualityManager.name"/></td>
					<td align="center"><s:property value="productBasic.planManager.name"/></td>
					<%-- <td align="center" title=<s:property value="structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="structureHeadName"/></td>
					<td align="center" title=<s:property value="processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="processSupervisorName"/></td> --%>
					<td align="center"><s:property value="productBasic.barCode"/></td>			
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage dialog="true"></u:juipage>
	</div>
</div>

