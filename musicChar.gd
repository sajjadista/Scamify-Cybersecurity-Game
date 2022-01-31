extends TextureButton


func _pressed():
	print("I got pressed 1")
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))

