extends CharacterBody2D

const SALTO =  -300
const VELOCIDAD = 400

var GRAVITY = 30



func _process(delta):
	
	var GRAVITY = velocity + GRAVITY
	
	if Input.is_key_pressed(KEY_W):
		
		


