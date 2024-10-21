extends Node

var child_scan : bool

var pos_1 : Marker2D
var pos_2 : Marker2D

var player_1
var player_2 

@onready var arena_auto = get_node("/root/ArenaManagement")

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

func _process(delta):
	view_direction_player()

func view_direction_player():
	
	if child_scan:

		if player_1.position.x > player_2.position.x:
			player_2.rotation_degrees = 0
			player_2.scale.y = abs(player_2.scale.y)
			player_1.rotation_degrees = 180
			player_1.scale.y = -abs(player_1.scale.y)

		else:
			player_1.rotation_degrees = 0
			player_1.scale.y = abs(player_1.scale.y)
			player_2.rotation_degrees = 180
			player_2.scale.y = -abs(player_2.scale.y)

func depuring():
	if player_1:
		print("player_1 encontrado")

	else:
		print("player_1 no fue encontrado")

	if player_2:
		print("player_2 encontrado")
	else:
		print("player_2 no fue encontrado")
