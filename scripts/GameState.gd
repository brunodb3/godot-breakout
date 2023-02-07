extends Node2D

var playing = false
var ball_speed = 1500
var player_speed = 2000

signal ball_shoot()
signal game_reset()

func _process(_delta):
	if playing == false:
		if Input.is_action_just_released("ball_shoot"):
			playing = true
			emit_signal("ball_shoot")

	if Input.is_action_just_released("game_reset"):
		playing = false
		emit_signal("game_reset")
