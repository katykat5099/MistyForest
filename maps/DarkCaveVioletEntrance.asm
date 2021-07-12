	object_const_def
    const DARKCAVEVIOLETENTRANCE_MONSTER

DarkCaveVioletEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

;SCRIPTS PAST HERE
SecondTowerBoss:
    faceplayer
    cry ARBOK
    loadwildmon ARBOK, 5
    startbattle
    ifequal DRAW, RanAwayProbablySecond
    ifequal LOSE, LostBattleSecond
    reloadmapafterbattle
    disappear DARKCAVEVIOLETENTRANCE_MONSTER
    pause 5
    opentext
    writetext ItemAppearsHM
    verbosegiveitem HM_GLIDE
    closetext
    setevent EVENT_FIRST_TOWER_BOSS
    end

RanAwayProbablySecond:
    reloadmapafterbattle
    end

LostBattleSecond:
    reloadmapafterbattle
    end

;TEXT PAST HERE
ItemAppearsHM:
    text "test"
    done

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, DARK_CAVE_BLACKTHORN_ENTRANCE, 1
	warp_event 16,  7, ROUTE_46, 1
	warp_event 15,  7, ROUTE_46, 1
	warp_event  7,  4, DARK_CAVE_BLACKTHORN_ENTRANCE, 8

	def_coord_events

	def_bg_events

	def_object_events
    object_event 3, 1, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SecondTowerBoss, EVENT_SECOND_TOWER_BOSS
