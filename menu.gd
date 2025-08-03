extends Node2D

@onready var lobby_id = $LobbyID
@onready var steam_name = $Name
@onready var steam_id = $ID

func _read():
	pass
	
func _process(delta):
	pass

func _on_host_butt_pressed() -> void:
	Network.create_lobby()

func _on_join_butt_pressed() -> void:
	var id: int = int(lobby_id.text)
	Network.join_lobby(id)

func _on_name_text_changed(new_text: String) -> void:
	Global.steam_username = steam_name.text

func _on_id_text_changed(new_text: String) -> void:
	Global.steam_id = steam_id.text
