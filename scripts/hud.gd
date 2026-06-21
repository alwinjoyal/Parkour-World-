extends Control
class_name HUD

@export var stopwatch_label : Label

func _process(delta):
	update_stopwatch_label()
	
func update_stopwatch_label():
	# This calls Autoload directly
	stopwatch_label.text = GlobalStopwatch.time_to_string()
