<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
$(function() {
	
	/* var s=jn("#summaryDiv").html();
	
	jn("#summaryIframe")[0].contentWindow.document.write(s); */
	
	jn("#printBtn").click(function() {
		//无待办不打印
		var isempty = jn("#wenjian_fujian_biaoge").find(".taskList").length;
		if(isempty == 0){
			jn("#wenjian_fujian").removeClass().addClass("avoid-this");
		}
		jn("#printId").print({
			//Use Global styles
			globalStyles : false,//是否包含父文档的样式，默认为true
			//Add link with attrbute media=print
			mediaPrint : true,//是否包含media='print'的链接标签。会被globalStyles选项覆盖，默认为false
			//Custom stylesheet
			stylesheet : "../../css/custom_file_css/weibosuowenjian_yangshi.css",//外部样式表的URL地址，默认为null "../../css/weibosuowenjian_yangshi.css"
			//Print in a hidden iframe
			iframe : true,//是否使用一个iframe来替代打印表单的弹出窗口，true为在本页面进行打印，false就是说新开一个页面打印，默认为true
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
<div class="pageFormContent" layoutH="58">
	<div id="printId">
		<div id="wenjian_neirong">
		  <div id="miji">密级：<s:property value="meeting.security"/></div>
		  <div id="taitou"><img src="../../img/file_title.png" width="1863" height="266" alt="空间微波技术研究所文件" longdesc="#" /></div>
		<div id="wenjian_bianhao_he_qianfa">
		  <div id="wenjian_bianhao"><s:property value="meeting.fileCode"/></div>
		  <div id="qianfa">签发：<s:property value="meeting.host.name"/></div>
		</div>
		  <div id="huiyi_xinxi">
		    <div id="huiyi_xinxi_biaoti"><s:property value="meeting.subject"/></div>
		    <div id="huiyi_xinxi_neirong">
		      <table>
		        <tr>
		          <th scope="row">会议名称：</th>
		          <td><s:property value="meeting.subject"/></td>
		        </tr>
		        <tr>
		          <th scope="row">主持人：</th>
		          <td><s:property value="meeting.host.name"/></td>
		        </tr>
		        <tr>
		          <th scope="row">主办单位：</th>
		          <td><s:property value="meeting.sponsor"/></td>
		        </tr>
		        <tr>
		          <th scope="row">时间：</th>
		          <td><s:date name="meeting.beginDate" format="yyyy年MM月dd日"/></td>
		        </tr>
		        <tr>
		          <th scope="row">地点：</th>
		          <td><s:property value="meeting.address"/></td>
		        </tr>
		        <tr>
		          <th scope="row">参加人员：</th>
		          <td><s:iterator value="meeting.signInForms"><s:property value="status==1?singalUser.name+';':''"/></s:iterator></td>
		        </tr>
		      </table>
		    </div>
		    <div id="huiyi_zhengwen_biaoti">会议内容</div>
		    <div id="huiyi_zhengwen_neirong">
		      	<%-- <iframe frameborder="0" id="summaryIframe" src="javascript:;" style="width:100%;height: 100%;" class="">
					<s:property value="meeting.summaryStr" escape="false"/>
				</iframe>
				<div id="summaryDiv" style="display: none;"><s:property value="meeting.summaryStr" escape="false"/></div> --%>
				<s:property value="meeting.summaryStr.replaceAll('㊣', '')" escape="false"/>
		    </div>
		    <div id="huiyi_chengsong">
		      <table>
		        <tr>
		          <th scope="row">主送：</th>
		          <td><s:property value="meeting.sendTo"/></td>
		        </tr>
		        <tr>
		          <th scope="row">抄送：</th>
		          <td><s:property value="meeting.carbonCopy"/></td>
		        </tr>
		        <tr>
		          <th scope="row">编写单位：</th>
		          <td><s:property value="meeting.sponsor"/>  <span><s:date name="meeting.issuedDate" format="yyyy年MM月dd日"/>印发</span></td>
		        </tr>
		      </table>
		    </div>
		  </div>
		</div>
		<div id="wenjian_fujian">
			<div id="wenjian_fujian_taitou">附件:</div>
		    <div id="wenjian_fujian_biaoti">待办事项清单</div>
		    <div id="wenjian_fujian_biaoge">
		    	<table>
				  <tr>
				    <th scope="col" width="3%">序号</th>
				    <th scope="col" width="20%">待办事项描述</th>
				    <th scope="col" width="5%">责任人</th>
				    <th scope="col" width="5%">完成形式</th>
				    <th scope="col" width="9%">要求完成时间</th>
				  </tr>
				  <s:iterator value="list" status="st">
					<tr class="taskList">
						<td align="center"><s:property value="#st.index+1"/></td>
						<td><s:property value="taskDefinitionStr"/></td>
						<td align="center"><s:property value="receiveUser.name"/></td>
						<td align="center"><s:property value="completeForm"/></td>
						<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy年MM月dd日" /></td>
					</tr> 
					</s:iterator>
				</table>
		    </div>
		</div>
	</div>
</div>
<div class="formBar">
	<ul>
		<li><div class="button">
				<div class="buttonContent">
					<button type="button" class="" id="printBtn">打印</button>
				</div>
			</div></li>
		<li><div class="button">
				<div class="buttonContent">
					<button type="button" class="close" id="cancelBtn">关闭</button>
				</div>
			</div></li>
	</ul>
</div>
