extends Sprite2D

var move_timer : float = 0.0
var move_interval : float = 5.0
var move_duration : float = 0.79899
var move_distance : int = 2
var original_position : Vector2
var animation_started : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Save the original position for later reset
	original_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the timer
	move_timer += delta
	
	if animation_started == false:
		position.x += move_distance
		position.y -= move_distance
	
	# Check if it's time to move
	if move_timer >= move_interval:
		# Move the sprite
		position.x += move_distance
		position.y -= move_distance  # Move up (negative Y direction)

	# Check if it's time to repeat the animation
	if move_timer >= move_duration:
		# Reset the sprite's position after 10 seconds
		position = original_position
		move_timer -= move_duration  # Adjust the timer to prevent immediate reset
