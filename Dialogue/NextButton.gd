extends Button


var TwoOptions = preload("res://Dialogue/TwoOptions.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NextButton_pressed():
	var scamDialogue = get_node("/root/ScamDialogue")
	scamDialogue.loadDialogue()
