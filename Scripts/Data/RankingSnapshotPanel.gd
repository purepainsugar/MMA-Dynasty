extends Panel

@export var weight_class_data: WeightClassData
@export var ranks_to_show: int = 5

@onready var content: Control = find_child("Content", true, false) as Control


func _ready() -> void:
	update_display()


func update_display() -> void:
	if content == null:
		push_error("RankingSnapshotPanel could not find Content.")
		return
	
	_clear_content()
	
	var stack := VBoxContainer.new()
	stack.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	stack.size_flags_vertical = Control.SIZE_EXPAND_FILL
	stack.add_theme_constant_override("separation", 6)
	content.add_child(stack)
	
	if weight_class_data == null:
		_add_label(stack, "No Weight Class Data", 16)
		return
	
	_add_label(stack, weight_class_data.get_display_name(), 16, true)
	_add_label(stack, "C " + _get_mini_name(weight_class_data.champion), 15)
	
	var count = min(ranks_to_show, weight_class_data.ranked_fighters.size())
	
	for index in range(count):
		var rank := index + 1
		var fighter := weight_class_data.ranked_fighters[index]
		
		if fighter == null:
			_add_label(stack, "#" + str(rank) + " Vacant", 15)
		else:
			_add_label(stack, "#" + str(rank) + " " + _get_mini_name(fighter), 15)


func _clear_content() -> void:
	for child in content.get_children():
		content.remove_child(child)
		child.queue_free()


func _add_label(parent: VBoxContainer, text: String, font_size: int, is_header: bool = false) -> void:
	var label := Label.new()
	label.text = text
	label.clip_text = true
	label.autowrap_mode = TextServer.AUTOWRAP_OFF
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.add_theme_font_size_override("font_size", font_size)
	
	if is_header:
		label.add_theme_color_override("font_color", Color(1.0, 0.18, 0.18))
	else:
		label.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9))
	
	parent.add_child(label)


func _get_mini_name(fighter: FighterData) -> String:
	if fighter == null:
		return "Vacant"
	
	if fighter.first_name.length() > 0:
		return fighter.first_name.substr(0, 1) + ". " + fighter.last_name
	
	return fighter.last_name
