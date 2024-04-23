<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	jn("[type='submit']").click(function(){
		var ids="";
		jn("input[name='ids']:checked").each(function(index,item){
			if(jn("input[name='ids']:checked").length-1==index){
				ids += jn(this).val();
			}else{
				ids += jn(this).val() + ",";
			}
		})
		var org = jn(".org").eq(0).val();
		var selectedNum = 0;
		if(org == "政治工作部-组织处"){
			selectedNum = 2;
		}else if(org == "政治工作部-宣传处"){
			selectedNum = 3;
		}else if(org == "政治工作部-保卫处"){
			selectedNum = 4;
		}
		if(jn("input[type='checkbox']:checked").length > selectedNum){
			alertMsg.warn("您最多只能选择<font color='red'>" +selectedNum+ "</font>个人");
			return false;
		}
		alertMsg.confirm("请确认是否已经选定，提交后将无法进行更改。", {
			 okCall: function(){
				 $.post("../tools/Vote_vote.action", {ids:ids}, navTabAjaxDone, "json");
			 },
			 cancelCall : function() {}
			});	
	})
</script>
<div class="pageContent">
  <form id="searchFrm" action="" method="post" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
  	<s:iterator value="map" id="m">
  		<input type="hidden" value="<s:property value="#m.key"/>" class="org" />
  	</s:iterator>
  	<div class="pageFormContent" layoutH="56">
		<br/>
		<table border="0" width="75%" class="edit_table" align="center" style="table-layout:fixed;margin:15px auto;">
			<thead>
				<tr>
					<th align="center" style="background-color:#E4F0FC;font-weight: bolder;font-size: 3em;letter-spacing: 10px;">
						竞聘参选人民意调查
					</th>
					
				</tr>
			</thead>
			<tr>
				<td>
					<div style="line-height: 2 ; color: red;font-size: 20px;" >为听取广大职工意见，选取能带领大家干事创业的好干部，微波所分党支部组织了本次候选人摸底。欢迎大家踊跃投票！
				</div>
					<div style="line-height: 2 ; font-size: 20px;" >请在下方选出本处室认为最符合本职务的人选（注：有源室、无源室、综合管理处各选择不多于3人，功率事业部选择不多于5人）。每人只能使用自己账号投票一次，投票后，则不能再次投票。
				</div>
				</td>
			</tr>
			<s:if test="map==null">没有权限或者已投过票</s:if>
			<s:iterator value="map" id="m">
				<s:iterator value="#m.value" status="st">
					<tr>
						<td align="left" style="font-size:21px;padding-left:2em;">
							<input type="checkbox" name="ids" value="<s:property value='id' />" />&nbsp;&nbsp;<s:property value="item" />
						</td>
					</tr>
				</s:iterator>
			</s:iterator>
		</table>
	</div>
	<div class="formBar" style="text-align： center;">
		<ul style="">
			<li style="float: right;"><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
		</ul>
	</div>
   </form>
</div>


