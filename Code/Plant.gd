extends ReactingObject

class_name Plant


var reactingPlants = [[3, 1], [4, -1], [5, 1]]


func CheckDistance() -> void:
	pPos = p.GetPosition()
	# convert player position to a list
	
	for i in reactingPlants:
		px = int(round(pPos.x / 64))
		py = int(round(pPos.y / 64))
		pPosList = [px, py]
		
		print(pPosList)
		if (pPosList[0] < i[0] - 2): continue
		if (pPosList[0] > i[0] + 2): continue
		if (pPosList[1] < i[1] - 2): continue
		if (pPosList[1] > i[1] + 2): continue
		Activate(i, 1)


func Activate(cell, t) -> void:
	tm.SetTile(cell[0], cell[1], t)
