extends CharacterBody2D
var enemy_speed = 1200
var life_point = 3
@onready var player = $"../Player"
func _physics_process(delta):
	$AnimatedSprite2D.play("darkSnake")
	move_and_slide()
	if player != null:
		velocity = position.direction_to(player.position) * 5 * enemy_speed * delta
		look_at(player.position)

		if $RayCast2D.get_collider() == player:
			life_point -= 0.1
			Global.Player_life_point -= 0.5
	if life_point <= 0:
		queue_free()
func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		life_point -= 1
