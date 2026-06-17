@tool
extends EditorPlugin


func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass
	
var is_running: bool = false

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_XBUTTON2:
			if not is_running:
				EditorInterface.play_main_scene()
				is_running = true
				await EditorInterface.get_base_control().get_tree().create_timer(1.0).timeout
				is_running = false
		elif event.button_index == MOUSE_BUTTON_XBUTTON1:
			if EditorInterface.is_playing_scene():
				EditorInterface.stop_playing_scene()
				get_viewport().set_input_as_handled()


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
