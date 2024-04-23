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
		
	})
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<tr >
					<td align="center" colspan="6" style="padding:20px">
						<div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</div>（参照QW-Q-20-27-2013/航天器产品验收管理规定拟制，有裁剪）
						<input type="hidden" id="flag" value="<s:property value='flag' />"/>
						<select id="switchShow" style="width:100px;float:right;margin:-35px 0 0 -100px;">
							<option value="final">最终版本</option>
							<option value="whole">完整版本</option>
						</select>
						
					</td>
				</tr>
				</tr>
				<tr>
					<td align="left">
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">型号代号：<s:property value="checklist.modelCode"/></label>
							<label style="width: 20%;">产品名称：<s:property value="checklist.productName"/></label>
							<label style="width: 20%;">产品代号：<s:property value="checklist.productCode"/></label>
							<label style="width: 20%;">所属分系统：<s:property value="checklist.subSystem"/></label>
						</div>
						<div style="width:100%;padding:1px 15%;">
							<label style="width: 20%;">阶段标志：<s:property value="checklist.stage"/></label>
							<label style="width: 20%;">产品编号：<s:property value="checklist.productNum"/></label>
							<label style="width: 20%;">产品类别：<s:property value="checklist.productType"/></label>
							<label style="width: 20%;">数量：<s:property value="checklist.productSum"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>自查内容</legend>
			<table width="100%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<thead>
					<tr align="center">
						<th width="15%" colspan="2">交验自查项目</th>
						<th width="20%">自查结果</th>
						<th width="20%">备注</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<tr>
							<s:if test="#st.index+1==9 || #st.index+1==10 || #st.index+1==11">
								<td align="center" class="item" width="7%"><s:property value='checkItem.item'/></td>
								<td align="center" width="8%" ><s:property value='checkItem.demand'/></td>
							</s:if>
							<s:else>
								<td align="center" class="item" colspan="2"><s:property value='checkItem.item'/></td>
							</s:else>
							<td>
								<div style="padding:10px;line-height:2em;font-size:15px;"><s:property value='firstCheck'/></div>
							</td>
							<td>
								<div style="padding:10px;line-height:2em;font-size:15px;"><s:property value='secondCheck'/></div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
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
							<span style="font-size:14px">提交日期:<s:date name="approve.endDate" format="yyyy-MM-dd HH:mm"/></span>
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