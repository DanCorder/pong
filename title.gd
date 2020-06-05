extends Control

func _input(_ev) -> void:
	var _dummy: int;
	if Input.is_key_pressed(KEY_1):
		_dummy = get_tree().change_scene('res://courts/base.tscn')
	if Input.is_key_pressed(KEY_2):
		_dummy = get_tree().change_scene('res://courts/compass/court.tscn')
	if Input.is_key_pressed(KEY_3):
		_dummy = get_tree().change_scene("res://courts/pachinko/court.tscn")
