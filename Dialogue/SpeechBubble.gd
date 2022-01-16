extends Node

var speechCounter = 0

func setSpeechCounter(i):
	speechCounter = i

var TwoOptions = preload("res://Dialogue/TwoOptions.tscn")
var NextButton = preload("res://Dialogue/NextButton.tscn")
var currentNode = NextButton.instance()
var nextFinish = false

var speakerDirection = "Left"
func changeDirection():
	if speakerDirection == "Left":
		get_node( "HBoxContainer/LeftSpeaking" ).set_flip_h( false )
		speakerDirection = "Right"
	elif speakerDirection == "Right":
		get_node( "HBoxContainer/LeftSpeaking" ).set_flip_h( true )
		speakerDirection = "Left"

var dialogue = {
	0 : {
		"text" : "Hi, Mrs. Susan I found you on your linked in account. I am a project manager. We are hiring a team. You can work from home. Your daily salary is RM200 and more. If u have the intention to work for us please kindly reply this message.",
		"speaking" : "scammer",
		"next" : 1
	},
	1 : {
		"text" : "Yes, I’m interested, do I need to send my CV to you?",
		"speaking" : "susan",
		"next" : 2
	},
	2 : {
		"text" : "Yes please, send to this email james@gmail.com",
		"speaking" : "scammer",
		"next" : 3
	},
	3 : {
		"text" : "When can I start to work?",
		"speaking" : "susan",
		"next" : 4
	},
	4 : {
		"text" : "I will contact you again, but before that we need to verified your identity as to register you as a legal employee in our company, so can you provide the snapshot of both sides of your ID card, name, address and bank account.",
		"speaking" : "scammer",
		"next" : 5
	},
	5 : {
		"text" : "Alright, what is the company name?",
		"speaking" : "susan",
		"options" : [
			{
				"text": "The company’s name is Software Production Sdn. Bhd. And the customer service number is 03-XXXXXXXX",
				"next": 6
			},
			{
				"text": "The company’s name is Google Sdn. Bhd. And the customer service number is 03-XXXXXXXX",
				"next": 9
			}
		]
	},
	6 : {
		"text" : "The company’s name is Software Production Sdn. Bhd. And the customer service number is 03-XXXXXXXX",
		"speaking" : "scammer",
		"next" : 7
	},
	7 : {
		"text" : "Alright will send to you in an hour.",
		"speaking" : "susan",
		"next" : 8
	},
	8 : {
		"result" : "success"
	},
	9 : {
		"text" : "The company’s name is Google Sdn. Bhd. And the customer service number is 03-XXXXXXXX",
		"speaking" : "scammer",
		"next" : 10
	},
	10 : {
		"text" : "I don’t think Google is a company registered as Sdn. Bhd. In Malaysia. You are bad at telling lies.",
		"speaking" : "susan",
		"next" : 11
	},
	11 : {
		"result" : "fail"
	}
}


func _ready():
	loadDialogue()

func loadDialogue():
	
	print(speechCounter)
	
	var speechLabel = $HBoxContainer/SpeechLabel
	if dialogue[speechCounter].has("text"):
		speechLabel.text = dialogue[speechCounter]["text"]
	
	changeDirection()
	
	if currentNode != null:
		currentNode.queue_free()
	
	if dialogue[speechCounter].has("options"):
		var twoOptions = TwoOptions.instance()
		add_child(twoOptions)
		currentNode = twoOptions
		twoOptions.loadOptions(dialogue[speechCounter]["options"])
	else:
		var nextButton = NextButton.instance()
		add_child(nextButton)
		currentNode = nextButton
		if dialogue[speechCounter].has("next"):
			speechCounter = dialogue[speechCounter]["next"]
		else:
			var global = get_node("/root/Global")
			if dialogue[speechCounter]["result"] == "success":
				global.result = "Victim: Susan\nResult: Success\nReward: +50 coins, +300XP"
				global.coin = global.coin + 50
			else:
				global.result = "Victim: Susan\nResult: Fail\nReward: +0 coins, +50XP"
			get_tree().change_scene("res://Dialogue/Result.tscn")
			
	
	
