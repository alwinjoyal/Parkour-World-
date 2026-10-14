extends Control

func pause():
	get_tree().paused=!get_tree().paused
	visible=get_tree().paused
	
func _input(event):
	if event.is_action_pressed("Pause"):
		pause()

func _on_continue_pressed() -> void:
	pause()

func _on_restart_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_controls_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/controls.tscn")


func _on_exit_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
