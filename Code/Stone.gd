extends ReactingObject

class_name Stone


var reactingStones = [[7, 3], [8, 3], [8, 2]]


func CheckDistance() -> void:
	pPos = p.GetPosition()
	
	for i in reactingStones:
		px = int(round(pPos.x / 64))
		py = int(round(pPos.y / 64))
		# convert player position to a list
		pPosList = [px, py]
		
		if (pPosList[0] < i[0] - 2): continue
		if (pPosList[0] > i[0] + 2): continue
		if (pPosList[1] < i[1] - 2): continue
		if (pPosList[1] > i[1] + 2): continue
		Activate(i, 0)
		CheckForNeighbour(i)


func CheckForNeighbour(cell) -> void:
	for i in reactingStones:
		if (!visible.has(i)):
			if (cell[0] - 1 == i[0] || cell[0] + 1 == i[0]):
				if (cell[1] == i[1]):
					Activate(i, 0)
					CheckForNeighbour(i)
			elif (cell[1] - 1 == i[1] || cell[1] + 1 == i[1]):
				if (cell[0] == i[0]):
					Activate(i, 0)
					CheckForNeighbour(i)


func Activate(cell, t) -> void:
	visible.append(cell)
	tm.SetTile(cell[0], cell[1], t)
