extends Node

class_name ReactingObject


onready var p = get_node("../Player")
onready var tm = get_node("../TileMap")
var pPos
var pPosList
const pMargin = 10
var px;
var py;

# check the distance between the player and all objects that can react to the instrument
func CheckDistance():
	pass

func GetTile():
	pass


func Activate(cell, t):
	pass
