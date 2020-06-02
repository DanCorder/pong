extends Node2D

const winningScore = 7
const ballSpeed = 200
const ballScene = preload("res://ball.tscn")

var _leftScore = 0
var _rightScore = 0
var _ball

func _ready():
	randomize()
	
	$leftPaddle.init('ui_leftup', 'ui_leftdown')
	$rightPaddle.init('ui_rightup', 'ui_rightdown')

	new_point()


func new_point():
	$rightScoreLabel.text = String(_rightScore)
	$leftScoreLabel.text = String(_leftScore)
	
	if (_leftScore >= winningScore || _rightScore >= winningScore):
		get_tree().change_scene('res://winScreen.tscn')
	
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
	new_point()
	

func _on_rightWall_side_wall_hit():
	_ball.queue_free()
	_leftScore += 1
	new_point()