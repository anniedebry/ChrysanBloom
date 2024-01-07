extends Sprite2D

var current_pos = Vector2(0, 0)
var hover_state = false

func _ready():
	set_visible(false)
	
func _process(delta):
	rotation += 1 * delta
	if hover_state:
		set_visible(true)
	else:
		set_visible(false)

func _on_new_game_button_hover_changed(new_hover_state):
	hover_state = new_hover_state
	current_pos.x = 791
	current_pos.y = 270
	set_position(current_pos)


func _on_load_button_hover_changed(new_hover_state):
	hover_state = new_hover_state
	current_pos.x = 791
	current_pos.y = 404
	set_position(current_pos)


func _on_settings_button_hover_changed(new_hover_state):
	hover_state = new_hover_state
	current_pos.x = 791
	current_pos.y = 529
	set_position(current_pos)
