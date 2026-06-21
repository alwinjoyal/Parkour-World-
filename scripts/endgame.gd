extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Stop the timer and grab the raw time numbers
	GlobalStopwatch.stopped = true
	var raw_time = GlobalStopwatch.time 
	
	# Break down the math right here on the end screen
	var msec = fmod(raw_time, 1) * 1000
	var sec = fmod(raw_time, 60)
	var min = raw_time / 60
	
	# Turn it into your clean text format
	var final_time_string = "%02d min %02d sec %03d msec" % [min, sec, msec]
	$FinalTimeLabel.text = "Your Score: " + final_time_string


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_again_pressed() -> void:
	# Cleanly reset the global script directly
	GlobalStopwatch.reset()
	GlobalStopwatch.stopped = false 
	
	# Change the scene back to Level 1
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_menu_pressed() -> void:
	GlobalStopwatch.reset()
	GlobalStopwatch.stopped = true
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
