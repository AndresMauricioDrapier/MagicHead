extends CharacterBody2D

enum DIRECTION {LEFT, RIGHT, UP, DOWN}

var speed = 100  # move speed in pixels/sec

func get_input(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	check_sprite_direction(direction.x)
	velocity = direction * speed
	
func check_sprite_direction(actualDirectionFacing: float):
	if actualDirectionFacing < 0:
		set_sprite_direction(DIRECTION.LEFT)
	else:
		set_sprite_direction(DIRECTION.RIGHT)
		
func set_sprite_direction(newDirection: DIRECTION):
	if newDirection == DIRECTION.RIGHT && $Sprite.is_flipped_h():
		$Sprite.set_flip_h(false)
		
	if newDirection == DIRECTION.LEFT && !$Sprite.is_flipped_h():
		$Sprite.set_flip_h(true)
		
	return

func _physics_process(delta):
	get_input(delta)
	move_and_slide()
