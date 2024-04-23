<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jd(".delBtn").click(function(){
		var $trObj = $(getRowObj(this));
		var id = $trObj.attr("rel");
		alertMsg.confirm("确定要删除这条子订单吗？", {
				okCall: function(){
					$.ajax({
					global : false, //(默认: true) 是否触发全局 AJAX 事件
					url : "../microwave/product_ProductOrder_delProdOrder.action", //发送请求的地址
					data : {
						num : id
					},//发送到服务器的请求参数
					type : "POST", //请求方式：post或get
					dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
					success : function(data, statusText) {
						if(data == 'success'){
							$trObj.remove();
							jn("#"+id).remove();
							alertMsg.correct(data);
						}else{
							alertMsg.error(data);
						}
					}
				});
			 },
		 cancelCall : function() {}
		});
	})
	jd(".formBar").mouseover(function(){
		jd(this).click();
	})
	//提交按钮
	jd("[type=submit]").click(function() {
		addNames(jd(".modifyTr:visible"));
		delNames(jd(".modifyTr:hidden"));
		for(var i=0;i<jd(".modifyTr:visible").length;i++){
			var $thisTr = jd(".modifyTr:visible").eq(i);
			var $targetObj = jn("#"+$thisTr.attr("rel"));
			if($targetObj.hasClass("modifyTr")){
				$targetObj.find("#libCode").val($thisTr.find(".libCode").val());
				$targetObj.find("#parentProdName").text($thisTr.find(".name").val());
				$targetObj.find("#parentProdCode").text($thisTr.find(".code").val());
				$targetObj.find("#parentSelProdCode").text($thisTr.find(".selProdCode").val());
				$targetObj.find("#parentSingleHeadName").text($thisTr.find(".singleHeadName").val());
				$targetObj.find("#phase").val($thisTr.find(".phase option:selected").val());
				$targetObj.find("#userUnit").val($thisTr.find(".responsibleDept option:selected").val());
				$targetObj.find("#userUnitPIC").val($thisTr.find(".singleHeadName").val());
			}else{
				$targetObj.text($thisTr.find(".childSelProdCode").val());
			}
		}
	});
	
	function addNames($Trs){
		for(var i = 0; i < $Trs.length; i++){
			var $thisTr = $Trs.eq(i);
			var $input = $thisTr.find("input,select");
			//input加行号
			for(var j=0;j<$input.length;j++){
				var name = $input.eq(j).attr("name");
				if(name!=null){
					$input.eq(j).attr("name", name.replace("#index", i));
				}
			}
		}
	}
	function delNames($Trs){
		for(var i = 0; i < $Trs.length; i++){
			var $thisTr = $Trs.eq(i);
			var $input = $thisTr.find("input,select");
			//input加行号
			for(var j=0;j<$input.length;j++){
				var name = $input.eq(j).attr("name");
				if(name!=null){
					$input.eq(j).attr("name", name.replace(/\[\d{1,9}\]/, "[#index]"));
				}
			}
		}
	}
	
	jd(".classification,.researchMode").change(function(){
		var $thisTr = jd(this).parent().parent();
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
</script>
<div class="pageContent">
	<form action="../microwave/product_ProductOrder_modifyProdOrderList.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	  	<div class="pageFormContent" layoutH="56">
			<br/>
			<!-- 修改父订单信息，同步修改的是批量添加页面隶属订单信息 -->
			<fieldset>
				<legend style="font-size:16px;">父订单信息</legend>
				<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
					<thead>
						<tr align="center" style="background-color:#E4F0FC;">
							<th width="10%" style="font-size:17px;">所属项目</th>
							<th width="10%" style="font-size:17px;">设备名称</th>
							<th width="10%" style="font-size:17px;">设备代号</th>
							<th width="10%" style="font-size:17px;">图纸代号</th>
							<th width="10%" style="font-size:17px;">主管设计师</th>
							<th width="10%" style="font-size:17px;">研制阶段</th>
							<th width="10%" style="font-size:17px;">责任部门</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<tr align="center" rel="<s:property value="productOrder.id"/>" class="modifyTr">
							<input type="hidden" name="productOrderListA[#index].id" value='<s:property value="productOrder.id"/>' readonly="readonly">
							<td>
								<input type="text" name="productOrderListA[#index].libCode" value='<s:property value="productOrder.libCode"/>' class="libCode" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].name" value='<s:property value="productOrder.name"/>' class="name" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].code" value='<s:property value="productOrder.code"/>' class="code" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].selProdCode" value='<s:property value="productOrder.selProdCode"/>' class="selProdCode" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input name="productOrderListA[#index].singleHead.id" type="hidden" value='<s:property value="productOrder.singleHead.id"/>' class="singleHeadId">
								<input name="productOrderListA[#index].singleHead.name" type="text" value='<s:property value="productOrder.singleHead.name"/>' class="singleHeadName" onclick="jd(this).next().click();" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<select name="productOrderListA[#index].phase"  style="margin-left:5%;" class="phase">
									<option value='<s:property value="productOrder.phase"/>' selected hidden><s:property value='productOrder.phase'/></option>
									<option value="M">M</option>
									<option value="C">C</option>
									<option value="C-J">C-J</option>
									<option value="Z">Z</option>
									<option value="Z1">Z1</option>
								</select>
							</td>
							<td>
								<select name="productOrderListA[#index].responsibleDept" class="responsibleDept">
									<option value='<s:property value="productOrder.responsibleDept"/>' selected hidden><s:property value='productOrder.responsibleDept'/></option>
									<option value="微波有源事业部">微波有源事业部</option>
									<option value="微波无源事业部">微波无源事业部</option>
									<option value="微波功率部件事业部">微波功率部件事业部</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<br/>
			<!-- 修改子订单信息，批量添加页面同步修改隶属设备已有子订单列的图纸代号 -->
			<fieldset>
				<legend style="font-size:16px;">子订单信息</legend>
				<table border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
					<thead>
						<tr align="center" style="background-color:#E4F0FC;">
							<td width="100">设备名称</td>
							<td width="100">图纸代号</td>
							<td width="100">频点信息</td>
							<td width="50"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>数量</span></td>
							<td width="80"><span style="font-size:15px;padding:0 0 2px 2px;">研制<br/>模式</span></td>
							<td width="80">专业分类</td>
							<td width="80">产品种类</td>
							<td width="50"><span style="font-size:15px;padding:0 0 2px 2px;">是否<br/>新研</span></td>
							<td width="90"><span style="font-size:15px;padding:0 0 2px 2px;">责任部门</span></td>
							<td width="80"><span style="font-size:15px;padding:0 0 2px 2px;">自研<br/>设计师</span></td>
							<td width="80"><span style="font-size:15px;padding:0 0 2px 2px;">生产厂家/<br/>外协单位</span></td>
							<td width="80"><span style="font-size:15px;padding:0 0 2px 2px;">外协<br/>设计师</span></td>
							<td width="80"><span style="font-size:15px;padding:0 0 2px 2px;">订单<br/>管理人员</span></td>
							<td width="50">研制<br/>阶段</td>
							<td width="90">用户部门</td>
							<td width="80">用户部门<br/>责任人</td>
							<td width="80">任务来源</td>
							<td width="50">操作</td>
						</tr>
					</thead>
					<tbody class="tbody">
						<s:iterator value="productOrder.childProductOrderSet" status="st">
							<tr target="id" rel="<s:property value="id"/>" align="center" class="modifyTr">
								<input type="hidden" name="productOrderListA[#index].id" value="<s:property value='id'/>" readonly="readonly">
								<td><input type="text" name="productOrderListA[#index].name" value='<s:property value="name"/>' style="width:96%;background-color:#F0F0F0;"/></td>
								<td><input type="text" name="productOrderListA[#index].selProdCode" value='<s:property value="selProdCode"/>' class="required childSelProdCode" style="width:96%;background-color:#F0F0F0;"/></td>
								<td><input type="text" name="productOrderListA[#index].freqInfo" value='<s:property value="freqInfo"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td><input type="text" name="productOrderListA[#index].orderNum" value='<s:property value="orderNum"/>' class="digits" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td>
									<%-- <select name="productOrderListB[#index].researchMode" style="margin-left:5%;" class="researchMode">
										<option value="自研">自研</option>
										<option value="外购">外购</option>
										<option value="生产外协">生产外协</option>
									</select> --%>
									<select name="productOrderListA[#index].researchMode" style="margin-left:5%;" class="researchMode">
										<option value="<s:property value='researchMode'/>" selected hidden><s:property value='researchMode'/></option>
										<option value="自研">自研</option>
										<option value="外购">外购</option>
										<option value="生产外协">生产外协</option>
									</select>
								</td>
								<td>
									<select name="productOrderListA[#index].classification" style="margin-left:5%;" class="classification">
										<option value="<s:property value='classification'/>" selected hidden><s:property value='classification'/></option>
										<option value="模块">模块</option>
										<option value="元器件">元器件</option>
									</select>
								</td>
								<td class="category">
									<s:if test="classification=='模块'">
										<select name="productOrderListA[#index].category"  style="margin-left:5%;">
											<option value="<s:property value='category'/>" selected hidden><s:property value='category'/></option>
											<option value="T部件">T部件</option>
											<option value="R部件">R部件</option>
											<option value="TR部件">TR部件</option>
											<option value="频率源">频率源</option>
											<option value="MHIC模块">MHIC模块</option>
											<option value="电源模块">电源模块</option>
										</select>
									</s:if>
									<s:else>
										<input type="text" name="productOrderListA[#index].category" value='<s:property value="category"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
									</s:else>
								</td>
								<td>
									<select name="productOrderListA[#index].isNewResearch" style="margin-left:5%;">
										<option value="<s:property value='isNewResearch'/>" selected hidden><s:property value='isNewResearch'/></option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select>
								</td>
								<td>
									<select name="productOrderListA[#index].responsibleDept" style="margin-left:5%;">
										<option value="<s:property value='responsibleDept'/>" selected hidden><s:property value='responsibleDept'/></option>
										<option value="微波有源事业部">微波有源事业部</option>
										<option value="微波无源事业部">微波无源事业部</option>
										<option value="微波功率部件事业部">微波功率部件事业部</option>
									</select>
								</td>
								<td>
									<input type="hidden" name="productOrderListA[#index].singleHead.id" value='<s:property value="singleHead.id"/>' readonly="readonly" >
									<input type="text" name="productOrderListA[#index].singleHead.name" value='<s:property value="singleHead.name"/>' readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
									<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
										href="../system/user!findUser.action" target="dialog"
										rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
									</a>
								</td>
								<td><input type="text" name="productOrderListA[#index].outsourceUnit" value='<s:property value="outsourceUnit"/>' class="outsourceUnit" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td><input type="text" name="productOrderListA[#index].outsourceUnitPIC" value='<s:property value="outsourceUnitPIC"/>' style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
								<td>
									<input type="hidden" name="productOrderListA[#index].designPlanManager.id" value='<s:property value="designPlanManager.id"/>' class="designPlanManagerId" readonly="readonly">
									<input type="text" name="productOrderListA[#index].designPlanManager.name" value='<s:property value="designPlanManager.name"/>' class="designPlanManagerName" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;" onclick="$(this).next().click()">
									<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
										href="../system/user!findUser.action" target="dialog"
										rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
									</a>
								</td>
								<td>
									<select name="productOrderListA[#index].phase"  style="margin-left:5%;">
										<option value='<s:property value="phase"/>' selected hidden><s:property value='phase'/></option>
										<option value="M">M</option>
										<option value="C">C</option>
										<option value="C-J">C-J</option>
										<option value="Z">Z</option>
										<option value="Z1">Z1</option>
									</select>
								</td>
								<td>
									<select name="productOrderListA[#index].userUnit"  style="margin-left:5%;">
										<option value='<s:property value="userUnit"/>' selected hidden><s:property value='userUnit'/></option>
										<option value="微波有源事业部">微波有源事业部</option>
										<option value="微波无源事业部">微波无源事业部</option>
										<option value="微波功率部件事业部">微波功率部件事业部</option>
									</select>
								</td>
								<td>
									<input type="text" name="productOrderListA[#index].userUnitPIC" value='<s:property value="userUnitPIC"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
								</td>
								<td>
									<input type="text" name="productOrderListA[#index].taskSource" value='<s:property value="taskSource"/>'  readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;">
								</td>
								<td align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</fieldset>
		</div>
		<div class="formBar" style="text-align： center;">
			<ul style="">
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">保存</button></div></div></li>
			</ul>
		</div>
	</form>
</div>