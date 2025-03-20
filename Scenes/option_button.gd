extends OptionButton
var controllerLeft = null
var controllerRight = null
var function_teleport = null
var movement_direct = null
var status = 1;
var previousStatus = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	controllerLeft = get_node("/root/Main/XROrigin3D/XRControllerLeft")
	controllerRight = get_node("/root/Main/XROrigin3D/XRControllerRight")
	function_teleport = get_node("/root/Main/XROrigin3D/XRControllerLeft/FunctionTeleport")
	movement_direct = get_node("/root/Main/XROrigin3D/XRControllerRight/MovementNode")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	status = get_selected_id()
	if previousStatus != status:		
		if status == 0:
			controllerRight.remove_child(movement_direct)
			controllerLeft.add_child(function_teleport)
		if status == 1:
			controllerLeft.remove_child(function_teleport)
			controllerRight.add_child(movement_direct)
		previousStatus = status
	pass
