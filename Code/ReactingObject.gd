extends Node

class_name ReactingObject


onready var p = get_node("../Player")
onready var tm = get_node("../TileMap")
var pPos
var px;
var py;
var pPosList
const pMargin = 10
var visible = []


# check the distance between the player and all objects that can react to the instrument
func CheckDistance():
	pass


func CheckForNeighbour(cell):
	pass


func Activate(cell, t):
	visible.append(cell)
	tm.SetTile(cell[0], cell[1], t)
