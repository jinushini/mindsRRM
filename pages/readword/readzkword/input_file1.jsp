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
	//删除按钮
	jn("[name=delBtn]").click(function(){
		if(jn(".fileTd").find("td").length>1){
			$(this).parent().parent().remove();
		}else{
			$(this).parent().parent().find("input").val("");
			/* alertMsg.error("操作失败！"); */
		}
	});
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../readzkword/updloadFile!uploadFile1.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<legend>任务处理</legend>			
			<table border="0" width="98%" class="edit_table" align="center" id="itemList">
				<tr>
					<td style="text-align: left;" colspan="2">上传文档(请在生产力工具菜单栏下下载Fierfox或chrome浏览器，将mes上的.doc文档(03版word)另存为.docx文档(07版word及以上))&nbsp;&nbsp;&nbsp;&nbsp;<!-- <a href="javascript:;" style="color:green;" name="addBtn">继续增加</a> --></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">初测报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource5"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">力学后测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource6"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">热真空测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource1"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">热循环测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource2"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">温循老炼测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource3"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">高温老炼测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource4"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
				<tr>
				<td style="text-align: left;" colspan="2">验收测试报告(如下:)</td>
				</tr>
				<tr class="file">
				     
					<td><input type="file" name="filesource7"/></td>
					<td><a name="delBtn" href="javascript:;" style="color : red;">删除</a></td>
				</tr>
			</table>
		</fieldset>

	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">上传</button></div></div></li>
			<%-- <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a> --%>
			<!-- <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">关闭</button></div></div></li> -->
		</ul>			
	</div>
   </form>
</div>