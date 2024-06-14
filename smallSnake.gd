extends CharacterBody2D
var enemy_speed = 1500
@onready var player = $"../Player"
func _physics_process(delta):
	$AnimatedSprite2D.play("smallSnake")
	move_and_slide()
	if player != null:
		velocity = position.direction_to(player.position) * 5 * enemy_speed * delta
		look_at(player.position)
		if $RayCast2D.get_collider() == player:
			Global.Player_life_point -= 5
			queue_free()
func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
