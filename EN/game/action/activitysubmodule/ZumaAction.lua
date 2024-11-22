local var_0_0 = {}

manager.notify:RegistListener(TASK_LIST_CHANGE_NOTIFY, function()
	var_0_0.CheckZumaRewardRedPoint()
end)
manager.notify:RegistListener(ACTIVITY_UPDATE, function(arg_2_0)
	local var_2_0 = ActivityTools.GetActivityType(arg_2_0)

	if var_2_0 == ActivityTemplateConst.ACTIVITY_ZUMA_ENTER or var_2_0 == ActivityTemplateConst.ACTIVITY_ZUMA then
		var_0_0.CheckZumaRedPoint()
		var_0_0.CheckZumaTalentRedPoint()
	end
end)

function var_0_0.CheckZumaRedPoint()
	local var_3_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ZUMA] or {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		var_0_0.CheckZumaOpenRedPoint(iter_3_1)
	end

	var_0_0.CheckZumaRewardRedPoint()
end

function var_0_0.CheckZumaOpenRedPoint(arg_4_0)
	if not ActivityData:GetActivityIsOpen(arg_4_0) or ZumaData:GetZumaRead(arg_4_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_4_0), 0)

		return
	end

	if ActivityData:GetActivityIsOpen(arg_4_0) then
		local var_4_0 = ZumaData:GetZumaIdByActId(arg_4_0)
		local var_4_1 = ZumaData:GetZumaStageScore(var_4_0)

		if ZumaData:GetZumaBeforeIsFinish(var_4_0) and not var_4_1 then
			manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_4_0), 1)
		else
			manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_4_0), 0)
		end
	else
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_4_0), 0)
	end
end

function var_0_0.CheckZumaRewardRedPoint()
	if #TaskTools:GetCanGetActivityTaskList(ActivityConst.ACTIVITY_ZUMA) <= 0 then
		manager.redPoint:setTip(RedPointConst.ZUMA_REWARD, 0)
	else
		manager.redPoint:setTip(RedPointConst.ZUMA_REWARD, 1)
	end
end

function var_0_0.CheckZumaTalentRedPoint()
	if not ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_ZUMA) or ZumaData:GetZumaRead(ZumaConst.TalentViewID) then
		manager.redPoint:setTip(RedPointConst.ZUMA_TALENT, 0)

		return
	end

	local var_6_0 = ZumaData:GetZumaCoin()
	local var_6_1 = ActivityZumaTalentCfg.all
	local var_6_2 = 0

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_3 = ActivityZumaTalentCfg[iter_6_1]
		local var_6_4 = false

		if not ZumaData:GetZumaTalentRead(iter_6_1) and not ZumaData:GetZumaTalentIsOpen(iter_6_1) then
			if ZumaData:GetZumaTalentIsCanOpen(iter_6_1) and var_6_0 >= var_6_3.need then
				var_6_4 = true
				var_6_2 = 1
			end

			ZumaData:SetTalentRedList(iter_6_1, var_6_4)
		end
	end

	manager.redPoint:setTip(RedPointConst.ZUMA_TALENT, var_6_2)
end

manager.net:Bind(79001, function(arg_7_0)
	ZumaData:InitZumaData(arg_7_0)
	var_0_0.CheckZumaRedPoint()
	ZumaAction.CheckZumaTalentRedPoint()
end)

function var_0_0.QueryZumaCompelet(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	arg_8_2 = arg_8_2 or 1

	manager.net:SendWithLoadingNew(79002, {
		activity_id = arg_8_0,
		id = arg_8_1,
		result = arg_8_2,
		score = arg_8_3,
		useseconds = arg_8_4
	}, 79003, var_0_0.OnZumaCampeletCallBack)
end

function var_0_0.OnZumaCampeletCallBack(arg_9_0, arg_9_1)
	if isSuccess(arg_9_0.result) and arg_9_1.result == 1 then
		ZumaData:UpdateZumaStageData(arg_9_1)
		ZumaData:UpdateZumaCoin(arg_9_0.value)
		var_0_0.CheckZumaRedPoint()
		ZumaAction.CheckZumaTalentRedPoint()
	end
end

function var_0_0.OpenZumaTalent(arg_10_0, arg_10_1)
	arg_10_1 = arg_10_1 or ZumaData:GetZumaActivityID()

	manager.net:SendWithLoadingNew(79004, {
		activity_id = arg_10_1,
		talent_id = arg_10_0
	}, 79005, var_0_0.OnOpenZumaTalentCallBack)
end

function var_0_0.OnOpenZumaTalentCallBack(arg_11_0, arg_11_1)
	if isSuccess(arg_11_0.result) then
		ZumaData:SetUseZumaTalent(arg_11_1.talent_id)
		ZumaData:SetZumaCoin(arg_11_0.value)
		manager.notify:CallUpdateFunc(ZUMA_TALENT_UPDATE, arg_11_1.talent_id)
	end
end

function var_0_0.ResetZumaTalent(arg_12_0)
	arg_12_0 = arg_12_0 or ZumaData:GetZumaActivityID()

	manager.net:SendWithLoadingNew(79006, {
		activity_id = arg_12_0
	}, 79007, var_0_0.OnResetZumaTalentCallBack)
end

function var_0_0.OnResetZumaTalentCallBack(arg_13_0, arg_13_1)
	if isSuccess(arg_13_0.result) then
		ZumaData:ResetTalentList()
		ZumaData:UpdateZumaCoin(arg_13_0.value)
		manager.notify:CallUpdateFunc(ZUMA_TALENT_UPDATE)
	end
end

function var_0_0.PlayZumaGame(arg_14_0)
	arg_14_0 = arg_14_0 or 1

	local var_14_0 = ActivityZumaLevelCfg[arg_14_0]

	if not var_14_0 then
		error("can not find mapCfg")

		return
	end

	if not ActivityData:GetActivityIsOpen(var_14_0.activity_id) then
		ShowTips("TIME_OVER")

		return
	end

	ZumaData:ResetZumaGameData()
	ZumaData:SetZumaBallCount(0)
	ZumaData:SetZumaGameId(arg_14_0)

	local var_14_1 = var_0_0.GetZumaEnterData(var_14_0)

	DestroyLua()
	ZumaLuaBridge.Launcher(var_14_1)
end

function var_0_0.GetZumaEnterData(arg_15_0)
	local var_15_0 = GetZumaDataForExchange()

	var_15_0.mapName = arg_15_0.map
	var_15_0.difficult = arg_15_0.difficult

	local var_15_1 = {}
	local var_15_2 = ZumaData:GetTalentList()

	for iter_15_0, iter_15_1 in pairs(var_15_2 or {}) do
		local var_15_3 = ActivityZumaTalentCfg[iter_15_0]

		if var_15_3 then
			local var_15_4 = ZumaTalentData.New()

			var_15_4.talentType = var_15_3.talent_type
			var_15_4.talentValue = var_15_3.talent_value

			table.insert(var_15_1, var_15_4)
		end
	end

	var_15_0.talentList = var_15_1

	return var_15_0
end

return var_0_0
