	object_const_def
	const ELMSLAB_ELM

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script .WelcomeStart ; Start Welcome Script
	scene_script .DummyScene0 ; Scene_Nothing

	def_callbacks

;SCENES PAST HERE
.WelcomeStart:
    sdefer .WelcomeWalk
    end

.WelcomeWalk:
    applymovement PLAYER, WelcomeMovementPlayer
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext WelcomeText
	closetext
	applymovement ELMSLAB_ELM, ElderLeave
	playsound SFX_EXIT_BUILDING
	disappear ELMSLAB_ELM
	setevent EVENT_ELDER_GONE
	setscene SCENE_ELMSLAB_NOTHING
	end

.DummyScene0
    end

;SCRIPTS PAST HERE
Trashcan:
	jumptext TrashcanText

Bookshelf1:
	jumptext Bookshelf1Text

Bookshelf2:
	jumptext Bookshelf2Text

Bookshelf3:
	jumptext Bookshelf3Text

Bookshelf4:
	jumptext Bookshelf4Text

Bookshelf5:
	jumptext Bookshelf5Text

Bookshelf6:
	jumptext Bookshelf6Text

Bookshelf7:
	jumptext Bookshelf7Text

Bookshelf8:
	jumptext Bookshelf8Text

ElderScript:
    end

;ALL MOVEMENT PAST HERE
WelcomeMovementPlayer:
    step UP
    step UP
    turn_head UP
    step_end

ElderLeave:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step UP
    step UP
    step_end

;ALL TEXT PAST HERE
WelcomeText:
    text "<PLAY_G>!"
    line "You made it!"

    para "I was starting"
    line "to think you got"
    cont "lost."

    para "Follow me please."
    done

TrashcanText:
	text "It's a trash can.."
	line "…"

	para "Oh! There's a note"
	line "inside! It reads.."

	para "insert hint text" ; PUT IN HINT TEXT WHEN IT COMES AVAILABLE
	done

Bookshelf1Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "Think carefully"
    line "about the text"
    cont "written on the"

    para "walls in the"
    line "towers."
    done

Bookshelf2Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "The monsters in"
    line "the towers are"
    cont "spirits that"

    para "love to see"
    line "who is more"
    cont "skilled."
    done

Bookshelf3Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "Gekkou usually"
    line "like to be the"
    cont "best they can"

    para "be based on"
    line "their natural"
    cont "talent."
    done

Bookshelf4Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "You can gain a"
    line "lot of experience"
    cont "in a specific"

    para "skill by beating"
    line "monsters who"
    cont "excel in that"

    para "skill."
    done

Bookshelf5Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "Some monsters are"
    line "born better at"
    cont "certain skills"

    para "than others."

    para "Even of the same"
    line "species."
    done

Bookshelf6Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "The towers are"
    line "a test of not"
    cont "just training,"

    para "but also a test"
    line "of problem"
    cont "solving!"
    done

Bookshelf7Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "We continue to"
    line "search each day"
    cont "for more signs"

    para "of places to"
    line "expand too."
    done

Bookshelf8Text:
    text "You pull out a"
    line "book from the"
    cont "bookshelf."

    para "There is a"
    line "bookmarked page"
    cont "that you skip to."

    para "After some more"
    line "research, I have"
    cont "discovered a way"

    para "to get through"
    line "the fog in the"
    cont "forest."
    done

;END

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, ROUTE_0, 1
	warp_event  5,  9, ROUTE_0, 1
	warp_event  9,  4, ELMS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  9,  3, BGEVENT_READ, Trashcan
	bg_event  0,  3, BGEVENT_READ, Bookshelf1
	bg_event  1,  3, BGEVENT_READ, Bookshelf2
	bg_event  2,  3, BGEVENT_READ, Bookshelf3
	bg_event  3,  3, BGEVENT_READ, Bookshelf4
	bg_event  4,  3, BGEVENT_READ, Bookshelf5
	bg_event  5,  3, BGEVENT_READ, Bookshelf6
    bg_event  0,  7, BGEVENT_READ, Bookshelf7
	bg_event  1,  7, BGEVENT_READ, Bookshelf8

	def_object_events
	object_event  4,  6, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderScript, EVENT_ELDER_GONE
