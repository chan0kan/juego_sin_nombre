extends CharacterBody2D

var SPEED = 300.0
const JUMP_VELOCITY = -2100
const GRAVITY = 98.0

@onready var anim = $AnimatedSprite2D
var attacking = false  # Variable para rastrear si el personaje está atacando

func _ready():
	anim.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_animation_finished(anim_name):
	if anim_name == "attack":
		attacking = false  # Esto deberia reiniciar el estado de ataque cuando termina la animacion
		anim.play("stand")  # Aca probe de volver a la animacion base (parece no funcionar)

# De aca 
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY
		SPEED = 670
	else:
		SPEED = 300
		velocity.y = 0
# Hasta acá sabes lo que hace (define las propiedades del salto)

	# Manejar el ataque
	if Input.is_action_just_pressed("ui_attack") and not attacking:
		anim.play("attack")  # Aca tenia un ("attack", false) para que no se repdoduzca en bucle pero lo arregle en el nodo (y a mi me lo rompe)
		attacking = true  # Establece el estado de ataque como verdadero

	# Si la animación de ataque está en curso, no hacer nada más
	if attacking:
		return

	# Manejar el salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Manejar el movimiento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_focus_prev") and direction > 0:
		SPEED = 600

	if direction != 0:
		velocity.x = direction * SPEED

		if direction < 0:
			anim.play("walk_back")
		else:
			anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("stand")

	move_and_slide()
