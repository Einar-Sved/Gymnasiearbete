extends Area2D
var redan_använd = false #om den redan är använd eller inte

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../CanvasLayer/CenterContainer/Panel".visible = false #när spelet börjar ska den vara osynlig
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if not redan_använd: #när spelaren går in i arean så kollar den o man redan valt
		$"../CanvasLayer/CenterContainer/Panel".visible=true #om inte blir den synlig



func _on_body_exited(body: Node2D) -> void:
	$"../CanvasLayer/CenterContainer/Panel".visible=false #när man lämner blir den osynlig igen



func _on_light_pressed() -> void:
	GameSettings.visibility =9 #ändrar hur mycket man ser i gamesettings
	redan_använd = true #nu är den använd
	$"../CanvasLayer/CenterContainer/Panel".visible=false #gör den osynlig


func _on_speed_pressed() -> void:
	GameSettings.speed = 150 #ändrar snabbheten i gamesettings
	redan_använd = true #nu är den använd
	$"../CanvasLayer/CenterContainer/Panel".visible=false #gör den osynlig
