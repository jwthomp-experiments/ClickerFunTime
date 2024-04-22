class_name View
extends Control
## Abstract class defining a view.

## Reference to the user interface
@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views

## Called when ready to connect to navigation signal
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)


## Handle Navigation Request Signal
func _on_navigation_request(requested_view : UserInterface.Views):
	if requested_view == view:
		visible = true
	else:
		visible = false
