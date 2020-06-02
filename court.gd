extends Node2D

const ballSpeed = 200
const ballScene = preload("res://ball.tscn")
const paddleScene = preload("res://paddle.tscn")

var _leftScore = 0
var _rightScore = 0
var _ball

func _ready():
	randomize()
	
	var leftPaddle = paddleScene.instance()
	leftPaddle.init('ui_leftup', 'ui_leftdown')
	leftPaddle.position = Vector2(80, 310)
	add_child(leftPaddle)
	
	var rightPaddle = paddleScene.instance()
	rightPaddle.init('ui_rightup', 'ui_rightdown')
	rightPaddle.position = Vector2(944, 310)
	add_child(rightPaddle)
	
	serve_ball()


func serve_ball():
	var ball = ballScene.instance()
	var vx = rand_range(-1, 1)
	var vy = rand_range(-0.3, 0.3)
	var initalVelocity = Vector2(vx, vy).normalized() * ballSpeed
	ball.init(initalVelocity)
	ball.position = Vector2(512, 300)
	add_child(ball)
	_ball = ball


func _on_leftWall_side_wall_hit():
	_ball.queue_free()
	_rightScore += 1
	$rightScoreLabel.text = String(_rightScore)
	serve_ball()

func _on_rightWall_side_wall_hit():
	_ball.queue_free()
	_leftScore += 1
	$leftScoreLabel.text = String(_leftScore)
	serve_ball()
