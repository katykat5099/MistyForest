	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

;SCRIPTS PAST HERE
MeetMom0Script:
    playmusic MUSIC_MOM
    showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
    opentext
    writetext WaitPlayer
    promptbutton
    closetext
	applymovement PLAYER, WalkMom0
	sjump MeetMomScript

MeetMom1Script:
    playmusic MUSIC_MOM
    showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
    opentext
    writetext WaitPlayer
    promptbutton
    closetext
	applymovement PLAYER, WalkMom1
	sjump MeetMomScript

MeetMom2Script:
    playmusic MUSIC_MOM
    showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
    opentext
    writetext WaitPlayer
    promptbutton
    closetext
	applymovement PLAYER, WalkMom2
	sjump MeetMomScript

MeetMom3Script:
    playmusic MUSIC_MOM
    showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
    opentext
    writetext WaitPlayer
    promptbutton
    closetext
	applymovement PLAYER, WalkMom3
	sjump MeetMomScript

MeetMom4Script:
    playmusic MUSIC_MOM
    showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
    opentext
    writetext WaitPlayer
    promptbutton
    closetext
	applymovement PLAYER, WalkMom4
	sjump MeetMomScript

MeetMomScript:
    setevent EVENT_ELDERAPPEAR
	opentext
	writetext GoSeeElder
	promptbutton
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	closetext
	sjump .Finish

.Finish:
	special RestartMapMusic
	end

MomScript:
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

;MOVEMENT PAST HERE

WalkMom0:
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

WalkMom1:
    step RIGHT
    step RIGHT
    step_end

WalkMom2:
    step RIGHT
    step_end

WalkMom3:
    turn_head RIGHT
    step_end

WalkMom4:
    step LEFT
    step LEFT
    step LEFT
    step DOWN
    turn_head RIGHT
    step_end

;TEXT PAST HERE
WaitPlayer:
    text "Hey, wait <PLAY_G>!"
    done

GoSeeElder:
    text "How has studying"
    line "been for you"
    cont "lately?"

    para "I heard you did"
    line "pretty good on"
    cont "your written test!"

    para "The Elder came"
    line "over this morning"
    cont "while you were"

    para "asleep."

    para "He said that it"
    line "is time for you"
    cont "to go and see him."

    para "You should head"
    line "out north and go"
    cont "see what he has"

    para "to say."

    para "…"

    para "Oh, before you"
    line "go, can you"
    cont "please help me"

    para "with the time?"
    done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."
	done

PlayersHouse1FStoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

PlayersHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 13, NEW_BARK_TOWN, 1
	warp_event  7, 13, NEW_BARK_TOWN, 1
	warp_event  2,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  6, 11, SCENE_DEFAULT, MeetMom0Script
	coord_event  7, 11, SCENE_DEFAULT, MeetMom1Script
	coord_event  8, 11, SCENE_DEFAULT, MeetMom2Script
    coord_event  9, 11, SCENE_DEFAULT, MeetMom3Script
    coord_event 12, 10, SCENE_DEFAULT, MeetMom4Script

	def_bg_events
	bg_event  2,  9, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  3,  9, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  4,  9, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event 12,  9, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event 10, 11, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2, 11, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
