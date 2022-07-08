extends ReactingObject

class_name Plant


var reactingPlants = [[25, 9], [34, 13]]


func CheckDistance() -> void:
	pPos = p.GetPosition()
	
	for i in reactingPlants:
		px = int(round(pPos.x / 64))
		py = int(round(pPos.y / 64))
		# convert player position to a list
		pPosList = [px, py]
		
		if (pPosList[0] < i[0] - 2): continue
		if (pPosList[0] > i[0] + 2): continue
		if (pPosList[1] < i[1] - 2): continue
		if (pPosList[1] > i[1] + 2): continue
		Activate(i, 1)
		CheckForNeighbour(i)


func CheckForNeighbour(cell) -> void:
	for i in reactingPlants:
		if (!visible.has(i)):
			if (cell[0] - 1 == i[0] || cell[0] + 1 == i[0]):
				if (cell[1] == i[1]):
					Activate(i, 0)
					CheckForNeighbour(i)
			elif (cell[1] - 1 == i[1] || cell[1] + 1 == i[1]):
				if (cell[0] == i[0]):
					Activate(i, 1)
					CheckForNeighbour(i)

