extends CharacterBody2D
@export var speed = 1000
@export var bullet: PackedScene
func _physics_process(delta):
	move_and_slide()
	if Global.Player_life_point <= 0:
		Global.Player_life_point = 0
		Global.message = "You didn't make it"
		get_tree().change_scene_to_file("res://message.tscn")
		Global.Player_life_point = 100
	$Label.text = str(int(Global.Player_life_point))
	position.x = 90
	if Input.is_action_pressed("Down"):
		velocity.y = 10 * speed * delta
	elif Input.is_action_pressed("Up"):
		velocity.y = - 10 * speed * delta
	else:
		velocity = Vector2(0, 0)
		
	if Input.is_action_just_pressed("shoot"):
		$AudioStreamPlayer2D.play()
		var b = bullet.instantiate()
		b.position  = $Marker2D.get_global_position()
		get_parent().add_child(b)
