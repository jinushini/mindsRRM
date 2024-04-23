<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	
	jn(function(){
		
		//合并单元格
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
			
			jn(".tbody tr").eq(i).find(".firstCheck input").attr("name","checkResultList["+ i +"].firstCheck");
			jn(".tbody tr").eq(i).find(".secondCheck input").attr("name","checkResultList["+ i +"].secondCheck");
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
			</table>
		</fieldset>
		<br/>
		<fieldset>
			<legend>检查内容</legend>
			<table width="98%" class="list_table list" style="margin:5px auto">
				<thead>
					<tr align="center">
						<th width="15%">检查项目</th>
						<th width="25%">检查内容</th>
						<th width="20%">检查结果</th>
						<th width="30%">备注</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<s:iterator value="checkItemList" status="st">
						<tr>
							<td align="center" class="item"><s:property value='item'/></td>
							<td style="padding:5px 15px;"><s:property value='num'/>.&nbsp;<s:property value='demand'/></td>
							<td style="padding:5px 15px;" align="left" class="firstCheck">
								<s:if test="(#st.index+1==1)||(#st.index+1==2)||(#st.index+1==3)||(#st.index+1==4)||(#st.index+1==5)">
									<input type="radio" value="满足设计要求" checked/>满足设计要求
									<input type="radio" value="不满足设计要求" />不满足设计要求
								</s:if>
								<s:if test="(#st.index+1==11)||(#st.index+1==16)||(#st.index+1==17)||(#st.index+1==18)||(#st.index+1==19)">
									<input type="radio" value="是" checked/>是
									<input type="radio" value="否" />否
									<input type="radio" value="不适用" />不适用
								</s:if>
								<s:if test="(#st.index+1==6)||(#st.index+1==7)||(#st.index+1==8)||(#st.index+1==9)||(#st.index+1==10)">
									<input type="radio" value="是" checked/>是
									<input type="radio" value="否" />否
								</s:if>
								<s:if test="(#st.index+1==14)||(#st.index+1==12)||(#st.index+1==13)||(#st.index+1==15)||(#st.index+1==20)">
									<input type="radio" value="是" checked/>是
									<input type="radio" value="否" />否
								</s:if>
								<s:if test="(#st.index+1==21)||(#st.index+1==22)||(#st.index+1==23)||(#st.index+1==24)||(#st.index+1==25)">
									<input type="radio" value="是" checked/>是
									<input type="radio" value="否" />否
								</s:if>
							</td>
							<td align="center" class="secondCheck">
								<s:if test="#st.index+1==1">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="C、X:TE111,Ku:TE113,Ka:TE TE113、TE114"/>
								</s:if>
								<s:if test="#st.index+1==2">
									<img src="img001.png" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;"/>
								</s:if>
								<s:if test="#st.index+1==3">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="报告中给出高低最近的模式频率"/>
								</s:if>
								<s:if test="#st.index+1==4">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="膜片厚度建议为0.5mm；"/>
								</s:if>
								<s:if test="#st.index+1==9">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="主要针对Mu Wave,具体设置参见第三层次文件"/>
								</s:if>
								<s:elseif test="#st.index+1==12">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="具体设置参见第三层次文件"/>
								</s:elseif>
								<s:elseif test="#st.index+1==13">
									<img src="img002.png" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;"/>
								</s:elseif>
								<s:elseif test="#st.index+1==14">
									<input type="text" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly" value="具体设置参见第三层次文件"/>
								</s:elseif>
								<s:elseif test="#st.index+1==16">
									<textarea rows="3" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly">只针对同轴环耦合结构。需要进行双峰群时延的计算，确定新的腔体尺寸；输入耦合内导体需要进行备份</textarea>
								</s:elseif>
								<s:elseif test="#st.index+1==18">
									<textarea rows="3" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly">C波段多工器一般需要进行滑动支架设计，滑动支架设计时需要注意滑动位置的选取，并且注意结构设计的应力释放效果；Ku输出多工器通道数较多时采用滑动支架设计；</textarea>
								</s:elseif>
								<s:elseif test="#st.index+1==19">
									<textarea rows="3" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly">1，腔体要有一定的厚度设计，在端面一般设计有加强筋；2产品相对带宽较窄时支架安装孔不容许借法兰安装孔；3拆卸和装配支架时不允许卸腔体法兰</textarea>
								</s:elseif>
								<s:elseif test="#st.index+1==23">
									<textarea rows="3" style="border:0;width:91%;font-size:15px;margin:4px 0 4px 4px;padding:5px;" readonly="readonly">C频段：D.Ag20;X频段：D.Ag15;Ku频段:D.Ag17;Ka频段:D.Ag10。常规镀银厚度：D.Ag7.产品使用频段低于800MHz时，镀层厚度不应低于2*6.41/f﹣½(f以GHz为单位，计算结果是um)</textarea>
								</s:elseif>
							</td>
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