extends Node
class_name BaseStateMachine
var currentState:BaseState
var currentStateIndex:int=0
var states:Dictionary={}

func _ready() -> void:
	currentState=BaseState.new()
	pass
func _enter_tree() -> void:
	self.process_mode=Node.PROCESS_MODE_ALWAYS
	
func _process(delta: float) -> void:
	currentState.update()
