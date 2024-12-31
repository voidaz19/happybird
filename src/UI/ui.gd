extends Control
var numPics:Array=[
preload("res://assets/PNG/Numbers/number0.png"),
preload("res://assets/PNG/Numbers/number1.png"),
preload("res://assets/PNG/Numbers/number2.png"),
preload("res://assets/PNG/Numbers/number3.png"),
preload("res://assets/PNG/Numbers/number4.png"),
preload("res://assets/PNG/Numbers/number5.png"),
preload("res://assets/PNG/Numbers/number6.png"),
preload("res://assets/PNG/Numbers/number7.png"),
preload("res://assets/PNG/Numbers/number8.png"),
preload("res://assets/PNG/Numbers/number9.png"),
]
var mainScene=preload("res://src/game/main.tscn")
var menuScene=preload("res://src/UI/menu.tscn")
#@onready var score_timer: Timer = $scoreTimer
@onready var score_container: HBoxContainer = $scoreContainer
signal btnMenuPressed
signal btnRetryPressed

func _ready() -> void:
	updateScoreDisplay(0)
	
func updateScoreDisplay(score:int)->void:
	for node in score_container.get_children():
		node.queue_free()
	var scoreStr=str(score)
	for i in scoreStr:
		var numPic:TextureRect=TextureRect.new()
		score_container.add_child(numPic)
		numPic.texture=numPics[int(i)]
	pass

func _on_btn_menu_pressed() -> void:
	btnMenuPressed.emit()
	pass # Replace with function body.


func _on_btn_retry_pressed() -> void:
	btnRetryPressed.emit()
	pass # Replace with function body.
