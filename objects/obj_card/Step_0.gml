
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
