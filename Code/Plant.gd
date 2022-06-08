extends ReactingObject

class_name Plant


var reactingPlants = []

func CheckDistance() -> void:
	pPos = p.GetPosition()
	# convert player position to a list
	
	for i in reactingPlants:
		px = int(round(pPos.x / 64))
		py = int(round(pPos.y / 64))
		pPosList = [px, py]
		print(pPosList)
		
		if (pPosList[0] < i[0] - 2): break
		if (pPosList[0] > i[0] + 2): break
		Activate(i, 0)


func GetTile() -> void:
	print("g")


func Activate(cell, t) -> void:
	tm.SetTile(cell[0], cell[1], t)
