extends Node

signal hover_changed(hover_state)

func _ready():
	pass

func _process(_delta):
	pass

func _on_mouse_entered():
	emit_signal("hover_changed", true)

func _on_mouse_exited():
	emit_signal("hover_changed", false)
