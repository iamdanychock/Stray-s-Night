extends KinematicBody2D


func _ready():
	pass

var speed : int = 420
var jumpForce : int = 500
var gravity : int = 1000
var vel : Vector2 = Vector2()
var grounded : bool = false

onready var AnimatedSprite = $AnimatedSprite

func _physics_process (delta):
	for i in (get_parent().get_node("Enemies")).get_children():
		i.targetBody = self
		i.isPlayer = true
	
	vel.x = 0
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		AnimatedSprite.play("Walk")
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		AnimatedSprite.play("Walk")
	if Input.is_action_just_pressed(("stay")):
		AnimatedSprite.play("Stay")


	
		
	
	vel = move_and_slide(vel, Vector2.UP)
	
		# gravity
	vel.y += gravity * delta
	# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		AnimatedSprite.play("Jump")
	
		# sprite direction
	if vel.x < 0:
		AnimatedSprite.flip_h = true
	elif vel.x > 0:
		AnimatedSprite.flip_h = false

	



func _on_FallZone_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Ressources/End/BadEnding.tscn")




func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Ressources/End/MobEnding.tscn")
