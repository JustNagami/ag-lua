local var_0_0 = class("DormInfomationTrainSetHeroView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormModifierEnterPop"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.BuildContext(arg_4_0)
	arg_4_0.tempPosStore = {}
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:InitView()
end

function var_0_0.InitView(arg_6_0)
	arg_6_0.holder = {}

	for iter_6_0 = 1, 5 do
		table.insert(arg_6_0.holder, DormInfomationHeroItem.New(arg_6_0["heroItem" .. iter_6_0]))
		arg_6_0.holder[iter_6_0]:SetState(true)
	end

	arg_6_0.characterScroll = LuaList.New(handler(arg_6_0, arg_6_0.IndexItem), arg_6_0.heroList_, DormInfomationHeroItem)
end

function var_0_0.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.maskBtn_, nil, function()
		arg_7_0:Save()
	end)
	arg_7_0:AddBtnListener(arg_7_0.okBtn_, nil, function()
		arg_7_0:Save()
	end)
	arg_7_0:RegistEventListener(DORM_REFRESH_HERO_DEPLOY_LIST, function()
		arg_7_0:Refresh()
	end)
end

function var_0_0.SetHeroInPos(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.tempPosStore[arg_11_1] = arg_11_2
end

function var_0_0.OnEnter(arg_12_0)
	arg_12_0:BuildContext()

	arg_12_0.state = arg_12_0.params_.state

	if arg_12_0.state == "train" then
		arg_12_0:RenderTrainSelectHero()
		arg_12_0:RenderTrainHero()
	elseif arg_12_0.state == "dorm" then
		arg_12_0:RenderDormSelectHero()
		arg_12_0:RenderDormHero()
	end
end

function var_0_0.RenderDormSelectHero(arg_13_0)
	arg_13_0.dataList = arg_13_0:GetDormHeroList()

	arg_13_0.characterScroll:StartScroll(#arg_13_0.dataList)
end

function var_0_0.RenderDormHero(arg_14_0)
	local var_14_0 = DormData:GetHeroInfoList()
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in pairs(var_14_0) do
		if iter_14_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm then
			table.insert(var_14_1, iter_14_1.hero_id)
		end
	end

	for iter_14_2 = 1, 5 do
		if var_14_1[iter_14_2] then
			arg_14_0.holder[iter_14_2]:SetData({
				heroID = var_14_1[iter_14_2]
			})
			arg_14_0.holder[iter_14_2]:RegistCallBack(function(arg_15_0)
				arg_14_0:OnHodlerHeroItemClick(arg_15_0, iter_14_2)
			end)
		else
			arg_14_0.holder[iter_14_2]:SetData(nil)
			arg_14_0.holder[iter_14_2]:RegistCallBack(function()
				arg_14_0:OnHodlerHeroItemClick(nil)
			end)
		end
	end
end

function var_0_0.RenderTrainHero(arg_17_0)
	local var_17_0 = IdolTraineeData:GetHeroPosList()

	for iter_17_0 = 1, 5 do
		if var_17_0[iter_17_0] then
			if arg_17_0:CheckIsSameHero(var_17_0[iter_17_0], arg_17_0.tempPosStore[iter_17_0]) then
				var_17_0[iter_17_0] = arg_17_0.tempPosStore[iter_17_0] or var_17_0[iter_17_0]
			end

			arg_17_0:SetHeroInPos(iter_17_0, var_17_0[iter_17_0])
			arg_17_0.holder[iter_17_0]:SetData({
				heroID = var_17_0[iter_17_0]
			})
			arg_17_0.holder[iter_17_0]:RegistCallBack(function(arg_18_0)
				arg_17_0:OnHodlerHeroItemClick(var_17_0[iter_17_0], iter_17_0)
			end)
		else
			arg_17_0.holder[iter_17_0]:SetData(nil)
			arg_17_0.holder[iter_17_0]:RegistCallBack(function()
				arg_17_0:OnHodlerHeroItemClick(nil)
			end)
		end
	end
end

function var_0_0.CheckIsSameHero(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1 == nil or arg_20_2 == nil then
		return false
	end

	return DormData:GetHeroArchiveID(arg_20_1) == DormData:GetHeroArchiveID(arg_20_2)
end

function var_0_0.RenderTrainSelectHero(arg_21_0)
	arg_21_0.dataList = IdolTraineeData:GetIdolHeroList()

	arg_21_0.characterScroll:StartScroll(#arg_21_0.dataList)
end

local function var_0_1(arg_22_0)
	if not arg_22_0 then
		return true
	end

	local var_22_0 = DormData:GetHeroTemplateInfo(arg_22_0)

	if var_22_0 then
		local var_22_1 = var_22_0:GetHeroState()

		if var_22_1 == DormEnum.DormHeroState.InCanteenEntrust or var_22_1 == DormEnum.DormHeroState.InCanteenJob then
			return true
		end

		return false
	end
end

function var_0_0.IndexItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.dataList[arg_23_1]

	arg_23_2:SetState(false)
	arg_23_2:SetShowMaskCallback(var_0_1)
	arg_23_2:SetData({
		heroID = var_23_0
	})
	arg_23_2:RefreshState()
	arg_23_2:RegistCallBack(function(arg_24_0)
		if arg_23_0.state == "train" then
			arg_23_0:OnHeroItemClick(arg_24_0)
		elseif arg_23_0.state == "dorm" then
			arg_23_0:OnDormHeroItemClick(arg_24_0)
		end
	end)
end

function var_0_0.OnDormHeroItemClick(arg_25_0, arg_25_1)
	local var_25_0 = DormData:GetHeroInfoList()
	local var_25_1 = {}
	local var_25_2 = 1

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		if iter_25_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm then
			if arg_25_0:CheckIsSameHero(iter_25_1.hero_id, arg_25_1) then
				arg_25_0:OnHodlerHeroItemClick(iter_25_1.hero_id, var_25_2)

				return
			end

			table.insert(var_25_1, iter_25_1.hero_id)

			var_25_2 = var_25_2 + 1
		end
	end

	if #var_25_1 == 5 then
		return
	end

	local var_25_3 = DormData:GetHeroTemplateInfo(arg_25_1)

	if var_25_3 then
		local var_25_4 = var_25_3:GetHeroState()

		if var_25_4 == DormEnum.DormHeroState.InCanteenJob or var_25_4 == DormEnum.DormHeroState.InCanteenEntrust then
			ShowTips(GetTips("BACKHOME_HERO_OCCUPYED"))

			return
		end
	end

	table.insert(var_25_1, arg_25_1)
	DormAction:DeployHeroInRoom(DormConst.PUBLIC_DORM_ID, var_25_1, DormEnum.DormDeployType.Place)
	arg_25_0:Refresh()
end

function var_0_0.OnHeroItemClick(arg_26_0, arg_26_1)
	local var_26_0 = -1
	local var_26_1 = IdolTraineeData:GetHeroPosList()

	for iter_26_0 = 1, 5 do
		local var_26_2 = DormData:GetHeroArchiveID(var_26_1[iter_26_0])
		local var_26_3 = DormData:GetHeroArchiveID(arg_26_1)

		if var_26_1[iter_26_0] and var_26_1[iter_26_0] > 0 and var_26_2 == var_26_3 then
			arg_26_0:OnHodlerHeroItemClick(arg_26_1, iter_26_0)

			return
		end
	end

	for iter_26_1 = 1, 5 do
		if not var_26_1[iter_26_1] then
			var_26_0 = iter_26_1

			break
		end
	end

	if var_26_0 == -1 then
		return
	end

	local var_26_4 = DormData:GetHeroTemplateInfo(arg_26_1)

	if var_26_4 then
		local var_26_5 = var_26_4:GetHeroState()

		if var_26_5 == DormEnum.DormHeroState.InCanteenJob or var_26_5 == DormEnum.DormHeroState.InCanteenEntrust then
			ShowTips(GetTips("BACKHOME_HERO_OCCUPYED"))

			return
		end
	end

	if var_26_0 ~= -1 then
		arg_26_0:SetHeroInPos(var_26_0, arg_26_1)
		IdolTraineeCampBridge.SetPosOfHero(arg_26_1, var_26_0)
	end

	arg_26_0:Refresh()
end

function var_0_0.OnHodlerHeroItemClick(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_1 == nil then
		return
	end

	if arg_27_0.state == "train" then
		IdolTraineeCampBridge.RemoveHero(arg_27_1)
		arg_27_0:SetHeroInPos(arg_27_2, nil)
	elseif arg_27_0.state == "dorm" then
		local var_27_0 = DormData:GetHeroInfoList()
		local var_27_1 = {}

		for iter_27_0, iter_27_1 in pairs(var_27_0) do
			if iter_27_1:GetHeroState() == DormEnum.DormHeroState.InPublicDorm and iter_27_1.hero_id ~= arg_27_1 then
				table.insert(var_27_1, iter_27_1.hero_id)
			end
		end

		DormAction:DeployHeroInRoom(DormConst.PUBLIC_DORM_ID, var_27_1, DormEnum.DormDeployType.Place)
	end

	arg_27_0:Refresh()
end

function var_0_0.Refresh(arg_28_0)
	if arg_28_0.state == "train" then
		arg_28_0:RenderTrainHero()
	elseif arg_28_0.state == "dorm" then
		arg_28_0:RenderDormHero()
	end

	arg_28_0.characterScroll:Refresh()
end

function var_0_0.Save(arg_29_0)
	if arg_29_0.state == "train" then
		arg_29_0:SaveTrainList()
	elseif arg_29_0.state == "dorm" then
		arg_29_0:SaveDormList()
	end
end

function var_0_0.SaveDormList(arg_30_0)
	manager.notify:Invoke(DORM_REGENERATE_HERO)
	JumpTools.Back()
end

function var_0_0.SaveTrainList(arg_31_0)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(arg_31_0.tempPosStore) do
		table.insert(var_31_0, {
			hero_id = iter_31_1,
			pos = iter_31_0
		})
	end

	IdolTraineeAction.RequestSetHeroPos(var_31_0, function()
		BackHomeAction:GetAllDetailInfo(function()
			return
		end)
		manager.notify:Invoke(DORM_REGENERATE_HERO)
		JumpTools.Back()
	end)
end

function var_0_0.OnExit(arg_34_0)
	return
end

function var_0_0.GetDormHeroList()
	local var_35_0 = DormHeroTools:GetBackHomeCanUseHeroList(DormConst.PUBLIC_DORM_ID)

	CommonTools.UniversalSortEx(var_35_0, {
		ascend = true,
		map = function(arg_36_0)
			local var_36_0 = DormData:GetHeroTemplateInfo(arg_36_0):GetHeroState()

			if var_36_0 == DormEnum.DormHeroState.InPublicDorm then
				return 1
			elseif var_36_0 == DormEnum.DormHeroState.OutDorm then
				return 2
			elseif var_36_0 == DormEnum.DormHeroState.InPrivateDorm then
				return 3
			elseif var_36_0 == DormEnum.DormHeroState.InCanteenJob then
				local var_36_1 = DormData:GetHeroTemplateInfo(arg_36_0).jobType

				if var_36_1 == DormNpcTools.BackHomeNpcType.cook then
					return 4
				elseif var_36_1 == DormNpcTools.BackHomeNpcType.waiter then
					return 5
				elseif var_36_1 == DormNpcTools.BackHomeNpcType.cashier then
					return 6
				end
			elseif var_36_0 == DormEnum.DormHeroState.InCanteenEntrust then
				return 7
			elseif var_36_0 == DormEnum.DormHeroState.InIdolTraineeCamp then
				return 8
			end
		end
	}, {
		ascend = true,
		map = function(arg_37_0)
			return (DormData:GetHeroTemplateInfo(arg_37_0):GetFatigue())
		end
	}, {
		map = function(arg_38_0)
			return (DormData:GetHeroArchiveID(arg_38_0))
		end
	}, {
		map = function(arg_39_0)
			return arg_39_0
		end
	})

	return var_35_0
end

function var_0_0.Dispose(arg_40_0)
	arg_40_0.characterScroll:Dispose()

	for iter_40_0 = 1, 5 do
		arg_40_0.holder[iter_40_0]:Dispose()
	end

	arg_40_0.holder = nil

	var_0_0.super.Dispose(arg_40_0)
end

return var_0_0
