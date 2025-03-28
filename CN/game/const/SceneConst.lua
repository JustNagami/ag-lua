local var_0_0 = {
	HOME_SCENE_TYPE = {
		LOCK = 0,
		TRIAL = 1,
		UNLOCK = 2
	},
	HOME_SCENE_IMPACT = {
		WEATHER = 1,
		DATA = 2,
		TIME = 3
	},
	HOME_SCENE_TIME = {
		DAY = "X10",
		NIGHT = "X10a"
	},
	HOME_SCENE_WEATHER = {
		SUNNY = 1,
		RAINY = 2
	},
	HOME_SCENE_SETTING = {
		SCENE_SOUND_EFFECT = 1,
		CAMERA_FOLLOW = 2
	},
	SCENE_NAME = {
		reserve = "X104",
		hero = "X100"
	},
	NEED_CHANGE_SCENE_URL_LIST = {
		userinfo = true,
		furniturePreview = true,
		chat = true,
		furniturePreviewWithEntity = true,
		homePreview = true,
		home = true,
		clubBoss = true
	},
	RESERVE_VIEW_PAGE = {
		activityHeroEnhanceTeamInfo = true,
		guildActivitySetFightHero = true,
		swimsuitBattleTeamInfo = true,
		multHeartDemonHeroTeamInfo = true,
		heroTeamInfoSoloChallenge = true,
		sectionSelectHero = true,
		heroTeamInfoBoss = true,
		guildActivitySPTeamInfo = true,
		guildBossSetAssistant = true,
		mythicHeroTeamInfoView = true,
		challengeRogueTeamTeamInfo = true,
		heroTeamInfoCoreVerification = true,
		mythicSectionSelectHero = true,
		guildActivitySPSetFightHero = true,
		cooperationSectionSelectHero = true,
		sequentialBattleSectionSelectHero = true,
		guildActivityTeamInfo = true,
		kagutsuchiTeamInfo = true,
		challengeRogueTeamSectionSelectHero = true,
		newWarChessHeroTeamInfoView = true,
		newHeroTeamInfo = true,
		summerWaterSectionSelectHero = true,
		advanceTestTeamInfo = true,
		challengeRogueTeamHeroSelect = true,
		heroTeamInfoAttributeArena = true,
		guildBossTeamInfo = true,
		heroTeamInfoChessView = true,
		summerWaterTeamInfo = true,
		xH3rdWaterTeamInfo = true
	}
}

for iter_0_0, iter_0_1 in pairs(var_0_0.RESERVE_VIEW_PAGE) do
	var_0_0.NEED_CHANGE_SCENE_URL_LIST[iter_0_0] = true
end

return var_0_0
