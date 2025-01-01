extends Node
class_name BaseStateMachine
var currentState:BaseState
var currentStateIndex:int=0
var states:Dictionary={}
@export var agent:Node

func _ready() -> void:
	#currentState=BaseState.new()
	pass
func _enter_tree() -> void:
	self.process_mode=Node.PROCESS_MODE_ALWAYS
	
func _process(delta: float) -> void:
	#currentState.update(delta)
	pass

func launchState(stateIndex:int)->void:
	assert(agent,"必须指定代理节点！")
	currentState=states[stateIndex]
	currentState.enter()
	pass

func addState(stateIndex:int,state:BaseState)->void:
	states[stateIndex]=state
