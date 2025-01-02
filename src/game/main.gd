extends Node2D
var ROCK = preload("res://src/entities/rock.tscn")
var timer:Timer=Timer.new()
var scoreTimer:Timer=Timer.new()
##石头生成计时器的最小值
@export var minSpawnTime:float=1.5 
##石头生成计时器的最小值
@export var maxSpawnTime:float=3.0 
@onready var player: CharacterBody2D = $Player
@onready var ui: Control = $UI
@onready var gameover: AudioStreamPlayer = $gameover
@onready var gameStateMachine: GameStateMachine = %gameStateMachine

var score:int

func initGame()->void:
	
	pass
	
func readyGame()->void:
	
	pass
	
	
func _ready() -> void:
	gameStateMachine.launchState(0)
	player.screenExited.connect(gameOver)
	ui.btnMenuPressed.connect(_onBtnMenuPressed)
	ui.btnRetryPressed.connect(_onBtnRetryPressed)
	timer.timeout.connect(_onTimerTimeout)
	scoreTimer.timeout.connect(_onScoreTimerTimeout)
	add_child(timer)
	add_child(scoreTimer)
	timer.wait_time=randf_range(minSpawnTime,maxSpawnTime)
	scoreTimer.start()
	timer.start()
	pass # Replace with function body.

func _onScoreTimerTimeout():
	score+=1
	ui.updateScoreDisplay(score)
	pass

func _onTimerTimeout():
	spawnRock()
	timer.wait_time=randf_range(minSpawnTime,maxSpawnTime)
	timer.start()
	
func spawnRock():
	var rock=ROCK.instantiate()
	rock.duang.connect(_onRockEntered)
	var num=randi_range(0,1)
	if num==0:
		var yPos:int
		yPos=randi_range(416,610)
		rock.position=Vector2(1300,yPos)
	else:
		var yPos:int
		yPos=randi_range(0,232)
		rock.rotation_degrees=180
		rock.position=Vector2(1300,yPos)
	add_child(rock)
	
func _onRockEntered():
	gameOver()
	pass

func gameOver():
	gameover.play()
	get_tree().paused=true
	player.queue_free()
	get_tree().call_group("rock","queue_free")
	ui.get_node("GameOverContainer").show()
	pass
	
func _onBtnMenuPressed():
	get_tree().paused=false
	get_tree().change_scene_to_file("res://src/UI/menu.tscn")
	
	
func _onBtnRetryPressed():
	get_tree().paused=false
	get_tree().reload_current_scene()
	pass
