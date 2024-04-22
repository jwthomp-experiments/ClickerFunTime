class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases corn created by the clicker

## Level of the upgrade

## Text for the Title label, which is the name of the upgrade
var title : String = "Clicker Upgrade"
## The base cost of the upgrade which is used to calculate the cost / level
var base_cost : int = 5
## Current cost to upgrade
var cost : int

## Emitted when the upgrade is leveled up
signal leveled_up


func _init() -> void:
	calculate_cost()

## Returns the current level for this upgrade
func level() -> int:
	return Game.ref.data.up_01_level

## Returns the description containing effects and costs for this upgrade
func description() -> String:
	var desc : String = "Increases the amount of Corn created by the Clicker button."
	desc += "\nEffects : +1 Corn / Level"
	desc += "\nCost : %s" %cost

	return desc


## Returns the current cost to upgrade the Clicker by one level
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, Game.ref.data.up_01_level))


## Return whether or not the player can afford to upgrade
func can_afford_upgrade() -> bool:
	return HandlerCorn.ref.corn() >= cost


## Consumes corn to level up
func level_up() -> void:
	var error : Error = HandlerCorn.ref.consume_corn(cost)
	if not error:
		Game.ref.data.up_01_level += 1
		calculate_cost()
		leveled_up.emit()
