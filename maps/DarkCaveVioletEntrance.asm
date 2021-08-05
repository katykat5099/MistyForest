	object_const_def

DarkCaveVioletEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  2, DARK_CAVE_BLACKTHORN_ENTRANCE, 1
	warp_event 18,  7, ROUTE_46, 1
	warp_event 17,  7, ROUTE_46, 1
	warp_event  7,  4, DARK_CAVE_BLACKTHORN_ENTRANCE, 8


	def_coord_events

	def_bg_events

	def_object_events
