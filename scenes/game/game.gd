class_name Game
extends Node
## Main node of the game.

# Singleton Reference
# All instances of the Game class use this same variable due to the
# `static` keyword.
static var ref : Game

## Contains the data resource class which saves and loads game state
var data : Data

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

	# First initialization of Game Singleton, so setup data resources
	data  = Data.new()
