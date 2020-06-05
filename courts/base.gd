extends Node2D

const winningScore = 7
const ballSpeed = 250
const ballScene = preload("res://ball.tscn")

var _leftScore = 0
var _rightScore = 0
var _ball: KinematicBody2D

func _ready() -> void:
	randomize()
	
	$leftPaddle.init('ui_leftup', 'ui_leftdown')
	$rightPaddle.init('ui_rightup', 'ui_rightdown')

	new_point()


func new_point() -> void:
	$rightScoreLabel.text = String(_rightScore)
	$leftScoreLabel.text = String(_leftScore)
	
	if (_leftScore >= winningScore || _rightScore >= winningScore):
		Global.winner = 'Left' if _leftScore >= winningScore else 'Right'
		get_tree().change_scene('res://winScreen.tscn')
	
	var ball = ballScene.instance()
	var vx = rand_range(1, 2)
	var vy = rand_range(0, 0.5)
	var direction = rand_range(-1, 1)
	var initalVelocity = Vector2(vx, vy) * direction
	initalVelocity = initalVelocity.normalized() * ballSpeed
	ball.init(initalVelocity)
	ball.position = Vector2(512, 300)
	add_child(ball)
	_ball = ball


func _on_leftWall_side_wall_hit() -> void:
	_ball.queue_free()
	_rightScore += 1
	new_point()
	

func _on_rightWall_side_wall_hit() -> void:
	_ball.queue_free()
	_leftScore += 1
	new_point()
