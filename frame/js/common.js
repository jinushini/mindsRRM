/**
 * 获取navTab中的对象
 * @param {Object} s
 * @return {TypeName} 
 */
function dwz(s){
	return $(s,navTab.getCurrentPanel());
}
/**
 * 获取navTab中的对象
 * @param {Object} s
 * @return {TypeName} 
 */
function jui(s){
	return navTab.getCurrentPanel().find(s);
}

/**
 * 获取navTab中的对象
 * @param {Object} selector
 * @return {TypeName} 
 */
function jn(selector){
	return $(selector,navTab.getCurrentPanel());
}

/**
 * 获取dialog中的对象
 * @param {Object} s
 * @return {TypeName} 
 */
function jd(selector){
	return $(selector, $.pdialog.getCurrent());
}

/**
 * 判断某个数据是不是整整数<br>
 * 是：返回1；不是：返回0
 * @param {Object} value
 */
function isPosInt(value){
	if(value<0||value!=parseInt(value))
		return 0;
	else
		return 1;
}