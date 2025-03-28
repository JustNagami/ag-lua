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

	arg_4_0.infoPage_:EnableLockControl(true)

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

		arg_10_0.trainAddIcon_.sprite = pureGetSpriteWithoutAtlas(SpritePathCfg.IdolDanceSkillIcon.path .. "IdolTrainee_icon_skill_00" .. arg_11_1)
		arg_10_0.trainAddName_.text = GetTips("IDOL_SKILL_ATTRIBUTE_" .. arg_11_1)
		arg_10_0.trainAddNum_.text = "+" .. arg_11_2

		arg_10_0.trainAnimController_:SetSelectedState("true")
	end)
	arg_10_0:RegistEventListener(ON_FINISH_STORY, function()
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
		manager.windowBar:RegistBackCallBack(function()
			arg_10_0:Back()

			if arg_10_0.backToDormInfo then
				arg_10_0.backToDormInfo = false

				JumpTools.OpenPageByJump("/dormChooseRoomView", {
					openInfoPanel = true
				})
			end
		end)
		arg_10_0.trainAnimController_:SetSelectedState("false")

		if arg_10_0.curHeroIndex_ and arg_10_0.heroUIList_ then
			arg_10_0.heroUIList_:ScrollToIndex(arg_10_0.curHeroIndex_)
		end
	end)
end

function var_0_0.OnEnter(arg_14_0)
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", true)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_14_0.backToDormInfo = arg_14_0.params_.backToDormInfo or false

	arg_14_0:RegisterEvents()
	arg_14_0.infoPage_:RegisterEvents()

	arg_14_0.heroList_ = IdolTraineeData:GetIdolHeroList(true)

	table.sort(arg_14_0.heroList_, function(arg_15_0, arg_15_1)
		if HeroTools.GetHeroIsUnlock(arg_15_0) and HeroTools.GetHeroIsUnlock(arg_15_1) then
			local var_15_0 = 0
			local var_15_1 = 0

			for iter_15_0, iter_15_1 in ipairs(IdolTraineeData:GetIdolHeroData(arg_15_0)) do
				var_15_0 = var_15_0 + iter_15_1
			end

			for iter_15_2, iter_15_3 in ipairs(IdolTraineeData:GetIdolHeroData(arg_15_1)) do
				var_15_1 = var_15_1 + iter_15_3
			end

			return var_15_1 < var_15_0
		elseif HeroTools.GetHeroIsUnlock(arg_15_0) then
			return true
		elseif HeroTools.GetHeroIsUnlock(arg_15_1) then
			return false
		else
			return arg_15_0 < arg_15_1
		end
	end)

	arg_14_0.curHeroIndex_ = table.keyof(arg_14_0.heroList_, arg_14_0.params_.heroID) or 1

	arg_14_0:UpdateView(arg_14_0.heroList_[arg_14_0.curHeroIndex_])
	arg_14_0.heroUIList_:StartScroll(#arg_14_0.heroList_)
	arg_14_0.heroUIList_:ScrollToIndex(arg_14_0.curHeroIndex_)
	arg_14_0:RefreshTitle()

	arg_14_0.skipShow_ = getData("IdolTrainee", "skip_show") or 0

	arg_14_0.SkipTheShowController_:SetSelectedState(arg_14_0.skipShow_ == 1 and "on" or "off")
	manager.windowBar:RegistBackCallBack(function()
		arg_14_0:Back()

		if arg_14_0.backToDormInfo then
			arg_14_0.backToDormInfo = false

			JumpTools.OpenPageByJump("/dormChooseRoomView", {
				openInfoPanel = true
			})
		end
	end)
end

function var_0_0.OnExit(arg_17_0)
	manager.windowBar:HideBar()
	SetActive(arg_17_0.countInfoGo_, false)
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", false)
	arg_17_0.infoPage_:RemoveAllEventListener()
	arg_17_0:RemoveAllEventListener()
end

function var_0_0.IndexItem(arg_18_0, arg_18_1, arg_18_2)
	arg_18_2:SetData(arg_18_0.heroList_[arg_18_1], arg_18_0.curHeroID_, function()
		if arg_18_0.curHeroID_ ~= 0 and arg_18_0.curHeroIndex_ ~= 0 then
			local var_19_0 = arg_18_0.heroUIList_:GetItemByIndex(arg_18_0.curHeroIndex_)

			if var_19_0 then
				var_19_0:SelectOff()
			end
		end

		arg_18_0.curHeroIndex_ = arg_18_1

		arg_18_2:SelectOn()
		arg_18_0:UpdateView(arg_18_0.heroList_[arg_18_1])
	end)
end

function var_0_0.RefreshTitle(arg_20_0)
	local var_20_0 = IdolTraineeTools:GetCurTrainMaxTimes()
	local var_20_1 = IdolTraineeData:GetCurTrainTimes()

	arg_20_0.trainCountText_.text = var_20_0 - var_20_1 .. "/" .. var_20_0

	local var_20_2 = IdolTraineeData:GetCurBuffCamp()
	local var_20_3 = {}

	for iter_20_0, iter_20_1 in pairs(var_20_2) do
		table.insert(var_20_3, iter_20_0)
	end

	if var_20_3[1] then
		SetActive(arg_20_0.race1Img_.gameObject, true)

		arg_20_0.race1Img_.sprite = HeroTools.GetRaceIcon(var_20_3[1])
	else
		SetActive(arg_20_0.race1Img_.gameObject, false)
	end

	if var_20_3[2] then
		SetActive(arg_20_0.race2Img_.gameObject, true)

		arg_20_0.race2Img_.sprite = HeroTools.GetRaceIcon(var_20_3[2])
	else
		SetActive(arg_20_0.race2Img_.gameObject, false)
	end

	local var_20_4 = DormRoomTools:GetUnlockRoomNum()
	local var_20_5
	local var_20_6
	local var_20_7 = GameSetting.dorm_idol_hero_exercise_times_limit.value

	for iter_20_2, iter_20_3 in ipairs(var_20_7) do
		if var_20_4 < iter_20_3[1] then
			var_20_5, var_20_6 = iter_20_3[1], iter_20_3[2]

			break
		end
	end

	if not var_20_5 then
		arg_20_0.countInfoText_.text = GetTips("IDOL_TRAIN_COUNT_MAX_NUM_INFO")
	else
		local var_20_8 = var_20_4
		local var_20_9 = var_20_5

		arg_20_0.countInfoText_.text = string.format(GetTips("IDOL_TRAIN_COUNT_NUM_INFO"), var_20_9, var_20_6, var_20_8)
	end
end

function var_0_0.UpdateView(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.curHeroID_ = arg_21_1

	if not arg_21_2 then
		IdolTraineeCampBridge.SetTrainingCharacter(arg_21_0.curHeroID_)
	end

	local var_21_0 = IdolTraineeTools:GetHeroBattleInfoTemplate(arg_21_0.curHeroID_)

	arg_21_0.infoPage_:RefreshUI(var_21_0)

	if HeroTools.GetHeroIsUnlock(arg_21_1) then
		arg_21_0.lockController_:SetSelectedState("off")

		local var_21_1 = IdolTraineeData:GetIdolHeroData(arg_21_0.curHeroID_)
		local var_21_2 = IdolTraineeTools:GetHeroIdolMaxProperty(arg_21_0.curHeroID_)
		local var_21_3 = DormData:GetHeroTemplateInfo(arg_21_1)
		local var_21_4 = var_21_3:GetFatigue()
		local var_21_5 = IdolTraineeData:GetCurTrainTimes()
		local var_21_6 = IdolTraineeTools:GetCurTrainMaxTimes()
		local var_21_7 = var_21_4 >= GameSetting.dorm_idol_hero_exercise_cost.value[1]
		local var_21_8 = IdolTraineeTools:CheckHeroRaceBuff(arg_21_0.curHeroID_)
		local var_21_9 = var_21_6 <= var_21_5

		for iter_21_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
			local var_21_10 = var_21_1[iter_21_0] >= var_21_2[iter_21_0]

			arg_21_0.trainBtnItemList_[iter_21_0]:SetData(arg_21_0.curHeroID_, iter_21_0, var_21_10, var_21_7, var_21_8, var_21_9)
		end

		arg_21_0.maxFText_.text = "/" .. GameSetting.canteen_hero_fatigue_max.value[1]
		arg_21_0.curFText_.text = var_21_3:GetFatigue()
		arg_21_0.recFText_.text = string.format(GetTips("DORM_FATIGUE_PER_HOUR"), var_21_3:GetRecoverFatigueNum())
	else
		arg_21_0.lockController_:SetSelectedState("on")
	end

	arg_21_0:UpdataSelectBtnState(0)
end

function var_0_0.UpdataSelectBtnState(arg_22_0, arg_22_1)
	arg_22_0.infoPage_:SelectFlashBar(arg_22_1)

	arg_22_0.selIndex = arg_22_1

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.trainBtnItemList_) do
		iter_22_1:RefreshBtnState(arg_22_0.selIndex)
	end
end

function var_0_0.OnIdolPvpStageUpdateFromServer(arg_23_0)
	arg_23_0:UpdateView(arg_23_0.curHeroID_)
	arg_23_0:RefreshTitle()
end

function var_0_0.Dispose(arg_24_0)
	if arg_24_0.heroUIList_ then
		arg_24_0.heroUIList_:Dispose()

		arg_24_0.heroUIList_ = nil
	end

	if arg_24_0.infoPage_ then
		arg_24_0.infoPage_:Dispose()

		arg_24_0.infoPage_ = nil
	end

	for iter_24_0, iter_24_1 in pairs(arg_24_0.trainBtnItemList_) do
		iter_24_1:Dispose()
	end

	var_0_0.super.Dispose(arg_24_0)
end

return var_0_0
