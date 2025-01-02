extends RefCounted
class_name State
var stateMachine=null
var agent:Node:
	get:
		assert(stateMachine and stateMachine.agent,'状态机或代理未指定！')
		return stateMachine.agent

func _init(stateMachineName:StateMachine) -> void:
	stateMachine=stateMachineName
	
func enter(_msg:Dictionary={})->void:
	
	pass
	
func exit()->void:
	
	pass
	
	
func update(delta:float)->void:
	pass

func transitionTo(stateIndex:int,_msg:Dictionary={})->void:
	exit()
	stateMachine.currentStateIndex=stateIndex
	stateMachine.currentState.enter(_msg)
	pass
