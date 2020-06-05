extends KinematicBody2D

var _velocity = Vector2(200, 0)

func init(initialVelocity: Vector2) -> void:
	_velocity = initialVelocity

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(_velocity * delta)
	if collision_info:
		if collision_info.collider.has_method('custom_bounce'):
			var current_speed = _velocity.length()
			_velocity = collision_info.collider.custom_bounce(collision_info, current_speed)
		else:
			_velocity = _velocity.bounce(collision_info.normal)
