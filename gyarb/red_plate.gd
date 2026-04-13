extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED }#dom olika färgerna man kan välja
@export var required_color : KeyColor#man kan ändra i granskaren

var player_inside = null #ingen är i arean från början
var activated = false #den är inte aktiverad

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_inside and not activated: #om spelaren är i arean och den inte blivit aktiverad
		if Input.is_action_just_pressed("interact"): #om man trycker e
			try_activate()

func check_victory():
	get_tree().get_first_node_in_group("main").check_all_plates() #tar sceträdet och sen tar man första noden i gruppen main som innehåller funktionen check all plates


func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om det som gick in är spelaren
		player_inside = body #player inside är inte tom något mer

func _on_body_exited(body):
	if body == player_inside: #om spelaren som lämner är den som är i arean
		player_inside = null #så är den inte där inne nåt mer

func try_activate():
	if player_inside.has_key(required_color): #kollar om spelaren har nyckeln man valt
		player_inside.remove_key(required_color) #man tar bort nyckeln man valt
		activated = true#nu är den aktiverad
		make_white()
		check_victory()

func make_white():
	$Sprite2D.modulate = Color.WHITE
