extends Node2D
var mainScene=preload("res://src/game/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("666666666")
	pass # Replace with function body.

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(mainScene)
	pass # Replace with function body.
