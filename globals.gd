extends Node

var name_pick = "Zoe"
var pronoun_pick = 0
#Pronouns dict - ID : {forms} 
const pronouns = {
	0 : {
		"subject" : "they",
		"object" : "them",
		"possessive_adj" : "their",
		"possessive_pro" : "theirs",
		"reflexive" : "themselves",
		"common_cont" : "they're",
		"include_s" : "",
		"verb" : "are",
		"verb_cont" : "aren't"
	},
	1 : {
		"subject" : "she",
		"object" : "her",
		"possessive_adj" : "her",
		"possessive_pro" : "hers",
		"reflexive" : "herself",
		"common_cont" : "she's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	2 : {
		"subject" : "he",
		"object" : "him",
		"possessive_adj" : "his",
		"possessive_pro" : "his",
		"reflexive" : "himself",
		"common_cont" : "he's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	3 : {
		"subject" : "xi",
		"object" : "xir",
		"possessive_adj" : "xir",
		"possessive_pro" : "xirs",
		"reflexive" : "xirself",
		"common_cont" : "xi's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	4 : {
		"subject" : "fae",
		"object" : "faer",
		"possessive_adj" : "faer",
		"possessive_pro" : "faers",
		"reflexive" : "faerself",
		"common_cont" : "fae's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	5 : {
		"subject" : "xe",
		"object" : "xem",
		"possessive_adj" : "xyr",
		"possessive_pro" : "xyrs",
		"reflexive" : "xemself",
		"common_cont" : "xe's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	6 : {
		"subject" : "ze",
		"object" : "zir",
		"possessive_adj" : "zir",
		"possessive_pro" : "zirs",
		"reflexive" : "zirself",
		"common_cont" : "ze's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	7 : {
		"subject" : "ey",
		"object" : "em",
		"possessive_adj" : "eir",
		"possessive_pro" : "eirs",
		"reflexive" : "emself",
		"common_cont" : "ey's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	8 : {
		"subject" : "ve",
		"object" : "ver",
		"possessive_adj" : "vis",
		"possessive_pro" : "vers",
		"reflexive" : "verself",
		"common_cont" : "ve's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	},
	9 : {
		"subject" : "ne",
		"object" : "nem",
		"possessive_adj" : "nir",
		"possessive_pro" : "nirs",
		"reflexive" : "nemself",
		"common_cont" : "ne's",
		"include_s" : "s",
		"verb" : "is",
		"verb_cont" : "isn't"
	}
}
