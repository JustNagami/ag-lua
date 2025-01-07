local var_0_0 = class("AreaBattleChapterSectionView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_SeizuresUI/NormalfightingChapterSectionInfoUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.stateController = arg_4_0.controller_:GetController("state")
	arg_4_0.head1Controller = arg_4_0.head1Controller_:GetController("show")
	arg_4_0.head2Controller = arg_4_0.head2Controller_:GetController("show")
	arg_4_0.head3Controller = arg_4_0.head3Controller_:GetController("show")

	for iter_4_0 = 1, 6 do
		arg_4_0["condition" .. iter_4_0 .. "Controller"] = arg_4_0["condition" .. iter_4_0 .. "Controller_"]:GetController("default0")
	end

	arg_4_0.proxy = HeroViewDataProxy.New(1)
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0:RefreshData()
	arg_5_0:RefreshUI()
	arg_5_0:UpdateBar()
end

function var_0_0.OnAreaBattleAreaRefresh(arg_6_0, arg_6_1)
	arg_6_0.params_.stageID = arg_6_1

	arg_6_0:RefreshData()
	arg_6_0:RefreshUI()
end

function var_0_0.UpdateBar(arg_7_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnExit(arg_8_0)
	for iter_8_0 = 1, 3 do
		arg_8_0.params_.parent["select" .. iter_8_0 .. "Controller"]:SetSelectedState("false")
	end

	arg_8_0.params_.parent.rewardBtn_.interactable = true
	arg_8_0.params_.parent.isOpen = nil

	arg_8_0.params_.parent.moveController:SetSelectedState("0")

	arg_8_0.params_.selectIndex = nil

	arg_8_0.super.OnExit(arg_8_0)
	manager.windowBar:HideBar()
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.startBtn_, nil, function()
		local var_10_0 = ActivityAreaBattleCfg[arg_9_0.activityID]
		local var_10_1 = false

		for iter_10_0, iter_10_1 in pairs(var_10_0.stage_id) do
			if iter_10_1[#iter_10_1] == arg_9_0.stageID then
				var_10_1 = true
			end
		end

		if var_10_1 then
			JumpTools.GoToSystem("/AreaBattleSelectView", {
				stageID = arg_9_0.stageID,
				activityID = arg_9_0.activityID,
				mainActivityID = arg_9_0.mainActivityID
			})
		else
			gameContext:Go("/sectionSelectHero", {
				section = arg_9_0.stageID,
				sectionType = BattleConst.STAGE_TYPE_NEW.AREA_BATTLE,
				activityID = arg_9_0.activityID,
				mainActivityID = arg_9_0.mainActivityID,
				difficult = arg_9_0.difficult
			})
		end
	end)
	arg_9_0:AddBtnListener(arg_9_0.maskBtn_, nil, function()
		arg_9_0:Back()
	end)
	arg_9_0:AddBtnListener(arg_9_0.resetBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("ACTIVITY_AREA_BATTLE_RESETTING_CONFIRM_TIP1"),
			OkCallback = function()
				local var_13_0 = {
					arg_9_0.stageID
				}

				if #var_13_0 == 0 then
					ShowTips("ACTIVITY_AREA_BATTLE_RESETTING_FAIL")

					return
				end

				AreaBattleAction.ResetBattleData(arg_9_0.activityID, var_13_0)
			end
		})
	end)
end

function var_0_0.OnAreaBattleAreaReset(arg_14_0)
	arg_14_0:RefreshData()
	arg_14_0:RefreshUI()
end

function var_0_0.RefreshData(arg_15_0)
	arg_15_0.stageID = arg_15_0.params_.stageID or arg_15_0.stageID
	arg_15_0.params_.parent.isOpen = true
	arg_15_0.activityID = arg_15_0.params_.activityID
	arg_15_0.mainActivityID = arg_15_0.params_.mainActivityID
	arg_15_0.difficult = arg_15_0.params_.difficult
	arg_15_0.cfg = BattleAreaBattleCfg[arg_15_0.stageID]
	arg_15_0.data = ActivityAreaBattleData:GetDataByActivityID(arg_15_0.mainActivityID)[arg_15_0.activityID]
	arg_15_0.maxPoint = 0

	for iter_15_0, iter_15_1 in pairs(arg_15_0.data.difficultList[arg_15_0.difficult] or {}) do
		if iter_15_0 ~= arg_15_0.stageID then
			arg_15_0.maxPoint = arg_15_0.maxPoint + iter_15_1.point
		end
	end

	local var_15_0 = 0

	if arg_15_0.data.difficultList[arg_15_0.difficult] and arg_15_0.data.difficultList[arg_15_0.difficult][arg_15_0.stageID] then
		var_15_0 = arg_15_0.data.difficultList[arg_15_0.difficult][arg_15_0.stageID].point
	end

	for iter_15_2 = 1, 6 do
		arg_15_0["condition" .. iter_15_2 .. "Controller"]:SetSelectedState(var_15_0 < iter_15_2 and "state0" or "state1")
	end

	for iter_15_3 = 1, 3 do
		arg_15_0["condition" .. iter_15_3 .. "Txt_"].text = string.format(GetTips("ACTIVITY_AREA_BATTLE_STAGE_CONDITION"), GameSetting.activity_area_battle_point_arg.value[4 - iter_15_3][1])
	end
end

function var_0_0.RefreshUI(arg_16_0)
	local var_16_0 = ActivityAreaBattleCfg[arg_16_0.activityID]
	local var_16_1 = false

	for iter_16_0, iter_16_1 in pairs(var_16_0.stage_id) do
		if iter_16_1[#iter_16_1] == arg_16_0.stageID then
			var_16_1 = true
		end
	end

	arg_16_0.stateController:SetSelectedState(var_16_1 and "hard" or "normal")

	arg_16_0.params_.parent.rewardBtn_.interactable = false
	arg_16_0.totalTxt_.text = arg_16_0.maxPoint .. "/12"

	SetActive(arg_16_0.noTxt_.gameObject, arg_16_0.data.allChallengeValue == 0)
	SetActive(arg_16_0.highScoreTxt_.gameObject, arg_16_0.data.allChallengeValue ~= 0)

	if arg_16_0.data.difficultList[arg_16_0.difficult] and arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID] then
		arg_16_0.highScoreTxt_.text = arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID].point
	else
		arg_16_0.highScoreTxt_.text = 0
	end

	if arg_16_0.data.difficultList[arg_16_0.difficult] == nil or arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID] == nil then
		for iter_16_2 = 1, 3 do
			arg_16_0["head" .. iter_16_2 .. "Controller"]:SetSelectedState("false")
		end
	else
		for iter_16_3 = 1, 3 do
			if arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID].usedHeroList[iter_16_3] then
				local var_16_2 = arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID].usedHeroList[iter_16_3] % 10000

				if HeroStandardSystemCfg[arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID].usedHeroList[iter_16_3]] then
					arg_16_0["icon" .. iter_16_3 .. "Image_"].sprite = getSpriteViaConfig("HeroLittleIcon", HeroStandardSystemCfg[arg_16_0.data.difficultList[arg_16_0.difficult][arg_16_0.stageID].usedHeroList[iter_16_3]].skin_id)
				else
					arg_16_0["icon" .. iter_16_3 .. "Image_"].sprite = getSpriteViaConfig("HeroLittleIcon", arg_16_0.proxy:GetHeroUsingSkinInfo(var_16_2).id)
				end

				arg_16_0["head" .. iter_16_3 .. "Controller"]:SetSelectedState("true")
			else
				arg_16_0["head" .. iter_16_3 .. "Controller"]:SetSelectedState("false")
			end
		end
	end

	arg_16_0:RefreshTitleDesc()
end

function var_0_0.RefreshTitleDesc(arg_17_0)
	arg_17_0.nameTxt_.text = arg_17_0.cfg.name
	arg_17_0.bgIcon_.sprite = getSpriteWithoutAtlas(string.format("%s%s", SpritePathCfg.Stage.path, BattleAreaBattleCfg[arg_17_0.stageID].background_1))
end

function var_0_0.Dispose(arg_18_0)
	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
