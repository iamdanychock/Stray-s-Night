extends Control

func _ready():
	$Label.percent_visible = 0
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("animc")
	$AnimationPlayer2.play("animk")
	
	
	



func _on_Button1_pressed():
	get_tree().change_scene("res://Ressources/End/THX.tscn")
