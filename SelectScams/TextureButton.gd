extends TextureButton


# Called when the node enters the scene tree for the first time.

func _pressed():
	Global.prevscene = get_tree().get_current_scene().get_filename()
	get_tree().change_scene("res://Victims/victim.tscn")
	
