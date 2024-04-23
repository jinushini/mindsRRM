<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>
<head>
	<meta charset="utf-8">
	<link href="../../frame/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen">
	<link href="../../css/extstyle-lb.css" rel="stylesheet" type="text/css" media="screen">
	<!--[if IE]>
<link href="../../frame/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
	<!--[if lt IE 9]><script src="../../frame/js/speedup.js" type="text/javascript"></script><script src="../../frame/js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
	<!--[if gte IE 9]><!-->	
		<script src="jquery.min.js"></script>


<script type="text/javascript" src="xyChart.js"></script>
<script type="text/javascript" src="mipa.js"></script>
	<script >
		$(function(){
			$("#Reset").click(function(){
				$("input[id^='id_']").val("");	
				$("input[id^='rs_']").val("");
			});			
			//设置默认是否显示范围标题
			/* if(localStorage!=null){
				if(localStorage.getItem("showMipaT")=="true"){
					$("#id_showMipaT").prop("checked",true);
				}
			} */
			/* $("#printexcel").click(function(){			
				var url = "../tools/tools!outexcel.action";
				
				$("#printexcel").attr("href", url);
			}); */
		});
	
	
		
		var f1Start,f1End,f1Step,f2Start, f2End,f2Step,Lo,m_min,m_max,n_min,n_max,r_min,r_max; 
		var rs_f1="",rs_f2="",rs_m="",rs_n="",rs_r="";
		//计算
		    function calculate() {
			
		
		    if(chkNumF("Start")&&chkNumF("End")&&chkNumF("Step")){	   			
			if(chkNum("id_")){		
				
				f1Start = $("#id_f1Start").val()*1; 
				f1End = $("#id_f1End").val()*1; 
				f1Step = $("#id_f1Step").val()*1; 
				f2Start = $("#id_f2Start").val()*1; 
				f2End = $("#id_f2End").val()*1;      
				f2Step = $("#id_f2Step").val()*1;  
				Lo = $("#id_Lo").val()*1;
				m_min= $("#id_f_m_min").val()*1;
				m_max= $("#id_m_max").val()*1;
				n_min= $("#id_f_n_min").val()*1;
				n_max= $("#id_n_max").val()*1;
				r_min= $("#id_f_r_min").val()*1;
				r_max= $("#id_r_max").val()*1;
				if(f1Start>f1End || f2Start>f2End||m_min>m_max||n_min>n_max||r_min>r_max){
					alert("结束值应不小于开始值！");
					return;
				}
				
			    	$.ajax({
						global : false, //(默认: true) 是否触发全局 AJAX 事件
						url : "../tools/tools!getResult.action", //发送请求的地址
						data : {f1Start:f1Start,f1End:f1End,f1Step:f1Step,f2Start:f2Start,f2End:f2End,f2Step:f2Step,Lo:Lo,m_min:m_min,m_max:m_max,n_min:n_min,n_max:n_max,r_min:r_min,r_max:r_max}, //发送到服务器的请求参数
						type : "POST", //请求方式：post或get
						dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
						success : function(data, statusText) {
						      
							/*  for(var i =1;i<=data.length;i++){ 
							$("#resultText").val(data[i]);
						}  */
						    
							$("#resultText").val(data);
					}
			    });
			}
		}
		}
		
		
	 		
			function chkNumF(val){
			var bl=chkNum(val);
			//不能为负数
			$("input[id^='"+val+"']").each(function(){		
				if($(this).val().indexOf('-')>=0){
					alert("数据不能为负数！");
					$(this).focus();
					bl=false;
					return false;
				}
			});

			return bl;
		}

		function chkNum(val){
			var bl=true;
			var patrn=/^-?(0|[1-9]\d*)(\.\d+)?$/;
			 $("input[id^='"+val+"']").each(function(){	
				// $(this).val($(this).val().replace(/[^0-9.]/g,''));	
				if($(this).val()==''){
					alert("数据不能为空！");
					bl=false;
					$(this).focus();
					return false;
				}else if(!patrn.test($(this).val())){
					alert("数据内容格式不正确！");
					bl=false;
					$(this).focus();
					return false;
				}
			});
			return bl;
		}
	</script>

	</head>

<body class="ToolPages">
<div class="pageContent">
	<form action="../tools/tools!outexcel.action" id="searchForm" method="post" class="pageForm required-validate" onsubmit="return navTabSearch;" >
	<input type="hidden" name="fType" id="fType">
	<input type="hidden" name="fRF" id="fRF">
	<div class="pageFormContent" layoutH="58">
	
		<table   class="edit_table" >	
		<tbody>		
		
			<tr>
				<td colspan="3"><b>计算落在输出有用带内双载波杂波</b></td>
				
			</tr>
			
			<tr>
				<td rowspan="3" width="20%">第一个载波fin1(GHz)</td>
				<td >起始值</td>
				<td >结束值</td>
			</tr>
			<tr>
				<td><input name="f1Start" id="id_f1Start"></td>
				<td><input name="f1End" id="id_f1End"></td>
				
			</tr>			
			<tr>
				<td colspan="2" ><label>步进(MHz):</label>&nbsp;<input name="f1Step" id="id_f1Step"></td>
			</tr>
				
			<tr>
				<td rowspan="3">第二个载波fin2(GHz)</td>
				<td >起始值</td>
				<td >结束值</td>
			</tr>
			<tr>
				<td><input name="f2Start" id="id_f2Start"></td>
				<td><input name="f2End" id="id_f2End"></td>
			</tr>
			
			<tr>
				<td colspan="2" ><label>步进(MHz):</label>&nbsp;<input name="f2Step" id="id_f2Step"></td>
			</tr>
			<tr>
				<td colspan="3">
					<label>本振频率Lo(GHz):</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Lo" id="id_Lo">			
				</td>				
			</tr>
			<tr>
				<td colspan="3">
					<label>输入频率计算公式:fout=m*fin1+n*fin2+r*Lo(m,n,r都为整数)</label>			
				</td>				
			</tr>
				
			<tr>
				<td rowspan="2">m范围(可自行设置)</td>
				<td >最小值</td>
				<td >最大值</td>
			</tr>
			<tr>
				<td><input name="m_min" id="id_f_m_min" value="-15"></td>
				<td><input name="m_max" id="id_m_max" value="15"></td>
			</tr>									
			<tr>
				<td rowspan="2">n范围(可自行设置)</td>
				<td >最小值</td>
				<td >最大值</td>
			</tr>
			<tr>
				<td><input name="n_min" id="id_f_n_min" value="-15"></td>
				<td><input name="n_max" id="id_n_max" value="15"></td>
			</tr>
			<tr>
				<td rowspan="2">r范围(可自行设置)</td>
				<td >最小值</td>
				<td >最大值</td>
			</tr>
			<tr>
				<td><input name="r_min" id="id_f_r_min" value="-15"></td>
				<td><input name="r_max" id="id_r_max" value="15"></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button"  onclick="calculate()" value="计算">
					&nbsp;&nbsp;
					<input type="button" id="Reset" value="重置">		
					&nbsp;&nbsp;	
					<div class="buttonActive"><div class="buttonContent"><button id="submitBtn" type="submit">输出结果到excel</button></div></div>		
				</td>				
			</tr>
						
			<tr >
				<td >输出可能的m,n,r,f1,f2</td>
				<td style="text-align: left" colspan="2">
				<em>输出频率满足的条件:(fin最小值+Lo≤fout≤fin最大值+Lo)</em></br>
				<textarea id="resultText" style="width:100%;height:300"></textarea>
				</td>
				
			</tr>
			
			
		</tbody>
	</table>	
		 <br>
	</div>
	</form>
	<br><br>
</div>

</body>
</html>