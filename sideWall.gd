extends Area2D

signal side_wall_hit

func _on_SideWall_body_entered(body: Node) -> void:
	emit_signal('side_wall_hit')
