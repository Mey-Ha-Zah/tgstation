/datum/status_effect/strange_inspiration
	id = "silent"
	duration = -1
	alert_type = /atom/movable/screen/alert/status_effect/strange_inspiration
	remove_on_fullheal = TRUE

/datum/status_effect/strange_inspiration/tick(delta_time, times_fired)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(owner.stat == DEAD)
		qdel(src)

/datum/status_effect/strange_inspiration/on_apply()
	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(clear_silence))
	ADD_TRAIT(owner, , id)
	return TRUE

/datum/status_effect/strange_inspiration/on_remove()
	UnregisterSignal(owner, COMSIG_LIVING_DEATH)
	REMOVE_TRAIT(owner, , id)

/// The status effect for "drugginess"
/atom/movable/screen/alert/status_effect/strange_inspiration
	name = "Strange Inspiration"
	desc = "You have an inspiration to build something, and its killing you."
	icon_state = "high"
	var/list = list()
		. = ..()
