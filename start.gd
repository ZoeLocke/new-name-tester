extends Control

func _ready():
	# Clear choices
	$VBoxContainer/VBoxContainer/LineEdit.text = ""
	#$VBoxContainer/VBoxContainer/OptionButton.selected = -1
	Globals.name_pick = ""
	Globals.pronoun_pick = []
	#Set inital focus and disable button (as it won't work until both fields are populated
	$VBoxContainer/VBoxContainer/LineEdit.grab_focus()
	$VBoxContainer/Button.disabled = true
	

func _on_line_edit_text_changed(new_text: String) -> void:
	if $VBoxContainer/VBoxContainer/ItemList.is_anything_selected():
		$VBoxContainer/Button.disabled = false

func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	if $VBoxContainer/VBoxContainer/LineEdit.text != "":
		$VBoxContainer/Button.disabled = false
	$VBoxContainer/Button.grab_focus()

func _on_button_button_up() -> void:
	Globals.name_pick = $VBoxContainer/VBoxContainer/LineEdit.text
	Globals.pronoun_pick = $VBoxContainer/VBoxContainer/ItemList.get_selected_items()
	print(Globals.pronoun_pick)
	get_tree().change_scene_to_file("res://tester.tscn")


func _on_line_edit_focus_entered() -> void:
	$VBoxContainer/VBoxContainer/LineEdit.editable = true


#func _on_item_list_focus_entered() -> void:
	#$VBoxContainer/VBoxContainer/ItemList.show_popup()
