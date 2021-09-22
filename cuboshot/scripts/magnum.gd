extends Spatial

export (PackedScene) var bala
onready var cam = get_tree().get_root().get_camera()



func _physics_process(_delta):
	dispara()


func dispara():
	if Input.is_action_just_pressed("fuego"):
		
		var nueva_bala = bala.instance()
		nueva_bala.global_transform = $canon.global_transform
		var scene_root = get_tree().get_root().get_children()[0]
		scene_root.add_child(nueva_bala)
		print(str("disparo"))
	
