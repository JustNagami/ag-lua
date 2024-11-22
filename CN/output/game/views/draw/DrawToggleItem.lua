local var_0_0 = class("DrawToggleItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.selectController = ControllerUtil.GetController(arg_3_0.transform_, "select")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		if arg_4_0.callback_ then
			arg_4_0.callback_(arg_4_0.poolId, arg_4_0.activityId)
		end
	end)
end

function var_0_0.SetData(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.poolId = arg_6_1

	local var_6_0 = DrawData:GetPollUpID(arg_6_0.poolId)

	if DrawData:IsOnePrefabPool(arg_6_1) then
		arg_6_0.bgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Treasure/" .. 140035 .. SettingData:GetCurrentLanguageKey())
	else
		arg_6_0:RefreshBgImg(var_6_0)
	end

	arg_6_0.nameText_.text = GetI18NText(DrawPoolCfg[arg_6_0.poolId].name)

	local var_6_1 = InviteData:GetDataByPara("poolID")
	local var_6_2 = InviteData:GetDataByPara("drawItemId")

	SetActive(arg_6_0.redPointGo_, arg_6_0.poolId == var_6_1 and ItemTools.getItemNum(var_6_2) > 0)
end

function var_0_0.SetSelect(arg_7_0, arg_7_1)
	if arg_7_0.poolId == arg_7_1 then
		arg_7_0.selectController:SetSelectedIndex(1)
	else
		arg_7_0.selectController:SetSelectedIndex(0)
	end
end

function var_0_0.RefreshBgImg(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.poolId

	if DrawPoolCfg[arg_8_0.poolId].optional_lists_poolId ~= "" and #DrawPoolCfg[arg_8_0.poolId].optional_lists_poolId > 1 then
		local var_8_1 = table.indexof(DrawPoolCfg[arg_8_0.poolId].optional_lists_poolId, arg_8_1)

		if var_8_1 then
			var_8_0 = DrawPoolCfg[arg_8_0.poolId].optional_lists_poolId[var_8_1]
		else
			var_8_0 = DrawPoolCfg[arg_8_0.poolId].optional_lists_poolId[1]
		end
	end

	arg_8_0.bgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Treasure/" .. var_8_0 .. SettingData:GetCurrentLanguageKey())
end

function var_0_0.RegistCallBack(arg_9_0, arg_9_1)
	arg_9_0.callback_ = arg_9_1
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
