extends Panel

@export var fighter_data: FighterData

@onready var name_label: Label = find_child("NameLabel", true, false) as Label
@onready var nickname_label: Label = find_child("NicknameLabel", true, false) as Label
@onready var division_label: Label = find_child("DivisionLabel", true, false) as Label
@onready var record_label: Label = find_child("RecordLabel", true, false) as Label
@onready var next_fight_label: Label = find_child("NextFightLabel", true, false) as Label


func _ready() -> void:
	update_display()


func update_display() -> void:
	if _missing_required_labels():
		push_error("FighterCard is missing one or more required labels.")
		return
	
	if fighter_data == null:
		_set_empty_display()
		return
	
	name_label.text = fighter_data.first_name + " " + fighter_data.last_name
	
	if fighter_data.nickname == "":
		nickname_label.text = fighter_data.country + " | Age " + str(fighter_data.age)
	else:
		nickname_label.text = "\"" + fighter_data.nickname + "\" | " + fighter_data.country + " | Age " + str(fighter_data.age)
	
	division_label.text = fighter_data.promotion + " " + fighter_data.get_ranking_text() + " " + fighter_data.division
	record_label.text = fighter_data.get_record_text()
	next_fight_label.text = fighter_data.style + " | " + fighter_data.archetype


func _missing_required_labels() -> bool:
	return (
		name_label == null
		or nickname_label == null
		or division_label == null
		or record_label == null
		or next_fight_label == null
	)


func _set_empty_display() -> void:
	name_label.text = "No Fighter"
	nickname_label.text = "Unassigned"
	division_label.text = "No Division"
	record_label.text = "-"
	next_fight_label.text = "Style: TBD"
