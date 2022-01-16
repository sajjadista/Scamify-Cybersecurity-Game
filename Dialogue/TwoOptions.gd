extends Node2D

var option1Next = 0
var option2Next = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func loadOptions(var options):
	var buttonlabel1 = $Button1/Label
	buttonlabel1.text = options[0]["text"]
	option1Next = options[0]["next"]
	
	var buttonlabel2 = $Button2/Label
	buttonlabel2.text = options[1]["text"]
	option2Next = options[1]["next"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1_pressed():
	var scamDialogue = get_node("/root/ScamDialogue")
	scamDialogue.setSpeechCounter(option1Next)
	scamDialogue.loadDialogue()


func _on_Button2_pressed():
	var scamDialogue = get_node("/root/ScamDialogue")
	scamDialogue.setSpeechCounter(option2Next)
	scamDialogue.loadDialogue()
