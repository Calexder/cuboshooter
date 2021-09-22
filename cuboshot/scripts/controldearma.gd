extends Node

export (PackedScene) var armainicial 
var mano
var arma_equipada : Spatial


func _ready():
	mano = get_parent().find_node("Manita")
	if armainicial:
		equipar_arma(armainicial)


func equipar_arma(arma_a_equipar):
	if arma_equipada:
		print("borrar arma equipada")
		arma_equipada.queue_free()
	else :
		print("ninguna arma puesta")
		arma_equipada = arma_a_equipar.instance()
		mano.add_child(arma_equipada)

