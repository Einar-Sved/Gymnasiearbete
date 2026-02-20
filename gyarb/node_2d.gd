extends Node2D

var total_plates = 4

func show_victory():
	print("test")
	$CanvasLayer3/VictoryScreen.visible = true


func check_all_plates():
	var plates = get_tree().get_nodes_in_group("plates")
	for p in plates:
		if not p.activated:
			return
	show_victory()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	print(self.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
