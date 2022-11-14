

if(global.state_candle){ //should be true by default
	if position_meeting(mouse_x,mouse_y,obj_candle){
		sprite_index = spr_candle_outline;
		}
	else{
		sprite_index = spr_candle;
	}
}


//atm its not triggering because event was commented out
//probably tinker with the timer or move events around 
//add a new event before ai flips? so that person can burn the card
//end of prev event tack on maybe 

//changed so that clicking on candle will mean burning the other card
//uh if they click on the card again maybe itll just skip?

//picking up candle (follow mouse)
if (global.candle_use == true){
	//show_debug_message("candle use triggered");
	//if mouse is on obj_candle
	if position_meeting(mouse_x,mouse_y,obj_candle){
			//show_debug_message(global.ai_specific_card);
			//show_debug_message(initial_x);
			//show_debug_message(initial_y);
		if(mouse_check_button(mb_left)){
			show_debug_message("picked up");
			global.candle_picked_up = true;
			sprite_index = spr_candle_3;
		}
	else{ } //placeholder
	}
}

////destroy card when needed
//if(global.candle_picked_up){
//	if position_meeting(x,y,global.ai_specific_card)and(mouse_check_button_pressed(mb_left)){
//		obj_card.sprite_index = spr_back_outline;
//		instance_destroy(global.ai_specific_card);
//	}
//	global.candle_use = false;
//	//reset candle position back to original position
//	//x = initial_x;
//	//y = initial_y;
	
//	obj_game_manager.waiting_for_alarm = true;
//}



//state_candle is when candle is able to be used
//candle can only be used one time per game
//game resets after showing score, player can press button to reset

//game needs to pause at ai flip ...,AGHLAKHGLKSGH
