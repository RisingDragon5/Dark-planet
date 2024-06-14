extends Node2D
@export var snaks: PackedScene
@export var smallSnake: PackedScene
func _process(delta):
	$GameTimer/Label2.text = str(int($GameTimer.time_left))
func _on_timer_timeout():
	var randomasing = randi_range(90, 650)
	var s = snaks.instantiate()
	s.position = Vector2(1250, randomasing)
	add_child(s)
func _on_timer_2_timeout():
	var randomasing = randi_range(90, 650)
	var sm = smallSnake.instantiate()
	sm.position = Vector2(1300, randomasing)
	add_child(sm)
func _on_game_timer_timeout():
	Global.Player_life_point = 100
	Global.message = "You did it! Well done!"
	get_tree().change_scene_to_file("res://message.tscn")
