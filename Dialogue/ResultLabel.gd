extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_path())
	set("custom_colors/font_color", Color(0,0,0))
	var global = get_node("/root/Global")
	self.text = global.result

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
