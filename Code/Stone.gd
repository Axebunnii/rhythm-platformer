extends ReactingObject

class_name Stone


var reactingStones = [[7, 3], [8, 3]]

func CheckDistance() -> void:
	pPos = p.GetPosition()
	# convert player position to a list
	
	for i in reactingStones:
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
