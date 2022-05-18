extends Node2D

# nodes that will show the sprites
onready var cs1 = get_node("ComboSprite1")
onready var cs2 = get_node("ComboSprite2")
onready var cs3 = get_node("ComboSprite3")

# sprites of the nodes
var leftIcon = preload("res://Art/previous.png")
var upIcon = preload("res://Art/play.png")
var rightIcon = preload("res://Art/next.png")
var downIcon = preload("res://Art/quit.png")

# array of the nodes
var nodes = [cs1, cs2, cs3]

# array of the sprites
var sprites = [leftIcon, upIcon, rightIcon, downIcon]

func _ready():
	cs1.visible = false
	cs2.visible = false
	cs3.visible = false

func ChangeSprite(n):
	print(n)
	cs1.set_texture(sprites[n])
	SetVisibility(cs1, true)
	
	
func SetVisibility(s, b):
	s.visible = b
