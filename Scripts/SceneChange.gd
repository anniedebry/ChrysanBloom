extends Node

@export var current_scene: String = ""
@export var scene_change_to: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if current_scene == "DahliaRoom":
		$Dahlia.position = Global.player_positions.get(current_scene, Vector2(0, 0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()

func _on_dahlia_room_entrance_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true
		

func _on_dahlia_room_entrance_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == current_scene:
			get_tree().change_scene_to_file(scene_change_to)
			Global.game_first_loadin = false
			Global.finish_changescenes()


