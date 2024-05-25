extends CanvasLayer

@export var characters : PackedScene

func _ready():
	btn_character()

func btn_character():

	var character = characters.instantiate()

	var chars_1 = [
		character.get_node("kata")
	]

	for i in range(0, chars_1.size(), 1):

		chars_1[i].visible = false
		
		var btn_char = Button.new()
		btn_char.name = str(i)

		btn_char.pressed.connect(self.on_btn_char_pressed.bind(i))

		print(i)

		add_child(btn_char)

	add_child(character)

func on_btn_char_pressed(btn):

	print(str(btn) + "_pressed")



# de suma importancia: i.pressed.connect(_on_button_pressed.bind(i))


