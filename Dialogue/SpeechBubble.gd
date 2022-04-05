extends Node

var speechCounter = 0

func setSpeechCounter(i):
	speechCounter = i

var TwoOptions = preload("res://Dialogue/TwoOptions.tscn")
var NextButton = preload("res://Dialogue/NextButton.tscn")
var currentNode = NextButton.instance()
var nextFinish = false
var victimName = ""

var speakerDirection = "Left"
func changeDirection():
	if speakerDirection == "Left":
		get_node( "HBoxContainer/LeftSpeaking" ).set_flip_h( false )
		speakerDirection = "Right"
	elif speakerDirection == "Right":
		get_node( "HBoxContainer/LeftSpeaking" ).set_flip_h( true )
		speakerDirection = "Left"

var dialogueSusan = {
	0 : {
		"text" : "Hi, Mrs. Susan I found your linkedin account. I am a project manager. We are hiring a team. You can work from home. Your daily salary is RM200 and more. If u have the intention to work for us please kindly reply this message.",
		"speaking" : "scammer",
		"next" : 1
	},
	1 : {
		"text" : "Yes, I’m interested, do I need to send my CV?",
		"speaking" : "susan",
		"next" : 2
	},
	2 : {
		"text" : "Yes please, send it to this email james@gmail.com",
		"speaking" : "scammer",
		"next" : 3
	},
	3 : {
		"text" : "When can I start to work?",
		"speaking" : "susan",
		"next" : 4
	},
	4 : {
		"text" : "I will contact you again, but before that we need to verify your identity to be able to register you as a legal employee in our company, so can you provide the snapshot of both sides of your ID card, name, address and bank account.",
		"speaking" : "scammer",
		"next" : 5
	},
	5 : {
		"text" : "Alright, what is the company name?",
		"speaking" : "susan",
		"options" : [
			{
				"text": "The company’s name is Software Production Sdn. Bhd.",
				"next": 6
			},
			{
				"text": "The company’s name is Google Sdn. Bhd.",
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
		"text" : "Alright, i will send to you in an hour.",
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

var dialogueJames = {
	0 : {
		"text" : "Good afternoon Alexa, how are you doing today?",
		"speaking" : "James",
		"next" : 1
	},
	1 : {
		"text" : "Not really good…. ",
		"speaking" : "scammer",
		"next" : 2
	},
	2 : {
		"text" : "Why? What happened to you?",
		"speaking" : "James",
		"options" : [
			{
				"text": "My cat is really sick, she threw up so hard this morning and sent her to the vet. The vet says my cat life is at risk, and needs an immediate surgery, but I don’t have that much money, I dont know what to do :(",
				"next": 3
			},
			{
				"text": "My boyfriend had an accident this morning, The doctor says he need an immediate surgery, but I don’t have that much money, and i dont know what should I do……",
				"next": 9
			}
		]
	},
	
	
	3 : {
		"text" : "My cat is really sick, she threw up so hard this morning and sent her to the vet. The vet says my cat life is at risk, and needs an immediate surgery, but I don’t have that much money, I dont know what to do :(",
		"speaking" : "scammer",
		"next" : 4
	},
	4 : {
		"text" : "OMG!, that’s so bad, anything I can do for you my sweetie? ;)",
		"speaking" : "James",
		"next" : 5
	},
	5 : {
		"text" : "Really? You are such a nice guy, can u send me RM 8000 please?",
		"speaking" : "scammer",
		"next" : 6
	},
	6 : {
		"text" : "Give me ur account, I will transfer it to you now.",
		"speaking" : "James",
		"next" : 7
	},
	7 : {
		"text" : "OMG, you saved my cat's life. XX bank xx-xxxxxxxxx",
		"speaking" : "scammer",
		"next" : 8
	},
	8 : {
		"result" : "success"
	},
	9 : {
		"text" : "My boyfriend had an accident this morning, The doctor says he need an immediate surgery, but I don’t have that much money, and i dont know what should I do……",
		"speaking" : "scammer",
		"next" : 10
	},
	10 : {
		"text" : "Wait, you have a boyfriend? ",
		"speaking" : "James",
		"next" : 11
	},

	11 : {
		"text" : "I mean we are just friends, nothing more.",
		"speaking" : "scammer",
		"next" : 12
	},
	
	12 : {
		"text" : "Stop lying you vicious woman.",
		"speaking" : "James",
		"next" : 13
	},
	
	13 : {
		"text" : "Please James, help me…",
		"speaking" : "scammer",
		"next" : 14
	},
	14 : {
		"result" : "fail"
	}
}

var dialogue = []

func _ready():
	var global = get_node("/root/Global")
	
	if global.currentVictim == "Susan":
		dialogue = dialogueSusan
		victimName = "Susan"
	else:
		dialogue = dialogueJames
		victimName = "James"
		
	if dialogue[speechCounter]["speaking"] != "scammer":
		changeDirection()
		
	loadDialogue()

func loadDialogue():
	
	var global = get_node("/root/Global")
	
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
			
			if dialogue[speechCounter]["result"] == "success":
				global.result = "Victim: " + victimName + "\nResult:\nReward: +50 coins, +300XP"
				global.coin = global.coin + 50
				global.success = true
			else:
				global.result = "Victim: " + victimName + "\nResult:\nReward: +0 coins, +50XP"
				global.success = false
			get_tree().change_scene("res://Dialogue/Result.tscn")
			
	
	
