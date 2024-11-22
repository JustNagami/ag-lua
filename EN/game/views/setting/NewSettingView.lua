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

function var_0_0.InitUI(arg_13_0)
	arg_13_0:BindCfgUI()

	arg_13_0.toggleList = LuaList.New(handler(arg_13_0, arg_13_0.IndexItem), arg_13_0.m_list, SettingToggleItem)
end

function var_0_0.AddListeners(arg_14_0)
	arg_14_0:AddBtnListenerScale(arg_14_0.resetBtn_, nil, function()
		arg_14_0.curPage:RecoverTmpData()
	end)
	arg_14_0:AddBtnListenerScale(arg_14_0.resetDefBtn_, nil, function()
		if arg_14_0.curPage.ResetDefaultData then
			arg_14_0.curPage:ResetDefaultData()
		end
	end)
	arg_14_0:AddBtnListenerScale(arg_14_0.quitBattleBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("GIVE_UP_BATTLE"),
			OkCallback = function()
				gameContext:DestroyCurRoutes()

				if arg_14_0.params_.stageData:GetIsCooperation() then
					local var_18_0 = BattleFieldData:GetServerBattleID()

					CooperationAction.LeaveCooperationBattle(function(arg_19_0)
						BattleInstance.QuitBattle(arg_14_0.params_.stageData, true, true)
					end, var_18_0)
				else
					LuaExchangeHelper.GameOver(3)
				end
			end
		})
	end)
	arg_14_0:AddBtnListenerScale(arg_14_0.restartBtn_, nil, function()
		manager.audio:DestoryCriAtom()
		BattleController.GetInstance():LaunchBattle(arg_14_0.params_.stageData)
	end)
	arg_14_0:AddBtnListenerScale(arg_14_0.polyhedronSettlementBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("POLYHEDRON_BATTLE_GIVE_UP_AND_SETTLE"),
			OkCallback = function()
				PolyhedronAction.QueryPolyhedronGiveUp(function(arg_23_0)
					if isSuccess(arg_23_0.result) then
						manager.audio:PlayBGM("ui_battle", "ui_battle_lose", "ui_battle.awb")
						manager.audio:PlayEffect("ui_battle", "ui_battle_ultimate_out", "")
						manager.audio:PlayEffect("ui_skip", "ui_reset", "")
						AudioManager.Instance:DestoryPlayer("effect")
						DestroyLua()
						LuaExchangeHelper.GoToMain()
						OpenPageUntilLoaded("/polyhedronBlank/polyhedronOver", {})
					else
						ShowTips(arg_23_0.result)
					end
				end)
			end
		})
	end)
	arg_14_0:AddBtnListenerScale(arg_14_0.polyhedronQuitBtn_, nil, function()
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

function var_0_0.OnTop(arg_26_0)
	arg_26_0:RefreshQuitType()
end

function var_0_0.OnEnter(arg_27_0)
	arg_27_0.toggles = arg_27_0:GetToggleList()

	table.sort(arg_27_0.toggles, function(arg_28_0, arg_28_1)
		return arg_28_0:Order() < arg_28_1:Order()
	end)
	arg_27_0:RefreshBtns()
	arg_27_0.toggleList:StartScroll(#arg_27_0.toggles)
	arg_27_0:SetSelectPage(1)
	arg_27_0:RefreshQuitType()
end

function var_0_0.OnExit(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0.pages) do
		iter_29_1:OnExit()
	end

	if arg_29_0.isSystem_ then
		manager.windowBar:HideBar()
	else
		manager.windowBar:HideBar()
		LuaExchangeHelper.ApplyBattleSetting()
	end

	arg_29_0.isSystem_ = nil

	arg_29_0:RecordStay(arg_29_0.params_.selectType)
end

function var_0_0.RecordStay(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetStayTime()

	if var_30_0 == 0 then
		return
	end

	local var_30_1 = 0

	if arg_30_1 == "screen" then
		local var_30_2 = 10201

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_30_0, var_30_2)
	elseif arg_30_1 == "sound" then
		local var_30_3 = 10202

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_30_0, var_30_3)
	elseif arg_30_1 == "game" then
		local var_30_4 = 10203

		OperationRecorder.RecordStayView("STAY_VIEW_SETTING", var_30_0, var_30_4)
	elseif arg_30_1 == "skill" then
		local var_30_5 = arg_30_0.pages.skill and arg_30_0.pages.skill.nType or 1

		arg_30_0:RecordStaySkill(var_30_5)
	end

	arg_30_0:UpdateLastOpenTime()
end

function var_0_0.RecordStaySkill(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetStayTime()

	if var_31_0 == 0 then
		return
	end

	local var_31_1 = 0

	if arg_31_1 == 1 then
		var_31_1 = 50201
	elseif arg_31_1 == 2 then
		var_31_1 = 50202
	end

	OperationRecorder.RecordStayView("STAY_VIEW_SETTING_SKILL", var_31_0, var_31_1)
	arg_31_0:UpdateLastOpenTime()
end

function var_0_0.IndexItem(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.toggles[arg_32_1]

	arg_32_2:SetData(arg_32_1, var_32_0)
	arg_32_2:SetSelect(arg_32_0.selectIndex)
	arg_32_2:RegistCallBack(handler(arg_32_0, arg_32_0.SetSelectPage))
end

function var_0_0.SetSelectPage(arg_33_0, arg_33_1)
	if arg_33_1 == arg_33_0.selectIndex then
		return
	end

	arg_33_1 = math.min(arg_33_1, #arg_33_0.toggles)
	arg_33_0.selectIndex = arg_33_1

	local var_33_0 = arg_33_0.toggleList:GetItemList()

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		iter_33_1:SetSelect(arg_33_0.selectIndex)
	end

	arg_33_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_34_0)
	if arg_34_0.curPage then
		arg_34_0.curPage:SetActive(false)
	end

	local var_34_0 = arg_34_0.selectIndex
	local var_34_1 = arg_34_0.toggles[var_34_0]
	local var_34_2 = var_34_1:GetName()

	if not arg_34_0.pages[var_34_2] then
		local var_34_3 = var_34_1:GetParams()
		local var_34_4 = Asset.Load(var_34_1:GetPath())
		local var_34_5 = Object.Instantiate(var_34_4, arg_34_0.m_content)

		arg_34_0.pages[var_34_2] = var_34_1:UIClass().New(arg_34_0, var_34_5, var_34_3)
	end

	arg_34_0.curPage = arg_34_0.pages[var_34_2]

	arg_34_0.curPage:SetActive(true)

	if arg_34_0.curPage.class == GraphicSettingPCView then
		arg_34_0.curPage:RefreshUI()
	end

	SetActive(arg_34_0.resetGo_, var_34_1:IsSetting())
	SetActive(arg_34_0.resetDefGo_, arg_34_0.curPage.ResetDefaultData ~= nil)
end

function var_0_0.RefreshQuitType(arg_35_0)
	if arg_35_0.isSystem_ then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			NAVI_BAR
		})
		manager.windowBar:RegistBackCallBack(function()
			arg_35_0:BackFunc(function()
				arg_35_0:Back()
			end)
		end)
		manager.windowBar:RegistHomeCallBack(function()
			arg_35_0:BackFunc(function()
				arg_35_0:Go("/home")
			end)
		end)
	else
		manager.windowBar:SwitchBar({
			BACK_BAR
		})
		manager.windowBar:RegistBackCallBack(function()
			arg_35_0:BackFunc()

			if arg_35_0:GetIsContinuousFight() then
				arg_35_0:Back()
			else
				gameContext:DestroyCurRoutes()
			end

			LuaExchangeHelper.ContinueGame()
		end)
	end
end

function var_0_0.GetIsContinuousFight(arg_41_0)
	if arg_41_0.isSystem_ or arg_41_0.params_.stageData == nil then
		return false
	end

	return arg_41_0.params_.stageData:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON
end

function var_0_0.BackFunc(arg_42_0, arg_42_1)
	local var_42_0 = false

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pages) do
		if iter_42_1.CheckDataChange and iter_42_1:CheckDataChange() then
			var_42_0 = true
		end
	end

	if var_42_0 then
		for iter_42_2, iter_42_3 in pairs(arg_42_0.pages) do
			if iter_42_3.SaveData then
				iter_42_3:SaveData()
			end
		end

		OperationRecorder.Record(arg_42_0.class.__cname, "panel/btn_save")
	end

	if arg_42_1 then
		arg_42_1()
	end
end

function var_0_0.GetToggleList(arg_43_0)
	local var_43_0 = arg_43_0.params_.setType or SettingConst.SETTING_TYPE.SYSTEM
	local var_43_1 = arg_43_0.params_.stageData

	arg_43_0.isSystem_ = var_43_0 == SettingConst.SETTING_TYPE.SYSTEM

	local var_43_2 = {}

	if arg_43_0.isSystem_ then
		table.insert(var_43_2, GraphicSettingToggle.New())
	end

	if var_43_1 and not arg_43_0.isSystem_ and (var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX) then
		table.insert(var_43_2, IntelligenceSettingToggle.New({
			arg_43_0.params_
		}))
	end

	table.insert(var_43_2, SoundSettingToggle.New())
	table.insert(var_43_2, GameSettingToggle.New(arg_43_0.params_))

	if not arg_43_0.isSystem_ then
		local var_43_3 = var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL
		local var_43_4 = var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON
		local var_43_5 = var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRONGHOLD
		local var_43_6 = var_43_1 and (var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS)
		local var_43_7 = var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.ARTIFACT
		local var_43_8 = var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.MARDUK_SPECIAL

		if not var_43_3 and not var_43_4 and not var_43_5 and not var_43_6 and not var_43_7 and not var_43_8 then
			local var_43_9 = {}

			if var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.RACE_TRIAL then
				local var_43_10 = var_43_1:GetActivityID()
				local var_43_11 = RaceTrialData:GetCustomList(var_43_10)
				local var_43_12

				for iter_43_0, iter_43_1 in ipairs(var_43_11) do
					local var_43_13 = ActivityAffixPoolCfg[iter_43_1].affix

					table.insert(var_43_9, {
						var_43_13[1],
						var_43_13[2]
					})
				end
			else
				var_43_9 = var_43_1:GetSettingShowAffix()
			end

			if #var_43_9 > 0 then
				table.insert(var_43_2, AffixSettingToggle.New({
					affixData = var_43_9,
					stageData = var_43_1
				}))
			end
		end
	end

	if not arg_43_0.isSystem_ and var_43_1 and var_43_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.LEVIATHAN_GAME and var_43_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.SKADI_GAME and not table.keyof(GameSetting.setting_need_not_skill_info.value, var_43_1:GetStageId()) then
		local var_43_14 = GetSceneDataForExcehange().roleDataInLua[0]

		if var_43_14 then
			local var_43_15 = SkinCfg[var_43_14.ID] and SkinCfg[var_43_14.ID].hero

			if not HeroCfg[var_43_15] or HeroCfg[var_43_15].hide_info == 0 then
				table.insert(var_43_2, SkillSettingToggle.New({
					stageData = var_43_1
				}))
			end
		end
	end

	if not arg_43_0.isSystem_ and var_43_1 and (var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX or var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS) then
		table.insert(var_43_2, ArtifactSettingToggle.New({
			stageData = var_43_1
		}))
	end

	table.insert(var_43_2, OperationSettingToggle.New())

	if arg_43_0.isSystem_ then
		table.insert(var_43_2, RemindSettingToggle.New())
	end

	if var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_43_2, PolyhedronAdditionSettingToggle.New())
	end

	if var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_43_2, PolyhedronTeamInfoSettingToggle.New())
	end

	if var_43_1 and var_43_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		table.insert(var_43_2, PolyhedronHeroInfoSettingToggle.New())
	end

	return var_43_2
end

function var_0_0.RefreshBtns(arg_44_0)
	local var_44_0 = arg_44_0.params_.setType or SettingConst.SETTING_TYPE.SYSTEM
	local var_44_1 = arg_44_0.params_.stageData

	arg_44_0.isSystem_ = var_44_0 == SettingConst.SETTING_TYPE.SYSTEM

	SetActive(arg_44_0.restartGo_, not arg_44_0.isSystem_ and var_44_1 and (var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON or var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON))
	SetActive(arg_44_0.quitBattleGo_, not arg_44_0.isSystem_ and not arg_44_0.params_.newbie and var_44_1:GetType() ~= BattleConst.STAGE_TYPE_NEW.POLYHEDRON)
	SetActive(arg_44_0.polyhedronSettlementGo_, not arg_44_0.isSystem_ and var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON)
	SetActive(arg_44_0.polyhedronQuitGo_, not arg_44_0.isSystem_ and var_44_1 and var_44_1:GetType() == BattleConst.STAGE_TYPE_NEW.POLYHEDRON)
end

function var_0_0.Dispose(arg_45_0)
	arg_45_0.toggleList:Dispose()

	for iter_45_0, iter_45_1 in pairs(arg_45_0.pages) do
		iter_45_1:Dispose()
	end

	arg_45_0.pages = {}

	var_0_0.super.Dispose(arg_45_0)
end

function var_0_0.OnExitInput(arg_46_0)
	if not arg_46_0.isSystem_ then
		if arg_46_0:GetIsContinuousFight() then
			arg_46_0:Back()
		else
			gameContext:DestroyCurRoutes()
		end

		LuaExchangeHelper.ContinueGame()

		return true
	end
end

return var_0_0
