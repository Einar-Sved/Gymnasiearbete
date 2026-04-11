extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED } #en lista med alla olika färger på nycklarna
@export var color : KeyColor # kan välja färg i granskaren och behöver inte hålla på i koden lika mycket

func _ready():
	#body_entered.connect(_on_body_entered) 
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.add_key(color)
		queue_free() # tar bort nyckeln från kartan
