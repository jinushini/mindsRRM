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
					<td align="right" style="border:hidden;">输入频率(GHz)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.freqInMin" value="<s:property value='mcm.freqInMin'/>" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.freqInMax" value="<s:property value='mcm.freqInMax'/>" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">输出频率(GHz)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.freqOutMin" value="<s:property value='mcm.freqOutMin'/>" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.freqOutMax" value="<s:property value='mcm.freqOutMax'/>" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">带宽(GHz)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.bandwidth" value="<s:property value='mcm.bandwidth'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">发射增益(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.gianEmit" value="<s:property value='mcm.gianEmit'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">发射噪声系数(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.noiseFigureEmit" value="<s:property value='mcm.noiseFigureEmit'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">P-1(dBm)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.powerP1" value="<s:property value='mcm.powerP1'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">谐杂波抑制(dB)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.HCReject" value="<s:property value='mcm.HCReject'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">输入驻波：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.standWaveIn" value="<s:property value='mcm.standWaveIn'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">输出驻波：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.standWaveOut" value="<s:property value='mcm.standWaveOut'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">功耗(V/mA)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.powerConsume" value="<s:property value='mcm.powerConsume'/>" style="width:250px;text-align: center;">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">变频次数：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.convFreqTimes" value="<s:property value='mcm.convFreqTimes'/>" style="width:250px;text-align: center;">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">封装形式：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.packageForm" value="<s:property value='mcm.packageForm'/>" style="width:250px;text-align: center;">
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