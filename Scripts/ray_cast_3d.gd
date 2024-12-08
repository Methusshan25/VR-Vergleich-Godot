extends RayCast3D

@export var ray_length : float = 10.0 # Maximum ray length
@onready var ray_mesh = $MeshInstance3D  # Reference to the MeshInstance3D node

func _ready():
	# Ensure the ray mesh is initially visible
	ray_mesh.visible = true
	ray_mesh.scale = Vector3(0.05, 0.05, ray_length)  # Set initial scale of ray mesh

# Called every frame
func _process(delta):
	# Check if the ray is colliding with an object
	if self.is_colliding():
		var collided_object = self.get_collider()
		# Update ray mesh visibility and scale when there's a collision
		ray_mesh.scale.z = self.get_collision_normal().length() # Shorten the ray length to the hit distance
		ray_mesh.visible = true
		
		# Call the hover method on the collided object (if it has one)
		if collided_object.has_method("on_hover"):
			collided_object.on_hover()
	else:
		# No collision, show full-length ray
		ray_mesh.scale.z = ray_length
		ray_mesh.visible = true  # Make sure the ray is still visible even when not hitting anything

# Detect click (trigger press)
func _input(event):
	if event.is_action_pressed("xr_trigger_click") and self.is_colliding():
		var collided_object = self.get_collider()
		if collided_object.has_method("on_click"):
			collided_object.on_click()
