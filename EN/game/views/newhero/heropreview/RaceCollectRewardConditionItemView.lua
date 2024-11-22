local var_0_0 = class("RaceCollectRewardConditionItemView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
	arg_2_0:AddEventListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.statusController_ = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "status")
	arg_3_0.uiList_ = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.uiListGo_, CommonItemView)
end

function var_0_0.indexItem(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = clone(ItemTemplateData)

	var_4_0.id = arg_4_0.cfg_.reward[arg_4_1][1]
	var_4_0.number = arg_4_0.cfg_.reward[arg_4_1][2]

	function var_4_0.clickFun(arg_5_0)
		ShowPopItem(POP_ITEM, arg_4_0.cfg_.reward[arg_4_1])
	end

	arg_4_2:SetData(var_4_0)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.getBtn_, nil, function()
		HeroRaceCollectAction.ReceiveOneTaskReward(arg_6_0.taskId_)
	end)
end

function var_0_0.AddEventListeners(arg_8_0)
	arg_8_0:RegistEventListener(RACE_COLLECT_REWARD_GET, function(arg_9_0)
		if table.indexof(arg_9_0, arg_8_0.taskId_) then
			arg_8_0:UpdateView()
		end
	end)
end

function var_0_0.SetData(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0.index_ = arg_10_1
	arg_10_0.taskId_ = arg_10_2
	arg_10_0.raceId_ = arg_10_3
	arg_10_0.cfg_ = CollectHeroRaceCfg[arg_10_2]

	arg_10_0:UpdateView()
end

function var_0_0.UpdateView(arg_11_0)
	local var_11_0 = arg_11_0.cfg_.need
	local var_11_1 = HeroRaceCollectData:GetHeroRaceCount(arg_11_0.raceId_)
	local var_11_2

	if var_11_0 <= var_11_1 then
		var_11_2 = var_11_0
	else
		var_11_2 = var_11_1
	end

	local var_11_3 = GetI18NText(RaceEffectCfg[arg_11_0.raceId_].name)

	arg_11_0.conditionLabel_.text = string.format(GetTips("COLLECT_HERO_RACE_DES"), var_11_2, var_11_0, var_11_3)

	arg_11_0.uiList_:StartScroll(#arg_11_0.cfg_.reward)

	local var_11_4 = HeroRaceCollectData:GetTaskState(arg_11_0.taskId_)

	if var_11_4 == 0 then
		arg_11_0.statusController_:SetSelectedState("unFinish")
	elseif var_11_4 == 1 then
		arg_11_0.statusController_:SetSelectedState("canGet")
	elseif var_11_4 == 2 then
		arg_11_0.statusController_:SetSelectedState("haveGet")
	end
end

function var_0_0.OnEnter(arg_12_0)
	return
end

function var_0_0.OnExit(arg_13_0)
	return
end

function var_0_0.OnMainHomeViewTop(arg_14_0)
	return
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:RemoveAllEventListener()

	arg_15_0.data_ = nil

	if arg_15_0.uiList_ then
		arg_15_0.uiList_:Dispose()

		arg_15_0.uiList_ = nil
	end

	var_0_0.super.Dispose(arg_15_0)
	Object.Destroy(arg_15_0.gameObject_)
end

return var_0_0
