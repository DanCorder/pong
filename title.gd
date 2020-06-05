extends Control

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_accept'):
		get_tree().change_scene('res://court.tscn')
