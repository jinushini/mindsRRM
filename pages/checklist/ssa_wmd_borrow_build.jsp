<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		
		mergeCell();
		
		//动态添加relUser表格内人员输入框的name
		var k = 0;
		for(var i=0;i<jn("#relUser tr").length;i++){
			for(var j=0;j<jn("#relUser tr").eq(i).find("[type='text']").length;j++){
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).prev().attr("name","relUserList["+k+"].user.id");
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).attr("name","relUserList["+k+"].user.name");
				k = k+1;
			}
		}
	})
	
	//新增单板与继承单板的不同页面显示
	jn(".alter [name='checklist.changeSection']").val("");
	jn("[name='checklist.isInherit']").change(function(){
		switch(jn(this).val()){
			case '借用图纸':
				jn("[name='checklist.checklistType']").val("ssa_wmd_borrow");
				
				jn(".isInherit").attr("rowspan","1");
				//清空隐藏更改图纸部分
				jn(".alter input").val("");
				jn(".alter [name='checklist.changeSection']").val("");
				jn(".alter").hide();
				
				//清空隐藏新设计图纸部分
				jn(".design").hide();
				
				//显示借用图纸部分
				jn(".borrow").show();
				
				break;
			case '新设计图纸':
				jn("[name='checklist.checklistType']").val("ssa_wmd_noborrow");
				jn(".isInherit").attr("rowspan","1");
				//清空隐藏更改图纸部分
				jn(".alter input").val("");
				jn(".alter [name='checklist.changeSection']").val("");
				jn(".alter").hide();
				
				//清空隐藏借用图纸部分
				jn(".borrow input").val("");
				jn(".borrow").hide();
				
				//显示新设计图纸部分
				jn(".design").show();
				
				break;
			case '有更改图纸':
				jn("[name='checklist.checklistType']").val("ssa_wmd_noborrow");
				jn(".isInherit").attr("rowspan","4");
				//清空隐藏借用图纸部分
				jn(".borrow input").val("");
				jn(".borrow").hide();
				
				//清空隐藏新设计图纸部分
				jn(".design").hide();
				
				//显示有更改图纸部分
				jn(".alter [name='checklist.changeSection']").val("电性星有变化");
				jn(".alter").show();
				
				break;
			default:
				alert("error");	
				break;
		}
		var checklistType = jn("[name='checklist.checklistType']").val();
		$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../checklist/checklist!wmdItemChange.action", //发送请求的地址
			data : {
				checklistType : checklistType
			},//发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				createShowingTable(data);
			}
		});
	})
	 
	function createShowingTable(data){
		//生成item表
		var checkItemList = data.checkItemList;
		var item = "";
		for(var i=0;i<checkItemList.length;i++){
			item = item+"<tr><td align='center' class='item'>"+checkItemList[i].item+"</td><td>"+checkItemList[i].num+".&nbsp;"+checkItemList[i].demand+"</td><td align='center' class='firstCheck'><input type='text' style='border:0;width:95%;font-size:15px;margin:4px 0 4px 4px;padding:5px;' ></td></tr>";			
		}
		jn(".tbody").html(item);
		jn(".tbody").initUI();
		//合并单元格
		mergeCell();
		
		//生成relUser表
		var checkRoleList = data.checkRoleList;
		checkRoleList.remove(0);
		var relUser = "";
		for(var i=0;i<checkRoleList.length;i++){
			if(i==0||i%2==0){
				relUser = relUser+"<tr><td align='center' width='20%'>"+checkRoleList[i].roleName+"</td><td colspan='1'><input type='hidden' class='required' id='relUserId'><input type='text' class='required' id='relUserName' readonly='readonly' onclick='$(this).next().click()'><a style='display:none;' type='hidden' title='人员选择' class='btnLook' height='410' width='510' href='../system/user!findUser.action' target='dialog' rel='selectUser' resizable='false' maxable='false'><span>人员选择</span></a></td>";
			}
			if(i%2!==0||i==checkRoleList-1){
				relUser = relUser+"<td align='center' width='20%'>"+checkRoleList[i].roleName+"</td><td colspan='1'><input type='hidden' class='required' id='relUserId'><input type='text' class='required' id='relUserName' readonly='readonly' onclick='$(this).next().click()'><a style='display:none;' type='hidden' title='人员选择' class='btnLook' height='410' width='510' href='../system/user!findUser.action' target='dialog' rel='selectUser' resizable='false' maxable='false'><span>人员选择</span></a></td></tr>"
			}
		}
		jn("#relUser").html(relUser);
		jn("#relUser").initUI();
	}
	
	//合并单元格
	function mergeCell(){
		var z = 0;
		for(i=0;i<jn(".tbody tr").length;i++){
			var $referCol = jn(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jn(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
		}
	}
	
	jn("#submitBtn").click(function(){
		//动态添加item表格内输入框的name
		for(i=0;i<jn(".tbody tr").length;i++){
			jn(".tbody tr").eq(i).find(".firstCheck input").attr("name","checkResultList["+ i +"].firstCheck");
		}
		//动态添加relUser表格内人员输入框的name
		var k = 0;
		for(var i=0;i<jn("#relUser tr").length;i++){
			for(var j=0;j<jn("#relUser tr").eq(i).find("[type='text']").length;j++){
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).prev().attr("name","relUserList["+k+"].user.id");
				jn("#relUser tr").eq(i).find("[type='text']").eq(j).attr("name","relUserList["+k+"].user.name");
				k = k+1;
			}
		}
	})
</script>

<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklist!checklistBuildSave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="checklist.checklistType" value="<s:property value='checklistType'/>"/>
	<input type="hidden" name="checklist.version" value="<s:property value='version'/>"/>
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="version"/>版</div></td>
				</tr>
				<tr>
					<td align="center" colspan="6">
						<div style="width:100%;padding:3px 80px;">
							<label>型号代号</label><input type="text" name="checklist.modelCode" value="<s:property value="checklist.modelCode"/>" style="width:150px;">
							<label>产品名称</label><input type="text" name="checklist.productName" value="<s:property value="checklist.productName"/>" style="width:150px;">
							<label>产品代号</label><input type="text" name="checklist.productCode" value="<s:property value="checklist.productCode"/>" style="width:150px;">
						</div>
						<div style="width:100%;padding:3px 80px;float:left;">
							<label>图纸代号</label><input type="text" name="checklist.drawingCode" style="width:150px;">
							<label>研制阶段</label><input type="text" name="checklist.stage" style="width:150px;">
						</div>
					</td>
				</tr>
				
				<tr>
					<td align="center" style="width:20%" class="isInherit">
						<select name="checklist.isInherit" style="width:120px;margin-left:50px">
							<option value="借用图纸" >借用图纸</option>
							<option value="新设计图纸" >新设计图纸</option>
							<option value="有更改图纸" >有更改图纸</option>
						</select>
					</td>
            		<td align="center">
            			<div class="borrow" align="right">
            				<div style="width:100%;padding:3px 100px;">
            					<label >借用分机名称</label>
            					<input type="text" class="inherit" name="checklist.inheritExtensionName"style="width:150px;" >
            					<label>单板名称</label>
            					<input type="text" class="inherit" name="checklist.inheritSingleBoardName" style="width:150px;">
            				</div>
            				<div style="width:100%;padding:3px 100px;float:left;">
            					<label>图纸代号</label>
            					<input type="text" class="inherit" name="checklist.inheritDrawingCode" style="width:150px;" >
            					<label>研制阶段</label>
            					<input type="text" class="inherit" name="checklist.inheritStage" style="width:150px;" >
            				</div>
            			</div>
            			<div class="design" style="display:none;"></div>
            			<div class="alter" style="display:none;">
            				<label style="width:20%;margin-left:40px;">相对于同型号前阶段设计：</label>
            				<select name="checklist.changeSection" style="width:20%;margin-left:40px;">
            					<option value="电性星有变化" >电性星有变化</option>
            					<option value="鉴定件有变化" >鉴定件有变化</option>
            					<option value="正样有变化" >正样有变化</option>
            				</select>
            			</div>
            		</td>
				</tr>
				<tr style="display:none;" class="alter">
					<td>
						<label style="width:10%;margin-left:40px;">变化内容</label>
            			<input type="text" style="width:80%;" name="checklist.changeContent">
					</td>
				</tr>
				<tr style="display:none;" class="alter">
					<td>
						<label style="width:10%;margin-left:40px;">变化原因</label>
            			<input type="text" style="width:80%;" name="checklist.changeReason">
					</td>
				</tr>
				<tr style="display:none;" class="alter">
					<td>
						<label style="width:10%;margin-left:40px;">三单落实情况</label>
            			<input type="text" style="width:80%;" name="checklist.specialProblem">
					</td>
				</tr>
			</table>
		</fieldset>
		
		<div style="border: solid #C5DBEC 1px ;padding:5px 0px;margin:15px 50px 20px;background-color:#DFE8F6; text-decoration: underline ;text-align: center;font-size: 16px;">
			填写说明：设计、校对、审核需要对表内所有项目进行检查；填表时不能用符号代替“正确/错误”或“是/否”
		</div>
		<fieldset>
			<legend>检查内容</legend>
			<table width="98%" class="list_table list" style="margin:5px auto" >
				<thead>
					<tr align="center">
						<th width="11%">检查项目</th>
						<th width="40%">项目要求</th>
						<th width="26%">设计检查结果</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkItemList" status="st">
						<tr>
							<td align="center" class="item"><s:property value='item'/></td>
							<td><s:property value='num'/>.&nbsp;<s:property value='demand'/></td>
							<td align="center" class="firstCheck"><input type="text" style="border:0;width:95%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" ></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="checkRoleList" status="st">      
				  	<s:if test="#st.index>0">  
					  	<s:if test="#st.even||#st.first">      
	             	 		<tr>          
	         			</s:if>      
	         			<td align="center" width="20%"><s:property value='roleName'/></td>
	        			<td colspan="1">
							<input type="hidden" class="required" id="relUserId">
							<input type="text" class="required" id="relUserName" readonly="readonly" onclick="$(this).next().click()">
							<a style="display:none;" type="hidden" title="人员选择" class="btnLook" height="410" width="510"
								href="../system/user!findUser.action" target="dialog"
								rel="selectUser" resizable="false" maxable="false"><span>人员选择</span>
							</a>
						</td>
	        			<s:if test="#st.odd||#st.last">      
	            			</tr>          
	        			</s:if>
        			</s:if>
        		</s:iterator>
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>		
	</div>
   </form>
</div>