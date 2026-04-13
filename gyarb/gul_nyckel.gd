extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #vilka nycklar man kan välja
@export var color : KeyColor #man väljer i granskaren

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om spelaren är i gruppen player
		body.add_key(color)#lägger till nyckeln hos spelaren
		queue_free() # tar bort nyckeln från kartan
