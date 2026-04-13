extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #dom färgerna man kan välja mellan
@export var color : KeyColor #man väljer i granskaren

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om kroppen är en spelare
		body.add_key(color) #man får nyckeln
		queue_free() # tar bort nyckeln från kartan
