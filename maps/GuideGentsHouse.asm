	object_const_def
    const GUIDEGENTHOUSE_MONSTER

GuideGentsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

;Scripts Past Here
FirstTowerBoss:
    faceplayer
    cry ARBOK
    loadwildmon ARBOK, 12
    startbattle
    ifequal DRAW, RanAwayProbably
    ifequal LOSE, LostBattle
    reloadmapafterbattle
    disappear GUIDEGENTHOUSE_MONSTER
    opentext
    writetext CompletedBattle
    promptbutton
    pause 3
    verbosegiveitem HM_CUT
    closetext
    setevent EVENT_FIRST_TOWER_BOSS

RanAwayProbably:
    reloadmapafterbattle
    end

LostBattle:
    reloadmapafterbattle
    end

;Text Past Here
CompletedBattle:
    text "The spirit speaks"
    line "to you..."

    para "You have completed"
    line "the first tower."

    para "Move on to the"
    line "next, successor."
    done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  4, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 5

	def_coord_events

	def_bg_events

	def_object_events
    object_event 3, 1, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FirstTowerBoss, EVENT_FIRST_TOWER_BOSS
