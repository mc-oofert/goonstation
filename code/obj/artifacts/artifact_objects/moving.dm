/obj/artifact/mobile
	name = "mobile artifact"
	associated_datum = /datum/artifact/mobile

/datum/artifact/mobile
	associated_object = /obj/artifact/mobile
	type_name = "Mobile"
	rarity_weight = 365
	validtypes = list("ancient","martian","eldritch","precursor")
	validtriggers = list(/datum/artifact_trigger/force,/datum/artifact_trigger/radiation,/datum/artifact_trigger/carbon_touch,/datum/artifact_trigger/silicon_touch,/datum/artifact_trigger/heat)
	fault_blacklist = list(ITEM_ONLY_FAULTS,TOUCH_ONLY_FAULTS)
	activ_text = "suddenly becomes mobile and starts moving on its own!"
	deact_text = "stops moving."
	react_xray = list(12,35,85,5,"COMPLEX") //complex because it has legs or something idk
	var/maxsteps = 15
	var/steps = 0 //how many times has the artifact moved

	post_setup()
		..()
		maxsteps = rand(5,30)

	effect_process(var/obj/O)
		if (..())
			return
		if (steps == 15)
			O.ArtifactDeactivated()
			return
		else
			step_rand(O)
			maxsteps++