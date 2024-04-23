<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	//添加按钮
	jn("[name=addBtn]").click(function(){
		var $itemList=jn("#itemList");
		
		//新一行(新加一行)
		var $newItem=$itemList.find(".file:last").clone();
		$newItem.find("td:last").find("a").click(function(){
			if(jn("#itemList").find("tr").length>1){
				$(this).parent().parent().remove();
			}else{
				alertMsg.error("操作失败！");
			}
		})
		$newItem.initUI();
		$newItem.find("[type=file]").val("");
		
		//增加一行
		$itemList.append($newItem);
	});
	//区别模板详情的行号
 	/* function addIndex(){
		var $itemTr = jn("#itemList").find("tr");
		for (var i = 0; i < $itemTr.length; i++) { 
			var $input = $itemTr.eq(i).find("input");
			for(var j = 0; j< $input.length; j++){				
				var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
				$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+i+"]"));		
						
			}
		} 
	} */
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn(".fileTd").find("td").length>1){
			$(this).parent().parent().remove();
		}else{
			$(this).parent().parent().find("input").val("");
			
		}
	});
	
	//提交按钮
	/* jn("[type=submit]").click(function() {
		var $itemTr = jn("#itemList").find("tr");
		for (var i = 0; i < $itemTr.length; i++) {
			var $input = $itemTr.eq(i).find("input");
			//有待办事项
			if ($input.eq(1).val() == "") {
				alertMsg.error("请填写任务名称");
				return false;
			}
			//有待办事项
			if ($input.eq(2).val() == "") {
				alertMsg.error("请选择处理人");
				return false;
			//如果只有一行
			}else if($itemTr.length == 1){
				for(var j = 0; j< $input.length; j++){				
					var name = $input.eq(j).attr("name").substring($input.eq(j).attr("name").indexOf("["),$input.eq(j).attr("name").indexOf("."));
					$input.eq(j).attr("name",$input.eq(j).attr("name").replace(name, "["+ 0 +"]"));
					
					if(j == $input.length-2){
						var $a = $itemTr.eq(i).find(".model");
						var lookupGroup = $input.eq(j).attr("lookupGroup").substring($input.eq(j).attr("lookupGroup").indexOf("["));	
						$input.eq(j).attr("lookupGroup",$input.eq(j).attr("lookupGroup").replace(lookupGroup, "["+ 0 +"]"));
						$a.attr("lookupGroup",$a.attr("lookupGroup").replace(lookupGroup, "["+ 0 +"]"));
					}				
				}
			}
		}
	});  */
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../exceltoword/uploadData!report.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>任务处理</legend>			
			<table border="0" width="98%" class="edit_table" align="center" id="itemList">
				<tr>
					<td style="text-align: left;" colspan="2">请上传模板文档和文档对应的excel数据存储表，完成后请点击右下角的“提交数据并生成报告”按钮&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">报告模板(word)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="wordfile"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">报告填充数据(excel)</td>
				</tr>
				<tr class="file">				     
					<td><input type="file" name="excelfile"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>	
				<tr>
					<td style="text-align: left;" colspan="2">上传图片&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">文档图片列表(如下:)</td>
				 <td ><a name="addBtn" href="javascript:;" style="color : green;">增加图片</a></td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="image"/></td>				
					<td>图片说明:(对应文档中图片正下方的文字说明)<input type="text" name="imagecont"/></td>
					<td>图片书签:(对应文档中需用图片替换的书签，须包含“image”关键字以区分)<input type="text" name="imagemark"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>			
			</table>
		</fieldset>

	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交数据并生成报告</button></div></div></li>			
		</ul>			
	</div>
   </form>
</div>