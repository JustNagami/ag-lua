local var_0_0 = import("game.views.equip.equipCulture.EquipBaseView")
local var_0_1 = class("EnchantChangeView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Hero_equip/Develop/HeroEquipEnchant"
end

function var_0_1.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_1.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
	var_0_1.super.Init(arg_3_0)

	arg_3_0.max = GameSetting.equip_enchant_save_num.value[1] or 0
	arg_3_0.isLockedSkill_ = false
	arg_3_0.lockedIndex_ = nil
	arg_3_0.standardRatio_ = 0.09270833333333334
end

function var_0_1.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.skillPreItems_ = {}
	arg_4_0.items_ = {}
	arg_4_0.materialIndex = 1
	arg_4_0.skillPopView_ = EquipNewSkillInfoView.New(arg_4_0.equipSkillPopGo_)
	arg_4_0.costIcon_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.CURRENCY_TYPE_GOLD)
	arg_4_0.enchantScroller_ = LuaList.New(handler(arg_4_0, arg_4_0.indexPreviewItem), arg_4_0.enchantListGo_, EquipEnchantPreviewItem)
	arg_4_0.giveupController_ = arg_4_0.transCon_:GetController("allGiveup")
	arg_4_0.popController_ = arg_4_0.transCon_:GetController("pop")

	arg_4_0:InitFixedSkill()
	arg_4_0:InitMaterial()
end

function var_0_1.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btnEnchant_, nil, function()
		arg_5_0:OnEnchantClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnGiveUp_, nil, function()
		if arg_5_0.enchantPreviewList and #arg_5_0.enchantPreviewList > 0 then
			EquipAction.QueryEquipGiveUpAllEnchant(arg_5_0.equipId, arg_5_0.enchatPos)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnHidePopMask_, nil, function()
		arg_5_0:HidePop()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnAccess_, nil, function()
		local var_9_0 = arg_5_0.materials_[arg_5_0.materialIndex]
		local var_9_1 = var_9_0.id
		local var_9_2 = ItemTools.getItemNum(var_9_0.id)

		ShowPopItem(POP_SOURCE_ITEM, {
			var_9_1,
			var_9_2
		})
	end)
end

function var_0_1.OnEnter(arg_10_0)
	arg_10_0.equipId = arg_10_0.params_.equipId
	arg_10_0.enchatPos = arg_10_0.params_.enchatPos
	arg_10_0.equipData = EquipData:GetEquipData(arg_10_0.equipId)
	arg_10_0.heroID_ = arg_10_0.equipData:GetEquipHero()
	arg_10_0.heroViewDataProxy_ = arg_10_0.params_.proxy

	arg_10_0:RefreshSkillData()
	arg_10_0:RefreshSelect()
	arg_10_0:RefreshUI()
	arg_10_0:ShowBar()
	arg_10_0:RegistEventListener(CURRENCY_UPDATE, handler(arg_10_0, arg_10_0.OnGoldChange))
	arg_10_0:RegistEventListener(MATERIAL_MODIFY, handler(arg_10_0, arg_10_0.OnMaterialModify))
end

function var_0_1.ShowBar(arg_11_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		CurrencyConst.CURRENCY_TYPE_GOLD
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
end

function var_0_1.OnTop(arg_12_0)
	arg_12_0:ShowBar()
end

function var_0_1.RefreshSkillData(arg_13_0)
	arg_13_0.skillList_ = {}

	if arg_13_0.heroID_ and arg_13_0.heroViewDataProxy_ then
		local var_13_0 = arg_13_0.heroViewDataProxy_:GetEquipDataList(arg_13_0.heroID_)
		local var_13_1 = HeroData:GetHeroData(arg_13_0.heroID_)
		local var_13_2, var_13_3, var_13_4 = EquipTools.CountHeroTotalSkill(var_13_0, var_13_1, true)

		for iter_13_0, iter_13_1 in pairs(var_13_2) do
			arg_13_0.skillList_[iter_13_0] = {
				id = iter_13_0,
				num = iter_13_1,
				isAdd = var_13_3,
				location = var_13_4[iter_13_0]
			}
		end
	end
end

function var_0_1.InitFixedSkill(arg_14_0)
	arg_14_0.fixedSkills = {}

	for iter_14_0 = 1, 2 do
		local var_14_0 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_14_0, arg_14_0["enchantSkill_" .. iter_14_0])

		var_14_0.selectController_ = var_14_0.transCon_:GetController("select")
		var_14_0.lockController_ = var_14_0.transCon_:GetController("lock")
		var_14_0.nullController_ = var_14_0.transCon_:GetController("null")

		arg_14_0:AddBtnListener(var_14_0.btnLock_, nil, function()
			arg_14_0:OnLockClick(iter_14_0)
		end)
		arg_14_0:AddBtnListener(var_14_0.btnInfo_, nil, function()
			if var_14_0.isSkill then
				arg_14_0:OnSkillClick(var_14_0, arg_14_0.skillList_[var_14_0.id], iter_14_0)
			end
		end)
		table.insert(arg_14_0.fixedSkills, var_14_0)
	end
end

function var_0_1.InitMaterial(arg_17_0)
	arg_17_0.materials_ = EquipData:GetEnchantMaterial()
	arg_17_0.showLockMaterials_ = EquipData:GetLockEnchantMaterial()
	arg_17_0.materialGoList_ = {}

	for iter_17_0 = 1, #arg_17_0.materials_ do
		local var_17_0 = CommonItemView.New(arg_17_0["material_" .. iter_17_0])
		local var_17_1 = clone(ItemTemplateData)

		var_17_1.id = arg_17_0.materials_[iter_17_0].id
		var_17_1.number = nil

		function var_17_1.clickFun()
			if arg_17_0.isLockedSkill_ then
				-- block empty
			else
				arg_17_0:OnMarerialChange(iter_17_0)
			end
		end

		var_17_0:SetData(var_17_1)

		arg_17_0.materialGoList_[iter_17_0] = var_17_0
	end
end

function var_0_1.RefreshSelect(arg_19_0)
	local var_19_0 = EquipData:GetIsSetLockView(arg_19_0.equipId, arg_19_0.enchatPos)

	if var_19_0 then
		arg_19_0.fixedSkills[var_19_0].lockController_:SetSelectedState("lock")
		arg_19_0:OnMarerialChange(3)

		arg_19_0.isLockedSkill_ = true
		arg_19_0.lockedIndex_ = var_19_0

		arg_19_0:RreshMateriaMoney()
	else
		arg_19_0.fixedSkills[1].lockController_:SetSelectedState("unlock")
		arg_19_0.fixedSkills[2].lockController_:SetSelectedState("unlock")

		arg_19_0.materialIndex = EquipData:GetSelectEnchantMaterialIndex()

		arg_19_0:OnMarerialChange(arg_19_0.materialIndex)
	end
end

function var_0_1.RefreshUI(arg_20_0)
	arg_20_0:RreshMaterialUI()
	arg_20_0:RreshFixedSkill()
	arg_20_0:RefreshBottom()
end

function var_0_1.RreshMaterialUI(arg_21_0)
	local var_21_0 = arg_21_0.materialGoList_

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		local var_21_1 = arg_21_0.materials_[iter_21_0]
		local var_21_2 = arg_21_0.showLockMaterials_[iter_21_0]
		local var_21_3 = ItemTools.getItemNum(var_21_1.id)
		local var_21_4 = arg_21_0.isLockedSkill_ and var_21_2.number or var_21_1.number

		iter_21_1:RefreshBottomText({
			var_21_3,
			var_21_4
		})
		iter_21_1:RefreshLock(arg_21_0.isLockedSkill_ and not var_21_2.lock or false)
	end
end

function var_0_1.RreshFixedSkill(arg_22_0, arg_22_1)
	local var_22_0 = EquipData:GetEquipData(arg_22_0.equipId).enchant[arg_22_0.enchatPos] or {}

	if arg_22_1 then
		arg_22_0.glowAnim_:Play("glow_bg")
	end

	arg_22_0.fixedSkillIds_ = {}

	for iter_22_0 = 1, 2 do
		local var_22_1 = var_22_0[iter_22_0]
		local var_22_2 = arg_22_0.fixedSkills[iter_22_0]

		if var_22_1 then
			var_22_2.id = var_22_1.id

			local var_22_3 = EquipSkillCfg[var_22_1.id]
			local var_22_4 = arg_22_0.skillList_[var_22_1.id] and arg_22_0.skillList_[var_22_1.id].num or var_22_1.num

			arg_22_0.fixedSkillIds_[var_22_1.id] = arg_22_0.fixedSkillIds_[var_22_1.id] and arg_22_0.fixedSkillIds_[var_22_1.id] + 1 or 1

			local var_22_5 = var_22_4 > var_22_3.lvmax and string.format("<color=#FF000B>%s</color>", var_22_4) or var_22_4

			var_22_2.num_.text = string.format("%s/%s", var_22_5, var_22_3.lvmax)

			local var_22_6 = var_22_4 > var_22_3.lvmax and var_22_3.lvmax or var_22_4
			local var_22_7 = var_22_3.upgrade / var_22_3.percent * var_22_6
			local var_22_8 = GetCfgDescriptionWithValue(var_22_3.desc[1], tostring(var_22_7))

			if var_22_3.desc_spec_value ~= nil and var_22_3.desc_spec_value ~= "" then
				var_22_8 = string.gsub(var_22_8, tostring(var_22_7), var_22_3.desc_spec_value[arg_22_0.cfg_.num])
			end

			var_22_2.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Equip/EquipSkillIcon/" .. var_22_3.icon)
			var_22_2.name_.text = GetI18NText(var_22_3.name)
			var_22_2.desc_.text = var_22_8

			var_22_2.nullController_:SetSelectedState("skill")

			var_22_2.isSkill = true
		else
			var_22_2.isSkill = false

			var_22_2.nullController_:SetSelectedState("null")
		end
	end
end

function var_0_1.RefreshBottom(arg_23_0, arg_23_1)
	arg_23_0.enchantPreviewList = EquipData:GetEquipData(arg_23_0.equipId).enchant_preview[arg_23_0.enchatPos]
	arg_23_0.enchantNum_.text = string.format(GetTips("ENCHANT_PREVIEW_NUM"), #arg_23_0.enchantPreviewList, arg_23_0.max)

	arg_23_0.giveupController_:SetSelectedState(#arg_23_0.enchantPreviewList == 0 and "off" or "on")

	if arg_23_1 then
		if arg_23_1.scrollToIndex then
			local var_23_0 = math.max(0, #arg_23_0.enchantPreviewList)

			arg_23_0:ShowGlowAnim(var_23_0)

			local var_23_1 = math.max(0, var_23_0 - 1)

			arg_23_0.enchantScroller_:ScrollToIndex(var_23_1, true, true)
		elseif arg_23_1.keepScrollPos then
			arg_23_0.enchantScroller_:StartScrollByPosition(arg_23_0.max, arg_23_0.enchantScroller_:GetScrolledPosition())
		end
	else
		arg_23_0.enchantScroller_:StartScroll(arg_23_0.max)
	end
end

function var_0_1.indexPreviewItem(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.enchantPreviewList[arg_24_1] or {}

	arg_24_2:Refresh(var_24_0, arg_24_0.skillList_, arg_24_0.equipId, arg_24_0.enchatPos, arg_24_1, arg_24_0.fixedSkillIds_)
	arg_24_2:RegistSkillClickCallBck(handler(arg_24_0, arg_24_0.OnSkillClick))
end

function var_0_1.ShowGlowAnim(arg_25_0, arg_25_1)
	local var_25_0
	local var_25_1 = arg_25_1

	var_25_0 = FrameTimer.New(function()
		local var_26_0 = arg_25_0.enchantScroller_:GetItemByIndex(var_25_1)

		if var_26_0 ~= nil then
			var_26_0:ShowAnim()
		end

		var_25_0:Stop()
	end, 20, 1)

	var_25_0:Start()
end

function var_0_1.OnSkillClick(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.skillPopView_:RefreshData(arg_27_0, arg_27_2, true)

	arg_27_0.selectedSkillItem_ = arg_27_1

	arg_27_0.selectedSkillItem_.selectController_:SetSelectedIndex(1)

	local var_27_0 = arg_27_0.transform:InverseTransformPoint(arg_27_1.transform.position)
	local var_27_1 = var_27_0.x / Screen.width <= arg_27_0.standardRatio_ and var_27_0.x + 500 or var_27_0.x - 500

	arg_27_0.equipSkillPopGo_.transform.localPosition = Vector3(var_27_1, -20, 0)

	arg_27_0.popController_:SetSelectedState("on")
end

function var_0_1.HidePop(arg_28_0)
	if arg_28_0.selectedSkillItem_ then
		arg_28_0.selectedSkillItem_.selectController_:SetSelectedIndex(0)

		arg_28_0.selectedSkillItem_ = nil
	end

	arg_28_0.popController_:SetSelectedState("off")
end

function var_0_1.OnMarerialChange(arg_29_0, arg_29_1)
	if arg_29_0.isLockedSkill_ then
		return
	end

	arg_29_0.materialIndex = arg_29_1

	EquipData:SetSelectEnchantMaterialIndex(arg_29_1)
	arg_29_0:RreshMateriaMoney()

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.materialGoList_) do
		iter_29_1:RefreshSelectState2(iter_29_0 == arg_29_0.materialIndex)
	end
end

function var_0_1.RreshMateriaMoney(arg_30_0)
	local var_30_0 = arg_30_0.isLockedSkill_ and arg_30_0.showLockMaterials_[arg_30_0.materialIndex] or arg_30_0.materials_[arg_30_0.materialIndex]
	local var_30_1 = var_30_0.money
	local var_30_2 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
	local var_30_3 = tostring(var_30_1)

	if var_30_2 < var_30_1 then
		var_30_3 = "<color='#FF0000'>" .. var_30_3 .. "</color>"
	end

	arg_30_0.costNum_.text = var_30_3

	local var_30_4 = var_30_0.id
	local var_30_5 = ItemCfg[var_30_4]

	if arg_30_0.isLockedSkill_ then
		arg_30_0.materialText_.text = GetTips("EQUIP_SKILL_LOCK_DES")
	else
		arg_30_0.materialText_.text = var_30_5 and ItemTools.getItemDesc(var_30_4) or ""
	end
end

function var_0_1.OnEnchantClick(arg_31_0)
	arg_31_0.enchantPreviewList = EquipData:GetEquipData(arg_31_0.equipId).enchant_preview[arg_31_0.enchatPos]

	if arg_31_0.max <= #arg_31_0.enchantPreviewList then
		ShowTips("EQUIP_ENCHANT_RESULT_NUM_MAX")

		return
	end

	local var_31_0 = arg_31_0.equipId
	local var_31_1 = arg_31_0.enchatPos
	local var_31_2 = arg_31_0.materials_[arg_31_0.materialIndex]
	local var_31_3 = 0

	if arg_31_0.isLockedSkill_ then
		var_31_3 = arg_31_0.lockedIndex_
		var_31_2 = arg_31_0.showLockMaterials_[arg_31_0.materialIndex]
	end

	EquipAction.QueryEquipEnchant(var_31_0, var_31_1, var_31_2, var_31_3)
end

function var_0_1.OnEquipEnchant(arg_32_0)
	arg_32_0:RreshMaterialUI()
	arg_32_0:RreshMateriaMoney()
	arg_32_0:RefreshBottom({
		scrollToIndex = true
	})
end

function var_0_1.OnEquipEnchantConfirm(arg_33_0, arg_33_1)
	arg_33_0:RefreshSkillData()
	arg_33_0:RreshFixedSkill(arg_33_1)

	if arg_33_1 then
		-- block empty
	end

	local var_33_0 = {
		keepScrollPos = true
	}

	arg_33_0:RefreshBottom(var_33_0)
end

function var_0_1.OnEquipEnchantGiveUp(arg_34_0)
	arg_34_0:RefreshBottom()
end

function var_0_1.OnGoldChange(arg_35_0, arg_35_1)
	if arg_35_1 == CurrencyConst.CURRENCY_TYPE_GOLD then
		arg_35_0:RreshMateriaMoney()
	end
end

function var_0_1.OnMaterialModify(arg_36_0, arg_36_1)
	local var_36_0 = 606

	if ItemCfg[arg_36_1].sub_type == var_36_0 then
		arg_36_0:RreshMaterialUI()
	end
end

function var_0_1.OnLockClick(arg_37_0, arg_37_1)
	if arg_37_0.isLockedSkill_ then
		if arg_37_0.lockedIndex_ then
			if arg_37_0.lockedIndex_ == arg_37_1 then
				arg_37_0.fixedSkills[arg_37_0.lockedIndex_].lockController_:SetSelectedState("unlock")

				arg_37_0.isLockedSkill_ = false
				arg_37_0.lockedIndex_ = nil
				arg_37_0.materialIndex = 3

				EquipData:SetEnchatLockIndex(0, 0, 0)
			elseif #arg_37_0.enchantPreviewList > 0 then
				ShowTips(GetTips("EQUIP_SKILL_LOCK_ENCHANT_EMPTY"))
			else
				arg_37_0.fixedSkills[arg_37_0.lockedIndex_].lockController_:SetSelectedState("unlock")
				arg_37_0.fixedSkills[arg_37_1].lockController_:SetSelectedState("lock")

				arg_37_0.lockedIndex_ = arg_37_1

				EquipData:SetEnchatLockIndex(arg_37_0.equipId, arg_37_0.enchatPos, arg_37_0.lockedIndex_)
			end
		end
	elseif #arg_37_0.enchantPreviewList > 0 then
		ShowTips(GetTips("EQUIP_SKILL_LOCK_ENCHANT_EMPTY"))
	else
		arg_37_0.fixedSkills[arg_37_1].lockController_:SetSelectedState("lock")
		arg_37_0:OnMarerialChange(3)

		arg_37_0.isLockedSkill_ = true
		arg_37_0.lockedIndex_ = arg_37_1

		EquipData:SetEnchatLockIndex(arg_37_0.equipId, arg_37_0.enchatPos, arg_37_0.lockedIndex_)
	end

	arg_37_0:RreshMaterialUI()
	arg_37_0:RreshMateriaMoney()
end

function var_0_1.OnExit(arg_38_0)
	manager.windowBar:HideBar()
	arg_38_0:HidePop()
	arg_38_0:RemoveAllEventListener()

	arg_38_0.isLockedSkill_ = false
	arg_38_0.lockedIndex_ = nil

	for iter_38_0, iter_38_1 in pairs(arg_38_0.fixedSkills) do
		iter_38_1.lockController_:SetSelectedState("unlock")
	end
end

function var_0_1.Dispose(arg_39_0)
	arg_39_0.enchantScroller_:Dispose()
	arg_39_0.skillPopView_:Dispose()

	for iter_39_0, iter_39_1 in pairs(arg_39_0.materialGoList_) do
		iter_39_1:Dispose()
	end

	var_0_1.super.Dispose(arg_39_0)
end

return var_0_1
