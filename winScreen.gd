extends Node2D

func _ready() -> void:
	$winnerMessage.text = Global.winner + ' player wins!'

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_accept'):
		var _dummy = get_tree().change_scene('res://title.tscn')
