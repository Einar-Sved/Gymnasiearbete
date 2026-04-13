extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #dom 4 färgerna man kan välja mellan
@export var required_color : KeyColor#gör att man kan ändra den i granskaren

var player_inside = null #inget är i arean just nu 
var activated = false #den är inte aktiverad

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_inside and not activated: #om spelaren är i arean och inte aktiverad
		if Input.is_action_just_pressed("interact"): #om e trycks
			try_activate()

func check_victory():
	get_tree().get_first_node_in_group("main").check_all_plates()#tar nod trädet och tar sen första noden i gruppen main som har check all plates funktionen


func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om det som gick in är spelaren
		player_inside = body#nu är spelaren i arean

func _on_body_exited(body):
	if body == player_inside: #om spelaren är i arean
		player_inside = null #så gills den nu som borta

func try_activate():
	if player_inside.has_key(required_color): #om spelaren har nyckeln man valt
		player_inside.remove_key(required_color) #tar bort nycklen från spelaren man valt
		activated = true 
		make_white()
		check_victory()

func make_white():
	$Sprite2D.modulate = Color.WHITE
