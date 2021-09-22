extends KinematicBody

var jugador 
var posh = Vector3.ZERO
export( int ) var velo # velocity
export (int) var gravedad
export (int ) var salto # valor del jump
var jum = true   # variable to jump
onready var cam = get_node("Camera")
export (float) var sensi = 0.2
var vida = 100



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)




func _input(event):
	if event is InputEventMouseMotion:
		var mova = event.relative
		cam.rotation.x += -deg2rad(mova.y * sensi)
		cam.rotation.x = clamp(cam.rotation.x, deg2rad(-90), deg2rad(90))
		rotation.y += -deg2rad(mova.x * sensi)


func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	


func _physics_process(delta):
	
	posh.y -= gravedad * delta ## gravity
	var movori = Vector2()
	
		### movment
	if Input.is_action_pressed("mov arriba"):
		movori.y = 1
	elif Input.is_action_pressed("mov abajo"):
		movori.y =-1
	else :
		movori.y =0
	
	if Input.is_action_pressed("mov der"):
		movori.x = -1
	elif Input.is_action_pressed("mov iz"):
		movori.x = 1
	else :
		movori.x = 0
	
	
	## normalizacion
	
	
	movori = movori.normalized().rotated(- rotation.y) * velo 
	posh.x = movori.x
	posh.z = movori.y
	posh = move_and_slide(posh, Vector3(0,1,0))
				###### salto ######
			
	
	if.is_on_floor():
		jum = true
	if Input.is_action_just_pressed("salta") and jum:
		jum = false
		posh.y = salto
		
	posh = move_and_slide(posh,Vector3(0,1,0))
	
	
	
	
