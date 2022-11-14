
if(facedown){
sprite_index = spr_back;
	}else {
	if(card_type == card_rock){
		sprite_index = spr_rock;
	}else if(card_type == card_paper){
		sprite_index = spr_paper;
	}else if(card_type == card_scissor){
		sprite_index = spr_scissors;
	}
}

x = lerp(x, target_x, 0.1);
y = lerp(y, target_y, 0.1);


//destroy card when needed
if(global.candle_picked_up){
	//if position_meeting(mouse_x,mouse_y,global.ai_specific_card){
	//	global.ai_specific_card.sprite_index = spr_back_outline;
	//}
	//else{global.ai_specific_card = spr_back;}
	
	if position_meeting(x,y,global.ai_specific_card)and(mouse_check_button_pressed(mb_left)){
		show_debug_message("yeet");
		instance_destroy(global.ai_specific_card);
	}
	global.candle_picked_up = false; //check if this clashes later
	global.candle_use = false;
	//reset candle position back to original position
	//x = initial_x;
	//y = initial_y;
	
	
	//obj_game_manager.waiting_for_alarm = true;
}

//id instance 
	//player_deal_card_inst = instance_position(mouse_x,mouse_y,obj_card);
	
	//if (player_deal_card_inst!=noone) {
	//	if (player_deal_card_inst.card_holder == ch_player) {
	//		player_deal_card_inst.target_y = 600;