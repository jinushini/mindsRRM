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
					<td align="right" style="border:hidden;">输出频率(GHz)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.freqOutMin" value="<s:property value='mcm.freqOutMin'/>" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.freqOutMax" value="<s:property value='mcm.freqOutMax'/>" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">输出功率(dBm)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.powerOutMin" value="<s:property value='mcm.powerOutMin'/>" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.powerOutMax" value="<s:property value='mcm.powerOutMax'/>" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">谐波抑制dBc(TPY)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.harmonicReject" value="<s:property value='mcm.harmonicReject'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">杂波抑制dBc(TPY)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.clutterReject" value="<s:property value='mcm.clutterReject'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">相位噪声(dBc/Hz@10kHz)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.phaseNoise" value="<s:property value='mcm.phaseNoise'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">功耗(V/mA)(mW)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.powerConsume" value="<s:property value='mcm.powerConsume'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:25%;border:hidden;">参考频率(mHz)：</td>
					<td style="border:hidden;" style="border:hidden;">
						<input type="text" name="mcm.freqRefer" value="<s:property value='mcm.freqRefer'/>" style="width:250px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
					</td>
				</tr>
				<tr>
					<td align="right" style="border:hidden;">参考功率(dBm)：</td>
					<td style="border:hidden;">
						<input type="text" name="mcm.powerReferMin" value="<s:property value='mcm.powerReferMin'/>" style="width:110px;text-align: center;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
						<span>~</span>
						<input type="text" name="mcm.powerReferMax" value="<s:property value='mcm.powerReferMax'/>" style="width:110px;text-align: center;clear:both;" onblur="value=value.match(/\-?\d+\.?\d{0,3}/)" placeholder="数字">
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