extends Area2D
func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("level_4")
	#load a new level
	get_tree().change_scene_to_file("res://scenes/fromportal_3.tscn")
