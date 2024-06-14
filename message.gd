extends Sprite2D
func _ready():
	$Label.text = Global.message
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
