local var_0_0 = class("OptionalItemSelectView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/UIInquirepopup14"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.selectInex_ = 0
	arg_4_0.lastSelectItem_ = nil

	arg_4_0:RefreshUI()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.okBtnController_ = arg_5_0.controllerEx_:GetController("btn")
	arg_5_0.scrollHelper = LuaList.New(handler(arg_5_0, arg_5_0.indexItem), arg_5_0.uiList_, CommonItemView)
end

function var_0_0.indexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.dataList_[arg_6_1][1]
	local var_6_1 = arg_6_0.dataList_[arg_6_1][2] * arg_6_0.useNum_
	local var_6_2 = clone(ItemTemplateData)

	var_6_2.id = var_6_0
	var_6_2.number = var_6_1
	var_6_2.selectStyle = arg_6_1 == arg_6_0.selectInex_

	function var_6_2.clickFun()
		arg_6_0:SelectItem(arg_6_2, arg_6_1)
	end

	arg_6_2:SetData(var_6_2)
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.okBtn_, nil, function()
		local var_9_0 = ItemCfg[arg_8_0.itemInfo_[1]].param[arg_8_0.indexMap_[arg_8_0.selectInex_]]

		if var_9_0 then
			local var_9_1 = var_9_0[1]

			if ItemCfg[var_9_1].type == ItemConst.ITEM_TYPE.HERO_SKIN then
				if HeroTools.IsSkinUnlock(var_9_1) then
					ShowTips("SKIN_HAD_UNLOCKED")

					return
				end

				local var_9_2 = getTicketIDBySkinID(var_9_1)
				local var_9_3 = MaterialData:GetMaterialListById(var_9_2)

				if var_9_3 then
					for iter_9_0, iter_9_1 in pairs(var_9_3) do
						if iter_9_1 > 0 then
							ShowTips("SKIN_HAD_UNLOCKED")

							return
						end
					end
				end
			end

			CommonAction.TryToUseItem({
				{
					item_info = {
						id = arg_8_0.itemInfo_[1],
						num = arg_8_0.useNum_,
						time_valid = arg_8_0.itemInfo_[4]
					},
					use_list = {
						arg_8_0.selectInex_
					}
				}
			})
		end
	end)
	arg_8_0:AddBtnListener(arg_8_0.lockBtn_, nil, function()
		ShowTips("ITEM_SELECTED")
	end)
	arg_8_0:AddBtnListener(arg_8_0.cancelBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_8_0:AddBtnListener(arg_8_0.maskBtn_, nil, function()
		JumpTools.Back()
	end)
end

function var_0_0.SelectItem(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.selectInex_ == arg_13_2 then
		return
	end

	if arg_13_0.lastSelectItem_ then
		arg_13_0.lastSelectItem_:RefreshSelectState(false)
	end

	arg_13_0.selectInex_ = arg_13_2
	arg_13_0.lastSelectItem_ = arg_13_1

	arg_13_1:RefreshSelectState(true)
	arg_13_0:RefreshSelect()
end

function var_0_0.RefreshUI(arg_14_0)
	arg_14_0.itemInfo_ = arg_14_0.params_.popItemInfo
	arg_14_0.useNum_ = arg_14_0.params_.selectNum

	local var_14_0 = ItemCfg[arg_14_0.itemInfo_[1]]

	arg_14_0.dataList_ = {}
	arg_14_0.indexMap_ = {}

	local var_14_1 = 1

	for iter_14_0 = 1, #var_14_0.param do
		local var_14_2 = var_14_0.param[iter_14_0][1]

		if HeroTools.GetIsHide(var_14_2) or HeroTools.GetIsSkinHide(var_14_2) then
			-- block empty
		else
			table.insert(arg_14_0.dataList_, var_14_0.param[iter_14_0])

			arg_14_0.indexMap_[var_14_1] = iter_14_0
			var_14_1 = var_14_1 + 1
		end
	end

	arg_14_0.scrollHelper:StartScroll(#arg_14_0.dataList_)
	arg_14_0:RefreshSelect()
end

function var_0_0.RefreshSelect(arg_15_0)
	local var_15_0 = arg_15_0.dataList_[arg_15_0.selectInex_]

	if var_15_0 then
		arg_15_0.tipText_.text = string.format(GetTips("TIP_SELECT"), ItemTools.getItemName(var_15_0[1]))

		arg_15_0.okBtnController_:SetSelectedState("state1")
	else
		arg_15_0.tipText_.text = GetTips("SELECT_CURRENT")

		arg_15_0.okBtnController_:SetSelectedState("state0")
	end
end

function var_0_0.OnTryToUseItem(arg_16_0, arg_16_1, arg_16_2)
	if isSuccess(arg_16_1.result) then
		local var_16_0 = arg_16_0.dataList_[arg_16_0.selectInex_]

		JumpTools:Back()
		getReward(arg_16_1.drop_list, {
			ItemConst.ITEM_TYPE.HERO,
			ItemConst.ITEM_TYPE.HERO_SKIN
		})
	else
		ShowTips(arg_16_1.result)
	end
end

function var_0_0.OnExit(arg_17_0)
	arg_17_0.selectInex_ = 0
	arg_17_0.lastSelectItem_ = nil
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0.scrollHelper:Dispose()
	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
