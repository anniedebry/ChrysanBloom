extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()


func _on_dahlia_room_enter_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


func _on_dahlia_room_enter_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
		
func change_scenes():
	if Global.transition_scene == true:
		if Global.current_scene == "DahliaHouseMainArea":
			get_tree().change_scene_to_file("res://Scenes/DahliaRoom.tscn")
			Global.finish_changescenes()
