extends Node


var time = 0
var timePeriod = 3
var timerOn = false


func _physics_process(delta):
	if (timerOn):
		PlayTimer(delta)


func PlayTimer(delta):
	time += delta
	print(time)

func StartTimer():
	ResetTimer()
	timerOn = true


func StopTimer():
	ResetTimer()
	timerOn = false


func ResetTimer():
	time = 0


func TimerStatus(ticking):
	timerOn = ticking


func GetTime():
	return time
