#region
	// nao pode ter var dentro de region 
	//definindo vidas aqui
	velocidade =3 
	
	// delay do tiro
	espera_tiro = 20;
	atirando = false;
	timer = 0;
	
	vida = 3;
	
	level_tiro = 1;
	 
#endregion


var _numero = 3

repeat(3){
	show_message("numero: " + string(_numero))
	_numero++
}
function controla_player(){
	var _up, _down, _right, _left
	// precisa ser W maiusculo
	
	
	_up = keyboard_check(ord("W"))
	_down = keyboard_check(ord("S"));
	_right = keyboard_check(ord("D"));
	_left = keyboard_check(ord("A"));
	
	//checkPressed checa se apertou só uma vez
	if(keyboard_check_pressed(vk_up)){
		level_tiro++
	}
	//aqui voce pode apertar e segurar
	if(keyboard_check(vk_down)){
		level_tiro--
	}
	if(timer > 0){
	show_debug_message("toda vez que ele atira o timer começa a contar e vira 20")
	show_debug_message("toda vez que ele para de atirar o timer dele perde 1 em 1 ate chegar no 0")
	show_debug_message(timer)
	timer--
	}
	
	
	// o codigo acima e abaixo retorna booleano
	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left)
	
	if(_shoot && !atirando && timer <= 0) {
		//agora tiro tem uma instancia
		//atirando tem que ser false pra que eu possa atirar dnv 
		if(level_tiro == 1){
			tiro01()
		}
		if(level_tiro == 2){
			tiro01()
			tiro02()
		}
		if(level_tiro == 3){
			tiro01()
			tiro02()
			tiro03()
		}
		atirando = true;
		//aqui é onde o delay é colocado
		//quanto maior o tempo, maior a demora
		timer = espera_tiro;
	} 
	if (!_shoot) {
        atirando = false;
    }
	if (_up == true){
		y-=velocidade
		show_debug_message("frente")
	}
	if (_down == true){
		y+=velocidade
		show_debug_message("BAIXO")
	}
	if (_left == true){
		x-=velocidade
		show_debug_message("frente")
	}
	if (_right == true){
		x+=velocidade
		show_debug_message("frente")
	}
	
	if(x <= 22) x =22
	//if(x >= 256) x= 256;
	// x = clamp(valorATUAL, limite01-bordaLEFT, limite02-bordaRIGHT);
	
	// pode ser feito assim tambem
	if(x >= room_width - sprite_width/2){
		x = room_width - sprite_width/2
	}
	
	if (y >= room_height - 20) {
    y = room_height -20; 
		show_debug_message("Atingiu o limite inferior");
	}
	if (y <= 20) {
	    y = 20; 
	    show_debug_message("Atingiu o limite superior");
	}
	
}
function tiros(qtd){
	if(qtd== 1){
		var _tiro = instance_create_layer(x, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
	}else if(qtd == 2){
		var _tiro2 = instance_create_layer(x-5, y, "layer_bala", obj_bala)
		_tiro2.speed = 10;
		_tiro2.direction = 90
		
		var _tiro3 = instance_create_layer(x+5, y, "layer_bala", obj_bala)
		_tiro3.speed = 10;
		_tiro3.direction = 90
	}else if (qtd == 3){
	var _tiro1 = instance_create_layer(x-5, y, "layer_bala", obj_bala)
		_tiro1.speed = 10;
		_tiro1.direction = 90
		
		var _tiro2 = instance_create_layer(x, y, "layer_bala", obj_bala)
		_tiro2.speed = 10;
		_tiro2.direction = 90
		
		var _tiro3 = instance_create_layer(x+5, y, "layer_bala", obj_bala)
		_tiro3.speed = 10;
		_tiro3.direction = 90
	}
}

function tiro01(){
		var myPosition = 0
		if(level_tiro == 1){
			 myPosition = 0;
		}else if (level_tiro == 2){
			myPosition = -5
		}
		var _tiro = instance_create_layer(x+myPosition, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
		show_debug_message("atirei 01")
}
function tiro02(){
		var _tiro = instance_create_layer(x+4, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
		show_debug_message("atirei 02")
}
function tiro03(){	
	var _tiro = instance_create_layer(x-4, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
		show_debug_message("atirei 1.3")
	var _tiro2 = instance_create_layer(x, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
		show_debug_message("atirei 2.2")
	var _tiro3 = instance_create_layer(x+4, y, "layer_bala", obj_bala)
		_tiro.speed = 10;
		_tiro.direction = 90
		show_debug_message("atirei 2.3")	
	
}

function ganhar_level(){
	//limitado a tiro máximo
	if(level_tiro <3){
		level_tiro++
	}
}