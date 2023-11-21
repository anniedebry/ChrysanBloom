extends Sprite2D

# backgourd re-positions itself based off the amount of pixels it has moved, slightly choppy because the sprite isn't completely even

var move_timer : float = 0.0
var pixels_moved : int = 0
var move_interval : float = 2.0
#var move_duration : float = 0.79899
var pixels_to_move : int = 113
var move_distance : int = 1
var original_position : Vector2
var animation_started : bool = false

#28 pixels

# Called when the node enters the scene tree for the first time.
func _ready():
	# Save the original position for later reset
	original_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if animation_started == false:
		position.x += move_distance
		position.y -= move_distance
		pixels_moved += 1
	
	# Check if it's time to move
	if move_timer >= move_interval:
		# Move the sprite
		position.x += move_distance
		position.y -= move_distance  # Move up (negative Y direction)
		pixels_moved += 1

	# Check if it's time to repeat the animation
	if pixels_to_move <= pixels_moved:
		# Reset the sprite's position after 10 seconds
		position = original_position
		pixels_moved = 0
		
		
