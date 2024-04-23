
	function drawCanvas(){	
		//清空画布
		context.clearRect(0,0,canvas.width,canvas.height);
		setCanvas();
		//标题
		drawXYName('Frequency (GHz)','dBc','Spur Analysis  (spur levels are for ref. only)');
		if(isIni)drawD();
		else{
			drawRect();
		}

	}
	function drawD(){
		for(var i=0;i<=fType*1;i++){
			for(var j=0;j<=fType*1;j++){
				//00丢弃
				if(i==0&&j==0){
					continue;
				}else if(i==0){
					fStart = (j*lfStart).toFixed(3);
					fEnd = (j*lfEnd).toFixed(3);
					rfLo = j+"LO("+fStart+"~"+fEnd+","+rl[0][j]+")"	
					yVal=Math.abs(5*rl[0][j]);
				}else if(j==0){
					fStart = (i*ifStart).toFixed(3);
					fEnd = (i*ifEnd).toFixed(3);
					rfLo = i+"RF("+fStart+"~"+fEnd+","+rl[i][0]+")"	
					yVal=Math.abs(5*rl[i][0]);
				}else{
					var fStart = (i*ifStart+j*lfStart).toFixed(3);
					var fEnd = (i*ifEnd+j*lfEnd).toFixed(3);
					rfLo =i+"RF+"+ j+"LO("+fStart+"~"+fEnd+","+rl[i][j]+")"	
					yVal=Math.abs(5*rl[i][j]);
					xVal= j*lfStart*10/xNumS+i*ifStart*10/xNumS;
					xStep =j*lfEnd*10/xNumS+i*ifEnd*10/xNumS;
					drawRL(rfLo,yVal,xVal,xStep);

					//需要处理负值
					var r = getSE(i*ifStart,i*ifEnd,j*lfStart,j*lfEnd);
					fStart = Number(r.split("-")[0]).toFixed(3);
					fEnd =Number(r.split("-")[1]).toFixed(3);
					rfLo =i+"RF-"+ j+"LO("+fStart+"~"+fEnd+","+rl[i][j]+")"	
					//fStart = Math.abs((i*ifStart-j*lfStart).toFixed(3));
					//fEnd = Math.abs((i*ifEnd-j*lfEnd).toFixed(3));
					yVal=Math.abs(5*rl[i][j]);
					
				}
				xVal= fStart*10/xNumS;
				xStep =fEnd*10/xNumS;
				drawRL(rfLo,yVal,xVal,xStep);
			}				
			
		}
	}
	
	function getSE(a,b,c,d){
		var iMin=Math.abs(a-c);
		var iMax=Math.abs(b-d);
		var iStep=((b*1-a*1)/30).toFixed(6);
		var lStep=((d*1-c*1)/30).toFixed(6);
		for(i=0;i<=30;i++){
			var r =Math.abs((a*1+i*iStep)-(c*1+i*lStep));
			if(r<iMin)iMin=r;
			if(r>iMax)iMax=r;
		}
		return iMin+"-"+iMax;
		
	}
	//重画面积
	function drawRect(){			
		var rect ;
		for(var i=rects.length-1; i>=0; i--) {
			rect = rects[i];
			if(rect.isSelected)	continue;
			if(showMipaT=="true"){
				context.fillStyle="black";
				context.font="12px Arial"
				context.fillText(rect.ti,(2*rect.a+rect.c)/2,rect.b-20);
			}
			
			if(rect.c==0){
				context.strokeStyle=rect.st;
				context.lineWidth=2;					
				context.beginPath();
				context.moveTo(rect.a,rect.b);
				context.lineTo(rect.a,rect.b+rect.d);
				context.lineCap="round";
				context.stroke();		
			}else{
				context.fillStyle=rect.st;
				context.fillRect(rect.a,rect.b,rect.c,rect.d,0.5);
			}

			context.restore();
		}
		

		if(previousSelectedRect!=null)	{
			rect =previousSelectedRect;
			context.fillStyle="red";
			context.font="12px Arial"
			context.fillText(rect.ti,(2*rect.a+rect.c)/2,rect.b-20);

			context.restore();
			context.fillStyle=rect.st;
			context.fillRect(rect.a,rect.b,rect.c,rect.d,0.5);
			context.strokeStyle="red"
			context.strokeRect(rect.a,rect.b,rect.c,rect.d);
		}
		
	}
	function clearRect(){	
		isIni =false;
		drawCanvas();
	}
	
	function canvasClick(e) {
		// Get the canvas click coordinates.
		var clickX = Math.abs(e.layerX- canvas.offsetLeft);
		var clickY = Math.abs(e.layerY- canvas.offsetTop);
		
		
	  	// Look for the clicked circle.
	 	 for(var i=rects.length-1; i>=0; i--) {
			var rect = rects[i];
			//alert(rect.a+"-"+(rect.a*1+rect.c)+"-"+clickX+"-"+rect.b+"-"+(canvas.height-50)+"-"+clickY);
			if((rect.a<=clickX&&(rect.a*1+rect.c)>=clickX)&&(rect.b<=clickY&&(canvas.height-50)>=clickY)){
				if (previousSelectedRect != null){
					previousSelectedRect.isSelected = false;
				}
		      	rect.isSelected = true;
				previousSelectedRect = rect;
				
				 clearRect();
				 return;
			}		      
	    }		  
	}
	
	function Rect(a,b,c,d,st,ti) {
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.st = st;
		this.ti=ti;
		this.isSelected = false;
	}
	
				
	//划定范围
	function drawRL(rfLo,yVal,xVal,xStep){
		yVal = 100+yVal;
		xVal = 50+xVal;
		xStep = 50+xStep-xVal;
		//是否显示图形标题
		if(showMipaT=="true"){
			context.fillStyle="black";
			context.font="12px Arial"
			context.fillText(rfLo,(2*xVal+xStep)/2,yVal-20);
		}
		var st="rgba("+getRandomColor()+","+getRandomColor()+","+getRandomColor()+",0.6)";
		
		// Rect the new rect.
		var rect = new Rect(xVal,yVal,xStep,canvas.height-yVal-HORIZONTAL_AXIS_MARGIN,st,rfLo);					
		 // Store it in the array.
		rects.push(rect);
		//画直线
		if(xStep==0){
			context.strokeStyle=st
			context.lineWidth=2;					
			context.beginPath();
			context.moveTo(xVal,yVal);
			context.lineTo(xVal,canvas.height-HORIZONTAL_AXIS_MARGIN);
			context.lineCap="round";
			context.stroke();		
		}else{					
			//画面积
			context.fillStyle=st
			context.fillRect(xVal,yVal,xStep,canvas.height-yVal-HORIZONTAL_AXIS_MARGIN,0.6);	
		}

		
	}