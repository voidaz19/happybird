extends Node
class_name StateMachine
var currentState:State:
	get:
		return states[currentStateIndex]
var currentStateIndex:int=0
var states:Dictionary={}
var values:Dictionary={}
##状态机代理
@export var agent:Node

func _ready() -> void:

	pass
	
func _enter_tree() -> void:
	self.process_mode=Node.PROCESS_MODE_ALWAYS
	
func _process(delta: float) -> void:
	currentState.update(delta)
	pass

func launchState(stateIndex:int)->void:
	assert(agent,"必须指定代理节点！")
	#currentState=states[stateIndex]
	currentState.enter()
	pass

func addState(stateIndex:int,state:State)->void:
	states[stateIndex]=state

func setValue(name:String,value:Variant)->void:
	values[name]=value
	pass

func getValue(name:String)->Variant:
	if values.has(name):
		return values[name]
	return null
	
