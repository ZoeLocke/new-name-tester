extends Control

func _ready():
	$VBoxContainer/VBoxContainer/LineEdit.text = ""
	$VBoxContainer/VBoxContainer/LineEdit.grab_focus()
	$VBoxContainer/VBoxContainer/OptionButton.selected = -1
	$VBoxContainer/Button.disabled = true
	Globals.name_pick = ""
	Globals.pronoun_pick = ""
	$VBoxContainer/VBoxContainer/OptionButton.get_popup().add_theme_font_size_override("font_size", 32)



func _on_line_edit_text_changed(new_text: String) -> void:
	if $VBoxContainer/VBoxContainer/OptionButton.selected != -1:
		$VBoxContainer/Button.disabled = false

func _on_option_button_item_selected(index: int) -> void:
	if $VBoxContainer/VBoxContainer/LineEdit.text != "":
		$VBoxContainer/Button.disabled = false
	$VBoxContainer/Button.grab_focus()

func _on_button_button_up() -> void:
	Globals.name_pick = $VBoxContainer/VBoxContainer/LineEdit.text
	Globals.pronoun_pick = $VBoxContainer/VBoxContainer/OptionButton.selected
	get_tree().change_scene_to_file("res://tester.tscn")


func _on_line_edit_focus_entered() -> void:
	$VBoxContainer/VBoxContainer/LineEdit.editable = true


func _on_option_button_focus_entered() -> void:
	$VBoxContainer/VBoxContainer/OptionButton.show_popup()
