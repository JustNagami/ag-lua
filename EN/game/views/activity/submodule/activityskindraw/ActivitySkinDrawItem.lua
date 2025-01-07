local var_0_0 = class("ActivitySkinDrawItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.getCon_ = arg_3_0.controllerEx_:GetController("get")
	arg_3_0.timeCon_ = arg_3_0.controllerEx_:GetController("time")
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		ShowPopItem(POP_ITEM, {
			arg_4_0.itemId_
		})
	end)
end

function var_0_0.OnEnter(arg_6_0)
	return
end

function var_0_0.RefreshData(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.itemId_ = arg_7_1.itemId
	arg_7_0.count = arg_7_1.count

	arg_7_0.getCon_:SetSelectedState(tostring(arg_7_0.count <= 0))

	if arg_7_2 then
		if ItemCfg[arg_7_0.itemId_].type == ItemConst.ITEM_TYPE.HERO_SKIN then
			arg_7_0.imgReward_.sprite = getSprite("Atlas/T0_109502Atlas", "T0_109502_01212_6")
		else
			arg_7_0.imgReward_.sprite = ItemTools.getItemSprite(arg_7_0.itemId_)
		end
	else
		arg_7_0.timeCon_:SetSelectedState(HomeSceneSettingCfg[arg_7_0.itemId_].action_suffix)
	end
end

function var_0_0.Hide(arg_8_0)
	SetActive(arg_8_0.gameObject_, false)
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:RemoveAllListeners()
	arg_9_0.super.Dispose(arg_9_0)
end

return var_0_0
