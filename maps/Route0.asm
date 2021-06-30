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
    applymovement PLAYER, PlayerLeave
    pause 5
    appear ROUTE0_ELDER
    showemote EMOTE_SHOCK, PLAYER, 20
    opentext
    writetext ElderForgetText1
    promptbutton
    closetext
    applymovement ROUTE0_ELDER, ElderWalk
    turnobject PLAYER, UP
    opentext
    writetext ElderForgetText2
    promptbutton
    closetext
    applymovement ROUTE0_ELDER, ElderWalk2
    disappear ROUTE0_ELDER
    setevent EVENT_ROUTE_0_DONE
    setscene SCENE_ROUTE_0_NOTHING
    end

ResearchTowerAheadScript:
    jumptext ResearchTowerAheadText

;Movement Past Here
PlayerLeave:
    step DOWN
    step DOWN
    step DOWN
    step_end

ElderWalk:
    step DOWN
    step DOWN
    step DOWN
    step_end

ElderWalk2:
    step UP
    step UP
    step UP
    step_end

;Text Past Here
ElderForgetText1:
    text "Wait! I forgot to"
    line "tell you!"
    done

ElderForgetText2:
    text "To start your"
    line "test, head back to"
    cont "town and there is"

    para "a small grown in"
    line "trail that leads"
    cont "to the area that"

    para "the test will take"
    line "place. It's on the"
    cont "end of the trail."

    para "Make sure to read"
    line "the signs to make"
    cont "sure you know"

    para "where you're"
    line "going."

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
