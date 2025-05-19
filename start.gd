extends Control

func _ready():
	# Clear choices
	$VBoxContainer/VBoxContainer/LineEdit.text = ""
	$VBoxContainer/VBoxContainer/ItemList.deselect_all()
	Globals.name_pick = ""
	Globals.pronoun_pick = []
	#Set inital focus and disable button (as it won't work until both fields are populated
	$VBoxContainer/VBoxContainer/LineEdit.grab_focus()
	$VBoxContainer/Button.disabled = true

func _process(delta: float) -> void:
	if $VBoxContainer/VBoxContainer/ItemList.is_anything_selected() and $VBoxContainer/VBoxContainer/LineEdit.text != "":
		$VBoxContainer/Button.disabled = false

# Proceed to next screen
func _on_button_button_up() -> void:
	Globals.name_pick = $VBoxContainer/VBoxContainer/LineEdit.text
	Globals.pronoun_pick = $VBoxContainer/VBoxContainer/ItemList.get_selected_items()
	get_tree().change_scene_to_file("res://tester.tscn")

# Allow selection of items using the Enter button
func _on_item_list_item_activated(index: int) -> void:
	if $VBoxContainer/VBoxContainer/ItemList.is_selected(index):
		$VBoxContainer/VBoxContainer/ItemList.deselect(index)
	else:
		$VBoxContainer/VBoxContainer/ItemList.select(index, false)
