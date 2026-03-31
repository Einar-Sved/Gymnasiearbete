extends Node2D

const SAVE_PATH = "user://gravityplatformer_savefile.data"

@onready var time_label:Label = $CanvasLayer2/Time
@onready var highscore_label: Label = $CanvasLayer2/Best_Time

var level_completed: bool = false
var is_victorious = false
var total_plates = 4
var time: float = 0.0
var highscores: Dictionary = {}

func show_victory():
	if is_victorious: return # Hindra att den körs flera gånger
	is_victorious = true
	level_completed = true
	print("test")
	$CanvasLayer3/VictoryScreen.visible = true
	if name in highscores:
		#Ett befintligt highscore finns
		if time < highscores[name]:
			_save_highscore(name)
	else:
		#Om den inte finns i highscores är det första gången leveln klaras -> highscore
		_save_highscore(name)



func check_all_plates():
	var plates = get_tree().get_nodes_in_group("plates")
	print("plates found:", plates.size())

	for p in plates:
		print(p.name, p)
		print(p.name, "activated:", p.activated)
		if not "activated" in p:
			continue

		if not p.activated:
			return

	show_victory()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasModulate.visible = true
	_get_highscores()
	if name in highscores:
		var time_string = _from_seconds_to_time(highscores[name])
		highscore_label.text = "Best: " + time_string
	else:
		highscore_label.text = ""



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not level_completed:
		time += delta
		
		var time_string = _from_seconds_to_time(time)
		
		time_label.text = "Time: " + time_string

func _get_highscores() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		highscores = file.get_var() #Hämtar den sparade variabeln
		file.close()


func _save_highscore(level_name: String) -> void:
	highscores[level_name] = time #Ändrar på värdet om det finns eller lägger till om det inte finns
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) #Finns ej filen skapas den automatiskt
	file.store_var(highscores)
	file.close()



func _from_seconds_to_time(seconds: float) -> String:
	var min = int(seconds / 60)
	var sec = int(seconds - min*60)
	return "%02d:%02d" % [min, sec]
