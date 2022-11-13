if(global.state_candle){ //should be true by default
	if position_meeting(mouse_x,mouse_y,obj_candle){
		sprite_index = spr_candle_outline;
	}
	else{
		sprite_index = spr_candle;
	}
}

//state_candle is when candle is able to be used
//candle can only be used one time per game
//game resets after showing score, player can press button to reset
