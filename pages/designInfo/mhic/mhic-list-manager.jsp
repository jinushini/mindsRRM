<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	jn(".detailModify").click(function(){
		var id = jn(this).parent().parent().attr("rel");
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/Mhic_findModifyAuthority_mhic.action", //发送请求的地址
			async: false,
			data : {
				num : id
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var info = data.data;
				if(info != null){
					alertMsg.error(info);
				}else{
					var options={};
					options.title = "MHIC信息编辑";
					var url="../designInfo/Mhic_showMhic_mhic_mhic-detail-modify-input.action?num=" + id;
					navTab.openTab("modifyMhicDetail", url, options);
				}
			}
		});
	})
	
	jn(".funClone").click(function(){
		var id = jn(".mhicList .selected").attr("rel");
		if(id == null){
			alertMsg.error("请选择被复制的产品！");
			return false;
		}
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/Mhic_findModifyAuthority_mhic.action", //发送请求的地址
			async: false,
			data : {
				num : id
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var info = data.data;
				if(info != null){
					alertMsg.error(info);
				}else{
					var options={};
					options.width = 550;
					options.height = 500;
					var url = "../designInfo/Mhic_showMhic_mhic_mhic-detail-clone-input.action?num=" + id;
					$.pdialog.open(url, "new_msg", "MHIC性能复制", options);
				}
			}
		});
	})
	
	//js监听id为searchFrm的表单中enter键抬起事件
	jn("#searchFrm").bind("keyup",function(event){
		if(event.keyCode == "13"){
			jn("#searchFrm").submit();
		}
	})
	
	jn(function(){
		//获取列表行被双击事件
		jn("tbody tr").dblclick(function(){
			$(this).find(".details").click();
		})
		//当点击“重置”按钮时将查询输入框全部置空
		jn("#reset").click(function(){
			jn("input, #type").val("");
		})
	})
</script>
<div class="pageHeader" >
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post" id="searchFrm">
		<div class="searchBar" layoutH="770">
			<table class="edit_table" width="95%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品简称：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<select name="paramMap['m.simplifyName eq']" id="type" style="width:80%;">
							<option id="empty"></option>
							<option <s:if test="paramMap['m.simplifyName eq']=='通用放大器'">selected</s:if>>通用放大器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='低噪声放大器'">selected</s:if>>低噪声放大器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='功率放大器'">selected</s:if>>功率放大器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='增益可调放大器'">selected</s:if>>增益可调放大器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='移相衰减器'">selected</s:if>>移相衰减器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='倍频器'">selected</s:if>>倍频器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='混频器'">selected</s:if>>混频器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='自动增益控制放大器'">selected</s:if>>自动增益控制放大器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='线性化器'">selected</s:if>>线性化器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='开关'">selected</s:if>>开关</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='调制器'">selected</s:if>>调制器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='噪声源'">selected</s:if>>噪声源</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='功分合成器'">selected</s:if>>功分合成器</option>
						</select>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品代号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品名称：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.name like']" value="<s:property value="paramMap['m.name like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button type="submit" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">封装形式：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<input type="text" name="paramMap['m.packageForm like']" value="<s:property value="paramMap['m.packageForm like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">设计师名称：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.name like']" value="<s:property value="paramMap['m.singleHead.name like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">设计师工号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.staffId like']" value="<s:property value="paramMap['m.singleHead.staffId like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button id="reset" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">重置</span></button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	<div class="panelBar">
		<ul class="toolBar">
			<li><a href="../designInfo/Mhic_inputNewMhic_mhic_new-mhic-input.action" class="add" target="navTab"><span>添加新产品</span></a></li>
			<%-- <li><a href="../designInfo/Mhic_inputUpgradeMhic_mhic_upgrade-mhic-input.action?num={id}" class="add" target="navTab"><span>升级</span></a></li> --%>
			<li><a title="MHIC基本信息" href="../designInfo/Mhic_showMhic_mhic_mhic-name-show.action?num={id}" class="icon" target="dialog" height="400" width="500"><span>产品管理</span></a></li>
			<li><a title="确定要废弃吗" href="../designInfo/Mhic_abandon_mhic.action?num={id}" class="delete" target="ajaxTodo"><span>废弃</span></a></li>
			<li><a class="icon funClone" ><span>性能复制</span></a></li>
			<li><a title="确定将该产品加入优选目录吗" href="../designInfo/Mhic_addCatalog_mhic.action?num={id}" class="edit" target="ajaxTodo"><span>加入目录</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list mhicList" width="100%" layoutH="145" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="35">序号</th>
					<th width="120">产品代号</th>
					<th width="100">产品名称</th>
					<th width="100">设计师</th>
					<th width="120">封装形式</th>
					<th width="100">设计时间</th>
					<th width="80">目录状态</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<td align="center"><u:index value="#st.index+1"/></td>		
					<td style="padding:0 0 0 15px;"><s:property value="code"/></td>	
					<td align="center"><s:property value="name"/></td>
					<td align="center"><s:property value="singleHead.name"/></td>
					<td align="center"><s:property value="packageForm"/></td>
					<td align="center"><s:date name="designDate" format="yyyy-MM-dd"/></td>
					<td align="center">
						<s:if test="status != null">yes</s:if>
						<s:else>no</s:else>
					</td>
					<td align="center">
						<a href="../designInfo/Mhic_showMhic_mhic_mhic-detail-show.action?num=<s:property value='id' />" name="look" target="navTab" class="details">查看</a>&nbsp;|&nbsp;
						<a href="###" class="detailModify">编辑</a>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
