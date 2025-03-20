extends Control

var sphere = preload("res://Models/sphere.tscn")
var functionTeleport = preload("res://addons/godot-xr-tools/functions/function_teleport.tscn")
var movementDirect = preload("res://addons/godot-xr-tools/functions/movement_turn.tscn")
var instanceSphere = null
var instanceMovement = null
var instanceTeleport = null
var controllerLeft = null
var controllerRight = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	controllerLeft = get_node("/root/Main/XROrigin3D/XRControllerLeft")
	controllerRight = get_node("/root/Main/XROrigin3D/XRControllerRight")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if instanceSphere != null:
		remove_child(instanceSphere)
		instanceSphere = null
	instanceSphere = sphere.instantiate()
	instanceSphere.position = Vector3(0, 0.6, -0.6)
	add_child(instanceSphere)
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		if instanceMovement != null:
			controllerRight.remove_child(instanceMovement)
			instanceMovement = null
		instanceTeleport = functionTeleport.instantiate()
		controllerLeft.add_child(instanceTeleport)
	if index == 1:
		if instanceTeleport != null:
			controllerLeft.remove_child(instanceTeleport)
			instanceTeleport = null
		
	pass # Replace with function body.
