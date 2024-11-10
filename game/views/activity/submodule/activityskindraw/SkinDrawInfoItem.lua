local var_0_0 = class("SkinDrawInfoItem", ReduxView)

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

	arg_3_0.commonItem_ = CommonItem.New(arg_3_0.commonItemGo_)

	arg_3_0.commonItem_:RegistCallBack(function(arg_4_0)
		ShowPopItem(POP_ITEM, {
			arg_3_0.id_
		})
	end)
end

function var_0_0.AddUIListeners(arg_5_0)
	return
end

function var_0_0.OnEnter(arg_6_0)
	return
end

function var_0_0.RefreshData(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.id_ = arg_7_1

	arg_7_0.commonItem_:RefreshData({
		id = arg_7_1,
		number = arg_7_2
	})
	arg_7_0.commonItem_:ShowFloor(ItemConst.ITEM_FLOOR.LONG)

	if ItemCfg[arg_7_1].type == ItemConst.ITEM_TYPE.DYNAMIC_STICKER then
		arg_7_0.commonItem_:ShowStar(false)
	else
		arg_7_0.commonItem_:ShowStar(true)
	end
end

function var_0_0.SetBottomText(arg_8_0, arg_8_1)
	arg_8_0.text_.text = arg_8_1
end

function var_0_0.OnExit(arg_9_0)
	arg_9_0.commonItem_:OnExit()
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:RemoveAllListeners()
	arg_10_0.commonItem_:Dispose()
	arg_10_0.super.Dispose(arg_10_0)
end

return var_0_0
