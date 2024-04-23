<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>

<script type="text/javascript">
$(function() {	
	jd("#printBtn").click(function() {
		jd("#suojigongwen1_file").print({
			//Use Global styles
			globalStyles : false,//是否包含父文档的样式，默认为true
			//Add link with attrbute media=print
			mediaPrint : false,//是否包含media='print'的链接标签。会被globalStyles选项覆盖，默认为false
			//Custom stylesheet
			stylesheet : "../../css/custom_file_css/weibosuo_suojigongwen1_yangshi.css",//外部样式表的URL地址，默认为null
			//Print in a hidden iframe
			iframe : false,//是否使用一个iframe来替代打印表单的弹出窗口，true为在本页面进行打印，false就是说新开一个页面打印，默认为true
			//Don't print this
			noPrintSelector : ".avoid-this",//不想打印的元素的jQuery选择器，默认为".no-print"
			//Add this at top
			prepend : null,//将内容添加到打印内容的前面，可以用来作为要打印内容
			//Add this on bottom
			append : null//将内容添加到打印内容的后面
			
		});
	});
});
</script>
<div class="pageContent">
<div class="pageFormContent" layoutH="58">
  <div id="suojigongwen1_file">
	<div id="suojigongwen1_toubu">
		<div id="suojigongwen1_toubu_miji">密级：<s:property value="post.security"/></div>
		<div id="suojigongwen1_toubu_taitou"><img src="../../img/file_title_blue.png" width="1863" height="266" alt="空间微波技术研究所文件" longdesc="#" /></div>
		<div id="suojigongwen1_toubu_bianhao"><s:property value="post.code"/></div>
	</div>
	<div id="suojigongwen1_neirong">
		<div id="suojigongwen1_neirong_biaoti" class="css1"><s:property value="post.title"/></div>
		<div id="suojigongwen1_neirong_zhengwen" class="css1">
			<s:property value="post.contentStr" escape="false"/>
		</div>
			
	</div>
	<div id="suojigongwen1_weiye">
		<div id="suojigongwen1_weiye_qianshu">
			<div class="css1"><s:property value="post.sponsor"/></div>
			<div class="css1"><s:date name="post.publishDate" format="yyyy年MM月dd日"/></div>
			<div id="suojigongwen1_weiye_gongzhang"><s:if test="post.sealFilePath != null"><img src='<s:property value="post.sealFilePath"/>'/></s:if></div>
		</div>
		<div class="clear"></div>
		<div id="suojigongwen1_weiye_fujian">
			<s:iterator value="post.files" status="f">
				<div class="css1">附件<u:index value="#f.index+1"/>：<s:property value="fileName"/></div>
			</s:iterator>
		</div>
		
		<div id="suojigongwen1_weiye_dibu">
			<div id="suojigongwen1_weiye_dibu_lineup">
			  <div id="suojigongwen1_weiye_dibu_lineup_danwei" class="css1"><s:property value="post.sponsor"/></div>
			  <div id="suojigongwen1_weiye_dibu_lineup_riqi" class="css1"><s:date name="post.publishDate" format="yyyy年MM月dd日"/></div>
			</div>
			<div class="clear"></div>
			<div id="suojigongwen1_weiye_dibu_linedown">
			  <div id="suojigongwen1_weiye_dibu_linedown_jiaodui" class="css1">校对：<s:property value="post.publisher.name"/></div>
			  <div id="suojigongwen1_weiye_dibu_linedown_gongyin" class="css1">共印2份</div>
			</div>
		</div>
	</div>
</div>
</div>
<div class="formBar">
	<ul>
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="" id="printBtn">打印</button>
				</div>
			</div>
		</li>
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="close" id="cancelBtn">关闭</button>
				</div>
			</div>
		</li>
	</ul>
</div>
</div>
