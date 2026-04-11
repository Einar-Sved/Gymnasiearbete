extends Area2D
var redan_använd = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../CanvasLayer/CenterContainer/Panel".visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if not redan_använd:
		$"../CanvasLayer/CenterContainer/Panel".visible=true



func _on_body_exited(body: Node2D) -> void:
	$"../CanvasLayer/CenterContainer/Panel".visible=false



func _on_light_pressed() -> void:
	GameSettings.visibility =9
	redan_använd = true
	$"../CanvasLayer/CenterContainer/Panel".visible=false


func _on_speed_pressed() -> void:
	GameSettings.speed = 150
	redan_använd = true
	$"../CanvasLayer/CenterContainer/Panel".visible=false
