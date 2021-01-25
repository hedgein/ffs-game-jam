// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_attack_lock(lock_index){
global.ga_attack_lock[lock_index, 1] = "LOCKED";
global.ga_attack_lock[6, 1] = "LOCKED"
}