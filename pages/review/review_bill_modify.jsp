<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">	

	//增加文件行
	jn("[name=addFileBtn]").click(function(){
		var $itemList=jn("#itemList");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		/* $newItem.initUI(); */
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	
		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delFileBtn]").click(function(){
			if(jn("#itemList").find(".file").length>1){
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
	});
	
	//删除文件按钮
	jn("[name=del]").click(function(){
		var fileId = $(this).parent().parent().find("input").val();
		//获取当前行
		var $tr = $(this).parent().parent();
		alertMsg.confirm("确认删除", {
			 okCall: function(){				
					$.ajax({
					global : false,
					type : 'post',
					dataType : "json",
					url : "../review/reviewAppr!delFile.action",
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
	
	//提交按钮		
	jn("[type=submit]").click(function() {
		var $itemTr = jn("#itemList").find(".data");
		for (var i = 0; i < $itemTr.length; i++) {
			var $input = $itemTr.eq(i).find("input");
			var $textarea = $itemTr.eq(i).find("textarea");
			var input = $input.eq(0).attr("name").substring( $input.eq(0).attr("name").indexOf("["), $input.eq(0).attr("name").indexOf("."));
			$input.eq(0).attr( "name", $input.eq(0).attr("name").replace(input, "[" + i + "]"));
			var textarea = $textarea.eq(0).attr("name").substring( $textarea.eq(0).attr("name").indexOf("["), $textarea.eq(0).attr("name").indexOf("."));
			$textarea.eq(0).attr( "name", $textarea.eq(0).attr("name").replace(textarea, "[" + i + "]"));
		}
	});
</script>
<div class="pageContent">
	<form action="../review/reviewAppr!handleReviewModify.action" enctype="multipart/form-data" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" >	
		<input type="hidden" name="reviewProduct.id" value="<s:property value="reviewProduct.id"/>"/>
		<input type="hidden" name="processInstId" value="<s:property value="processInstId"/>"/>
		<input type="hidden" name="taskId" value="<s:property value="taskId"/>"/>
		<div class="pageFormContent" layoutH="56"><br/>
			<fieldset>
				<legend><s:property value="reviewBill.reviewBillName"/></legend>
				<table width="98%" class="edit_table" align="center">
					<tr>
						<td align="center" width="20%">复查名称：</td>
						<td width="30%"><s:property value="reviewBill.reviewBillName"/></td>
						<td align="center" width="20%">截止日期：</td>
					<td width="30%"><s:date name="reviewBill.scheduleDate.planEndDate" format="yyyy-MM-dd"/></td>
					</tr>
						<tr>
							<td align="center" width="20%">型号代号：</td>
							<td width="30%"><s:property value="reviewProduct.modelCode"/></td>
							<td align="center" width="20%">型号名称：</td>
						<td width="30%"><s:property value="reviewProduct.modelName"/></td>
					</tr>
					<tr>
						<td align="center">产品代号：</td>
						<td><s:property value="reviewProduct.productCode"/></td>
						<td align="center">产品名称：</td>
						<td><s:property value="reviewProduct.productName"/></td>
					</tr>
					
					<tr>
						<td align="center">产品种类：</td>
						<td><s:property value="reviewProduct.type"/></td>
						<td align="center">单机主管：</td>
						<td>
							<s:property value="reviewProduct.singleHead.name"/>
						</td>
					</tr>
					<tr>
						<td align="center" rowspan="">审&nbsp;批&nbsp;人：</td>	
						<td><s:property value="approve.userName"/></td>
						<td align="center" rowspan="">审批意见：</td>	
						<td style="color:red;"><s:property value="approve.comments"/></td>
					</tr>
					<tr>
						<td align="center" rowspan="">相关文件：</td>
						<td colspan="3">
							<s:iterator value="fileList" status="st">
								<div style="float:left;margin:0 5px;clear:both;">
									<a href="<s:property value="filePath"/>" download="<s:property value='reviewFileName' />" style="color:green"><s:property value="reviewFileName" />&nbsp;&nbsp;&nbsp;&nbsp;（<s:property value="userName"/>提供）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a>
								</div>
								<br />
							</s:iterator>
						</td>
					</tr>
				</table>
				
				<table width="98%" class="edit_table" align="center" id="itemList">
					<s:iterator value="reviewProduct.reviewRequests" status="st">
							<%-- <tr><td align="center"><u:index value="#st.index+1"/></td></tr> --%>
						<tr>
							<td colspan="4" style="font-size: 18px;"><s:property value="num+1"/>、<s:property value="item"/></td>
						</tr>
						<tr class="data">
							<td colspan="4">
								<input type="hidden" name="reviewRequestVoList[#index].id" value="<s:property value="id"/>"/>
								<textarea name="reviewRequestVoList[#index].result" class="editor required" rows="15" style="width: 91%;"  upImgUrl="../review/review!upload.action" upImgExt="jpg,jpeg,gif,png" ><s:property value="resultStr" escape="false"/></textarea>
							</td>
						</tr>
					</s:iterator>
					<tr>
						<td style="padding-left: 0px;" colspan="4">相关文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addFileBtn">继续增加</a></td>
					</tr>
						<s:iterator value="feedbackfileList" status="st">
							<tr>
								<td colspan="3">
									<input type="hidden" value="<s:property value="id"/>"/>
									<div style="float:left;margin:0 20px;clear:both;">
										<s:property value="reviewFileName"/>
									</div>
								</td>
								<td><a name="del" href="javascript:;" style="color : red;">删除</a></td>
							</tr>
						</s:iterator>
					<tr class="file">
						<td style="padding-left: 40px;width:50%;" colspan="3"><input type="file" name="filesource"/></td>
						<td colspan="2"><a name="delFileBtn" href="javascript:;" style="color : red;">删除</a></td>
					</tr>
				</table>
				<table width="98%" class="edit_table" align="center">
					<tr>
						<td align="center" colspan="2" >审批人：</td>
						<td colspan="2"><input name="reviewProduct.auditorId" type="hidden" class="required" value="<s:property value="reviewProduct.auditorId"/>"> 
							<input name="reviewProduct.auditorName" type="text" value="<s:property value="reviewProduct.auditorName"/>" class="required" onclick="$(this).next().click()" readonly="readonly"> 
							<a height="410" width="715" href="../system/user!findMUser.action" target="dialog" rel="selectUser" resizable="false" maxable="false"> </a>
						</td>
					</tr>
				</table>
			</fieldset> 
		</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">取消</button></div></div></li>
			<%-- <li><a class="button" href="../review/review!showReviewProductList.action?a=a&b=b"  target="navTab"><span>返回</span></a></li> --%>
		</ul>			
	</div>
   </form>
</div>