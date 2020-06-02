extends Node2D

var leftScore = 0
var rightScore = 0
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

func _on_leftWall_side_wall_hit():
	rightScore += 1
	$rightScoreLabel.text = String(rightScore)

func _on_rightWall_side_wall_hit():
	leftScore += 1
	$leftScoreLabel.text = String(leftScore)
