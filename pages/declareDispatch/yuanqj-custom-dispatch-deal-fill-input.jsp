<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		jn("[name='declareDispatchDeal.isDeclare']").click(function(){
			if(jn(this).val()=="无"){
				jn(".declarecontent").hide();
			}
			if(jn(this).val()=="有"){
				jn(".declarecontent").show();
			}
		})
		
		//添加按钮
		$(".addBtn").click(function(){
			//新一行(新加一行)
			var $newTr=jn(".tbody .modelTr").clone();
			$newTr.removeAttr("style");
			$newTr.attr("class","newTr");
			/* $newTr.find("input").val(""); */
			$newTr.find("input").attr("class", "required");
			$newTr.initUI();
			//当有选中展示行且该行不是最后一个展示行时，在该行下面的展示行上面插入新的输入行
			jn(".declarecontent .tbody").append($newTr);
			sort();
			
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
			alert("删除功能待开发");
			/* var $tr = $(this).parent().parent();
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
			}); */
		});
		
		//提交按钮
		$("[type=submit]").click(function() {
			var isDeclareVal = jn("[name='declareDispatchDeal.isDeclare']:checked").val();
			//删除模型行，只剩输入行和展示行
			/* jn(".modelTr").remove(); */
			if(isDeclareVal=="有"){
				//如果输入行和展示行总行数为0
				if(jn(".declarecontent tbody tr").length>1){
					//给新增的“输入行”数据加name
					var $newTrs = $(".tbody").find(".newTr");
					addNames($newTrs);
				}else{
					alertMsg.warn("至少有一条申报产品！");
					return false;
				}
			}else{
				jn(".newTr").remove();
			}
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
			for(var i=1;i<jn(".tbody tr").length;i++){
				jn(".tbody tr").eq(i).find(".num div").text(i);
				jn(".tbody tr").eq(i).find(".num input").val(i);
			}
		}
		
	}) 
	
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../declareDispatch/DeclareDispatchDeal_fillCustomYuanqjDispatchDeal.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input name="processInstId" type="hidden" value="<s:property value="processInstId"/>">
	<input name="declareDispatchDeal.id" type="hidden" value="<s:property value="declareDispatchDeal.id"/>">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<div style="font-size:30px;text-align:center;">定制类元器件申报</div>
		<br/>
		<fieldset>
			<legend>父级信息</legend>
			<div style="width:100%;padding:1px 15%;">
				<label style="width: 20%;">产品型号：<s:property value="declareDispatchDeal.productOrder.code"/></label>
				<label style="width: 20%;">产品名称：<s:property value="declareDispatchDeal.productOrder.name"/></label>
				<label style="width: 20%;">主管设计师：<s:property value="declareDispatchDeal.productOrder.singleHead.name"/></label>
			</div>
			
		</fieldset>
		<br/>
		<fieldset>
			<legend>填报内容</legend>
			<table border="0" width="98%" class="edit_table" align="center">
				<tr>
					<td align="center" width="50%">
						<span style="color:#999999;font-size:14px;float:left;margin:7px 15px;">选择管理员:</span>
						<span>
							<input type="hidden" name="declareDispatchDeal.declareItemManager.id" class="required declareItemManagerId">
							<input type="text" name="declareDispatchDeal.declareItemManager.name" class="required declareItemManagerName" readonly="readonly" onclick="$(this).next().click()" style="width:60%;">
							<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</span>
					</td>
					<td align="center" width="50%">
						<input type="radio" value="有" name="declareDispatchDeal.isDeclare" checked>有申报 
						<input type="radio" value="无" name="declareDispatchDeal.isDeclare">无申报
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset class="declarecontent">
			<legend>
				<a class="addBtn" href="###" style="color:green;" title="尝试选中一行后再点击">增加一行</a>
			</legend>
			<table class="list_table list" width="100%" style="table-layout:fixed;" >
				<thead>
					<tr>
						<th width="3%">序号</th>
						<th width="10%">元器件名称</th>
						<th width="10%">型号规格</th>
						<th width="10%">申报等级</th>
						<th width="5%">申报数量</th>
						<th width="5%">生产厂家</th>
						<th width="10%">物资经理</th>
						<th width="5%">操作</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<tr class="modelTr" style="display:none;">
						<td align="center" class="num">
							<div style="font-size:15px;margin:8px auto;" ></div>
							<input type="hidden" name="productDeclareList[#index].num" />
						</td>
						<td align="center">
							<input name="productDeclareList[#index].productOrder.name" style="width:90%;text-align:center;" />
						</td>
						<td align="center"><input name="productDeclareList[#index].productOrder.code" style="width:90%;text-align:center;"/></td>
						<td align="center">
							<select name="productDeclareList[#index].productOrder.componentLevel" style="width:90%;text-align:center;">
								<option value="FM">FM</option>
								<option value="FM-1">FM-1</option>
								<option value="普军级">普军级</option>
								<option value="CAST C">CAST C</option>
								<option value="CAST B">CAST B</option>
								<option value="EM">EM</option>
								<option value="自定义">自定义</option>						
							</select>
						</td>
						<td align="center">
							<input name="productDeclareList[#index].productOrder.demandNum" style="width:90%;text-align:center;" />
						</td>
						<td align="center">
							<select name="productDeclareList[#index].manufacturer" style="width:90%;text-align:center;">
								<option value="13所">13所</option>
								<option value="970">970</option>
								<option value="43所">43所</option>
								<option value="55所">55所</option>
								<option value="海创">海创</option>
								<option value="自定义">自定义</option>						
							</select>
						</td>
						<td align="center">
							<input type="hidden" name="productDeclareList[#index].materialManager.id">
							<input type="text" name="productDeclareList[#index].materialManager.name" readonly="readonly" onclick="$(this).next().click()" style="width:90%;text-align:center;">
							<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
						<td align="center">					
							<a class="delBtn" href="###" style="color : red;">删除</a>
						</td>
					</tr>
					<s:iterator value="declareDetail.childProductOrderSet" status="st" var="a">
						<tr class="displayTr">
							<td align="center" class="num">
								<div style="font-size:15px;" ></div>
								<input type="hidden" name="productDeclare.num" />
							</td>
							<td align="center"><s:property value="name"/></td>
							<td align="center"><s:property value="code"/></td>
							<td align="center"><s:property value="componentLevel"/></td>
							<td align="center"><s:property value="demandNum"/></td>
							<td align="center"><s:property value="productDeclare.manufacturer"/></td>
							<td align="center"><s:property value="productDeclare.materialManager.name"/></td>
							<td align="center">删除</td>
							<%-- <td align="center"><input type="hidden" value="<s:property value="id"/>"/><a class="delBtn" style="color : red;">删除</a></td> --%>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>