local var_0_0 = class("ChooseStickerBgView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/UserInfor/paster/StickerChooseBgUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.stateCon_ = ControllerUtil.GetController(arg_4_0.transform_, "state")
	arg_4_0.scrollList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, StickerBgItem)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.list_[arg_5_1]

	arg_5_2:RefreshUI(var_5_0)

	if var_5_0 == arg_5_0.chooseID_ then
		arg_5_2:SetState("use")
	elseif PlayerData:GetStickerBg(var_5_0).unlock ~= 0 then
		arg_5_2:SetState("change")
	else
		arg_5_2:SetState("lock")
	end

	arg_5_2:SetSelected(var_5_0 == arg_5_0.curID_)

	tip = manager.redPoint:getTipValue(RedPointConst.STICKER_BG .. "_" .. var_5_0)

	arg_5_2:SetNew(tip > 0)
	arg_5_2:RegistClickFunc(function()
		arg_5_0:SetBgID(var_5_0)

		if manager.redPoint:getTipValue(RedPointConst.STICKER_BG .. "_" .. var_5_0) > 0 then
			RedPointData:SetRedPointOpen(RedPointConst.STICKER_BG_RANGE + var_5_0, false)
			manager.redPoint:setTip(RedPointConst.STICKER_BG .. "_" .. var_5_0, 0)
			arg_5_2:SetNew(false)
			RedPointAction.HandleRedPoint(RedPointConst.STICKER_BG_RANGE + var_5_0)
		end
	end)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.changeBtn_, nil, function()
		arg_7_0.params_.temp.stickerBg = arg_7_0.curID_

		arg_7_0:Back(1, {
			type = 2,
			tempInfo = arg_7_0.params_.temp
		})
	end)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0.chooseID_ = arg_9_0.params_.chooseID
	arg_9_0.list_ = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.STICKER_BG]

	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0:Sortlist()
	arg_10_0:SetBgID(arg_10_0.chooseID_)
	arg_10_0.scrollList_:StartScroll(#arg_10_0.list_, table.indexof(arg_10_0.list_, arg_10_0.chooseID_))
end

function var_0_0.Sortlist(arg_11_0)
	table.sort(arg_11_0.list_, function(arg_12_0, arg_12_1)
		if arg_12_0 == arg_11_0.chooseID_ or arg_12_1 == arg_11_0.chooseID_ then
			return arg_12_0 == arg_11_0.chooseID_
		end

		local var_12_0 = PlayerData:GetStickerBg(arg_12_0)
		local var_12_1 = PlayerData:GetStickerBg(arg_12_1)

		if var_12_0.unlock ~= var_12_1.unlock then
			return var_12_0.unlock > var_12_1.unlock
		end

		return arg_12_0 < arg_12_1
	end)
end

function var_0_0.SetBgID(arg_13_0, arg_13_1)
	arg_13_0.curID_ = arg_13_1

	arg_13_0:RefreshInfo()
	arg_13_0.scrollList_:Refresh()
end

function var_0_0.RefreshInfo(arg_14_0)
	arg_14_0.show_.sprite = getSpriteWithoutAtlas("TextureConfig/Sticker/stickerBtn/Sticker_big_" .. arg_14_0.curID_)
	arg_14_0.desc_.text = ItemTools.getItemDesc(arg_14_0.curID_)

	if arg_14_0.curID_ == arg_14_0.chooseID_ then
		arg_14_0.stateCon_:SetSelectedState("use")
	elseif PlayerData:GetStickerBg(arg_14_0.curID_).unlock ~= 0 then
		arg_14_0.stateCon_:SetSelectedState("change")
	else
		arg_14_0.stateCon_:SetSelectedState("lock")

		arg_14_0.unlock_.text = GetI18NText(ItemCfg[arg_14_0.curID_].desc_source) or ""
	end
end

function var_0_0.OnTop(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		arg_15_0:Back(1, {
			type = 2,
			tempInfo = arg_15_0.params_.temp
		})
	end)
end

function var_0_0.OnExit(arg_17_0)
	return
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:RemoveAllListeners()

	if arg_18_0.scrollList_ then
		arg_18_0.scrollList_:Dispose()

		arg_18_0.scrollList_ = nil
	end

	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
