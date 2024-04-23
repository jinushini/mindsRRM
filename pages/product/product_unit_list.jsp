<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
</script>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
	<input type="hidden" name="msg" value="<s:property value="msg"/>"/>
	<div class="searchBar">
		<ul class="searchContent" >
			<li>
				所属型号：<input type="text" name="paramMap['p.productLib.modelCode like']" value="<s:property value="paramMap['p.productLib.modelCode like']"/>" />
			</li>
			<li>
				型号产品代号：<input type="text" name="paramMap['p.code like']" value="<s:property value="paramMap['p.code like']"/>" />
			</li>
			<li>
				研制阶段：<input type="text" name="paramMap['p.phase like']" value="<s:property value="paramMap['p.phase like']"/>" />
			</li>
			<li>
				单机分类：<input type="text" name="paramMap['p.subType.value like']" value="<s:property value="paramMap['p.subType.value like']"/>" />
			</li>
			<li>
				投产编号：<input type="text" name="paramMap['p.productNum like']" value="<s:property value="paramMap['p.productNum like']"/>" />
			</li>
			<li>
				单机主管设计师：<input type="text" name="paramMap['p.singleHead.name like']" value="<s:property value="paramMap['p.singleHead.name like']"/>" />
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
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="../product/product!inputAdd.action?msg=<s:property value="msg"/>" target="navTab" rel=""><span>添加</span></a></li>
			<li><a class="edit" href="../product/product!inputModify.action?productId={id}&&msg=<s:property value="msg"/>" target="navTab" rel=""><span>修改</span></a></li>
			<li><a class="delete" href="../product/product!delete.action?productId={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list" width="100%" layoutH="140" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40" align="center">序号</th>
					<th align="center" width="100">所属型号</th>
					<th align="center" width="120">型号产品代号</th>
	
					<th align="center" width="120">型号产品名称</th>
					<th align="center" width="100">研制阶段</th>
					<th align="center" width="100">单机分类</th>
					<!-- <th align="center" width="15%">单机子类</th>
	
					<th align="center" width="15%">关重件</th>
					<th align="center" width="15%">研制模式</th> -->
	
					<th align="center" width="100">需求数量</th>
					<!-- <th align="center" width="15%">节点类型</th>
	
					<th align="center" width="15%">来源</th> -->
					<th align="center" width="120">产品成熟度</td>
	
					<th align="center" width="130">去型号化代号</th>
					<!-- <th align="center" width="20%">基线产品来源代号 </th>
	
					<th align="center" width="20%">基线产品来源名称</th>
	
					<th align="center" width="15%">基线产品代号</th>
					<th align="center" width="15%">基线产品名称</th>
	
					<th align="center" width="15%">最新应用型号</th>
					<th align="center" width="20%">产品图纸所属阶段</th>
		
					<th align="center" width="15%">产品类型(E类)</th>
					<th align="center" width="15%">选用类型</th>
				
					<th align="center" width="15%">鉴定件数量</th>
					<th align="center" width="20%">选用后产品成熟度</th>
				
					<th align="center" width="15%">选用后产品代号</th>
					<th align="center" width="15%">更改原因分类</th> -->
				
					<th align="center" width="100">投产编号</th>
					<th align="center" width="100">单机主管</td>
				
					<th align="center" width="100">开始时间</th>
					<th align="center" width="120">计划交付时间</th>
				
					<th align="center" width="120">实际交付时间</th>
					<th align="center" width="100">是否配套</th>
				
					<th align="center" width="100">模块代号</th>
					<th align="center" width="120">模块设计师</th>
				
					<th align="center" width="150">单台单机模块数量</th>
					<th align="center" width="120">模块装机数量</th>
				
					<th align="center" width="100">指令方式</th>
					<th align="center" width="100">开关工号</th>
				
					<th align="center" width="100">交付编号</th>
					<th align="center" width="100">备注</th>
				
					<th align="center" width="100">元器件等级</th>
					<th align="center" width="100">产品保证</th>
				
					<th align="center" width="100">质量管理</th>
					<th align="center" width="100">计划管理</th>
					<th align="center" width="100">结构主管</th>
				
					<th align="center" width="100">工艺主管</th>
				
					<th align="center" width="100">编码（条码）</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>">
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><s:property value="productLib.modelCode"/></td>
					<td align="center"><s:property value="code"/></td>
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="phase"/></td>
					<td align="center"><s:property value="subType.value"/></td>
					<%-- <td align="center"><s:property value="djClass.value"/></td>
					<td align="center"><s:property value="criticalParts"/></td>
					<td align="center"><s:property value="researchingMode.value"/></td> --%>
					<td align="center"><s:property value="num"/></td>
					<%-- <td align="center"><s:property value="type"/></td>
					<td align="center"><s:property value="source"/></td> --%>
					<td align="center"><s:property value="maturity"/></td>
					<td align="center"><s:property value="selProdType"/></td>
					<%-- <td align="center"><s:property value="selProdSourceCode"/></td>
					<td align="center"><s:property value="selProdSourceName"/></td>
					<td align="center"><s:property value="selProductCode"/></td>
					<td align="center"><s:property value="selProductName"/></td>
					<td align="center"><s:property value="latestApplication"/></td>
					<td align="center"><s:property value="prodDrawingPhase"/></td>
					<td align="center"><s:property value="productType"/></td>
					<td align="center"><s:property value="selectType"/></td>
					<td align="center"><s:property value="identiftyPartsNum"/></td>
					<td align="center"><s:property value="selectedMaturity"/></td>
					<td align="center"><s:property value="selectedProductCode"/></td>
					<td align="center"><s:property value="changeCauseType"/></td> --%>
					<td align="center"><s:property value="productNum"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>
					<td align="center"><s:date name="startTime" format="yyyy-MM-dd"/></td>
					<td align="center"><s:date name="planDelivery" format="yyyy-MM-dd"/></td>
					<td align="center"><s:date name="actualDelivery" format="yyyy-MM-dd"/></td>
					<td align="center"><s:property value="isMatch?'是':'否'"/></td>
					<td align="center"><s:property value="moduleCode"/></td>
					<td align="center"><s:property value="moduleDesigner.name"/></td>
					<td align="center"><s:property value="singleModuleCount"/></td>
					<td align="center"><s:property value="moduleCount"/></td>
					<td align="center"><s:property value="instructionMode"/></td>
					<td align="center"><s:property value="switchNum"/></td>
					<td align="center"><s:property value="deliveryNumber"/></td>
					<td align="center"><s:property value="remarks"/></td>
					<td align="center"><s:property value="componentLevel"/></td>
					<td align="center"><s:property value="productManager.name"/></td>
					<td align="center"><s:property value="qualityManager.name"/></td>
					<td align="center"><s:property value="planManager.name"/></td>
					<td align="center" title=<s:property value="structureHeadName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="structureHeadName"/></td>
					<td align="center" title=<s:property value="processSupervisorName"/> style="padding-left:8px;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="processSupervisorName"/></td>
					<td align="center"><s:property value="barCode"/></td>			
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>

