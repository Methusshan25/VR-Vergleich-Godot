extends MeshInstance3D

@export var raycast_node_path: NodePath
@export var direction: Vector3
@export var to: Vector3

func _ready():
	# Create the ImmediateMesh
	update_mesh(self.mesh)

func update_mesh(immediate_mesh: ImmediateMesh):
	var raycast = get_node_or_null(raycast_node_path)
	if raycast and raycast is RayCast3D:
		immediate_mesh.clear_surfaces()  # Clear previous data

		var from = raycast.global_transform.origin
		to = from + raycast.global_transform.basis.z * raycast.target_position.length() * 20
		
		direction = (to - from).normalized()
		var perpendicular = Vector3(direction.y, -direction.x, 0).normalized() * 0.005 * 0.5
		
		var p1 = from - perpendicular
		var p2 = from + perpendicular
		var p3 = to - perpendicular
		var p4 = to + perpendicular
		
		immediate_mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLES)
		
		mesh.surface_set_color(Color(0, 1, 0, 1))
		mesh.surface_add_vertex(p1)
		mesh.surface_add_vertex(p2)
		mesh.surface_add_vertex(p3)

		mesh.surface_set_color(Color(0, 1, 0, 0.1))		
		mesh.surface_add_vertex(p3)
		mesh.surface_add_vertex(p2)
		mesh.surface_add_vertex(p4)
		mesh.surface_end()

		# Finalize the mesh
		immediate_mesh.surface_end()
