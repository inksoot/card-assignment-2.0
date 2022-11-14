
////24 cards total
//if(ds_list_size(discard_list) == 24){
//	for(i = 0; i < ds_list_size(discard_list);i++){
//discard_list[|i].target_x = card_x;
//discard_list[|i].target_y = card_y - i *2.2;
//discard_list[|i].facedown = true;
//discard_list[|i].depth = -i;
////if(discard_list[|i].target_x == card_x){
////instance_destroy(discard_list[|i]);
////}
//ds_list_add(cards,discard_list[|i]);
//}
//}

//ds_list_clear(discard_list);
//num_cards= 24;

//game_state = state_initial_deal; //resetting
//waiting_for_alarm = false;

//CHOOSE CANDLE STATE HERE!! MOVED PREV ALARM 4 to ALARM 5
//if candle is clicked!! do shit!
if position_meeting(mouse_x,mouse_y,obj_candle) and (mouse_check_button_pressed(mb_left)){
	
}
//otherwise if it's not!! then just progress (waiting for alarm false makes it move on
waiting_for_alarm = false;
