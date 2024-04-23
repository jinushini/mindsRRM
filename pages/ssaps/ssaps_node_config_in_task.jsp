<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>


<script type="text/javascript">
	jn(function(){
		sort();
		
		for (var i=0; i < $(".option").length; i++) {
			if($(".option").eq(i).text()=="图纸检查单"){
				var val = $(".option").eq(i).val();
				$(".option").eq(i).replaceWith("<option value='"+val+";checklistType=ssa_pcb' class='option relate'>PCB图纸检查单</option>"
						+"<option value='"+val+";checklistType=ssa_transit_plate' class='option relate'>MIC（过渡片）图纸检查单</option>"
						+"<option value='"+val+";checklistType=ssa_mic' class='option relate'>MIC图纸检查单</option>"
						+"<option value='"+val+";checklistType=ssa_wmd_borrow' class='option relate'>固放整机图纸检查单</option>"); 
			}
			if(jd(".option").eq(i).text()=="评审检查单"){
				var val = jd(".option").eq(i).val();
				jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=ssa_review' class='option relate'>固放设计评审检查单</option>"
						+ "<option value='"+val+";checklistType=ssa_design_input' class='option relate'>固放设计输入检查单</option>");
	
			}
			if(jd(".option").eq(i).text()=="微波所产品交验自查表"){
				var val = jd(".option").eq(i).val();
				jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=microwave_pdase' class='option relate'>微波所产品交验自查表</option>");
			}
			if(jd(".option").eq(i).text()=="微波所单机交付数据包审查记录表"){
				var val = jd(".option").eq(i).val();
				jd(".option").eq(i).replaceWith("<option value='"+val+";checklistType=microwave_sdadp' class='option relate'>微波所单机交付数据包审查记录表</option>");
			}
		}
	})
	
	//添加按钮
	$(".addBtn").click(function(){
		//新一行(新加一行)
		var $newTr=jd(".tbody .modelTr").clone();
		$newTr.removeAttr("style");
		$newTr.attr("class","newTr");
		$newTr.find("input").val("");
		//新增行默认当前日期为开始时间
		$newTr.find(".startDate").val(Format(new Date(),"yyyy-MM-dd"));
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		if(jd(".selected").length!=0 && jd(".selected").nextAll().filter(".modifyTr").length!=0){
			$newTr.insertBefore(jd(".selected").nextAll().filter(".modifyTr").eq(0));
		}else{
			jd(".tbody").append($newTr);
		}
		
		sort();
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)，它的流程模板下拉框值改变时触发事件
		jd("[name='subFlowList[#index].deployementId']").unbind("change").bind("change", function(){
			$thisTr = jd(this).parent().parent();
			$flowName = $thisTr.find("[name='subFlowList[#index].flowName']");
			if(jd(this).find("option:selected").hasClass("relate")){
				$flowName.val(jd(this).find("option:selected").text());
			}else{
				$flowName.val("");
			}
			//将$flowName单元格内容全部选中
			$flowName.select();
			
			
			$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../fextends/flowModel!QueryFlowModelByDeploymentId.action",
				data:{
					deploymentId:jd(this).val().split(';')[0]
				}, 
				success : function(data, statusText) {
					var coinSet = "";
					for(var i=0;i<data.flowModel.flowModelNodes.length;i++){
						var flowModelNode = data.flowModel.flowModelNodes[i];
						var nodeCoin = flowModelNode.nodeCoin==null ? "" : flowModelNode.nodeCoin;
						coinSet = coinSet + "<div style='width:100%;'>"
											+ "<input type='hidden' name='subFlowList[#index].coinList[#seq].parentNodeId' value='" + flowModelNode.nodesId + "' />"
											+ "<input type='hidden' name='subFlowList[#index].coinList[#seq].parentNodeName' value='" + flowModelNode.nodesName + "' />"
						  					+ "<label style='text-align:right;float:left;font-size:14px;width:60%;'>" + flowModelNode.nodesName + ":</label>"
						  					+ "<input type='text' name='subFlowList[#index].coinList[#seq].quantity' value='" + nodeCoin + "' style='text-align:left;float:left;height:14px;width:20%;border:1px solid #ccc;'/><br/>"
							              + "</div>";
					}
					var $coinSet = $(coinSet);
					$coinSet.initUI();
					$thisTr.find(".coinSet").html($coinSet);

				}
			});
			
			//阻止事件冒泡
			event.stopPropagation();
		})
		
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)在进行删除时，直接删除该行
		$newTr.find(".delBtn").click(function(){
			$(this).parent().parent().remove();
			sort();
			//阻止事件冒泡
			event.stopPropagation();
		});
		
	});

	//在没有点击“新增一行”之前的行，即原本存在的“展示行”在删除时，先让用户确认是否删除
	$(".delBtn").click(function(){	
		var $tr = $(this).parent().parent();
		var subFlowId = $(this).parent().find("input[type='hidden']").val();
		alertMsg.confirm("确认删除", {
			okCall: function(){
				$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : "../ssaps/ssapsConfig!deleteSubprocess.action",
					data:{
						subFlowId:subFlowId
					}, 
					success : function(data, statusText) {
						alertMsg.correct(data.message);	
						navTab.reload();
						//删除当前行数据
						$tr.remove();
						sort();
					}
				});
			 },
			 cancelCall : function() {}
		});
	});
	
	//提交按钮
	$("[type=submit]").click(function() {
		
		//给新增的“输入行”数据加name
		var $newTrs = $(".tbody").find(".newTr");
		addNames($newTrs);
		
		//给修改的“展示行”数据加name
		var $modifyTrs = $(".tbody").find(".modifyTr");
		addNames($modifyTrs);
	});
	
	function addNames($Trs){
		for(var i = 0; i < $Trs.length; i++){
			var $thisTr = $Trs.eq(i);
			var $input = $thisTr.find("input");
			var $select = $thisTr.find("select");
			
			//input加行号
			for(var j=0;j<$input.length;j++){
				if($input.eq(j).attr("name")!=null){
					$input.eq(j).attr("name", $input.eq(j).attr("name").replace("#index", i));
				}
			}
			//select加行号
			for(var j=0;j< $select.length;j++){
				if($select.eq(j).attr("name")!=null){
					$select.eq(j).attr("name", $select.eq(j).attr("name").replace("#index", i));
				}
			}
			//每行的节点金币集合加编号
			for(var j=0;j<$thisTr.find(".coinSet div").length;j++){
				$thisInputs = $thisTr.find(".coinSet div").eq(j).find("input");
				for(var z=0;z<$thisInputs.length;z++){
					$thisInputs.eq(z).attr("name", $thisInputs.eq(z).attr("name").replace("#seq",j));
				}
			}
		}
	}
	
	//对节点编辑dialog中的表格序号进行自动排序并赋值
	function sort(){
		for(var i=1;i<jd(".tbody tr").length;i++){
			jd(".tbody tr").eq(i).find(".num div").text(i);
			jd(".tbody tr").eq(i).find(".num input").val(i);
		}
	}
	
</script>

<div class="pageContent">
	<form action="../ssaps/ssapsConfig!modifySuperFlowNodeConfig.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
	  		<input type="hidden" name=parentNodeId value="<s:property value="parentNodeId"/>">
	  		<input type="hidden" name="mark" value="<s:property value="mark"/>">
			<br/>
			<fieldset>
				<legend>
					<s:property value="ssapsNode.nodesName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="addBtn" href="###" style="color : green;" title="尝试选中一行后再点击">增加一行</a>
				</legend>
				<table class="list_table list" width="100%" style="table-layout:fixed;" >
					<thead>
						<tr>
							<th width="3%">序号</th>
							<th width="3%">状态</th>
							<th width="10%">任务模板</th>
							<th width="20%">任务命名</th>
							<th width="5%">自启动</th>
							<th width="10%">责任人</th>
							<th width="8%">开始时间</th>
							<th width="8%">结束时间</th>
							<th width="5%">工时/天</th>
							<th width="3%">操作</th>
							<th width="12%">节点金币</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<tr class="modelTr" style="display:none;">
							<td align="center" class="num">
								<div style="font-size:15px;margin:8px auto;" ></div>
								<input type="hidden" name="subFlowList[#index].num" />
							</td>
							<td align='center' style='color:red;font-size:30px'>●</td>
							<td>
								<select name="subFlowList[#index].deployementId" style="width:90%;line-hight:30px;">
									<option value="">----子流程模型----</option>
									<s:iterator value="checkboxDataList" status="st">
										<option value="<s:property value="key"/>" class="option"><s:property value="value"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center"><input name="subFlowList[#index].flowName" style="width:90%;border:0;font-size:15px;text-align:center;"></td>
							<td align="center">
								<select name="subFlowList[#index].autoStart" style="width:90%;text-align:center;">
									<option value="是">是</option>
									<option value="否">否</option>							
								</select>
							</td>
							<td align="center">
								<input name="subFlowList[#index].responsibleId" type="hidden">
								<input name="subFlowList[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly" style="width:98%;border:0;font-size:15px;text-align:center;">
								<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false">
								</a>
							</td>
							<td align="center"><input class="startDate" name="subFlowList[#index].scheduleDate.planBeginDate" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).val())-Date.parse($(this).parent().parent().find('.endDate').val()))/1000/60/60/24+1);$(this).parent().parent().find('.endDate').focus();} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							<td align="center"><input class="endDate" name="subFlowList[#index].scheduleDate.planEndDate" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
							<td align="center"><input class="dates" name="subFlowList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;" ></td>
							<td align="center">
								<a class="delBtn" href="###" style="color : red;">删除</a>
							</td>
							<td class="coinSet" style="padding:5px 3px;"></td>
						</tr>
						<s:iterator value="list" status="st" var="a">
							<tr class="modifyTr">
								<td align="center" class="num">
									<div style="font-size:15px;" ></div>
									<input type="hidden" name="nodesDataList[#index].num" />
								</td>
								<td align="center" style="font-size:30px; color:<s:if test='status == 3'>green</s:if><s:elseif test='status == 0'>gray</s:elseif><s:elseif test='status == 5'>red</s:elseif><s:else>orange</s:else>;">
									<s:property value="status == 0 ? '●' : '●'"/>
								</td>
								<td align="center" style="display: none;"><input type="text" name="nodesDataList[#index].subFlowId" value="<s:property value="id"/>"></td>
								<td align="center"><s:property value="flowDefName"/></td>
								<s:if test="status==5">
									<td align="center"><input type="text" name="nodesDataList[#index].flowName" value="<s:property value='flowName'/>" style="width:99%;border:0;font-size:15px;text-align:center;"></td>
									<td align="center"><s:property value='autoStart'/></td>
									<td align="center">
										<input name="nodesDataList[#index].responsibleId" type="hidden" value="<s:property value="responsibleId"/>">
										<input name="nodesDataList[#index].responsibleName" type="text" onclick="$(this).next().click()" readonly="readonly" value="<s:property value="responsibleName"/>" style="width:98%;border:0;text-align:center;">
										<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"></a>
									</td>
								</s:if>
								<s:else>
									<td align="center"><s:property value="flowName"/></td>
									<td align="center"><s:property value='autoStart'/></td>
									<td align="center">
										<s:property value="responsibleName"/>
									</td>
								</s:else>
								<td align="center"><input class="startDate" name="nodesDataList[#index].scheduleDate.planBeginDate" value="<s:date name='scheduleDate.planBeginDate' format='yyyy-MM-dd'/>" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).val())-Date.parse($(this).parent().parent().find('.endDate').val()))/1000/60/60/24+1);$(this).parent().parent().find('.endDate').focus();} })" style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								<td align="center"><input class="endDate" name="nodesDataList[#index].scheduleDate.planEndDate" value="<s:date name='scheduleDate.planEndDate' format='yyyy-MM-dd'/>" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.dates').val(Math.abs(Date.parse($(this).parent().parent().find('.startDate').val())-Date.parse($(this).val()))/1000/60/60/24+1);$(this).blur();} }) " style="width:98%;border:0;font-size:15px;text-align:center;"/></td>
								<td align="center"><input class="dates"  name="nodesDataList[#index].scheduleDate.manHours" value='<s:property value="scheduleDate.manHours"/>' style="width:98%;border:0;font-size:15px;text-align:center;"></td>
								<s:if test="status==5">
									<td align="center">
										<input type="hidden" value="<s:property value="id"/>"/>				
										<a class="delBtn" href="###" style="color : red;">删除</a>
									</td>
									<td class="coinSet" style="padding:5px 3px;">
										<s:iterator value="coinSet" >
											<div style="font-size:15px;width:100%">
												<input type="hidden" name="nodesDataList[#index].coinList[#seq].parentNodeName" value="<s:property value="parentNodeName" />" />
												<label style="text-align:right;float:left;font-size:14px;width:60%;"><s:property value="parentNodeName" />:</label>
												<input type="text" name="nodesDataList[#index].coinList[#seq].quantity" value="<s:property value='quantity'/>" style="text-align:left;float:left;height:14px;width:20%;border:1px solid #ccc;"/>	<br/>
											</div>
										</s:iterator>
									</td>
								</s:if>
								<s:else>
									<td align="center"></td>
									<td style="padding:5px 3px;">
										<s:iterator value="coinSet">
											<div style="width:100%;">
												<span style="text-align:right;float:left;font-size:14px;width:70%;"><s:property value="parentNodeName" />:</span>
												<span style="text-align:left;float:left;font-size:14px;"><s:property value='quantity'/></span>
											</div>
										</s:iterator>
									</td>
								</s:else>
								
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

