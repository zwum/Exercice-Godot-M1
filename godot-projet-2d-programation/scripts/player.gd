class_name Personnage
extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var perso

func _ready() -> void:
	SignalBus.bodyEnter.connect(_on_area_2d_body_entered)
	SignalBus.bodyExit.connect(_on_area_2d_body_exited)

func _physics_process(delta: float) -> void:
	var vitesse=SPEED
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	if Input.is_action_pressed("sprint"):
		vitesse = SPEED*2
	if directionX or  directionY:
		velocity.x = directionX * vitesse
		velocity.y = directionY * vitesse
	else:
		velocity.x = move_toward(velocity.x, 0, vitesse)
		velocity.y = move_toward(velocity.y, 0, vitesse)
	move_and_slide()
	
	if perso!=null:
		$Label.text=perso.joueurTexte


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.get_class())
	
	if body.is_class("CharacterBody2D"):
		$Label.show()
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("oh revoir")
	if body.is_class("CharacterBody2D"):
		$Label.hide()
