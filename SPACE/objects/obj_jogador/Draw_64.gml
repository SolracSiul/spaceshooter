/// @description Inserir descrição aqui

// Você pode escrever seu código neste editor
//var _gui_height = display_get_gui_height()

//draw_text(20,_gui_height -40,"srk")


//draw_sprite(life_spr_1,0,20,display_get_gui_height() - 40)
var _my_spr= life_spr1_1

var _my_height = display_get_gui_height() - 40;
// se quiser mudar a cor da srpite,
// usar um draw_sprite_ext();
// pra usar drawSprite precisa instanciar uma variável; 
draw_sprite_ext(_my_spr, 1,20, _my_height, 1,1,0, c_white,0.5) 
draw_sprite_ext(_my_spr, 1,45, _my_height, 1,1,0, c_white,0.5) 
draw_sprite_ext(_my_spr, 1,70, _my_height, 1,1,0, c_white,0.5) 