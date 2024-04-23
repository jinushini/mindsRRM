<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
	
	jd("#fullScrBtn").click(function(){
		jd(".maximize").click();
	})
	jd("#cancelBtn").click(function(){
		jd(".close").click();
	})
	

</script>
<div class="pageContent">
	<form action="../designInfo/Mcm_modifyCatalog_mcm_mcmR-list-catalog.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<input type="hidden" name="mcm.id" value="<s:property value="mcm.id"/>" />
		<div layoutH="40">
			<table width="95%" class="edit_table" style="table-layout:fixed;margin:10px 25px auto;">
				<tr>
					<td align="right" style="width:35%;border:hidden;">产品代号：</td>
					<td style="border:hidden;" style="border:hidden;">
						<span style="color:red;font-size:20px"><s:property value="mcm.code"/></span>
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">产品名称：</td>
					<td style="border:hidden;" style="border:hidden;">
						<span style="color:red;font-size:20px"><s:property value="mcm.name"/></span>
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">工作频率(GHz)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.freqWorkMin" value="<s:property value='mcm.freqWorkMin'/>" class="required" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.freqWorkMax" value="<s:property value='mcm.freqWorkMax'/>" class="required" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">接收增益(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.gainRec" value="<s:property value='mcm.gainRec'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">接收噪声系数(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.noiseFigureRec" value="<s:property value='mcm.noiseFigureRec'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">发射效率(%)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.effEmit" value="<s:property value='mcm.effEmit'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">功耗(V/mA)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.powerConsume" value="<s:property value='mcm.powerConsume'/>" style="width:250px;text-align: center;">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">幅度位数(bit)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.ampBit" value="<s:property value='mcm.ampBit'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">幅度衰减范围(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.ampRange" value="<s:property value='mcm.ampRange'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">幅度步进(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.ampStep" value="<s:property value='mcm.ampStep'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">相移位数(bit)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.phaseShiftBit" value="<s:property value='mcm.phaseShiftBit'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">相移范围(°)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.phaseShiftRange" value="<s:property value='mcm.phaseShiftRange'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">相移步进(°)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.phaseShiftStep" value="<s:property value='mcm.phaseShiftStep'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
			</table>
		</div>	
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>