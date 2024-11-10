local var_0_0 = class("PopItemView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/ProphintspopUI"
end

function var_0_0.OnCtor(arg_2_0, ...)
	local var_2_0, var_2_1 = gameContext:GetLastHistoryAndParams()

	if string.char(string.byte(var_2_0)) == "/" then
		var_2_0 = string.sub(var_2_0, 2)
	end

	arg_2_0.lastRecord_ = var_2_0

	OperationRecorder.Record(arg_2_0.lastRecord_, "PopItemView")
end

function var_0_0.UIParent(arg_3_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddListeners()
end

function var_0_0.GetItemID(arg_5_0)
	return arg_5_0.itemInfo_.id
end

function var_0_0.GetItemNum(arg_6_0)
	return arg_6_0.itemInfo_.num
end

function var_0_0.GetItemTimeValid(arg_7_0)
	return arg_7_0.itemInfo_.timeValid
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.itemInfo_ = arg_8_0.params_.popItemInfo
	arg_8_0.extraInfo_ = arg_8_0.params_.extraInfo or {}

	arg_8_0:RefreshCommonItem()
	arg_8_0:RefreshContent()
	arg_8_0:RefreshCount()
	arg_8_0:RefreshOwnedTotalCount()
end

function var_0_0.OnMaterialUpdate(arg_9_0, arg_9_1)
	if arg_9_1 == arg_9_0:GetItemID() then
		arg_9_0:RefreshCount()
	end
end

function var_0_0.RefreshLableContent(arg_10_0)
	if DormFurnitureTools:CheckFurShowExtendLable(arg_10_0:GetItemID()) then
		arg_10_0.lableList = DormTools:GetFurLable(arg_10_0:GetItemID()) or {}

		arg_10_0.labelScroll_:StartScroll(#arg_10_0.lableList)
	end
end

function var_0_0.indexLableItem(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2:RefreshUI(arg_11_0:GetItemID(), arg_11_0.lableList[arg_11_1])
end

function var_0_0.indexSoureceItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:RefreshUI(arg_12_0:GetItemID(), arg_12_0.sourceList[arg_12_1])

	if arg_12_0.OnJumpCallback then
		arg_12_2:SetJumpCallback(handler(arg_12_0, arg_12_0.OnJumpCallback))
	end
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveListeners()
	arg_13_0.commonItemView_:Dispose()

	arg_13_0.commonItemView_ = nil
	arg_13_0.maskBtn_ = nil
	arg_13_0.nameText_ = nil
	arg_13_0.countentText_ = nil
	arg_13_0.sourceBtn_ = nil
	arg_13_0.sourceBtnGo_ = nil
	arg_13_0.operatePanel_ = nil
	arg_13_0.useBtn_ = nil
	arg_13_0.cntPanel_ = nil
	arg_13_0.cntText_ = nil
	arg_13_0.commonItem_ = nil
	arg_13_0.sourcePanel_ = nil
	arg_13_0.infoBtn_ = nil
	arg_13_0.sourceParent_ = nil
	arg_13_0.unlockItem_ = nil
	arg_13_0.lockItem_ = nil
	arg_13_0.invalidItem_ = nil

	if arg_13_0.sourceScroll_ then
		arg_13_0.sourceScroll_:Dispose()
	end

	var_0_0.super.Dispose(arg_13_0)
end

function var_0_0.InitUI(arg_14_0)
	arg_14_0:BindCfgUI()

	arg_14_0.infoController = arg_14_0.prophintspopuiControllerexcollection_:GetController("tab")
	arg_14_0.timeController = arg_14_0.prophintspopuiControllerexcollection_:GetController("time")
	arg_14_0.equipController = arg_14_0.prophintspopuiControllerexcollection_:GetController("equip")
	arg_14_0.groupController = arg_14_0.prophintspopuiControllerexcollection_:GetController("group")
	arg_14_0.viewController = arg_14_0.prophintspopuiControllerexcollection_:GetController("view")
	arg_14_0.useController = arg_14_0.prophintspopuiControllerexcollection_:GetController("Use")
	arg_14_0.bgController = arg_14_0.prophintspopuiControllerexcollection_:GetController("bg")
	arg_14_0.starController = arg_14_0.prophintspopuiControllerexcollection_:GetController("star")
	arg_14_0.tabControllerController = arg_14_0.prophintspopuiControllerexcollection_:GetController("tab")
	arg_14_0.btnShowControllerController = arg_14_0.prophintspopuiControllerexcollection_:GetController("isShowBtn")
	arg_14_0.soureceDesControllerController = arg_14_0.prophintspopuiControllerexcollection_:GetController("soureceDes")
	arg_14_0.probabilityController = arg_14_0.prophintspopuiControllerexcollection_:GetController("probability")
	arg_14_0.useNumTriggerListener_ = arg_14_0.useNumSlider_.gameObject.transform:GetComponent(typeof(EventTriggerListener))
	arg_14_0.sourceList = {}
	arg_14_0.sourceScroll_ = LuaList.New(handler(arg_14_0, arg_14_0.indexSoureceItem), arg_14_0.accessUilist_, PopsoureceItem)

	arg_14_0.viewController:SetSelectedState("state0")
	arg_14_0.useController:SetSelectedState("state0")
	arg_14_0.starController:SetSelectedState("state0")
	arg_14_0.soureceDesControllerController:SetSelectedState("notshow")
	arg_14_0.probabilityController:SetSelectedState("notshow")
	arg_14_0.tabControllerController:SetSelectedState("none")
	arg_14_0:CustomInitUI()
end

function var_0_0.CustomInitUI(arg_15_0)
	arg_15_0.tabControllerController:SetSelectedState("descripe")
	arg_15_0.btnShowControllerController:SetSelectedState("hide")
end

function var_0_0.AddListeners(arg_16_0)
	arg_16_0:AddBtnListener(arg_16_0.maskBtn_, nil, function()
		arg_16_0:Back()
	end)
end

function var_0_0.RemoveListeners(arg_18_0)
	return
end

function var_0_0.RefreshContent(arg_19_0)
	local var_19_0 = ItemCfg[arg_19_0:GetItemID()]
	local var_19_1 = arg_19_0.itemInfo_

	arg_19_0.nameText_.text = ItemTools.getItemName(var_19_0.id)
	arg_19_0.countentText_.text = ItemTools.getItemDesc(var_19_0.id)

	local var_19_2 = ItemTools.GetItemExpiredTimeByInfo(var_19_1)

	if var_19_2 == nil or var_19_2 == 0 then
		arg_19_0.timeController:SetSelectedState("no")
	else
		local var_19_3 = ItemTools.GetItemExpiredTimeByInfo(var_19_1)

		arg_19_0.timeController:SetSelectedState("yes")

		arg_19_0.timeLabel_.text = string.format(GetTips("TIME_DISPLAY_12"), manager.time:STimeDescS(var_19_3, "!%Y/%m/%d %H:%M"))
	end
end

local function var_0_1(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 or {}

	var_20_0.id = var_20_0.id or arg_20_0.id
	var_20_0.number = var_20_0.num or arg_20_0.num
	var_20_0.timeValid = var_20_0.timeValid or arg_20_0.timeValid

	return var_20_0
end

function var_0_0.RefreshCommonItem(arg_21_0, arg_21_1)
	if not arg_21_0.commonItemView_ then
		arg_21_0.commonItemView_ = CommonItemView.New(arg_21_0.commonItem_)
	end

	arg_21_0.itemInfo_.hideBottomRightTextFlag = true
	arg_21_0.itemInfo_.animatorType = ItemConst.ITEM_ANIMATOR_TYPE.NULL

	arg_21_0.commonItemView_:SetData(arg_21_0.itemInfo_)
	arg_21_0.commonItemView_.rareController_:SetSelectedState("off")
	arg_21_0:UpdateIcon()

	local var_21_0 = ItemCfg[arg_21_0:GetItemID()]

	if var_21_0 and ItemConst.ITEM_TYPE.HERO == var_21_0.type then
		-- block empty
	end

	local var_21_1 = ItemCfg[arg_21_0.itemInfo_.id]

	if var_21_1 then
		local var_21_2 = var_21_1.display_rare or 0

		arg_21_0.bgController:SetSelectedState("state" .. tostring(var_21_2))
	end
end

function var_0_0.UpdateIcon(arg_22_0)
	arg_22_0.itemImg_.sprite = ItemTools.getItemSprite(arg_22_0:GetItemID())
end

function var_0_0.SetCommonItem(arg_23_0, arg_23_1)
	arg_23_0.itemInfo_.number = arg_23_1

	arg_23_0:RefreshCommonItem()
end

function var_0_0.RefreshCount(arg_24_0)
	local var_24_0 = arg_24_0:GetItemID()
	local var_24_1 = arg_24_0.itemInfo_
	local var_24_2 = ItemTools.GetItemExpiredTimeByInfo(var_24_1)
	local var_24_3 = ItemTools.GetItemExpiredTimeByInfo(var_24_1)
	local var_24_4 = ItemTools.getItemNum(var_24_0, var_24_3)

	if not MaterialData:IsItemHaveServeTick(arg_24_0.itemInfo_.id) then
		var_24_4 = ItemTools.getItemNum(var_24_0)
	end

	arg_24_0.cntText_.text = NumberTools.RetractNumberForWindBar(var_24_4)
end

local var_0_2 = setmetatable({}, {
	__index = function()
		return true
	end
})
local var_0_3 = {
	[ItemConst.ITEM_TYPE.CURRENCY] = var_0_2,
	[ItemConst.ITEM_TYPE.HERO] = var_0_2,
	[ItemConst.ITEM_TYPE.HERO_SKIN] = var_0_2,
	[ItemConst.ITEM_TYPE.PORTRAIT] = var_0_2,
	[ItemConst.ITEM_TYPE.FRAME] = var_0_2,
	[ItemConst.ITEM_TYPE.STICKER] = var_0_2,
	[ItemConst.ITEM_TYPE.STICKER_BG] = var_0_2,
	[ItemConst.ITEM_TYPE.SCENE] = var_0_2,
	[ItemConst.ITEM_TYPE.TAG] = var_0_2,
	[ItemConst.ITEM_TYPE.CARD_BG] = var_0_2,
	[ItemConst.ITEM_TYPE.FURNITURE_SUIT] = var_0_2,
	[ItemConst.ITEM_TYPE.CHAT_BUBBLE] = var_0_2,
	[ItemConst.ITEM_TYPE.CLUB_COMMON] = var_0_2,
	[ItemConst.ITEM_TYPE.GIFT] = {
		[ItemConst.ITEM_SUB_TYPE.EQUIP_PIECE] = true,
		[ItemConst.ITEM_SUB_TYPE.EQUIP_PIECE_UP] = true,
		[ItemConst.ITEM_SUB_TYPE.DROP_ITEM] = true,
		[ItemConst.ITEM_SUB_TYPE.FUKUBUKURO] = true
	}
}

function var_0_0.ShouldHideOwnedTotalCount(arg_26_0)
	local var_26_0 = ItemCfg[arg_26_0:GetItemID()]
	local var_26_1 = var_26_0.type
	local var_26_2 = var_26_0.sub_type

	return nullable(var_0_3, var_26_1, var_26_2) or false
end

function var_0_0.RefreshOwnedTotalCount(arg_27_0)
	local var_27_0 = arg_27_0.itemInfo_ and arg_27_0.itemInfo_.isHideNum_ or false

	if arg_27_0:ShouldHideOwnedTotalCount() or var_27_0 then
		SetActive(arg_27_0.cntPanel_, false)
	else
		SetActive(arg_27_0.cntPanel_, true)
	end
end

function var_0_0.Cacheable(arg_28_0)
	return false
end

function var_0_0.ShowInfo(arg_29_0)
	arg_29_0.tabControllerController:SetSelectedState("descripe")
end

return var_0_0
