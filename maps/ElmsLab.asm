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
	disappear ELMSLAB_ELM
	setevent EVENT_ELDER_GONE
	setscene SCENE_ELMSLAB_NOTHING
	end

.DummyScene0
    end

;SCRIPTS PAST HERE
Trashcan:
	jumptext TrashcanText

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

    para "Was starting to"
    line "think you got"

    para "lost. But here"
    line "you are!"

    para "Follow me please."
    done

TrashcanText:
	text "It's a trash can.."
	line "…"

	para "Oh! There's a note"
	line "inside! It reads.."

	para "insert hint text" ; PUT IN HINT TEXT WHEN IT COMES AVAILABLE
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

	def_object_events
	object_event  4,  6, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderScript, EVENT_ELDER_GONE
