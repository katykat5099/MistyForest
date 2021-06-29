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
    text "Alright, so"
    line "just a few days"

    para "ago was your"
    line "18th birthday."

    para "As you may know,"
    line "as tradition in"

    para "this village,"
    line "you are now an"

    para "adult and you"
    line "must contribute"

    para "to the village"
    line "with your new"

    para "responsibilities."

    para "I know, I know.."
    line "You're nervous,"

    para "you're excited,"
    line "you've been up"

    para "studying really"
    line "hard for this day."

    para "But, you will now"
    line "be tested to see"

    para "if you are"
    line "capable of the"

    para "task of becoming"
    line "a researcher here"

    para "in this village,"
    line "or if you will be"

    para "spending the wrest"
    line "of your days being"

    para "a farmer for the"
    line "village! Haha!"

    para "I know how badly"
    line "you want to become"

    para "a researcher.. So"
    line "I wish you all of"

    para "the luck on your"
    line "test!"
    done

PokemonGetStep2:
    text "So, let's begin."
    line "As you can see,"

    para "There's a ball"
    line "on the table over"

    para "there. That was"
    line "bred for you last"

    para "week! Every adult"
    line "here gets one"

    para "once they become"
    line "an adult because"

    para "that's when we all"
    line "agreed that a"

    para "person has learnt"
    line "enough to defend"

    para "themselves from"
    line "the creatures in"

    para "the wild."

    para "It's a DRAGON type"
    line "monster that has"

    para "been bred for"
    line "generations!"

    para "But that does not"
    line "take away the fact"

    para "that DRAGON type"
    line "monsters are hard"

    para "to train! That is"
    line "why you had to"

    para "Spend so many"
    line "years learning"

    para "the basics about"
    line "training."

    para "Alright, go on"
    line "now! Say hello!"
    done

GeckooCautious:
    text "It looks very"
    line "cautious..."
    done

RecievedGeckoo:
    text "Got GECKOO!"
    done

ElderFinalWords:
    text "Lastly, I would"
    line "highly recommend"

    para "you take a look"
    line "at some books"

    para "down stairs. they"
    line "may come in handy!"
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
