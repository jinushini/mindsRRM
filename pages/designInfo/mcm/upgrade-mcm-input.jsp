<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	/* jn("[name=addBtn]").click(function(){
		var $itemList=jn("#save");
	
		//增加新的一行
		var $newItem=$itemList.find(".file:first").clone();
		$newItem.find("[type=file]").val("");
		$itemList.append($newItem);
	
		//点击过“继续增加”按钮的前提下，依次删除到最后一个文件时的删除清空
		jn("[name=delBtn]").click(function(){
			if(jn("#save").find(".file").length>1){
				$(this).parent().parent().remove();
			}else{
				$(this).parent().parent().find("[type=file]").val("");
			}
		})
	});
	//没有点击过“继续增加”按钮式，对唯一一个文件选择后删除清空
	jn("[name=delBtn]").click(function(){
		$(this).parent().parent().find("[type=file]").val("");
	}) */
</script>
<div class="pageContent">
  <form id="searchFrm" action="../designInfo/Mcm_savaUpgradeMcm_mcm.action" method="post" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<div class="pageFormContent" layoutH="56">
	<br/>
	<fieldset>
		<legend style="font-size:16px;">上级产品命名数据</legend>
			<table border="0" width="98%" class="edit_table" align="center" style="table-layout:fixed;">
				<tr width="30">
					<td align="center">产品代号：</td>
					<td colspan="3">
						<s:property value="mcm.code"/>
					</td>
				</tr>
				<tr width="30">
					<td align="center">产品名称：</td>
					<td colspan="3">
						<s:property value="mcm.name"/>
					</td>
				</tr>
				<tr width="30">
					<td align="center">入库时间：</td>
					<td colspan="3">
						<s:date name="mcm.createDate" format="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
				<s:if test="mcm.simplifyCode != 'MCM-FS'">
					<tr>
						<td align="center">接口方式：</td>
						<td colspan="3">
							<s:property value="mcm.port"/>
						</td>
					</tr>
				</s:if>
				<tr >
					<td align="center">输入频段(MHz)：</td>
					<td>
						<s:property value="mcm.frequencyInput"/>
					</td>
					<td align="center">输出频段(MHz)：</td>
					<td>
						<s:property value="mcm.frequencyOutput"/>
					</td>
				</tr>
				<s:if test="mcm.simplifyCode != 'MCM-FS'">
					<tr>
						<td align="center">工作模式：</td>
						<td colspan="3">
							<s:property value="mcm.workMode"/>
						</td>
					</tr>
					<tr>
						<td align="center">控制模式：</td>
						<td colspan="3">
							<s:property value="mcm.controlMode"/>
						</td>
					</tr>
				</s:if>	
			</table>
	</fieldset>
	
	<br/><br/>
	<fieldset>
		<legend style="font-size:16px;">产品升级</legend>
		<table id="save" border="0" width="98%" class="edit_table" align="center" style="table-layout:fixed;">
		
				<input type="hidden" name="num" value="<s:property value="mcm.id"/>" />
				<input type="hidden" name="mcm.improveNumber" value="<s:property value="mcm.improveNumber"/>" />
				<tr>
					<td align="center">本次产品的改进序号</td>
					<td colspan="3">
						<s:property value="mcm.improveNumber"/>
					</td>
				</tr>
				<tr>
					<td align="center">设计师</td>
					<td colspan="3">
						<input type="hidden" value="<s:property value='mcm.singleHead.id'/>" name="mcm.singleHead.id" class="required">
						<input type="text" value="<s:property value='mcm.singleHead.name'/>" name="mcm.singleHead.name" class="required" readonly="readonly" onclick="$(this).next().click()" >
						<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
							href="../system/user!findUser.action" target="dialog"
							rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
						</a>
					</td>
				</tr>
				<tr>
					<td align="center">备注</td>
					<td colspan="3">
						<textarea name="mcm.note" rows="2" style="width:90%;" />
					</td>
				</tr>
				<!-- <tr>
					<td style="text-align: left;" colspan="4">上传文档&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color:green;" name="addBtn">继续增加</a></td>
				</tr>
				<tr class="file">
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><input type="file" name="file"/></td>
					<td colspan="3"><a name="delBtn" href="javascript:;" style="color:red;">删除</a></td>
				</tr> -->
			</table>
	</fieldset>
	</div>
	
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: right;"><div class="buttonActive"><div class="buttonContent"><button id="submit" name="confirm" type="submit">升级</button></div></div></li>
		</ul>
	</div>
   </form>
</div>

