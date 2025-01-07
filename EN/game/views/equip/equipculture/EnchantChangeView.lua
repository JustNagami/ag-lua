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
	arg_5_0:AddBtnListener(arg_5_0.btnCheckSkill_, nil, function()
		JumpTools.OpenPageByJump("totalEnchantSkillPop", {
			proxy = arg_5_0.heroViewDataProxy_,
			heroId = arg_5_0.heroID_,
			equipId = arg_5_0.equipId
		})
	end)
end

function var_0_1.OnEnter(arg_11_0)
	arg_11_0.equipId = arg_11_0.params_.equipId
	arg_11_0.enchatPos = arg_11_0.params_.enchatPos
	arg_11_0.equipData = EquipData:GetEquipData(arg_11_0.equipId)
	arg_11_0.heroID_ = arg_11_0.equipData:GetEquipHero()
	arg_11_0.heroViewDataProxy_ = arg_11_0.params_.proxy or HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)

	arg_11_0:RefreshSkillData()
	arg_11_0:RefreshSelect()
	arg_11_0:RefreshUI()
	arg_11_0:ShowBar()
	arg_11_0:RegistEventListener(CURRENCY_UPDATE, handler(arg_11_0, arg_11_0.OnGoldChange))
	arg_11_0:RegistEventListener(MATERIAL_MODIFY, handler(arg_11_0, arg_11_0.OnMaterialModify))
	arg_11_0:RegistEventListener(DIRECTIONAL_ENCHANT_SUCCESS, handler(arg_11_0, arg_11_0.OnEnchantSkillChange))
end

function var_0_1.ShowBar(arg_12_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		CurrencyConst.CURRENCY_TYPE_GOLD
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
end

function var_0_1.OnTop(arg_13_0)
	arg_13_0:ShowBar()
end

function var_0_1.RefreshSkillData(arg_14_0)
	arg_14_0.skillList_ = EquipTools.RefreshSkillData(arg_14_0.equipData, arg_14_0.heroID_, arg_14_0.heroViewDataProxy_)
end

function var_0_1.InitFixedSkill(arg_15_0)
	arg_15_0.fixedSkills = {}

	for iter_15_0 = 1, 2 do
		local var_15_0 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_15_0, arg_15_0["enchantSkill_" .. iter_15_0])

		var_15_0.selectController_ = var_15_0.transCon_:GetController("select")
		var_15_0.lockController_ = var_15_0.transCon_:GetController("lock")
		var_15_0.nullController_ = var_15_0.transCon_:GetController("null")
		var_15_0.recommendController_ = var_15_0.transCon_:GetController("recommend")

		arg_15_0:AddBtnListener(var_15_0.btnLock_, nil, function()
			arg_15_0:OnLockClick(iter_15_0)
		end)
		arg_15_0:AddBtnListener(var_15_0.btnInfo_, nil, function()
			if var_15_0.isSkill then
				arg_15_0:OnSkillClick(var_15_0, arg_15_0.skillList_[var_15_0.id], iter_15_0)
			end
		end)
		table.insert(arg_15_0.fixedSkills, var_15_0)
	end
end

function var_0_1.InitMaterial(arg_18_0)
	arg_18_0.materials_ = EquipData:GetEnchantMaterial()
	arg_18_0.showLockMaterials_ = EquipData:GetLockEnchantMaterial()
	arg_18_0.materialGoList_ = {}

	for iter_18_0 = 1, #arg_18_0.materials_ do
		local var_18_0 = CommonItemView.New(arg_18_0["material_" .. iter_18_0])
		local var_18_1 = clone(ItemTemplateData)

		var_18_1.id = arg_18_0.materials_[iter_18_0].id
		var_18_1.number = nil

		function var_18_1.clickFun()
			if arg_18_0.isLockedSkill_ then
				-- block empty
			else
				arg_18_0:OnMarerialChange(iter_18_0)
			end
		end

		var_18_0:SetData(var_18_1)

		arg_18_0.materialGoList_[iter_18_0] = var_18_0
	end
end

function var_0_1.RefreshSelect(arg_20_0)
	local var_20_0 = EquipData:GetIsSetLockView(arg_20_0.equipId, arg_20_0.enchatPos)

	arg_20_0.fixedSkills[1].lockController_:SetSelectedState(var_20_0 == 1 and "lock" or "unlock")
	arg_20_0.fixedSkills[2].lockController_:SetSelectedState(var_20_0 == 2 and "lock" or "unlock")

	if var_20_0 then
		arg_20_0:OnMarerialChange(3)

		arg_20_0.isLockedSkill_ = true
		arg_20_0.lockedIndex_ = var_20_0

		arg_20_0:RreshMateriaMoney()
	else
		arg_20_0.materialIndex = EquipData:GetSelectEnchantMaterialIndex()

		arg_20_0:OnMarerialChange(arg_20_0.materialIndex)
	end
end

function var_0_1.RefreshUI(arg_21_0)
	arg_21_0:RreshMaterialUI()
	arg_21_0:RreshFixedSkill()
	arg_21_0:RefreshBottom()
end

function var_0_1.RreshMaterialUI(arg_22_0)
	local var_22_0 = arg_22_0.materialGoList_

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		local var_22_1 = arg_22_0.materials_[iter_22_0]
		local var_22_2 = arg_22_0.showLockMaterials_[iter_22_0]
		local var_22_3 = ItemTools.getItemNum(var_22_1.id)
		local var_22_4 = arg_22_0.isLockedSkill_ and var_22_2.number or var_22_1.number

		iter_22_1:RefreshBottomText({
			var_22_3,
			var_22_4
		})
		iter_22_1:RefreshLock(arg_22_0.isLockedSkill_ and not var_22_2.lock or false)
	end
end

function var_0_1.RreshFixedSkill(arg_23_0, arg_23_1)
	local var_23_0 = EquipData:GetEquipData(arg_23_0.equipId).enchant[arg_23_0.enchatPos] or {}

	if arg_23_1 then
		arg_23_0.glowAnim_:Play("glow_bg")
	end

	arg_23_0.fixedSkillIds_ = {}
	arg_23_0.fixedSkillInfo_ = {}

	for iter_23_0 = 1, 2 do
		local var_23_1 = var_23_0[iter_23_0]
		local var_23_2 = arg_23_0.fixedSkills[iter_23_0]

		if var_23_1 then
			var_23_2.id = var_23_1.id

			local var_23_3 = EquipSkillCfg[var_23_1.id]
			local var_23_4 = arg_23_0.skillList_[var_23_1.id] and arg_23_0.skillList_[var_23_1.id].num or var_23_1.num

			arg_23_0.fixedSkillIds_[var_23_1.id] = arg_23_0.fixedSkillIds_[var_23_1.id] and arg_23_0.fixedSkillIds_[var_23_1.id] + 1 or 1

			local var_23_5 = var_23_4 > var_23_3.lvmax and string.format("<color=#FF000B>%s</color>", var_23_4) or var_23_4
			local var_23_6 = string.format("%s/%s", var_23_5, var_23_3.lvmax)

			var_23_2.num_.text = var_23_6

			local var_23_7 = var_23_4 > var_23_3.lvmax and var_23_3.lvmax or var_23_4
			local var_23_8 = var_23_3.upgrade / var_23_3.percent * var_23_7
			local var_23_9 = GetCfgDescriptionWithValue(var_23_3.desc[1], tostring(var_23_8))

			if var_23_3.desc_spec_value ~= nil and var_23_3.desc_spec_value ~= "" then
				var_23_9 = string.gsub(var_23_9, tostring(var_23_8), var_23_3.desc_spec_value[arg_23_0.cfg_.num])
			end

			var_23_2.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Equip/EquipSkillIcon/" .. var_23_3.icon)
			var_23_2.name_.text = GetI18NText(var_23_3.name)
			var_23_2.desc_.text = var_23_9

			var_23_2.nullController_:SetSelectedState("skill")

			var_23_2.isSkill = true

			local var_23_10 = arg_23_0.heroID_ and var_23_4 <= var_23_3.lvmax and HeroData:GetRecommendEquipSkill(arg_23_0.heroID_, var_23_1.id) or 0

			var_23_2.recommendController_:SetSelectedState(var_23_10)

			arg_23_0.fixedSkillInfo_[iter_23_0] = {
				skillId = var_23_1.id,
				numText = var_23_6,
				descText = var_23_9,
				recommendLevel = var_23_10
			}
		else
			var_23_2.isSkill = false

			var_23_2.nullController_:SetSelectedState("null")
			var_23_2.recommendController_:SetSelectedState(0)

			arg_23_0.fixedSkillInfo_[iter_23_0] = nil
		end
	end
end

function var_0_1.RefreshBottom(arg_24_0, arg_24_1)
	arg_24_0.enchantPreviewList = EquipData:GetEquipData(arg_24_0.equipId).enchant_preview[arg_24_0.enchatPos]
	arg_24_0.enchantNum_.text = string.format(GetTips("ENCHANT_PREVIEW_NUM"), #arg_24_0.enchantPreviewList, arg_24_0.max)

	arg_24_0.giveupController_:SetSelectedState(#arg_24_0.enchantPreviewList == 0 and "off" or "on")

	if arg_24_1 then
		if arg_24_1.scrollToIndex then
			local var_24_0 = math.max(0, #arg_24_0.enchantPreviewList)

			arg_24_0:ShowGlowAnim(var_24_0)

			arg_24_0.targetIndex_ = var_24_0

			local var_24_1 = math.max(0, var_24_0 - 1)

			arg_24_0.enchantScroller_:ScrollToIndex(var_24_1, true, true)
			arg_24_0.enchantScroller_:Refresh()
		elseif arg_24_1.keepScrollPos then
			arg_24_0.targetIndex_ = 0

			arg_24_0.enchantScroller_:StartScrollByPosition(arg_24_0.max, arg_24_0.enchantScroller_:GetScrolledPosition())
		end
	else
		arg_24_0.targetIndex_ = 0

		arg_24_0.enchantScroller_:StartScroll(arg_24_0.max)
	end
end

function var_0_1.indexPreviewItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.enchantPreviewList[arg_25_1] or {}

	arg_25_2:Refresh(arg_25_0.heroID_, var_25_0, arg_25_0.skillList_, arg_25_0.equipId, arg_25_0.enchatPos, arg_25_1, arg_25_0.fixedSkillIds_, arg_25_0.targetIndex_)
	arg_25_2:RegistSkillClickCallBck(handler(arg_25_0, arg_25_0.OnSkillClick))
end

function var_0_1.ShowGlowAnim(arg_26_0, arg_26_1)
	if arg_26_0.frameTimer_ then
		arg_26_0.frameTimer_:Stop()

		arg_26_0.frameTimer_ = nil
	end

	arg_26_0.frameTimer_ = FrameTimer.New(function()
		local var_27_0 = arg_26_0.enchantScroller_:GetItemByIndex(arg_26_1)

		if var_27_0 ~= nil then
			var_27_0:ShowAnim()
		end

		arg_26_0.frameTimer_:Stop()
	end, 20, 1)

	arg_26_0.frameTimer_:Start()
end

function var_0_1.OnSkillClick(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.skillPopView_:RefreshData(arg_28_0, arg_28_2, true)

	arg_28_0.selectedSkillItem_ = arg_28_1

	arg_28_0.selectedSkillItem_.selectController_:SetSelectedIndex(1)

	local var_28_0 = arg_28_0.transform:InverseTransformPoint(arg_28_1.transform.position)
	local var_28_1 = var_28_0.x / Screen.width <= arg_28_0.standardRatio_ and var_28_0.x + 500 or var_28_0.x - 500

	arg_28_0.equipSkillPopGo_.transform.localPosition = Vector3(var_28_1, -20, 0)

	arg_28_0.popController_:SetSelectedState("on")
end

function var_0_1.HidePop(arg_29_0)
	if arg_29_0.selectedSkillItem_ then
		arg_29_0.selectedSkillItem_.selectController_:SetSelectedIndex(0)

		arg_29_0.selectedSkillItem_ = nil
	end

	arg_29_0.popController_:SetSelectedState("off")
end

function var_0_1.OnMarerialChange(arg_30_0, arg_30_1)
	if arg_30_0.isLockedSkill_ then
		return
	end

	arg_30_0.materialIndex = arg_30_1

	EquipData:SetSelectEnchantMaterialIndex(arg_30_1)
	arg_30_0:RreshMateriaMoney()

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.materialGoList_) do
		iter_30_1:RefreshSelectState2(iter_30_0 == arg_30_0.materialIndex)
	end
end

function var_0_1.RreshMateriaMoney(arg_31_0)
	local var_31_0 = arg_31_0.isLockedSkill_ and arg_31_0.showLockMaterials_[arg_31_0.materialIndex] or arg_31_0.materials_[arg_31_0.materialIndex]
	local var_31_1 = var_31_0.money
	local var_31_2 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
	local var_31_3 = tostring(var_31_1)

	if var_31_2 < var_31_1 then
		var_31_3 = "<color='#FF0000'>" .. var_31_3 .. "</color>"
	end

	arg_31_0.costNum_.text = var_31_3

	local var_31_4 = var_31_0.id
	local var_31_5 = ItemCfg[var_31_4]

	if arg_31_0.isLockedSkill_ then
		arg_31_0.materialText_.text = GetTips("EQUIP_SKILL_LOCK_DES")
	else
		arg_31_0.materialText_.text = var_31_5 and ItemTools.getItemDesc(var_31_4) or ""
	end
end

function var_0_1.OnEnchantClick(arg_32_0)
	arg_32_0.enchantPreviewList = EquipData:GetEquipData(arg_32_0.equipId).enchant_preview[arg_32_0.enchatPos]

	if arg_32_0.max <= #arg_32_0.enchantPreviewList then
		ShowTips("EQUIP_ENCHANT_RESULT_NUM_MAX")

		return
	end

	local var_32_0 = arg_32_0.equipId
	local var_32_1 = arg_32_0.enchatPos
	local var_32_2 = arg_32_0.materials_[arg_32_0.materialIndex]
	local var_32_3 = 0

	if arg_32_0.isLockedSkill_ then
		var_32_3 = arg_32_0.lockedIndex_
		var_32_2 = arg_32_0.showLockMaterials_[arg_32_0.materialIndex]
	end

	EquipAction.QueryEquipEnchant(var_32_0, var_32_1, var_32_2, var_32_3)
end

function var_0_1.OnEquipEnchant(arg_33_0)
	arg_33_0:RreshMaterialUI()
	arg_33_0:RreshMateriaMoney()
	arg_33_0:RefreshBottom({
		scrollToIndex = true
	})
end

function var_0_1.OnEquipEnchantConfirm(arg_34_0, arg_34_1)
	arg_34_0:RefreshSkillData()
	arg_34_0:RreshFixedSkill(arg_34_1)

	if arg_34_1 then
		-- block empty
	end

	local var_34_0 = {
		keepScrollPos = true
	}

	arg_34_0:RefreshBottom(var_34_0)
end

function var_0_1.OnEquipEnchantGiveUp(arg_35_0)
	arg_35_0:RefreshBottom()
end

function var_0_1.OnGoldChange(arg_36_0, arg_36_1)
	if arg_36_1 == CurrencyConst.CURRENCY_TYPE_GOLD then
		arg_36_0:RreshMateriaMoney()
	end
end

function var_0_1.OnMaterialModify(arg_37_0, arg_37_1)
	local var_37_0 = 606

	if ItemCfg[arg_37_1].sub_type == var_37_0 then
		arg_37_0:RreshMaterialUI()
	end
end

function var_0_1.OnLockClick(arg_38_0, arg_38_1)
	if arg_38_0.isLockedSkill_ then
		if arg_38_0.lockedIndex_ then
			if arg_38_0.lockedIndex_ == arg_38_1 then
				arg_38_0.fixedSkills[arg_38_0.lockedIndex_].lockController_:SetSelectedState("unlock")

				arg_38_0.isLockedSkill_ = false
				arg_38_0.lockedIndex_ = nil
				arg_38_0.materialIndex = 3

				EquipData:SetEnchatLockIndex(0, 0, 0)
			elseif #arg_38_0.enchantPreviewList > 0 then
				ShowTips(GetTips("EQUIP_SKILL_LOCK_ENCHANT_EMPTY"))
			else
				arg_38_0.fixedSkills[arg_38_0.lockedIndex_].lockController_:SetSelectedState("unlock")
				arg_38_0.fixedSkills[arg_38_1].lockController_:SetSelectedState("lock")

				arg_38_0.lockedIndex_ = arg_38_1

				EquipData:SetEnchatLockIndex(arg_38_0.equipId, arg_38_0.enchatPos, arg_38_0.lockedIndex_)
			end
		end
	elseif #arg_38_0.enchantPreviewList > 0 then
		ShowTips(GetTips("EQUIP_SKILL_LOCK_ENCHANT_EMPTY"))
	else
		arg_38_0.fixedSkills[arg_38_1].lockController_:SetSelectedState("lock")
		arg_38_0:OnMarerialChange(3)

		arg_38_0.isLockedSkill_ = true
		arg_38_0.lockedIndex_ = arg_38_1

		EquipData:SetEnchatLockIndex(arg_38_0.equipId, arg_38_0.enchatPos, arg_38_0.lockedIndex_)
	end

	arg_38_0:RreshMaterialUI()
	arg_38_0:RreshMateriaMoney()
end

function var_0_1.OnEnchantSkillChange(arg_39_0)
	arg_39_0:RefreshSkillData()
	arg_39_0:RreshFixedSkill()
	arg_39_0:RefreshBottom()
end

function var_0_1.OnExit(arg_40_0)
	manager.windowBar:HideBar()
	arg_40_0:HidePop()
	arg_40_0:RemoveAllEventListener()

	arg_40_0.isLockedSkill_ = false
	arg_40_0.lockedIndex_ = nil

	for iter_40_0, iter_40_1 in pairs(arg_40_0.fixedSkills) do
		iter_40_1.lockController_:SetSelectedState("unlock")
	end

	if arg_40_0.frameTimer_ then
		arg_40_0.frameTimer_:Stop()

		arg_40_0.frameTimer_ = nil
	end
end

function var_0_1.Dispose(arg_41_0)
	arg_41_0.enchantScroller_:Dispose()
	arg_41_0.skillPopView_:Dispose()

	for iter_41_0, iter_41_1 in pairs(arg_41_0.materialGoList_) do
		iter_41_1:Dispose()
	end

	var_0_1.super.Dispose(arg_41_0)
end

return var_0_1
