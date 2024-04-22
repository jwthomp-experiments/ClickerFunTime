class_name HandlerCorn
extends Node
## Manages corn and related signals


# Singleton Reference
# All instances of the Game class use this same variable due to the
# `static` keyword.
static var ref : HandlerCorn

## Singleton Check on entering tree
func _singleton_check() -> void:
	# Makes this class a singleton
	if not ref:
		ref = self
		return
	queue_free()

## Called when Game node enters the tree
func _enter_tree() -> void:
	# Check if we have already been initialized, if so well destroy ourselves
	_singleton_check()


signal corn_created(quantity : int)
signal corn_consumed(quantity : int)

## Return the amount of corn resource that we have
func corn() -> int:
	return Game.ref.data.corn


func create_corn(quantity: int) -> void:
	Game.ref.data.corn += quantity
	corn_created.emit(quantity)


func consume_corn(quantity: int) -> Error:
	if Game.ref.data.corn < quantity:
		return Error.FAILED

	Game.ref.data.corn -= quantity
	corn_consumed.emit(quantity)

	return Error.OK
