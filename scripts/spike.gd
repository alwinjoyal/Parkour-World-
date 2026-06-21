extends Area2D


func _on_body_entered(body):
	print(body.name)
	if body.name == "player":
		print("ouch")
		body.respawn()
