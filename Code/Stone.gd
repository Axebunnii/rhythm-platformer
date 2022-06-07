extends ReactingObject

class_name Stone


var reactingStones = [[7, 3], [8, 3]]

func CheckDistance() -> void:
	pPos = p.GetPosition()
	
	Activate()

func GetTile() -> void:
	print("g")

func Activate() -> void:
	print(tm)
	tm.SetTile(7, 3, 0)
