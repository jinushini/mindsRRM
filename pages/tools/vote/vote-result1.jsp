<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
    var options = {
    	stacked: false,
    	gutter:20,  //柱状相对于坐标轴的位置
		axis: "0 0 1 1", // Where to put the labels (trbl)
		axisystep: 10 // How many x interval labels to render (axisystep does the same for the y axis)
		
	};
	
	$(function() {
        // Creates canvas
        var r = Raphael("chartHolder");

		//第一个图表
		options.axisystep = 5;
		options.stacked=false;
		var data1 = [[10,20,30,50,15,25,35,50, 18, 28, 38, 24]];  //图表的各列数据，当鼠标放在图表纵轴上时显示该数据
		var chart1 = r.barchart(40, 10, 320, 200, data1, options).hover(function() { //前两个数字是该图表坐标轴原点的位置；第三个数字表示图表的x轴长度；第四个数字表示y轴长度
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value).insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
		chart1.label([["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9",  "A10", "A11", "A12"]],true);//表示各列的名字
		
		//第二个图表
		var data2 = [[10,20,30,50,15,25,35,50, 18, 28, 38, 24]];
		var chart2 = r.barchart(400, 10, 320, 200, data2, options).hover(function() {
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value).insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
		chart2.label([["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9",  "A10", "A11", "A12"]],true);
		
		//第三个图表
		var data3 = [[10,20,30,50,15,25,35,50, 18, 28, 38, 24]];
		var chart3 = r.barchart(40, 220, 320, 200, data3, options).hover(function() {
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value).insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
		chart3.label([["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9",  "A10", "A11", "A12"]],true);
		
		//第四个图表
		var data4 = [[10,20,30,50,15,25,35,50, 18, 28, 38, 24]];
		var chart4 = r.barchart(400, 220, 320, 200, data4, options).hover(function() {
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value).insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
		chart4.label([["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9",  "A10", "A11", "A12"]],true);
	});
</script>
<div id="chartHolder" style="height:50em;">
</div>

