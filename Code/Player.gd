extends KinematicBody2D


var pos = self.get_position()
const SPEED = 100
const JUMPFORCE = -500
const GRAVITY = 30
var movedir = Vector2(0,0)
var rhythmKeys = [16777231, 16777232, 16777233, 16777234]

var overlapping = false

var mainScene = load("res://Scenes/MainMenu.tscn")

var lastposonfloor
var lives = 3
var heart1
var heart2
var heart3
var hearts

onready var s = get_node("RhythmSprites")
onready var l = get_node("../Canvas/UI/Interface/MusicSheet/MusicSheetLine")


func _ready():
	heart1 = get_node("../Canvas/UI/Interface/NinePatchRect/Heart1")
	heart2 = get_node("../Canvas/UI/Interface/NinePatchRect/Heart2")
	heart3 = get_node("../Canvas/UI/Interface/NinePatchRect/Heart3")
	hearts = [heart1, heart2, heart3]


func _physics_process(delta):
	pos = self.get_position()
	Movement(delta)
	CheckPosition()
	
	
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
	overlapping = l.CheckOverlapping()
	if (overlapping):
		if (pk == rhythmKeys[0]):
			s.ChangeSprite(0, pk)
			l.StartRhythm(true)
		elif (pk == rhythmKeys[1]):
			s.ChangeSprite(1, pk)
#			l.StartRhythm(true)
		elif (pk == rhythmKeys[2]):
			s.ChangeSprite(2, pk)
#			l.StartRhythm(true)
		elif (pk == rhythmKeys[3]):
			s.ChangeSprite(3, pk)
#			l.StartRhythm(true)
	else:
		s.BreakRhythm()
		
		
func GetPosition():
	return pos
	
	
func CheckPosition():
	if (is_on_floor()):
		lastposonfloor = pos
	
	if (pos.y > 1100):
		position  = lastposonfloor
		LoseLife()


func LoseLife():
	lives -= 1
	for i in range(hearts.size()-1, -1, -1):
		if (hearts[i].visible == false): continue
		hearts[i].visible = false
		break
	
	if (lives == 0):
		get_parent().add_child(mainScene.instance())
		queue_free()
