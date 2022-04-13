extends Button


func _ready():
	pass # Replace with function body.





func _on_Button_pressed():
	get_tree().change_scene("res://Ressources/Places/Main.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Ressources/creds/Credits.tscn")
