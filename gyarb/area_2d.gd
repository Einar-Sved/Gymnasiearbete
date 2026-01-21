"""extends Area2D
$"../CanvasLayer/Panel"
@export var ui_panel: Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Panel:", get_node_or_null("../CanvasLayer/Panel"))
	print("area2d ready")
	get_node("../CanvasLayer/Panel").visible = false
	ui_panel.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass








func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_node("../CanvasLayer/Panel").visible = true
		print("bababa")
		ui_panel.visible = true
"""
extends Area2D


@export var ui_panel: Control

func _ready() -> void:
	if ui_panel:
		ui_panel.hide() 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if ui_panel:
			ui_panel.show()
			print("visa")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if ui_panel:
			ui_panel.hide()
			print("dölj")
