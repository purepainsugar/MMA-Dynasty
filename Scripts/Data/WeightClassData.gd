class_name WeightClassData
extends Resource

@export_category("Identity")
@export var weight_class_id: String = ""
@export var promotion: PromotionData
@export var name: String = ""
@export var abbreviation: String = ""
@export var weight_limit_lbs: int = 155

@export_category("Rankings")
@export var champion: FighterData
@export var ranking_size: int = 15
@export var ranked_fighters: Array[FighterData] = []
@export var unranked_fighters: Array[FighterData] = []

@export_category("Status")
@export var is_active: bool = true


func get_display_name() -> String:
	if promotion == null:
		return name
	
	return promotion.abbreviation + " " + name


func get_champion_text() -> String:
	if champion == null:
		return "No Champion"
	
	return champion.get_display_name()


func get_ranked_fighter(rank: int) -> FighterData:
	if rank <= 0:
		return null
	
	var index := rank - 1
	
	if index >= ranked_fighters.size():
		return null
	
	return ranked_fighters[index]


func get_ranking_line(rank: int) -> String:
	var fighter := get_ranked_fighter(rank)
	
	if fighter == null:
		return "#" + str(rank) + " Vacant"
	
	return "#" + str(rank) + " " + fighter.get_display_name()
