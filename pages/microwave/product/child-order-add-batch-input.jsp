<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	//点击增加新数据
	jn(".dataAdd").click(function(){
		var $thisTbody = jn(this).parent().parent().find(".tbody");
		//新一行(新加一行)
		var $newTr=jn(this).parent().parent().find(".modelTr").clone();
		$newTr.removeAttr("style");
		$newTr.attr("class","newTr");
		$newTr.find(".addRequired").addClass("required");
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		$thisTbody.append($newTr);
		
		newTrJq();
	});
	
	
	function newTrJq(){
		jn(".classification,.researchMode").change(function(){
			var $thisTr = jn(this).parent().parent();
			var classification = $thisTr.find(".classification option:selected").val();
			var researchMode = $thisTr.find(".researchMode option:selected").val();
			if(classification == '模块'){
				$thisTr.find(".category").empty().append("<select name='productOrderListB[#index].category' style='margin-left:5%;'><option value='T部件'>T部件</option><option value='R部件'>R部件</option><option value='TR部件'>TR部件</option><option value='频率源'>频率源</option><option value='MHIC模块'>MHIC模块</option><option value='电源模块'>电源模块</option></select>");
				if(researchMode == '自研'){
					$thisTr.find(".designPlanManagerId").val('<s:property value="userMap['ZYMK'].id"/>');
					$thisTr.find(".designPlanManagerName").val('<s:property value="userMap['ZYMK'].name"/>');
					$thisTr.find(".outsourceUnit").val("微波所").attr("readonly", "readonly");
					
				}
				if(researchMode == '外购'){
					$thisTr.find(".designPlanManagerId").val('<s:property value="userMap['WGMK'].id"/>');
					$thisTr.find(".designPlanManagerName").val('<s:property value="userMap['WGMK'].name"/>');
					$thisTr.find(".outsourceUnit").val("").removeAttr("readonly");
				}
				if(researchMode == '生产外协'){
					$thisTr.find(".designPlanManagerId").val('<s:property value="userMap['SCWXMK'].id"/>');
					$thisTr.find(".designPlanManagerName").val('<s:property value="userMap['SCWXMK'].name"/>');
					$thisTr.find(".outsourceUnit").val("").removeAttr("readonly");
				}
			}
			if(classification == '元器件'){
				$thisTr.find(".category").empty().append("<input type='text' name='productOrderListB[#index].category' style='width:96%;background-color:#F0F0F0;text-align:center;'/>");
				$thisTr.find(".designPlanManagerId").val('<s:property value="userMap['YQJ'].id"/>');
				$thisTr.find(".designPlanManagerName").val('<s:property value="userMap['YQJ'].name"/>');
				if(researchMode == '自研'){
					$thisTr.find(".outsourceUnit").val("微波所").attr("readonly", "readonly");
				}
				if(researchMode == '外购'){
					$thisTr.find(".outsourceUnit").val("").removeAttr("readonly");
				}
				if(researchMode == '生产外协'){
					$thisTr.find(".outsourceUnit").val("").removeAttr("readonly");
				}
			}
			//阻止事件冒泡
			event.stopPropagation();
		})
		
		jn(".delBtn").click(function(){
			jn(this).parent().parent().remove();
			//阻止事件冒泡
			event.stopPropagation();
		});
	}
	
	jn(".childProductOrderSet").click(function(){
		var $trObj = $(getRowObj(this));
		var options={};
		options.width = 1400;
		options.height = 500;
		var url="../microwave/product_ProductOrder_showProductOrder_order-prod-edit-single.action?num="+$trObj.attr("rel");
		$.pdialog.open(url, "childOrderList", "订单产品信息编辑", options);
	})
	
	jn(".panel,.collapse").dblclick(function(){
		var options={};
		options.width = 1400;
		options.height = 500;
		var url="../microwave/product_ProductOrder_findProdOrderListByIds_order-prod-edit-batch-jd.action?ids="+'<s:property value="ids"/>';
		$.pdialog.open(url, "parentOrderList", "订单产品信息批量编辑", options);
	})
	
	//提交按钮
	jn("[type=submit]").click(function() {
		addNames(jn(".tbody:eq(0) .modifyTr"));
		addNames(jn(".tbody:eq(1) .newTr"));
	});
	
	function addNames($Trs){
		for(var i = 0; i < $Trs.length; i++){
			var $thisTr = $Trs.eq(i);
			var $input = $thisTr.find("input,select");
			//input加行号
			for(var j=0;j<$input.length;j++){
				if($input.eq(j).attr("name")!=null){
					$input.eq(j).attr("name", $input.eq(j).attr("name").replace("#index", i));
				}
			}
		}
	}
</script>
<div class="pageContent">
	<form action="../microwave/product_ProductOrder_addBatchChildOrder_<s:property value="data"/>.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	  	<div class="pageFormContent" layoutH="56">
	  		<div>
	  			<div class="panel collapse" defH="150">
					<h1>子订单基本信息</h1>
					<div>
						<table border="0" width="99%" class="edit_table"  style="margin:5px auto;table-layout:fixed;">
							<s:if test='list != null || list.size()!=0'>
								<thead>
									<tr align="center">
										<th width="60" rowspan="2">所属项目</th>
										<th width="460" colspan="5">隶属设备</th>
										<th width="60" rowspan="2">研制阶段</th>
										<th width="100" rowspan="2">用户部门</th>
										<td width="60" rowspan="2"><span style="font-size:15px;padding:0 0 2px 2px;">用户部门<br/>责任人</span></td>
										<td width="60" rowspan="2">任务来源</td>
									</tr>
									<tr align="center">
										<th width="100">隶属设备名称</th>
										<th width="100">隶属设备代号</th>
										<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">隶属设备<br/>图纸代号</span></th>
										<th width="60"><span style="font-size:15px;padding:0 0 2px 2px;">隶属设备<br/>主管设计师</span></th>
										<th width="100"><span style="font-size:15px;padding:0 0 2px 2px;">隶属设备<br/>已有子订单</span></th>
										<!-- <td width="10%">任务来源</td> -->
									</tr>
								</thead>
								<tbody class="tbody">
									<s:iterator value="list" status="st">
										<tr target="id" rel="<s:property value="id"/>" id='<s:property value="id"/>' align="center" class="modifyTr">
											<input type="hidden" name="productOrderListA[#index].parentProductOrder.id" value='<s:property value="id"/>' readonly="readonly">
											<td>
												<input type="text" name="productOrderListA[#index].libCode" value='<s:property value="libCode"/>' id="libCode" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;">
											</td>
											<td><span style="font-size:15px;" id="parentProdName"><s:property value='name'/></span></td>
											<td><span style="font-size:15px;" id="parentProdCode"><s:property value='code'/></span></td>
											<td><span style="font-size:15px;" id="parentSelProdCode"><s:property value="selProdCode"/></span></td>
											<td><span style="font-size:15px;" id="parentSingleHeadName"><s:property value="singleHead.name"/></span></td>
											<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-align:left;" class="childProductOrderSet" onmouseover="jn(this).attr('title',jn(this).text());">
												<s:iterator value="childProductOrderSet" status="st">
													<div style="text-align:left;" id='<s:property value="id"/>'><s:property value="selProdCode"/></div>
												</s:iterator>
											</td>
											<td>
												<select name="productOrderListA[#index].phase"  style="margin-left:5%;" id="phase">
													<option value='<s:property value="phase"/>' selected hidden><s:property value='phase'/></option>
													<option value="M">M</option>
													<option value="C">C</option>
													<option value="C-J">C-J</option>
													<option value="Z">Z</option>
													<option value="Z1">Z1</option>
												</select>
											</td>
											<td>
												<select name="productOrderListA[#index].userUnit" style="margin-left:5%;" id="userUnit">
													<option value='<s:property value="responsibleDept"/>' selected hidden><s:property value='responsibleDept'/></option>
													<option value="微波有源事业部">微波有源事业部</option>
													<option value="微波无源事业部">微波无源事业部</option>
													<option value="微波功率部件事业部">微波功率部件事业部</option>
												</select>
											</td>
											<td><input type="text" name="productOrderListA[#index].userUnitPIC" value="<s:property value='singleHead.name'/>" id="userUnitPIC" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
											<td><input type="text" name="productOrderListA[#index].taskSource" value="所内配套" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;"></td>
										</tr>
									</s:iterator>
								 </tbody>
							</s:if>
							<s:else>
								<div style="margin:10px 30px -20px 100px;font-size:50px;color:#B8B8B8;">无</div>
							</s:else>
						</table>
					</div>
				</div>
	  		</div>
	  		<br/>
			<fieldset>
				<legend style="font-size:16px;">子订单结构信息&nbsp;&nbsp;&nbsp;<a class="dataAdd" href="###" style="color:green;font-size:14px;">增加一行</a></legend>
				<div style="overflow:auto; width:100%;" layoutH="280" id="subOrder">
					<table width="100%" class="edit_table" style="margin:5px auto;table-layout:fixed;">
						<thead>
							<tr align="center">
								<td width="15%">设备名称</td>
								<td width="15%">图纸代号</td>
								<td width="4%"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>数量</span></td>
								<td width="10%"><span style="font-size:15px;padding:0 0 2px 2px;">研制<br/>模式</span></td>
								<td width="8%">专业分类</td>
								<td width="10%">产品种类</td>
								<td width="6%"><span style="font-size:15px;padding:0 0 2px 2px;">是否<br/>新研</span></td>
								<td width="10%"><span style="font-size:15px;padding:0 0 2px 2px;">责任部门</span></td>
								<td width="8%"><span style="font-size:15px;padding:0 0 2px 2px;">自研<br/>设计师</span></td>
								<td width="10%"><span style="font-size:15px;padding:0 0 2px 2px;">生产厂家/<br/>外协单位</span></td>
								<td width="8%"><span style="font-size:15px;padding:0 0 2px 2px;">外协<br/>设计师</span></td>
								<td width="8%"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>管理人员</span></td>
								<td width="5%">操作</td>
							</tr>
						</thead>
						<tbody class="tbody" >
							<tr class="modelTr" style="display:none;" align="center">
								<td><input type="text" name="productOrderListB[#index].name" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td><input type="text" name="productOrderListB[#index].selProdCode" class="addRequired" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td><input type="text" name="productOrderListB[#index].orderNum" class="digits" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td>
									<select name="productOrderListB[#index].researchMode" style="margin-left:5%;" class="researchMode">
										<option value="自研">自研</option>
										<option value="外购">外购</option>
										<option value="生产外协">生产外协</option>
									</select>
								</td>
								<td>
									<select name="productOrderListB[#index].classification" style="margin-left:5%;" class="classification">
										<option value="模块">模块</option>
										<option value="元器件">元器件</option>
									</select>
								</td>
								<td class="category">
									<select name="productOrderListB[#index].category" style="margin-left:5%;">
										<option value="T部件">T部件</option>
										<option value="R部件">R部件</option>
										<option value="TR部件">TR部件</option>
										<option value="频率源">频率源</option>
										<option value="MHIC模块">MHIC模块</option>
										<option value="电源模块">电源模块</option>
									</select>
								</td>
								<td>
									<select name="productOrderListB[#index].isNewResearch" style="margin-left:5%;">
										<option value="是">是</option>
										<option value="否">否</option>
									</select>
								</td>
								<td>
									<select name="productOrderListB[#index].responsibleDept" style="margin-left:5%;">
										<option value="微波有源事业部">微波有源事业部</option>
										<option value="微波无源事业部">微波无源事业部</option>
										<option value="微波功率部件事业部">微波功率部件事业部</option>
									</select>
								</td>
								<td>
									<input type="hidden" name="productOrderListB[#index].singleHead.id" readonly="readonly" >
									<input type="text" name="productOrderListB[#index].singleHead.name" readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
									<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
										href="../system/user!findUser.action" target="dialog"
										rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
									</a>
								</td>
								<td><input type="text" name="productOrderListB[#index].outsourceUnit" value="微波所" class="outsourceUnit" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td><input type="text" name="productOrderListB[#index].outsourceUnitPIC" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td>
									<input type="hidden" name="productOrderListB[#index].designPlanManager.id" readonly="readonly" value='<s:property value="userMap['ZYMK'].id"/>' class="designPlanManagerId">
									<input type="text" name="productOrderListB[#index].designPlanManager.name" readonly="readonly" value='<s:property value="userMap['ZYMK'].name"/>' class="designPlanManagerName" style="width:96%;background-color:#F0F0F0;text-align:center;" onclick="$(this).next().click()">
									<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
										href="../system/user!findUser.action" target="dialog"
										rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
									</a>
								</td>
								<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
		<div class="formBar" style="text-align： center;">
			<ul style="">
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">生成子订单</button></div></div></li>
			</ul>
		</div>
	</form>
</div>