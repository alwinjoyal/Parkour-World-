extends Node
class_name Stopwatch

var time = 0.0
var stopped = true
var current_level_path = ""

func _ready():
	set_process(true)
	
func _process(delta):
	if stopped:
		return
	time += delta
	
func reset():
	time = 0.0
	
func time_to_string() -> String:
	#turn the tiem bar into string for UI desplay
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var min = time / 60
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [min , sec, msec]
	return actual_string
	
func stop_and_get_time() -> String:
	stopped = true
	return time_to_string()
	
	
