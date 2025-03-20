extends XRController3D
@onready var player_body := XRToolsPlayerBody.find_instance(self)
var ui = null
var camera = null
var enabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui = get_node("/root/Main/UI")
	camera = get_node("/root/Main/XROrigin3D/XRCamera3D")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("ax_button"):
		var transform = Transform3D()
		transform.origin = Vector3.ZERO
		transform.basis = Basis()
		player_body.teleport(transform)
	if is_button_pressed("menu_button"):
		if enabled:
			ui.scale = Vector3(0,0,0)
			enabled = false
		else:
			ui.scale = Vector3(0.003,0.003,0.003)
			enabled = true
	pass
