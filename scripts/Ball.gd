extends KinematicBody2D

var direction = Vector2.ZERO

onready var player = $"%Player"

func _ready():
	GameState.connect("ball_shoot", self, "_on_ball_shoot")
	GameState.connect("game_reset", self, "_on_game_reset")

func _on_ball_shoot():
	shoot()

func _on_game_reset():
	reset()

func shoot():
	var random_direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
	direction = random_direction.normalized()

	direction.x *= GameState.ball_speed
	direction.y *= GameState.ball_speed
	
func reset():
	direction = Vector2.ZERO
	position.x = player.position.x
	position.y = player.position.y - 30

func _physics_process(delta):
	if GameState.playing == false:
		reset()
	else:
		var collision = move_and_collide(direction * delta)
		if collision:
			direction = direction.bounce(collision.normal)

			if collision.collider.is_in_group("Bricks"):
				collision.collider.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	GameState.playing = false
	reset()
