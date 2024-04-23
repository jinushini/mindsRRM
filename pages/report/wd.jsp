<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript" language="javascript"> 

	jn("#testBtn").click(function(){
		
		 alert("请等待生成报告成功的提示!");
		c(10);
		
	});
	
	    function sethref(){
	    	$.ajax({
				global : false,
				type : 'post',
				dataType : "json",
				url : "../report/report!word.action",
				data:$("#testForm").serialize(),
				success : function(data, statusText) {
					jn("#DownloadReport").attr("href",data.path);
					
				}
			});
	    }
		function c(i){
		 
		 i--;
		 if(i==0){
			 
			 sethref();
			 alert("生成报告成功，请点击下载报告");
			  }
		 else{
			
		      setTimeout("c("+i+")",1000);
		 }
		}

	//给添加的新产品添加表单
	var table_count =0;//初始只有一个产品表单，可以一直增加
	//需后台实时地传数据到前台
	/*
	function scReportName() {
		
		var wordName = <s:property value="wordName"/>
		../../uploadFile/wordoutput/4.docx
		$("#DownloadReport").attr("href","");
	}
	*/
	function addNewProduct()
	{  
		   //$("[name='conclusion']")
			//插入位置
			if(table_count>0&&table_count<6 ){
				var table1=$("<table border='0' width='80%' class='edit_table' name='NProductTable' align='center'></table>");
				var table2=$("<table border='0' width='98%' class='edit_table' name='NProductTable' align='center'></table>");
			
				 var td01 = $("<td width='5%'></td>");
					var td02 = $("<td width='20%'></td>");
					var td03 = $("<td width='35%'></td>");
					var td04 = $("<td width='25%'></td>");
					var td05 = $("<td width='25%'></td>");
				var td1 = $("<td width='5%'></td>");
				var td2 = $("<td width='20%'></td>");
				var td3 = $("<td width='35%'></td>");
				var td4 = $("<td width='25%'></td>");
				var td5 = $("<td width='25%'></td>");
				 
				 var td21 = $("<td width='5%'></td>");
					var td22 = $("<td width='20%'></td>");
					var td23 = $("<td width='35%'></td>");
					var td24 = $("<td width='25%'></td>");
					var td25 = $("<td width='25%'></td>");
					
					var td31 = $("<td width='5%'></td>");
					var td32 = $("<td width='20%'></td>");
					var td33 = $("<td width='35%'></td>");
					var td34 = $("<td width='25%'></td>");
					var td35 = $("<td width='25%'></td>");
					
					var td41 = $("<td width='5%'></td>");
					var td42 = $("<td width='20%'></td>");
					var td43 = $("<td width='35%'></td>");
					var td44 = $("<td width='25%'></td>");
					var td45 = $("<td width='25%'></td>");
					
					var td51 = $("<td width='5%'></td>");
					var td52 = $("<td width='20%'></td>");
					var td53 = $("<td width='35%'></td>");
					var td54 = $("<td width='25%'></td>");
					var td55 = $("<td width='25%'></td>");
					
					var td61 = $("<td width='5%'></td>");
					var td62 = $("<td width='20%'></td>");
					var td63 = $("<td width='35%'></td>");
					var td64 = $("<td width='25%'></td>");
					var td65 = $("<td width='25%'></td>");
					
					var td71 = $("<td width='5%'></td>");
					var td72 = $("<td width='20%'></td>");
					var td73 = $("<td width='35%'></td>");
					var td74 = $("<td width='25%'></td>");
					var td75 = $("<td width='25%'></td>");
					
					var td81 = $("<td width='5%'></td>");
					var td82 = $("<td width='20%'></td>");
					var td83 = $("<td width='35%'></td>");
					var td84 = $("<td width='25%'></td>");
					var td85 = $("<td width='25%'></td>");
					
					var td91 = $("<td width='5%'></td>");
					var td92 = $("<td width='20%'></td>");
					var td93 = $("<td width='35%'></td>");
					var td94 = $("<td width='25%'></td>");
					var td95 = $("<td width='25%'></td>");
					
					var td101 = $("<td width='5%'></td>");
					var td102 = $("<td width='20%'></td>");
					var td103 = $("<td width='35%'></td>");
					var td104 = $("<td width='25%'></td>");
					var td105 = $("<td width='25%'></td>");
					
					var td111 = $("<td width='5%'></td>");
					var td112 = $("<td width='20%'></td>");
					var td113 = $("<td width='35%'></td>");
					var td114 = $("<td width='25%'></td>");
					var td115 = $("<td width='25%'></td>");
					
					var td121 = $("<td width='5%'></td>");
					var td122 = $("<td width='20%'></td>");
					var td123 = $("<td width='35%'></td>");
					var td124 = $("<td width='25%'></td>");
					var td125 = $("<td width='25%'></td>");
					
					var td131 = $("<td width='5%'></td>");
					var td132 = $("<td width='20%'></td>");
					var td133 = $("<td width='35%'></td>");
					var td134 = $("<td width='25%'></td>");
					var td135 = $("<td width='25%'></td>");
					
					var td141 = $("<td width='5%'></td>");
					var td142 = $("<td width='20%'></td>");
					var td143 = $("<td width='35%'></td>");
					var td144 = $("<td width='25%'></td>");
					var td145 = $("<td width='25%'></td>");
			        
					var td151 = $("<td width='5%'></td>");
					var td152 = $("<td width='20%'></td>");
					var td153 = $("<td width='35%'></td>");
					var td154 = $("<td width='25%'></td>");
					var td155 = $("<td width='25%'></td>");
					var td161 = $("<td width='5%'></td>");
					var td162 = $("<td width='20%'></td>");
					var td163 = $("<td width='35%'></td>");
					var td164 = $("<td width='25%'></td>");
					var td165 = $("<td width='25%'></td>");
					var td171 = $("<td width='5%'></td>");
					var td172 = $("<td width='20%'></td>");
					var td173 = $("<td width='35%'></td>");
					var td174 = $("<td width='25%'></td>");
					var td175 = $("<td width='25%'></td>");
					var td181 = $("<td width='5%'></td>");
					var td182 = $("<td width='20%'></td>");
					var td183 = $("<td width='35%'></td>");
					var td184 = $("<td width='25%'></td>");
					var td185 = $("<td width='25%'></td>");
					var td191 = $("<td width='5%'></td>");
					var td192 = $("<td width='20%'></td>");
					var td193 = $("<td width='35%'></td>");
					var td194 = $("<td width='25%'></td>");
					var td195 = $("<td width='25%'></td>");
					var td201 = $("<td width='5%'></td>");
					var td202 = $("<td width='20%'></td>");
					var td203 = $("<td width='35%'></td>");
					var td204 = $("<td width='25%'></td>");
					var td205 = $("<td width='25%'></td>");
					var td211 = $("<td width='5%'></td>");
					var td212 = $("<td width='20%'></td>");
					var td213 = $("<td width='35%'></td>");
					var td214 = $("<td width='25%'></td>");
					var td215 = $("<td width='25%'></td>");
					var td221 = $("<td width='5%'></td>");
					var td222 = $("<td width='20%'></td>");
					var td223 = $("<td width='35%'></td>");
					var td224 = $("<td width='25%'></td>");
					var td225 = $("<td width='25%'></td>");
	    var field= $("[name='NProductTable']:last");
	  //第一个表格
	  var row = $("<tr></tr>");
		var td = $("<td width='15%'></td>");
		td.html("产品名称");
		var td_0 = $("<td width='15%'></td>");
		td_0.html("产品编号");
		var td_t = $("<td width='25%'></td>");
		var td0_t = $("<td width='25%'></td>");
		 var NProductName="word.ProductName_"+table_count.toString(); 
		 td_t.append($("<input type='text' name="+NProductName+">"));
		 var NProductSeq="word.ProductSeq_"+table_count.toString(); 
		 td0_t.append($("<input type='text' name="+NProductSeq+">")); 
		row.append(td);
		row.append(td_t);
		row.append(td_0);
		row.append(td0_t);
		table1.append(row);
		table1.insertAfter(field);
		var field= $("[name='NProductTable']:last");
		//第二个表格
		var row1 = $("<tr></tr>");
		td1.append("序号");
		td2.append("测试或检查项目");
		td3.append("合格判据");
		td4.append("实测数据");
		td5.append("结论");
		row1.append(td1);row1.append(td2);row1.append(td3);row1.append(td4);row1.append(td5);
		table2.append(row1);
		
		var row2 = $("<tr></tr>");
		td21.append("1、");
		td22.append("工作频率(MHz)");
		var NYq_Frange="word.Yq_Frange_"+table_count.toString(); 
		 td23.append($("<input type='text' name="+NYq_Frange+">"));
		 var NFrange="word.Frange_"+table_count.toString(); 
		 td24.append($("<input type='text' name="+NFrange+">"));
		 var NFrange_rs="word.Frange_rs_"+table_count.toString(); 
		 td25.append($("<input type='text' name="+NFrange_rs+">"));
		 row2.append(td21);row2.append(td22);row2.append(td23);row2.append(td24);row2.append(td25);
		 table2.append(row2);
		 
		  var row3 = $("<tr></tr>");
			td31.append("2、");
			td32.append("输入功率(dBm)");
			var NYq_Pin="word.Yq_Pin_"+table_count.toString(); 
			 td33.append($("<input type='text' name="+NYq_Pin+">"));
			 var NPin="word.Pin_"+table_count.toString(); 
			 td34.append($("<input type='text' name="+NPin+">"));
			 var NPin_rs="word.Pin_rs_"+table_count.toString(); 
			 td35.append($("<input type='text' name="+NPin_rs+">"));
			 row3.append(td31);row3.append(td32);row3.append(td33);row3.append(td34);row3.append(td35);
			 table2.append(row3); 
			 
			 var row4 = $("<tr></tr>");
				td41.append("3、");
				td42.append("输出功率(dBm)");
				var NYq_Pout="word.Yq_Pout_"+table_count.toString(); 
				 td43.append($("<input type='text' name="+NYq_Pout+">"));
				 var NPout="word.Pout_"+table_count.toString(); 
				 td44.append($("<input type='text' name="+NPout+">"));
				 var NPout_rs="word.Pout_rs_"+table_count.toString(); 
				 td45.append($("<input type='text' name="+NPout_rs+">"));
				 row4.append(td41);row4.append(td42);row4.append(td43);row4.append(td44);row4.append(td45);
				 table2.append(row4);
				 
				 var row5 = $("<tr></tr>");
				    td51.append("4、");
					td52.append("增益波动(dB)");
					var NYq_GainWave="word.Yq_GainWave_"+table_count.toString(); 
					 td53.append($("<textarea name="+NYq_GainWave+" rows='2' cols='58'/>"));
					 var NGainWave="word.GainWave_"+table_count.toString(); 
					 td54.append($("<textarea name="+NGainWave+" rows='2' cols='40'/>"));
					 var NGainWave_rs="word.GainWave_rs_"+table_count.toString(); 
					 td55.append($("<input type='text' name="+NGainWave_rs+">"));
					 row5.append(td51);row5.append(td52);row5.append(td53);row5.append(td54);row5.append(td55);
					 table2.append(row5); 
			    var row6 = $("<tr></tr>");
						td61.append("5、");
						td62.append("增益斜率(dB/MHz)");
						var NYq_GainWaveSlop="word.Yq_GainWaveSlop_"+table_count.toString(); 
						 td63.append($("<textarea name="+NYq_GainWaveSlop+" rows='2' cols='58'/>"));
						 var NGainWaveSlop="word.GainWaveSlop_"+table_count.toString(); 
						 td64.append($("<textarea name="+NGainWaveSlop+" rows='2' cols='40'/>"));
						 var NGainWaveSlop_rs="word.GainWaveSlop_rs_"+table_count.toString(); 
						 td65.append($("<input type='text' name="+NGainWaveSlop_rs+">"));
						 row6.append(td61);row6.append(td62);row6.append(td63);row6.append(td64);row6.append(td65);
						 table2.append(row6); 
				var row0 = $("<tr></tr>");
						td01.append("6、");
						td02.append("群时延波动(ns)");
						var NYq_Groupdelay="word.Yq_Groupdelay_"+table_count.toString(); 
						 td03.append($("<textarea name="+NYq_Groupdelay+" rows='2' cols='58'/>"));
						 var NGroupdelay="word.Groupdelay_"+table_count.toString(); 
						 td04.append($("<textarea name="+NGroupdelay+" rows='2' cols='40'/>"));
						 var NGroupdelay_rs="word.Groupdelay_rs_"+table_count.toString(); 
						 td05.append($("<input type='text' name="+NGroupdelay_rs+">"));
						 row0.append(td01);row0.append(td02);row0.append(td03);row0.append(td04);row0.append(td05);
						table2.append(row0); 
				 var row7 = $("<tr></tr>");
						td71.append("7、");
						td72.append("AM/PM变换系数(°/dB)");
						var NYq_AP="word.Yq_AP_"+table_count.toString(); 
						 td73.append($("<input type='text' name="+NYq_AP+">"));
						 var NAP="word.AP_"+table_count.toString(); 
						 td74.append($("<input type='text' name="+NAP+">"));
						 var NAP_rs="word.AP_rs_"+table_count.toString(); 
						 td75.append($("<input type='text' name="+NAP_rs+">"));
						 row7.append(td71);row7.append(td72);row7.append(td73);row7.append(td74);row7.append(td75);
						 table2.append(row7); 
				var row8 = $("<tr></tr>");
						td81.append("8、");
						td82.append("三阶互调(dB)");
						var NYq_IM3="word.Yq_IM3_"+table_count.toString(); 
						 td83.append($("<textarea name="+NYq_IM3+" rows='4' cols='58'/>"));
						var NIM3="word.IM3_"+table_count.toString(); 
						td84.append($("<textarea name="+NIM3+" rows='4' cols='40'/>"));
						var NIM3_rs="word.IM3_rs_"+table_count.toString(); 
						td85.append($("<input type='text' name="+NIM3_rs+">"));
						row8.append(td81);row8.append(td82);row8.append(td83);row8.append(td84);row8.append(td85);
						table2.append(row8);
				var row9 = $("<tr></tr>");
						td91.append("9、");
						td92.append("谐波(dB)");
						var NYq_Harmonic="word.Yq_Harmonic_"+table_count.toString(); 
						 td93.append($("<textarea name="+NYq_Harmonic+" rows='2' cols='58'/>"));
						var NHarmonic="word.Harmonic_"+table_count.toString(); 
						td94.append($("<textarea name="+NHarmonic+" rows='2' cols='40'/>"));
						var NHarmonic_rs="word.Harmonic_rs_"+table_count.toString(); 
						td95.append($("<input type='text' name="+NHarmonic_rs+">"));
						row9.append(td91);row9.append(td92);row9.append(td93);row9.append(td94);row9.append(td95);
						table2.append(row9);
				 var row10 = $("<tr></tr>");
					    td101.append("10、");
						td102.append("杂波(dB)");
						var NYq_Grass="word.Yq_Grass_"+table_count.toString(); 
						 td103.append($("<textarea name="+NYq_Grass+" rows='2' cols='58'/>"));
						var NGrass="word.Grass_"+table_count.toString(); 
						td104.append($("<textarea name="+NGrass+" rows='2' cols='40'/>"));
						var NGrass_rs="word.Grass_rs_"+table_count.toString(); 
						td105.append($("<input type='text' name="+NGrass_rs+">"));
						row10.append(td101);row10.append(td102);row10.append(td103);row10.append(td104);row10.append(td105);
						table2.append(row10);  
				 var row11 = $("<tr></tr>");
						td111.append("11、");
						td112.append("噪声系数(dB)");
						var NYq_NoiseRatio="word.Yq_NoiseRatio_"+table_count.toString(); 
						 td113.append($("<textarea name="+NYq_NoiseRatio+" rows='2' cols='58'/>"));
						var NNoiseRatio="word.NoiseRatio_"+table_count.toString(); 
						td114.append($("<textarea name="+NNoiseRatio+" rows='2' cols='40'/>"));
						var NNoiseRatio_rs="word.NoiseRatio_rs_"+table_count.toString(); 
						td115.append($("<input type='text' name="+NNoiseRatio_rs+">"));
						row11.append(td111);row11.append(td112);row11.append(td113);row11.append(td114);row11.append(td115);
						table2.append(row11);
				var row12 = $("<tr></tr>");
						td121.append("12、");
						td122.append("噪声功率谱密度(dBm/Hz)");
						var NYq_NoiseDensity="word.Yq_NoiseDensity_"+table_count.toString(); 
						 td123.append($("<textarea name="+NYq_NoiseDensity+" rows='2' cols='58'/>"));
						var NNoiseDensity="word.NoiseDensity_"+table_count.toString(); 
						td124.append($("<textarea name="+NNoiseDensity+" rows='2' cols='40'/>"));
						var NNoiseDensity_rs="word.NoiseDensity_rs_"+table_count.toString(); 
						td125.append($("<input type='text' name="+NNoiseDensity_rs+">"));
						row12.append(td121);row12.append(td122);row12.append(td123);row12.append(td124);row12.append(td125);
						table2.append(row12);
				var row13 = $("<tr></tr>");
						td131.append("13、");
						td132.append("输入驻波");
						var NYq_SWR_in="word.Yq_SWR_in_"+table_count.toString(); 
						 td133.append($("<input type='text' name="+NYq_SWR_in+">"));
						var NSWR_in="word.SWR_in_"+table_count.toString(); 
						td134.append($("<input type='text' name="+NSWR_in+">"));
						var NSWR_in_rs="word.SWR_in_rs_"+table_count.toString(); 
						td135.append($("<input type='text' name="+NSWR_in_rs+">"));
						row13.append(td131);row13.append(td132);row13.append(td133);row13.append(td134);row13.append(td135);
						table2.append(row13);
				var row14 = $("<tr></tr>");
						td141.append("14、");
						td142.append("输出驻波");
						var NYq_SWR_out="word.Yq_SWR_out_"+table_count.toString(); 
						 td143.append($("<input type='text' name="+NYq_SWR_out+">"));
						var NSWR_out="word.SWR_out_"+table_count.toString(); 
						td144.append($("<input type='text' name="+NSWR_out+">"));
						var NSWR_out_rs="word.SWR_out_rs_"+table_count.toString(); 
						td145.append($("<input type='text' name="+NSWR_out_rs+">"));
						row14.append(td141);row14.append(td142);row14.append(td143);row14.append(td144);row14.append(td145);
						table2.append(row14);
				var row15 = $("<tr></tr>");
						td151.append("15、");
						td152.append("遥控指令");
						var NYq_Order="word.Yq_Order_"+table_count.toString(); 
						 td153.append($("<input type='text' name="+NYq_Order+">"));
						var NOrder="word.Order_"+table_count.toString(); 
						td154.append($("<input type='text' name="+NOrder+">"));
						var NOrder_rs="word.Order_rs_"+table_count.toString(); 
						td155.append($("<input type='text' name="+NOrder_rs+">"));
						row15.append(td151);row15.append(td152);row15.append(td153);row15.append(td154);row15.append(td155);
						table2.append(row15);
				var row16 = $("<tr></tr>");
						td161.append("16、");
						td162.append("遥测电压");
						var NYq_Uout="word.Yq_Uout_"+table_count.toString(); 
						 td163.append($("<input type='text' name="+NYq_Uout+">"));
						var NUout="word.Uout_"+table_count.toString(); 
						td164.append($("<input type='text' name="+NUout+">"));
						var NUout_rs="word.Uout_rs_"+table_count.toString(); 
						td165.append($("<input type='text' name="+NUout_rs+">"));
						row16.append(td161);row16.append(td162);row16.append(td163);row16.append(td164);row16.append(td165);
						table2.append(row16);
				var row17 = $("<tr></tr>");
						td171.append("17、");
						td172.append("静态功耗");
						var NYq_Pcost="word.Yq_Pcost_"+table_count.toString(); 
						 td173.append($("<input type='text' name="+NYq_Pcost+">"));
						var NPcost="word.Pcost_"+table_count.toString(); 
						td174.append($("<input type='text' name="+NPcost+">"));
						var NPcost_rs="word.Pcost_rs_"+table_count.toString(); 
						td175.append($("<input type='text' name="+NPcost_rs+">"));
						row17.append(td171);row17.append(td172);row17.append(td173);row17.append(td174);row17.append(td175);
						table2.append(row17); 
		 		var row18 = $("<tr></tr>");
						td181.append("18、");
						td182.append("动态功耗");
						var NYq_Pcost1="word.Yq_Pcost1_"+table_count.toString(); 
						 td183.append($("<input type='text' name="+NYq_Pcost1+">"));
						var NPcost1="word.Pcost1_"+table_count.toString(); 
						td184.append($("<input type='text' name="+NPcost1+">"));
						var NPcost1_rs="word.Pcost1_rs_"+table_count.toString(); 
						td185.append($("<input type='text' name="+NPcost1_rs+">"));
						row18.append(td181);row18.append(td182);row18.append(td183);row18.append(td184);row18.append(td185);
						table2.append(row18);
				var row19 = $("<tr></tr>");
						td191.append("19、");
						td192.append("关机功耗");
						var NYq_Pcost2="word.Yq_Pcost2_"+table_count.toString(); 
						 td193.append($("<input type='text' name="+NYq_Pcost2+">"));
						var NPcost2="word.Pcost2_"+table_count.toString(); 
						td194.append($("<input type='text' name="+NPcost2+">"));
						var NPcost2_rs="word.Pcost2_rs_"+table_count.toString(); 
						td195.append($("<input type='text' name="+NPcost2_rs+">"));
						row19.append(td191);row19.append(td192);row19.append(td193);row19.append(td194);row19.append(td195);
						table2.append(row19);
				var row20 = $("<tr></tr>");
						td201.append("20、");
						td202.append("浪涌电流");
						var NYq_Ishock="word.Yq_Ishock_"+table_count.toString(); 
						 td203.append($("<input type='text' name="+NYq_Ishock+">"));
						var NIshock="word.Ishock_"+table_count.toString(); 
						td204.append($("<input type='text' name="+NIshock+">"));
						var NIshock_rs="word.Ishock_rs_"+table_count.toString(); 
						td205.append($("<input type='text' name="+NIshock_rs+">"));
						row20.append(td201);row20.append(td202);row20.append(td203);row20.append(td204);row20.append(td205);
						table2.append(row20);
				var row21 = $("<tr></tr>");
						td211.append("21、");
						td212.append("欠压保护");
						var NYq_U_down="word.Yq_U_down_"+table_count.toString(); 
						 td213.append($("<input type='text' name="+NYq_U_down+">"));
						var NU_down="word.U_down_"+table_count.toString(); 
						td214.append($("<input type='text' name="+NU_down+">"));
						var NU_down_rs="word.U_down_rs_"+table_count.toString(); 
						td215.append($("<input type='text' name="+NU_down_rs+">"));
						row21.append(td211);row21.append(td212);row21.append(td213);row21.append(td214);row21.append(td215);
						table2.append(row21);
				var row22 = $("<tr></tr>");
						td221.append("22、");
						td222.append("遥控指令");
						var NYq_U_up="word.Yq_U_up_"+table_count.toString(); 
						 td223.append($("<input type='text' name="+NYq_U_up+">"));
						var NU_up="word.U_up_"+table_count.toString(); 
						td224.append($("<input type='text' name="+NU_up+">"));
						var NU_up_rs="word.U_up_rs_"+table_count.toString(); 
						td225.append($("<input type='text' name="+NU_up_rs+">"));
						row22.append(td221);row22.append(td222);row22.append(td223);row22.append(td224);row22.append(td225);
						table2.append(row22); 
	         table2.insertAfter(field);
			}else if(table_count==0)
			{
				
				var table2=$("<table border='0' width='98%' name='NProductTable' class='edit_table' align='center'></table>");
				 var td1 = $("<td width='5%'></td>");
				var td2 = $("<td width='20%'></td>");
				var td3 = $("<td width='35%'></td>");
				var td4 = $("<td width='25%'></td>");
				var td5 = $("<td width='25%'></td>");
				var field= $("#ProductTable");
				//第二个表格
				var row1 = $("<tr></tr>");
				td1.append("");
				td2.append("点击按钮继续添加产品表单");
				td3.append("");
				td4.append("");
				td5.append("");
				row1.append(td1);row1.append(td2);row1.append(td3);row1.append(td4);row1.append(td5);
				table2.append(row1);
			
				table2.insertAfter(field);
			}
			else{
				alert("最多比较6台产品");
			}
		 table_count++;  
	}  
	
</script>
<div class="pageContent">
		<div class="pageFormContent" layoutH="50">
          <form id="testForm" method="post" action="../report/report!report.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
<div class="pageContent tabs" currentIndex="0" eventType="click">


    <div class="tabsHeader">
		<div class="tabsHeaderContent">
			<ul>
				<li><a href="javascript:;"><span>初测</span></a></li>
				<li><a href="javascript:;"><span>力学</span></a></li>
				<li><a href="javascript:;"><span>热真空</span></a></li>
				<li><a href="javascript:;"><span>热循环</span></a></li>
				<li><a href="javascript:;"><span>温循老炼</span></a></li>
				<li><a href="javascript:;"><span>高温老炼</span></a></li>
				<li><a href="javascript:;"><span>验收测试</span></a></li>
				<li><a href="javascript:;"><span>质量三单及超差项</span></a></li>
				<li><a href="javascript:;"><span>复查表</span></a></li>
			</ul>
		</div>
	  </div>


	    
	   <div class="tabsContent">
	  
		      <div>
           
				   
					<br/>
					 
					<fieldset>	
						<legend>测试数据模块</legend>
						<%-- style="height:600px--%>
						
								
						<fieldset id="Product">
							<legend>mes上传测试数据汇总(初测)</legend>
							
							<table  border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_c"></td>
									<td width="25%" ><input type="text" name="word.Frange_c"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_c"></td>
									<td width="25%" ><input type="text" name="word.Pin_c"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_c"></td>
									<td width="25%" ><input type="text" name="word.Pout_c"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWave_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWaveSlop_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Groupdelay_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_c"></td>
									<td width="25%" ><input type="text" name="word.AP_c"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_c" rows="5" cols="71"/></td>
									<td width="25%" ><textarea name="word.IM3_c" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Harmonic_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Grass_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseRatio_c" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_c" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseDensity_c" rows="2" cols="49"></textarea></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_c"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_c" ></td>
									<td width="25%" ><input type="text" name="word.SWR_in_c"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_c"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_c"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_c"></td>
									<td width="25%" ><input type="text" name="word.Order_c"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_c"></td>
									<td width="25%" ><input type="text" name="word.Uout_c"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_c"></td>
									<td width="25%" ><input type="text" name="word.Pcost_c"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_c"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_c"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_c"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_c"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_c"></td>
									<td width="25%" ><input type="text" name="word.Ishock_c"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_c"></td>
									<td width="25%" ><input type="text" name="word.U_down_c"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_c"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_c"></td>
									<td width="25%" ><input type="text" name="word.U_up_c"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_c"></td>
								</tr>
							</table>
							
						</fieldset> 
					</fieldset>
			
				
   			
		</div>
		<div>
		
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
						
						<fieldset>
							<legend>mes上传测试数据汇总(力学)</legend>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="7%">振动方向</td>
									<td align="center" width="14%" >测试阶段</td>
									<td align="center" width="14%" >输入功率(dBm)</td>
									<td align="center" width="14%" >输入频率(GHz)</td>
									<td align="center" width="14%" >输出功率(dBm)</td>
									<td align="center" width="14%" >母线电流(A)</td>
									<td align="center" width="10%" >功率遥测(V)</td>
									<td align="center" width="10%" >电流遥测(V)</td>
								</tr>
								<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验前</td>
									<td align="center" width="14%" ><input type="text" name="word.Pin_lxjc"></td>
									<td align="center" width="14%" ><input type="text" name="word.Freq_lxjc"></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_X_s"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_X_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_X_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_X_s"></td>
								</tr>
								<tr>
									<td align="center" width="7%">X</td>
									<td align="center" width="14%" >试验中</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_X_m"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_X_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_X_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_X_m"></td>
								</tr>
								<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验后</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_X_l"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_X_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_X_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_X_l"></td>
								</tr>
									<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验前</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Y_s"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Y_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Y_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Y_s"></td>
								</tr>
								<tr>
									<td align="center" width="7%">Y</td>
									<td align="center" width="14%" >试验中</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Y_m"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Y_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Y_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Y_m"></td>
								</tr>
								<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验后</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Y_l"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Y_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Y_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Y_l"></td>
								</tr>
								<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验前</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Z_s"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Z_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Z_s"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Z_s"></td>
								</tr>
								<tr>
									<td align="center" width="7%">Z</td>
									<td align="center" width="14%" >试验中</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Z_m"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Z_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Z_m"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Z_m"></td>
								</tr>
								<tr>
									<td align="center" width="7%"></td>
									<td align="center" width="14%" >试验后</td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ></td>
									<td align="center" width="14%" ><input type="text" name="word.Pout_lxjc_Z_l"></td>
									<td align="center" width="14%" ><input type="text" name="word.I_lxjc_Z_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Pvot_lxjc_Z_l"></td>
									<td align="center" width="10%" ><input type="text" name="word.Ivot_lxjc_Z_l"></td>
								</tr>
							</table>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_lx"></td>
									<td width="25%" ><input type="text" name="word.Frange_lx"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_lx"></td>
									<td width="25%" ><input type="text" name="word.Pin_lx"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_lx"></td>
									<td width="25%" ><input type="text" name="word.Pout_lx"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWave_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWaveSlop_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Groupdelay_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_lx"></td>
									<td width="25%" ><input type="text" name="word.AP_lx"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_lx" rows="5" cols="71"/>
									<td width="25%" ><textarea name="word.IM3_lx" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Harmonic_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Grass_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.NoiseRatio_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_lx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.NoiseDensity_lx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_lx"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_lx"></td>
									<td width="25%" ><input type="text" name="word.SWR_in_lx"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_lx"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_lx"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_lx"></td>
									<td width="25%" ><input type="text" name="word.Order_lx"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_lx"></td>
									<td width="25%" ><input type="text" name="word.Uout_lx"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_lx"></td>
									<td width="25%" ><input type="text" name="word.Pcost_lx"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_lx"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_lx"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_lx"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_lx"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_lx"></td>
									<td width="25%" ><input type="text" name="word.Ishock_lx"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_lx"></td>
									<td width="25%" ><input type="text" name="word.U_down_lx"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_lx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_lx"></td>
									<td width="25%" ><input type="text" name="word.U_up_lx"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_lx"></td>
								</tr>
							</table>
						</fieldset> 
					</fieldset>
				
				
   			
		</div>
		<div>
		
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
						
						<fieldset>
							<legend>mes上传测试数据汇总(热真空)</legend>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_zk"></td>
									<td width="25%" ><input type="text" name="word.Frange_zk"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_zk"></td>
									<td width="25%" ><input type="text" name="word.Pin_zk"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_zk"></td>
									<td width="25%" ><input type="text" name="word.Pout_zk"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pout_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pout_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWave_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.GainWave_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWave_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWaveSlop_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.GainWaveSlop_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWaveSlop_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_zk_l"></td>
								</tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Groupdelay_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.Groupdelay_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Groupdelay_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_zk"></td>
									<td width="25%" ><input type="text" name="word.AP_zk"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.AP_zk_h"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.AP_zk_l"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_zk" rows="5" cols="71"/>
									<td width="25%" ><textarea name="word.IM3_zk" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.IM3_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.IM3_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Harmonic_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.Harmonic_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Harmonic_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.Grass_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.Grass_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Grass_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.NoiseRatio_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.NoiseRatio_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseRatio_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_zk" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.NoiseDensity_zk" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#FFB5B5" name="word.NoiseDensity_zk_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseDensity_zk_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_zk"></td>
									<td width="25%" ><input type="text" name="word.SWR_in_zk"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_in_zk_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_in_zk_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_zk"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_zk"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_out_zk_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_out_zk_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_zk"></td>
									<td width="25%" ><input type="text" name="word.Order_zk"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_zk"></td>
									<td width="25%" ><input type="text" name="word.Uout_zk"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Uout_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Uout_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_zk"></td>
									<td width="25%" ><input type="text" name="word.Pcost_zk"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_zk"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_zk"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost1_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost1_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_zk"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_zk"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost2_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost2_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_zk"></td>
									<td width="25%" ><input type="text" name="word.Ishock_zk"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Ishock_zk_h"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Ishock_zk_l"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_zk"></td>
									<td width="25%" ><input type="text" name="word.U_down_zk"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_down_zk_h"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_down_zk_l"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_zk_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_zk"></td>
									<td width="25%" ><input type="text" name="word.U_up_zk"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_zk"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_up_zk_h"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_zk_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_up_zk_l"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_zk_l"></td>
								</tr>
							</table>
						</fieldset> 
					</fieldset>
				
				
   			
   		</div>
		<div>
			
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
						
						<fieldset>
							<legend>mes上传测试数据汇总(热循环)</legend>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_wx"></td>
									<td width="25%" ><input type="text" name="word.Frange_wx"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_wx"></td>
									<td width="25%" ><input type="text" name="word.Pin_wx"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_wx"></td>
									<td width="25%" ><input type="text" name="word.Pout_wx"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pout_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pout_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_wx" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWave_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWave_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWave_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWaveSlop_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWaveSlop_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWaveSlop_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Groupdelay_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Groupdelay_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Groupdelay_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_wx"></td>
									<td width="25%" ><input type="text" name="word.AP_wx"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.AP_wx_h"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.AP_wx_l"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_wx" rows="5" cols="71"/></td>
									<td width="25%" ><textarea name="word.IM3_wx" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.IM3_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.IM3_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Harmonic_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Harmonic_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Harmonic_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Grass_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Grass_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Grass_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseRatio_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseRatio_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseRatio_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_wx" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseDensity_wx" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseDensity_wx_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseDensity_wx_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_wx"></td>
									<td width="25%" ><input type="text" name="word.SWR_in_wx"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_in_wx_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_in_wx_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_wx"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_wx"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_out_wx_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_out_wx_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_wx"></td>
									<td width="25%" ><input type="text" name="word.Order_wx"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_wx"></td>
									<td width="25%" ><input type="text" name="word.Uout_wx"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Uout_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Uout_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_wx"></td>
									<td width="25%" ><input type="text" name="word.Pcost_wx"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_wx"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_wx"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost1_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost1_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_wx"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_wx"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost2_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost2_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_wx"></td>
									<td width="25%" ><input type="text" name="word.Ishock_wx"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Ishock_wx_h"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Ishock_wx_l"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_wx"></td>
									<td width="25%" ><input type="text" name="word.U_down_wx"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_down_wx_h"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_down_wx_l"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wx_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_wx"></td>
									<td width="25%" ><input type="text" name="word.U_up_wx"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wx"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_up_wx_h"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wx_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_up_wx_l"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wx_l"></td>
								</tr>
							</table>
						</fieldset> 
					</fieldset>
			
				
		</div>
		<div>
			
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
					
						<fieldset>
							<legend>mes上传测试数据汇总(温循老炼)</legend>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_wxll"></td>
									<td width="25%" ><input type="text" name="word.Frange_wxll"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_wxll"></td>
									<td width="25%" ><input type="text" name="word.Pin_wxll"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_wxll"></td>
									<td width="25%" ><input type="text" name="word.Pout_wxll"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pout_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pout_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_wxll" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWave_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWave_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWave_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWaveSlop_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWaveSlop_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.GainWaveSlop_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Groupdelay_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Groupdelay_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Groupdelay_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_wxll"></td>
									<td width="25%" ><input type="text" name="word.AP_wxll"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.AP_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.AP_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_wxll" rows="5" cols="71"/></td>
									<td width="25%" ><textarea name="word.IM3_wxll" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.IM3_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.IM3_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Harmonic_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Harmonic_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Harmonic_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Grass_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Grass_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.Grass_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseRatio_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseRatio_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseRatio_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_wxll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseDensity_wxll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseDensity_wxll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%"></td>
									<td width="25%" ><textarea style="background-color:#ACD6FF" name="word.NoiseDensity_wxll_l" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_wxll"></td>
									<td width="25%" ><input type="text" name="word.SWR_in_wxll"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_in_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_in_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_wxll"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_wxll"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_out_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.SWR_out_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_wxll"></td>
									<td width="25%" ><input type="text" name="word.Order_wxll"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_wxll"></td>
									<td width="25%" ><input type="text" name="word.Uout_wxll"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Uout_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Uout_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_wxll"></td>
									<td width="25%" ><input type="text" name="word.Pcost_wxll"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_wxll"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_wxll"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost1_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost1_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_wxll"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_wxll"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost2_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Pcost2_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_wxll"></td>
									<td width="25%" ><input type="text" name="word.Ishock_wxll"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Ishock_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.Ishock_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_wxll"></td>
									<td width="25%" ><input type="text" name="word.U_down_wxll"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_down_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_down_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_wxll_l"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_wxll"></td>
									<td width="25%" ><input type="text" name="word.U_up_wxll"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wxll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_up_wxll_h"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wxll_h"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#ACD6FF" name="word.U_up_wxll_l"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_wxll_l"></td>
								</tr>
							</table>
						</fieldset> 
					</fieldset>
				
				
		</div>
		<div>
			
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
						
						<fieldset>
							<legend>mes上传测试数据汇总(高温老炼)</legend>
							<table border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange_gwll"></td>
									<td width="25%" ><input type="text" name="word.Frange_gwll"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin_gwll"></td>
									<td width="25%" ><input type="text" name="word.Pin_gwll"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout_gwll"></td>
									<td width="25%" ><input type="text" name="word.Pout_gwll"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pout_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave_gwll" rows="2" cols="71"/>
									<td width="25%" ><textarea name="word.GainWave_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWave_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWaveSlop_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.GainWaveSlop_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Groupdelay_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Groupdelay_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP_gwll"></td>
									<td width="25%" ><input type="text" name="word.AP_gwll"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.AP_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.AP_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3_gwll" rows="5" cols="71"/></td>
									<td width="25%" ><textarea name="word.IM3_gwll" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.IM3_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Harmonic_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Harmonic_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Grass_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.Grass_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseRatio_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseRatio_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity_gwll" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseDensity_gwll" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><textarea  style="background-color:#FFB5B5" name="word.NoiseDensity_gwll_h" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in_gwll"></td>
									<td width="25%" ><input type="text" name="word.SWR_in_gwll"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_in_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out_gwll"></td>
									<td width="25%" ><input type="text" name="word.SWR_out_gwll"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.SWR_out_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order_gwll"></td>
									<td width="25%" ><input type="text" name="word.Order_gwll"></td>
									<td width="10%" ><input type="text" name="word.Order_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout_gwll"></td>
									<td width="25%" ><input type="text" name="word.Uout_gwll"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Uout_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost_gwll"></td>
									<td width="25%" ><input type="text" name="word.Pcost_gwll"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1_gwll"></td>
									<td width="25%" ><input type="text" name="word.Pcost1_gwll"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost1_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2_gwll"></td>
									<td width="25%" ><input type="text" name="word.Pcost2_gwll"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Pcost2_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock_gwll"></td>
									<td width="25%" ><input type="text" name="word.Ishock_gwll"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.Ishock_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down_gwll"></td>
									<td width="25%" ><input type="text" name="word.U_down_gwll"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_down_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs_gwll_h"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up_gwll"></td>
									<td width="25%" ><input type="text" name="word.U_up_gwll"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_gwll"></td>
								</tr>
								<tr>
									<td align="center" width="5%"></td>
									<td align="center" width="20%"></td>
									<td align="center" width="35%" ></td>
									<td width="25%" ><input type="text" style="background-color:#FFB5B5" name="word.U_up_gwll_h"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs_gwll_h"></td>
								</tr>
								
							</table>
						</fieldset> 
					</fieldset>
				
				
		</div>
		   <div>
			        
				
					<br/>
					<fieldset>	
						<legend>测试数据模块</legend>
						
						<fieldset>
							<legend>mes上传测试数据汇总(验收测试)</legend>
							<table border="0" width="80%" class="edit_table" align="center">
								<tr>
									<td width="15%" >产品名称：</td>
									<td width="20%" ><input type="text" name="word.ProductName"></td>
									<td width="15%" >产品编号：</td>
									<td width="20%" ><input type="text" name="word.ProductSeq"></td>
									
									
								</tr>
								</table>
							<table id="ProductTable" border="0" width="98%" class="edit_table" align="center">
								<tr>
									<td align="center" width="5%">序号</td>
									<td width="20%" >测试或检查项目</td>
									<td width="35%" >合格判据</td>
									<td width="25%" >实测数据</td>
									<td width="10%" >结论</td>
								</tr>
								<tr>
									<td align="center" width="5%">1、</td>
									<td align="center" width="20%">工作频率(MHz):</td>
									<td width="35%" ><input type="text" name="word.Yq_Frange"></td>
									<td width="25%" ><input type="text" name="word.Frange"></td>
									<td width="10%" ><input type="text" name="word.Frange_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">2、</td>
									<td align="center" width="20%">输入功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pin"></td>
									<td width="25%" ><input type="text" name="word.Pin"></td>
									<td width="10%" ><input type="text" name="word.Pin_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">3、</td>
									<td align="center" width="20%">输出功率(dBm)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pout"></td>
									<td width="25%" ><input type="text" name="word.Pout"></td>
									<td width="10%" ><input type="text" name="word.Pout_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">4、</td>
									<td align="center" width="20%">增益波动(dB)</td>
									<td width="35%" ><textarea name="word.Yq_GainWave" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWave" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWave_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">5、</td>
									<td align="center" width="20%">增益斜率(dB/MHz)</td>
									<td width="35%" ><textarea name="word.Yq_GainWaveSlop" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.GainWaveSlop" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.GainWaveSlop_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">6、</td>
									<td align="center" width="20%">群时延(ns)</td>
									<td width="35%" ><textarea name="word.Yq_Groupdelay" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Groupdelay" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Groupdelay_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">7、</td>
									<td align="center" width="20%">AM/PM变换系数(°/dB)</td>
									<td width="35%" ><input type="text" name="word.Yq_AP"></td>
									<td width="25%" ><input type="text" name="word.AP"></td>
									<td width="10%" ><input type="text" name="word.AP_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">8、</td>
									<td align="center" width="20%">三阶互调(dB)</td>
									<td width="30%" ><textarea name="word.Yq_IM3" rows="5" cols="71"/></td>
									<td width="25%" ><textarea name="word.IM3" rows="5" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.IM3_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">9、</td>
									<td align="center" width="20%">谐波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Harmonic" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Harmonic" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Harmonic_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">10、</td>
									<td align="center" width="20%">杂波(dB)</td>
									<td width="30%" ><textarea name="word.Yq_Grass" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.Grass" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.Grass_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">11、</td>
									<td align="center" width="20%">噪声系数(dB)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseRatio" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseRatio" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseRatio_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">12、</td>
									<td align="center" width="20%">噪声功率谱密度(dBm/Hz)</td>
									<td width="30%" ><textarea name="word.Yq_NoiseDensity" rows="2" cols="71"/></td>
									<td width="25%" ><textarea name="word.NoiseDensity" rows="2" cols="49"/></td>
									<td width="10%" ><input type="text" name="word.NoiseDensity_rs"></td>
								</tr>
								
								<tr>
									<td align="center" width="5%">13、</td>
									<td align="center" width="20%">输入驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_in"></td>
									<td width="25%" ><input type="text" name="word.SWR_in"></td>
									<td width="10%" ><input type="text" name="word.SWR_in_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">14、</td>
									<td align="center" width="20%">输出驻波</td>
									<td width="35%" ><input type="text" name="word.Yq_SWR_out"></td>
									<td width="25%" ><input type="text" name="word.SWR_out"></td>
									<td width="10%" ><input type="text" name="word.SWR_out_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">15、</td>
									<td align="center" width="20%">遥控指令</td>
									<td width="35%" ><input type="text" name="word.Yq_Order"></td>
									<td width="25%" ><input type="text" name="word.Order"></td>
									<td width="10%" ><input type="text" name="word.Order_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">16、</td>
									<td align="center" width="20%">遥测电压</td>
									<td width="35%" ><input type="text" name="word.Yq_Uout"></td>
									<td width="25%" ><input type="text" name="word.Uout"></td>
									<td width="10%" ><input type="text" name="word.Uout_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">17、</td>
									<td align="center" width="20%">静态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost"></td>
									<td width="25%" ><input type="text" name="word.Pcost"></td>
									<td width="10%" ><input type="text" name="word.Pcost_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">18、</td>
									<td align="center" width="20%">动态功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost1"></td>
									<td width="25%" ><input type="text" name="word.Pcost1"></td>
									<td width="10%" ><input type="text" name="word.Pcost1_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">19、</td>
									<td align="center" width="20%">关机功耗(W)</td>
									<td width="35%" ><input type="text" name="word.Yq_Pcost2"></td>
									<td width="25%" ><input type="text" name="word.Pcost2"></td>
									<td width="10%" ><input type="text" name="word.Pcost2_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">20、</td>
									<td align="center" width="20%">浪涌电流(A)</td>
									<td width="35%" ><input type="text" name="word.Yq_Ishock"></td>
									<td width="25%" ><input type="text" name="word.Ishock"></td>
									<td width="10%" ><input type="text" name="word.Ishock_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">21、</td>
									<td align="center" width="20%">欠压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_down"></td>
									<td width="25%" ><input type="text" name="word.U_down"></td>
									<td width="10%" ><input type="text" name="word.U_down_rs"></td>
								</tr>
								<tr>
									<td align="center" width="5%">22、</td>
									<td align="center" width="20%">过压保护(V)</td>
									<td width="35%" ><input type="text" name="word.Yq_U_up"></td>
									<td width="25%" ><input type="text" name="word.U_up"></td>
									<td width="10%" ><input type="text" name="word.U_up_rs"></td>
								</tr>
							</table>
							<input type="button" onclick="addNewProduct()" value="添加新产品生成数据对比报告"/> 
						</fieldset> 
					</fieldset>
					
		                 
			         
				</div>
		<div>质量三单及超差项</div>
		<div>复查表</div>
	
							<div class="tabsFooter">
								<div class="tabsFooterContent"></div>
							</div>
			   </div>
   </div> 
                        
                  <div class="formBar" style="text-align: center;">
					       <ul style="">
						   <li style="float: left;"><div class="buttonActive"><div class="buttonContent"><button id="testBtn" type="button">生成报告</button>
						     </div></div></li>
						   <li><a  id="DownloadReport" href="javascript:;" "  download="研制总结报告.docx" class="button" ><span>下载报告</span></a></li>
						   <li><a class="button" href="../order/order!showList.action?a=a&b=b"  target="navTab"><span>返回</span></a>
					       </ul>			
			              </div>        
                         </form>
                        			
		           </div> 
</div>



