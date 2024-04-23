<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">

	/* var s = jn("#summaryDiv").html();
	jn("#summaryIframe")[0].contentWindow.document.write(s); */

	$(function() {
		jn("#printBtn").click(function() {
			//无待办不打印
			var isempty = jn(".show_table").find("tbody").find( "td").length;
			if (isempty == 0) {
				jn(".show_table") .removeClass() .addClass( "list_table edit_table show_table avoid-this");
			}
			jn("#weibosuo_pingshenbaogao").print({
				//Use Global styles
				globalStyles : false,//是否包含父文档的样式，默认为true
				//Add link with attrbute media=print
				mediaPrint : true,//是否包含media='print'的链接标签。会被globalStyles选项覆盖，默认为false
				//Custom stylesheet
				stylesheet : "../../css/custom_file_css/weibosuo_pingshenbaogao_yangshi.css",//外部样式表的URL地址，默认为null "../../css/weibosuowenjian_yangshi.css"
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
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<div id="weibosuo_pingshenbaogao">
			<div id="pingshenbaogao_jiben_xinxi">
				<div id="bianhao_miji_jieduan">
					<table>
						<tr>
							<th scope="row">编&nbsp;&nbsp;号：</th>
							<td><s:property value="meeting.code" /></td>
						</tr>
						<tr>
							<th scope="row">密&nbsp;&nbsp;级：</th>
							<td><s:property value="meeting.security" /></td>
						</tr>
						<tr>
							<th scope="row">阶段标记：</th>
							<td><s:property value="meeting.stage" /></td>
						</tr>
					</table>
				</div>
				<div id="pingshenbaogao_biaoti">
					<s:property value="meeting.name" />
					[
					<s:property value="meeting.code" />
					]评审
				</div>
				<div id="pingshenbaogao_wenjian_biaoti">评审证明书</div>
				<div id="pingshenbaogao_wenjian_neirong">
					<table>
						<tr>
							<th scope="row">产品代号：</th>
							<td><s:property value="meeting.productCode" /></td>
						</tr>
						<tr>
							<th scope="row">产品名称：</th>
							<td><s:property value="meeting.productName" /></td>
						</tr>
						<tr>
							<th scope="row">所属系统：</th>
							<td><s:property value="meeting.modelName" /></td>
						</tr>
						<tr>
							<th scope="row">评审级别：</th>
							<td><s:iterator value="reviewLevels" status="st">
									<s:if test="value == meeting.reviewLevel">√<s:property value="value" /></s:if>
									<s:else>□<s:property value="value" /></s:else>
								</s:iterator></td>
						</tr>
						<tr>
							<th scope="row">评审类别：</th>
							<td><s:iterator value="reviewCategorys" status="st">
									<s:if test="value == meeting.reviewCategory">√<s:property value="value" /></s:if>
									<s:else>□<s:property value="value" /></s:else>
								</s:iterator></td>
						</tr>
						<tr>
							<th scope="row">评审时间：</th>
							<td><s:date name="meeting.beginDate" format="yyyy-MM-dd" /></td>
						</tr>
					</table>
				</div>
				<div id="pingshenbaogao_wenjian_jituanfengongsi">中国航天科技集团五院西安分院</div>
			</div>

			<div id="pingshenbaogao_wenjian">
				<div id="pingshenbaogao_pingshenwenjian">一、评审文件：</div>
				<div>
					<ol>
						<s:iterator value="meetingFiles" status="st">															
							<s:if test="use=='评审文件'">
													
							<li>《
								<s:if test="meetingFileName.indexOf('.') != -1">
									<s:property value='meetingFileName.substring(0, meetingFileName.length()-meetingFileName.substring(meetingFileName.lastIndexOf("."),meetingFileName.length()).length())'/>
								</s:if>
								<s:else>
									<s:property value='meetingFileName'/>
								</s:else>
							》</li>
							<%-- <li>《<s:property value='meetingFileName.substring(0, meetingFileName.length()-meetingFileName.substring(meetingFileName.lastIndexOf("."),meetingFileName.length()).length())' />》</li> --%>
							</s:if>
						</s:iterator>
					</ol>
				</div>
				<div id="pingshenbaogao_beichawenjian">二、备查文件：</div>
				<div>
					<ol>
						<s:iterator value="meetingFiles" status="st">															
							<s:if test="use=='评审文件'">
													
							<li>《
								<s:if test="meetingFileName.indexOf('.') != -1">
									<s:property value='meetingFileName.substring(0, meetingFileName.length()-meetingFileName.substring(meetingFileName.lastIndexOf("."),meetingFileName.length()).length())'/>
								</s:if>
								<s:else>
									<s:property value='meetingFileName'/>
								</s:else>
							》</li>
							<%-- <li>《<s:property value='meetingFileName.substring(0, meetingFileName.length()-meetingFileName.substring(meetingFileName.lastIndexOf("."),meetingFileName.length()).length())' />》</li> --%>
							</s:if>
						</s:iterator>
					</ol>
				</div>
			</div>

			<div id="pingshenbaogao_pingshenyijian">
				<div id="">三：评审意见：</div>
				<div id="">
						<s:property value="meeting.summaryStr" escape="false" />
				</div>
				<div id="pingshenbaogao_pingshenyijian_qianshu">
					<table>
						<tr>
							<th>评审组长签名:</th>
							<td>
								<div style="float:center;width:88px;margin:0 5px;clear:both;">
									<img src="<s:property value="meeting.host.filePath"/>" style="width:80px;height:40px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<th>评审日期:</th>
							<td><s:date name="meeting.beginDate" format="yyyy年MM月dd日" /></td>
						</tr>
					</table>
				</div>
			</div>

			<div id="pingshenbaogao_wenjian_pingshenzu">
				<div id="pingshenbaogao_wenjian_pingshenzuqianming">评审组签名:</div>
				<div id="pingshenbaogao_wenjian_pingshenzu_biaoge">
					<table class="list">
						<tr>
							<th scope="col"></th>
							<th scope="col">姓名</th>
							<th scope="col">单位</th>
							<th scope="col">职务/职称</th>
							<th scope="col">签名</th>
							<th scope="col">时间</th>
						</tr>
						<s:iterator value="userList" status="st">
							<s:if test="role=='组长'">
								<tr>
									<td align="center"><s:property value="role"/></td>
									<td align="center"><s:property value="name"/></td>
									<td align="center"><s:property value="organization"/></td>
									<td align="center">
										<s:property value="duty"/></td>
									<td class="tdh" align="center">
										<s:if test="handWritten != null">
											<div style="float:center;width:88px;margin:1pt 0 1pt 0;clear:both;">
												<img src="<s:property value="handWritten"/>" style="width:80px;height:40px;"/>
											</div>
										</s:if>
									</td>
									<td align="center"><s:date name="readTime" format="yyyy-MM-dd"/></td>
								</tr> 
							</s:if>
						</s:iterator>
						<s:iterator value="userList" status="st">
							<s:if test="role=='组员'">
							<tr>
									<td align="center"><s:property value="role"/></td>
									<td align="center"><s:property value="name"/></td>
									<td align="center"><s:property value="organization"/></td>
									<td align="center"><s:property value="duty"/></td>
									<td align="center">
										<s:if test="status==1 && handWritten != null">
											<div style="float:center;width:88px;margin:1pt 0 1pt 0;clear:both;"><img src="<s:property value="handWritten"/>" style="width:80px;height:40px;"/></div>
										</s:if>
									</td>
									<td align="center"><s:date name="readTime" format="yyyy-MM-dd"/></td>
								</tr> 
							</s:if>
						</s:iterator>
					</table>

				</div>
			</div>
			<s:if test="list.size != 0">
				<div id="pingshenbaogao_wenjian_daibanshixiangbiao">
				    <div id="pingshenbaogao_wenjian_daibanshixiangbiao_biaoti">待办事项表</div>
				    <div id="pingshenbaogao_wenjian_daibanshixiangbiao_biaoge">
				    	<table class="list">
						  <tr>
							<th scope="col">序号</th>
						 
							<th scope="col">待办事项描述</th>
							<th scope="col">待办事项落实情况</th>
							<th scope="col">责任人</th>
							<th scope="col">完成形式</th>
							<th scope="col">要求完成时间</th>
							<th scope="col">状态</th>
						  </tr>
						  <s:set name="isAllFinish" value="1"/>
						  <s:iterator value="list" status="st">
						  <s:if test="status != 3"> <s:set name="isAllFinish" value="0"/></s:if>
							<tr>
								<td align="center"><s:property value="#st.index+1"/></td>
								<td class="tds"><s:property value="taskDefinitionStr"/></td>
								<td class="tfs" <s:if test="feedbackInfoStr==null">style="color:red;"</s:if>>
									<s:property value="feedbackInfoStr==null?'无':feedbackInfoStr" escape="false"/>
								</td>
								<td align="center"><s:property value="receiveUser.name"/></td>
								<td align="center"><s:property value="completeForm"/></td>
								<td align="center"><s:date name="scheduleDate.planEndDate" format="yyyy-MM-dd" /></td>
								<td align="center"<s:if test="status==3">style="color:green;"</s:if><s:else>style="color:red;"</s:else>>
									<s:property value="status==3?'已完成':status==0?'已取消':'未完成'"/>							
								</td>							
								<%-- <td>
									<s:iterator value="dispatchFiles" status="st">	
										<em style="font-family: YouYuan;"><s:property value="#st.index+1"/>、</em>							
										<a href="<s:property value="taskFile"/>" style="color:green;"><s:property value="taskFileName" /></a><br/>
									</s:iterator>
								</td>
								<td style="display:none;"><a href="../fextends/taskQuery!approveList.action?processInstId=<s:property value="processInstId"/>" height="410" width="700" target="dialog" rel="dialog1" class="process">查看</a></td>
							 --%>
							</tr> 
						</s:iterator>
						</table>
				    </div>
					<div id="pingshenbaogao_wenjian_daibanshixiangbiao_qianshu">
						<div id="pingshenbaogao_wenjian_daibanshixiangbiao_qianshu_fuzeren">负责人检查确认： 
							<s:if test="#isAllFinish == 1 && meeting.host.filePath != null">
								<span style="float:center;width:88px;margin:1pt 0 1pt 0;clear:both;">
									<img src="<s:property value="meeting.hostHandWrittenUrl"/>" style="width:80px;height:40px;"/>
								</span>
							</s:if>
							<div class="riqi">检查确认日期：
								<s:if test="#isAllFinish == 1 && meeting.hostHandWrittenUrl != null">
									<s:date name="meeting.beginDate" format="yyyy-MM-dd"/>
								</s:if>
							</div>
						</div>
						<div id="pingshenbaogao_wenjian_daibanshixiangbiao_qianshu_chanbao">产品保证检查确认：
							<s:if test="#isAllFinish == 1 && meeting.productManager.filePath != null">
								<span style="float:center;width:88px;margin:1pt 0 1pt 0;clear:both;">
									<img src="<s:property value="meeting.productManagerHandWrittenUrl"/>" style="width:80px;height:40px;"/>
								</span>
							</s:if>
							<div class="riqi">检查确认日期：
								<s:if test="#isAllFinish == 1 && meeting.productManagerHandWrittenUrl != null">
									<s:date name="meeting.beginDate" format="yyyy-MM-dd"/>
								</s:if>
							</div>
						</div>
						</div>
					</div>
				</s:if>
			</div>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="" id="printBtn">生成打印</button>
					</div>
				</div></li>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close" id="cancelBtn">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>
