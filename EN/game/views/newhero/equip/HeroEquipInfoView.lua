local var_0_0 = class("HeroEquipInfoView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.handler_ = arg_1_1
	arg_1_0.gameObject_ = arg_1_2
	arg_1_0.transform_ = arg_1_2.transform

	arg_1_0:Init()
end

function var_0_0.RefreshData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.data_ = arg_2_1
	arg_2_0.heroInfo_ = arg_2_2

	arg_2_0:RefreshUI()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.itemSGo_ = {}
	arg_4_0.itemS_ = {}

	for iter_4_0 = 1, 6 do
		arg_4_0.itemSGo_[iter_4_0] = arg_4_0[string.format("item%dGo_", iter_4_0)]
		arg_4_0.itemS_[iter_4_0] = HeroEquipItem.New(arg_4_0, arg_4_0.itemSGo_[iter_4_0])
	end
end

function var_0_0.IgnoreAdd(arg_5_0)
	for iter_5_0 = 1, 6 do
		arg_5_0.itemS_[iter_5_0]:IgnoreAdd()
	end
end

function var_0_0.AddUIListener(arg_6_0)
	if arg_6_0.changeBtn_ then
		arg_6_0:AddBtnListener(arg_6_0.changeBtn_, nil, function()
			arg_6_0:Go("/heroEquipBag", {
				isClearPos = true,
				suitPos = 0,
				isOpenInfo = false,
				heroId = arg_6_0.heroInfo_.id
			})
		end)
	end
end

function var_0_0.RefreshUI(arg_8_0, arg_8_1)
	if not arg_8_1 then
		arg_8_0.equipInfo_ = arg_8_0.heroInfo_.equip
	else
		arg_8_0.equipInfo_ = arg_8_1
	end

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.equipInfo_) do
		local var_8_0 = iter_8_1.equip_id

		if arg_8_0.extra_ then
			if arg_8_0.isForeign_ then
				if var_8_0 ~= 0 then
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, ForeignInfoData:GetEquipInfo(arg_8_0.heroInfo_.id, iter_8_0))
				else
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
						equip_id = 0,
						pos = iter_8_0
					})
				end
			elseif arg_8_0.isTemp_ then
				if var_8_0 ~= 0 then
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, TempHeroData:GetEquipInfoList(arg_8_0.heroInfo_.id, arg_8_0.extra_.tempHeroList)[iter_8_0])
				else
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
						equip_id = 0,
						pos = iter_8_0
					})
				end
			elseif arg_8_0.isPolyhedron_ then
				if var_8_0 ~= 0 then
					local var_8_1 = PolyhedronHeroCfg[arg_8_0.heroInfo_.id].standard_id
					local var_8_2 = arg_8_0.heroInfo_.equip_list

					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, var_8_2[iter_8_0])
				else
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
						equip_id = 0,
						pos = iter_8_0
					})
				end
			elseif arg_8_0.isCooperation_ then
				if var_8_0 ~= 0 then
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, CooperationTools.GetEquipInfo(arg_8_0.heroInfo_.id, iter_8_0))
				else
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
						equip_id = 0,
						pos = iter_8_0
					})
				end
			elseif arg_8_0.isAdvanceTest_ then
				if var_8_0 ~= 0 then
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, EquipData:GetEquipData(var_8_0))
				else
					arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
						equip_id = 0,
						pos = iter_8_0
					})
				end
			end
		elseif var_8_0 ~= 0 then
			arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, EquipData:GetEquipData(var_8_0))
		else
			arg_8_0.itemS_[iter_8_0]:RefreshData(arg_8_0, {
				equip_id = 0,
				pos = iter_8_0
			})
		end
	end
end

function var_0_0.RefreshItem(arg_9_0, arg_9_1)
	arg_9_0.equipInfo_ = arg_9_0.heroInfo_.equip

	local var_9_0 = arg_9_0.equipInfo_[arg_9_1].equip_id

	if var_9_0 and var_9_0 ~= 0 then
		arg_9_0.itemS_[arg_9_1]:RefreshData(arg_9_0, EquipData:GetEquipData(var_9_0))
	else
		arg_9_0.itemS_[arg_9_1]:RefreshData(arg_9_0, {
			equip_id = 0,
			pos = arg_9_1
		})
	end
end

function var_0_0.OnEnter(arg_10_0, arg_10_1)
	arg_10_0.heroViewProxy_ = arg_10_1
end

function var_0_0.OnExit(arg_11_0)
	return
end

function var_0_0.HideSelect(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.itemS_) do
		iter_12_1:ShowSelect(false)
	end
end

function var_0_0.GetItem(arg_13_0, arg_13_1)
	return arg_13_0.itemS_[arg_13_1]
end

function var_0_0.RegistCallBack(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.itemS_) do
		iter_14_1:RegistCallBack(arg_14_1)
	end
end

function var_0_0.Dispose(arg_15_0)
	if arg_15_0.itemS_ then
		for iter_15_0, iter_15_1 in ipairs(arg_15_0.itemS_) do
			iter_15_1:Dispose()
		end
	end

	arg_15_0.itemSGo_ = nil
	arg_15_0.itemS_ = nil

	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
