extends StateMachine
class_name GameStateMachine

enum GAME_STATE_TYPE{
	INIT,
	READY,
	PLAYING,
	PAUSE,
	FAIL
}

class InitState:
	extends State
	func enter(_msg:Dictionary={})->void:
		agent.initGame()
		transitionTo(GAME_STATE_TYPE.READY)

class ReadyState:
	extends State
	func enter(_msg:Dictionary={})->void:
		agent.readyGame()

class PlayingState:
	extends State

class PauseState:
	extends State

class FailState:
	extends State

func _ready() -> void:
	addState(GAME_STATE_TYPE.INIT,InitState.new(self))
	addState(GAME_STATE_TYPE.READY,ReadyState.new(self))
	addState(GAME_STATE_TYPE.PLAYING,PlayingState.new(self))
	addState(GAME_STATE_TYPE.PAUSE,PauseState.new(self))
	addState(GAME_STATE_TYPE.FAIL,FailState.new(self))
	
