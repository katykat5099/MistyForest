	object_const_def

Route29_MapScripts:
	def_scene_scripts


	def_callbacks

;Scripts Past Here
TowersAheadScript:
    jumptext TowersAhead

;Text Past Here
TowersAhead:
    text "WEST: 1st Tower"
    line "NORTH: 2nd Tower"
    cont "SOUTH: 3rd Tower"
    done

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  51,  11, BGEVENT_READ, TowersAheadScript

	def_object_events
