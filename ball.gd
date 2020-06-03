extends KinematicBody2D

const speed_up = 1.03
const paddleHeight = 80
var velocity = Vector2(200, 0)

func init(initialVelocity):
	velocity = initialVelocity

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		if collision_info.collider.has_method('custom_bounce_direction'):
			var current_speed = velocity.length()
			var new_direction = collision_info.collider.custom_bounce_direction(collision_info)
			velocity = new_direction * current_speed
		else:
			velocity = velocity.bounce(collision_info.normal)
		
		velocity = velocity * speed_up
		
