extends TextureButton


func _pressed():
	get_tree().change_scene(Global.prevscene)
