extends Node

class_name  stats

export var vidamax = 100
var vidaactual = vidamax
signal muerto

func _ready():
	pass # Replace with function body.

func take_hit(baladani):
	vidaactual -= baladani
	print("me pegaron", vidaactual, "/", vidamax)
	
	if vidaactual <= 0:
		die()
		
func die():
	emit_signal("muerto")
	
	
	
