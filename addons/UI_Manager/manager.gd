tool
extends EditorPlugin

var _print_prefix = "\tAddon:UI_Manager | manager.gd"

func _enter_tree():
	add_autoload_singleton("UI_Manager", "res://addons/UI_Manager/UI_Manager.gd")
	print("%s _enter_tree, add_autoload_singleton UI_Manager"%[_print_prefix])
	pass


func _exit_tree():
	if Engine.has_singleton("UI_Manager"): remove_autoload_singleton("UI_Manager")
	print("%s _exit_tree, remove_autoload_singleton UI_Manager"%[_print_prefix])
	pass
