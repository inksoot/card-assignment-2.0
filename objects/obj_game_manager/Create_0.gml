
randomize(); //randomize diff every time

cards = ds_list_create();
ai_cards = ds_list_create();
player_cards = ds_list_create();
discard_list = ds_list_create();


///CURRENT IDEA 3 rounds
//can burn 1 card, negating a round, but you don’t know the opponent’s card
///


//scoring
global.player_score = 0;
global.ai_score = 0;

waiting_for_alarm = false;

type_amt = 3;
num_cards = type_amt*8; //24 cards total, 8 of each type

state_initial_deal = 0;
state_ai_deal = 1;
state_player_deal = 1.5;

state_selection =2;
state_selection_ai =3;
state_compare = 4;
state_faceup_ai_selection = 5
state_discard = 8;
 
ch_player = 11;
ch_ai = 12;
ch_deal = 13;

card_rock = 0;
card_paper = 1;
card_scissor =2;

timer = 0;

ai_card_i = 0;
player_card_i = 0;
discard_card_i = 6;

global.ai_specific_card = 0; //initialization for specific ai id

game_state = state_initial_deal;

ai_index = -1;
player_deal_card_inst = obj_card;

num_player_card = 3;


card_x = 100;
card_y = room_height/2;


for(i = 0; i<num_cards;i++) {
card_inst = instance_create_layer(card_x,card_y,"Instances",obj_card);
card_inst.card_type = i % type_amt;
ds_list_add(cards,card_inst);
}


AI_card_selected = 100



