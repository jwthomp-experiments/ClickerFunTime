class_name LabelCorn
extends Label
## Display the current amount of stardust available

func _ready() -> void:
	update_text()
	HandlerCorn.ref.corn_created.connect(update_text)
	HandlerCorn.ref.corn_consumed.connect(update_text)


## Update the User Interface Corn Label with the correct text and corn value
func update_text(_quantity: int = -1) -> void:
	text = "Corn : %s" %Game.ref.data.corn
