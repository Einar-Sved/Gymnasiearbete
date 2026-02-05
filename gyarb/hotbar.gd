extends Control

# Koppla nyckelbilder i Inspector
@export var yellow_key : Texture2D
@export var green_key  : Texture2D
@export var blue_key   : Texture2D
@export var red_key    : Texture2D

# Referens till HBoxContainer
@onready var hbox = $HBoxContainer

func update(keys: Array) -> void:
	# Töm alla slots först
	for slot in hbox.get_children():
		if slot is TextureButton:
			slot.texture_normal = null
		elif slot is TextureRect:
			slot.texture = null

	# Fyll i nycklar
	for i in range(keys.size()):
		if i >= hbox.get_child_count():
			break
		var slot = hbox.get_child(i)
		var tex: Texture2D = null
		match keys[i]:
			0: tex = yellow_key
			1: tex = green_key
			2: tex = blue_key
			3: tex = red_key
		# sätt bilden
		if slot is TextureButton:
			slot.texture_normal = tex
		elif slot is TextureRect:
			slot.texture = tex


# Hjälpfunktion
func set_slot_texture(slot, tex: Texture2D) -> void:
	if slot is TextureButton:
		slot.texture_normal = tex
	elif slot is TextureRect:
		slot.texture = tex









# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
