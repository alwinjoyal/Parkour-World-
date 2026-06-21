extends Control

@onready var resume_button = $VBoxContainer/resume

func _process(delta):
	if GlobalStopwatch.current_level_path == "":
		resume_button.disabled = true 
	else:
		resume_button.disabled = false 

# Connected to 'resume' button's pressed() signal
func _on_resume_pressed():
	if GlobalStopwatch.current_level_path != "":
		get_tree().change_scene_to_file(GlobalStopwatch.current_level_path)

# Connected to 'exittomenu' button's pressed() signal
func _on_exittomenu_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
