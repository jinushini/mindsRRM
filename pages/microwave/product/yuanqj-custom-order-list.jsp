<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	
	jn("#track").click(function(){
		var trackTds = jn("[name='ids']:checked");
		var ids = "";
		if(trackTds.length == 0){
			alertMsg.error("请选择信息");
			return false;
		}else{
			for(var i=0;i<trackTds.length;i++){
				ids = ids  + trackTds.eq(i).val() + ",";
			}
			var options={};
			options.width = 600;
			options.height = 500;
			options.title = "元器件申报管理跟踪";
			var url="../microwave/product_ProductDeclare_trackCustomYuanqjDeclareInput_yuanqj-custom-declare-track-input.action?data=" + ids;
			navTab.openTab("a", url, options);
		}
	})
</script>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						型号代号：<input type="text" name="paramMap['p.productLib.modelCode like']" value="<s:property value="paramMap['p.productLib.modelCode like']"/>" />
						型号名称：<input type="text" name="paramMap['p.productLib.modelName like']" value="<s:property value="paramMap['p.productLib.modelName like']"/>" />
						整机名称：<input type="text" name="paramMap['p.zhengji.name like']" value="<s:property value="paramMap['p.zhengji.name like']"/>" />
						整机代号：<input type="text" name="paramMap['p.zhengji.code like']" value="<s:property value="paramMap['p.zhengji.code like']"/>" />
						模块名称：<input type="text" name="paramMap['p.mokuai.name like']" value="<s:property value="paramMap['p.mokuai.name like']"/>" />
						模块代号：<input type="text" name="paramMap['p.mokuai.code like']" value="<s:property value="paramMap['p.mokuai.code like']"/>" />
						元器件名称：<input type="text" name="paramMap['p.yuanqj.name like']" value="<s:property value="paramMap['p.yuanqj.name like']"/>" />
						元器件型号规格：<input type="text" name="paramMap['p.yuanqj.code like']" value="<s:property value="paramMap['p.yuanqj.code like']"/>" />
					</td>
				</tr>
			</table>
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
			<li><a class="icon" id="track"><span>管理跟踪</span></a></li>
		</ul>
	</div>
	<div>
		<table class="list_table list" width="150%" layoutH="130" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="17"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
					<th width="100">型号名称</th>
					<th width="100">型号代号</th>
					<th width="100">整机名称</th>
					<th width="100">整机代号</th>
					<th width="100">模块名称</th>
					<th width="100">模块代号</th>
					<th width="100">元器件名称</th>
					<th width="100">元器件型号规格</th>
					<th width="100">元器件等级</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" status="st">
					<s:if test='subType=="整机"'>
						<s:iterator value="childProductOrderSet">
							<s:if test='subType=="元器件" && outsourcingSort=="定制类"'>
								<tr target="id" rel="<s:property value="id"/>">
									<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelName"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelCode"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
									<td align="center">/</td>
									<td align="center">/</td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="componentLevel"/></td>
									<td align="center"><s:property value="checklistId"/>
										<a href="../microwave/product_ProductDeclare_showCustomYuanqjDeclare_yuanqj-custom-order-show.action?num=<s:property value='id'/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
										<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="productDeclare.processInstId"/>" height="410" width="700" target="dialog">查看</a>
									</td>
								</tr>
							</s:if>
							<s:elseif test='subType=="模块"'>
								<s:iterator value="childProductOrderSet">
									<s:if test='subType=="元器件" && outsourcingSort=="定制类"'>
										<tr target="id" rel="<s:property value="id"/>">
											<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelName"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelCode"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.name"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.code"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
											<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="componentLevel"/></td>
											<td align="center"><s:property value="checklistId"/>
												<a href="../microwave/product_ProductDeclare_showCustomYuanqjDeclare_yuanqj-custom-order-show.action?num=<s:property value='id'/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
												<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="productDeclare.processInstId"/>" height="410" width="700" target="dialog">查看</a>
											</td>
										</tr>
									</s:if>
								</s:iterator>
							</s:elseif>
						</s:iterator>
					</s:if>
					<s:elseif test='subType=="模块"'>
						<s:iterator value="childProductOrderSet">
							<s:if test='subType=="元器件" && outsourcingSort=="定制类"'>
								<tr target="id" rel="<s:property value="id"/>">	
									<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelName"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelCode"/></td>
									<s:if test='parentProductOrder.parentProductOrder != null'>
										<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.name"/></td>
										<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.code"/></td>
									</s:if>
									<s:else>
										<td align="center">/</td>
										<td align="center">/</td>
									</s:else>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="componentLevel"/></td>
									<td align="center"><s:property value="checklistId"/>
										<a href="../microwave/product_ProductDeclare_showCustomYuanqjDeclare_yuanqj-custom-order-show.action?num=<s:property value='id'/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
										<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="productDeclare.processInstId"/>" height="410" width="700" target="dialog">查看</a>
									</td>
								</tr>
							</s:if>
						</s:iterator>
					</s:elseif>
					<s:elseif test='subType=="元器件" && outsourcingSort=="定制类"'>
						<tr target="id" rel="<s:property value="id"/>">	
							<td align="center"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelName"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productLib.modelCode"/></td>
							<s:if test='parentProductOrder.parentProductOrder != null'>
								<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.name"/></td>
								<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.parentProductOrder.code"/></td>
								<s:if test='parentProductOrder != null'>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
								</s:if>
								<s:else>
									<td align="center">/</td>
									<td align="center">/</td>
								</s:else>
							</s:if>
							<s:else>
								<s:if test="parentProductOrder.subType == '整机'">
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
									<td align="center">/</td>
									<td align="center">/</td>
								</s:if>
								<s:if test="parentProductOrder.subType == '模块'">
									<td align="center">/</td>
									<td align="center">/</td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.name"/></td>
									<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="parentProductOrder.code"/></td>
								</s:if>
							</s:else>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="name"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="code"/></td>
							<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="componentLevel"/></td>
							<td align="center"><s:property value="checklistId"/>
								<a href="../microwave/product_ProductDeclare_showCustomYuanqjDeclare_yuanqj-custom-order-show.action?num=<s:property value='id'/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
								<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="productDeclare.processInstId"/>" height="410" width="700" target="dialog">查看</a>
							</td>
						</tr>
					</s:elseif>
				</s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
