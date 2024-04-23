<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="/user-tags" prefix="u" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
     var flag=false;
     var personoption = new Array(5);
     var i=0;
     
       $.ajax({
			global : false,
			type : 'post',
			dataType : "json",
			url : "../fextends/user!findPersonConfig.action", 
			data:{},
			success : function(data, statusText) {
				//console.log(data.userSetting.visible_bigflow);
				if(data.userSetting.visible_bigflow==1){
					jn("input[type='checkbox']").eq(0).attr("checked",true);
					}
				if(data.userSetting.visible_weeklymeeting==1){
					jn("input[type='checkbox']").eq(1).attr("checked",true);
					}
				if(data.userSetting.visible_checklist==1){
					jn("input[type='checkbox']").eq(2).attr("checked",true);
					}
				if(data.userSetting.visible_nodemonth==1){
					jn("input[type='checkbox']").eq(3).attr("checked",true);
					}
				if(data.userSetting.visible_reviewlist==1){
					jn("input[type='checkbox']").eq(4).attr("checked",true);
					}
				//alertMsg.correct(data.success);
			}
		});   
      
    /*  jn("input[type='checkbox']").each(function(i){   
			
    	 
    	 jn(this).attr("checked",true)
    	 
    });  */ 
     
	
	
	jn("input[type='checkbox']").click(function(){
		if(flag){
			this.checked = !this.checked;
		}
	});
	
	jn("#saveConfig").click(function(){
		
		flag=true;
		 jn("input[type='checkbox']").each(function(i){   
			
			 if(jn(this).is(":checked"))    
			    {    
					 personoption[i]=1;   
			    }else{
			    	 personoption[i]=0; 
		        }
	    });    
		  $.ajax({
				global : false,
				type : "post",
				dataType : "json",
				url : "../fextends/user!savePersonConfig.action",
				data:{
					vbigflow:personoption[0],
					vweeklymeeting:personoption[1],
					vchecklist:personoption[2],
					vnodemonth:personoption[3],
					vreviewlist:personoption[4]
				}, 
				success : function(data, statusText) {
					alertMsg.correct(data.success);
				}
			});  
	});
	
	/*jd("[type=checkbox]").change(function(){
		var state = 0;
		var deploymentId = jd("#deploymentId").val();
		if(jd("[type=checkbox]").get(0).checked){
			state = 1;
		});
		}*/
				
    
</script>
<br>
<div style="color:red;font-size:30px" ><s:property value="user.name"/>请配置首页要显示的模块</div>
<hr>
<br/>
<br/>
<div class="pageContent">
   <div class="pageFormContent" layoutH="56">
   	<table class="edit_table" width="98%" layoutH="140">
		<tr>
			<td style="text-align: center; width:20%;">1：大流程</td>
			<td> <input type="checkbox" name="UserOption" value="0"   /></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>2：本周会议</td>
			<td> <input type="checkbox" name="UserOption" value="1"   /></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>3：检查单</td>
			<td> <input type="checkbox" name="UserOption" value="2" /></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>4：本月节点</td>
			<td> <input type="checkbox" name="UserOption" value="3"  /></td>
		</tr>
		<tr>
			<td style="text-align: center;" width:20%;>5：复查情况汇总</td>
			<td> <input type="checkbox" name="UserOption" value="4"  /></td>
		</tr>
		
	<!-- <tr>
			<td style="text-align: center;" width:20%;>描述：</td>
			<td><lable><s:property value="user.remark"/></lable></td>
		</tr> 
		-->
	</table>
	<div class="formBar">
		<ul>
			
 			<%-- <li><a class="button" id="changeConfig"   ><span>更改配置</span></a></li> --%>
			<li><a class="button" id="saveConfig"  > <span>保存配置</span></a></li>
			
		</ul>
		</div>
	</div>
	
</div>

