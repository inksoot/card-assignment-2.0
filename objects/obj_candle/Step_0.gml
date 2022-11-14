

if(global.state_candle){ //should be true by default
	if position_meeting(mouse_x,mouse_y,obj_candle){
		sprite_index = spr_candle_outline;
		}
	else{
		sprite_index = spr_candle;
	}
}


//picking up candle (follow mouse)
if (global.candle_use == true){
	//if mouse is on obj_candle and clicked on 
	if position_meeting(mouse_x,mouse_y,obj_candle) and (mouse_check_button_pressed(mb_left)){
			//show_debug_message(global.ai_specific_card);
			//show_debug_message(initial_x);
			//show_debug_message(initial_y);
			global.candle_picked_up = true;
	}
	if(global.candle_picked_up == true){
		show_debug_message("picked up");
		sprite_index = spr_candle_3;
		
////destroy card when needed

	ai_burn_card = instance_position(mouse_x,mouse_y,obj_card);
	
	if (ai_burn_card!=noone) {
	if position_meeting(mouse_x,mouse_y,ai_burn_card)and(mouse_check_button_pressed(mb_left)){
		show_debug_message("yeet");
		instance_destroy(ai_burn_card); 
	}
	
	} // for now. delete when line below is uncommented
//	obj_game_manager.waiting_for_alarm = true;
//}
	}
		
	else{ } //placeholder
}

//GLOBAL.CANDLE_PICKED_UP IS TO TRACK IF PLAYER USED CANDLE
//WHEN THEY USE CANDLE, IT WILL BE TRUE FROM HERE ON OUT
//AT LEAST THAT'S WHAT I THINK IT IS, I NEED TO NAME MY VARIABLES BETTER


//state_candle is when candle is able to be used
//candle can only be used one time per game
//game resets after showing score, player can press button to reset


