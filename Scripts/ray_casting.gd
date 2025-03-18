extends RayCast3D

# State 0: Neural
# State 1: Grab
var state = 0
var collider_mesh = null

func _physics_process(delta: float) -> void:
	var right_controller = get_node("..")
	var line = get_child(0) 
	if is_colliding():
		state = 1
		collider_mesh = get_collider()
		line.visible = true
	else:
		line.visible = false
	if !right_controller.is_button_pressed("trigger"):
		state = 0
		collider_mesh = null
	if(right_controller.is_button_pressed("trigger") && collider_mesh):
		var collision_point = get_collision_point().normalized()
		collider_mesh.global_transform.origin = right_controller.global_transform.origin - self.global_transform.basis.y * self.target_position.length()
