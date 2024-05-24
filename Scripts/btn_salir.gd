extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.on_btn_out_pressed)
	
	
func on_btn_out_pressed():
	
	get_tree().quit()

