extends Node

var arena_selected : bool
var arena : Node2D

var pos_1
var pos_2
var central_pos 

func _arena_selected():

	if arena_selected:

		add_child(arena)

		pos_1 = arena.get_node("player_1_pos")
		pos_2 = arena.get_node("player_2_pos")