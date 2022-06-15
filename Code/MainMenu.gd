extends Menu


func _ready() -> void:
	selectors = [selectorOne, selectorTwo, selectorThree]
	currentScene = "MainMenu"
	print(currentScene)
	optionsScene = load("res://Scenes/OptionsMenu.tscn")
	SetSelector(0)


func SelectionHandler(_currentSelection) -> void:
	if (_currentSelection == 0):
		get_parent().add_child(gameScene.instance())
		queue_free()
	elif (_currentSelection == 1):
		get_parent().add_child(optionsScene.instance())
		queue_free()
	elif (_currentSelection == 2):
		# quit the game
		get_tree().quit()
