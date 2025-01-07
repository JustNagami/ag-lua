local var_0_0 = class("IdolTraineeTrainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/IdolTrainee/IdolTraineeTrainView"
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

	arg_4_0.infoPage_ = IdolTraineeTrainInfoPage.New(arg_4_0.pageGo_)
	arg_4_0.trainBtnItemList_ = {}

	for iter_4_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
		arg_4_0.trainBtnItemList_[iter_4_0] = TrainBtnItem.New(arg_4_0["train" .. iter_4_0 .. "Btn_"])

		arg_4_0.trainBtnItemList_[iter_4_0]:RegisterClickFunc(handler(arg_4_0, arg_4_0.UpdataSelectBtnState))
	end

	arg_4_0.skipShow_ = 0
	arg_4_0.backToDormInfo = false
	arg_4_0.heroList_ = {}
	arg_4_0.curHeroID_ = 0
	arg_4_0.curHeroIndex_ = 0
	arg_4_0.heroUIList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.heroUIList_, IdolTraineeHeadItem)
	arg_4_0.trainAnimController_ = arg_4_0.mainControllerEx_:GetController("trainAnimation")
	arg_4_0.lockController_ = arg_4_0.mainControllerEx_:GetController("lock")
	arg_4_0.SkipTheShowController_ = arg_4_0.mainControllerEx_:GetController("SkipTheShow")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.skipBtn_, nil, function()
		manager.notify:Invoke(ON_FINISH_STORY)
	end)
	arg_5_0:AddBtnListener(arg_5_0.skipShowBtn_, nil, function()
		arg_5_0.skipShow_ = arg_5_0.skipShow_ == 1 and 0 or 1

		arg_5_0.SkipTheShowController_:SetSelectedState(arg_5_0.skipShow_ == 1 and "on" or "off")
		saveData("IdolTrainee", "skip_show", arg_5_0.skipShow_)
	end)
	arg_5_0:AddBtnListener(arg_5_0.countInfoBtn_, nil, function()
		SetActive(arg_5_0.countInfoGo_, true)
	end)
	arg_5_0:AddBtnListener(arg_5_0.countInfoCloseBtn_, nil, function()
		SetActive(arg_5_0.countInfoGo_, false)
	end)
end

function var_0_0.RegisterEvents(arg_10_0)
	arg_10_0:RegistEventListener(IDOL_TRAINEE_TRAIN_HERO_PROPERTY_CALLBACK, function(arg_11_0, arg_11_1, arg_11_2)
		arg_10_0:UpdateView(arg_10_0.curHeroID_, true)
		arg_10_0:RefreshTitle()

		if arg_10_0.skipShow_ == 1 then
			return
		end

		manager.windowBar:HideBar()

		arg_10_0.trainAddIcon_.sprite = getSpriteWithoutAtlas(SpritePathCfg.IdolDanceSkillIcon.path .. "IdolTrainee_icon_skill_00" .. arg_11_1)
		arg_10_0.trainAddName_.text = GetTips("IDOL_SKILL_ATTRIBUTE_" .. arg_11_1)
		arg_10_0.trainAddNum_.text = "+" .. arg_11_2

		arg_10_0.trainAnimController_:SetSelectedState("true")
	end)
	arg_10_0:RegistEventListener(ON_FINISH_STORY, function()
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
		arg_10_0.trainAnimController_:SetSelectedState("false")

		if arg_10_0.curHeroIndex_ and arg_10_0.heroUIList_ then
			arg_10_0.heroUIList_:ScrollToIndex(arg_10_0.curHeroIndex_)
		end
	end)
end

function var_0_0.OnEnter(arg_13_0)
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", true)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_13_0.backToDormInfo = arg_13_0.params_.backToDormInfo or false

	arg_13_0:RegisterEvents()

	arg_13_0.heroList_ = IdolTraineeData:GetIdolHeroList(true)

	table.sort(arg_13_0.heroList_, function(arg_14_0, arg_14_1)
		if HeroTools.GetHeroIsUnlock(arg_14_0) and HeroTools.GetHeroIsUnlock(arg_14_1) then
			local var_14_0 = 0
			local var_14_1 = 0

			for iter_14_0, iter_14_1 in ipairs(IdolTraineeData:GetIdolHeroData(arg_14_0)) do
				var_14_0 = var_14_0 + iter_14_1
			end

			for iter_14_2, iter_14_3 in ipairs(IdolTraineeData:GetIdolHeroData(arg_14_1)) do
				var_14_1 = var_14_1 + iter_14_3
			end

			return var_14_1 < var_14_0
		elseif HeroTools.GetHeroIsUnlock(arg_14_0) then
			return true
		elseif HeroTools.GetHeroIsUnlock(arg_14_1) then
			return false
		else
			return arg_14_0 < arg_14_1
		end
	end)

	arg_13_0.curHeroIndex_ = table.keyof(arg_13_0.heroList_, arg_13_0.params_.heroID) or 1

	arg_13_0:UpdateView(arg_13_0.heroList_[arg_13_0.curHeroIndex_])
	arg_13_0.heroUIList_:StartScroll(#arg_13_0.heroList_)
	arg_13_0.heroUIList_:ScrollToIndex(arg_13_0.curHeroIndex_)
	arg_13_0:RefreshTitle()

	arg_13_0.skipShow_ = getData("IdolTrainee", "skip_show") or 0

	arg_13_0.SkipTheShowController_:SetSelectedState(arg_13_0.skipShow_ == 1 and "on" or "off")
	manager.windowBar:RegistBackCallBack(function()
		arg_13_0:Back()

		if arg_13_0.backToDormInfo then
			arg_13_0.backToDormInfo = false

			JumpTools.OpenPageByJump("/dormChooseRoomView", {
				openInfoPanel = true
			})
		end
	end)
end

function var_0_0.OnExit(arg_16_0)
	manager.windowBar:HideBar()
	SetActive(arg_16_0.countInfoGo_, false)
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", false)
	arg_16_0:RegisterEvents()
end

function var_0_0.IndexItem(arg_17_0, arg_17_1, arg_17_2)
	arg_17_2:SetData(arg_17_0.heroList_[arg_17_1], arg_17_0.curHeroID_, function()
		if arg_17_0.curHeroID_ ~= 0 and arg_17_0.curHeroIndex_ ~= 0 then
			local var_18_0 = arg_17_0.heroUIList_:GetItemByIndex(arg_17_0.curHeroIndex_)

			if var_18_0 then
				var_18_0:SelectOff()
			end
		end

		arg_17_0.curHeroIndex_ = arg_17_1

		arg_17_2:SelectOn()
		arg_17_0:UpdateView(arg_17_0.heroList_[arg_17_1])
	end)
end

function var_0_0.RefreshTitle(arg_19_0)
	local var_19_0 = IdolTraineeTools:GetCurTrainMaxTimes()
	local var_19_1 = IdolTraineeData:GetCurTrainTimes()

	arg_19_0.trainCountText_.text = var_19_0 - var_19_1 .. "/" .. var_19_0

	local var_19_2 = IdolTraineeData:GetCurBuffCamp()
	local var_19_3 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_2) do
		table.insert(var_19_3, iter_19_0)
	end

	if var_19_3[1] then
		SetActive(arg_19_0.race1Img_.gameObject, true)

		arg_19_0.race1Img_.sprite = HeroTools.GetRaceIcon(var_19_3[1])
	else
		SetActive(arg_19_0.race1Img_.gameObject, false)
	end

	if var_19_3[2] then
		SetActive(arg_19_0.race2Img_.gameObject, true)

		arg_19_0.race2Img_.sprite = HeroTools.GetRaceIcon(var_19_3[2])
	else
		SetActive(arg_19_0.race2Img_.gameObject, false)
	end

	local var_19_4 = DormRoomTools:GetUnlockRoomNum()
	local var_19_5
	local var_19_6
	local var_19_7 = GameSetting.dorm_idol_hero_exercise_times_limit.value

	for iter_19_2, iter_19_3 in ipairs(var_19_7) do
		if var_19_4 < iter_19_3[1] then
			var_19_5, var_19_6 = iter_19_3[1], iter_19_3[2]

			break
		end
	end

	if not var_19_5 then
		arg_19_0.countInfoText_.text = GetTips("IDOL_TRAIN_COUNT_MAX_NUM_INFO")
	else
		local var_19_8 = var_19_4
		local var_19_9 = var_19_5

		arg_19_0.countInfoText_.text = string.format(GetTips("IDOL_TRAIN_COUNT_NUM_INFO"), var_19_9, var_19_6, var_19_8)
	end
end

function var_0_0.UpdateView(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.curHeroID_ = arg_20_1

	if not arg_20_2 then
		IdolTraineeCampBridge.SetTrainingCharacter(arg_20_0.curHeroID_)
	end

	local var_20_0 = IdolTraineeTools:GetHeroBattleInfoTemplate(arg_20_0.curHeroID_)

	arg_20_0.infoPage_:RefreshUI(var_20_0)

	if HeroTools.GetHeroIsUnlock(arg_20_1) then
		arg_20_0.lockController_:SetSelectedState("off")

		local var_20_1 = IdolTraineeData:GetIdolHeroData(arg_20_0.curHeroID_)
		local var_20_2 = IdolTraineeTools:GetHeroIdolMaxProperty(arg_20_0.curHeroID_)
		local var_20_3 = DormData:GetHeroTemplateInfo(arg_20_1)
		local var_20_4 = var_20_3:GetFatigue()
		local var_20_5 = IdolTraineeData:GetCurTrainTimes()
		local var_20_6 = IdolTraineeTools:GetCurTrainMaxTimes()
		local var_20_7 = var_20_4 >= GameSetting.dorm_idol_hero_exercise_cost.value[1]
		local var_20_8 = IdolTraineeTools:CheckHeroRaceBuff(arg_20_0.curHeroID_)
		local var_20_9 = var_20_6 <= var_20_5

		for iter_20_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
			local var_20_10 = var_20_1[iter_20_0] >= var_20_2[iter_20_0]

			arg_20_0.trainBtnItemList_[iter_20_0]:SetData(arg_20_0.curHeroID_, iter_20_0, var_20_10, var_20_7, var_20_8, var_20_9)
		end

		arg_20_0.maxFText_.text = "/" .. GameSetting.canteen_hero_fatigue_max.value[1]
		arg_20_0.curFText_.text = var_20_3:GetFatigue()
		arg_20_0.recFText_.text = string.format(GetTips("DORM_FATIGUE_PER_HOUR"), var_20_3:GetRecoverFatigueNum())
	else
		arg_20_0.lockController_:SetSelectedState("on")
	end

	arg_20_0:UpdataSelectBtnState(0)
end

function var_0_0.UpdataSelectBtnState(arg_21_0, arg_21_1)
	arg_21_0.infoPage_:SelectFlashBar(arg_21_1)

	arg_21_0.selIndex = arg_21_1

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.trainBtnItemList_) do
		iter_21_1:RefreshBtnState(arg_21_0.selIndex)
	end
end

function var_0_0.OnIdolPvpStageUpdateFromServer(arg_22_0)
	arg_22_0:UpdateView(arg_22_0.curHeroID_)
	arg_22_0:RefreshTitle()
end

function var_0_0.Dispose(arg_23_0)
	if arg_23_0.heroUIList_ then
		arg_23_0.heroUIList_:Dispose()

		arg_23_0.heroUIList_ = nil
	end

	if arg_23_0.infoPage_ then
		arg_23_0.infoPage_:Dispose()

		arg_23_0.infoPage_ = nil
	end

	for iter_23_0, iter_23_1 in pairs(arg_23_0.trainBtnItemList_) do
		iter_23_1:Dispose()
	end

	var_0_0.super.Dispose(arg_23_0)
end

return var_0_0
