extends KinematicBody2D

onready var paddle_size = $Color.rect_size
onready var Ball = load("res://Ball/Ball.tscn")
onready var HUD = get_node("/root/Game/HUD")

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()


func update_color():
	if HUD.color_paddle:
		pass
	else:
		pass

func emit_particle(pos):
	if HUD.particle_paddle:
		$Particles2D.global_position = pos
		$Particles2D.emitting = true
	else:
		pass

func _on_HUD_changed():
	update_color()

func _physics_process(_delta):
	var target = get_viewport().get_mouse_position().x
	target = clamp(target, 0, get_viewport().size.x - paddle_size.x)

	position.x = target
