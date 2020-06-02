extends KinematicBody2D

var velocity = Vector2(200, 0)

func init(initialVelocity):
	velocity = initialVelocity

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity * 1.01
		velocity = velocity.bounce(collision_info.normal)
