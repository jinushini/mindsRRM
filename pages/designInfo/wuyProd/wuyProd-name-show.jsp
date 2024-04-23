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
	<form action="../designInfo/WuyProd_modifyWuyProd_wuyProd.action" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);" >
		<input type="hidden" name="wuyProd.id" value="<s:property value="wuyProd.id"/>" />
		<div layoutH="70" style="margin:30px 30px -25px; font-size:16px;line-height: 28px;">		
			图 纸 代 号 ：<span style="color:red;font-size:20px"><s:property value="wuyProd.selProdCode"/></span>
			<hr/>
			产 品 代 号 ：<input type="text" name="wuyProd.code" value="<s:property value='wuyProd.code'/>" style="width:165px;"><br/>
			产 品 名 称 ：<input type="text" name="wuyProd.name" value="<s:property value='wuyProd.name'/>" style="width:165px;"><br/>
			型 号 代 号 ：<input type="text" name="wuyProd.libCode" value="<s:property value='wuyProd.libCode'/>" style="width:165px;"><br/>
			分系统名称：<input type="text" name="wuyProd.subSystem" value="<s:property value='wuyProd.subSystem'/>" style="width:165px;"><br/>
			<hr/>
			<div style="font-size:16px;">
				主管设计师：
				<input type="hidden" name="wuyProd.singleHead.id" value="<s:property value='wuyProd.singleHead.id'/>" class="required">
				<input type="text" name="wuyProd.singleHead.name" value="<s:property value='wuyProd.singleHead.name'/>" class="required" readonly="readonly" onclick="$(this).next().click()" >
				<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
					href="../system/user!findUser.action" target="dialog"
					rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
				</a>
			</div>
			<hr/>
			<s:if test="wuyProd.simplifyCode != 'WBKG'">产品简称：<s:property value="wuyProd.simplifyName"/><p/></s:if>
			<s:if test="wuyProd.simplifyCode != 'WBKG'">工作频段：<s:property value="wuyProd.freqWork"/><p/></s:if>
			<s:if test="wuyProd.simplifyCode != 'WBKG'">结构形式：<s:property value="wuyProd.structureForm"/><p/></s:if>
			入库时间：<s:date name="wuyProd.createDate" format="yyyy-MM-dd HH:mm"/>
			<hr align="left" width="50%" />
			
			<%-- 同类产品序号：<s:property value="wuyProd.similarNumber"/><p/>
			改进序号：<s:property value="wuyProd.improveNumber"/><p/>
			地面标识：<s:property value="wuyProd.surfaceIdentify"/> --%>
			备注：<textarea name="wuyProd.note" rows="2" cols="55"><s:property value="wuyProd.note"/></textarea>
			<%-- <div id="doc" layoutH=550" style="margin:5px 40px 20px;padding:7px;clear:both;line-height:20px;border:solid #6495ED 1px;word-break:break-all;word-warp:break-word;"><s:property value="wuyProd.note"/></div> --%>
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