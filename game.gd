extends Node2D

func _ready():
	var paddleScene = preload("res://paddle.tscn")
	
	var leftPaddle = paddleScene.instance()
	leftPaddle.init('ui_leftup', 'ui_leftdown')
	leftPaddle.position = Vector2(80, 310)
	add_child(leftPaddle)
	
	var rightPaddle = paddleScene.instance()
	rightPaddle.init('ui_rightup', 'ui_rightdown')
	rightPaddle.position = Vector2(944, 310)
	add_child(rightPaddle)
