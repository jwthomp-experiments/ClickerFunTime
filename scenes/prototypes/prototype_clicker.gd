class_name PrototypeClicker
extends Control
## This is the main entrypoint script for the clicker game scene

## The label that gets updated with the amount of corn harvested
@export var label : Label

## Reference to the user interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Called when ready, and initializes the label
func _ready() -> void:
	update_label_text()

	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = false


func _process(_delta: float) -> void:
	update_label_text()


## Creates a harvested unit of corn and triggers an update
func harvest_corn() -> void:
	Game.ref.data.corn += 1


## Updates the label text with the amount of corn harvested
func update_label_text() -> void:
	label.text = "Corn Harvested: %s" %Game.ref.data.corn

## Signal handler for a button press that should trigger corn to be harvested
func _on_button_pressed() -> void:
	harvest_corn()


## Handle Navigation Request Signal
func _on_navigation_request(requested_view : UserInterface.Views):
	if requested_view == view:
		visible = true
	else:
		visible = false
