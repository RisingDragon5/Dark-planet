extends Control
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")
