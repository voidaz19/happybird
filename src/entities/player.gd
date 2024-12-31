extends CharacterBody2D
@export var jumpSpeed:int =-400
@export var gravity:int=ProjectSettings.get_setting("physics/2d/default_gravity")
var minAngle=-45
var maxAngle=45
@export var minSpeed=-400
@export var maxSpeed=400
signal screenExited
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _physics_process(delta: float) -> void:
	velocity.y+=gravity*delta
	velocity=velFix(velocity)
	var targetAngle=clamp(velocity.y/gravity*maxAngle,minAngle,maxAngle)
	rotation_degrees=targetAngle
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly"):
		velocity.y+=jumpSpeed
		audio_stream_player.play()

func velFix(vel:Vector2) ->Vector2:
	vel.y=clamp(vel.y,minSpeed,maxSpeed)
	return vel
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	screenExited.emit()
	pass # Replace with function body.
