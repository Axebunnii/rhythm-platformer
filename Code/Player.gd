extends KinematicBody2D

const SPEED = 100
const JUMPFORCE = -400
const GRAVITY = 30
var movedir = Vector2(0,0)
var rhythmKeys = [16777231, 16777232, 16777233, 16777234]

onready var s = get_node("Node2D")

func _physics_process(delta):
	Movement(delta)
	
	
func _process(delta):
	pass
	
	
func Movement(delta):
	movedir.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	# adds the gravity value to the y value every frame
	movedir.y = movedir.y + GRAVITY
	
	# makes the player jump if the player has collision with the ground
	if (int(Input.is_action_just_pressed("Jump")) && is_on_floor()):
		movedir.y = JUMPFORCE
	
	movedir.x = movedir.x * SPEED
	movedir = move_and_slide(movedir, Vector2.UP)
	
	movedir.x = lerp(movedir.x, 0, 0.2)


func _input(event):
	if event is InputEventKey and event.pressed:
		var pressedKey = event.scancode
		if rhythmKeys.has(pressedKey):
			PlayInstrument(pressedKey)


func PlayInstrument(pk):
	if (pk == rhythmKeys[0]):
		s.ChangeSprite(0)
	elif (pk == rhythmKeys[1]):
		s.ChangeSprite(1)
	elif (pk == rhythmKeys[2]):
		s.ChangeSprite(2)
	elif (pk == rhythmKeys[3]):
		s.ChangeSprite(3)
