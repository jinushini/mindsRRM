<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	jd(function(){
		jd("#whole").hide();
		jd("#child").hide();
	})
	
	jd(".simplify").click(function(){
		jd("#simplify").show();
		jd("#whole").hide();
		jd("#child").hide();
	})
	jd(".whole").click(function(){
		jd("#simplify").hide();
		jd("#whole").show();
		jd("#child").hide();
	})
	jd(".child").click(function(){
		jd("#simplify").hide();
		jd("#whole").hide();
		jd("#child").show();
	})
	
	
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
						/* alertMsg.correct("删除成功"); */
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
		for(var i=0;i<jd(".tbody").length;i++){
			var $thisTbody = jd(".tbody").eq(i);
			if($thisTbody.is(":visible")){
				addNames($thisTbody.find(".modifyTr"));
			}
			if($thisTbody.is(":hidden")){
				delNames($thisTbody.find(".modifyTr"));
			}
		}
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
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li class="simplify"><a class="icon"><span>简洁模式</span></a></li>
			<li class="whole"><a class="icon"><span>完整模式</span></a></li>
			<li class="child"><a class="icon"><span>子订单模式</span></a></li>
		</ul>
	</div>
	<form method="post" action='../microwave/product_ProductOrder_modifyProdOrderList.action' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" value="<s:property value="data"/>" name="data" />
		<div class="pageFormContent" layoutH="80">
			<table id="simplify" border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th width="80">所属项目</th>
						<th width="100">设备名称</th>
						<th width="100">设备代号</th>
						<th width="100">图纸代号</th>
						<th width="100">频点信息</th>
						<th width="100">主管设计师</th>
						<th width="50">研制<br/>阶段</th>
						<th width="100">责任部门</th>
						<th width="100">考核计划<br/>开始时间</th>
						<th width="100">考核计划<br/>完成时间</th>
						<th width="100">预计<br/>交付时间</th>
					</tr>
				</thead>
				<tbody class="tbody" style="align:center">
					<s:iterator value="list" status="st">
						<tr target="id" rel="<s:property value="id"/>" class="modifyTr" align="center">
							<input type="hidden" name="productOrderListA[#index].id" value="<s:property value='id'/>"  readonly="readonly">
							<td>
								<input type="text" name="productOrderListA[#index].libCode" value='<s:property value="libCode"/>' class="libCode"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].name" value='<s:property value="name"/>' class="name" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].code" value='<s:property value="code"/>' class="code" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].selProdCode" value='<s:property value="selProdCode"/>' class="selProdCode" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].freqInfo" value='<s:property value="freqInfo"/>' style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input name="productOrderListA[#index].singleHead.id" type="hidden" value='<s:property value="singleHead.id"/>' class="singleHeadId">
								<input name="productOrderListA[#index].singleHead.name" type="text" value='<s:property value="singleHead.name"/>' class="singleHeadName" onclick="jd(this).next().click();" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<select name="productOrderListA[#index].phase" style="margin-left:5%;" class="phase">
									<option value="<s:property value='phase'/>" selected hidden><s:property value='phase'/></option>
									<option value="M">M</option>
									<option value="C">C</option>
									<option value="C-J">C-J</option>
									<option value="Z">Z</option>
									<option value="Z1">Z1</option>
								</select>
							</td>
							<td>
								<select name="productOrderListA[#index].responsibleDept" style="margin-left:5%;" class="responsibleDept">
									<option value='<s:property value="responsibleDept"/>' selected hidden><s:property value='responsibleDept'/></option>
									<option value="微波有源事业部">微波有源事业部</option>
									<option value="微波无源事业部">微波无源事业部</option>
									<option value="微波功率部件事业部">微波功率部件事业部</option>
								</select>
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].assessPlanBD" value="<s:date name='assessPlanBD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].assessPlanED" value="<s:date name='assessPlanED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].latestDeliveryPD" value="<s:date name='latestDeliveryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
						</tr>
					</s:iterator>
				 </tbody>
			</table>
			<table id="whole" border="0" width="99%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<th width="100">所属项目</th>
						<th width="100">设备名称</th>
						<th width="100">设备代号</th>
						<th width="100">图纸代号</th>
						<th width="100">频点信息</th>
						<th width="100">MES<br/>产品编号</th>
						<th width="100">主管<br/>设计师</th>
						<th width="100">考核计划<br/>开始时间</th>
						<th width="100">考核计划<br/>完成时间</th>
						<th width="100">预计<br/>交付时间</th>
						<th width="100">隶属班组</th>
						<th width="100">班组长</th>
						<th width="100">结构设计师</th>
						<th width="100">工艺设计师</th>
						<th width="100">设计计划经理</th>
						<th width="100">生产计划经理</th>
						<th width="100">产保工程师</th>
						<th width="100">质量管理人员</th>
						<th width="100">研制现状</th>
						<th width="100">管控措施</th>
						<th width="100">质量状态</th>
						<th width="100">风险项目</th>
						<th width="100">验证项目</th>
						<th width="100">工程化<br/>分离状态</th>
						<th width="100">研制模式</th>
						<th width="100">订单数量</th>
						<th width="100">投产数量</th>
						<th width="100">隶属<br/>设备名称</th>
						<th width="100">隶属<br/>设备代号</th>
						<th width="100">隶属<br/>图纸代号</th>
						<th width="100">任务来源</th>
						<th width="100">选用类型</th>
						<th width="100">研制阶段</th>
						<th width="100">专业分类</th>
						<th width="100">产品种类</th>
						<th width="100">责任部门</th>
						<th width="100">用户单位</th>
						<th width="100">用户单位<br/>责任人</th>
						<th width="100">外协单位</th>
						<th width="100">外协单位<br/>责任人</th>
					</tr>
				</thead>
				<tbody class="tbody" style="align:center">
					<s:iterator value="list" status="st">
						<tr target="id" rel="<s:property value="id"/>" class="modifyTr" align="center">
							<input type="hidden" name="productOrderListA[#index].id" value="<s:property value='id'/>"  readonly="readonly">
							<td>
								<input type="text" name="productOrderListA[#index].libCode" value='<s:property value="libCode"/>' class="libCode" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].name" value='<s:property value="name"/>' class="name" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].code" value='<s:property value="code"/>' class="code" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].selProdCode" value='<s:property value="selProdCode"/>' class="selProdCode" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].freqInfo" value='<s:property value="freqInfo"/>' style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].mesCode" value='<s:property value="mesCode"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input name="productOrderListA[#index].singleHead.id" type="hidden" value='<s:property value="singleHead.id"/>' class="singleHeadId" readonly="readonly">
								<input name="productOrderListA[#index].singleHead.name" type="text" value='<s:property value="singleHead.name"/>' class="singleHeadName" readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].assessPlanBD" value="<s:date name='assessPlanBD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].assessPlanED" value="<s:date name='assessPlanED' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].latestDeliveryPD" value="<s:date name='latestDeliveryPD' format='yyyy-MM-dd'/>" placeholder="yyyy-MM-dd"  style="width:96%;background-color:#F0F0F0;text-align:center;"   />
							</td>
							<td>
								<select name="productOrderListA[#index].teamName"  style="margin-left:5%;">
									<option value="<s:property value='teamName'/>" selected hidden><s:property value='teamName'/></option>
									<option value="整机组">整机组</option>
									<option value="通道组">通道组</option>
									<option value="新技术组">新技术组</option>
								</select>
							</td>
							<td>
								<input name="productOrderListA[#index].teamLead.id" type="hidden" value="<s:property value='teamLead.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].teamLead.name" type="text" value="<s:property value='teamLead.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].structureManager.id" type="hidden" value="<s:property value='structureManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].structureManager.name" type="text" value="<s:property value='structureManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].technicalManager.id" type="hidden" value="<s:property value='technicalManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].technicalManager.name" type="text" value="<s:property value='technicalManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].designPlanManager.id" type="hidden" value="<s:property value='designPlanManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].designPlanManager.name" type="text" value="<s:property value='designPlanManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].prodPlanManager.id" type="hidden" value="<s:property value='prodPlanManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].prodPlanManager.name" type="text" value="<s:property value='prodPlanManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].prodAssureManager.id" type="hidden" value="<s:property value='prodAssureManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].prodAssureManager.name" type="text" value="<s:property value='prodAssureManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<input name="productOrderListA[#index].qualityManager.id" type="hidden" value="<s:property value='qualityManager.id'/>"  readonly="readonly">
								<input name="productOrderListA[#index].qualityManager.name" type="text" value="<s:property value='qualityManager.name'/>"  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
								<a title="人员选择" height="410" width="510"
									href="../system/user!findUser.action" target="dialog"
									rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td>
								<select name="productOrderListA[#index].currentState"  style="margin-left:5%;">
									<option value="<s:property value='currentState'/>" selected hidden><s:property value='currentState'/></option>
									<option value="未开始">未开始</option>
									<option value="产品设计">产品设计</option>
									<option value="生产准备">生产准备</option>
									<option value="产品装调">产品装调</option>
									<option value="测试试验">测试试验</option>
									<option value="待交付">待交付</option>
									<option value=""></option>
								</select>
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].controlMeasure" value="<s:property value='controlMeasure'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].qualityState" value="<s:property value='qualityState'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].riskProj" value="<s:property value='riskProj'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].valiProj" value="<s:property value='valiProj'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].enginSeperateState" value="<s:property value='enginSeperateState'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<select name="productOrderListA[#index].researchMode"  style="margin-left:5%;">
									<option value="<s:property value='researchMode'/>" selected hidden><s:property value='researchMode'/></option>
									<option value="自研">自研</option>
									<option value="外购">外购</option>
									<option value="生产外协">生产外协</option>
								</select>
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].orderNum" value="<s:property value='orderNum'/>" class="digits" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].produceNum" value="<s:property value='produceNum'/>" class="digits" style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<s:if test='parentProductOrder==null'>
									<input type="text" name="productOrderListA[#index].parentProdName" value='<s:property value="parentProdName"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
								</s:if>
								<s:else>
									<s:property value="parentProductOrder.name"/>
								</s:else>
							</td>
							<td>
								<s:if test='parentProductOrder==null'>
									<input type="text" name="productOrderListA[#index].parentProdCode" value='<s:property value="parentProdCode"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
								</s:if>
								<s:else>
									<s:property value="parentProductOrder.code"/>
								</s:else>
							</td>
							<td>
								<s:if test='parentProductOrder==null'>
									<input type="text" name="productOrderListA[#index].parentSelProdCode" value='<s:property value="parentSelProdCode"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
								</s:if>
								<s:else>
									<s:property value="parentProductOrder.selProdCode"/>
								</s:else>
							</td>
							<td>
								<select name="productOrderListA[#index].taskSource"  style="margin-left:5%;">
									<option value="<s:property value='taskSource'/>" selected hidden><s:property value='taskSource'/></option>
									<option value="宇航型号">宇航型号</option>
									<option value="宇航能力">宇航能力</option>
									<option value="研发">研发</option>
									<option value="横向">横向</option>
									<option value="所间配套">所间配套</option>
									<option value="所内配套">所内配套</option>
								</select>
							</td>
							<td>
								<select name="productOrderListA[#index].selectType"  style="margin-left:5%;">
									<option value="<s:property value='selectType'/>" selected hidden><s:property value='selectType'/></option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</td>
							<td>
								<select name="productOrderListA[#index].phase"  style="margin-left:5%;" class="phase">
									<option value="<s:property value='phase'/>" selected hidden><s:property value='phase'/></option>
									<option value="M">M</option>
									<option value="C">C</option>
									<option value="C-J">C-J</option>
									<option value="Z">Z</option>
									<option value="Z1">Z1</option>
								</select>
							</td>
							<td>
								<select name="productOrderListA[#index].classification"  style="margin-left:5%;">
									<option value="<s:property value='classification'/>" selected hidden><s:property value='classification'/></option>
									<option value="普通电源">普通电源</option>
									<option value="模块">模块</option>
									<option value="微波有源整机">微波有源整机</option>
									<option value="微波有源组件">微波有源组件</option>
									<option value="固态功率放大器">固态功率放大器</option>
									<option value="行波管放大器">行波管放大器</option>
									<option value="普通无源">普通无源</option>
									<option value="输入多工器">输入多工器</option>
									<option value="输出多工器">输出多工器</option>
									<option value="无源组件">无源组件</option>
									<option value="微波开关">微波开关</option>
									<option value="元器件">元器件</option>
								</select>
							</td>
							<td>
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
								<select name="productOrderListA[#index].responsibleDept"  style="margin-left:5%;" class="responsibleDept">
									<option value="<s:property value='responsibleDept'/>" selected hidden><s:property value='responsibleDept'/></option>
									<option value="微波有源事业部">微波有源事业部</option>
									<option value="微波无源事业部">微波无源事业部</option>
									<option value="微波功率部件事业部">微波功率部件事业部</option>
								</select>
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].userUnit" value='<s:property value="userUnit"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].userUnitPIC" value='<s:property value="userUnitPIC"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].outsourceUnit" value="<s:property value='outsourceUnit'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
							<td>
								<input type="text" name="productOrderListA[#index].outsourceUnitPIC" value="<s:property value='outsourceUnitPIC'/>"  style="width:96%;background-color:#F0F0F0;text-align:center;">
							</td>
						</tr>
					</s:iterator>
				 </tbody>
			</table>
			<table id="child" border="0" width="150%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
				<thead>
					<tr align="center" style="background-color:#E4F0FC;">
						<!-- <th width="100">设备名称+设备代号</th> -->
						<th width="50">所属<br/>项目</th>
						<th width="80">隶属<br/>设备名称</th>
						<th width="80">隶属<br/>设备代号</th>
						<th width="80">隶属<br/>图纸代号</th>
						<th>
							<table class="edit_table" align="center" style="table-layout:fixed;margin:-9px auto;margin-left:-9px;margin-right:-9px;">
								<tr align="center">
									<td width="80">研制<br/>阶段</td>
									<td width="100">用户部门</td>
									<td width="100">用户部门<br/>责任人</td>
									<td width="100">任务来源</td>
									<td width="100">设备名称</td>
									<td width="100">图纸代号</td>
									<td width="100">频点信息</td>
									<td width="50">订单<br/>数量</td>
									<td width="100">研制<br/>模式</td>
									<td width="100">专业分类</td>
									<td width="100">产品种类</td>
									<td width="100">是否<br/>新研</td>
									<td width="100">责任部门</td>
									<td width="100">自研<br/>设计师</td>
									<td width="100">生产厂家/<br/>外协单位</td>
									<td width="100">外协<br/>设计师</td>
									<td width="100">订单<br/>管理人员</td>
									<td width="50">操作</td>
								</tr>
							</table>
						</th>
					</tr>
				</thead>
				<tbody class="tbody" style="align:center">
					<s:iterator value="list" status="st" var="stv">
						<tr target="id" rel="<s:property value="id"/>" align="center">
							<td><s:property value="libCode"/></td>
							<td><s:property value="name"/></td>
							<td><s:property value="code"/></td>
							<td><s:property value="selProdCode"/></td>
							<td>
								<table class="edit_table" align="center" style="table-layout:fixed;margin:-10px auto;margin-left:-9px;margin-right:-9px;">
									<s:iterator value="childProductOrderSet" status="st2" var="stv2">
										<tr target="id" rel='<s:property value="id"/>' class="modifyTr" align="center">
											<input type="hidden" name="productOrderListA[#index].id" value="<s:property value='id'/>"  readonly="readonly">
											<td width="80">
												<select name="productOrderListA[#index].phase"  style="margin-left:5%;">
													<option value='<s:property value="phase"/>' selected hidden><s:property value='phase'/></option>
													<option value="M" <s:if test="'M' == productOrder.phase">selected='selected'</s:if>>M</option>
													<option value="C" <s:if test="'C' == productOrder.phase">selected='selected'</s:if>>C</option>
													<option value="C-J" <s:if test="'C-J' == productOrder.phase">selected='selected'</s:if>>C-J</option>
													<option value="Z" <s:if test="'Z' == productOrder.phase">selected='selected'</s:if>>Z</option>
													<option value="Z1" <s:if test="'Z1' == productOrder.phase">selected='selected'</s:if>>Z1</option>
												</select>
											</td>
											<td width="100">
												<select name="productOrderListA[#index].userUnit"  style="margin-left:5%;">
													<option value='<s:property value="userUnit"/>' selected hidden><s:property value='userUnit'/></option>
													<option value="微波有源事业部">微波有源事业部</option>
													<option value="微波无源事业部">微波无源事业部</option>
													<option value="微波功率部件事业部">微波功率部件事业部</option>
												</select>
											</td>
											<td width="100">
												<input type="text" name="productOrderListA[#index].userUnitPIC" value='<s:property value="userUnitPIC"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
											</td>
											<td width="100">
												<input type="text" name="productOrderListA[#index].taskSource" value='<s:property value="taskSource"/>'  readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;">
											</td>
											<td width="100">
												<input type="text" name="productOrderListA[#index].name" value='<s:property value="name"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;">
											</td>
											<td width="100"><input type="text" name="productOrderListA[#index].selProdCode" value='<s:property value="selProdCode"/>' class="required childSelProdCode" style="width:96%;background-color:#F0F0F0;"/></td>
											<td width="100"><input type="text" name="productOrderListA[#index].freqInfo" value='<s:property value="freqInfo"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
											<td width="50"><input type="text" name="productOrderListA[#index].orderNum" value='<s:property value="orderNum"/>' class="digits" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
											<td width="100">
												<select name="productOrderListA[#index].researchMode" class="researchMode" style="margin-left:5%;">
													<option value="<s:property value='researchMode'/>" selected hidden><s:property value='researchMode'/></option>
													<option value="自研">自研</option>
													<option value="外购">外购</option>
													<option value="生产外协">生产外协</option>
												</select>
											</td>
											<td width="100">
												<select name="productOrderListA[#index].classification" class="classification" style="margin-left:5%;">
													<option value="<s:property value='classification'/>" selected hidden><s:property value='classification'/></option>
													<option value="模块">模块</option>
													<option value="元器件">元器件</option>
												</select>
											</td>
											<td width="100" class="category">
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
											<td width="100">
												<select name="productOrderListA[#index].isNewResearch"  style="margin-left:5%;">
													<option value="<s:property value='isNewResearch'/>" selected hidden><s:property value='isNewResearch'/></option>
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</td>
											<td width="100">
												<select name="productOrderListA[#index].responsibleDept"  style="margin-left:5%;">
													<option value="<s:property value='responsibleDept'/>" selected hidden><s:property value='responsibleDept'/></option>
													<option value="微波有源事业部">微波有源事业部</option>
													<option value="微波无源事业部">微波无源事业部</option>
													<option value="微波功率部件事业部">微波功率部件事业部</option>
												</select>
											</td>
											<td width="100">
												<input type="hidden" name="productOrderListA[#index].singleHead.id" value='<s:property value="singleHead.id"/>'  readonly="readonly" >
												<input type="text" name="productOrderListA[#index].singleHead.name" value='<s:property value="singleHead.name"/>'  readonly="readonly" onclick="$(this).next().click()" style="width:96%;background-color:#F0F0F0;text-align:center;">
												<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
													href="../system/user!findUser.action" target="dialog"
													rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
												</a>
											</td>
											<td width="100"><input type="text" name="productOrderListA[#index].outsourceUnit" value='<s:property value="outsourceUnit"/>' class="outsourceUnit" style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
											<td width="100"><input type="text" name="productOrderListA[#index].outsourceUnitPIC" value='<s:property value="outsourceUnitPIC"/>'  style="width:96%;background-color:#F0F0F0;text-align:center;"/></td>
											<td width="100">
												<input type="hidden" name="productOrderListA[#index].designPlanManager.id" value='<s:property value="designPlanManager.id"/>' class="designPlanManagerId" readonly="readonly">
												<input type="text" name="productOrderListA[#index].designPlanManager.name" value='<s:property value="designPlanManager.name"/>' class="designPlanManagerName" readonly="readonly" style="width:96%;background-color:#F0F0F0;text-align:center;" onclick="$(this).next().click()">
												<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
													href="../system/user!findUser.action" target="dialog"
													rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
												</a>
											</td>
											<td width="50" align="center"><a class="delBtn" href="###" style="color:red;">删除</a></td>
										</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
					</s:iterator>
				 </tbody>
			</table>
		</div>
		<div class="formBar" style="text-align center;">
			<ul style="">
				<li class="edit" style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">保存</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>			
		</div>
	</form>
</div>
