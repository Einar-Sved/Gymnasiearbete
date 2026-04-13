extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #de 4 olika färgerna man kn välja mellan
@export var required_color : KeyColor #man kan välja färg i granskaren istället för i koden

var player_inside = null #en variabel som kollar vad som är i arean
var activated = false# den kollar om den redan har blivit activerad eller  inte

func _ready():
	body_entered.connect(_on_body_entered)#när någon går in
	body_exited.connect(_on_body_exited)#när någon går ut

func _process(delta):
	if player_inside and not activated: #kollar om spelaren är inne och om den redan blivit aktiverad
		if Input.is_action_just_pressed("interact"): #om e trycks så aktiveras funktionen nedanför
			try_activate()

func check_victory():
	get_tree().get_first_node_in_group("main").check_all_plates()#check_all_plates ligger i scripten för main noden så den tar första noden i gruppen main och det är noden som innehåller den funktionen


func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om det som går in i arean är spelaren eller inte, funngerar lite som ett lås
		player_inside = body #player inside ändras till det somm är i arean

func _on_body_exited(body):
	if body == player_inside:# om kroppen som lämnar arean är kroppen i arean
		player_inside = null#då är inget i arean

func try_activate():
	if player_inside.has_key(required_color): # kollar om spelaren har nyckeln man valt
		player_inside.remove_key(required_color)#tar bort nyckeln från spelaren
		activated = true #nu har den i koden blivit aktiverad
		make_white() 
		check_victory()

func make_white():
	$Sprite2D.modulate = Color.WHITE #gör den vit
