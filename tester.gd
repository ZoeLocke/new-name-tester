extends Control

var strings = []

var string_it = 0
func _ready():
	var pronoun_list = []
	
		
	var user_name = Globals.name_pick
	# Subject = they
	var subject = Globals.pronouns[Globals.pronoun_pick]["subject"]
	# Object = them
	var object = Globals.pronouns[Globals.pronoun_pick]["object"]
	# Possessive adjective = their
	var possessive_adj = Globals.pronouns[Globals.pronoun_pick]["possessive_adj"]
	# Possessive pronoun = theirs
	var possessive_pro = Globals.pronouns[Globals.pronoun_pick]["possessive_pro"]
	# Reflexive = themselves
	var reflexive = Globals.pronouns[Globals.pronoun_pick]["reflexive"]
	# Common contraction = they're
	var common_cont = Globals.pronouns[Globals.pronoun_pick]["common_cont"]
	# Incluse s = "" (if her then "she likes", so Include s would be "s", if they then "they like" so Include s would be "")
	var include_s = Globals.pronouns[Globals.pronoun_pick]["include_s"]
	# Verb = are (if her then "she is" so Verb would be "is", if they then "they are" so Verb would be "are")
	var verb = Globals.pronouns[Globals.pronoun_pick]["verb"]
	# Verb contraction = aren't (if she then "isn't she" so Verb contraction would be isn't, if they then "aren't they" so Verb contraction would be "aren't")
	var verb_cont = Globals.pronouns[Globals.pronoun_pick]["verb_cont"]

	strings = [
		"Hiya, {0}, how are you?".format([user_name.capitalize()]),
		"Hey, have you met {0}? {1} awesome!".format([user_name.capitalize(), common_cont.capitalize()]),
		"This is {0}. {1} new here and I wanted {2} to meet some new people. Fun fact: {3} like{4} cool people and {5} looking to introduce {6} to more!".format([user_name.capitalize(), common_cont.capitalize(), object, subject.capitalize(), include_s, verb, reflexive]),
		"Hey, {0}, I hear you use {1}/{2}. I'll do my best to remember but please be patient with me.".format([user_name.capitalize(), subject, object]),
		"That's {0} over there, {1} {2} amazing?!".format([user_name.capitalize(), verb_cont, subject]),
		"Welcome, {0}. I made you a {1}/{2} badge but you don't have to wear it if you don't want to.".format([user_name.capitalize(), subject, object]),
		"Ask {0}, {1} can tell you more; {2} an expert and {3} sure to be able to help.".format([user_name.capitalize(), subject, common_cont, verb]),
		"Have you checked in on {0} recently? I haven't spoken to {1} in a while and I know {2} going through some stuff. Not for me to say what's up with {3}, though; {4} can tell you {5}.".format([user_name.capitalize(), object, common_cont, object, subject, reflexive])
		]
		
	$VBoxContainer/Label.text = strings[string_it]
	$VBoxContainer/HBoxContainer/Next.grab_focus()


func _on_restart_button_up() -> void:
	get_tree().change_scene_to_file("res://start.tscn")


func _on_next_button_up() -> void:
	if string_it < len(strings)-1:
		string_it += 1
	else:
		string_it = 0
		$VBoxContainer/HBoxContainer/Restart.grab_focus()
	$VBoxContainer/Label.text = strings[string_it]
