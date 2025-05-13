extends Control

var user_name = Globals.name_pick
var subject = Globals.pronouns[Globals.pronoun_pick]["subject"]
var object = Globals.pronouns[Globals.pronoun_pick]["object"]
var possessive_adj = Globals.pronouns[Globals.pronoun_pick]["possessive_adj"]
var possessive_pro = Globals.pronouns[Globals.pronoun_pick]["possessive_pro"]
var reflexive = Globals.pronouns[Globals.pronoun_pick]["reflexive"]
var common_cont = Globals.pronouns[Globals.pronoun_pick]["common_cont"]
var include_s = Globals.pronouns[Globals.pronoun_pick]["include_s"]
var verb = Globals.pronouns[Globals.pronoun_pick]["verb"]

var strings = [
	"Hiya, {0}, how are you?".format([user_name.capitalize()]),
	"Hey, have you met {0}? {1} awesome!".format([user_name.capitalize(), common_cont.capitalize()]),
	"This is {0}. {1} new here and I wanted {2} to meet some new people. Fun fact: {3} like{4} cool people and {5} looking to introduce {6} to more!".format([user_name.capitalize(), common_cont.capitalize(), object, subject.capitalize(), include_s, verb, reflexive])
	]

var string_it = 0
func _ready():
	$VBoxContainer/Label.text = strings[string_it]


func _on_restart_button_up() -> void:
	get_tree().change_scene_to_file("res://start.tscn")


func _on_next_button_up() -> void:
	if string_it < len(strings)-1:
		string_it += 1
	else:
		string_it = 0
	$VBoxContainer/Label.text = strings[string_it]
	$VBoxContainer/HBoxContainer/Next.release_focus()
