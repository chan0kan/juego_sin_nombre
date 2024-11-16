extends Node

var child_scan : bool

var pos_1 : Marker2D
var pos_2 : Marker2D

var midpoint_players : Vector2

var player_1
var player_2 

@onready var arena_auto = get_node("/root/ArenaManagement")

func _process(_delta):
	view_direction_player()
	mid_point_players()
	on_player_life_points_reach_zero()

func ready_players():

	if child_scan:

		print("scan enabled")

		player_1 = self.get_child(0)
		player_2 = self.get_child(1)

		depuring()

		player_1.show()
		player_2.show()

		player_1.position = arena_auto.pos_1.position
		player_2.position = arena_auto.pos_2.position

		player_1.player_ident.text = player_1.player_control
		player_2.player_ident.text = player_2.player_control

func view_direction_player():
	
	if child_scan:

		if player_1.position.x > player_2.position.x:

			player_2.rotation_degrees = 0
			player_2.scale.y = abs(player_2.scale.y)
			player_1.rotation_degrees = 180
			player_1.scale.y = -abs(player_1.scale.y)
			player_1.player_view_direction = player_1.STATE.LEFT
			player_2.player_view_direction = player_2.STATE.RIGHT

		else:
			
			player_1.rotation_degrees = 0
			player_1.scale.y = abs(player_1.scale.y)
			player_2.rotation_degrees = 180
			player_2.scale.y = -abs(player_2.scale.y)
			player_1.player_view_direction = player_1.STATE.RIGHT
			player_2.player_view_direction = player_2.STATE.LEFT

func depuring():
	if player_1:
		print("player_1 encontrado")

	else:
		print("player_1 no fue encontrado")

	if player_2:
		print("player_2 encontrado")
	else:
		print("player_2 no fue encontrado")

func on_player_life_points_reach_zero():

	if child_scan:
		if player_1.life_points == 0:
			print("Player 1 perdio vida")
			player_1.queue_free()

		elif player_2.life_points == 0:
			print("Player 1 perdio vida")
			player_1.queue_free()
		

func mid_point_players():

	if child_scan:
		
		midpoint_players = Vector2((player_1.position.x + player_2.position.x) / 2 , (player_1.position.y + player_2.position.y) / 2)
		print(midpoint_players)
