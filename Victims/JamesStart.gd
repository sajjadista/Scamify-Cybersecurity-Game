extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Put the path to James dialogue
func _on_Start_pressed():
	var global = get_node("/root/Global")
	global.currentVictim = "James"
	get_tree().change_scene("res://Dialogue/ScamDialogue.tscn")
