extends CharacterBody2D
@export var speed:int=300
signal duang

func _process(delta: float) -> void:
	
	position.x-=speed*delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	duang.emit()
	pass # Replace with function body.
