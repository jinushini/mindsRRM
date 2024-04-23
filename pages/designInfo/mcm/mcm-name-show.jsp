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
<div class="pageHeader">
	<div class="searchBar">	
	</div>
</div>
<div class="pageContent">
	<form action="../designInfo/Mcm_modifyMcm_mcm.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<input type="hidden" name="mcm.id" value="<s:property value="mcm.id"/>" />
		<div layoutH="70" style="margin:30px 30px -25px; font-size:16px;line-height: 28px;">		
			产品代号：<span style="color:red;font-size:20px"><s:property value="mcm.code"/></span><br/>
			产品名称：<input type="text" name="mcm.name" value="<s:property value='mcm.name'/>" class="required" style="width:165px;">
			<hr/>
			<div style="font-size:16px;">
				主管设计师：
				<input type="hidden" name="mcm.singleHead.id" value="<s:property value='mcm.singleHead.id'/>" class="required">
				<input type="text" name="mcm.singleHead.name" value="<s:property value='mcm.singleHead.name'/>" class="required" readonly="readonly" onclick="$(this).next().click()" >
				<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
					href="../system/user!findUser.action" target="dialog"
					rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
				</a>
			</div>
			<hr/>
			入库时间：<s:date name="mcm.createDate" format="yyyy-MM-dd HH:mm"/>
			<hr align="left" width="50%" />
			<s:if test="mcm.simplifyCode != 'MCM-FS'">接口方式：<s:property value="mcm.port"/><p/></s:if>
			输入频段(MHz)：<s:property value="mcm.frequencyInput"/><p/>
			输出频段(MHz)：<s:property value="mcm.frequencyOutput"/><p/>
			<s:if test="mcm.simplifyCode != 'MCM-FS'">工作模式：<s:property value="mcm.workMode"/><p/></s:if>
			<s:if test="mcm.simplifyCode != 'MCM-FS'">控制模式：<s:property value="mcm.controlMode"/><p/></s:if>
			
			<%-- 同类产品序号：<s:property value="mcm.similarNumber"/><p/>
			改进序号：<s:property value="mcm.improveNumber"/><p/>
			地面标识：<s:property value="mcm.surfaceIdentify"/> --%>
			备注：<textarea name="mcm.note" rows="2" cols="55"><s:property value="mcm.note"/></textarea>
			<%-- <div id="doc" layoutH=550" style="margin:5px 40px 20px;padding:7px;clear:both;line-height:20px;border:solid #6495ED 1px;word-break:break-all;word-warp:break-word;"><s:property value="mcm.note"/></div> --%>
			<%-- 说明文档：<div style="margin-left:40px;">
				   	<s:iterator value="list" status="st">
						<a href="<s:property value='filePathVisit'/>" download="<s:property value='fileName' />" style="color:green"><s:property value="fileName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击下载</a></br>
				    </s:iterator>	
				   </div>		 --%>
		</div>	
		<div class="formBar">
			<ul>
				<!-- <li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li> -->
				<li><div class="button"><div class="buttonContent"><button type="button"  class="button" id="fullScrBtn">全屏</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>