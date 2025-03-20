extends Node

var controllerLeft = null;
@onready var player_body := XRToolsPlayerBody.find_instance(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	controllerLeft = get_node("/root/Main/XROrigin3D/XRControllerLeft")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent = self.get_parent()
	if controllerLeft.is_button_pressed("menu_button"):
		parent.position = Vector3(0 + 20,player_body.player_head_height, 0)
		parent.visible = !parent.visible
	pass
