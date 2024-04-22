class_name PrototypeGenerator
extends Control
## Generator prototype creating corn every second

## Reference to the label displaying the amount of corn in storage
@export var label : Label

## Reference to the button that starts the corn genration
@export var button : Button

## Reference to the timer that fires every second to generate cord
@export var timer : Timer

## Reference to the user interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Initialize the label
func _ready() -> void:
	update_label_text()

	user_interface.navigation_requested.connect(_on_navigation_request)

	visible = false


func _process(_delta: float) -> void:
	update_label_text()


## Creates corn and store it
func create_corn() -> void:
	Game.ref.data.corn += 1


## Updates the label text to match the current amount of corn in storage
func update_label_text() -> void:
	label.text = "Corn : %s" %Game.ref.data.corn


## Start the timer and disable the start timer button
func begin_generating_corn() -> void:
	timer.start()
	button.disabled = true


## Triggered when the button is pressed
func _on_button_pressed() -> void:
	begin_generating_corn()


## Triggered when the timer times out
func _on_timer_timeout() -> void:
	create_corn()


## Handle Navigation Request Signal
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
	else:
		visible = false
