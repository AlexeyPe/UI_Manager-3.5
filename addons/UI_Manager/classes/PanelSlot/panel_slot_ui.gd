tool
extends PanelContainer

var Margin_width_border_1:NodePath = "Margin_width_border_1"
var Margin_width_border_2:NodePath = "Margin_width_border_1/panel_border_2/Margin_width_border_2"
var Margin_panel_front:NodePath = "Margin_width_border_1/panel_border_2/Margin_width_border_2/Margin_panel_front"
var Panel_border_1:NodePath = "."
var Panel_border_2:NodePath = "Margin_width_border_1/panel_border_2"
var Panel_back:NodePath = "Margin_width_border_1/panel_border_2/Margin_width_border_2/Panel_back"
var Panel_front:NodePath = "Margin_width_border_1/panel_border_2/Margin_width_border_2/Margin_panel_front/Panel_front"

export(bool) var update setget set_update

export(Vector2) var border_radius_1_top_left_right = Vector2(8,8)
export(Vector2) var border_radius_1_bottom_right_left = Vector2(8,8)

export(Vector2) var border_radius_2_top_left_right = Vector2(7,7)
export(Vector2) var border_radius_2_bottom_right_left = Vector2(7,7)

export(Vector2) var border_radius_3_top_left_right = Vector2(5,5)
export(Vector2) var border_radius_3_bottom_right_left = Vector2(5,5)

export(Vector2) var border_radius_4_top_left_right = Vector2(5,5)
export(Vector2) var border_radius_4_bottom_right_left = Vector2(5,5)

export(Vector2) var border_width_1_left_right = Vector2(3,3)
export(Vector2) var border_width_1_top_bottom = Vector2(3,3)

export(Vector2) var border_width_2_left_right = Vector2(4,4)
export(Vector2) var border_width_2_top_bottom = Vector2(4,4)

export(Vector2) var margin_content_left_right = Vector2(4,4)
export(Vector2) var margin_content_top_bottom = Vector2(4,10)

export var front_gradient:GradientTexture2D
export var back_gradient:GradientTexture2D

func set_update(new):
	if !has_node(Margin_width_border_1):return
	if !has_node(Margin_width_border_2):return
	
	__set_border_radius(Panel_border_1, border_radius_1_top_left_right, border_radius_1_bottom_right_left)
	__set_border_radius(Panel_border_2, border_radius_2_top_left_right, border_radius_2_bottom_right_left)
	__set_border_radius(Panel_back, border_radius_3_top_left_right, border_radius_3_bottom_right_left)
	__set_border_radius(Panel_front, border_radius_4_top_left_right, border_radius_4_bottom_right_left)
	
	__set_margin(Margin_width_border_1, border_width_1_left_right, border_width_1_top_bottom)
	__set_margin(Margin_width_border_2, border_width_2_left_right, border_width_2_top_bottom)
	__set_margin(Margin_panel_front, margin_content_left_right, margin_content_top_bottom)

	set_shader_gradient(Panel_back, back_gradient)
	set_shader_gradient(Panel_front, front_gradient)
	pass

func set_shader_gradient(path:NodePath, gradient:GradientTexture2D):
#	print("set_shader_gradient(path:%s, gradient:%sl)"%[path, gradient])
	get_node(path).material.set_shader_param("gradient", gradient)
	pass

func __set_margin(path:NodePath, left_right:Vector2, top_bottom:Vector2):
	get_node(path).add_constant_override("margin_top", top_bottom.x)
	get_node(path).add_constant_override("margin_left", left_right.x)
	get_node(path).add_constant_override("margin_bottom", top_bottom.y)
	get_node(path).add_constant_override("margin_right", left_right.y)
	pass

func __set_border_radius(path:NodePath, top_left_right:Vector2, bottom_right_left:Vector2):
#	print("__set_border_radius(path:%s, top_left_right:%s, bottom_right_left:%s)"%[path, top_left_right, bottom_right_left])
	get_node(path).get("custom_styles/panel").set_corner_radius_individual(top_left_right.x, top_left_right.y, bottom_right_left.x, bottom_right_left.y)
