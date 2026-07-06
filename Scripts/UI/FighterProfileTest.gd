extends Control

@export var fighter_data: FighterData

@onready var fighter_card: Panel = find_child("FighterCard", true, false) as Panel
@onready var age_country_label: Label = find_child("AgeCountryLabel", true, false) as Label
@onready var style_label: Label = find_child("StyleLabel", true, false) as Label
@onready var role_label: Label = find_child("RoleLabel", true, false) as Label
@onready var story_label: Label = find_child("StoryLabel", true, false) as Label


func _ready() -> void:
	update_display()


func update_display() -> void:
	if fighter_data == null:
		_set_empty_display()
		return
	
	if fighter_card != null:
		fighter_card.fighter_data = fighter_data
		fighter_card.update_display()
	
	if age_country_label != null:
		age_country_label.text = "Age " + str(fighter_data.age) + " | " + fighter_data.country
	
	if style_label != null:
		style_label.text = "Style: " + fighter_data.style + " | " + fighter_data.archetype
	
	if role_label != null:
		role_label.text = "Role: " + fighter_data.role
	
	if story_label != null:
		story_label.text = "Story: " + fighter_data.story_use


func _set_empty_display() -> void:
	if age_country_label != null:
		age_country_label.text = "No fighter selected"
	
	if style_label != null:
		style_label.text = "Style: TBD"
	
	if role_label != null:
		role_label.text = "Role: TBD"
	
	if story_label != null:
		story_label.text = "Story: TBD"
