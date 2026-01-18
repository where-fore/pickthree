extends CanvasLayer

@onready var player_health_label = $Stats/Player/Stats/Health/HBoxContainer/Label as Label
@onready var enemy_health_label = $Stats/Enemy/Stats/Health/HBoxContainer/Label as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HudEvents.player_damaged.connect(update_player_health)
	HudEvents.enemy_damaged.connect(update_enemy_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_player_health(delta):
	update_label(player_health_label, delta)
	
func update_enemy_health(delta):
	update_label(enemy_health_label, delta)
	
func update_label(label, delta):
	label.text = str(int(label.text) + delta)
