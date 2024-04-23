<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
//添加一行按钮
jd("[name=addBtn]").click(function(){
	var $itemList=jd("#itemList");
	
	//新一行(新加一行)
	var $newItem=$itemList.find(".file:last").clone();
	$newItem.find("td:last").find("a").click(function(){
		if(jd("#itemList").find("tr").length>1){
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
//删除按钮
jd("[name=delBtn]").click(function(){
	//alert(jd(".fileTd").find("td").length);
	if(jd(".fileTd").find("td").length>1){
		$(this).parent().parent().remove();
	}else{
		$(this).parent().parent().find("input").val("");
	}
});
//删除文件按钮
jd("[name=del]").click(function(){
	var fileId = $(this).parent().parent().find("input").val();
	//获取当前行
	var $tr = $(this).parent().parent();
	alertMsg.confirm("确认删除", {
		 okCall: function(){				
				$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../general/timed_DispatchPlan_deleteFile.action",
				data:{
					id:fileId
				}, 
				success : function(data, statusText) {
					alertMsg.correct(data.message);					
					}
				});  
				//删除当前行
				$tr.remove();
		 },
		 cancelCall : function() {}
		});			
});	
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action="../general/timed_DispatchPlan_addOrModify.action" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="op" value="<s:property value="op"/>"/>
	<input type="hidden" name="num" value="<s:property value="0"/>"/>
	<input type="hidden" name="itemId" value="<s:property value="item.id"/>"/>
	<input type="hidden" name="dispatchPlan.id" value="<s:property value="dispatchPlan.id"/>"/>
	<input type="hidden" class="ahead" value="<s:property value="item.ahead"/>"/>
	<div class="pageFormContent" layoutH="56">
		<br/>
	<fieldset>
		<legend><s:property value="op == 0 ? '新增' : '编辑'"/>提醒计划</legend>
		<table width="98%" class="edit_table" align="center" style="font-weight: bold;" id="itemList">
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">截止日期：</td>
				<td><input name="dispatchPlan.deadline" value="<s:date name='dispatchPlan.deadline' format='yyyy-MM-dd'/>" class="deadline"  readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true, isShowClear:false, onpicked:function(){jd('.remindTime').val('');jd('.remindTime').val(convertToDate(Date.parse(jd(this).val())+((jd('.remindTime').val()-jd('.ahead').val())*1000*60*60*24)));} })"></td>
			</tr>
			<tr>
				<td align="center" width="30%" style="font-weight: bold;">提醒日期：</td>
				<td><input name="dispatchPlan.remindTime" value="<s:date name='dispatchPlan.remindTime' format='yyyy-MM-dd'/>" class="remindTime" readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', doubleCalendar:true, isShowClear:false, onpicked:function(){} })"></td>
			</tr>
			<tr>
				<td style="font-weight: bold;" colspan="4">计划完成情况：</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="dispatchPlan.planContent" id="planContent" class="editor required" rows="10" style="width: 100%;" tools="Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,|Table" upImgUrl="../dispatchPlan/dispatchAppr!upload.action" upImgExt="jpg,jpeg,gif,png">
							<s:property value="dispatchPlan.planContentStr" escape="false" /> 
					</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;" colspan="2">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
			</tr>
			<s:iterator value="fileList" status="st">
			<tr>
				<td>
					<input type="hidden" value="<s:property value="id"/>"/>
					<div style="float:left;margin:0 5px;clear:both;">
						<s:property value="fileName"/>
					</div>
				</td>
				<td><a name="del" href="javascript:;" style="color : red;">删除</a></td>
			</tr>
			</s:iterator>
			<tr class="file" colspan="2">
				<td><input type="file" name="filesource"/>
				</td>
				<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
			</tr>
		</table>
	</fieldset> 
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submit" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>