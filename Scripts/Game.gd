extends Spatial

onready var Ball = get_tree().get_root().find_node("Ball", true, false)

func _ready():
	reset_pitch()


func _on_GoalDetection_body_entered(body, player_scored_id):
	Ball.axis_lock_linear_x = true
	Ball.axis_lock_linear_y = true
	Ball.axis_lock_linear_z = true
	get_tree().call_group("player", "can_move", false)
	$Timer.start()
	print("Player " + str(player_scored_id) + " has scored")
	

func _on_Timer_timeout():
	reset_pitch()
	$Timer.stop()

func reset_pitch():
	var ball_spawn = get_tree().get_root().find_node("BallSpawn", true, false)
	Ball.axis_lock_linear_x = false
	Ball.axis_lock_linear_y = false
	Ball.axis_lock_linear_z = false
	Ball.linear_velocity = Vector3(0, 0, 0)
	Ball.angular_velocity = Vector3(0, 0, 0)
	Ball.translation = ball_spawn.translation

	get_tree().call_group("player", "reset")