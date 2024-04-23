<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	
	//得到行对象
	function getRowObj(obj){
		var i = 0;
		while(obj.tagName.toLowerCase()!= "tr"){
			obj = obj.parentNode;
			if(obj.tagName.toLowerCase()=="table")
				return null;
		}
		return obj;
	}
	
	//根据得到的行对象得到所在的行数
	function getRowNo(obj){
		var trObj = this.getRowObj(obj);//当前行
		var trArr = trObj.parentNode.children;//同行兄弟
		var $trObj = $(trObj);		
		var $trArr = $(trArr);
		var num = 0;
		for (var trNo = 0; trNo < $trArr.length; trNo++) {
			//alert($(trArr[trNo]).attr("parentLevel"));//兄弟的父标签
			if ($trObj.attr("level") == $(trArr[trNo]).attr("parentLevel")) {
				num = num + 1;
				var lastTr = trArr[trNo];//同层兄弟最后一行
				continue;
			}
		}
		var arr= new Array();
		arr[0] = num;
		arr[1] = lastTr;
		return arr;
	}

	//增加行
	function addRow(obj) {
		var $trObj = $(this.getRowObj(obj));//点击增加按钮当前行	
		var $newTr = $trObj.clone();//增加的新行
		$newTr.initUI();
		$newTr.find("input").val("");
		
		var level = $trObj.attr("level");//level=00
		var parentLevel = $trObj.attr("parentLevel");//parentLevel=top		
		
		switch (parentLevel) {
			case "top":
				$newTr.attr("parentLevel", level);//设置新行的父标签
	
				//alert("新增行的父标签：" + $newTr.attr("parentLevel"));
				var arr = getRowNo($trObj.get(0));//当前点击增加按钮的行数						
				var num = arr[0];
				var lastTr = arr[1];
				
				var childLength = $trObj.attr("childlength");				
				childLength = ++ childLength;
				$trObj.attr("childlength",childLength);
				
				/* $newTr.attr("childlength", num);
				var childLength = $newTr.attr("childlength"); */
				
				
				if(childLength < 10){
					$newTr.attr("level", level + "0" + childLength);//设置新行当前标签				
					
					$($newTr[0].cells[0].firstChild).val(level + "0" + childLength);//设置value值
					$($newTr[0].cells[1].firstChild).val("0"+childLength);//设置层级显示value值
					break;
				}else if(childLength >= 10 && childLength < 100){
					$newTr.attr("level", level + childLength);//设置新行当前标签				

					$($newTr[0].cells[0].firstChild).val(level + childLength);//设置value值
					$($newTr[0].cells[1].firstChild).val("0"+childLength);//设置层级显示value值
					break;
				}else{
					alert("待开发");
					return;
				}
				break;
				
			case "00":

				$newTr.attr("parentLevel", level);//设置新行的父标签
				
				//alert("新增行的父标签：" + $newTr.attr("parentLevel"));
				var arr = getRowNo($trObj.get(0));//当前点击增加按钮的行数							
				var num = arr[0];				
				var lastTr = arr[1];

				var parentLength = $trObj.attr("parentLength");				
				parentLength = ++ parentLength;
				$trObj.attr("parentLength",parentLength);
				
				/* $newTr.attr("childlength", num);
				var childLength = $newTr.attr("childlength"); */
				
				if(parentLength < 10){
					$newTr.attr("level", level + "0" + parentLength);//设置新行当前标签	

					$($newTr[0].cells[0].firstChild).val(level + "0" + parentLength);//设置value值
					$($newTr[0].cells[1].firstChild).val("00"+parentLength);//设置层级显示value值
					break;
				}else if(parentLength >= 10 && parentLength < 100){
					$newTr.attr("level", level + parentLength);//设置新行当前标签	

					$($newTr[0].cells[0].firstChild).val(level + parentLength);//设置value值
					$($newTr[0].cells[1].firstChild).val("00"+parentLength);//设置层级显示value值
					break;
				}else{
					alert("待开发");
					return;
				}
				break;
			default:
				alert("待开发");
				return;
			}	
			
			var $lastTr = $(lastTr);//同层兄弟最后一行			
			
			if (lastTr != null) {
				var code = $(lastTr).attr("level");//获取同层兄弟最后一行的level
				var $arrTr = $("table").find("tr[parentLevel = " + code + "]");//获取同层兄弟最后一行的子行
					
				if ($arrTr.length != 0) {//子行不为空
					var toTr = $arrTr[$arrTr.length - 1];//在子行的最后一行插入
					var $toTr = $(toTr);
					$toTr.after($newTr);
				} else {//子行为空
					//增加一行
					$lastTr.after($newTr);
				}					
			} else {
				//增加一行
				$trObj.after($newTr);
		}
	}
	
	//删除行
	function delRow(obj) {
		var trObj = this.getRowObj(obj);
		if (trObj != null) {
			var code = $(trObj).attr("level");//获取指定行的level
			var arrTr = $("table").find("tr[parentLevel = " + code + "]");//获取指定行的子行
			var $arrTr = $(arrTr);
			if ($arrTr.length != 0) {//子行存在
				for (var trNo = 0; trNo < $arrTr.length; trNo++) {
					arrTr[trNo].parentNode.removeChild(arrTr[trNo]);//删除子行
				}
			}
			trObj.parentNode.removeChild(trObj);//删除当前行
		} else {
			alertMsg.error("操作失败！");
		}

	}
	
	//提交前将每一行数据区分开
	$("#okBtn").click(function(){
		var arrTr = $("tr[class='trCode']");
		var $arrTr = $(arrTr);
		var len = $arrTr.length;
		for(var i = 0 ; i < len ; i ++ ){
			var trArr = $(arrTr[i]).find("input");
			var $trArr = $(trArr);
			for(var j = 0 ; j < $trArr.length ; j ++){
				var str = $(trArr[j]).attr("name");
				var text = str.replace("#index",i);
				$(trArr[j]).attr("name",text);
			}			
		}
	});
</script>
<div class="pageContent">
  <form method="post" action="../order/orderAppr!taskDecomposition.action"  class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<input name="taskId" type="hidden" value="<s:property value="taskId"/>">
	<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>">
	
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend>订单分解-------<a href="../order/orderAppr!showOrder.action?taskId=<s:property value="taskId"/>" target="dialog" width="800" height="500" style="color:red; font-size:20px"><s:property value="order.productLib.modelCode"/></a>分解</legend>
			<table class="list_table edit_table" width="98%" style="table-layout:fixed;">
				<thead>
					<tr>
						<th width="" align="center" style="display: none;">树编号</th>
						<th width="3%" align="center">层级</th>
						<th width="80" align="center">产品代号</th>
						<th width="80" align="center">产品名称</th>
						<th width="80" align="center">单机主管</th>
						<th width="30" align="center">数量</th>
						<th width="80" align="center">生产编号</th>
						<th width="60" align="center">开始时间</th>
						<th width="60" align="center">计划交付时间</th>
						<th width="40" align="center">操作</th>
					</tr>
				</thead>
				<tbody id="itemList" style="text-align: center;">					
					<tr level="00" parentLevel="top" childlength="0" parentLength="0" class="trCode">	
						<td style="display: none;"><input type="text" name="orderDetailList[#index].treeCode" value="00" readonly="readonly"></td>
						<td align="center"><input type="text" name="" value="0" readonly="readonly"></td>
						<td align="center"><input type="text" name="orderDetailList[#index].productCode" value="<s:property value="order.productCode"/>"></td>
						<td align="center"><input type="text" name="orderDetailList[#index].productName" value="<s:property value="order.productName"/>"></td>						
						<td align="center">
							<input type="hidden" name="orderDetailList[#index].singleHead.id" value="<s:property value="order.singleHead.id"/>" class="required">
							<input type="text" style="width: 90%;" name="orderDetailList[#index].singleHead.name" value="<s:property value="order.singleHead.name"/>" class="required" onclick="$(this).next().click();" readonly="readonly">
							<a title="人员选择" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false" id="singleHead">
							</a>
						</td>	
						<td align="center"><input type="text" name="orderDetailList[#index].amount" value="<s:property value="order.amount"/>"></td>
						<td><input type="text" name="orderDetailList[#index].productionCode" value="<s:property value="order.productionCode"/>"></td>
						<td><input type="text" name="orderDetailList[#index].startTime" value="<s:date name="order.startTime" format="yyyy-MM-dd"/>" readonly="readonly" class="startDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().find('.endDate').focus();} })"></td>					
						<td><input type="text" name="orderDetailList[#index].planDelivery" value="<s:date name="order.planDelivery" format="yyyy-MM-dd"/>" readonly="readonly" class="endDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();} })"></td>					
						<td><a style="color:green" name="addBtn" href="###" onclick="addRow(this)">增加</a>&nbsp;&nbsp;<a style="color:red" name="delBtn" href="###" onclick="delRow(this)">删除</a></td>
					</tr>				
				</tbody>
			</table>
		</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="okBtn" type="submit">提交</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>