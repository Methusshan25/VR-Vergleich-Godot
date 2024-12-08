extends MeshInstance3D

func draw_raycast_line():
	var mesh = $RayCast3D/ImmediateMesh
	var start_point = Vector3.ZERO
	var end_point = $RayCast3D.target_position
	
	var immediate = mesh.surface_get(0) if mesh.get_surface_count() > 0 else ImmediateMesh.new()
	immediate.clear()
	immediate.begin(Mesh.PRIMITIVE_LINES)
	immediate.add_vertex(start_point)
	immediate.add_vertex(end_point)
	immediate.end()
	
	if mesh.get_surface_count() == 0:
		mesh.add_surface_from_arrays(immediate.get_format(), [])


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
