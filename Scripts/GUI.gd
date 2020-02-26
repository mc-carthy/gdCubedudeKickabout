extends CanvasLayer

func update_score(score, player):
	var score_label = get_node("Banner/HBoxContainer/Player%sScore" % player)
	score_label.text = str(score)

func game_over():
	$Popup.popup_centered()

func _on_Button_pressed():
	get_parent().restart_game()
