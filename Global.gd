extends Node

var steam_id: int = 0
var steam_username: String = ""

func _init():
	OS.set_environment("SteamAPPID", str(480))
	OS.set_environment("SteamGameID", str(480))
	
func _ready():
	Steam.steamInit()
	
	steam_id = Steam.getSteamID()
	steam_username = Steam.getPersonaName()
	
func _process(delta):
	Steam.run_callbacks()
