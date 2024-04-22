class_name PrototypeUpgrades
extends Control
## A upgrades prototype user interface


## Reference to the user interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Called when ready, and initializes the the visibility
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_request)


## Handle Navigation Request Signal
func _on_navigation_request(requested_view : UserInterface.Views):
	if requested_view == view:
		visible = true
	else:
		visible = false
