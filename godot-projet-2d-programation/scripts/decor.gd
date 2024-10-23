extends StaticBody2D
class_name Decor
func _ready() -> void:
	if visible==false:
		desactivate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func activate():
	show()
	$CollisionShape2D.set_deferred("disabled",false)


func desactivate():
	hide()
	$CollisionShape2D.set_deferred("disabled",true)
