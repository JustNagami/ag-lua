local var_0_0 = {}

manager.net:Bind(61047, function(arg_1_0)
	local var_1_0 = MusicData:CheckIsHaveNewMusicData(arg_1_0)

	MusicData:InitMusicData(arg_1_0)

	if var_1_0 then
		local var_1_1 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_MUSIC]

		for iter_1_0, iter_1_1 in ipairs(var_1_1) do
			if ActivityData:GetActivityIsOpen(iter_1_1) then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_OPEN, iter_1_1), 1)
			end
		end
	else
		MusicAction.CheckRedPoint()
	end
end)
manager.notify:RegistListener(ACTIVITY_UPDATE, function(arg_2_0)
	local var_2_0 = ActivityTools.GetActivityType(arg_2_0)

	if var_2_0 == ActivityTemplateConst.ACTIVITY_MUSIC or var_2_0 == ActivityTemplateConst.ACTIVITY_MUSIC_GAME then
		MusicAction.CheckRedPoint()
	end
end)

function var_0_0.QueryCompelet(arg_3_0, arg_3_1)
	local var_3_0 = ActivityMusicCfg[arg_3_0]
	local var_3_1 = var_3_0.activity_id
	local var_3_2 = var_3_0.difficult
	local var_3_3 = MusicData:GetScore(var_3_1, var_3_2)

	manager.net:SendWithLoadingNew(61048, {
		id = arg_3_0,
		score = arg_3_1,
		other_data = MusicData:GetSpectralSendData()
	}, 61049, var_0_0.OnCampeletCallBack)
end

function var_0_0.OnCampeletCallBack(arg_4_0, arg_4_1)
	if isSuccess(arg_4_0.result) then
		local var_4_0 = arg_4_1.id
		local var_4_1 = ActivityMusicCfg[var_4_0]
		local var_4_2 = var_4_1.activity_id
		local var_4_3 = var_4_1.difficult
		local var_4_4 = MusicData:GetScore(var_4_2, var_4_3)

		if var_4_4 <= arg_4_1.score or var_4_4 == 0 then
			MusicData:SetScore(var_4_2, var_4_3, arg_4_1.score)
			MusicAction.CheckRedPoint()
			var_0_0.OpenSettlement(var_4_2, arg_4_1.score, arg_4_1.score, true)
		else
			var_0_0.OpenSettlement(var_4_2, arg_4_1.score, var_4_4, false)
		end
	else
		MusicLuaBridge.EndMusicGame()
		ShowTips(arg_4_0.result)
	end
end

function var_0_0.OpenSettlement(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if MusicData:GetSpecialEffectState() then
		return
	end

	local var_5_0 = MusicData:GetMusicViewPathList(arg_5_0)

	gameContext:Go(var_5_0.settlement, {
		cur = arg_5_1,
		max = arg_5_2,
		new = arg_5_3,
		isSpecialPerformance = arg_5_4
	})
end

function var_0_0.QueryReward(arg_6_0)
	manager.net:SendWithLoadingNew(61050, {
		id_list = arg_6_0
	}, 61051, var_0_0.OnRewardCallBack)
end

function var_0_0.OnRewardCallBack(arg_7_0, arg_7_1)
	if isSuccess(arg_7_0.result) then
		local var_7_0 = arg_7_1.id_list

		for iter_7_0, iter_7_1 in pairs(var_7_0) do
			local var_7_1 = ActivityMusicCfg[iter_7_1]
			local var_7_2 = var_7_1.activity_id
			local var_7_3 = var_7_1.difficult

			MusicData:SetRewardState(var_7_2, var_7_3)
		end

		local var_7_4 = mergeReward2(arg_7_0.reward_list or {})

		if #var_7_4 > 0 then
			getReward2(var_7_4)
		end

		MusicAction.CheckRedPoint()
		manager.notify:CallUpdateFunc(MUSIC_REWARD_UPDATE)
	else
		ShowTips(arg_7_0.result)
	end
end

function var_0_0.CheckRedPoint(arg_8_0)
	local var_8_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_MUSIC]

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		MusicAction.CheckOpenRedPoint(iter_8_1)
		MusicAction.CheckRewardRedPoint(iter_8_1)
	end
end

function var_0_0.CheckOpenRedPoint(arg_9_0)
	if not ActivityData:GetActivityIsOpen(arg_9_0) or MusicData:GetRead(arg_9_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_OPEN, arg_9_0), 0)

		return
	end

	local var_9_0 = ActivityCfg[arg_9_0]
	local var_9_1 = var_9_0 and var_9_0.sub_activity_list or {}

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		if ActivityData:GetActivityIsOpen(iter_9_1) then
			local var_9_2 = ActivityMusicCfg.get_id_list_by_activity_id[iter_9_1]
			local var_9_3 = true
			local var_9_4

			for iter_9_2, iter_9_3 in ipairs(var_9_2) do
				local var_9_5 = ActivityMusicCfg[iter_9_3]
				local var_9_6 = MusicData:GetScore(iter_9_1, var_9_5.difficult)

				if var_9_6 and var_9_6 ~= 0 then
					var_9_3 = false

					break
				end

				if MusicData:GetIsComplete(iter_9_1, var_9_5.difficult) then
					var_9_3 = false

					break
				end
			end

			if var_9_3 then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_OPEN, arg_9_0), 1)

				return
			end
		end
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_OPEN, arg_9_0), 0)
end

function var_0_0.CheckRewardRedPoint(arg_10_0)
	if not ActivityData:GetActivityIsOpen(arg_10_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_REWARD, arg_10_0), 0)

		return
	end

	local var_10_0 = ActivityCfg[arg_10_0]
	local var_10_1 = var_10_0 and var_10_0.sub_activity_list or {}

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		local var_10_2 = ActivityMusicCfg.get_id_list_by_activity_id[iter_10_1]

		for iter_10_2, iter_10_3 in ipairs(var_10_2) do
			local var_10_3 = ActivityMusicCfg[iter_10_3]

			if ActivityData:GetActivityIsOpen(iter_10_1) and (var_10_3.difficult == 1 or var_10_3.difficult == 2) and MusicData:GetRewardState(iter_10_3) == 1 then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_REWARD, arg_10_0), 1)

				return
			end
		end
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_REWARD, arg_10_0), 0)
end

function var_0_0.SetMusicRead(arg_11_0)
	MusicData:SetRead(arg_11_0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.MUSIC_OPEN, arg_11_0), 0)
end

function var_0_0.Play(arg_12_0)
	local var_12_0 = ActivityMusicCfg[arg_12_0]

	if not var_12_0 then
		error("can not find ActivityMusicCfg")

		return
	end

	local var_12_1 = GetMusicDataForExchange()

	var_12_1.musicPath = var_12_0.path
	var_12_1.cueSheetName = var_12_0.cueSheetName
	var_12_1.cueName = var_12_0.cueName
	var_12_1.awbFile = var_12_0.awbFile
	var_12_1.aisacKey = var_12_0.aisacKey
	var_12_1.aisacValue = var_12_0.aisacValue
	var_12_1.isVertical = MusicData:GetVerical()
	var_12_1.latency = MusicData:GetJudgeData()
	var_12_1.stayTime = MusicData:GetSpeedData(var_12_1.isVertical)
	var_12_1.judgeLatency = MusicData:GetScreanData()
	var_12_1.goodArea = GameSetting.attach_music_judgment_good.value[1]
	var_12_1.prefectArea = GameSetting.attach_music_judgment_perfect.value[1]
	var_12_1.perfectPlusArea = GameSetting.attach_music_judgment_perfect_plus.value[1]
	var_12_1.longStartArea = GameSetting.attach_music_judgment_good.value[1]
	var_12_1.longEndArea = GameSetting.attach_music_judgment_good.value[1]
	var_12_1.interval = GameSetting.attach_music_longnote.value[1]
	var_12_1.preparationTime = 2000
	var_12_1.spectralType = MusicData:GetSpectralType()

	SDKTools.SendMessageToSDK("activity_music_start", {
		is_restart = false,
		activity_id = var_12_0.activity_id,
		difficulty_id = var_12_0.difficult,
		other_data = MusicData:GetSpectralAndVercialSDKKey()
	})
	MusicData:SetGameId(arg_12_0)
	DestroyLua()
	MusicLuaBridge.Launcher(var_12_1)
end

function var_0_0.GoToMusicMain()
	DestroyLua()

	local var_13_0 = MusicData:GetGameId()
	local var_13_1 = ActivityMusicCfg[var_13_0].activity_id
	local var_13_2 = MusicData:GetMusicViewPathList(var_13_1)

	if ActivityTools.GetActivityTheme(var_13_1) == ActivityConst.THEME.ACTIVITY_3_11 then
		LaunchQWorld(true)
	else
		LuaExchangeHelper.GoToMain()
		OpenPageUntilLoaded(var_13_2.musicMain, {
			activity_id = var_13_2.activityID
		})
	end
end

return var_0_0
