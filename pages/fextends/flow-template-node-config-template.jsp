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
		$newTr.initUI();
		//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
		if(jd(".selected").length!=0 && jd(".selected").nextAll().filter(".modifyTr").length!=0){
			$newTr.insertBefore(jd(".selected").nextAll().filter(".modifyTr").eq(0));
		}else{
			jd(".tbody").append($newTr);
		}
		
		sort();
		
		//在点击过“增加一行”的前提下产生的行(即新增的“输入行”)，它的流程模板下拉框值改变时触发事件
		jd("[name='flowModelNodesDataList[#index].deployementId']").unbind("change").bind("change", function(){
			$thisTr = jd(this).parent().parent();
			$flowName = $thisTr.find("[name='flowModelNodesDataList[#index].flowName']");
			$flowName.val(jd(this).find("option:selected").text());
			//将$flowName单元格内容全部选中
			$flowName.select();
			
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
		var flowTemplatelNodeId = $(this).parent().find("input[type='hidden']").val();
		alertMsg.confirm("确认删除", {
			okCall: function(){
				$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : "../fextends/flowTemplate!deleteSubprocess.action",
					data:{
						flowTemplatelNodeId:flowTemplatelNodeId
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
	<form action="../fextends/flowTemplate!modifyFlowModelNodeConfig.action" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);" >
  		<div class="pageFormContent" layoutH="56">
	  		<input type="hidden" name=flowTemplatelNodeId value="<s:property value="flowTemplatelNodeId"/>">
	  		<input type="hidden" name=flowTemplateId value="<s:property value="flowTemplateId"/>">
	  		<input type="hidden" name="mark" value="<s:property value="mark"/>">
	  		<input type="hidden" name="flowSource" value="flowTemplate">
			<br/>
			<fieldset>
				<legend>
					<s:property value="flowTemplate.flowDefName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="addBtn" href="###" style="color : green;" title="尝试选中一行后再点击">增加一行</a>
				</legend>
				<table class="list_table list" width="100%" style="table-layout:fixed;" >
					<thead>
						<tr>
							<th width="3%">序号</th>
							<th width="10%">流程模板</th>
							<th width="20%">流程命名</th>
							<th width="5%">标准工时（天）</th>
							<th width="5%" hidden="hidden">自启动</th>
							<th width="3%">操作</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<tr class="modelTr" style="display:none;">
							<td align="center" class="num">
								<div style="font-size:15px;margin:8px auto;" ></div>
								<input type="hidden" name="flowModelNodesDataList[#index].num" />
							</td>
							<td>
								<select name="flowModelNodesDataList[#index].deployementId" style="width:90%;line-hight:30px;">
									<option value="">----子流程模型----</option>
									<s:iterator value="checkboxDataList_template" status="st">
										<option value="<s:property value="key"/>" class="option"><s:property value="value"/></option>
									</s:iterator>
								</select>
							</td>
							<td align="center"><input name="flowModelNodesDataList[#index].flowName" style="width:90%;border:0;font-size:15px;text-align:center;"></td>
							<td align="center"><input name="flowModelNodesDataList[#index].standardHours" style="width:90%;border:0;font-size:15px;text-align:center;"></td>
							<td align="center" hidden="hidden">
								<select name="flowModelNodesDataList[#index].autoStart" style="width:90%;text-align:center;">
									<option value="是">是</option>
									<option value="否">否</option>							
								</select>
							</td>
							<td align="center">					
								<a class="delBtn" href="###" style="color : red;">删除</a>
							</td>
						</tr>
						<s:iterator value="list" status="st" var="a">
							<tr class="modifyTr">
								<td align="center" class="num">
									<div style="font-size:15px;" ></div>
									<input type="hidden" name="nodesDataList[#index].num" />
								</td>
								<td align="center" hidden="hidden"><input type="text" name="nodesDataList[#index].flowDefKey" value="<s:property value="flowDefKey"/>"></td>
								<td align="center" hidden="hidden"><input type="text" name="nodesDataList[#index].subFlowId" value="<s:property value="id"/>"></td>
								<td align="center"><s:property value="flowName"/></td>
								<td align="center"><input name="nodesDataList[#index].flowName" value="<s:property value='flowName'/>" style="width:99%;border:0;font-size:15px;text-align:center;"></td>
								<td align="center"><input name="nodesDataList[#index].standardHours" value="<s:property value='standardHours'/>" style="width:99%;border:0;font-size:15px;text-align:center;"></td>
								<td align="center" hidden="hidden">
									<select name="nodesDataList[#index].autoStart" style="width:90%;text-align:center;">
										<option value="是">是</option>						
										<option value="否" <s:if test='autoStart=="否"'>selected</s:if> >否</option>						
									</select>
								</td>
								<td align="center"><input type="hidden" value="<s:property value="id"/>"/><a class="delBtn" style="color : red;">删除</a></td>
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

