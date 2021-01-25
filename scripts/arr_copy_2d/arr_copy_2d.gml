// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function arr_copy_2d(array){
	var arr = array;
	var temp = arr[0, 0];
	arr[0, 0] = temp;
	return arr;
}