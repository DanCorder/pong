extends KinematicBody2D

var velocity = Vector2(200, 0)

func init(initialVelocity: Vector2) -> void:
	velocity = initialVelocity

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		if collision_info.collider.has_method('custom_bounce'):
			var current_speed = velocity.length()
			velocity = collision_info.collider.custom_bounce(collision_info, current_speed)
		else:
			velocity = velocity.bounce(collision_info.normal)
