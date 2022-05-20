extends Node2D

# nodes that will show the sprites
onready var cs1 = get_node("ComboSprite1")
onready var cs2 = get_node("ComboSprite2")
onready var cs3 = get_node("ComboSprite3")
onready var cs4 = get_node("ComboSprite4")

# sprites of the nodes
var leftIcon = preload("res://Art/previous.png")
var upIcon = preload("res://Art/play.png")
var rightIcon = preload("res://Art/next.png")
var downIcon = preload("res://Art/quit.png")

# array of the nodes
var nodes

# array of the sprites
var sprites = [leftIcon, upIcon, rightIcon, downIcon]


func _ready():
	var t = get_node("../../Timer")
	t.StartTimer()
	nodes  = [cs1, cs2, cs3, cs4]
	for i in nodes:
		i.visible = false


func ChangeSprite(n):
	for i in nodes:
		if (i.visible == false):
			i.set_texture(sprites[n])
			SetVisibility(i, true)
			if (i == nodes[-1]):
				yield(get_tree().create_timer(3.0), "timeout")
				for x in nodes:
					SetVisibility(x, false)
			break
	
	
func SetVisibility(s, b):
	s.visible = b
