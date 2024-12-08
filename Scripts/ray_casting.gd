extends RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		var collider = hit.get_children()[0]		
		var mesh_instance = collider.get_children()[0]
		var material = mesh_instance.mesh.material
		if(material):
			material = material.duplicate()
			material.set("albedo_color", Color(255, 0, 0))
			mesh_instance.mesh.material = material
