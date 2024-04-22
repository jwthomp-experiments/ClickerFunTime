class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases corn created by the clicker


func _init() -> void:
	title = "Clicker Upgrade"
	base_cost = 5
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
