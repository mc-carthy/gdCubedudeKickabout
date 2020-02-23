extends KinematicBody

var motion = Vector3()

export var speed = 10

const UP = Vector3(0, 1, 0)
const GRAVITY = -5
const EPSILON = 0.000000000001

func _process(delta):
	animate()

func _physics_process(delta):
	move()
	fall()

func move():
	var dx = 0
	var dz = 0
	
	if Input.is_action_pressed('ui_up'):
		dz -= speed
	if Input.is_action_pressed('ui_down'):
		dz += speed
	if Input.is_action_pressed('ui_right'):
		dx += speed
	if Input.is_action_pressed('ui_left'):
		dx -= speed
	
	motion.x = dx
	motion.z = dz
	
	move_and_slide(motion, UP)

func fall():
	if not is_on_floor():
		motion.y = GRAVITY
	else:
		motion.y = 0

func animate():
	if motion.length() > EPSILON:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()