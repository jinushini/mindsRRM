	
	var canvas ;
	var context ;
	var xNumS;
	//水平标尺与canvas的距离
	var HORIZONTAL_AXIS_MARGIN;
	//竖直标尺与canvas的距离
	var VERTICAL_AXIS_MARGIN;
	//标尺起点
	var AXIS_ORIGIN;
	//坐标的顶部
	var AXIS_TOP;
	//坐标的长度
	var AXIS_RIGHT;
	//小标记的间隔
	var HORIZONTAL_TICK_SPACING;
	var VERTICAL_TICK_SPACING;
	//坐标标记的范围
	var AXIS_WIDTH;
	var AXIS_HEIGHT;
	//纵向标记的数值
	var NUM_VERTICAL_TICKS ;
	//横向标记的数值
	var NUM_HORIZONTAL_TICKS;
	var TICK_WIDTH;
	//标牌和坐标轴之间的距离
	var SPACE_BETWEEN_ABELS_AND_AXIS;
	
	
	
	function setCanvas(){
		canvas.onmousedown = canvasClick;
		//水平标尺与canvas的距离
		HORIZONTAL_AXIS_MARGIN=50;
		//竖直标尺与canvas的距离
		VERTICAL_AXIS_MARGIN=50;
		//标尺起点
		AXIS_ORIGIN={
			x:HORIZONTAL_AXIS_MARGIN,
			y:canvas.height-VERTICAL_AXIS_MARGIN
		};
		//坐标的顶部
		AXIS_TOP = VERTICAL_AXIS_MARGIN;
		//坐标的长度
		AXIS_RIGHT=canvas.width-HORIZONTAL_AXIS_MARGIN;
		//小标记的间隔
		HORIZONTAL_TICK_SPACING=10;
		VERTICAL_TICK_SPACING=10;
		//坐标标记的范围
		AXIS_WIDTH=AXIS_RIGHT- AXIS_ORIGIN.x;
		AXIS_HEIGHT=AXIS_ORIGIN.y-AXIS_TOP;
		//纵向标记的数值
		NUM_VERTICAL_TICKS = AXIS_HEIGHT/VERTICAL_TICK_SPACING;
		//横向标记的数值
		NUM_HORIZONTAL_TICKS=AXIS_WIDTH/HORIZONTAL_TICK_SPACING;
		TICK_WIDTH=10;
		//标牌和坐标轴之间的距离
		SPACE_BETWEEN_ABELS_AND_AXIS=20;
		
		
		
		
		context.font="13px Arial";
		context.fillStyle="black";
		drawGrid("lightgray",100,100);

		context.shadowOffsetX=3;
		context.shadowOffsetY=3;
		context.shadowBlur=5;

		drawAxes();
		drawAxisLabels();
	}


	function drawAxes(){
		context.save();
		context.lineWidth=1.0;
		context.fillStyle = "rgba(100,140,230,0.8)";
		context.strokeStyle="navy";
		drawHorizontalAxis();
		drawVerticalAxis();

		context.lineWidth=0.5;
		context.strokeStyle="darkred";
		drawVerticalAxisTicks();
		drawHorizontalAxisTicks();
		context.restore();

	}

	//绘制水平小标
	function drawHorizontalAxisTicks(){
		var deltaY;
		for(var i=1;i<NUM_HORIZONTAL_TICKS;i++){
			//判断画的是大坐标还是短坐标
			if(i%10==0){
				context.beginPath();
				deltaY=TICK_WIDTH;			
				context.moveTo(AXIS_ORIGIN.x+i*HORIZONTAL_TICK_SPACING,AXIS_ORIGIN.y-deltaY);
				context.lineTo(AXIS_ORIGIN.x+i*HORIZONTAL_TICK_SPACING,AXIS_ORIGIN.y+deltaY);
				context.stroke();
			}

		}
	}
	//绘制竖直的小标
	function drawVerticalAxisTicks(){
		var deltaX;
		for(var i=1;i<NUM_VERTICAL_TICKS;i++){
			//判断画的是大坐标还是短坐标
			if(i%5==0){
				context.beginPath();
				deltaX=TICK_WIDTH;
				context.moveTo(AXIS_ORIGIN.x-deltaX,AXIS_ORIGIN.y-i*VERTICAL_TICK_SPACING);
				context.lineTo(AXIS_ORIGIN.x+deltaX,AXIS_ORIGIN.y-i*VERTICAL_TICK_SPACING);
				context.stroke();
			}
		}
	}
	//绘制竖直线
	function drawVerticalAxis(){
		context.beginPath();
		context.moveTo(AXIS_ORIGIN.x,AXIS_ORIGIN.y);
		context.lineTo(AXIS_ORIGIN.x,AXIS_TOP);
		context.stroke();
	}
		
	//绘制水平线
	function drawHorizontalAxis(){
		context.beginPath();
		context.moveTo(AXIS_ORIGIN.x,AXIS_ORIGIN.y);
		context.lineTo(AXIS_RIGHT,AXIS_ORIGIN.y);
		context.stroke();
	}

	//绘制标注
	function drawAxisLabels(){
		context.fillStyle = "blue";
		drawHorizontalAxisLabels();
		drawVerticalAxisLabels();
	}

	//绘制水平轴标注
	function drawVerticalAxisLabels(){
		context.textAlign = "center";
		context.textBaseline="top"
		for(var i=0;i<= NUM_HORIZONTAL_TICKS;i++){
			if(i%10==0){
				context.fillStyle="black";
				context.fillText(Math.ceil(i*xNumS),AXIS_ORIGIN.x+i*HORIZONTAL_TICK_SPACING,AXIS_ORIGIN.y+SPACE_BETWEEN_ABELS_AND_AXIS);
			}
		}
	}
	//绘制竖直标注
	function drawHorizontalAxisLabels(){
		context.textAlign = "center";
		context.textBaseline="middle"
		for(var i=0;i<= NUM_VERTICAL_TICKS;i++){
			if(i%5==0){
				context.fillStyle="black";
				context.fillText(2*(i-50),AXIS_ORIGIN.x-SPACE_BETWEEN_ABELS_AND_AXIS,AXIS_ORIGIN.y-+i*VERTICAL_TICK_SPACING);
			}
		}
	}

	//画网格线
	function drawGrid(color,stepx,stepy){
		context.save();
		context.fillStyle="#ffffff";
		context.strokeStyle=color;
		context.lineWidth=0.5;
		context.fillRect(0,0,context.canvas.width,context.canvas.height);
		for(var i=stepx+0.5;i<context.canvas.width;i+=stepx){
			context.beginPath();
			context.moveTo(i,0);
			context.lineTo(i,context.canvas.height);
			context.stroke();
		}

		for(var i=stepy+0.5;i<context.canvas.height;i+=stepy){
			context.beginPath();
			context.moveTo(0,i);
			context.lineTo(context.canvas.width,i);
			context.stroke();
		}
		context.restore();
	}


	function drawXYName(xName,yName,caption){
	
		context.fillStyle="black";
		context.font="bold 20px Arial"
		context.fillText(xName,context.canvas.width/2,context.canvas.height-20);
		context.fillStyle="black";
		context.fillText(caption,context.canvas.width/2,20);
		
		context.save();
		context.translate(0,context.canvas.height/2);
		context.rotate(-90*Math.PI/180);
		context.fillStyle="black";
		context.fillText(yName,5,5);
		context.restore();
	}

	function getRandomColor(){
		return ('00'+(Math.random()*0x100<<0)).slice(-3);
	}



	