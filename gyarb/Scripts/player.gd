extends CharacterBody2D


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var light =$PointLight2D2
var direction : Vector2 = Vector2.ZERO
var keys: Array = [] #enlista med vilka nycklar jag har
func add_key(color):
	if color not in keys: #kollar om nyckeln som kom redan finns i listan eller inte
		keys.append(color)#färgen8nyckeln läggs till i listan)
		update_hotbar()

func update_hotbar():
	var hotbar = get_tree().get_first_node_in_group("hotbar")# man tar hela nodträdet  och sen tar man första noden ur gruppen  hotbar
	if hotbar:#finns hotbar

		hotbar.update(keys)#anropar en funktion från hotbar scriptet
	else:
		push_warning("Hotbar hittades inte")

func has_key(color) -> bool:
	return color in keys #kollar om den finns i listan

func remove_key(color) -> void:
	if color in keys:#kollar om man har nyckeln
		keys.erase(color)#tar bort den ifrån listan
		update_hotbar()

func update_light():
	light.scale = Vector2(GameSettings.visibility, GameSettings.visibility)#ljuset runt spelaren ändras till gamesettings ljuset 

func read_input():
	velocity = Vector2.ZERO#hastigheten börjar på noll ibörjan av varje frame
	
	if Input.is_action_pressed("up"):#om man trycker på en knapp som i detta fall är w
		velocity.y -=2 #hastigheten ändras
		direction = Vector2(0,-1)#ändrar vart man kollar
		
	if Input.is_action_pressed("down"):
		velocity.y +=2
		direction = Vector2(0,1)
	if Input.is_action_pressed("left"):
		velocity.x -=2
		direction = Vector2(-1,0)
	if Input.is_action_pressed("right"):
		velocity.x +=2
		direction = Vector2(1,0)
		
	velocity = velocity.normalized()*GameSettings.speed #velocity normalized gör så att man åker samma hastighet diagonalt
	move_and_slide() #hanterar väggar och faktiskt flyttar spelaren

func update_animation():
	if velocity != Vector2.ZERO: #om hastigheten inte är noll
		if direction == Vector2(0, -1):#kollar var man är påväg
			anim.play("walk_up")#spelar animation
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
	update_light()






func _ready():
	add_to_group("player")#lägger till spelaren i gruppen player
	
