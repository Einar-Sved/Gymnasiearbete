extends Area2D

enum KeyColor { YELLOW, GREEN, BLUE, RED }
@export var color : KeyColor

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.add_key(color)
		queue_free() # tar bort nyckeln från kartan
