class_name PromotionData
extends Resource

@export_category("Identity")
@export var promotion_id: String = ""
@export var name: String = ""
@export var abbreviation: String = ""
@export var region: String = ""

@export_category("Status")
@export var prestige: int = 75
@export var is_active: bool = true

@export_category("Presentation")
@export var primary_color: Color = Color(0.6, 0.05, 0.05)
@export var secondary_color: Color = Color(0.05, 0.05, 0.05)
@export var logo_seed: String = ""

@export_category("Description")
@export_multiline var description: String = ""


func get_display_name() -> String:
	if abbreviation == "":
		return name
	
	return abbreviation + " - " + name
