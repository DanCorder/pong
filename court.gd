extends Node2D

var leftScore = 0
var rightScore = 0

func _on_leftWall_side_wall_hit():
	rightScore += 1
	$rightScoreLabel.text = String(rightScore)
	print('Score: ' + String(leftScore) + ':' + String(rightScore))

func _on_rightWall_side_wall_hit():
	leftScore += 1
	$leftScoreLabel.text = String(leftScore)
	print('Score: ' + String(leftScore) + ':' + String(rightScore))
