extends Node

var current_scene = "DahliaRoom"
var transition_scene = false
var game_first_loadin = true

# Dictionary to store positions for different scenes
var player_positions = {
	"DahliaRoom": Vector2(104.5, 45),
	"DahliaHouseMainArea": Vector2(0.5, -31),
}

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "DahliaRoom":
			current_scene = "DahliaHouseMainArea"
		else:
			current_scene = "DahliaRoom"
