extends KinematicBody

var motion = Vector3()
var can_move = true

export var speed = 10
export var player_id = 1

const UP = Vector3(0, 1, 0)
const GRAVITY = -5
const EPSILON = 0.000000000001

func _process(delta):
	if can_move:
		animate()
	face_forward()

func _physics_process(delta):
	if can_move:
		move()
	fall()

func reset():
	var spawn_point = get_tree().get_root().find_node(("Player%sSpawn" % player_id), true, false)
	translation = spawn_point.translation
	can_move(true)

func move():
	var dx = 0
	var dz = 0
	
	if Input.is_action_pressed('up_%s' % player_id):
		dz -= 1
	if Input.is_action_pressed('down_%s' % player_id):
		dz += 1
	if Input.is_action_pressed('right_%s' % player_id):
		dx += 1
	if Input.is_action_pressed('left_%s' % player_id):
		dx -= 1
	
	motion.x = dx
	motion.z = dz
	
	
	move_and_slide(motion.normalized() * speed, UP)

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

func face_forward():
	if not motion.x == 0 or not motion.z == 0:
		look_at(Vector3(-motion.x, 0, -motion.z) * speed, UP)

func can_move(boolean):
	can_move = boolean