extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED }
@export var required_color : KeyColor

var player_inside = null
var activated = false

func _ready():
	activated = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_inside and not activated:
		if Input.is_action_just_pressed("interact"):
			try_activate()

func check_victory():
	get_tree().get_first_node_in_group("main").check_all_plates()


func _on_body_entered(body):
	print("testja")
	if body.is_in_group("player"):
		player_inside = body

func _on_body_exited(body):
	if body == player_inside:
		player_inside = null

func try_activate():
	if player_inside.has_key(required_color):
		player_inside.remove_key(required_color)
		activated = true
		make_white()
		check_victory()

func make_white():
	$Sprite2D.modulate = Color.WHITE
