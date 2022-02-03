extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var global = get_node("/root/Global")
	if (global.success):
		self.text = "Success"
		set("custom_colors/font_color", Color(0,0.5,0))
	else:
		self.text = "Fail"
		set("custom_colors/font_color", Color(1,0,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
