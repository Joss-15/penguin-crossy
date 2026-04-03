extends CanvasLayer

# ── Referencias a los nodos del HUD ───────────────────────────
@onready var message_label: Label = $MessageLabel
@onready var attempts_label: Label = $AttemptsLabel

# Temporizador para ocultar el mensaje
var message_timer: float = 0.0
const MESSAGE_DURATION = 3.0  # Segundos que se muestra el mensaje

func _ready():
	message_label.visible = false
	attempts_label.text = "Intentos: 0"

func _process(delta):
	# Ocultar mensaje después del tiempo definido
	if message_timer > 0:
		message_timer -= delta
		if message_timer <= 0:
			message_label.visible = false

# Mostrar mensaje de colisión y actualizar contador
func show_hit_message(attempts: int):
	message_label.text = "¡Golpeaste un NPC! Vuelves al inicio"
	message_label.visible = true
	message_timer = MESSAGE_DURATION
	attempts_label.text = "Intentos: " + str(attempts)
