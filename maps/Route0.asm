	object_const_def
	const ROUTE0_ELDER

Route0_MapScripts:
	def_scene_scripts
	scene_script .MakeAppear
    scene_script .DummyScene0
    scene_script .DummyScene1
	def_callbacks

;Scenes past here
.MakeAppear
    checkevent EVENT_ROUTE_0_DONE
    iftrue EventDone
    setscene SCENE_ELDER_FORGET
    end

.DummyScene0
   end

.DummyScene1
    end

;Scripts past here
CheckIfRouteIsDone:
    checkevent EVENT_ROUTE_0_DONE
    iftrue EventDone
    end

ScriptElderForgetCheck:
    checkevent EVENT_GECKOOGET
    iftrue ScriptElderForget
    end

EventDone:
    setscene SCENE_ROUTE_0_NOTHING
    end

ScriptElderForget:
    pause 5
    appear ROUTE0_ELDER
    playsound SFX_EXIT_BUILDING
    showemote EMOTE_SHOCK, PLAYER, 20
    opentext
    writetext ElderForgetText1
    promptbutton
    closetext
    turnobject PLAYER, UP
    opentext
    writetext ElderForgetText2
    promptbutton
    closetext
    turnobject ROUTE0_ELDER, UP
    pause 5
    disappear ROUTE0_ELDER
    playsound SFX_ENTER_DOOR
    setevent EVENT_ROUTE_0_DONE
    setscene SCENE_ROUTE_0_NOTHING
    clearevent EVENT_PLAYERS_HOUSE_MOM_3
    setevent EVENT_PLAYERS_HOUSE_MOM_2
    end

ResearchTowerAheadScript:
    jumptext ResearchTowerAheadText

;Movement Past Here

;Text Past Here
ElderForgetText1:
    text "Wait! I forgot to"
    line "tell you!"
    done

ElderForgetText2:
    text "To start your"
    line "exam, head back to"
    cont "town, there is a"

    para "trail that will"
    line "take you where"
    cont "you need to be."

    para "You must find it"
    line "yourself."

    para "Read the signs"
    line "so you don't get"
    cont "lost."

    para "Enjoy!"
    done

ResearchTowerAheadText:
    text "Research Tower"
    line "Ahead"
    done

Route0_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  7, ELMS_LAB, 1

	def_coord_events
    coord_event 9, 8, SCENE_ELDER_FORGET, ScriptElderForgetCheck

	def_bg_events
    bg_event  11,  27, BGEVENT_READ, ResearchTowerAheadScript

	def_object_events
	object_event 9, 7, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderScript, EVENT_ELDERAPPEAR
