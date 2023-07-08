
extends Node

# Синглтон, для управления

# Вызывется когда ButtonSlot _pressed
signal on_pressed_btn(btn_name, data)

var _print_prefix = "\tAddon:UI_Manager | UI_Manager.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("%s _ready"%[_print_prefix])
	pass # Replace with function body.

