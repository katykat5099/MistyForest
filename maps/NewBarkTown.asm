	object_const_def
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_SILVER

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


;SCENES PAST HERE
.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

;SCRIPTS PAST HERE
NewBarkTownSilverScript:
    end

NewBarkTownFisherScript:
	faceplayer
	opentext
	writetext Text_CantGoToTown
	checkevent EVENT_RIVAL_NEW_BARK_TOWN
	iffalse TalkToElder
	promptbutton
	closetext
	end

TalkToElder:
    writetext YouShouldSeeElder
    promptbutton
    closetext
    end

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

;MOVEMENT PAST HERE

;TEXT PAST HERE
Text_CantGoToTown:
	text "Hey <PLAYER>."

	para "Sorry, I cant"
	line "take you to the"
	cont "other part of"

	para "town today."
	done

YouShouldSeeElder:
	para "You should go"
	line "see the Elder."
	done

NewBarkTownSignText:
	text "Research Tower"
	line "Ahead"
    done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  7, PLAYERS_HOUSE_1F, 1
	warp_event 11, 13, PLAYERS_NEIGHBORS_HOUSE, 2

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  7, BGEVENT_READ, NewBarkTownPlayersHouseSign

	def_object_events
	object_event  8, 13, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	object_event  1, 14, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownSilverScript, EVENT_RIVAL_NEW_BARK_TOWN
