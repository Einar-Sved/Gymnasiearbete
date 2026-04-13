extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #möjliga färger
@export var color : KeyColor #välja nyckel i granskaren

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"): #kollar om spelaren är i gruppen player
		body.add_key(color) #spelaren får nyckeln
		queue_free() # tar bort nyckeln från kartan
