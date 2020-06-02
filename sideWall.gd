extends Area2D

signal side_wall_hit

func _on_SideWall_body_entered(body):
	emit_signal('side_wall_hit')
