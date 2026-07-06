extends Panel

@export var fighter_data: FighterData

@onready var name_label: Label = find_child("NameLabel", true, false) as Label
@onready var role_label: Label = find_child("RoleLabel", true, false) as Label
@onready var record_label: Label = find_child("RecordLabel", true, false) as Label
@onready var next_fight_label: Label = find_child("NextFightLabel", true, false) as Label


func _ready() -> void:
	update_display()


func update_display() -> void:
	if fighter_data == null:
		_set_empty_display()
		return
	
	name_label.text = fighter_data.get_display_name()
	role_label.text = fighter_data.promotion + " " + fighter_data.get_ranking_text() + " " + fighter_data.division
	record_label.text = fighter_data.get_record_text()
	next_fight_label.text = "Style: " + fighter_data.archetype


func _set_empty_display() -> void:
	name_label.text = "No Fighter"
	role_label.text = "Unassigned"
	record_label.text = "-"
	next_fight_label.text = "Style: TBD"
