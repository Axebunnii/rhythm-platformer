extends KinematicBody2D


var pos
var notePos

onready var note1 = get_node("../Note1")
onready var note2 = get_node("../Note2")
onready var note3 = get_node("../Note3")
onready var note4 = get_node("../Note4")
var notes
var margin = 10

func StartRhythm(b):
	if (b):
		pos.x += 1
		move_and_slide(pos)
#		StartRhythm(true)


func CheckOverlapping():
	notes = [note1, note2, note3, note4]
	for x in notes:
		pos = self.get_position()
		notePos = x.get_position()
		if (pos.x < notePos.x - margin || pos.x > notePos.x + margin): return false
		return true


func Reset():
	self.rect_position.x = 0
