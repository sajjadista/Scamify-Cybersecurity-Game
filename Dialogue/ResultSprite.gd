extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var global = get_node("/root/Global")
	if global.currentVictim == "Susan":
		var tex = preload("res://SharedAssets/susanHD.png")
		self.texture = tex
	else:
		var tex = preload("res://SharedAssets/jamesHD.png")
		self.texture = tex


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
