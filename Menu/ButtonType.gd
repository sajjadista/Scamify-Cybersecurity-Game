extends Button


func _pressed():
	Global.prevscene = get_tree().get_current_scene().get_filename()
	get_tree().change_scene("res://Victims/SelectScam.tscn")
