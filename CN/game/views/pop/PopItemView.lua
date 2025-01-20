local var_0_0 = class("PopItemView", ReduxView)
local var_0_1 = {
	[6013] = 2,
	[113907] = 1
}
local var_0_2 = {
	[ItemConst.ITEM_SUB_TYPE.HERO_CHIP_GIFT] = "RANDOM_ITEM_CONTENT"
}

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

function var_0_0.InitData(arg_8_0)
	if arg_8_0.routeName_ == "popItem2" then
		arg_8_0.itemInfo_ = arg_8_0.params_.popItemSecondViewInfo
	else
		arg_8_0.itemInfo_ = arg_8_0.params_.popItemInfo
	end

	arg_8_0.extraInfo_ = arg_8_0.params_.extraInfo or {}
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:InitData()
	arg_9_0:RefreshCommonItem()
	arg_9_0:RefreshContent()
	arg_9_0:RefreshCount()
	arg_9_0:RefreshOwnedTotalCount()
	arg_9_0:RefreshViewBtn()
end

function var_0_0.RefreshViewBtn(arg_10_0)
	local var_10_0 = ItemCfg[arg_10_0.itemInfo_.id]

	if var_10_0.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT or var_10_0.type == ItemConst.ITEM_TYPE.STICKER_BG or var_10_0.type == ItemConst.ITEM_TYPE.STICKER_FG then
		arg_10_0.viewController:SetSelectedState("state1")
	else
		arg_10_0.viewController:SetSelectedState(var_0_1[arg_10_0.itemInfo_.id] and "state1" or "state0")
	end
end

function var_0_0.OnMaterialUpdate(arg_11_0, arg_11_1)
	if arg_11_1 == arg_11_0:GetItemID() then
		arg_11_0:RefreshCount()
	end
end

function var_0_0.RefreshLableContent(arg_12_0)
	if DormFurnitureTools:CheckFurShowExtendLable(arg_12_0:GetItemID()) then
		arg_12_0.lableList = DormTools:GetFurLable(arg_12_0:GetItemID()) or {}

		arg_12_0.labelScroll_:StartScroll(#arg_12_0.lableList)
	end
end

function var_0_0.indexLableItem(arg_13_0, arg_13_1, arg_13_2)
	arg_13_2:RefreshUI(arg_13_0:GetItemID(), arg_13_0.lableList[arg_13_1])
end

function var_0_0.indexSoureceItem(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2:RefreshUI(arg_14_0:GetItemID(), arg_14_0.sourceList[arg_14_1])

	if arg_14_0.OnJumpCallback then
		arg_14_2:SetJumpCallback(handler(arg_14_0, arg_14_0.OnJumpCallback))
	end
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:RemoveListeners()
	arg_15_0.commonItemView_:Dispose()

	arg_15_0.commonItemView_ = nil
	arg_15_0.maskBtn_ = nil
	arg_15_0.nameText_ = nil
	arg_15_0.countentText_ = nil
	arg_15_0.sourceBtn_ = nil
	arg_15_0.sourceBtnGo_ = nil
	arg_15_0.operatePanel_ = nil
	arg_15_0.useBtn_ = nil
	arg_15_0.cntPanel_ = nil
	arg_15_0.cntText_ = nil
	arg_15_0.commonItem_ = nil
	arg_15_0.sourcePanel_ = nil
	arg_15_0.infoBtn_ = nil
	arg_15_0.sourceParent_ = nil
	arg_15_0.unlockItem_ = nil
	arg_15_0.lockItem_ = nil
	arg_15_0.invalidItem_ = nil

	if arg_15_0.sourceScroll_ then
		arg_15_0.sourceScroll_:Dispose()
	end

	if arg_15_0.itemListScroll_ then
		arg_15_0.itemListScroll_:Dispose()
	end

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.InitUI(arg_16_0)
	arg_16_0:BindCfgUI()

	arg_16_0.infoController = arg_16_0.prophintspopuiControllerexcollection_:GetController("tab")
	arg_16_0.timeController = arg_16_0.prophintspopuiControllerexcollection_:GetController("time")
	arg_16_0.equipController = arg_16_0.prophintspopuiControllerexcollection_:GetController("equip")
	arg_16_0.groupController = arg_16_0.prophintspopuiControllerexcollection_:GetController("group")
	arg_16_0.viewController = arg_16_0.prophintspopuiControllerexcollection_:GetController("view")
	arg_16_0.useController = arg_16_0.prophintspopuiControllerexcollection_:GetController("Use")
	arg_16_0.bgController = arg_16_0.prophintspopuiControllerexcollection_:GetController("bg")
	arg_16_0.starController = arg_16_0.prophintspopuiControllerexcollection_:GetController("star")
	arg_16_0.tabControllerController = arg_16_0.prophintspopuiControllerexcollection_:GetController("tab")
	arg_16_0.btnShowControllerController = arg_16_0.prophintspopuiControllerexcollection_:GetController("isShowBtn")
	arg_16_0.soureceDesControllerController = arg_16_0.prophintspopuiControllerexcollection_:GetController("soureceDes")
	arg_16_0.probabilityController = arg_16_0.prophintspopuiControllerexcollection_:GetController("probability")
	arg_16_0.showItemListController = arg_16_0.prophintspopuiControllerexcollection_:GetController("showItemList")
	arg_16_0.useNumTriggerListener_ = arg_16_0.useNumSlider_.gameObject.transform:GetComponent(typeof(EventTriggerListener))
	arg_16_0.sourceList = {}
	arg_16_0.sourceScroll_ = LuaList.New(handler(arg_16_0, arg_16_0.indexSoureceItem), arg_16_0.accessUilist_, PopsoureceItem)
	arg_16_0.itemListScroll_ = LuaList.New(handler(arg_16_0, arg_16_0.indexItem), arg_16_0.itemUiList_, CommonItemView)

	arg_16_0.viewController:SetSelectedState("state0")
	arg_16_0.useController:SetSelectedState("state0")
	arg_16_0.starController:SetSelectedState("state0")
	arg_16_0.soureceDesControllerController:SetSelectedState("notshow")
	arg_16_0.probabilityController:SetSelectedState("notshow")
	arg_16_0.showItemListController:SetSelectedState("hide")
	arg_16_0.tabControllerController:SetSelectedState("none")
	arg_16_0:CustomInitUI()
end

function var_0_0.indexItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.showItemList[arg_17_1][1]
	local var_17_1 = arg_17_0.showItemList[arg_17_1][2]
	local var_17_2 = clone(ItemTemplateData)

	var_17_2.id = var_17_0
	var_17_2.number = var_17_1

	function var_17_2.clickFun()
		JumpTools.OpenPageByJump("popItem2", {
			popItemSecondViewInfo = var_17_2
		})
	end

	arg_17_2:SetData(var_17_2)
end

function var_0_0.CheckIsMeetShowItemList(arg_19_0, arg_19_1)
	if arg_19_1 == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM or arg_19_1 == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM_MULT or arg_19_1 == ItemConst.ITEM_SUB_TYPE.HERO_OPTIONAL_ONE or arg_19_1 == ItemConst.ITEM_SUB_TYPE.HERO_OPTIONAL_MULTI or arg_19_1 == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM_LIMIT_TIME or arg_19_1 == ItemConst.ITEM_SUB_TYPE.HERO_CHIP_GIFT or arg_19_1 == ItemConst.ITEM_SUB_TYPE.Hero_OPTIONAL_IMMEDIATELY_USE then
		return true
	end

	return false
end

function var_0_0.UpdateItemList(arg_20_0)
	local var_20_0 = ItemCfg[arg_20_0:GetItemID()]

	if var_20_0 and var_20_0.type == ItemConst.ITEM_TYPE.GIFT and arg_20_0:CheckIsMeetShowItemList(var_20_0.sub_type) then
		local var_20_1 = var_20_0.param

		if var_20_1 and #var_20_1 > 0 then
			arg_20_0.showItemList = var_20_1

			arg_20_0.showItemListController:SetSelectedState("show")

			arg_20_0.subNameTxt_.text = GetTips(var_0_2[var_20_0.sub_type] or "OPTIONAL_ITEM_CONTENT")

			arg_20_0.itemListScroll_:StartScroll(#arg_20_0.showItemList)
		end
	else
		arg_20_0.showItemListController:SetSelectedState("hide")
	end
end

function var_0_0.CustomInitUI(arg_21_0)
	arg_21_0.tabControllerController:SetSelectedState("descripe")
	arg_21_0.btnShowControllerController:SetSelectedState("hide")
end

function var_0_0.AddListeners(arg_22_0)
	arg_22_0:AddBtnListener(arg_22_0.maskBtn_, nil, function()
		arg_22_0:Back()
	end)
	arg_22_0:AddBtnListener(arg_22_0.viewBtn_, nil, function()
		local var_24_0 = ItemCfg[arg_22_0.itemInfo_.id]

		if var_24_0.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
			JumpTools.OpenPageByJump("/showServantView", {
				state = "onlydetail",
				id = arg_22_0.itemInfo_.id
			})
		elseif var_24_0.type == ItemConst.ITEM_TYPE.STICKER_BG or var_24_0.type == ItemConst.ITEM_TYPE.STICKER_FG then
			local var_24_1 = ProfileDecorateItemCfg[arg_22_0.itemInfo_.id]

			if var_24_1 then
				JumpTools.OpenPageByJump("customStickerPreviewPop", {
					suit = false,
					cfg = var_24_1
				})
			end
		elseif var_0_1[arg_22_0.itemInfo_.id] == 1 then
			local var_24_2 = SkinCfg[arg_22_0.itemInfo_.id]

			arg_22_0:Go("/heroSkin", {
				isDlc = false,
				showOnly = true,
				heroID = var_24_2.hero,
				skinID = arg_22_0.itemInfo_.id
			})
		elseif var_0_1[arg_22_0.itemInfo_.id] == 2 then
			local var_24_3 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_22_0.itemInfo_.id][1]
			local var_24_4 = SkinCfg[var_24_3]

			arg_22_0:Go("/heroSkin", {
				isDlc = true,
				showOnly = true,
				heroID = var_24_4.hero,
				skinID = var_24_3
			})
		end
	end)
end

function var_0_0.RemoveListeners(arg_25_0)
	return
end

function var_0_0.RefreshContent(arg_26_0)
	local var_26_0 = ItemCfg[arg_26_0:GetItemID()]
	local var_26_1 = arg_26_0.itemInfo_

	arg_26_0.nameText_.text = ItemTools.getItemName(var_26_0.id)
	arg_26_0.countentText_.text = ItemTools.getItemDesc(var_26_0.id)

	local var_26_2 = ItemTools.GetItemExpiredTimeByInfo(var_26_1)

	if var_26_2 == nil or var_26_2 == 0 then
		arg_26_0.timeController:SetSelectedState("no")
	else
		local var_26_3 = ItemTools.GetItemExpiredTimeByInfo(var_26_1)

		arg_26_0.timeController:SetSelectedState("yes")

		arg_26_0.timeLabel_.text = string.format(GetTips("TIME_DISPLAY_12"), manager.time:STimeDescS(var_26_3, "!%Y/%m/%d %H:%M"))
	end

	arg_26_0:UpdateItemList()
end

local function var_0_3(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1 or {}

	var_27_0.id = var_27_0.id or arg_27_0.id
	var_27_0.number = var_27_0.num or arg_27_0.num
	var_27_0.timeValid = var_27_0.timeValid or arg_27_0.timeValid

	return var_27_0
end

function var_0_0.RefreshCommonItem(arg_28_0, arg_28_1)
	if not arg_28_0.commonItemView_ then
		arg_28_0.commonItemView_ = CommonItemView.New(arg_28_0.commonItem_)
	end

	arg_28_0.itemInfo_.hideBottomRightTextFlag = true
	arg_28_0.itemInfo_.animatorType = ItemConst.ITEM_ANIMATOR_TYPE.NULL

	arg_28_0.commonItemView_:SetData(arg_28_0.itemInfo_)
	arg_28_0.commonItemView_.rareController_:SetSelectedState("off")
	arg_28_0:UpdateIcon()

	local var_28_0 = ItemCfg[arg_28_0:GetItemID()]

	if var_28_0 and ItemConst.ITEM_TYPE.HERO == var_28_0.type then
		-- block empty
	end

	local var_28_1 = ItemCfg[arg_28_0.itemInfo_.id]

	if var_28_1 then
		local var_28_2 = var_28_1.display_rare or 0

		arg_28_0.bgController:SetSelectedState("state" .. tostring(var_28_2))
	end
end

function var_0_0.UpdateIcon(arg_29_0)
	arg_29_0.itemImg_.sprite = ItemTools.getItemSprite(arg_29_0:GetItemID())
end

function var_0_0.SetCommonItem(arg_30_0, arg_30_1)
	arg_30_0.itemInfo_.number = arg_30_1

	arg_30_0:RefreshCommonItem()
end

function var_0_0.RefreshCount(arg_31_0)
	local var_31_0 = arg_31_0:GetItemID()
	local var_31_1 = arg_31_0.itemInfo_
	local var_31_2 = ItemTools.GetItemExpiredTimeByInfo(var_31_1)
	local var_31_3 = ItemTools.GetItemExpiredTimeByInfo(var_31_1)
	local var_31_4 = ItemTools.getItemNum(var_31_0, var_31_3)

	if not MaterialData:IsItemHaveServeTick(arg_31_0.itemInfo_.id) then
		var_31_4 = ItemTools.getItemNum(var_31_0)
	end

	arg_31_0.cntText_.text = NumberTools.RetractNumberForWindBar(var_31_4)
end

local var_0_4 = setmetatable({}, {
	__index = function()
		return true
	end
})
local var_0_5 = {
	[ItemConst.ITEM_TYPE.CURRENCY] = var_0_4,
	[ItemConst.ITEM_TYPE.HERO] = var_0_4,
	[ItemConst.ITEM_TYPE.HERO_SKIN] = var_0_4,
	[ItemConst.ITEM_TYPE.PORTRAIT] = var_0_4,
	[ItemConst.ITEM_TYPE.FRAME] = var_0_4,
	[ItemConst.ITEM_TYPE.STICKER] = var_0_4,
	[ItemConst.ITEM_TYPE.STICKER_BG] = var_0_4,
	[ItemConst.ITEM_TYPE.SCENE] = var_0_4,
	[ItemConst.ITEM_TYPE.TAG] = var_0_4,
	[ItemConst.ITEM_TYPE.CARD_BG] = var_0_4,
	[ItemConst.ITEM_TYPE.FURNITURE_SUIT] = var_0_4,
	[ItemConst.ITEM_TYPE.CHAT_BUBBLE] = var_0_4,
	[ItemConst.ITEM_TYPE.CLUB_COMMON] = var_0_4,
	[ItemConst.ITEM_TYPE.GIFT] = {
		[ItemConst.ITEM_SUB_TYPE.EQUIP_PIECE] = true,
		[ItemConst.ITEM_SUB_TYPE.EQUIP_PIECE_UP] = true,
		[ItemConst.ITEM_SUB_TYPE.DROP_ITEM] = true,
		[ItemConst.ITEM_SUB_TYPE.FUKUBUKURO] = true
	}
}

function var_0_0.ShouldHideOwnedTotalCount(arg_33_0)
	local var_33_0 = ItemCfg[arg_33_0:GetItemID()]
	local var_33_1 = var_33_0.type
	local var_33_2 = var_33_0.sub_type

	return nullable(var_0_5, var_33_1, var_33_2) or false
end

function var_0_0.RefreshOwnedTotalCount(arg_34_0)
	local var_34_0 = arg_34_0.itemInfo_ and arg_34_0.itemInfo_.isHideNum_ or false

	if arg_34_0:ShouldHideOwnedTotalCount() or var_34_0 then
		SetActive(arg_34_0.cntPanel_, false)
	else
		SetActive(arg_34_0.cntPanel_, true)
	end
end

function var_0_0.Cacheable(arg_35_0)
	return false
end

function var_0_0.ShowInfo(arg_36_0)
	arg_36_0.tabControllerController:SetSelectedState("descripe")
end

return var_0_0
