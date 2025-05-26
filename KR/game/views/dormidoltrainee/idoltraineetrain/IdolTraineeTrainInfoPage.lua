local var_0_0 = class("IdolTraineeTrainInfoPage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.override1_ = arg_1_2
	arg_1_0.override2_ = arg_1_3

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddUIListener()

	arg_2_0.curHeroID_ = 0
	arg_2_0.curContent_ = 0
	arg_2_0.propertyItemList_ = {}

	for iter_2_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
		arg_2_0.propertyItemList_[iter_2_0] = TrainInfoPropertyItem.New(arg_2_0["property" .. iter_2_0 .. "Go_"])
	end

	arg_2_0.skillItemList_ = {}

	for iter_2_1 = 1, 3 do
		arg_2_0.skillItemList_[iter_2_1] = TrainInfoSkillItem.New(arg_2_0["skill" .. iter_2_1 .. "Go_"])
	end

	arg_2_0.heroAllProperty_ = 0
	arg_2_0.styleData_ = {}
	arg_2_0.styleUIList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexStyleItem), arg_2_0.styleList_, EnterBattleStyleListItem)
	arg_2_0.contentController_ = arg_2_0.mainControllerEx_:GetController("content")
	arg_2_0.flashBarController_ = arg_2_0.mainControllerEx_:GetController("flashBar")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.propertyBtn_, nil, function()
		if arg_3_0.override1_ then
			arg_3_0.override1_()

			return
		end

		arg_3_0:ChangeContent(1)
	end)
	arg_3_0:AddBtnListener(arg_3_0.skillBtn_, nil, function()
		if arg_3_0.override2_ then
			arg_3_0.override2_()

			return
		end

		arg_3_0:ChangeContent(2)
	end)
end

function var_0_0.IndexStyleItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:SetData(arg_6_0.styleData_[arg_6_1])
end

function var_0_0.RefreshUI(arg_7_0, arg_7_1)
	arg_7_0.curContent_ = nil

	if arg_7_1 and arg_7_1.heroID == 0 then
		dump("空状态")
	else
		arg_7_0.template = arg_7_1
		arg_7_0.curHeroID_ = arg_7_1.heroID
		arg_7_0.heroAllProperty_ = 0

		for iter_7_0, iter_7_1 in ipairs(arg_7_0.template.propertyData) do
			arg_7_0.heroAllProperty_ = arg_7_0.heroAllProperty_ + iter_7_1
		end

		if HeroCfg[arg_7_0.curHeroID_] then
			arg_7_0.name_.text = HeroCfg[arg_7_0.curHeroID_].suffix
			arg_7_0.raceIcon_.sprite = HeroTools.GetHeroRaceIcon(arg_7_0.curHeroID_)
		elseif IdolPveNpcCfg[arg_7_0.curHeroID_] then
			arg_7_0.name_.text = IdolPveNpcCfg[arg_7_0.curHeroID_].name

			local var_7_0 = IdolPveNpcCfg[arg_7_0.curHeroID_].race

			arg_7_0.raceIcon_.sprite = HeroTools.GetRaceIcon(var_7_0)
		end

		if BackHomeHeroCfg[arg_7_0.curHeroID_] then
			arg_7_0.styleData_ = BackHomeHeroCfg[arg_7_0.curHeroID_].idol_style

			arg_7_0.styleUIList_:StartScroll(#arg_7_0.styleData_)
		end

		arg_7_0.heroIcon_.sprite = arg_7_1.heroIcon

		arg_7_0:ChangeContent(2)
		arg_7_0:ChangeContent(1)
	end
end

function var_0_0.ChangeContent(arg_8_0, arg_8_1)
	if arg_8_0.curContent_ == arg_8_1 then
		return
	end

	arg_8_0.curContent_ = arg_8_1

	if arg_8_1 == 1 then
		arg_8_0.contentController_:SetSelectedState("property")

		local var_8_0 = arg_8_0.template.propertyData
		local var_8_1 = arg_8_0.template.propertyMax

		for iter_8_0 = 1, DormConst.IDOL_TRAINEE_PROPERTY_COUNT do
			arg_8_0.propertyItemList_[iter_8_0]:SetData(var_8_0[iter_8_0], var_8_1[iter_8_0])
		end
	else
		arg_8_0.contentController_:SetSelectedState("skill")

		local var_8_2 = arg_8_0.template.skill

		for iter_8_1 = 1, #var_8_2 do
			arg_8_0.skillItemList_[iter_8_1]:SetData(var_8_2[iter_8_1], arg_8_0.heroAllProperty_)
			SetActive(arg_8_0.skillItemList_[iter_8_1].gameObject_, true)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.skillItemList_[iter_8_1].transform_)
		end

		for iter_8_2 = #var_8_2 + 1, #arg_8_0.skillItemList_ do
			SetActive(arg_8_0.skillItemList_[iter_8_2].gameObject_, false)
		end

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.skillRootTrs_)
	end
end

function var_0_0.SelectFlashBar(arg_9_0, arg_9_1)
	arg_9_0.flashBarController_:SetSelectedState(arg_9_1)

	if arg_9_1 == 0 then
		return
	end

	arg_9_0.previewTrs_:SetAnchoredPositionY(arg_9_0.propertyItemList_[arg_9_1].transform_.anchoredPosition.y - 284)

	local var_9_0 = DormData:GetHeroTemplateInfo(arg_9_0.template.heroID):GetFatigue()
	local var_9_1 = arg_9_0.template.propertyData[arg_9_1]
	local var_9_2 = arg_9_0.template.propertyMax[arg_9_1]
	local var_9_3 = 10

	for iter_9_0, iter_9_1 in ipairs(GameSetting.dorm_idol_hero_exercise_default_value.value) do
		if var_9_1 / var_9_2 * 100 >= iter_9_1[1] then
			var_9_3 = iter_9_1[2]
		end
	end

	local var_9_4 = 0

	for iter_9_2, iter_9_3 in ipairs(GameSetting.dorm_idol_hero_exercise_fatigue_addition.value) do
		if var_9_0 >= iter_9_3[1] then
			var_9_4 = iter_9_3[2]
		end
	end

	local var_9_5 = 0

	if IdolTraineeTools:CheckHeroRaceBuff(arg_9_0.template.heroID) then
		var_9_5 = GameSetting.dorm_idol_hero_exercise_camp_addition.value[1]
	end

	local var_9_6 = math.floor(var_9_3 * (100 + var_9_4 + var_9_5) / 10000 * GameSetting.dorm_idol_hero_exercise_random.value[1])
	local var_9_7 = math.floor(var_9_3 * (100 + var_9_4 + var_9_5) / 10000 * GameSetting.dorm_idol_hero_exercise_random.value[2])
	local var_9_8 = math.floor(var_9_2 - var_9_1)

	if var_9_7 < var_9_8 then
		arg_9_0.previewText_.text = "+" .. var_9_6 .. "~" .. var_9_7
	elseif var_9_6 < var_9_8 then
		arg_9_0.previewText_.text = "+" .. var_9_6 .. "~" .. var_9_8
	else
		arg_9_0.previewText_.text = "+" .. var_9_8
	end
end

function var_0_0.Dispose(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.propertyItemList_) do
		iter_10_1:Dispose()
	end

	for iter_10_2, iter_10_3 in pairs(arg_10_0.skillItemList_) do
		iter_10_3:Dispose()
	end

	arg_10_0.styleUIList_:Dispose()

	arg_10_0.styleUIList_ = nil

	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
