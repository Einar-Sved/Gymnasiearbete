extends CharacterBody2D


var direction : Vector2 = Vector2.ZERO



func read_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.y -=1
		direction = Vector2(0,-1)
		
	if Input.is_action_pressed("down"):
		velocity.y +=1
		direction = Vector2(0,1)
	if Input.is_action_pressed("left"):
		velocity.x -=1
		direction = Vector2(-1,0)
	if Input.is_action_pressed("right"):
		velocity.x +=1
		direction = Vector2(1,0)
		
	velocity = velocity.normalized()*150
	move_and_slide()



func _physics_process(delta: float) -> void:
	read_input()
