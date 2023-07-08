tool
extends Button
class_name ButtonSlot

export(String) var btn_name

func _pressed():
	UI_Manager.emit_signal("on_pressed_btn", btn_name, {})
	pass
	
func _enter_tree():
	flat = true
