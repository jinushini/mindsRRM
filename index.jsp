<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>平台管理</title>

<link href="../../frame/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="../../frame/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- 生产力工具样式 -->
<link href="../../css/extstyle-lb.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- daypilot样式 -->
<link href="../../css/calendar_green.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- 打印样式 -->
<!-- <link href="../../css/print.css" rel="stylesheet" type="text/css" media="print"/> -->
<!-- 普通会议、通知文件样式 -->
<link href="../../css/custom_file_css/weibosuowenjian_yangshi.css" rel="stylesheet" type="text/css"/>
<!-- 评审报告文件样式 -->
<link href="../../css/custom_file_css/weibosuo_pingshenbaogao_yangshi.css" rel="stylesheet" type="text/css"/>
<!-- 公文1文件样式 -->
<link href="../../css/custom_file_css/weibosuo_suojigongwen1_yangshi.css" rel="stylesheet" type="text/css"/>
<!-- 公文2文件样式 -->
<link href="../../css/custom_file_css/weibosuo_suojigongwen2_yangshi.css" rel="stylesheet" type="text/css"/>
<!-- big-flow样式 -->
<link href="../../css/big-flow.css"rel="stylesheet" type="text/css" media="screen"/>

<!-- bootstrap样式
<link href="../../css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/> -->
<!-- font-awesome样式 -->
<link href="../../css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- 用户自定义样式 -->
<link href="../../css/user-interface.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="../../frame/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->


<script src="../../css/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" ></script>

<!--[if lt IE 9]><script src="../../frame/js/speedup.js" type="text/javascript"></script><script src="../../frame/js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
<!--[if gte IE 9]><!--><script src="../../frame/js/jquery-2.1.4.min.js" type="text/javascript"></script><!--<![endif]-->

<script src="../../frame/js/jquery.cookie.js" type="text/javascript"></script>
<script src="../../frame/js/jquery.validate.js" type="text/javascript"></script>
<script src="../../frame/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="../../frame/js/jquery.metadata.js" type="text/javascript"></script>

<script src="../../frame/js/dwz.core.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.util.date.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.drag.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.tree.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.accordion.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.ui.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.theme.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.navTab.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.tab.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.resize.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.dialog.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.stable.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.ajax.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.pagination.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.database.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.effects.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.panel.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.history.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.combox.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.print.js" type="text/javascript"></script>
<script src="../../frame/js/common.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.file.js" type="text/javascript"></script>

<script src="../../frame/xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="../../frame/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="../../frame/js/dwz.regional.zh.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="../../frame/chart/raphael.js"></script>
<script type="text/javascript" src="../../frame/chart/g.raphael.js"></script>
<script type="text/javascript" src="../../frame/chart/g.bar.js"></script>
<script type="text/javascript" src="../../frame/chart/g.line.js"></script>
<script type="text/javascript" src="../../frame/chart/g.pie.js"></script>
<script type="text/javascript" src="../../frame/chart/g.dot.js"></script>

<!--日期控件  -->
<script src="../../js/component/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="../../js/component/dateFormat.js" type="text/javascript"></script>

<script src="../../js/jQuery.print.js" type="text/javascript"></script>
<script type="text/javascript">


	$(function() {
		
		
		var personoption = new Array(0,0,0,0,0);//从配置中获取是否显示该模块
		
		var flag=false;//在首页从右往左添加显示模块
		var aa="";
		 $.ajax({
			 	async:false,
				global : false,
				type : 'post',
				dataType : "json",
				url : "../fextends/user!findPersonConfig.action", 
				data:{},
				success : function(data, statusText) {
					
				    if(data.userSetting.visible_bigflow==1){
				    	personoption[0]=1;
				    	
						}
					if(data.userSetting.visible_weeklymeeting==1){
						personoption[1]=1;
						
						}
					if(data.userSetting.visible_checklist==1){
						personoption[2]=1;
						}
					if(data.userSetting.visible_nodemonth==1){
						personoption[3]=1;
						}
					if(data.userSetting.visible_reviewlist==1){
						personoption[4]=1;
						} 
				
				}
			});   
		 
		// console.log(personoption);
		
		if(personoption[1]==1){
			if(flag){
				aa="right";
			}else{
				aa="left";
			}
			$("#indexpanel").append("<div class='panel' defH='380' style='width: 49%;float:"+aa+"; margin-top: 1%'>"
					+"<h1 class='fixup'>本周会议</h1>"
					+"<div id='weeklyMeeting'>"
					+"<table class='list' width='98%'>"
					+"<tbody></tbody>"
					+"</table>"
					+"</div>"
					+"</div>");
				flag=!flag;
			}
		if(personoption[2]==1){
			if(flag){
				aa="right";
			}else{
				aa="left";
			}
			$("#indexpanel").append("<div class='panel' defH='380' style='width: 49%;float: "+aa+"; margin-top: 1%'>"
					+"<h1 class='fixup'>检查单</h1>"
					+"<div id='myChecklist'>"
					+"<table class='list' width='98%'>"
					+"<tbody></tbody>"
					+"</table>"
					+"</div>"
					+"</div>");
			flag=!flag;
		}
		if(personoption[3]==1){
			if(flag){
				aa="right";
			}else{
				aa="left";
			}
			$("#indexpanel").append("<div class='panel' defH='380' style='width: 49%;float: "+aa+"; margin-top: 1%'>"
					+"<h1 class='fixup'>本月节点</h1>"
					+"<div id='weekyDuty'>"
					+"<table class='list' width='98%'>"
					+"<tbody></tbody>"
					+"</table>"
					+"</div>"
					+"</div>");
			flag=!flag;
		}
		if(personoption[0]==1){
			if(flag){
				aa="right";
			}else{
				aa="left";
			}
			$("#indexpanel").append("<div class='panel' defH='380' style='width: 49%;float: "+aa+"; margin-top: 1%'>"
					+"<h1 class='fixup'>大流程</h1>"
					+"<div id='SSAPSList'>"
					+"<table class='list' width='98%'>"
					+"<tbody></tbody>"
					+"</table>"
					+"</div>"
					+"</div>");
			flag=!flag;
		}
		if(personoption[4]==1){
			if(flag){
				aa="right";
			}else{
				aa="left";
			}
			$("#indexpanel").append("<div class='panel' defH='380' style='width: 49%;float: "+aa+"; margin-top: 1%'>"
					+"<h1 class='fixup'>复查</h1>"
					+"<div id='ReviewBill'>"
					+"<table class='list' width='98%'>"
					+"<tbody></tbody>"
					+"</table>"
					+"</div>"
					+"</div>");
			flag=!flag;
		}
		
		
		
		//用户ajax
		interfaceAjax();
		//待办事项的ajax
		taskAjax();
		//消息数量刷新
		mesgAjax();
		
		//检查单
		myChecklistAjax();
		//本周会议
		weeklyMeetingAjax();
		//大流程
		SSAPSListAjax();
		//复查
		ReviewBillAjax();
		
		/*发起会议*/
		/* $("#meeting").click(function(){
			var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
		    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器 
		    if(isIE){
		    	 var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
		         reIE.test(userAgent);
		         var fIEVersion = parseFloat(RegExp["$1"]);
		         if(fIEVersion <= 8) {
		        	 alertMsg.error("请使用火狐浏览器或谷歌浏览器打开");
		        	 jn(this).removeAttr("target");
		        	 jn(this).attr("href", "#");
		         }
		    }
		}); */
		
		
		//点击消息提醒时，消息提醒隐藏
		/* $("a[class=IndexNewMessage]").click(function() {
			$("a[class=IndexNewMessage]").hide();
		}); */
		

		DWZ.init("../../frame/dwz.frag.xml", {
			loginUrl : "login_dialog.html",
			loginTitle : "登录", // 弹出登录对话框
			//		loginUrl:"login.html",	// 跳到登录页面
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301
			}, //【可选】
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			}, //【可选】
			keys : {
				statusCode : "statusCode",
				message : "message"
			}, //【可选】
			ui : {
				hideMode : 'offsets'
			}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});

	});

	//定时器
	$(function() {
		setInterval(clock, 600000)//定时10mins
		function clock() {
			$("a[class=IndexNewMessage]").show();
			//消息刷新
			mesgAjax();
		}
	});

	//用户状态的ajax
	function interfaceAjax() {
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/user!userInterface.action",
			/* data:{
				"organizationId":organizationId,
				"userInfo":$("#userInfo").val()
			}, */
			success : function(data, statusText) {
				$(data).initUI();
				$("#interface").append($(data));
				$("#interface").initUI();
			}
		});
	}
	
	//待办事项的ajax
	function taskAjax() {
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/taskQuery!showPersonalTaskPanel.action",
			/* data:{
				"organizationId":organizationId,
				"userInfo":$("#userInfo").val()
			}, */
			success : function(data, statusText) {
				$(data).initUI();
				$("#taskDiv").append($(data));
				$("#taskDiv").initUI();
			}
		});
	}

	//消息数量的ajax
	function mesgAjax() {
		$.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../fextends/external!findNewMessageCount.action",
			/* data:{
				"organizationId":organizationId,
				"userInfo":$("#userInfo").val()
			}, */
			success : function(data, statusText) {
				$("a[class=IndexNewMessage]").empty();
				if (data.count != 0) {
					$(".IndexNewMessage").text(data.count);
					/* $("div[class=IndexNewMessage]").initUI(); */
					/* navTab.openTab(tabid, url, options); */
				}
			}
		});
	}
	function weeklyMeetingAjax(){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/external!weeklyMeeting.action",
			success : function(data, statusText) {
				$(data).initUI();
				$("#weeklyMeeting").append($(data));
				$("#weeklyMeeting").initUI();
			}
		});
		
	}
	function SSAPSListAjax(){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/external!inputSSAPSList.action",
			success : function(data, statusText) {
				$(data).initUI();
				$("#SSAPSList").append($(data));
				$("#SSAPSList").initUI();
			}
		});
		
	}
	function myChecklistAjax(){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/external!showMyChecklist.action",
			success : function(data, statusText) {
				$(data).initUI();
				$("#myChecklist").append($(data));
				$("#myChecklist").initUI();
			}
		});
		
	}
	function ReviewBillAjax(){
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : "../fextends/external!showAllReviewBill.action",
			success : function(data, statusText) {
				$(data).initUI();
				$("#ReviewBill").append($(data));
				$("#ReviewBill").initUI();
			}
		});
		
	}
	
</script>
</head>

<body>
	<div id="layout">
		<div id="header">
			<div class="logo">
			</div>
			<div class="headerNav">
				<ul class="themeList" id="themeList">
					<%-- <li><s:property value="user.name"/>，您好！</li> --%>
					<li><a href="../wiki/xwiki!goToXWiki.action" id="xwiki" target="navTab" title="知识库 "><i class="fa fa-book fa-3x icon_width"></i><span style="font-size:16px">知识库 </span></a></li>
					<li><a href="../manage/weeklyMeeting!inputMeeting.action" id="meeting" target="navTab" title="发起会议  "><i class="fa fa-calendar fa-3x icon_width"></i><span style="font-size:16px">会议申请</span></a></li>
					<li><a href="../fextends/user!showPerson.action" id="person" target="navTab" title="个人资料"><i class="fa fa-info-circle fa-3x icon_width"></i><span style="font-size:16px">个人信息</span></a></li>
					<li><a href="#" ><i class="fa fa-check-square-o fa-3x icon_width" style="text-align:right;"></i><span style="font-size:16px">待办跟踪</span></a></li>
					<li><a href="../fextends/coin!showPersonCoin.action" id="personCoin" target="navTab" title="金币值" style="text-align:center;" ><i class="fa fa-usd fa-3x icon_width" ></i><span style="font-size:16px">金币值</span></a></li>
					
					
					<%-- <li><a href="../inform/message!showNewMsg.action" id="message" target="navTab" title="新消息" style="text-align:right;"><i class="fa fa-envelope-o fa-3x icon_width"></i><span><br/><s:if test="messageCount==0"><span>无未读消息</span></s:if>
					<s:else><span><span style="color:red;"><s:property value="messageCount"/></span></span></s:else></span></a></li>
					<li><br/><br/><a href="../inform/message!showNewMsg.action" target='navTab' class='IndexNewMessage'></a></li>
					 --%>
					<li style="width:83px"><a href="../inform/message!showNewMsg.action" id="message" target="navTab" title="新消息" style="text-align:center;" class="nav-link"><i class="fa fa-envelope-o fa-3x icon_width" ></i><div class="nav-counter nav-counter-red IndexNewMessage">100</div></a></li>
					
					<li><br/><br/><span>欢迎您:<s:property value="#session.certificate.user.name"/></span></li>
					<li><br/><br/><span>【<a href="../../login.jsp"  style="color:red">注销</a>】</span></li>
					<!-- <li theme="default"><div>蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="red"><div>红色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div class="selected">天蓝</div></li> -->
				</ul>		
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2 class="fixup">主菜单</h2><div id="shrink">收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<s:iterator value="list" id="e">
						<!-- 一级菜单 -->
						<div class="accordionHeader">
							<h2 class="fixup"><span></span><s:property value="#attr.e.name"/></h2>
						</div>
						<div class="accordionContent">
							<!-- 二级菜单 -->
							<ul class="tree treeFolder">
								<s:iterator value="menuSet" id="e2">
									<s:if test="user.contiansMenu(#attr.e2)">
										<li>
											<s:if test="#attr.e2.href==null"><a><s:property value="#attr.e2.name"/></a></s:if>
											<s:else><a href="<s:property value="#attr.e2.href"/>" name="<s:property value="#attr.e2.name"/>" target="navTab" rel="<s:property value="#attr.e2.description==null?#attr.e2.id:#attr.e2.description"/>" <s:property value="#attr.e2.external"/> <s:if test="#attr.e2.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e2.name"/></a></s:else>
											<s:if test="#attr.e2.menuSet.size()!=0">
												<!-- 三级菜单 -->
												<ul>
													<s:iterator value="#attr.e2.menuSet" id="e3">
														<s:if test="user.contiansMenu(#attr.e3)">
															<li>
																<s:if test="#attr.e3.href==null"><a><s:property value="#attr.e3.name"/></a></s:if>
																<s:else><a href="<s:property value="#attr.e3.href"/>" name="<s:property value="#attr.e3.name"/>" target="navTab" rel="<s:property value="#attr.e3.description==null?#attr.e3.id:#attr.e3.description"/>" <s:property value="#attr.e3.external"/> <s:if test="#attr.e3.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e3.name"/></a></s:else>
																<s:if test="#attr.e3.menuSet.size()!=0">
																	<!-- 四级菜单 -->
																	<ul>
																		<s:iterator value="#attr.e3.menuSet" id="e4">
																			<s:if test="user.contiansMenu(#attr.e4)">
																				<li>
																					<s:if test="#attr.e4.href==null"><a><s:property value="#attr.e4.name"/></a></s:if>
																					<s:else><a href="<s:property value="#attr.e4.href"/>" name="<s:property value="#attr.e4.name"/>" target="navTab" rel="<s:property value="#attr.e4.description==null?#attr.e4.id:#attr.e4.description"/>" <s:property value="#attr.e4.external"/> <s:if test="#attr.e4.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e4.name"/></a></s:else>
																					<s:if test="#attr.e4.menuSet.size()!=0">
																						<!-- 五级菜单 -->
																						<ul>
																							<s:iterator value="#attr.e4.menuSet" id="e5">
																								<s:if test="user.contiansMenu(#attr.e5)">
																									<li>
																										<s:if test="#attr.e5.href==null"><a><s:property value="#attr.e5.name"/></a></s:if>
																										<s:else><a href="<s:property value="#attr.e5.href"/>" name="<s:property value="#attr.e5.name"/>" target="navTab" rel="<s:property value="#attr.e5.description==null?#attr.e5.id:#attr.e5.description"/>" <s:property value="#attr.e5.external"/> <s:if test="#attr.e5.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e5.name"/></a></s:else>
																										<s:if test="#attr.e5.menuSet.size()!=0">
																											<!-- 六级菜单 -->
																											<ul>
																												<s:iterator value="#attr.e5.menuSet" id="e6">
																													<s:if test="user.contiansMenu(#attr.e6)">
																														<li>
																															<s:if test="#attr.e6.href==null"><a><s:property value="#attr.e6.name"/></a></s:if>
																															<s:else><a href="<s:property value="#attr.e6.href"/>" name="<s:property value="#attr.e6.name"/>" target="navTab" rel="<s:property value="#attr.e6.description==null?#attr.e6.id:#attr.e6.description"/>" <s:property value="#attr.e6.external"/> <s:if test="#attr.e6.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e6.name"/></a></s:else>
																														</li>
																													</s:if>
																												</s:iterator>
																											</ul>
																										</s:if>
																									</li>
																								</s:if>
																							</s:iterator>
																						</ul>
																					</s:if>
																				</li>
																			</s:if>
																		</s:iterator>
																	</ul>
																</s:if>
															</li>
														</s:if>
													</s:iterator>
												</ul>
											</s:if>
										</li>
									</s:if>
								</s:iterator>								
							</ul>
<%-- 							<ul class="tree treeFolder">
								<s:iterator value="menuSet" id="e2">
									<s:if test="user.contiansMenu(#attr.e2)">
										<li>
											<s:if test="#attr.e2.href==null"><a><s:property value="#attr.e2.name"/></a></s:if>
											<s:else><a href="<s:property value="#attr.e2.href"/>" name="<s:property value="#attr.e2.name"/>" target="navTab" rel="<s:property value="#attr.e2.description==null?#attr.e2.id:#attr.e2.description"/>" <s:property value="#attr.e2.external"/> <s:if test="#attr.e2.external=='false'">external="false"</s:if><s:else>external="true"</s:else>  ><s:property value="#attr.e2.name"/></a></s:else>
											<s:if test="#attr.e2.menuSet.size()!=0">
												<!-- 三级菜单 -->
												<ul>
													<s:iterator value="#attr.e2.menuSet" id="e3">
														<s:if test="user.contiansMenu(#attr.e3)">
															<li class="current">
																<a href="<s:property value="#attr.e3.href"/>" name="<s:property value="#attr.e3.name"/>" target="navTab" rel="<s:property value="#attr.e3.id"/>" <s:if test="#attr.e3.external=='false'">external="false"</s:if><s:else>external="true"</s:else> ><s:property value="#attr.e3.name"/></a>
															</li>
														</s:if>
													</s:iterator>
												</ul>
											</s:if>
										</li>
									</s:if>
								</s:iterator>								
							</ul> --%>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div id="indexpanel" class="pageFormContent" layoutH="0" style="margin-right:10px;">
						
							<!-- <div class="panel" defH="120" style="width: 49%;float: left;">
								<div id="interface" style="overflow:hidden ;">
									
								</div>
							</div> -->
							<div class="panel" defH="380" style="width: 49%;float: right;margin-top: 1%;">
								<h1 class="fixup">待办事项</h1>
								<div id="taskDiv">
									<table class="list" width="98%">
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							<!--  <div class="panel" defH="270" style="width: 49%;float: left;">
								<h1 class="fixup">本周会议</h1>
								<div id="weeklyMeeting">
									<table class="list" width="98%">
										<tbody>
											
										</tbody>
									</table>
								</div>
							</div>
							
					<div class="panel" defH="270" style="width: 49%;float: right; margin-top: 1%">
							<h1 class="fixup">检查单</h1>
								<div id="myChecklist">
									<table class="list" width="98%">
										<tbody>
										</tbody>
									</table>
								</div>
								
							</div>
							
							<div class="panel" defH="270" style="width: 49%;float: left;margin-top: 1%">
								<h1 class="fixup">本月节点 </h1>
								<div id="weekyDuty">
									<table class="list" width="98%">
										<tbody>
										<p>开发中。。</p>
										</tbody>
									</table>


			          </div>
					</div>
							<div class="panel" defH="270" style="width: 49%;float: right; margin-top: 1%">
							<h1 class="fixup">大流程</h1>
								<div id="SSAPSList">
									<table class="list" width="98%">
										<tbody>
										</tbody>
									</table>
								</div>
								
							</div>
							<div class="panel" defH="270" style="width: 49%;float: left; margin-top: 1%">
							<h1 class="fixup">复查</h1>
								<div id="ReviewBill">
									<table class="list" width="98%">
										<tbody>
										</tbody>
									</table>
								</div>
								
							</div>  -->
				</div>
			</div>
		</div>

	</div>
</div>

	

</body>
<div id="footer">Copyright &copy; 2017 西安分院微波所版权所有</div>
</html>
