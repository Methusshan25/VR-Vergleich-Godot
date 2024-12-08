extends MeshInstance3D

@export var raycast_node_path: NodePath

func _ready():
	# Create the ImmediateMesh
	update_mesh(self.mesh)

func update_mesh(immediate_mesh: ImmediateMesh):
	var raycast = get_node_or_null(raycast_node_path)
	if raycast and raycast is RayCast3D:
		immediate_mesh.clear_surfaces()  # Clear previous data
		
		# Begin drawing lines
		immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES)

		var from = raycast.global_transform.origin
		var to = from + raycast.global_transform.basis.z * raycast.target_position.length()
		
		immediate_mesh.surface_set_color(Color(1, 0, 0))  # Red
		immediate_mesh.surface_add_vertex(from)

		immediate_mesh.surface_set_color(Color(0, 1, 0))  # Green
		immediate_mesh.surface_add_vertex(to)

		# Finalize the mesh
		immediate_mesh.surface_end()
