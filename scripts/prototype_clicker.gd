class_name PrototypeClicker
extends Control
## This is the main entrypoint script for the clicker game scene

## The label that gets updated with the amount of corn harvested
@export var label : Label

## Global scene variable that tracks the amount of corn harvested
var corn_harvested : int = 0

## Called when ready, and initializes the label
func _ready() -> void:
	update_label_text()

## Creates a harvested unit of corn and triggers an update
func harvest_corn() -> void:
	corn_harvested = corn_harvested + 1
	update_label_text()

## Updates the label text with the amount of corn harvested
func update_label_text() -> void:
	label.text = "Corn Harvested: %s" %corn_harvested

## Signal handler for a button press that should trigger corn to be harvested
func _on_button_pressed() -> void:
	harvest_corn()
