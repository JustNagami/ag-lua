local var_0_0 = {
	MusicNodeHitRating = {
		Perfect = 2,
		PerfectPlus = 3,
		Good = 1,
		Miss = 0
	},
	MusicNodeHitType = {
		Long = 2,
		Short = 1,
		LongPress = 3,
		None = 0
	},
	MusicViewType = {
		V210 = 2,
		Enternal = 1,
		Resident = 3,
		Volume = 0
	},
	MusicSpectralType = {
		Mirror = 1,
		Random = 2,
		None = 0
	},
	MusicDiffcult = {
		Hardest = 9,
		Challenge = 3,
		Hard = 2,
		Normal = 1
	},
	MusicLookBackID = {
		ActivityConst.VOLUME_MUSIC,
		ActivityConst.ENTERNAL_MUSIC,
		ActivityConst.ACTIVITY_2_10_MUSIC
	}
}

var_0_0.MusicViewRoutesName = {
	[var_0_0.MusicViewType.Volume] = {
		settlement = "volumeMusicSettlement",
		musicStop = "volumeMusicstop",
		musicMain = "/volumeMusicMain",
		musicName = "/volumeMusicGame",
		activityID = ActivityConst.VOLUME_MUSIC
	},
	[var_0_0.MusicViewType.Enternal] = {
		settlement = "enternalMusicSettlement",
		musicStop = "enternalMusicStop",
		musicMain = "/enternalMusicMain",
		musicName = "/enternalMusicGame",
		activityID = ActivityConst.ENTERNAL_MUSIC
	},
	[var_0_0.MusicViewType.V210] = {
		settlement = "V210MusicSettlement",
		musicStop = "V210MusicStop",
		musicMain = "/V210MusicMain",
		musicName = "/V210MusicGame",
		activityID = ActivityConst.ACTIVITY_2_10_MUSIC
	},
	[var_0_0.MusicViewType.Resident] = {
		settlement = "V210MusicSettlement",
		musicStop = "V210MusicStop",
		musicMain = "/V210MusicMain",
		musicName = "/V210MusicGame",
		activityID = ActivityConst.ACTIVITY_3_11_MUSIC
	}
}
var_0_0.MusicViewUIName = {
	[var_0_0.MusicViewType.Resident] = {
		rewardView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicRewardUI",
		mainView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicMainUI",
		stopView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicPromptUI",
		settingView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicSetUI",
		gameView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicGameUI",
		scoreView = "Widget/System/Activity_Resident/Acitvity_MusicUI/Acitvity_MusicScoreUI"
	}
}
var_0_0.PCTrackKeyMap = {
	[4] = {
		"D",
		"F",
		"J",
		"K"
	},
	[5] = {
		"D",
		"F",
		"J",
		"K",
		"L"
	},
	[6] = {
		"S",
		"D",
		"F",
		"J",
		"K",
		"L"
	}
}

return var_0_0
