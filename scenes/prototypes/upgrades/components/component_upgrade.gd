class_name ComponentUpgrade
extends Control
## Component displaying an upgrade

## Reference to the title label
@export var label_title : Label
## Reference to the Rich text description box
@export var label_description : RichTextLabel
## Reference to the purchase upgrad button
@export var purchase_button : Button

## Upgrade to display in this component
var upgrade : Upgrade


func _ready() -> void:
	# Instantiate the upgrade script
	upgrade = Up01ClickerUpgrade.new()

	# Initialize our exports
	update_label_title()
	update_label_description()
	update_button()

	# Create signal handlers
	HandlerCorn.ref.corn_created.connect(update_button)
	HandlerCorn.ref.corn_consumed.connect(update_button)

	# Connect to the signals
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)


## Updates the title of the upgrade
func update_label_title() -> void:
	label_title.text = upgrade.title + " (%s)" %upgrade.level()


## Updates the description of the upgrade
func update_label_description() -> void:
	label_description.text = upgrade.description()


## Updates the buttons availability based on whether the upgrade can be afforded
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford_upgrade():
		purchase_button.disabled = false
	else:
		purchase_button.disabled = true



## Triggered by purchase button press
func _on_purchase_button_pressed() -> void:
	upgrade.level_up() # Replace with function body.
