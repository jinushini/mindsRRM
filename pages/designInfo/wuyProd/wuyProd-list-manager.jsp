<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">

	jn("#newSelect").change(function(){
		switch(jn("#newSelect").val()){
			case '新建':
				break;
			case 'at':
				jn("#newSelect").val("新建");
				var url="../designInfo/WuyProd_returnjsp_wuyProd_new-wuyProd-input-at.action";
				navTab.openTab("newWuyProdInput", url, { title:"添加无源产品", fresh:false, data:{} });
				break;
			case 'mt':
				/* jn("#newSelect").val("新建");
				var url="../designInfo/WuyProd_returnjsp_wuyProd_new-wuyProd-input-mt.action";
				navTab.openTab("newWuyProdInput", url, { title:"添加无源产品", fresh:false, data:{} }); */
				alertMsg.info("正在开发!");
				break;
			case 'excel':
				jn("#newSelect").val("新建");
				var url="../designInfo/WuyProd_returnjsp_wuyProd_new-wuyProd-input-excel.action";
				navTab.openTab("newWuyProdInput", url, { title:"添加无源产品", fresh:false, data:{} });
				break;
			default:
				alert("error");
				break;
		}
	});
	
	/* jn(".detailModify").click(function(){
		var id = jn(this).parent().parent().attr("rel");
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/WuyProd_findModifyAuthority_wuyProd.action", //发送请求的地址
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
					options.title = "MCM信息编辑";
					var url="../designInfo/WuyProd_showWuyProd_wuyProd_wuyProd-detail-modify-input.action?num=" + id;
					navTab.openTab("modifyWuyProdDetail", url, options);
				}
			}
		});
	}) */
	
	/* jn(".funClone").click(function(){
		var id = jn(".wuyProdList .selected").attr("rel");
		if(id == null){
			alertMsg.error("请选择被复制的产品！");
			return false;
		}
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/WuyProd_findModifyAuthority_wuyProd.action", //发送请求的地址
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
					var url = "../designInfo/WuyProd_showWuyProd_wuyProd_wuyProd-detail-clone-input.action?num=" + id;
					$.pdialog.open(url, "new_msg", "MCM性能复制", options);
				}
			}
		});
	}) */
	
	//js监听id为searchFrm的表单中enter键抬起事件
	jn("#searchFrm").bind("keyup",function(event){
		if(event.keyCode == "13"){
			jn("#searchFrm").submit();
		}
	})
	
	jn(function(){
		//获取列表行被双击事件
		jn("tbody tr").dblclick(function(){
			jn(this).find(".details").click();
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
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品简称</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<select name="paramMap['m.simplifyName eq']" id="type" style="width:83%;">
							<option id="empty"></option>
							<option <s:if test="paramMap['m.simplifyName eq']=='输入多工器'">selected</s:if>>输入多工器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='输出多工器'">selected</s:if>>输出多工器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='输入滤波器'">selected</s:if>>输入滤波器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='输出滤波器'">selected</s:if>>输出滤波器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='测试耦合器'">selected</s:if>>测试耦合器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='混合接头'">selected</s:if>>混合接头</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='功分器'">selected</s:if>>功分器</option>
							<option <s:if test="paramMap['m.simplifyName eq']=='微波开关'">selected</s:if>>微波开关</option>
						</select>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">图纸代号</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.selProdCode like']" value="<s:property value="paramMap['m.selProdCode like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品代号</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品名称</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.name like']" value="<s:property value="paramMap['m.name like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button type="submit" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">型号代号</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.libCode like']" value="<s:property value="paramMap['m.libCode like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">分系统名称</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.subSystem like']" value="<s:property value="paramMap['m.subSystem like']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">设计师名称</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.singleHead.name like']" value="<s:property value="paramMap['m.singleHead.name like']"/>" style="width:80%;height:18px;" />
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">工作频段</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<select name="paramMap['m.freqWork eq']" id="type" style="width:83%;">
							<option id="empty"></option>
							<option <s:if test="paramMap['m.freqWork eq']=='VHF频段（300MHz以下）'">selected</s:if>>VHF频段（300MHz以下）</option>
							<option <s:if test="paramMap['m.freqWork eq']=='UHF频段（300-1000MHz）'">selected</s:if>>UHF频段（300-1000MHz）</option>
							<option <s:if test="paramMap['m.freqWork eq']=='L频段'">selected</s:if>>L频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='S频段'">selected</s:if>>S频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='C频段'">selected</s:if>>C频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='X频段'">selected</s:if>>X频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='Ku频段'">selected</s:if>>Ku频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='Ka频段'">selected</s:if>>Ka频段</option>
							<option <s:if test="paramMap['m.freqWork eq']=='EHF频段（30-300GHz）'">selected</s:if>>EHF频段（30-300GHz）</option>
							<option <s:if test="paramMap['m.freqWork eq']=='EHF频段以上'">selected</s:if>>EHF频段以上</option>
						</select>
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
			<li style="margin-right:5px;">
				<select style="width:120px;" id="newSelect">
					<option value="新建" selected>----添加新产品----</option>
					<option value="at">自动命名</option>
					<option value="mt">手动录入</option>
					<option value="excel">Excel导入</option>
				</select>
			</li>
			<%-- <li><a href="../designInfo/WuyProd_returnjsp_wuyProd_new-wuyProd-input-at.action" class="add" target="navTab"><span>添加新产品</span></a></li> --%>
			<li><a title="产品基本信息" href="../designInfo/WuyProd_showWuyProd_wuyProd_wuyProd-name-show.action?num={id}" class="icon" target="dialog" height="600" width="500"><span>产品管理</span></a></li>
			<li><a title="废弃后该产品继续存在，产品代号被占用" href="../designInfo/WuyProd_abandon_wuyProd.action?num={id}" class="delete" target="ajaxTodo"><span>临时废弃</span></a></li>
			<li><a title="彻底删除后，该产品的代号将被释放" href="../designInfo/WuyProd_delete_wuyProd.action?num={id}" class="delete" target="ajaxTodo"><span>删除产品</span></a></li>
			<li><a title="图纸代号查重" href="../designInfo/WuyProd_findRepeatSelProdCode_wuyProd.action" class="icon"  target="ajaxTodo"><span>图纸代号查重</span></a></li>
			<%-- <li><a class="icon funClone" ><span>性能复制</span></a></li> --%>
			<%-- <li><a title="确定将该产品加入优选目录吗" href="../designInfo/WuyProd_addCatalog_wuyProd.action?num={id}" class="edit" target="ajaxTodo"><span>加入目录</span></a></li> --%>
			<%-- <li><a href="../designInfo/WuyProd_exchange.action" class="edit" target="ajaxTodo"><span>历史数据处理</span></a></li> --%>
		</ul>
	</div>
	<div layoutH="120">
		<table class="list_table list wuyProdList" width="100%" layoutH="145" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="35">序号</th>
					<th width="120">图纸代号</th>
					<th width="120">产品代号</th>
					<th width="100">产品名称</th>
					<th width="100">型号代号</th>
					<th width="100">分系统名称</th>
					<th width="100">设计师</th>
					<th width="120">工作频段</th>
					<th width="100">入库时间</th>
					<!-- <th width="80">目录状态</th> -->
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<td align="center"><u:index value="#st.index+1"/></td>		
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='selProdCode'/>"><s:property value="selProdCode"/></td>	
					<td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='code'/>"><s:property value="code"/></td>	
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='name'/>"><s:property value="name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='libCode'/>"><s:property value="libCode"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='subSystem'/>"><s:property value="subSystem"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='singleHead.name'/>"><s:property value="singleHead.name"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:property value='freqWork'/>"><s:property value="freqWork"/></td>
					<td align="center" style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<s:date name='createDate' format='yyyy-MM-dd'/>"><s:date name="createDate" format="yyyy-MM-dd"/></td>
					<td align="center">
						<a href='../designInfo/WuyProd_showWuyProd_wuyProd_wuyProd-detail-show.action?num=<s:property value="id"/>' name="look" target="navTab" class="details">查看</a><%-- &nbsp;|&nbsp;
						<a href='../designInfo/WuyProd_showWuyProd_wuyProd_wuyProd-detail-modify-input.action?num=<s:property value="id"/>' name="look" target="navTab">编辑</a> --%>
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
	</div>
	<div class="formBar" style="text-align： center;">
		<u:juipage></u:juipage>
	</div>
</div>

