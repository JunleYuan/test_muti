extends Node

var app_id: String = "480"
var game_id: String = "480"

var steam_id: int = 0
var steam_username: String = ""

func _init():
	OS.set_environment("SteamAPPID", app_id)
	OS.set_environment("SteamGameID", game_id)
	
func _ready():
	Steam.steamInit()
	
	if !Steam.isSteamRunning():
		print("start steam dum dum")
		get_tree().quit()
		return
	
	steam_id = Steam.getSteamID()
	steam_username = Steam.getPersonaName()
	
func _process(delta):
	Steam.run_callbacks()
