extends Node2D

@onready var lobby_id = $LobbyID
@onready var steam_Avatar = $Sprite2D
@onready var ms = $MultiplayerSpawner


func _ready():
	Steam.avatar_loaded.connect(_on_loaded_avatar)
	Steam.getPlayerAvatar(3,Global.steam_id)
	
	ms.spawn_function = spawn_level
	
	print("your username: ", Global.steam_username)

func _process(delta):
	pass

func _on_host_butt_pressed() -> void:
	if Network.create_lobby():
		ms.spawn("res://level_test.tscn")

func _on_join_butt_pressed() -> void:
	var id: int = int(lobby_id.text)
	Network.join_lobby(id)
	
func _on_loaded_avatar(user_id: int, avatar_size: int, avatar_buffer: PackedByteArray) -> void:
	print("Avatar for user: %s" % user_id)
	print("Size: %s" % avatar_size)

	# Create the image and texture for loading
	var avatar_image: Image = Image.create_from_data(avatar_size, avatar_size, false, Image.FORMAT_RGBA8, avatar_buffer)

	# Optionally resize the image if it is too large
	if avatar_size > 128:
		avatar_image.resize(128, 128, Image.INTERPOLATE_LANCZOS)

	# Apply the image to a texture
	var avatar_texture: ImageTexture = ImageTexture.create_from_image(avatar_image)

	# Set the texture to a Sprite, TextureRect, etc.
	steam_Avatar.texture = avatar_texture


func _on_lobby_id_text_changed(lobby_id: String) -> void:
	pass # Replace with function body.

func _on_exist_pressed() -> void:
	
	var id: int = int(lobby_id.text)
	print(Steam.getLobbyData(id, "name"))
	
	Steam.activateGameOverlayInviteDialog(Global.steam_id)
	
	
	#Steam.addRequestLobbyListDistanceFilter(Steam.LOBBY_DISTANCE_FILTER_WORLDWIDE)
	#Steam.requestLobbyList()

func spawn_level(data):
	var a = (load(data) as PackedScene).instantiate()
	return a
