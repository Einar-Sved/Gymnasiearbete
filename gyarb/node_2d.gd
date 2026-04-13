extends Node2D

const SAVE_PATH = "user://gravityplatformer_savefile.data" #sparar på datorn

@onready var time_label:Label = $UI/Time
@onready var highscore_label: Label = $UI/Best_Time

var level_completed: bool = false #har spelaren klarat leveln
var is_victorious = false #har victory() redan triggats
var time: float = 0.0 #hur länge man spelat
var highscores: Dictionary = {}

func show_victory():
	if is_victorious: return  #avslutas om man redan vunnit
	is_victorious = true#nu har vi vunnit i spelet
	level_completed = true#nu har vi vunnt
	$"victory scren"/VictoryScreen.visible = true #gör victory screen synlig
	if name in highscores:#kollar om man redan har ett highscore
		if time < highscores[name]:#om nya tiden är bättre
			_save_highscore(name)
	else:
		
		_save_highscore(name)#lägg dit o det inte finns nån



func check_all_plates():
	var plates = get_tree().get_nodes_in_group("plates") #tar alla nodes i gruppen plates
	print("plates found:", plates.size())

	for p in plates: #loopar igenom platorna
		print(p.name, p)
		print(p.name, "activated:", p.activated)
		if not p.activated: #om den inte är aktiverad ska det avslutas
			return

	show_victory()#annars visas victory



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$svart.visible=true
	_get_highscores()
	if name in highscores: #finns det en highscore
		var time_string = _from_seconds_to_time(highscores[name])#gör om från siffror till text
		highscore_label.text = "Best: " + time_string #visar vad som ska stå på skärmen
	else:
		highscore_label.text = "" #visa inget om ingen high score finns



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not level_completed:#räknar så länge spelet fortfarande körs
		time += delta #lägger till tid
		
		var time_string = _from_seconds_to_time(time)#ändrar tiden till text
		
		time_label.text = "Time: " + time_string#vad som ska stå på skärmen

func _get_highscores() -> void:
	if FileAccess.file_exists(SAVE_PATH): #finns sparfilen
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)#öppnar filen för att läsa
		highscores = file.get_var() #Hämtar från filen
		file.close() #stänger filen


func _save_highscore(level_name: String) -> void:
	highscores[level_name] = time #ändrar på värdet om det finns eller lägger till om det inte finns
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) #öppnar filen i skrivläge
	file.store_var(highscores)#den sparar i filen
	file.close()#stänger filen



func _from_seconds_to_time(seconds: float) -> String:
	var min = int(seconds / 60) #räknar ut minuter
	var sec = int(seconds - min*60) #räknar ut sekunder
	return "%02d:%02d" % [min, sec] #gör 2 heltal på 2 siffror
