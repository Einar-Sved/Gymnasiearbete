
extends Area2D


@export var ui_panel: Control

func _ready() -> void:
	if ui_panel:
		ui_panel.hide() 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if ui_panel:
			ui_panel.show()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if ui_panel:
			ui_panel.hide()
