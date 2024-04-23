<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<style type="text/css">
	ul.rightTools {float:right; display:block;}
	ul.rightTools li{float:left; display:block; margin-left:5px}
</style>
	<script type="text/javascript">   	
//画图
function drawing(mm,nn,qq,ss){		     
 	var options = {
		axis: "0 0 1 1", // Where to put the labels (trbl)
		axisxstep: ss, // How many x interval labels to render (axisystep does the same for the y axis)
		axisxlables: mm,
		axisystep: 20,
		shade:false, // true, false
		smooth:true, //曲线
		symbol:"circle"
	};
	// Make the raphael object
	var r = Raphael("chartHolder"); 
	
	var lines = r.linechart(
		20, // X start in pixels
		20, // Y start in pixels
		1350, // Width of chart in pixels
		600, // Height of chart in pixels
		qq, // Array of x coordinates equal in length to ycoords
		nn, // Array of y coordinates equal in length to xcoords
		options // opts object
	).hoverColumn(function () {
        this.tags = r.set();

		var box_x = this.x, box_y = 30,
			box_w = 50, box_h = 35;
		if (box_x + box_w > r.width) box_x -= box_w;
		var box = r.rect(box_x,box_y,box_w,box_h).attr({stroke: "#f99", "stroke-width": 1, r:5});
		this.tags.push(box);

        for (var i = 0; i < this.y.length; i++) {
			//this.tags.push(r.blob(this.x, this.y[i], "$"+this.values[i]).insertBefore(this).attr([{ fill: "#ffa500", stroke: "#000"}, { fill: this.symbols[i].attr("fill") }]));
        	var t = r.text(box_x-5, box_y-15 + i*16,"$"+this.values[i]).attr({fill: this.symbols[i].attr("fill")})
        	this.tags.push(t);
        }
        
        
    }, function () {
        this.tags && this.tags.remove();
    });

    lines.symbols.attr({ r: 6 });
}
//初始化
 $(function(){
 	var mm = [0,1,2];
	var nn = [1,0,1];
	var qq = [0,1,2];
	var ss = 3;
	//画图
 	drawing(mm,nn,qq,ss);
 });
 
     jn("#itemparm").change(function(){
    	var singleItem = jn("#itemparm").val();
    	var col=jn("input[name='col']:checked").val();
    	/* var itempin=jn("#inparm");
    	var itempout=jn("#outparm"); */
    	jn("#inparm").empty();
			jn("#outparm").empty();
    	$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : "../readzkword/readzkword!getDataTree.action", //发送请求的地址
			data : {singleItem:singleItem,col:col}, //发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
			
			
			for(var i =1;i<=parseInt(data[0]);i++){
		
				 jn("#inparm").append("<option value='"+data[i]+"'>"+data[i]+"</option>")	;
			
			} 
			for(var j =parseInt(data[0])+1;j<data.length;j++){
		
				 jn("#outparm").append("<option value='"+data[j]+"'>"+data[j]+"</option>")	;
			
			}   
	    
			}
		}); 
        
     }); 
     
     jn("input[type='radio']").change(function(){
			//alert(jn(this).val());
    	 var col=jn("input[name='col']:checked").val();
     	/* var itempin=jn("#inparm");
     	var itempout=jn("#outparm"); */
     	jn("#excelsmallparm").empty();
 			jn("#excelsatparm").empty();
     	$.ajax({
 			global : false, //(默认: true) 是否触发全局 AJAX 事件
 			url : "../readzkword/readzkword!getPinlist.action", //发送请求的地址
 			data : {col:col}, //发送到服务器的请求参数
 			type : "POST", //请求方式：post或get
 			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
 			success : function(data, statusText) {
 			
 			
 			for(var i =0;i<data.length;i++){
 		
 				 jn("#excelsmallparm").append("<option value='"+data[i]+"'>"+data[i]+"</option>")	;
 			
 			} 
 			for(var j =0;j<data.length;j++){
 		
 				 jn("#excelsatparm").append("<option value='"+data[j]+"'>"+data[j]+"</option>")	;
 			
 			}   
 	    
 			}
 		}); 
			
     })

     jn("#update").click(function(){   
     	var itemparm = jn("#itemparm").val();
     	var inparm = jn("#inparm").val();
     	var outparm =jn("#outparm").val();
     	var url = "../readzkword/readzkword!drawline.action";    	
     	//jn("#update").attr("href", url);
     	$.ajax({
			global : false, //(默认: true) 是否触发全局 AJAX 事件
			url : url, //发送请求的地址
			data : {itemparm:itemparm,inparm:inparm,outparm:outparm}, //发送到服务器的请求参数
			type : "POST", //请求方式：post或get
			dataType : "json", //服务器返回的数据类型：text——纯文本字符串，json——JSON数据，html——纯文本HTML信息
			success : function(data, statusText) {
				var mm = data[0];
	 			var nn = data[1]; 
				var qq = data[2];
				var ss = data[3];
				jn("#chartHolder").empty();
				//画图
				drawing(mm,nn,qq,ss);
			}
		});
     });
     
     jn("#printexcel").click(function(){	
    	
    	var url1 = "../readzkword/readzkword!formatexcel.action";  		
    	jn("#printexcel").attr("href", url1);	
     });  
     jn("#printdbexcel").click(function(){	
   	 
   		var url2 = "../readzkword/readzkword!dbexcel.action?smallPin="+jn("#excelsmallparm").val()+"&satPin="+jn("#excelsatparm").val();
   		jn("#printdbexcel").attr("href", url2);	
    });  
	function showDetail(obj){
		var text = jn(obj).text();
		var url = "../readzkword/displayzkword!showdata.action";
		//jn(obj).attr("href",url);
		
		//$.post(url, {text:text}, navTabAjaxDone, "json");
		//$.post("../meeting/reviewMeeting!saveTemplate.action", jn("#form").serialize(), navTabAjaxDone, "json");
		//window.open(url);
		$.ajax({
			global : false,
			type : 'post',
			dataType : "text",
			url : url,
			data:{
				"text":text
			},
			success : function(data, statusText) {
				$(data).initUI();
			    $("#jbsxBox").empty(); 
				$("#jbsxBox").append($(data));
				$("#jbsxBox").initUI();
			}
		});
	}
</script>
 
<!-- <div id="chartHolder" style="width: 650px;height: 450px"></div>  -->

<div class="pageContent" style="padding:6px">
	<%-- <div class="panel" defH="40">
		<h1>病人基本信息</h1>
		<div>
			病人编号：<input type="text" name="patientNo" />
			<ul class="tree expand">
				<li><a class="button" target="dialog" href="demo/pagination/dialog1.html" mask="true"><span>创建病例</span></a></li>
				<li><div class="buttonDisabled"><div class="buttonContent"><button>病人治疗流程</button></div></div></li>
				<li><div class="buttonDisabled"><div class="buttonContent"><button>按病人编号检索病例</button></div></div></li>
				<li><div class="buttonDisabled"><div class="buttonContent"><button>从病人列表选取病例</button></div></div></li>
			</ul>
		</div>
	</div> --%>
	
	<div class="divider"></div>
	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>数据表格</span></a></li>
					<li><a href="javascript:;"><span>数据图表</span></a></li>
					
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<div>
	
				<div layoutH="70" style="float:left; display:block; overflow:auto; overflow-x: scroll;width:370px; border:solid 1px #CCC; line-height:30px; background:#fff">						  
				<ul  class="tree  expand" >
			      	<s:iterator value="dataitem" id="bigitem"> 
						<li><a ><s:property value="#attr.bigitem.key"/></a>
							<ul>
							     <s:iterator value="#attr.bigitem.value" id="smallitem"> 
									<li><a tname="name" tvalue="test1.1" href="###" onclick="showDetail(this)"><s:property value="#attr.smallitem"/></a></li>
								</s:iterator>
							</ul>
						</li>			
					</s:iterator>
				</ul>
						</div>
						
				<div id="jbsxBox" class="unitBox" style="margin-left:246px; overflow-y:scroll; overflow-x:auto; width:75%; height:720px;" >
							<!--#include virtual="list1.html" -->
				</div>
	
			</div>
			
			<div>	
			     <div layoutH="90" style="float:left; display:block; overflow:auto; overflow-x: scroll;width:1385px; border:solid 1px #CCC; line-height:30px; background:#fff">
					<div id="chartHolder" style="width:1385px;height: 650px"></div>	
				</div>	
				<div layoutH="90" style="float:left; display:block; overflow:auto; overflow-x: scroll;width:280px; border:solid 1px #CCC; line-height:30px; background:#fff">
					控制面板<br/>
					测试项目:&nbsp;
					<select id="itemparm" name="checklist.stage" style="width:147px;">
						 <s:iterator value="dataitem" id="selectitem">
						 <option value="<s:property value="#attr.selectitem.key"/>"><s:property value="#attr.selectitem.key"/></option>
						 </s:iterator>
					</select>
					<br/><br/>
					输入参数:&nbsp;									
					<select id="inparm" name="checklist.stage" style="width:147px;">								
					</select>
					<br/>
					<input type="radio" name="col" value="1" checked="checked"/>列1
					<input type="radio" name="col" value="2" />列2
					<input type="radio" name="col" value="3" />列3
					<br/><br/>
					输出参数:&nbsp;
					<select id="outparm" name="checklist.stage" style="width:147px;">
								
					</select>
					<br/><br/>
						
					<ul>
					   <li ><a id="update" style="margin-left:10px;" class="button" target="ajax" rel="jbsxBox"><span>刷新图表 </span></a></li>
				    </ul>
				    <br/><br/>
				   <ul>
					   <li ><a id="printexcel" style="margin-left:10px;" class="button"><span>excel输出 </span></a></li>
				    </ul>
				    <br/><br/><br/><br/>
				            输入输出特性高低温各循环对比曲<br/>线excel表输出配置模块&nbsp;
				    <br/><br/>
				            小信号输入功率:&nbsp;									
					<select id="excelsmallparm" name="checklist.stage" style="width:147px;">	
					 <s:iterator value="excelinparm" status="st" var="li">
						 <option value="<s:property value="#li"/>"><s:property value="#li" /></option>
						 </s:iterator> 							
					</select>
					
					<br/><br/>
					饱和信号输入功率:&nbsp;
					<select id="excelsatparm" name="checklist.stage" style="width:147px;">	
						<s:iterator value="excelinparm" status="st" var="li">
						 <option value="<s:property value="#li"/>"><s:property value="#li" /></option>
						 </s:iterator> 							
					</select>
					<br/><br/>
				   <ul>
					   <li ><a id="printdbexcel" style="margin-left:10px;" class="button"><span>输出高低温各循环对比excel</span></a></li>
				    </ul>
				</div>	
            </div> 
			
			
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
	
</div>


	

