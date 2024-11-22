local var_0_0 = class("NewSectionMimirView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Show(true)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.lockController_ = arg_3_0.controllerExCollection_:GetController("lock")
	arg_3_0.managerController_ = arg_3_0.controllerExCollection_:GetController("chipManager")
end

function var_0_0.AddListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		if arg_4_0.isLock_ then
			return
		end

		if not arg_4_0.sectionProxy_.canChangeMimir then
			ShowTips("CANNOT_CHANGE_CHIP")

			return
		end

		ChipAction:UpdateChipRed()
		arg_4_0:Go("/battleChipManager", {
			stageType = arg_4_0.stageType_,
			stageID = arg_4_0.stageID_,
			sectionProxy = arg_4_0.sectionProxy_
		})
	end)
end

function var_0_0.SetProxy(arg_6_0, arg_6_1)
	arg_6_0.sectionProxy_ = arg_6_1
	arg_6_0.stageType_ = arg_6_1.stageType
	arg_6_0.stageID_ = arg_6_1.stageID
	arg_6_0.reserveParams_ = arg_6_1:GetReserveParams()
end

function var_0_0.SetData(arg_7_0)
	arg_7_0.mimirID_ = arg_7_0:GetMimirID()

	if arg_7_0.mimirID_ ~= 0 then
		arg_7_0.chipList_ = arg_7_0:GetMimirChipList()
	else
		arg_7_0.chipList_ = {}
	end

	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0:RefreshLock()
	arg_8_0:RefreshMimirUI()
	arg_8_0:RefreshChipList()
end

function var_0_0.RefreshLock(arg_9_0)
	arg_9_0.isLock_ = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CHIP_MANAGER) == true

	arg_9_0.lockController_:SetSelectedState(tostring(arg_9_0.isLock_))
end

function var_0_0.RefreshMimirUI(arg_10_0)
	local var_10_0 = arg_10_0.mimirID_ or 0

	if var_10_0 ~= 0 then
		arg_10_0.managerController_:SetSelectedState("true")

		arg_10_0.chipManagerIcon_.sprite = ChipTools.GetChipManagerIcon(var_10_0)
	else
		arg_10_0.managerController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshChipList(arg_11_0)
	local var_11_0 = arg_11_0.chipList_
	local var_11_1 = GameSetting.ai_secondary_chip_equip_num.value[1]

	if var_11_1 < #arg_11_0.chipList_ then
		for iter_11_0 = #arg_11_0.chipList_, var_11_1 + 1, -1 do
			arg_11_0.chipList_[iter_11_0] = nil
		end
	end

	for iter_11_1, iter_11_2 in ipairs(var_11_0) do
		if iter_11_2 == nil or iter_11_2 == 0 then
			break
		end

		SetActive(arg_11_0[string.format("chipIconGo_%s", iter_11_1)], true)

		if ChipCfg[iter_11_2] == nil then
			print(string.format("ChipCfg[%s] is nil", iter_11_2))
		end

		arg_11_0[string.format("chipIcon_%s", iter_11_1)].sprite = getSpriteViaConfig("ChipSkillIcon", ChipCfg[iter_11_2].picture_id)
	end

	for iter_11_3 = #var_11_0 + 1, var_11_1 do
		SetActive(arg_11_0[string.format("chipIconGo_%s", iter_11_3)], false)
	end
end

function var_0_0.GetMimirID(arg_12_0)
	return arg_12_0.sectionProxy_:GetMimirID()
end

function var_0_0.GetMimirChipList(arg_13_0)
	return arg_13_0.sectionProxy_:GetMimirChipList()
end

function var_0_0.Show(arg_14_0, arg_14_1)
	SetActive(arg_14_0.gameObject_, arg_14_1)
end

return var_0_0
