extends CanvasLayer

@export var characters : PackedScene

@onready var btn_ready = $"btn-middle-aling/ready_btn"
@onready var character = characters.instantiate()
@onready var img_char_1 = $player_1/img_char_1; @onready var img_char_2 = $player_2/img_char_2

@onready var chars : Array

var btn_char : Button
var player_1_selc : bool
var player_2_selc : bool
var selected_1 : bool = false

func _ready():


	get_parent().add_child.call_deferred(character)

	# bucle para asignarle los personajes al array "chars"
	for i in range(0, character.get_child_count(), 1):
		chars.append(character.get_child(i))

	btn_ready.disabled = true
	btn_character()

func btn_character():
	# bucle para obtener los elementos del array "chars"

	
		for i in range(0, chars.size(), 1):

				chars[i].visible = false
				# se crea un boton por cada elemento del array
				btn_char = Button.new()
				# aca se define que el nombre del boton y el texto del mismo es igual al nombre nodo del character
				btn_char.name = chars[i].name; btn_char.text = chars[i].name
				btn_char.add_theme_font_size_override("font_size", 30)

				# se conecta la señal "pressed" de los botones con el script al que pertenece este nodo
				# tambien asigna al boton un argumento segun el elemento del array
				btn_char.pressed.connect(self.on_btn_char_pressed.bind(i, btn_char))

				$btn_char_container.get_child(0).add_child(btn_char)
		

func on_btn_char_pressed(btn_array, btn):

	player_1_selc = true

	if player_1_selc:

		btn.pressed.disconnect(self.on_btn_char_pressed) ; btn.pressed.connect(self.on_btn_nslc_pressed.bind(btn_array, btn))

		print(str(btn_array) + "" + "_pressed")
		var img_char = chars[btn_array].get_node("TextureRect")

		img_char_1.texture = img_char.get_texture()


		on_players_ready()

func on_players_ready():
	
	if player_1_selc == false:
		btn_ready.disabled = true
	else:
		btn_ready.disabled = false
	

func on_btn_nslc_pressed(btn_array, btn):

	player_1_selc = false

	if not player_1_selc:
		img_char_1.texture = null

		btn.pressed.disconnect(self.on_btn_nslc_pressed.bind(btn_array, btn))

	for i in range(0, chars.size(), 1):

		if not $btn_char_container.get_child(0).get_child(i).pressed.is_connected(self.on_btn_char_pressed.bind(i, btn_char)):
			print("boton " + str(i) + " no conectado")
			$btn_char_container.get_child(0).get_child(i).pressed.connect(self.on_btn_char_pressed.bind(i, btn_char))
			
	print("No character selected")


# de suma importancia: i.pressed.connect(_on_button_pressed.bind(i))


