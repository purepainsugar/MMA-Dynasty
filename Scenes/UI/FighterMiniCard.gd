extends Panel

@export var fighter_data: FighterData

@onready var name_label: Label = find_child("NameLabel", true, false) as Label
@onready var role_label: Label = find_child("RoleLabel", true, false) as Label
@onready var record_label: Label = find_child("RecordLabel", true, false) as Label
@onready var next_fight_label: Label = find_child("NextFightLabel", true, false) as Label


func _ready() -> void:
	update_display()


func update_display() -> void:
	if name_label == null or role_label == null or record_label == null or next_fight_label == null:
		push_error("FighterMiniCard is missing one or more labels.")
		return
	
	if fighter_data == null:
		_set_empty_display()
		return
	
	name_label.text = _get_mini_name()
	role_label.text = fighter_data.promotion + " " + fighter_data.get_ranking_text() + " " + _get_division_abbreviation()
	record_label.text = fighter_data.get_record_text()
	next_fight_label.text = fighter_data.archetype


func _get_mini_name() -> String:
	if fighter_data.first_name.length() > 0:
		return fighter_data.first_name.substr(0, 1) + ". " + fighter_data.last_name
	
	return fighter_data.last_name


func _get_division_abbreviation() -> String:
	match fighter_data.division:
		"Lightweight":
			return "LW"
		"Welterweight":
			return "WW"
		"Middleweight":
			return "MW"
		"Light Heavyweight":
			return "LHW"
		"Heavyweight":
			return "HW"
		"Featherweight":
			return "FW"
		"Bantamweight":
			return "BW"
		_:
			return fighter_data.division


func _set_empty_display() -> void:
	name_label.text = "No Fighter"
	role_label.text = "Unassigned"
	record_label.text = "-"
	next_fight_label.text = "TBD"
