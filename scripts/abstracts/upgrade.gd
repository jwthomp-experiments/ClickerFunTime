class_name Upgrade
extends Node
## Abstract class defining an upgrade.


## Emitted when the upgrade is leveled up
signal leveled_up

## Text for the Title label, which is the name of the upgrade
var title : String = "Undefined Title"
## The base cost of the upgrade which is used to calculate the cost / level
var base_cost : int = -1
## Current cost to upgrade
var cost : int = -1

## Virtual class, must be implemented
func description() -> String:
	var errmsg : String = "Virtual Class View: description() method not implemented."
	printerr(errmsg)
	return errmsg


## Virtual class, must implement upgrade cost method
func calculate_cost() -> void:
	printerr("Virtual Class View: calculate_cost() method not implemented.")


## Virtual class, must be implemented
## Return whether or not the player can afford to upgrade
func can_afford_upgrade() -> bool:
	printerr("Virtual Class View: can_afford_upgrade() method not implemented.")
	return false


## Virtual class, must be implemented
## Responsible for consuming resources and leveling up upgrade
func level_up() -> void:
	printerr("Virtual Class View: level_up() method not implemented.")
