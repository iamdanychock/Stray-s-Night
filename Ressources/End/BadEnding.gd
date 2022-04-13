extends Control

func _ready():
	$Label.percent_visible = 0
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("anim")
	$AnimationPlayer2.play("animb")
	
	
	

	



func _on_Button_pressed():
	get_tree().change_scene("res://Ressources/Main Menu/TitleScreen.tscn")
