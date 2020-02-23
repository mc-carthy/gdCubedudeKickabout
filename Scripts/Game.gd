extends Spatial

func _ready():
	pass


func _on_GoalDetection_body_entered(body, player_scored_id):
	print("Player " + str(player_scored_id) + " has scored")