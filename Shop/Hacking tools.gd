extends Tabs

#get price for items
onready var wifi_price = str2var($RichTextLabel/Control/wifi/Label.text) 
onready var phone_price = str2var($RichTextLabel/Control/phone/Label.text)
onready var headset_price = str2var($RichTextLabel/Control/headset/Label.text)    
onready var chair_price = str2var($RichTextLabel/Control/chair/Label.text) 
onready var pc_price = str2var($RichTextLabel/Control/pc/Label.text) 
onready var ac_price = str2var($RichTextLabel/Control/ac/Label.text) 

# ------ Scroll bar
func _process(delta):
	$RichTextLabel/Control.rect_position.y = -$VScrollBar.value

# buy function
func _buy(price):
	if Global.coin >= price: 
		Global.coin -= price
	else:
		var rem = price - Global.coin
		printt(rem)
		$Not_enough_coin_popup/Label.text = 'You need ' + str(rem) + ' Coins to buy this'
		$Not_enough_coin_popup.show()


func _on_wifi_button_pressed():
	_buy(wifi_price)

func _on_phone_button_pressed():
	_buy(phone_price)

func _on_headset_button_pressed():
	_buy(headset_price)

func _on_chair_button_pressed():
	_buy(chair_price)

func _on_pc_button_pressed():
	_buy(pc_price)
	
func _on_ac_Button_pressed():
	_buy(ac_price)

func _on_notenough_popup_button_pressed():
	$Not_enough_coin_popup.hide()
