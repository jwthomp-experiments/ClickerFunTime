class_name PrototypeGenerator
extends View
## Generator prototype creating corn every second

## Reference to the label displaying the amount of corn in storage
@export var label : Label

## Reference to the button that starts the corn genration
@export var button : Button

## Reference to the timer that fires every second to generate cord
@export var timer : Timer


## Initialize the label
func _ready() -> void:
	super()
	visible = true
	update_label_text()
	HandlerCorn.ref.corn_created.connect(update_label_text)
	HandlerCorn.ref.corn_consumed.connect(update_label_text)



## Creates corn and store it
func create_corn() -> void:
	HandlerCorn.ref.create_corn(1)


## Updates the label text to match the current amount of corn in storage
func update_label_text(_quantity: int = -1) -> void:
	label.text = "Corn : %s" %HandlerCorn.ref.corn()


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
