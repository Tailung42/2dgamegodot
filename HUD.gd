extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$MessageTimer.start()
	$Message.show()


func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
