<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn(function(){
		
		var z = 0;
		for(var i=0;i<jn(".tbody tr").length;i++){
			
			//合并单元格
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
		
		/* //如果当前是修改节点
		if(jn("#taskName").val()=="修改"){
			for(var i=0;i<jn(".tbody tr").length;i++){
				//修改环节检查结果的显示形式为单选按钮默认选择设计师选中的结果，但设计师可以重新用单选按钮修改检查结果
				var $firstCheck = jn(".tbody tr").eq(i).find("span");
				jn(".tbody tr").eq(i).find("input[type='radio'][value='"+$firstCheck.text()+"']").prop("checked","checked");
				//在“数据一致性及正确性”这一行
				if(i==3){
					//给前两个预设答案后添加第三个带有文本框的预设答案
					$insertStr = $("<input type='radio' name='checkResultList[3].firstCheck' style='float:left;'><span style='float:left;font-size:15px;padding-top:4px;'>经数据分析确认</span><input type='text' name='abnormal' style='width:100px;float:left;height:15px; border:none #FFFFFF;border-bottom:#777777 solid 1px;background:transparent;'/> <span style='float:left;font-size:15px;margin-top:4px;'>过程发生异常，需分析处理<span>");
					jn(".tbody tr").eq(i).find(".firstCheck").append($insertStr);
					//如果正确答案是前两个预设答案的某个，则将它正常默认选中；如果正确答案不是预设的前两个，则将第三个预设答案默认选中
					if($firstCheck.text()!="测试、试验前后及试验过程数据一致性较好，性能稳定" && $firstCheck.text()!="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）"){
						jn(".tbody tr").eq(i).find("input:eq(2)").prop("checked","checked");
						//在第三个预设答案的文本框中填入合适的字段
						var abnormal = $firstCheck.text().substring(7,$firstCheck.text().length-12);
						jn("input[name='abnormal']").val(abnormal);
					}
				}
			}
			
			//隐藏审批框
			jn("#approve").remove();
			
			//根据失焦聚焦事件来给文本框添加去除required样式
			jn("[name='checkResultList[3].firstCheck']:eq(2)").focus(function(){
				jn("[name='abnormal']").addClass("required");
			})	
			jn("[name='checkResultList[3].firstCheck']:lt(2)").focus(function(){
				jn("[name='abnormal']").removeClass("required");
			})
			//提交时判断第四行第三个单选按钮是否被选中，如果被选中则根据文本框输入内容组合单选按钮的val值，文本框没内容时提示填写
			jn("#submitBtn").click(function(){
				for(var i=0;i<jn(".tbody tr").length;i++){
					if(i==0||i==4||i==5||i==6||i==7){
						if(!jn(".tbody tr").eq(i).find("input").is(":checked")){
							jn(".tbody tr").eq(i).find(" input").val("");
							jn(".tbody tr").eq(i).find("input").prop("checked", "checked");
						}
					}
				}
				if(jn("[name='checkResultList[3].firstCheck']:eq(2)").is(":checked")){
					var abnomal = jn("[name='abnormal']").val();
					if(abnomal==""){
					    alertMsg.error("请将数据填写完整后再提交");
			  			return;
					}else{
						jn("[name='abnormal']").css("border-color","");
						var firstCheck3 = "经数据分析确认"+jn("[name='abnormal']").val()+"过程发生异常，需分析处理";
						jn("[name='checkResultList[3].firstCheck']:eq(2)").val(firstCheck3);
					}	
				}
			})
		}else{  		
			//如果当前在审批节点
			for(var i=0;i<jn(".tbody tr").length;i++){
				var $firstCheck = jn(".tbody tr").eq(i).find("span");
				//如果该行有单选按钮
				if(jn(".tbody tr").eq(i).find("input[type='radio']").length!=0){
					for(var j=0;j<jn(".tbody tr").eq(i).find("input[type='radio']").length;j++){
						var $thisRadio = jn(".tbody tr").eq(i).find("input[type='radio']").eq(j);
						//如果哪个单选按钮的内容与后台拿出来的数据相同，在这个单选按钮前打“☑ ”
						if($thisRadio.val()==$firstCheck.text()){
							$("<span style='font-size:17px;'>☑    </span>").insertBefore($thisRadio);
						}else{
							$("<span style='font-size:17px;'>☐    </span>").insertBefore($thisRadio);
						}
					}
				}else{      //如果该行没有单选按钮
					//如果后台拿出来的数据不为空，则在这行数据前打“☑”（这里针对于“补充说明”这行数据）
					if($firstCheck.text()!=""){
						$firstCheck.show();
						$("<span style='font-size:17px;'>☑    </span>").insertBefore($firstCheck);
					}
				}
				//移除单选按钮和输入框
				jn(".tbody tr").eq(i).find("input[type='radio'],input[type='text']").remove();
				//在“数据一致性及正确性”这一行
				if(i==3){
					//如果正确答案不是前两个预设，则在前两个预设答案后直接输出正确答案作为第三个答案，并在其前面打钩
					if($firstCheck.text()!="测试、试验前后及试验过程数据一致性较好，性能稳定" && $firstCheck.text()!="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）"){
						jn(".tbody tr").eq(i).find(".firstCheck").append("<span style='font-size:17px;'>☑    </span>"+$firstCheck.text());
					}else{       //如果正确答案是前两个答案的某个，则在这两个预设答案后输出默认固定字段作为第三个预设答案，并正常给正确答案选中打钩
						jn(".tbody tr").eq(i).find(".firstCheck").append("<span style='font-size:17px;'>☐    </span>经数据分析确认__________过程发生异常，需分析处理");
					}
				}
			}
		} */
	})
</script>
<div class="pageContent">
  <form method="post" enctype="multipart/form-data" action='../checklist/checklistAppr!sdadpCheckModifySave.action' class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	<input type="hidden" name="processInstId" value="<s:property value='processInstId'/>"/>
	<input type="hidden" name="taskId" value="<s:property value='taskId'/>"/>
	<input type="hidden"  name="taskName" value="<s:property value='taskName' />" id="taskName"/>
	
	<div class="pageFormContent" layoutH="56">
		<br/>
		<fieldset>
			<table width="98%" class="edit_table" style="margin:5px auto"> 
				<tr>
					<td align="center" colspan="6" ><div style="font-size:23px;margin:10px "><s:property value="headline"/> ·V<s:property value="checklist.version"/>版</div></td>
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
							<label style="width: 20%;">审查文件名称：<s:property value="checklist.docName"/></label>
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>交付数据包审查意见</legend>
			<%-- <table width="98%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td class="firstCheck" style="line-height:2em;">
									<s:if test="num==1">
										<span class="required" style="font-size:15px;">
											<input type="radio" name="checkResultList[0].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="记录准确、完整，可追溯，发现的问题已闭环" class="check" />记录准确、完整，可追溯，发现的问题已闭环
										</span>
									</s:if>
									<s:if test="num==2">
										<input type="radio" name="checkResultList[1].firstCheck" value="与总体要求相符合" checked>与总体要求相符合 <br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，已得到卫星总体认可（见附页）">不满足总体要求，已得到卫星总体认可（见附页）<br/>
										<input type="radio" name="checkResultList[1].firstCheck" value="不满足总体要求，需进行再试验">不满足总体要求，需进行再试验
									</s:if>
									<s:if test="num==3">
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%" checked>测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100% <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页）">测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页） <br/>
										<input type="radio" name="checkResultList[2].firstCheck" value="不满足测试覆盖性分析报告的要求，需进行补充测试">不满足测试覆盖性分析报告的要求，需进行补充测试
									</s:if>
									<s:if test="num==4">
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程数据一致性较好，性能稳定" checked>测试、试验前后及试验过程数据一致性较好，性能稳定 <br/>
										<input type="radio" name="checkResultList[3].firstCheck" value="测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）">测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页） <br/>
										<input type="radio" name="checkResultList[3].firstCheck" value="" style="position:relative;z-index:5;top:5px;float:left;" class="merge"><span style="position:relative;z-index:4;top:8px;float:left;font-size:15px;display:inline-block;word-break:break-all;">经数据分析确认</span><input type="text" name="abnormal" style="position:relative;z-index:3;top:-2px;width:145px;border-top:none #FFFFFF;border-widht:5px;border-left:none #FFFFFF;border-right:none #FFFFFF;background:transparent;text-align: center;"/><span style="position:relative;z-index:2;top:8px;left:2px;font-size:15px;word-break:break-all;display:inline-block;">过程发生异常，需分析处理</span>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table> --%>
			<table width="98%" class="edit_table" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1<=4">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td class="firstCheck" style="line-height:2em;">
									<span><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==1">
										<span style="font-size:15px;">记录准确、完整，可追溯，发现的问题已闭环</span>
									</s:if>
									<s:if test="#st.index+1==2">
										<span style="font-size:15px;">与总体要求相符合</span>
										<span style="font-size:15px;">不满足总体要求，已得到卫星总体认可（见附页）</span>
										<span style="font-size:15px;">不满足总体要求，需进行再试验</span>
									</s:if>
									<s:if test="#st.index+1==3">
										<span style="font-size:15px;">测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%</span>
										<span style="font-size:15px;">测试项目不满足测试覆盖性分析报告的要求，相关裁剪项目已得到总体认可（见附页）</span>
										<span style="font-size:15px;">不满足测试覆盖性分析报告的要求，需进行补充测试</span>
									</s:if>
									<s:if test="#st.index+1==4">
										<span style="font-size:15px;">测试、试验前后及试验过程数据一致性较好，性能稳定</span>
										<span style="font-size:15px;">测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）</span>
										<s:if test="firstCheck != '测试、试验前后及试验过程数据一致性较好，性能稳定' && firstCheck != '测试、试验前后及试验过程经分析数据变化为正常现象，详见分析报告（见附页）'">
											<span style="font-size:15px;">☑    <s:property value='firstCheck'/></span>
										</s:if>
										<s:else>
											<span style="font-size:15px;">经数据分析确认_______________过程发生异常，需分析处理</span>
										</s:else>
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>研制总结报告审查意见</legend>
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>4 && #st.index+1<=7">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span style="display:none;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==5">
										<input type="radio" name="checkResultList[4].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="研制总结内容覆盖全面">研制总结内容覆盖全面
									</s:if>
									<s:if test="#st.index+1==6">
										<input type="radio" name="checkResultList[5].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="所有超差项分析到位">所有超差项分析到位
									</s:if>
									<s:if test="#st.index+1==7">
										<input type="radio" name="checkResultList[6].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致">机械设计接口、电接口、热接口、遥控遥测接口等接口设计与IDS表、任务书要求完全一致
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>出所结论</legend>
			<table width="98%" class="list_table list" style="margin:5px auto;table-layout:fixed;word-break:break-all;word-warp:break-word;">
				<tbody class="tbody">
					<s:iterator value="checkResultList" status="st">
						<s:if test="#st.index+1>7">
							<tr>
								<td class="item" width="15%" align="center"><s:property value='checkItem.item'/></td>
								<td>
									<span style="display:none;font-size:15px;"><s:property value='firstCheck'/></span>
									<s:if test="#st.index+1==8">
										<input type="radio" name="checkResultList[7].firstCheck" onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1" c="0" value="该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求">该单机已按照研制流程完成了测试、试验工作，经对测试试验记录的认真判读，试验项目和条件符合要求；测试项目与测试覆盖性分析报告要求相符合，测试覆盖率100%；测试、试验前后及试验过程数据一致性较好，性能稳定，满足出所要求
									</s:if>
									<s:if test="#st.index+1==9">
										<input type="text" name="checkResultList[8].firstCheck" value="<s:property value='firstCheck'/>" style="border:0;width:98%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" />
									</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
			</table>
		</fieldset>
		<fieldset id="approve">
			<legend>任务处理</legend>
			<table width="98%" class="edit_table" style="margin:5px auto">				
				<tr>
					<td width="30%" align="center">审批结论：</td>
					<td width="70%">
						<span class="required">
							<input type="radio" name="approve.resultCn" value="通过" id="pass">通过&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="approve.resultCn" value="不通过">不通过
						</span>
					</td>
				</tr>
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
	<div class="formBar" style="text-align:center;">
		<ul style="">
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">提交</button></div></div></li>
			<li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="cancelBtn" class="close" type="button">返回</button></div></div></li>
		</ul>			
	</div>
   </form>
</div>