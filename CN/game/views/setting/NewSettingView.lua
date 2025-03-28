local var_0_0 = class("SettingView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Setting/SettingUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListeners()

	arg_3_0.selectIndex = -1
	arg_3_0.pages = {}
end

function var_0_0.OnPicSettingChange(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.pages.Graphic then
		arg_4_0.pages.Graphic:OnPicSettingChange(arg_4_1, arg_4_2)
	end
end

function var_0_0.OnSoundSettingChange(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.pages.Sound then
		arg_5_0.pages.Sound:OnSoundSettingChange(arg_5_1, arg_5_2)
	end

	if arg_5_0.pages.Game then
		arg_5_0.pages.Game:OnSoundSettingChange(arg_5_1, arg_5_2)
	end
end

function var_0_0.OnPushSettingChange(arg_6_0, arg_6_1, arg_6_2)
	return
end

function var_0_0.OnGameSettingChange(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.pages.Game then
		arg_7_0.pages.Game:OnGameSettingChange(arg_7_1, arg_7_2)
	end
end

function var_0_0.OnDownloaded(arg_8_0, arg_8_1)
	if arg_8_0.pages.Sound then
		arg_8_0.pages.Sound:OnDownloaded(arg_8_1)
	end
end

function var_0_0.OnCancalDownload(arg_9_0)
	if arg_9_0.pages.Sound then
		arg_9_0.pages.Sound:OnCancalDownload()
	end
end

function var_0_0.OnRemindChange(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0.pages.Remind then
		arg_10_0.pages.Remind:OnRemindChange(arg_10_1, arg_10_2)
	end
end

function var_0_0.OnCooperationRestrictUpdate(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.pages.Remind then
		arg_11_0.pages.Remind:OnCooperationRestrictUpdate()
	end
end

function var_0_0.OnPolyhedronSwitchHero(arg_12_0)
	if arg_12_0.pages.PolyhedronTeamInfo then
		arg_12_0.pages.PolyhedronTeamInfo:OnPolyhedronSwitchHero()
	end
end

function var_0_0.OnAssetPendDownloadEnd(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.pages.AssetPend then
		arg_13_0.pages.AssetPend:OnAssetPendDownloadEnd(arg_13_1, arg_13_2)
	end
end

function var_0_0.InitUI(arg_14_0)
	arg_14_0:BindCfgUI()

	arg_14_0.toggleList = LuaList.New(handler(arg_14_0, arg_14_0.IndexItem), arg_14_0.m_list, SettingToggleItem)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddBtnListenerScale(arg_15_0.resetBtn_, nil, function()
		arg_15_0.curPage:RecoverTmpData()
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.resetDefBtn_, nil, function()
		if arg_15_0.curPage.ResetDefaultData then
			arg_15_0.curPage:ResetDefaultData()
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.quitBattleBtn_, nil, function()
		local var_18_0

		if arg_15_0.params_.stageData:GetType() == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
			var_18_0 = GetTips("POLYHEDRON_BATTLE_GIVE_UP_AND_SETTLE")
		else
			var_18_0 = GetTips("GIVE_UP_BATTLE")
		end

		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = var_18_0,
			OkCallback = function()
				gameContext:DestroyCurRoutes()

				if arg_15_0.params_.stageData:GetIsCooperation() then
					local var_19_0 = BattleFieldData:GetServerBattleID()

					CooperationAction.LeaveCooperationBattle(function(arg_20_0)
						BattleInstance.QuitBattle(arg_15_0.params_.stageData, true, true)
					end, var_19_0)
				else
					LuaExchangeHelper.GameOver(3)
				end
			end
		})
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.restartBtn_, nil, function()
		manager.audio:DestoryCriAtom()
		BattleController.GetInstance():LaunchBattle(arg_15_0.params_.stageData, nil, nil, true)
		LuaForCursor.SwitchCursor(false)
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.polyhedronSettlementBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("POLYHEDRON_BATTLE_GIVE_UP_AND_SETTLE"),
			OkCallback = function()
				PolyhedronAction.QueryPolyhedronGiveUp(function(arg_24_0)
					if isSuccess(arg_24_0.result) then
						manager.audio:PlayBGM("ui_battle", "ui_battle_lose", "ui_battle.awb")
						manager.audio:PlayEffect("ui_battle", "ui_battle_ultimate_out", "")
						manager.audio:PlayEffect("ui_skip", "ui_reset", "")
						AudioManager.Instance:DestoryPlayer("effect")
						DestroyLua()
						LuaExchangeHelper.GoToMain()
						OpenPageUntilLoaded("/polyhedronBlank/polyhedronOver", {})
					else
						ShowTips(arg_24_0.result)
					end
				end)
			end
		})
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.polyhedronQuitBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("GIVE_UP_BATTLE"),
			OkCallback = function()
				manager.audio:PlayBGM("ui_battle", "ui_battle_lose", "ui_battle.awb")
				manager.audio:PlayEffect("ui_battle", "ui_battle_ultimate_out", "")
				manager.audio:PlayEffect("ui_skip", "ui_reset", "")
				AudioManager.Instance:DestoryPlayer("effect")
				DestroyLua()
				LuaExchangeHelper.GoToMain()
				OpenPageUntilLoaded("/polyhedronBlank/polyhedronLobby", {})
			end
		})
	end)
end

function var_0_0.OnTop(arg_27_0)
	arg_27_0:RefreshQuitType()
end

function var_0_0.OnEnter(arg_28_0)
	arg_28_0.toggles = arg_28_0:GetToggleList()

	table.sort(arg_28_0.toggles, function(arg_29_0, arg_29_1)
		return arg_29_0:Order() < arg_29_1:Order()
	end)
	arg_28_0:RefreshBtns()
	arg_28_0.toggleList:StartScroll(#arg_28_0.toggles)

	local var_28_0 = arg_28_0.params_.toggleName
	local var_28_1 = 1

	if var_28_0 then
		for iter_28_0, iter_28_1 in ipairs(arg_28_0.toggles) do
			if iter_28_1:GetName() == var_28_0 then
				var_28_1 = iter_28_0

				break
			end
		end
	end

	arg_28_0:SetSelectPage(var_28_1)
	arg_28_0:RefreshQuitType()

	if arg_28_0.pages.Sound then
		arg_28_0.pages.Sound:OnEnter()
	end
end

function var_0_0.OnExit(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.pages) do
		iter_30_1:OnExit()
	end

	if arg_30_0.isSystem_ then
		manager.windowBar:HideBar()
	else
		manager.windowBar:HideBar()
		LuaExchangeHelper.ApplyBattleSetting()
		arg_30_0:BackFunc()
		LuaExchangeHelper.ContinueGame()
	end

	arg_30_0.isSystem_ = nil
	arg_30_0.selectIndex = -1

	arg_30_0:RecordStay(arg_30_0.params_.selectType)
end

function var_0_0.RecordStay(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetStayTime()

	if var_31_0 == 0 then
		return
	end

	local var_31_1 = 0

	if arg_31_1 == "screen" then
		local var_31_2 = 10201

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_31_0, var_31_2)
	elseif arg_31_1 == "sound" then
		local var_31_3 = 10202

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_31_0, var_31_3)
	elseif arg_31_1 == "game" then
		local var_31_4 = 10203

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_31_0, var_31_4)
	elseif arg_31_1 == "skill" then
		local var_31_5 = arg_31_0.pages.skill and arg_31_0.pages.skill.nType or 1

		arg_31_0:RecordStaySkill(var_31_5)
	end

	arg_31_0:UpdateLastOpenTime()
end

function var_0_0.RecordStaySkill(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:GetStayTime()

	if var_32_0 == 0 then
		return
	end

	local var_32_1 = 0

	if arg_32_1 == 1 then
		var_32_1 = 50201
	elseif arg_32_1 == 2 then
		var_32_1 = 50202
	end

	OperationRecorder.RecordStayView("STAY_VIEW_SETTING_SKILL", var_32_0, var_32_1)
	arg_32_0:UpdateLastOpenTime()
end

function var_0_0.IndexItem(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.toggles[arg_33_1]

	arg_33_2:SetData(arg_33_1, var_33_0)
	arg_33_2:SetSelect(arg_33_0.selectIndex)
	arg_33_2:RegistCallBack(handler(arg_33_0, arg_33_0.SetSelectPage))
end

function var_0_0.SetSelectPage(arg_34_0, arg_34_1)
	if arg_34_1 == arg_34_0.selectIndex then
		return
	end

	arg_34_1 = math.min(arg_34_1, #arg_34_0.toggles)
	arg_34_0.selectIndex = arg_34_1

	local var_34_0 = arg_34_0.toggleList:GetItemList()

	for iter_34_0, iter_34_1 in ipairs(var_34_0) do
		iter_34_1:SetSelect(arg_34_0.selectIndex)
	end

	arg_34_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_35_0)
	if arg_35_0.curPage then
		arg_35_0.curPage:SetActive(false)
	end

	local var_35_0 = arg_35_0.selectIndex
	local var_35_1 = arg_35_0.toggles[var_35_0]
	local var_35_2 = var_35_1:GetName()

	if not arg_35_0.pages[var_35_2] then
		local var_35_3 = var_35_1:GetParams()
		local var_35_4 = Asset.Load(var_35_1:GetPath())
		local var_35_5 = Object.Instantiate(var_35_4, arg_35_0.m_content)

		arg_35_0.pages[var_35_2] = var_35_1:UIClass().New(arg_35_0, var_35_5, var_35_3)
	end

	arg_35_0.curPage = arg_35_0.pages[var_35_2]

	arg_35_0.curPage:SetActive(true)

	if arg_35_0.curPage.class == GraphicSettingPCView or arg_35_0.curPage.class == GraphicSettingView then
		arg_35_0.curPage:RefreshUI()
	end

	SetActive(arg_35_0.resetGo_, var_35_1:IsSetting())
	SetActive(arg_35_0.resetDefGo_, arg_35_0.curPage.ResetDefaultData ~= nil)
end

function var_0_0.RefreshQuitType(arg_36_0)
	if arg_36_0.isSystem_ then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			NAVI_BAR
		})
		manager.windowBar:RegistBackCallBack(function()
			arg_36_0:BackFunc(function()
				arg_36_0:Back()
			end)
		end)
		manager.windowBar:RegistHomeCallBack(function()
			arg_36_0:BackFunc(function()
				arg_36_0:Go("/home")
			end)
		end)
	else
		manager.windowBar:SwitchBar({
			BACK_BAR
		})
		manager.windowBar:RegistBackCallBack(function()
			arg_36_0:BackFunc()

			if arg_36_0:GetIsContinuousFight() then
				arg_36_0:Back()
			else
				gameContext:DestroyCurRoutes()
			end
		end)
	end
end

function var_0_0.GetIsContinuousFight(arg_42_0)
	if arg_42_0.isSystem_ or arg_42_0.params_.stageData == nil then
		return false
	end

	return arg_42_0.params_.stageData:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON
end

function var_0_0.BackFunc(arg_43_0, arg_43_1)
	local var_43_0 = false

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pages) do
		if iter_43_1.CheckDataChange and iter_43_1:CheckDataChange() then
			var_43_0 = true
		end
	end

	if var_43_0 then
		for iter_43_2, iter_43_3 in pairs(arg_43_0.pages) do
			if iter_43_3.SaveData then
				iter_43_3:SaveData()
			end
		end

		OperationRecorder.Record(arg_43_0.class.__cname, "panel/btn_save")
	end

	if arg_43_1 then
		arg_43_1()
	end
end

function var_0_0.GetToggleList(arg_44_0)
	local var_44_0 = arg_44_0.params_.setType or SettingConst.SETTING_TYPE.SYSTEM
	local var_44_1 = arg_44_0.params_.stageData

	arg_44_0.isSystem_ = var_44_0 == SettingConst.SETTING_TYPE.SYSTEM

	local var_44_2 = {}

	if arg_44_0.isSystem_ then
		table.insert(var_44_2, GraphicSettingToggle.New())
	end

	if var_44_1 and not arg_44_0.isSystem_ and (var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX) then
		table.insert(var_44_2, IntelligenceSettingToggle.New({
			arg_44_0.params_
		}))
	end

	table.insert(var_44_2, SoundSettingToggle.New())
	table.insert(var_44_2, GameSettingToggle.New(arg_44_0.params_))

	if not arg_44_0.isSystem_ then
		local var_44_3 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL
		local var_44_4 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON
		local var_44_5 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRONGHOLD
		local var_44_6 = var_44_1 and (var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS)
		local var_44_7 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.ARTIFACT
		local var_44_8 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.MARDUK_SPECIAL
		local var_44_9 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM
		local var_44_10 = var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_RHYTHM_GAME

		if not var_44_3 and not var_44_4 and not var_44_5 and not var_44_6 and not var_44_7 and not var_44_8 and not var_44_9 and not var_44_10 then
			local var_44_11 = {}

			if var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.RACE_TRIAL then
				local var_44_12 = var_44_1:GetActivityID()
				local var_44_13 = RaceTrialData:GetCustomList(var_44_12)
				local var_44_14

				for iter_44_0, iter_44_1 in ipairs(var_44_13) do
					local var_44_15 = ActivityAffixPoolCfg[iter_44_1].affix

					table.insert(var_44_11, {
						var_44_15[1],
						var_44_15[2]
					})
				end
			else
				var_44_11 = var_44_1:GetSettingShowAffix()
			end

			if #var_44_11 > 0 then
				table.insert(var_44_2, AffixSettingToggle.New({
					affixData = var_44_11,
					stageData = var_44_1
				}))
			end
		end
	end

	if not arg_44_0.isSystem_ and var_44_1 and var_44_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.LEVIATHAN_GAME and var_44_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.SKADI_GAME and var_44_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.ACTIVITY_RHYTHM_GAME and not table.keyof(GameSetting.setting_need_not_skill_info.value, var_44_1:GetStageId()) then
		local var_44_16 = GetSceneDataForExcehange().roleDataInLua[0]

		if var_44_16 then
			local var_44_17 = SkinCfg[var_44_16.ID] and SkinCfg[var_44_16.ID].hero

			if not HeroCfg[var_44_17] or HeroCfg[var_44_17].hide_info == 0 then
				table.insert(var_44_2, SkillSettingToggle.New({
					stageData = var_44_1
				}))
			end
		end
	end

	if not arg_44_0.isSystem_ and var_44_1 and (var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS) then
		table.insert(var_44_2, ArtifactSettingToggle.New({
			stageData = var_44_1
		}))
	end

	table.insert(var_44_2, OperationSettingToggle.New())

	if arg_44_0.isSystem_ then
		table.insert(var_44_2, RemindSettingToggle.New())
	end

	if var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_44_2, PolyhedronAdditionSettingToggle.New())
	end

	if var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_44_2, PolyhedronTeamInfoSettingToggle.New())
	end

	if var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_44_2, PolyhedronHeroInfoSettingToggle.New())
	end

	if var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		table.insert(var_44_2, RogueTeamItemInfoSettingToggle.New())
	end

	if var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		table.insert(var_44_2, RogueTeamHeroInfoSettingToggle.New())
	end

	local var_44_18 = #manager.assetPend:GetAssetPendList() > 0

	if arg_44_0.isSystem_ and var_44_18 then
		table.insert(var_44_2, AssetPendSettingToggle.New())
	end

	return var_44_2
end

function var_0_0.RefreshBtns(arg_45_0)
	local var_45_0 = arg_45_0.params_.setType or SettingConst.SETTING_TYPE.SYSTEM
	local var_45_1 = arg_45_0.params_.stageData

	arg_45_0.isSystem_ = var_45_0 == SettingConst.SETTING_TYPE.SYSTEM

	SetActive(arg_45_0.restartGo_, not arg_45_0.isSystem_ and var_45_1 and (var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE or var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON or var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON))
	SetActive(arg_45_0.quitBattleGo_, not arg_45_0.isSystem_ and not arg_45_0.params_.newbie and var_45_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.POLYHEDRON)
	SetActive(arg_45_0.polyhedronSettlementGo_, not arg_45_0.isSystem_ and var_45_1 and var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON)
	SetActive(arg_45_0.polyhedronQuitGo_, not arg_45_0.isSystem_ and var_45_1 and var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON)

	if not arg_45_0.isSystem_ and var_45_1 and var_45_1:GetType() == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		arg_45_0.exitBtnText_.text = GetTips("EXIT_AND_SETTLEMENT")

		if not ChallengeRogueTeamData:IsFinishGuide() then
			SetActive(arg_45_0.quitBattleGo_, false)
		end
	end
end

function var_0_0.Dispose(arg_46_0)
	arg_46_0.toggleList:Dispose()

	for iter_46_0, iter_46_1 in pairs(arg_46_0.pages) do
		iter_46_1:Dispose()
	end

	arg_46_0.pages = {}

	var_0_0.super.Dispose(arg_46_0)
end

function var_0_0.OnExitInput(arg_47_0)
	if not arg_47_0.isSystem_ then
		if arg_47_0:GetIsContinuousFight() then
			arg_47_0:Back()
		else
			gameContext:DestroyCurRoutes()
		end

		LuaExchangeHelper.ContinueGame()

		return true
	end
end

return var_0_0
