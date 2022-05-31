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
#	selectors = [selectorOne, selectorTwo, selectorThree]
#	currentScene = get_tree().get_current_scene().get_name()
#	print(currentScene)
#	match currentScene:
#		"MainMenu":
#			optionsScene = load("res://Scenes/OptionsMenu.tscn")
#		"OptionsMenu":
#			mainScene = load("res://Scenes/MainMenu.tscn")
#	SetSelector(0)


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
		currentScene = get_tree().get_current_scene().get_name()
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
#	if (currentScene == "MainMenu"):
#		if (_currentSelection == 0):
#			# get the root node and add the new scene as a child
#			get_parent().add_child(gameScene.instance())
#			# delete this scene
#			queue_free()
#		elif (_currentSelection == 1):
#			get_parent().add_child(optionsScene.instance())
#			queue_free()
#		elif (_currentSelection == 2):
#			# quit the game
#			get_tree().quit()
#	elif (currentScene == "OptionsMenu"):
#		if (_currentSelection == 0):
#			print("Settings")
#		elif (_currentSelection == 1):
#			print("credits")
#		elif (_currentSelection == 2):
#			get_parent().add_child(mainScene.instance())
#			queue_free()
