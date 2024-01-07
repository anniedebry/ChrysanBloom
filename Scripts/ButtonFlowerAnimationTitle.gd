extends Node

var _active = false

func _on_button_mouse_entered():
	_active = true


func _on_button_mouse_exited():
	_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
