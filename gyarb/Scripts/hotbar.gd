extends Control

@export var yellow_key : Texture2D #skapar utrymme i granskaren att lägga in bilder
@export var green_key  : Texture2D
@export var blue_key   : Texture2D
@export var red_key    : Texture2D

@onready var hbox = $HBoxContainer

func update(keys: Array) -> void:
	for slot in hbox.get_children():#går igenom varje ruta
		if slot is Button:
			slot.icon = null #nollställer hotbaren

	for i in range(keys.size()): #en loop som körs så många gånger som du har nycklar
		if i >= hbox.get_child_count(): 
			break#om du har mer nycklar än rutor förstörs loopen
		var slot = hbox.get_child(i) #hämtar specifika rutan
		var tex: Texture2D = null #skapar en tom bild för bilden som ska visas
		match keys[i]:
			0: tex = yellow_key#om numret är noll så använd gul nuckel
			1: tex = green_key#osv
			2: tex = blue_key
			3: tex = red_key
		if slot is Button and tex != null:#om rutan är en knapp och en bid finns
			slot.icon = tex #så skapas bilden



"""func set_slot_texture(slot, tex: Texture2D) -> void:#ai sa att denna var bra att ha med men jag tror den är värdelös
	if slot is TextureButton: #kollar om det är en texturebutton
		slot.texture_normal = tex #så sätter den rätt bild
	elif slot is TextureRect:
		slot.texture = tex"""









# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
