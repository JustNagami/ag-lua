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

	arg_4_0.heroList_ = {}
	arg_4_0.curHeroID_ = 0
	arg_4_0.curHeroIndex_ = 0
	arg_4_0.heroUIList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.heroUIList_, IdolTraineeHeadItem)
	arg_4_0.trainAnimController_ = arg_4_0.mainControllerEx_:GetController("trainAnimation")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.skipBtn_, nil, function()
		manager.notify:Invoke(ON_FINISH_STORY)
	end)
end

function var_0_0.RegisterEvents(arg_7_0)
	arg_7_0:RegistEventListener(IDOL_TRAINEE_TRAIN_HERO_PROPERTY_CALLBACK, function(arg_8_0, arg_8_1, arg_8_2)
		arg_7_0:UpdateView(arg_7_0.curHeroID_)
		arg_7_0:RefreshTitle()
		manager.windowBar:HideBar()

		arg_7_0.trainAddIcon_.sprite = getSpriteWithoutAtlas(SpritePathCfg.IdolDanceSkillIcon.path .. "IdolTrainee_icon_skill_00" .. arg_8_1)
		arg_7_0.trainAddName_.text = GetTips("IDOL_SKILL_ATTRIBUTE_" .. arg_8_1)
		arg_7_0.trainAddNum_.text = "+" .. arg_8_2

		arg_7_0.trainAnimController_:SetSelectedState("true")
	end)
	arg_7_0:RegistEventListener(ON_FINISH_STORY, function()
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
		arg_7_0.trainAnimController_:SetSelectedState("false")

		if arg_7_0.curHeroIndex_ and arg_7_0.heroUIList_ then
			arg_7_0.heroUIList_:ScrollToIndex(arg_7_0.curHeroIndex_)
		end
	end)
end

function var_0_0.OnEnter(arg_10_0)
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", true)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	arg_10_0:RegisterEvents()

	arg_10_0.heroList_ = IdolTraineeData:GetIdolHeroList()
	arg_10_0.curHeroIndex_ = table.keyof(arg_10_0.heroList_, arg_10_0.params_.heroID) or 1

	arg_10_0:UpdateView(arg_10_0.heroList_[arg_10_0.curHeroIndex_])
	arg_10_0.heroUIList_:StartScroll(#arg_10_0.heroList_)
	arg_10_0.heroUIList_:ScrollToIndex(arg_10_0.curHeroIndex_)
	arg_10_0:RefreshTitle()
end

function var_0_0.OnExit(arg_11_0)
	manager.windowBar:HideBar()
	IdolTraineeCampBridge.SetVCamActive("CamShootAtTrainningPos", false)
	arg_11_0:RegisterEvents()
end

function var_0_0.IndexItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:SetData(arg_12_0.heroList_[arg_12_1], arg_12_0.curHeroID_, function()
		if arg_12_0.curHeroID_ ~= 0 and arg_12_0.curHeroIndex_ ~= 0 then
			local var_13_0 = arg_12_0.heroUIList_:GetItemByIndex(arg_12_0.curHeroIndex_)

			if var_13_0 then
				var_13_0:SelectOff()
			end
		end

		arg_12_0.curHeroIndex_ = arg_12_1

		arg_12_2:SelectOn()
		arg_12_0:UpdateView(arg_12_0.heroList_[arg_12_1])
	end)
end

function var_0_0.RefreshTitle(arg_14_0)
	local var_14_0 = IdolTraineeTools:GetCurTrainMaxTimes()
	local var_14_1 = IdolTraineeData:GetCurTrainTimes()

	arg_14_0.trainCountText_.text = var_14_0 - var_14_1 .. "/" .. var_14_0

	local var_14_2 = IdolTraineeData:GetCurBuffCamp()
	local var_14_3 = {}

	for iter_14_0, iter_14_1 in pairs(var_14_2) do
		table.insert(var_14_3, iter_14_0)
	end

	if var_14_3[1] then
		SetActive(arg_14_0.race1Img_.gameObject, true)

		arg_14_0.race1Img_.sprite = HeroTools.GetRaceIcon(var_14_3[1])
	else
		SetActive(arg_14_0.race1Img_.gameObject, false)
	end

	if var_14_3[2] then
		SetActive(arg_14_0.race2Img_.gameObject, true)

		arg_14_0.race2Img_.sprite = HeroTools.GetRaceIcon(var_14_3[2])
	else
		SetActive(arg_14_0.race2Img_.gameObject, false)
	end
end

function var_0_0.UpdateView(arg_15_0, arg_15_1)
	arg_15_0.curHeroID_ = arg_15_1

	IdolTraineeCampBridge.SetTrainingCharacter(arg_15_0.curHeroID_)

	local var_15_0 = IdolTraineeTools:GetHeroBattleInfoTemplate(arg_15_0.curHeroID_)

	arg_15_0.infoPage_:RefreshUI(var_15_0)

	local var_15_1 = IdolTraineeData:GetIdolHeroData(arg_15_0.curHeroID_)
	local var_15_2 = IdolTraineeTools:GetHeroIdolMaxProperty(arg_15_0.curHeroID_)
	local var_15_3 = DormData:GetHeroTemplateInfo(arg_15_1)
	local var_15_4 = var_15_3:GetFatigue()
	local var_15_5 = IdolTraineeData:GetCurTrainTimes()
	local var_15_6 = IdolTraineeTools:GetCurTrainMaxTimes()
	local var_15_7 = var_15_4 >= GameSetting.dorm_idol_hero_exercise_cost.value[1]
	local var_15_8 = IdolTraineeTools:CheckHeroRaceBuff(arg_15_0.curHeroID_)
	local var_15_9 = var_15_6 <= var_15_5

	for iter_15_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
		local var_15_10 = var_15_1[iter_15_0] >= var_15_2[iter_15_0]

		arg_15_0.trainBtnItemList_[iter_15_0]:SetData(arg_15_0.curHeroID_, iter_15_0, var_15_10, var_15_7, var_15_8, var_15_9)
	end

	arg_15_0.maxFText_.text = "/" .. GameSetting.canteen_hero_fatigue_max.value[1]
	arg_15_0.curFText_.text = var_15_3:GetFatigue()
	arg_15_0.recFText_.text = string.format(GetTips("DORM_FATIGUE_PER_HOUR"), var_15_3:GetRecoverFatigueNum())

	arg_15_0:UpdataSelectBtnState(0)
end

function var_0_0.UpdataSelectBtnState(arg_16_0, arg_16_1)
	arg_16_0.infoPage_:SelectFlashBar(arg_16_1)

	arg_16_0.selIndex = arg_16_1

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.trainBtnItemList_) do
		iter_16_1:RefreshBtnState(arg_16_0.selIndex)
	end
end

function var_0_0.OnIdolPvpStageUpdateFromServer(arg_17_0)
	arg_17_0:UpdateView(arg_17_0.curHeroID_)
	arg_17_0:RefreshTitle()
end

function var_0_0.Dispose(arg_18_0)
	if arg_18_0.heroUIList_ then
		arg_18_0.heroUIList_:Dispose()

		arg_18_0.heroUIList_ = nil
	end

	if arg_18_0.infoPage_ then
		arg_18_0.infoPage_:Dispose()

		arg_18_0.infoPage_ = nil
	end

	for iter_18_0, iter_18_1 in pairs(arg_18_0.trainBtnItemList_) do
		iter_18_1:Dispose()
	end

	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
