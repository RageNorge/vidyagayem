
extends RigidBody2D

const spdup = 4
const maxspd = 296

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	var bodies =  get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/WorldNode").score += 5
			body.queue_free()
		if body.get_name() == "Paddle":
			var spd = get_linear_velocity().length()
			var drctn = get_pos() - body.get_node("Anchor").get_global_pos()
			var vel = drctn.normalized()*min(spd+spdup,maxspd)
			set_linear_velocity(vel)
			print(str(spd+spdup))

	if get_pos().y > get_viewport_rect().end.y:
		queue_free()