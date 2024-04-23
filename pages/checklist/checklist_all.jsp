<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	
	jn("#newBuild").change(function(){
		switch(jn("#newBuild").val()){
			case '新建检查单':
				break;
			case 'ssa_pcb':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_pcb";
				navTab.openTab("", url, { title:"PCB图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_transit_plate':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_transit_plate";
				navTab.openTab("", url, { title:"MIC（过渡片）图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_mic':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_mic";
				navTab.openTab("", url, { title:"MIC图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_wmd':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_wmd_borrow";
				navTab.openTab("", url, { title:"固放整机图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_review";
				navTab.openTab("", url, { title:"固放设计评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_design_input':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_design_input";
				navTab.openTab("", url, { title:"固放设计输入检查单", fresh:false, data:{} });
				break;
			case 'microwave_sdadp':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=microwave_sdadp";
				navTab.openTab("", url, { title:"微波所单机交付数据包审查记录表", fresh:false, data:{} });
				break;
			case 'microwave_pdase':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=microwave_pdase";
				navTab.openTab("", url, { title:"微波所产品交验自查表", fresh:false, data:{} });
				break;
			case 'alter_inform':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=alter_inform";
				navTab.openTab("", url, { title:"变更通知单", fresh:false, data:{} });
				break;
			case 'ssa_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_design_check";
				navTab.openTab("", url, { title:"整机设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_integration_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_integration_design_check";
				navTab.openTab("", url, { title:"有源技术印制板电路（有集成件）设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_nointegration_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_nointegration_design_check";
				navTab.openTab("", url, { title:"有源技术印制板电路（无集成件）设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_mmic_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_mmic_design_check";
				navTab.openTab("", url, { title:"有源技术MMIC模块电路设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_mic_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_mic_design_check";
				navTab.openTab("", url, { title:"有源技术MIC电路设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_transit_design_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_transit_design_check";
				navTab.openTab("", url, { title:"有源技术MIC电路（过度线）设计图纸复核检查单", fresh:false, data:{} });
				break;
			case 'ssa_plan_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_plan_review";
				navTab.openTab("", url, { title:"方案评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_rate_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_rate_review";
				navTab.openTab("", url, { title:"频率源模块类产品所内评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_microwave_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_microwave_review";
				navTab.openTab("", url, { title:"微波模块类产品所内评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_wave_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_wave_review";
				navTab.openTab("", url, { title:"行波管放大器所内评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_product_new_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_product_new_review";
				navTab.openTab("", url, { title:"微波有源产品所内评审检查单(新研)", fresh:false, data:{} });
				break;
			case 'ssa_product_old_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_product_old_review";
				navTab.openTab("", url, { title:"微波有源产品所内评审检查单(转阶段及借用)", fresh:false, data:{} });
				break;
			case 'ssa_change_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_change_review";
				navTab.openTab("", url, { title:"无缘产品转阶段或借用单机评审检查单", fresh:false, data:{} });
				break;
			case 'ssa_product_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_product_review";
				navTab.openTab("", url, { title:"混合桥,耦合器设计评审检查单 ", fresh:false, data:{} });
				break;
			case 'ssa_map_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_map_review";
				navTab.openTab("", url, { title:"无源单机图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_absorber_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_absorber_review";
				navTab.openTab("", url, { title:"同轴带通滤波器设计检查单", fresh:false, data:{} });
				break;
			case 'ssa_external_build':
				jn("#newBuild").val("新建申请单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_absorber_review";
				navTab.openTab("", url, { title:"同轴带通滤波器设计检查单", fresh:false, data:{} });
				break;
			case 'ssa_external':
				jn("#newBuild").val("新建申请单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_external";
				navTab.openTab("", url, { title:"微波所外协任务申请单", fresh:false, data:{} });
				break;
			case 'ssa_absorber_design_check':
				jn("#newBuild").val("新建申请单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_absorber_design_check";
				navTab.openTab("", url, { title:"圆腔双模滤波器，多工器设计检查单", fresh:false, data:{} });
				break;
			case 'ssa_lowpowresecure_check':
				jn("#newBuild").val("新建申请单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_lowpowresecure_check";
				navTab.openTab("", url, { title:"低压电源供电安全性检查单", fresh:false, data:{} });
				break;
			case 'ssa_powermap_review':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_powermap_review_borrow";
				navTab.openTab("", url, { title:"电源图纸设计审核检查单", fresh:false, data:{} });
				break;
			case 'ssa_powermap_review_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_powermap_review_check_borrow";
				navTab.openTab("", url, { title:"电源图纸设计校对检查单", fresh:false, data:{} });
				break;
			case 'ssa_epc_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_epc_check";
				navTab.openTab("", url, { title:"EPC设计图纸检查单", fresh:false, data:{} });
				break;
			case 'ssa_twta_reviewcheck':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_twta_reviewcheck";
				navTab.openTab("", url, { title:"行波管放大器设计评审检查单", fresh:false, data:{} });
				break;		
			case 'ssa_powermap_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_powermap_check";
				navTab.openTab("", url, { title:"电源图纸校对-审核检查单", fresh:false, data:{} });
				break;
			case 'ssa_ltcc':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_ltcc";
				navTab.openTab("", url, { title:"LTCC基板图纸检查单", fresh:false, data:{} });
				break;	
			case 'ssa_mcm':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_mcm";
				navTab.openTab("", url, { title:"射频MCM模块图纸检查单", fresh:false, data:{} });
				break;	
			case 'ssa_frequency':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_frequency";
				navTab.openTab("", url, { title:"频率源模块图纸检查单A", fresh:false, data:{} });
				break;	
			case 'ssa_frequencyB':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_frequencyB";
				navTab.openTab("", url, { title:"频率源模块图纸检查单B", fresh:false, data:{} });
				break;	
			case 'ssa_mcm_check':	
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_mcm_check";
				navTab.openTab("", url, { title:"固放MCM图纸检查单", fresh:false, data:{} });
				break;		
			case 'ssa_single_check':
				jn("#newBuild").val("新建检查单");
				var url="../checklist/checklist!checklistBuildInput.action?checklistType=ssa_single_check";
				navTab.openTab("", url, { title:"固放单机图纸检查单", fresh:false, data:{} });
				break;		
			default:
				alert("error");	
				break;
		}
	})
	
	jn("#changePage").change(function(){
		switch(jn("#changePage").val()){
			case 'stopedChecklist':
				var url="../checklist/checklist!showStopedChecklist.action";
				navTab.loadUrl(url);
				break;
			case 'allChecklist':
				var url="../checklist/checklist!showAllChecklist.action";
				navTab.loadUrl(url);
				break;
			default:
				alert("error");	
				break;
		}
	})
	
	jn("tbody tr").dblclick(function(){
		$(this).find(".details").click();
	})
	jn("#stop").click(function(){
		if(jn("table .selected").length == 0){
			alertMsg.error("请选择信息！");
		}else{
			var processInstId = jn("table .selected").attr("rel");
			$.ajax({
				global : false, //(默认: true) 是否触发全局 AJAX 事件
				url : "../checklist/checklistAppr!verifyBeforeStopChecklist.action", //发送请求的地址
				data : {
					processInstId : processInstId
				},//发送到服务器的请求参数
				type : "POST", //请求方式：post或get
				dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
				success : function(data, statusText) {
					if(data != null){
						alertMsg.error(data);
					}else{
						alertMsg.confirm("确定要终止吗", {
				 			okCall: function(){
				 				$.ajax({
									global : false, //(默认: true) 是否触发全局 AJAX 事件
									url : "../checklist/checklistAppr!stopChecklist.action", //发送请求的地址
									data : {
										processInstId : processInstId
									},//发送到服务器的请求参数
									type : "POST", //请求方式：post或get
									dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
									success : function(data, statusText) {
										navTab.reload();
										alertMsg.correct("删除成功");
									}
								});
							 },
						 cancelCall : function() {}
						});
					}
				}
			});
		}
	})
	jn("#delete").click(function(){
		if(jn("table .selected").length == 0){
			alertMsg.error("请选择信息！");
		}else{
			var processInstId = jn("table .selected").attr("rel");
			$.ajax({
				global : false, //(默认: true) 是否触发全局 AJAX 事件
				url : "../checklist/checklistAppr!deleteChecklist.action", //发送请求的地址
				data : {
					processInstId : processInstId
				},//发送到服务器的请求参数
				type : "POST", //请求方式：post或get
				dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
				success : function(data, statusText) {
					navTab.reload();
					alertMsg.correct("删除成功");
				}
			});
		}
	})
</script>
<div class="pageHeader">
<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						型号代号：<input type="text" name="paramMap['m.modelCode like']" value="<s:property value="paramMap['m.modelCode like']"/>" />
						产品名称：<input type="text" name="paramMap['m.productName like']" value="<s:property value="paramMap['m.productName like']"/>" />
						产品代号：<input type="text" name="paramMap['m.productCode like']" value="<s:property value="paramMap['m.productCode like']"/>" />
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
		<ul class="toolBar" >
			
			<li style="margin-right:5px;">
				<select style="width:120px;" id="changePage">
					<option value="allChecklist" selected>所有检查单</option>
					<option value="stopedChecklist">已终止检查单</option>
				</select>
			</li>
			
			<li style="margin-right:5px;">
				<select style="width:200px;" id="newBuild">
					<option value="新建检查单">———— 新建检查单 ————1</option>
					<option value="ssa_pcb">PCB图纸检查单</option>
					<option value="ssa_transit_plate">MIC（过渡片）图纸检查单</option>
					<option value="ssa_mic">MIC图纸检查单</option>
					<option value="ssa_wmd">固放整机图纸检查单</option>
					<option value="ssa_review">固放设计评审检查单</option>
					<option value="ssa_design_input">固放设计输入检查单</option>
					<option value="microwave_sdadp">微波所单机交付数据包审查记录表</option>
					<option value="microwave_pdase">微波所产品交验自查表</option>
					<option value="alter_inform">变更通知单</option>
					<option value="ssa_design_check">有源整机设计图纸复核检查单</option>
					<option value="ssa_integration_design_check">有源技术印制板电路（有集成件）设计图纸复核检查</option>
					<option value="ssa_nointegration_design_check">有源技术印制板电路（无集成件）设计图纸复核检查单</option>
<!-- 					<option value="ssa_mmic_design_check">有源技术MMIC模块电路设计图纸复核检查单</option>	
					<option value="ssa_mic_design_check">有源技术MIC电路设计图纸复核检查单</option>
					<option value="ssa_transit_design_check">有源技术MIC电路（过度线）设计图纸复核检查单</option> -->
					<option value="ssa_plan_review">方案评审检查单</option>
					<option value="ssa_microwave_review">微波模块类产品所内评审检查单</option>
					<option value="ssa_rate_review">频率源模块类产品所内评审检查单</option>
					<option value="ssa_wave_review">行波管放大器所内评审检查单</option>
					<option value="ssa_product_new_review">微波有源产品所内评审检查单(新研)</option>
					<option value="ssa_product_old_review">微波有源产品所内评审检查单(转阶段及借用)</option>
					<option value="ssa_change_review">无源产品转阶段或借用单机评审检查单</option>
					<option value="ssa_product_review">无源混合桥,耦合器设计评审检查单 </option>
					<option value="ssa_map_review">无源单机图纸检查单</option>
					<option value="ssa_absorber_review">无源同轴带通滤波器设计检查单</option>
					<option value="ssa_external">微波所外协任务申请单</option>
					<option value="ssa_absorber_design_check">圆腔双模滤波器，多工器设计检查单</option>
					<!-- <option value="ssa_lowpowresecure_check">低压电源供电安全性检查单</option>
					<option value="ssa_powermap_review">电源图纸校对审核检查单</option>
					<option value="ssa_powermap_review_check">电源图纸设计校对检查单</option> -->
					<option value="ssa_epc_check">EPC设计图纸检查单</option>
					<option value="ssa_twta_reviewcheck">行波管放大器设计评审检查单</option>
					<option value="ssa_powermap_check">电源图纸校对-审核检查单</option>
					<option value="ssa_ltcc">LTCC基板图纸检查单</option>
					<option value="ssa_mcm">射频MCM模块图纸检查单</option>
					<option value="ssa_frequency">频率源模块图纸检查单</option>
					<option value="ssa_frequencyB">频率源模块图纸检查单B</option>
					<option value="ssa_mcm_check">固放MCM图纸检查单</option>
					<option value="ssa_single_check">固放单机图纸检查单</option>
					
				</select>
			</li>
			<li><div class="buttonActive"><div class="buttonContent"><button id="stop">删除并终止</button></div></div></li>
			<!-- <li><div class="buttonActive"><div class="buttonContent"><button id="delete">完全删除</button></div></div></li> -->
		</ul>
	</div>
	<div >
		<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" >
			<thead>
				<tr>
					<th width="30">状态</th>
					<th width="100">型号代号</th>
					<th width="100">产品名称</th>
					<th width="100">产品代号</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="processInstId" rel="<s:property value="processInstId"/>">
					<td align="center" style="font-size:30px; color:<s:if test='status == 3'>green</s:if><s:elseif test='status == 0'>gray</s:elseif><s:elseif test='status == 5'>red</s:elseif><s:else>orange</s:else>;">
						<s:property value="status == 0 ? '●' : '●'"/>
					</td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="modelCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productName"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><s:property value="productCode"/></td>
					<td align="center"><s:property value="checklistId"/>
						<a href="../checklist/checklistAppr!showChecklist.action?checklistId=<s:property value="id"/>" height="700" width="1100" target="dialog" class="details">详情</a>&nbsp;|
						<a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog">查看</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
