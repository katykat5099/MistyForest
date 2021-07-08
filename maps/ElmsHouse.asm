	object_const_def
    const ELMSHOUSE_ELDER
    const GECKOO_BALL

ElmsHouse_MapScripts:
	def_scene_scripts
    scene_script .WelcomePokemon ; Continue Welcome Script
    scene_script .DummyScene0 ;Nothing
    scene_script .DummyScene1 ;Scene

	def_callbacks

;Scenes past here
.WelcomePokemon:
    sdefer .WalkInPokemon
    end

.WalkInPokemon:
    turnobject ELMSHOUSE_ELDER, RIGHT
    applymovement PLAYER, SpeakToElder
    opentext
    writetext PokemonGetStep1
    promptbutton
    closetext
    pause 10
    opentext
    writetext PokemonGetStep2
    closetext
    setscene SCENE_ELMS_HOUSE_NOTHING
    end

.DummyScene0
    end

.DummyScene1
    end

;Scripts Past Here
ElderScript0:
    turnobject ELMSHOUSE_ELDER, RIGHT
    opentext
    writetext HowAreYou
    promptbutton
    closetext
    end

GeckooGetScript:
    turnobject ELMSHOUSE_ELDER, DOWN
    refreshscreen
    pokepic ABRA
    cry ABRA
    waitbutton
    closepokepic
    opentext
    writetext GeckooCautious
    promptbutton
    disappear GECKOO_BALL
    writetext RecievedGeckoo
    playsound SFX_CAUGHT_MON
    waitsfx
    promptbutton
    givepoke ABRA, 5
    closetext
    pause 10
    applymovement PLAYER, FinalWords
    turnobject ELMSHOUSE_ELDER, RIGHT
    opentext
    writetext ElderFinalWords
    promptbutton
    closetext
    setevent EVENT_GECKOOGET
    setevent EVENT_RIVAL_NEW_BARK_TOWN
    setscene SCENE_ELMS_HOUSE_NOTHING
    end

;Movement Past Here
SpeakToElder:
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step_end

FinalWords:
    step UP
    step UP
    turn_head LEFT
    step_end

;Text Past Here
HowAreYou:
    text "How are things?"
    done

PokemonGetStep1:
    text "Welcome!"
    line "The reason I"
    cont "called you here"

    para "today is because"
    line "you passed your"
    cont "written exam!"

    para "You showed me"
    line "that you are"
    cont "more than ready"

    para "to move on to"
    line "the field exam."

    para "You have an"
    line "excellent under-"
    cont "standing of how"

    para "battles work!"

    para "Now you must"
    line "prove to me in"
    cont "the field exam"

    para "that you have"
    line "what it takes"
    cont "to become an"

    para "apprentice in"
    line "this research"
    cont "tower."

    para "Are you ready?"
    done

PokemonGetStep2:
    text "As you can see,"
    line "there's a ball"
    cont "on the table."

    para "The monster"
    line "contained in"
    cont "that ball was"

    para "recently bred"
    line "and I am"
    cont "allowing you"

    para "to train this"
    line "monster."

    para "You must not"
    line "make a mistake"
    cont "though. This"

    para "monster is a"
    line "rare DRAGON"
    cont "type monster,"

    para "training it"
    line "incorrectly can"
    cont "result in it"

    para "becoming weak"
    line "and it may not"
    cont "be able to grow"

    para "to its natural"
    line "potential."

    para "Anyways, shall"
    line "we begin now?"

    para "Go say hi to"
    line "your new"
    cont "friend!"
    done

GeckooCautious:
    text "It looks very"
    line "cautious..."
    done

RecievedGeckoo:
    text "Got GEKKOU!"
    done

ElderFinalWords:
    text "Lastly, I highly"
    line "recommend that"
    cont "you take a look"

    para "at some books"
    line "down stairs."

    para "They could be"
    line "very handy!"
    cont "Haha!"

    para "But don't tell"
    line "anyone I told"
    cont "you that."
    done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, ELMS_LAB, 3

	def_coord_events

	def_bg_events

	def_object_events
    object_event  2,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderScript0, -1
    object_event  3,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GeckooGetScript, EVENT_GECKOOGET
