	object_const_def
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER

CherrygroveGymSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks
;SCRIPTS PAST HERE
HintScript:
	jumptext MazeHint

;TEXT PAST HERE
MazeHint:
    text "Don't go the"
    line "wrong way!"
    done

CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 3
	warp_event 19, 18, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, HintScript

	def_object_events
