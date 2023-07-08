tool
extends PanelContainer
class_name PanelSlot

func _enter_tree():
	name = "9258f94u5937"
	var node = load("res://addons/UI_Manager/classes/PanelSlot/PanelSlot.tscn").instance()
	var root = get_tree().get_edited_scene_root()
	root.get_node(get_parent().get_path()).add_child(node) #Создаем ноду в дереве редактора
	node.owner = root #Назначаем овнером рут сцены (обязательно)

	root.get_node(get_path()).queue_free()
	node.name = "PanelSlot"
