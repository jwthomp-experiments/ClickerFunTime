class_name PrototypeClicker
extends View
## This is the main entrypoint script for the clicker game scene

## The label that gets updated with the amount of corn harvested
@export var label : Label


## Called when ready, and initializes the label
func _ready() -> void:
	super()
	visible = false
	HandlerCorn.ref.corn_created.connect(update_label_text)
	HandlerCorn.ref.corn_consumed.connect(update_label_text)
	update_label_text()


## Creates a harvested unit of corn and triggers an update
func harvest_corn() -> void:
	HandlerCorn.ref.create_corn(1 + Game.ref.data.up_01_level)


## Signal handler for a button press that should trigger corn to be harvested
func _on_button_pressed() -> void:
	harvest_corn()


## Updates the label text with the amount of corn harvested
func update_label_text(_quantity: int = -1) -> void:
	label.text = "Corn Harvested: %s" %HandlerCorn.ref.corn()


