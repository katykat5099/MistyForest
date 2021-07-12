	object_const_def

DarkCaveBlackthornEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, DARK_CAVE_VIOLET_ENTRANCE, 1
	warp_event  5,  6, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event  5, 19, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event  3, 13, DARK_CAVE_BLACKTHORN_ENTRANCE, 5
	warp_event  3, 25, DARK_CAVE_BLACKTHORN_ENTRANCE, 4
	warp_event  7, 27, DARK_CAVE_BLACKTHORN_ENTRANCE, 7
	warp_event 21,  4, DARK_CAVE_BLACKTHORN_ENTRANCE, 6
	warp_event 17,  1, DARK_CAVE_VIOLET_ENTRANCE, 4

	def_coord_events

	def_bg_events

	def_object_events
