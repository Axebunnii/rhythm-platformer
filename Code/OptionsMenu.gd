extends Menu

func _ready() -> void:
	selectors = [selectorOne, selectorTwo, selectorThree]
	currentScene = get_tree().get_current_scene().get_name()
	print(currentScene)
	mainScene = load("res://Scenes/MainMenu.tscn")
	SetSelector(0)

func SelectionHandler(_currentSelection) -> void:
	if (_currentSelection == 0):
		print("Settings")
	elif (_currentSelection == 1):
		print("credits")
	elif (_currentSelection == 2):
		get_parent().add_child(mainScene.instance())
		queue_free()
