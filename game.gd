extends Node2D

var ballSpeed = 200

func _ready():
	randomize()
	
	var paddleScene = preload("res://paddle.tscn")
	
	var leftPaddle = paddleScene.instance()
	leftPaddle.init('ui_leftup', 'ui_leftdown')
	leftPaddle.position = Vector2(80, 310)
	add_child(leftPaddle)
	
	var rightPaddle = paddleScene.instance()
	rightPaddle.init('ui_rightup', 'ui_rightdown')
	rightPaddle.position = Vector2(944, 310)
	add_child(rightPaddle)

	var ball = preload("res://ball.tscn").instance()
	var vx = rand_range(-1, 1)
	var vy = rand_range(-0.3, 0.3)
	var initalVelocity = Vector2(vx, vy).normalized() * ballSpeed
	ball.init(initalVelocity)
	ball.position = Vector2(512, 300)
	add_child(ball)
