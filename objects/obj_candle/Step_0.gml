//state_candle tracks outline candle sprite and nothing else

if(global.state_candle){ //should be true by default
	if position_meeting(mouse_x,mouse_y,obj_candle){
		sprite_index = spr_candle_outline;
		}
	else{
		sprite_index = spr_candle;
	}
}

if (global.candle_extinguished == true){
	//extinguishes the actual sprite as an indicator
	sprite_index = spr_candle_3;
	
	//clicking on the ai card does xyz...
	ai_burn_card = instance_position(mouse_x,mouse_y,obj_card);

	if (ai_burn_card!=noone) {
		if position_meeting(mouse_x,mouse_y,ai_burn_card)and(mouse_check_button_pressed(mb_left)){
			show_debug_message("yeet");
			change_ai_sprite = true;
			obj_game_manager.game_state = obj_game_manager.state_faceup_ai_selection;
			global.candle_was_used = true;
			}
		}
	
	//the effects that happen when this stuff happens
	if(change_ai_sprite){
		//throw in a screen shake and sfx here
		//no time to probably debug the sprite code
		
	}
	//if(change_ai_sprite){
	//		show_debug_message("change ai sprite");
	//		ai_burn_card.sprite_index = spr_outline;
	//		//skip comparing, nobody gains points for that round
	//		//game_state = obj_game_manager.state_discard;
	//		global.candle_was_used = true;
	//		obj_game_manager.waiting_for_alarm = true;
	//	}
}

//candle_picked_up tracks candle extinguish or not
//candle extinguishes if player chooses to use it

//if candle is not picked up then candle use is true.
//what is candle_use for?
//if candle_use is triggered, candle extinguishes


////picking up candle 
//if (global.candle_use == true){
//	//if mouse is on obj_candle and clicked on 
//	if position_meeting(mouse_x,mouse_y,obj_candle) and (mouse_check_button_pressed(mb_left)){
//			//show_debug_message(global.ai_specific_card);
//			//show_debug_message(initial_x);
//			//show_debug_message(initial_y);
//			global.candle_picked_up = true;
//	}
//	//if button pressed, ignores candle
//	else if(keyboard_check_pressed(vk_space)){
		
//	}
	
//	//extinguish candle
//	if(global.candle_picked_up == true){
//		//show_debug_message("picked up");
//		sprite_index = spr_candle_3; 
		
//////destroy card when needed

//	ai_burn_card = instance_position(mouse_x,mouse_y,obj_card);
	
//	if (ai_burn_card!=noone) {
//	if position_meeting(mouse_x,mouse_y,ai_burn_card)and(mouse_check_button_pressed(mb_left)){
//		//show_debug_message("yeet");
//		change_ai_sprite = true;
//		//instance_destroy(ai_burn_card); //change
//	}
	
//	if(change_ai_sprite){
//			show_debug_message("change ai sprite");
//			ai_burn_card.sprite_index = spr_outline;
//			//skip comparing, nobody gains points for that round
//			//game_state = obj_game_manager.state_discard;
//			global.candle_was_used = true;
//			obj_game_manager.waiting_for_alarm = true;
//		}
		
//	else{} //placeholder
//	change_ai_sprite = false;
	
//	} // for now. delete when line below is uncommented
////	obj_game_manager.waiting_for_alarm = true;
////}
//	}
		
//	else{ } //placeholder
//}

//GLOBAL.CANDLE_PICKED_UP IS TO TRACK IF PLAYER USED CANDLE
//WHEN THEY USE CANDLE, IT WILL BE TRUE FROM HERE ON OUT
//AT LEAST THAT'S WHAT I THINK IT IS, I NEED TO NAME MY VARIABLES BETTER
//i was so wrong

//state_candle is when candle is able to be used
//candle can only be used one time per game
//game resets after showing score, player can press button to reset


