﻿local var_0_0 = {
	CHARACTER_TYPE = {
		PLYER = 1,
		ENEMY = 2
	},
	SKILL_EFFECT_TYPE = {
		BEHAVIOR_SCORE_CHANGE = 4,
		ATTRIBUTE_CHNAGE = 1,
		SKILL_RELEASE = 3,
		TOTAL_SCORE_CHANGE = 5,
		ACTION_SCORE_CHANGE = 2
	},
	ROOM_TYPE = {
		PVP_STAGE = 2,
		TRAIN = 1,
		Video = 4,
		PVE_STAGE = 3
	},
	SCORE_INDEX = {
		SKILL_DEDCUTION = 4,
		ADVANTAGE = 2,
		SKILL_SCORE = 3,
		TOTAL = 1
	},
	SCORE_DESC = {
		"IDOL_DANCE_TOTAL_SCORE",
		"IDOL_DANCE_ADVANTAGE_SCORE",
		"IDOL_DANCE_SKILL_SCORE",
		"IDOL_DANCE_SKILL_DEDCUTION_SCORE"
	}
}

var_0_0.SCORE_LIST = {
	var_0_0.SCORE_INDEX.TOTAL,
	var_0_0.SCORE_INDEX.ADVANTAGE,
	var_0_0.SCORE_INDEX.SKILL_SCORE,
	var_0_0.SCORE_INDEX.SKILL_DEDCUTION
}

return var_0_0
