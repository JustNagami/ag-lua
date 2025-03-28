local var_0_0 = class("DormInfomationTrainSetHeroView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormModifierEnterPop"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

local function var_0_1(arg_3_0, arg_3_1)
	return function(arg_4_0, arg_4_1)
		local var_4_0 = arg_3_0.originalDataIdx
		local var_4_1 = arg_4_0.archives_id
		local var_4_2 = arg_4_1.archives_id
		local var_4_3 = nullable(var_4_0, var_4_1) or 0
		local var_4_4 = nullable(var_4_0, var_4_2) or 0
		local var_4_5

		if arg_3_1 then
			var_4_5 = var_4_4 < var_4_3
		else
			var_4_5 = var_4_3 < var_4_4
		end

		if var_4_5 then
			return true
		elseif var_4_3 == var_4_4 then
			return var_4_1 < var_4_2
		end

		return false
	end
end

function var_0_0.Init(arg_5_0)
	arg_5_0:InitUI()
	arg_5_0:AddUIListener()

	arg_5_0.removeOpSortFunc = var_0_1(arg_5_0, true)
end

function var_0_0.BuildContext(arg_6_0)
	arg_6_0.tempPosStore = {}
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0:BindCfgUI()
	arg_7_0:InitView()
end

function var_0_0.InitView(arg_8_0)
	arg_8_0.holder = {}

	for iter_8_0 = 1, 5 do
		table.insert(arg_8_0.holder, DormInfomationHeroItem.New(arg_8_0["heroItem" .. iter_8_0]))
		arg_8_0.holder[iter_8_0]:SetState(true)
	end

	arg_8_0.characterScroll = LuaList.New(handler(arg_8_0, arg_8_0.IndexItem), arg_8_0.heroList_, DormInfomationHeroItem)
end

function var_0_0.AddUIListener(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.maskBtn_, nil, function()
		arg_9_0:Save()
	end)
	arg_9_0:AddBtnListener(arg_9_0.okBtn_, nil, function()
		arg_9_0:Save()
	end)
	arg_9_0:RegistEventListener(DORM_REFRESH_HERO_DEPLOY_LIST, function()
		arg_9_0:Refresh()
	end)
end

function var_0_0.SetHeroInPos(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.tempPosStore[arg_13_1] = arg_13_2
end

function var_0_0.OnEnter(arg_14_0)
	arg_14_0:BuildContext()

	arg_14_0.state = arg_14_0.params_.state
	arg_14_0.editTempRemoveList = {}

	if arg_14_0.state == "train" then
		arg_14_0:RenderTrainSelectHero()
		arg_14_0:RenderTrainHero()
	elseif arg_14_0.state == "dorm" then
		arg_14_0:RenderDormSelectHero()
		arg_14_0:RenderDormHero()
	end

	arg_14_0:RecordOriginalDataIndex()
end

function var_0_0.RecordOriginalDataIndex(arg_15_0)
	arg_15_0.originalDataIdx = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.holder) do
		local var_15_0 = iter_15_1.heroID

		if var_15_0 then
			arg_15_0.originalDataIdx[DormData:GetHeroArchiveID(var_15_0)] = iter_15_0
		end
	end
end

function var_0_0.RecordTempRemove(arg_16_0, arg_16_1)
	arg_16_0.editTempRemoveList[DormData:GetHeroArchiveID(arg_16_1)] = arg_16_1

	arg_16_0:RefreshAllRemovedFromTrainingHeroState()
end

function var_0_0.CancelTempRemove(arg_17_0, arg_17_1)
	arg_17_0.editTempRemoveList[DormData:GetHeroArchiveID(arg_17_1)] = nil

	arg_17_0:RefreshAllRemovedFromTrainingHeroState()
end

function var_0_0.RenderDormSelectHero(arg_18_0)
	arg_18_0.dataList = arg_18_0:GetDormHeroList()

	arg_18_0.characterScroll:StartScroll(#arg_18_0.dataList)
end

function var_0_0.RenderDormHero(arg_19_0)
	local var_19_0 = DormData:GetHeroInfoList()
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		if iter_19_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm then
			table.insert(var_19_1, iter_19_1.hero_id)
		end
	end

	for iter_19_2 = 1, 5 do
		if var_19_1[iter_19_2] then
			arg_19_0.holder[iter_19_2]:SetData({
				heroID = var_19_1[iter_19_2]
			})
			arg_19_0.holder[iter_19_2]:RegistCallBack(function(arg_20_0)
				arg_19_0:OnHolderHeroItemClick(arg_20_0, iter_19_2)
			end)
		else
			arg_19_0.holder[iter_19_2]:SetData(nil)
			arg_19_0.holder[iter_19_2]:RegistCallBack(function()
				arg_19_0:OnHolderHeroItemClick(nil)
			end)
		end
	end
end

function var_0_0.RenderTrainHero(arg_22_0)
	local var_22_0 = IdolTraineeData:GetHeroPosList()

	for iter_22_0 = 1, 5 do
		if var_22_0[iter_22_0] then
			if arg_22_0:CheckIsSameHero(var_22_0[iter_22_0], arg_22_0.tempPosStore[iter_22_0]) then
				var_22_0[iter_22_0] = arg_22_0.tempPosStore[iter_22_0] or var_22_0[iter_22_0]
			end

			arg_22_0:SetHeroInPos(iter_22_0, var_22_0[iter_22_0])
			arg_22_0.holder[iter_22_0]:SetData({
				heroID = var_22_0[iter_22_0]
			})
			arg_22_0.holder[iter_22_0]:RegistCallBack(function(arg_23_0)
				arg_22_0:OnHolderHeroItemClick(var_22_0[iter_22_0], iter_22_0)
			end)
		else
			arg_22_0.holder[iter_22_0]:SetData(nil)
			arg_22_0.holder[iter_22_0]:RegistCallBack(function()
				arg_22_0:OnHolderHeroItemClick(nil)
			end)
		end
	end
end

function var_0_0.CheckIsSameHero(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_1 == nil or arg_25_2 == nil then
		return false
	end

	return DormData:GetHeroArchiveID(arg_25_1) == DormData:GetHeroArchiveID(arg_25_2)
end

function var_0_0.RenderTrainSelectHero(arg_26_0)
	arg_26_0.dataList = IdolTraineeData:GetIdolHeroList()

	arg_26_0.characterScroll:StartScroll(#arg_26_0.dataList)
end

local function var_0_2(arg_27_0)
	if not arg_27_0 then
		return true
	end

	local var_27_0 = DormData:GetHeroTemplateInfo(arg_27_0)

	if var_27_0 then
		local var_27_1 = var_27_0:GetHeroState()

		if var_27_1 == DormEnum.DormHeroState.InCanteenEntrust or var_27_1 == DormEnum.DormHeroState.InCanteenJob then
			return true
		end

		return false
	end
end

function var_0_0.IndexItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.dataList[arg_28_1]

	arg_28_2:SetState(false)
	arg_28_2:SetShowMaskCallback(var_0_2)
	arg_28_2:SetData({
		heroID = var_28_0
	})
	arg_28_2:RefreshState()
	arg_28_2:RegistCallBack(function(arg_29_0)
		local var_29_0

		if arg_28_0.state == "train" then
			var_29_0 = arg_28_0:OnHeroItemClick(arg_29_0)
		elseif arg_28_0.state == "dorm" then
			var_29_0 = arg_28_0:OnDormHeroItemClick(arg_29_0)
		end

		if var_29_0 then
			arg_28_0:CancelTempRemove(arg_29_0)
		end
	end)
end

function var_0_0.OnDormHeroItemClick(arg_30_0, arg_30_1)
	local var_30_0 = DormData:GetHeroInfoList()
	local var_30_1 = {}
	local var_30_2 = 1

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		if iter_30_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm then
			if arg_30_0:CheckIsSameHero(iter_30_1.hero_id, arg_30_1) then
				arg_30_0:OnHolderHeroItemClick(iter_30_1.hero_id, var_30_2)

				return false
			end

			table.insert(var_30_1, iter_30_1.hero_id)

			var_30_2 = var_30_2 + 1
		end
	end

	if #var_30_1 == 5 then
		return false
	end

	local var_30_3 = DormData:GetHeroTemplateInfo(arg_30_1)

	if var_30_3 then
		local var_30_4 = var_30_3:GetHeroState()

		if var_30_4 == DormEnum.DormHeroState.InCanteenJob or var_30_4 == DormEnum.DormHeroState.InCanteenEntrust then
			ShowTips(GetTips("BACKHOME_HERO_OCCUPYED"))

			return false
		end
	end

	table.insert(var_30_1, arg_30_1)
	DormAction:DeployHeroInRoom(DormConst.PUBLIC_DORM_ID, var_30_1, DormEnum.DormDeployType.Place)
	arg_30_0:Refresh()

	return true
end

function var_0_0.OnHeroItemClick(arg_31_0, arg_31_1)
	local var_31_0 = -1
	local var_31_1 = IdolTraineeData:GetHeroPosList()

	for iter_31_0 = 1, 5 do
		local var_31_2 = DormData:GetHeroArchiveID(var_31_1[iter_31_0])
		local var_31_3 = DormData:GetHeroArchiveID(arg_31_1)

		if var_31_1[iter_31_0] and var_31_1[iter_31_0] > 0 and var_31_2 == var_31_3 then
			arg_31_0:OnHolderHeroItemClick(arg_31_1, iter_31_0)

			return false
		end
	end

	for iter_31_1 = 1, 5 do
		if not var_31_1[iter_31_1] then
			var_31_0 = iter_31_1

			break
		end
	end

	if var_31_0 == -1 then
		return false
	end

	local var_31_4 = DormData:GetHeroTemplateInfo(arg_31_1)

	if var_31_4 then
		local var_31_5 = var_31_4:GetHeroState()

		if var_31_5 == DormEnum.DormHeroState.InCanteenJob or var_31_5 == DormEnum.DormHeroState.InCanteenEntrust then
			ShowTips(GetTips("BACKHOME_HERO_OCCUPYED"))

			return false
		end
	end

	if var_31_0 ~= -1 then
		arg_31_0:SetHeroInPos(var_31_0, arg_31_1)
		IdolTraineeCampBridge.SetPosOfHero(arg_31_1, var_31_0)
	end

	arg_31_0:Refresh()

	return true
end

local function var_0_3(arg_32_0)
	local var_32_0 = arg_32_0.editTempRemoveList
	local var_32_1 = arg_32_0.removeOpSortFunc
	local var_32_2 = {}

	for iter_32_0, iter_32_1 in pairs(var_32_0) do
		local var_32_3 = DormData:GetHeroTemplateInfo(iter_32_1)

		table.insert(var_32_2, var_32_3)
	end

	table.sort(var_32_2, var_32_1)

	return var_32_2
end

function var_0_0.RefreshAllRemovedFromTrainingHeroState(arg_33_0)
	local var_33_0 = var_0_3(arg_33_0)

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		iter_33_1:EnsureNotInPublicHall()
	end

	for iter_33_2, iter_33_3 in ipairs(var_33_0) do
		iter_33_3:BackToDorm()
	end

	manager.notify:Invoke(DORM_REFRESH_HERO_DEPLOY_LIST)
end

function var_0_0.OnHolderHeroItemClick(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_1 == nil then
		return
	end

	if arg_34_0.state == "train" then
		arg_34_0:RecordTempRemove(arg_34_1)
		arg_34_0:SetHeroInPos(arg_34_2, nil)
	elseif arg_34_0.state == "dorm" then
		local var_34_0 = DormData:GetHeroInfoList()
		local var_34_1 = {}

		for iter_34_0, iter_34_1 in pairs(var_34_0) do
			if iter_34_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm and iter_34_1.hero_id ~= arg_34_1 then
				table.insert(var_34_1, iter_34_1.hero_id)
			end
		end

		DormAction:DeployHeroInRoom(DormConst.PUBLIC_DORM_ID, var_34_1, DormEnum.DormDeployType.Place)
	end

	arg_34_0:Refresh()
end

function var_0_0.Refresh(arg_35_0)
	if arg_35_0.state == "train" then
		arg_35_0:RenderTrainHero()
	elseif arg_35_0.state == "dorm" then
		arg_35_0:RenderDormHero()
	end

	arg_35_0.characterScroll:Refresh()
end

function var_0_0.Save(arg_36_0)
	if arg_36_0.state == "train" then
		arg_36_0:SaveTrainList()
	elseif arg_36_0.state == "dorm" then
		arg_36_0:SaveDormList()
	end
end

function var_0_0.SaveDormList(arg_37_0)
	manager.notify:Invoke(DORM_REGENERATE_HERO)
	JumpTools.Back()
end

function var_0_0.SaveTrainList(arg_38_0)
	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0.tempPosStore) do
		table.insert(var_38_0, {
			hero_id = iter_38_1,
			pos = iter_38_0
		})
	end

	IdolTraineeAction.RequestSetHeroPos(var_38_0, function()
		BackHomeAction:GetAllDetailInfo(function()
			return
		end)
		manager.notify:Invoke(DORM_REGENERATE_HERO)
		JumpTools.Back()
	end)
end

function var_0_0.OnExit(arg_41_0)
	arg_41_0.editTempRemoveList = nil
end

function var_0_0.GetDormHeroList()
	local var_42_0 = DormHeroTools:GetBackHomeCanUseHeroList(DormConst.PUBLIC_DORM_ID)

	CommonTools.UniversalSortEx(var_42_0, {
		ascend = true,
		map = function(arg_43_0)
			local var_43_0 = DormData:GetHeroTemplateInfo(arg_43_0):GetHeroState()

			if var_43_0 == DormEnum.DormHeroState.InPublicDorm then
				return 1
			elseif var_43_0 == DormEnum.DormHeroState.OutDorm then
				return 2
			elseif var_43_0 == DormEnum.DormHeroState.InPrivateDorm then
				return 3
			elseif var_43_0 == DormEnum.DormHeroState.InCanteenJob then
				local var_43_1 = DormData:GetHeroTemplateInfo(arg_43_0).jobType

				if var_43_1 == DormNpcTools.BackHomeNpcType.cook then
					return 4
				elseif var_43_1 == DormNpcTools.BackHomeNpcType.waiter then
					return 5
				elseif var_43_1 == DormNpcTools.BackHomeNpcType.cashier then
					return 6
				end
			elseif var_43_0 == DormEnum.DormHeroState.InCanteenEntrust then
				return 7
			elseif var_43_0 == DormEnum.DormHeroState.InIdolTraineeCamp then
				return 8
			end
		end
	}, {
		ascend = true,
		map = function(arg_44_0)
			return (DormData:GetHeroTemplateInfo(arg_44_0):GetFatigue())
		end
	}, {
		map = function(arg_45_0)
			return (DormData:GetHeroArchiveID(arg_45_0))
		end
	}, {
		map = function(arg_46_0)
			return arg_46_0
		end
	})

	return var_42_0
end

function var_0_0.Dispose(arg_47_0)
	arg_47_0.characterScroll:Dispose()

	for iter_47_0 = 1, 5 do
		arg_47_0.holder[iter_47_0]:Dispose()
	end

	arg_47_0.holder = nil

	var_0_0.super.Dispose(arg_47_0)
end

return var_0_0
