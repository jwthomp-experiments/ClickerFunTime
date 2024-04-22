class_name LabelCorn
extends Label
## Display the current amount of stardust available

## Run every tick and update the corn label text
func _process(_delta: float) -> void:
	update_text()


## Update the User Interface Corn Label with the correct text and corn value
func update_text() -> void:
	text = "Corn : %s" %Game.ref.data.corn
