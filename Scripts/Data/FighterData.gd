class_name FighterData
extends Resource

@export_category("Identity")
@export var fighter_id: String = ""
@export var first_name: String = ""
@export var last_name: String = ""
@export var nickname: String = ""
@export var age: int = 25
@export var country: String = ""

@export_category("Career")
@export var promotion: String = "WFC"
@export var division: String = "Lightweight"
@export var role: String = ""
@export var is_champion: bool = false
@export var ranking: int = 0

@export_category("Record")
@export var wins: int = 0
@export var losses: int = 0
@export var draws: int = 0
@export var no_contests: int = 0

@export_category("Fighting Style")
@export var style: String = ""
@export var archetype: String = ""
@export var stance: String = "Orthodox"

@export_category("Ratings")
@export var overall: int = 70
@export var potential: int = 70

@export_category("Presentation")
@export var look_description: String = ""
@export var personality_hook: String = ""
@export var story_use: String = ""
@export var portrait_seed: String = ""


func get_display_name() -> String:
	var full_name := first_name + " " + last_name
	
	if nickname == "":
		return full_name
	
	return first_name + " \"" + nickname + "\" " + last_name


func get_record_text() -> String:
	var record := str(wins) + "-" + str(losses)
	
	if draws > 0:
		record += "-" + str(draws)
	
	if no_contests > 0:
		record += " (" + str(no_contests) + " NC)"
	
	return record


func get_ranking_text() -> String:
	if is_champion:
		return "Champion"
	
	if ranking > 0:
		return "#" + str(ranking)
	
	return "Unranked"


func get_short_summary() -> String:
	return get_display_name() + " | " + get_record_text() + " | " + get_ranking_text()
