extends Sprite



func _ready():
	var texSusan = preload("res://SharedAssets/susanHD.png")
	var texJames = preload("res://SharedAssets/jamesHD.png")
	var global = get_node("/root/Global")
	if global.currentVictim == "Susan":
		self.texture = texSusan
	elif global.currentVictim == "James":
		self.texture = texJames
