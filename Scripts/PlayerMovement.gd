extends CharacterBody2D

const max_speed = 300
const accel = 4000
const friction = 100000
var current_dir = "none"
var input = Vector2.ZERO

func player():
	pass

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation(1)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_animation(1)
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_animation(1)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_animation(1)
	else:
		play_animation(0)
		
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()
	
func play_animation(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
		
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_right")
		elif movement == 0:
			anim.play("idle_right")
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_left")
		elif movement == 0:
			anim.play("idle_left")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_down")
		elif movement == 0:
			anim.play("idle_down")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk_up")
		elif movement == 0:
			anim.play("idle_up")
