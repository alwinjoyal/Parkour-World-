extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var jumbsound: AudioStreamPlayer = $jumbsound
@onready var deathsound: AudioStreamPlayer = $deathsound

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start_position = Vector2(40,480)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumbsound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		#flip if moving left
		if direction < 0.1:
			animation.flip_h = true
		else:
			animation.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	if is_on_floor():
		if abs(velocity.x) > 0.1: 
			animation.play("run")
		else:
			animation.play("idle")
	else:
		animation.play("jumb")
		
		
	# handle respawn
	if position.y > 900:
	
	#respawn
		respawn()
		
		
		
func respawn():
	deathsound.play() 
	position = start_position


func _on_game_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
