extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0
var JUMP_VELOCITY = -600.0

const GRAVITY = 30

var atack = false
var move = false

func _ready():
	pass
	

func _process(delta):
	
	velocity.y += GRAVITY
		
	if Input.is_key_pressed(KEY_D):
		move = true
		animated_sprite.play("walk(adelante)")
		velocity.x = delta + SPEED
		
	elif Input.is_key_pressed(KEY_A):
		move = true
		animated_sprite.play("walk(atras)")
		velocity.x = delta - SPEED

	elif Input.is_action_just_pressed("atack"):
		
		atack = true
		animated_sprite.play("atack")
	
	elif move == false and atack == false:

		velocity.x = 0
			
		animated_sprite.play("quiet")
		
	if is_on_floor():
			
		if Input.is_key_pressed(KEY_W):
				
				velocity.y = JUMP_VELOCITY
				
	move_and_slide()
	

func _on_timer_timeout():

	atack = false
	move = false
	print("atack false")
	
	pass
