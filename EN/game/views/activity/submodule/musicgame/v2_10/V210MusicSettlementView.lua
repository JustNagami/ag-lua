local var_0_0 = class("EnternalMusicSettlementView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_10/JapanRegionMusicUI/MusicScoreUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.difficultController_ = ControllerUtil.GetController(arg_4_0.transform_, "difficult")
	arg_4_0.gradeController_ = ControllerUtil.GetController(arg_4_0.transform_, "grade")
	arg_4_0.newController_ = ControllerUtil.GetController(arg_4_0.transform_, "new")
	arg_4_0.evaluateController_ = ControllerUtil.GetController(arg_4_0.transform_, "evaluate")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_restartBtn, nil, function()
		local var_6_0 = MusicData:GetGameId()
		local var_6_1 = ActivityMusicCfg[var_6_0]

		if var_6_1 then
			SDKTools.SendMessageToSDK("activity_music_start", {
				is_restart = false,
				activity_id = var_6_1.activity_id,
				difficulty_id = var_6_1.difficult,
				other_data = MusicData:GetSpectralAndVercialSDKKey()
			})
		end

		MusicLuaBridge.ReStartMusicGame()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_backBtn, nil, function()
		local var_7_0 = MusicData:GetGameId()
		local var_7_1 = MusicData:GetMusicViewPathList(activityId)

		DestroyLua()
		LuaExchangeHelper.GoToMain()
		OpenPageUntilLoaded(var_7_1.musicMain, {
			activity_id = var_7_1.activityID
		})
	end)
end

function var_0_0.OnTop(arg_8_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	local var_10_0 = MusicData:GetGameId()
	local var_10_1 = ActivityMusicCfg[var_10_0]

	arg_10_0.m_name.text = GetI18NText(var_10_1.name)
	arg_10_0.m_bg.sprite = getSpriteWithoutAtlas("TextureConfig/Music/Music_icon/" .. var_10_1.icon)
	arg_10_0.bgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Music/Music1_icon/" .. var_10_1.icon)

	if var_10_1.difficult == 2 then
		arg_10_0.difficultController_:SetSelectedIndex(1)
	elseif var_10_1.difficult == 9 then
		arg_10_0.difficultController_:SetSelectedIndex(2)
	else
		arg_10_0.difficultController_:SetSelectedIndex(0)
	end

	local var_10_2 = arg_10_0.params_.cur
	local var_10_3 = arg_10_0.params_.max

	arg_10_0.m_curScoreLab.text = var_10_2
	arg_10_0.m_maxScoreLab.text = var_10_3

	local var_10_4 = var_10_2 / var_10_1.total_score * 100
	local var_10_5 = arg_10_0:KeepDecimalPlace(var_10_4, 2)

	arg_10_0.m_comboLab.text = MusicData:GetMaxComboHit()
	arg_10_0.m_accuracyLab.text = string.format("%.2f%%", var_10_5)

	local var_10_6 = MusicData:GetGameRecord(MusicConst.MusicNodeHitRating.Miss)
	local var_10_7 = MusicData:GetGameRecord(MusicConst.MusicNodeHitRating.Good)

	arg_10_0.m_mistakeLab.text = var_10_6
	arg_10_0.m_preciseLab.text = var_10_7
	arg_10_0.m_perfectLab.text = MusicData:GetGameRecord(MusicConst.MusicNodeHitRating.Perfect)
	arg_10_0.m_perfectPluasLab.text = MusicData:GetGameRecord(MusicConst.MusicNodeHitRating.PerfectPlus)

	if var_10_7 == 0 and var_10_6 == 0 then
		arg_10_0.evaluateController_:SetSelectedIndex(2)
	elseif var_10_6 == 0 then
		arg_10_0.evaluateController_:SetSelectedIndex(1)
	else
		arg_10_0.evaluateController_:SetSelectedIndex(0)
	end

	arg_10_0.newController_:SetSelectedIndex(arg_10_0.params_.new and 1 or 0)

	local var_10_8 = GameSetting.attach_music_grade.value

	for iter_10_0, iter_10_1 in ipairs(var_10_8) do
		if iter_10_1 <= var_10_4 then
			arg_10_0.gradeController_:SetSelectedIndex(iter_10_0 - 1)

			break
		end
	end
end

function var_0_0.KeepDecimalPlace(arg_11_0, arg_11_1, arg_11_2)
	return math.floor(arg_11_1 * 10^arg_11_2) / 10^arg_11_2
end

function var_0_0.OnExit(arg_12_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_13_0)
	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
