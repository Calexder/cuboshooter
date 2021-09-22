extends Area

export (int) var balavel = 250
var baladani = 10
var balaviva = 5
var tiempo = 0


func _process(delta):
	tiempo += delta
	if tiempo >= balaviva:
		queue_free()
		
		
func _physics_process(delta):
	var ir_adelante = global_transform.basis.z.normalized()
	global_translate(ir_adelante * balavel * delta )


#func _physics_process(delta):
#		translate(Vector3(0, 0, -balavel * delta))



func _on_Area_body_entered(body: Node):
	print("te pege bro", body)
	queue_free()
	
	if body.has_node("stats"):
		var sta_node = body.find_node("stats") as stats
		sta_node.take_hit(baladani)
