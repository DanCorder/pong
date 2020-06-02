extends KinematicBody2D

var speed = 300
var velocity = Vector2()

func get_input():
	# Detect up/down keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
