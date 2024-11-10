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
		Volume = 0
	},
	MusicSpectralType = {
		Mirror = 1,
		Random = 2,
		None = 0
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
	}
}

return var_0_0
