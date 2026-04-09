extends CharacterBody2D


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var keys: Array = []
func add_key(color):
	if color not in keys:
		keys.append(color)
		update_hotbar()

func update_hotbar():
	var hotbar = get_tree().get_first_node_in_group("hotbar")
	if hotbar:
		hotbar.update(keys)
	else:
		push_warning("Hotbar hittades inte")

func has_key(color) -> bool:
	return color in keys

func remove_key(color) -> void:
	if color in keys:
		keys.erase(color)
		update_hotbar()




var direction : Vector2 = Vector2.ZERO



func read_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.y -=2
		direction = Vector2(0,-1)
		
	if Input.is_action_pressed("down"):
		velocity.y +=2
		direction = Vector2(0,1)
	if Input.is_action_pressed("left"):
		velocity.x -=2
		direction = Vector2(-1,0)
	if Input.is_action_pressed("right"):
		velocity.x +=2
		direction = Vector2(1,0)
		
	velocity = velocity.normalized()*GameSettings.speed
	move_and_slide()

func update_animation():
	if velocity != Vector2.ZERO:
		if direction == Vector2(0, -1):
			anim.play("walk_up")
		elif direction == Vector2(0, 1):
			anim.play("walk_down")
		elif direction == Vector2(-1, 0):
			anim.play("walk_left")
		elif direction == Vector2(1, 0):
			anim.play("walk_right")
	else:
		if direction == Vector2(0, -1):
			anim.play("idle_up")
		elif direction == Vector2(0, 1):
			anim.play("idle_down")
		elif direction == Vector2(-1, 0):
			anim.play("idle_left")
		elif direction == Vector2(1, 0):
			anim.play("idle_right")


func _physics_process(delta: float) -> void:
	read_input()
	update_animation()






func _ready():
	add_to_group("player")
	
