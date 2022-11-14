
card_x = 100;
card_y = room_height/2;

if (game_state == state_initial_deal) {
	 player_card_i = 0;
	if !audio_is_playing(sd_shuffle){
		audio_play_sound(sd_shuffle,1,false);
	}
///
	ds_list_clear(cards);
	

	for(i = 0; i<num_cards;i++) {
		card_inst = instance_create_layer(card_x,card_y,"Instances",obj_card);
		card_inst.card_type = i%type_amt;
		
		ds_list_add(cards,card_inst);
	}
///
	ds_list_shuffle(cards);
	
	for(i = 0; i<num_cards;i++) {
		
		cards[|i].target_x = card_x;
		cards[|i].target_y = card_y - i*2;
		cards[|i].facedown = true;
		cards[|i].depth = -i;
		cards[|i].card_holder = ch_ai;
		
	}
	 
	

	if (!waiting_for_alarm) {
		game_state = -4;
		alarm[0] = 1 * room_speed;
	}
	
}

if (game_state == state_ai_deal) {
	
	num_ai_card = 3;
	num_player_card = 3;
	ai_x = 300;
	ai_y = 300;

	if(timer < 70){
		timer ++;
		
	}

	if(ds_list_size(ai_cards) < 3 and timer == 60){
		
		cards[|num_cards - 1].target_x = ai_x + ai_card_i * 100;
		if !audio_is_playing(sd_whoosh){
			audio_play_sound(sd_whoosh,1,false);
		}
		cards[|num_cards - 1].target_y = ai_y;
		cards[|num_cards - 1].facedown = true;
		cards[|num_cards - 1].card_holder = ch_ai;
		
		ds_list_add(ai_cards,cards[|num_cards - 1]);		
		ds_list_delete(cards, num_cards - 1);

		timer = 0;
		num_cards -=1;
		ai_card_i +=1;
	}

	
	waiting_for_alarm = true;
	
	if (waiting_for_alarm and ds_list_size(ai_cards) ==3) {
		game_state = -4;
		alarm[1] = .5 * room_speed;
	} 
}

if(game_state == state_player_deal) {
	ai_card_i = 0;
	player_x = 300;
	player_y = 650;
	
	
	if(timer < 70){
		timer ++;
		
	}

	if(ds_list_size(player_cards) < 3 and timer == 60){
		
		cards[|num_cards - 1].target_x = player_x + player_card_i * 100;
		if !audio_is_playing(sd_whoosh){
			audio_play_sound(sd_whoosh,1,false);
		}
		cards[|num_cards - 1].target_y = player_y;
		cards[|num_cards - 1].facedown = false;
		cards[|num_cards - 1].card_holder = ch_player;
		
		ds_list_add(player_cards,cards[|num_cards - 1]);		
		ds_list_delete(cards, num_cards - 1);

		timer = 0;
		num_cards -=1;
		player_card_i +=1;
		
	}
	
	if(ds_list_size(player_cards) == 3){
		game_state = state_selection;
	}
	
} 

if (game_state == state_selection) {
	player_card_i = 0;
	
	player_deal_card_inst = instance_position(mouse_x,mouse_y,obj_card);
	
	if (player_deal_card_inst!=noone) {
		if (player_deal_card_inst.card_holder == ch_player) {
			player_deal_card_inst.target_y = 600;
				
			if (mouse_check_button_pressed(mb_left)) {
				if !audio_is_playing(sd_whoosh){
					audio_play_sound(sd_whoosh,1,false);
				}
				player_deal_card_inst.card_holder = ch_deal;
				player_deal_card_inst.target_x = 400;
				player_deal_card_inst.target_y = 530;
					
				if (!waiting_for_alarm) {
					game_state = -4;
					alarm[2] = 1 * room_speed;
				} 
			}
		}
	}
	
	else {
		for (i=0;i<num_player_card;i++) {
			if (player_cards[|i].card_holder==ch_player) {
				player_cards[|i].target_y=650;
			}
		}
	}		
}

if (game_state == state_selection_ai) {
	ai_index = random_range(0,2);
	ai_cards[|ai_index].card_holder = ch_deal;
	global.ai_specific_card = ai_cards[|ai_index].card_holder
	ai_cards[|ai_index].target_x = 400;
	
	if !audio_is_playing(sd_whoosh){
		audio_play_sound(sd_whoosh,1,false);
	}
	
	ai_cards[|ai_index].target_y = 415;

	waiting_for_alarm = true;
	
	if (waiting_for_alarm) {
		game_state = -4;
		alarm[3] = 0.25 * room_speed;
	}
}

if(game_state == state_candle){
	if position_meeting(mouse_x,mouse_y,obj_candle) and (mouse_check_button_pressed(mb_left)){
		global.candle_extinguished = true;
		show_debug_message("candle pressed");
		game_state = state_compare;
	}
	else if (keyboard_check_pressed(vk_space)){
		//move onto next thing
		//show_debug_message("moving onto next stage");
		game_state = state_faceup_ai_selection;
	}
}

if (game_state == state_faceup_ai_selection) {
	ai_cards[|ai_index].facedown = false;
	
	//if(!global.candle_picked_up){
	//	global.candle_use = true;}
	
	//else{
	
	if (ai_cards[|ai_index].card_type == card_rock) {AI_card_selected = 0;}
	
	if (ai_cards[|ai_index].card_type == card_paper) {AI_card_selected = 1;}
	
	if (ai_cards[|ai_index].card_type == card_scissor) {AI_card_selected = 2;}
	//waiting_for_alarm = true;
//}
	
	waiting_for_alarm = true;
	
	if (waiting_for_alarm) {
		game_state = -4;
		alarm[6] = 1 * room_speed;
	}
	
}

if (game_state == state_compare) {
	discard_card_i = 6;	
	i = 0;
	j = 0;
	k = 0;
	//show_debug_message(global.candle_was_used); shows as true 2nd round
	//show_debug_message(obj_candle.change_ai_sprite);
	//false both round 1 and 2
	
	//if candle used, player/ai score += 0 
	if(global.candle_was_used){
		show_debug_message("aiya");
		global.player_score +=0;
		global.ai_score +=0;
		game_state = state_discard; 
		global.candle_was_used = false;
	}
	
	else if (!global.candle_was_used){ //if candle was not used
	
		if (player_deal_card_inst.card_type == card_rock) {
			if (AI_card_selected == 2) {
				global.player_score += 1;
				if !audio_is_playing(sd_win){
					audio_play_sound(sd_win,1,false);
				}
			}
		
			else if (AI_card_selected == 1) {
				global.ai_score += 1;
				if !audio_is_playing(sd_fail){
					audio_play_sound(sd_fail,1,false);
				}
			}
		}
	
		else if (player_deal_card_inst.card_type==card_paper) {
		
			if (AI_card_selected == 0) {
				global.player_score +=1;
				if !audio_is_playing(sd_win){
					audio_play_sound(sd_win,1,false);
				}
			}
		
			else if (AI_card_selected == 2) {
				global.ai_score +=1;
				if !audio_is_playing(sd_fail){
					audio_play_sound(sd_fail,1,false);
				}

			}
		}
	
		else if (player_deal_card_inst.card_type==card_scissor) {
		
			if (AI_card_selected == 1) {
				global.player_score +=1;
				if !audio_is_playing(sd_win){
					audio_play_sound(sd_win,1,false);
				}
			}
		
			else if (AI_card_selected == 0) {
				global.ai_score +=1;
				if !audio_is_playing(sd_fail){
					audio_play_sound(sd_fail,1,false);
				}
			}
		}
		game_state = state_discard;
	} 
}

else if(game_state == state_discard){
	player_deal_card_inst = obj_card;
	
	if (i < num_player_card) {
		ds_list_add(discard_list,player_cards[|i]);
		i++;
		k++;
	}
	
	
	if (j < num_ai_card) {
		ds_list_add(discard_list,ai_cards[|j]);	
		j++;
		k++;
	}
	timer = 60;
	
	if (k == 6) {
		ds_list_clear(player_cards);
		ds_list_clear(ai_cards);
		
		for (l = 5; l>=0;l--)  {
			if (ds_list_size(discard_list) < 24 and timer == 60) {
				discard_list[|l - 1].target_x = 650;
				discard_list[|l - 1].target_y = card_y - l*2;
				discard_list[|l - 1].facedown = false;
				discard_list[|l - 1].card_holder = ch_ai;
				discard_list[|l - 1].depth = - l;

				timer = 0;
			}
		}
			///
			for (i = 0; i < ds_list_size(discard_list); i++) {
		
				discard_list[|i].target_x = 650
				discard_list[|i].target_y = card_y - i*2;
				discard_list[|i].facedown = false;
				discard_list[|i].depth = -i;
			
			}
			///
		if (game_state == 8){
			game_state = state_ai_deal;
		}
		if (l == 0) {
			if (num_cards > 0) {
				game_state = state_ai_deal;
				waiting_for_alarm = true;
			}		
			}
		}
	}

