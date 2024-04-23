<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/user-tags" prefix="u" %>
<script type="text/javascript">
	
	jn("tbody tr").dblclick(function(){
		jn(this).find(".details").click();
	})
	
	jn("#type").change(function(){
		switch(jn("#type").val()){
			case 'MCM-R':
				var url="../designInfo/Mcm_showMcmListInCatalog_mcm_mcmR-list-catalog.action?data=MCM-R";
				navTab.loadUrl(url);
				break;
			case 'MCM-T':
				var url="../designInfo/Mcm_showMcmListInCatalog_mcm_mcmT-list-catalog.action?data=MCM-T";
				navTab.loadUrl(url);
				break;
			case 'MCM-TR':
				var url="../designInfo/Mcm_showMcmListInCatalog_mcm_mcmTR-list-catalog.action?data=MCM-TR";
				navTab.loadUrl(url);
				break;
			case 'MCM-FS':
				var url="../designInfo/Mcm_showMcmListInCatalog_mcm_mcmFS-list-catalog.action?data=MCM-FS";
				navTab.loadUrl(url);
				break;
			default:
				alert("error");	
				break;
		}
	})
	/* 
	jn(".detailModify").click(function(){
		var id = jn(this).parent().parent().attr("rel");
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../designInfo/Mcm_findModifyAuthority_mcm.action", //发送请求的地址
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
					var url="../designInfo/Mcm_showMcm_mcm_mcm-detail-modify-input.action?num=" + id;
					navTab.openTab("modifyMcmDetail", url, options);
				}
			}
		});
	})
	 */
	
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
			jn("input").val("");
		})
	})
	
</script>
<div class="pageHeader" >
	<form onsubmit="return navTabSearch(this);" action="<s:property value="page.url"/>" method="post" id="searchFrm">
		<div class="searchBar" layoutH="770">
			<table class="edit_table" width="95%" style="table-layout:fixed;margin:0px;">
				<tr>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品简号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<select name="data" id="type" style="width:80%;">
							<option value="MCM-R" selected>MCM-R</option>
							<option value="MCM-T">MCM-T</option>
							<option value="MCM-TR">MCM-TR</option>
							<option value="MCM-FS">MCM-FS</option>
						</select>
					</td>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">产品代号：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.code like']" value="<s:property value="paramMap['m.code like']"/>" style="width:80%;height:18px;" />
					</td> --%>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">输入频率：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.freqInMin==']" value="<s:property value="paramMap['m.freqInMin==']"/>" style="width:80%;height:18px;" />
					</td>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">输出频率：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.freqOutMin eq']" value="<s:property value="paramMap['m.freqOutMin eq']"/>" style="width:80%;height:18px;"/>
					</td> --%>
					<td style="width: 10%;padding:0px 0px 1px;border:hidden;">
						<button type="submit" style="height:23px;"><span style="padding-bottom:3px;font-size:13px;">查询</span></button>
					</td>
				</tr>
				<tr>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">带宽：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;border:hidden;">
						<input type="text" name="paramMap['m.bandwidth eq']" value="<s:property value="paramMap['m.bandwidth eq']"/>" style="width:80%;height:18px;"/>
					</td>
					<td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">功耗：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.powerConsume eq']" value="<s:property value="paramMap['m.powerConsume eq']"/>" style="width:80%;height:18px;" />
					</td> --%>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">变频次数：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="" value="<s:property value=''/>" style="width:80%;height:18px;"/>
					</td> --%>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">封装形式：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input type="text" name="paramMap['m.packageForm like']" value="<s:property value="paramMap['m.packageForm like']"/>" style="width:80%;height:18px;"/>
					</td> --%>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">最小日期：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input readonly="readonly" size="12" type="text" name="paramMap['m.createDate ge Date']" value="<s:property value="paramMap['m.createDate ge Date']"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'});"/>至
					</td> --%>
					<%-- <td style="width:10%;text-align: right;padding:0px 3px 0px;border:hidden;">最大日期：</td>
					<td style="width: 20%;padding:0px 0px 1px;border:hidden;">
						<input readonly="readonly" size="12" type="text" name="paramMap['m.createDate le Date']" value="<s:property value="paramMap['m.createDate le Date']"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59'});"/>
					</td> --%>
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
			<li><a title="MCM接收部件目录编辑" href="../designInfo/Mcm_showMcm_mcm_mcmR-catalog-show.action?num={id}" class="icon" target="dialog" height="720" width="600"><span>目录编辑</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
		<table class="list_table list mcmList" width="200%" layoutH="145" style="table-layout:fixed;">
			<thead>
				<tr>
					<th width="40">序号</th>
					<th width="100">产品代号</th>
					<th width="100">入库日期</th>
					<th width="100">输入频率(GHz)</th>
					<th width="100">输出频率(GHz)</th>
					<th width="100">带宽(GHz)</th>
					<th width="100">功耗(V/mA)</th>
					<th width="100">变频次数</th>
					<th width="100">封装形式</th>
					<th width="100">接收增益(dB)</th>
					<th width="100">接收噪声系数(dB)</th>
					<th width="100">镜频抑制(dB)</th>
					<th width="100">P-1(dBm)</th>
					<th width="100">谐杂波抑制(dB)</th>
					<th width="100">输入驻波</th>
					<th width="100">输出驻波</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
			  <s:iterator value="list" status="st">
				<tr target="id" rel="<s:property value="id"/>" >
					<td align="center"><u:index value="#st.index+1"/></td>
					<td align="center"><span><s:property value="code"/></span></td>
					<td align="center"><s:date name="createDate" format="YYYY.MM.DD" /></td>
					<td align="center"><span><s:property value="freqInMin"/>~<s:property value="freqInMax"/></span></td>
					<td align="center"><span><s:property value="freqOutMin"/>~<s:property value="freqOutMax"/></span></td>
					<td align="center"><span><s:property value="bandwidth"/></span></td>
					<td align="center"><span><s:property value="powerConsume"/></span></td>
					<td align="center"><span><s:property value="convFreqTimes"/></span></td>
					<td align="center"><span><s:property value="packageForm"/></span></td>
					<td align="center"><span><s:property value="gainRec"/></span></td>
					<td align="center"><span><s:property value="noiseFigureRec"/></span></td>
					<td align="center"><span><s:property value="imageFreqReject"/></span></td>
					<td align="center"><span><s:property value="powerP1"/></span></td>
					<td align="center"><span><s:property value="HCReject"/></span></td>
					<td align="center"><span><s:property value="standWaveIn"/></span></td>
					<td align="center"><span><s:property value="standWaveOut"/></span></td>
					<td align="center">
						<a href="../designInfo/Mcm_showMcm_mcm_mcm-detail-show.action?num=<s:property value='id' />"  height="600" width="500" name="look" target="navTab" class="details">查看</a>
						<!-- <a href="###" class="detailModify">编辑</a> -->
					</td>
				</tr>
			  </s:iterator>
			 </tbody>
		</table>
		<u:juipage></u:juipage>
	</div>
</div>
