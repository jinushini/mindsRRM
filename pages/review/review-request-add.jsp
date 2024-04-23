<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

	//页面加载时执行
	jn(function(){
		//清空cookie
		$.cookie("idStr","");
	})

	//添加按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find(".addTr:first").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jn("#itemList").find(".addTr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		});
		$newItem.initUI();
		$newItem.find("input").val("");
		
		//增加一行
		$itemList.append($newItem);

	});	
	
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn("#itemList").find(".addTr").length>1){
			$(this).parent().parent().remove();
		}else{
			alertMsg.error("操作失败！");
		}
	});
	
	//增加文件行
	jn("[name=addFileBtn]").click(function(){
		var $itemList=jn("#fileList");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	
		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn("#fileList").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	//删除文件行
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delFileBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	})

	//提交按钮
	jn("[type=submit]").click(function() {
		var idStr = $.cookie("idStr");
		if(idStr.length == 0){
			alertMsg.error("请选择复查产品");
			return false;
		} 
		jn("#idStr").val(idStr);
		var $itemTr = jn("#itemList").find(".addTr");
		for (var i = 0; i < $itemTr.length; i++) {
			var $input = $itemTr.eq(i).find("input");
			//有待办事项
			if ($input.eq(0).val() == "") {
				alertMsg.error("请填写复查条目");
				return false;
			//如果只有一行
			}else{				
				var name = $input.eq(0).attr("name").substring($input.eq(0).attr("name").indexOf("["),$input.eq(0).attr("name").indexOf("."));
				$input.eq(0).attr("name",$input.eq(0).attr("name").replace(name, "["+ i +"]"));				
			}
		}
	});
	
	//移除产品行
	jn("#selected").on("click","[name='delProductBtn']", function(){	
		//调整之后的序号	
		//获取当前行后边的所有行
		var $nextTr = jn(this).parent().parent().nextAll();
		for(var i = 0; i<$nextTr.length;i++){	
			//获取目标行的序号
			var index = $nextTr.eq(i).find("td").eq(0).text();
			//下一行序号减1放回去
			$nextTr.eq(i).find("td").eq(0).text(index-1);
		}
		var id = jn(this).parent().parent().attr("id");
		////移除cookie某个参数
		delCookieParam(id);
		//删除当前行
		jn(this).parent().parent().remove();
		
	});
	
	//移除cookie某个参数
	function delCookieParam(id){
		var idStr = $.cookie("idStr");
		if(idStr != null){
			idStr = idStr.replaceAll(id + ",","");
			$.cookie("idStr", idStr);
		}
	}
</script>
<div class="pageContent">
  <form action="../review/Review_addReviewRequest.action" enctype="multipart/form-data" id="searchFrm" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" >
	<input type="hidden" id="idStr" name="idStr" value=""/>
	<div class="pageFormContent" layoutH="56"><br/>
	<fieldset>
		<legend>复查条目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="addBtn" href="###" style="color : green;">增加一行</a></legend>
			<table class="edit_table" width="98%" style="table-layout:fixed;" id="itemList">
				<tr>
					<td align="center" width="25%">复查主题</td>
					<td align="center" colspan="3"><input type="text" name="reviewBill.reviewBillName" size="100%"/></td>
				</tr>
				<tr>
					<td align="center" width="15%">开始日期</td>
					<td align="center"><input type="text" name="reviewBill.scheduleDate.planBeginDate" readonly="readonly" class="startDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate: new Date(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).parent().parent().parent().find('.endDate').focus();}})"></td>
					<td align="center" width="15%">结束日期</td>
					<td align="center"><input type="text" name="reviewBill.scheduleDate.planEndDate" readonly="readonly" class="endDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:$(this).parent().parent().find('.startDate').val(), doubleCalendar:true, isShowClear:false, onpicked:function(){$(this).blur();}})"></td>
				</tr>
				<tr class="addTr">
					<td align="center" width="20%">复查要求:</td>
					<td align="center" colspan="2"><input type="text" name="reviewRequestVoList[#index].item" size="60"></td>
					<td align="center">					
						<a name="delBtn" href="###" style="color : red;">删除</a>
					</td>
				</tr>
			</table>
			<table class="edit_table" width="98%" style="table-layout:fixed;" id="fileList">
				<tr>
					<td style="padding-left: 40px;" colspan="4">相关文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a></td>
				</tr>
				<tr class="file">
					<td style="padding-left: 40px;width:50%;" colspan="2"><input type="file" name="filesource"/></td>
					<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
			</table>
		<div>
			<legend ><a href="../review/Product_showProductList_product-list-dialog.action" target="dialog" width="1080" height="600"><div style="font-size: 15px;">选择复查产品<font style="font-size: 15px; color: green;">（点击选择）</font></div></a></legend>
			<table class="list_table list" width="100%" layoutH="120" style="table-layout:fixed;" id="product">
				<thead>
					<tr>
						<th width="40" align="center">序号</th>
						<th width="100">型号代号</th>
						<th width="150">分系统</th>
						<th width="150">单机代号</th>
						<th width="200">单机名称</th>
						<th width="100">产品种类</th>									
						<th width="80">单机主管</th>									
						<th width="80">操作</th>					
					</tr>
				</thead>
				<%-- <tbody>
					<s:iterator value="list" status="st">
						<tr target="id" rel="<s:property value="id"/>">
							<td align="center"><input type="hidden" checked="checked" name="ids" value="<s:property value="id"/>"/></td>				
							<td align="center"><u:index value="#st.index+1"/></td>
							<td align="center"><input type="hidden" checked="checked" name="ids" value="<s:property value="id"/>"/><s:property value="modelCode==null?productLib.modelCode:modelCode"/></td>
							<td align="center"><s:property value="modelName"/></td>
							<td align="center"><s:property value="productCode"/></td>
							<td align="center"><s:property value="productName"/></td>
							<td align="center"><s:property value="type"/></td>
							<td align="center"><s:property value="singleHead.name"/></td>
							<td align="center"><a name="delProductBtn" href="javascript:;" style="color : red;">移除</a></td>											
						</tr>
					 </s:iterator>
				</tbody> --%>
				<tbody id="selected">
					
				</tbody>
			</table>
		</div>
	</fieldset>
</div>
	<div class="formBar">
			<ul>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
				<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
   </form>
</div>