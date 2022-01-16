extends YSort


	
func _process(delta):
	
	Global.prevscene = get_tree().get_current_scene().get_filename()

	if Input.is_key_pressed(KEY_ENTER):
		print(Global.prevscene)
		get_tree().change_scene("res://Choice/ShopOrType.tscn")
		
