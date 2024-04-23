<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jd(function(){  
		
		//切换完整版本与最终版本
		jd("#switchShow").change(function(){
			$.pdialog.reload("../checklist/checklistAppr!showChecklist.action?flag=" + jd("#switchShow").val() + "&checklistId=" + <s:property value='checklist.id' />);
		})
		//完整版本与最终版本下拉框默认选中
		if(jd("#flag").val()!=""){
			jd("#switchShow").val("<s:property value='flag' />");
		}
		
		jd("#fullScrBtn").click(function(){
			jd(".maximize").click();
		})
		
		var z = 0;
		for(var i=0;i<jd(".tbody tr").length;i++){
			
			//合并单元格
			var $referCol = jd(".tbody tr").eq(i-z).find(".item");
			var $itemCol = jd(".tbody tr").eq(i+1).find(".item");
			if($itemCol.text() == $referCol.text() ){
				$itemCol.hide();
				z = z+1;
			}else{
				$referCol.attr("rowspan",z+1);
				z = 0;
			}
			
			//检查结果在单元格内的输出格式
			var $thisRow = jd(".tbody tr").eq(i);
			var text="";
			
			for(var j=0;j<$thisRow.find("div").length;j++){
				var $thisDiv = $thisRow.find("div").eq(j);
				
				//将检查结果从㊣字符处切开，规整成“原：”“改”的形式
				var arr = $thisDiv.text().split('㊣');
				if(arr.length==1){
					text = arr[0];
				}else{
					for(var k=0;k<arr.length;k++){
						if(k==0){
							text = "<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
						}else if(k==arr.length-1){
							text = text+"<span style='color:#3DAB0B;font-size:15px;'>改：</span>"+arr[k];
						}else{
							text = text+"<span style='color:red;font-size:15px;'>原：</span>"+arr[k]+"<br/><br/>";
						}
					}
				}
				$thisDiv.empty().append(text);
			}
		}
		
		//控制流程不同界面中审批意见的显示
		jd("#approveComment tr:eq(0)").remove();
		if(jd("#relUser tr").eq(2).find("td").eq(0).find("#submitDate").text()==""){
			jd("#approveComment tr:eq(3)").hide();
			if(jd("#relUser tr").eq(1).find("td").eq(1).find("#submitDate").text()==""){
				jd("#approveComment tr:eq(2)").hide();
				if(jd("#relUser tr").eq(1).find("td").eq(0).find("#submitDate").text()==""){
					jd("#approveComment tr:eq(1)").hide();
					if(jd("#relUser tr").eq(0).find("td").eq(1).find("#submitDate").text()==""){
						jd("#approveComment").hide();
					}
				}
			}
		}
	})
	
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr >
					<td align="center" colspan="6" style="padding:20px">
						<span style="font-size:23px;width:80%"><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</span>
						<input type="hidden" id="flag" value="<s:property value='flag' />"/>
						<select id="switchShow" style="width:100px;float:right;margin-left:-100px;">
							<option value="final">最终版本</option>
							<option value="whole">完整版本</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="6">
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">型号代号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 25%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 25%;">产品代号：<s:property value="checklist.productCode"/></label>
						</div>
						<div style="width:110%;padding:1px 15%;" >
							<label style="width: 25%;">研制阶段：<s:property value="checklist.stage"/></label>
							<label style="width: 25%;">检查单编号：<s:property value="checklist.checklistNum"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>检查内容</legend>		
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center">
						<th width="10%">检查项目</th>
						<th width="20%">注意事项 </th>
						<th width="13%">检查结果</th>
						<th width="22%">备注</th>
						<th width="5%">是否闭环</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st" >
						<tr>
							<td align="center" class="item"><s:property value='checkItem.item'/></td>
							<td style="padding:5px 15px;"><s:property value='checkItem.num'/>.&nbsp;<s:property value='checkItem.demand'/></td>
							<td style="padding:5px 15px;" >
								<div style="font-size:15px;"><s:property value='firstCheck'/></div>
							</td>
							<td style="padding:5px 15px;">
								<div style="font-size:15px;"><s:property value='secondCheck'/></div>
							</td>
							<td align="center" style="padding:5px 15px;">
								<div style="font-size:15px;"><s:property value='remark'/></div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset id="approveComment">
			<legend>审批意见</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">
				<s:iterator value="relUserList" status="st">
					<tr>
						<td align="center" width="15%"><s:property value='checkRole.roleName'/>意见：</td>
						<td><div style="width: 90%; color:red;"><s:property value="approve.comments"/></div></td>
					</tr>
				</s:iterator>
			</table>
		</fieldset>
		<fieldset>
			<legend>相关人员</legend>
			<table width="98%" class="edit_table" style="margin:5px auto" id="relUser">
				<s:iterator value="relUserList" status="st">      
				  	<s:if test="#st.odd||#st.first">      
             	 		<tr>
         			</s:if>      
        			<td width="50%">
						<span style="font-size:15px"><s:property value='checkRole.roleName'/></span>：
						<s:property value='user.name'/>
						<s:if test="approve != null ">
							&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="submitDate" style="font-size:14px">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
						</s:if>
						
					</td> 
        			<s:if test="#st.even||#st.last">      
            			</tr>          
        			</s:if>      
        		</s:iterator>
				
			</table>
		</fieldset>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li><a class="button" id="fullScrBtn"><span>全屏查看</span></a></li>
			<li><a class="button" id="print" href="../checklist/print!printChecklist.action?checklistId=<s:property value='checklist.id'/>"><span>生成Word</span></a></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close" id="cancelBtn">关闭</button></div></div></li>
		</ul>			
	</div>
</div>