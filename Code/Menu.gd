extends MarginContainer

class_name Menu

const gameScene = preload("res://Scenes/Game.tscn")
var mainScene
var optionsScene

onready var selectorOne = get_node("CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector")
onready var selectorTwo = get_node("CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector")
onready var selectorThree = get_node("CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector")

var selectors
var currentScene
var currentSelection = 0


func _ready():
	print("x")


func _process(delta):
	InputHandler()
	

func InputHandler():
	if (Input.is_action_just_pressed("ui_up")):
		currentSelection -= 1
		if (currentSelection >= 3):
			currentSelection = 0
		elif (currentSelection <= -1):
			currentSelection = 2
		SetSelector(currentSelection)
	elif (Input.is_action_just_pressed("ui_down")):
		currentSelection += 1
		if (currentSelection >= 3):
			currentSelection = 0
		elif (currentSelection <= -1):
			currentSelection = 2
		SetSelector(currentSelection)
	elif (Input.is_action_just_pressed("ui_accept")):
		SelectionHandler(currentSelection)


func SetSelector(_currentSelection):
	print(_currentSelection)
	for i in selectors:
		i.text = ""
	
	if (_currentSelection == 0):
		selectorOne.text = ">"
	elif (_currentSelection == 1):
		selectorTwo.text = ">"
	elif (_currentSelection == 2):
		selectorThree.text = ">"


func SelectionHandler(_currentSelection):
	print("y")
