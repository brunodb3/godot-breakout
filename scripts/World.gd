extends Node2D

onready var level1_scene = preload("res://scenes/Level1.tscn")
onready var level1 = level1_scene.instance()

func _ready():
	GameState.connect("game_reset", self, "_on_game_reset")
	add_child(level1)

func _on_game_reset():
	level1.queue_free()
	level1 = level1_scene.instance()
	add_child(level1)
