extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	move_and_collide(Vector2(1, 1)) # Move right 1 pixel per physics frame

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
