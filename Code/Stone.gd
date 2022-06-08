extends ReactingObject

class_name Stone


var reactingStones = [[7, 3], [8, 3]]


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


func Activate(cell, t) -> void:
	tm.SetTile(cell[0], cell[1], t)
