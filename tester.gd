extends Control

var strings = []
var string_it = 0
# Because they/them changes removes an s (she likes, they like) and switches is to are this toggle is used along with the random pronoun function to dictate when these changes are needed
var they_switch = false

var user_name = Globals.name_pick
# Subject = they
var subject
# Object = them
var object
# Possessive adjective = their
var possessive_adj
# Possessive pronoun = theirs
var possessive_pro
# Reflexive = themselves
var reflexive
# Common contraction = they're
var common_cont
# Incluse s = "" (if her then "she likes", so Include s would be "s", if they then "they like" so Include s would be "")
var include_s
# Verb = are (if her then "she is" so Verb would be "is", if they then "they are" so Verb would be "are")
var verb
# Verb contraction = aren't (if she then "isn't she" so Verb contraction would be isn't, if they then "aren't they" so Verb contraction would be "aren't")
var verb_cont 

func _ready():
	strings = [
		"Hiya, {0}, how are you?".format([user_name.capitalize()]),
		"Hey, have you met {0}? {1} awesome!".format([user_name.capitalize(), pronoun_random("common_cont").capitalize()]),
		"This is {0}. {1} new here and I wanted {2} to meet some new people. Fun fact: {3} like{4} cool people and {5} looking to introduce {6} to more!".format([user_name.capitalize(), pronoun_random("common_cont").capitalize(), pronoun_random("object"), pronoun_random("subject").capitalize(), pronoun_random("include_s"), pronoun_random("verb"), pronoun_random("reflexive")]),
		"Hey, {0}, I hear you use {1}/{2}. I'll do my best to remember but please be patient with me.".format([user_name.capitalize(), pronoun_random("subject"), pronoun_random("object")]),
		"That's {0} over there, {1} {2} amazing?!".format([user_name.capitalize(), pronoun_random("verb_cont"), pronoun_random("subject")]),
		"Welcome, {0}. I made you a {1}/{2} badge but you don't have to wear it if you don't want to.".format([user_name.capitalize(), pronoun_random("subject"), pronoun_random("object")]),
		"Ask {0}, {1} can tell you more; {2} an expert and {3} sure to be able to help.".format([user_name.capitalize(), pronoun_random("subject"), pronoun_random("common_cont"), pronoun_random("verb")]),
		"Have you checked in on {0} recently? I haven't spoken to {1} in a while and I know {2} going through some stuff. Not for me to say what's up with {3}, though; {4} can tell you {5}.".format([user_name.capitalize(), pronoun_random("object"), pronoun_random("common_cont"), pronoun_random("object"), pronoun_random("subject"), pronoun_random("reflexive")])
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
	
func pronoun_random(request):
	# Reset random seed for each call
	randomize()
	# Select a pronoun set from those chosen at random
	var i = randi_range(0, Globals.pronoun_pick.size()-1)
	var pronoun_set = Globals.pronoun_pick[i]
	# pronoun_set 0 is they/them, set they_switch accordingly
	they_switch = true if pronoun_set == 0 and request not in ["include_s","verb","verb_cont"] else false
	
	var response
	#--Return the requested pronoun type based on the pronoun_set picked at random from those selected at the point that this function is called
	if request == "subject": response = Globals.pronouns[pronoun_set]["subject"]
	# Object = them
	if request == "object": response = Globals.pronouns[pronoun_set]["object"]
	# Possessive adjective = their
	if request == "possessive_adj": response = Globals.pronouns[pronoun_set]["possessive_adj"]
	# Possessive pronoun = theirs
	if request == "possessive_pro": response = Globals.pronouns[pronoun_set]["possessive_pro"]
	# Reflexive = themselves
	if request == "reflexive": response = Globals.pronouns[pronoun_set]["reflexive"]
	# Common contraction = they're
	if request == "common_cont": response = Globals.pronouns[pronoun_set]["common_cont"]
	
	#--Return things like is if they_switch is false (the last used pronoun set was not they/them), or are if it was true (they last used set *was* they/them)
	# Include s = "" (if her then "she likes", so Include s would be "s", if they then "they like" so Include s would be "")
	if request == "include_s" and they_switch == true : response = ""
	if request == "include_s" and they_switch == false : response = "s"
	# Verb = are (if her then "she is" so Verb would be "is", if they then "they are" so Verb would be "are")
	if request == "verb" and they_switch == true : response = "are"
	if request == "verb" and they_switch == false : response = "is"
	# Verb contraction = aren't (if she then "isn't she" so Verb contraction would be isn't, if they then "aren't they" so Verb contraction would be "aren't")
	if request == "verb_cont" and they_switch == true : response = "aren't"
	if request == "verb_cont" and they_switch == false : response = "isn't"
	
	return response
