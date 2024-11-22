local var_0_0 = class("GameHelpProItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.showTextureController_ = arg_2_0.m_controller:GetController("showTexture")
end

function var_0_0.SetData(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_0.curPath_ == arg_3_2 then
		return
	end

	arg_3_0.curPath_ = arg_3_2

	arg_3_0:DestroyGo()

	if arg_3_3 then
		arg_3_0.showTextureController_:SetSelectedState("false")

		arg_3_0.prefabGo_ = Object.Instantiate(Asset.Load(arg_3_2), arg_3_0.transform_)
	else
		arg_3_0.showTextureController_:SetSelectedState("true")
		getSpriteWithoutAtlasAsync(arg_3_2, function(arg_4_0)
			arg_3_0.m_icon.sprite = arg_4_0
		end)
	end
end

function var_0_0.DestroyGo(arg_5_0)
	if arg_5_0.prefabGo_ then
		Object.Destroy(arg_5_0.prefabGo_)

		arg_5_0.prefabGo_ = nil
	end
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)
	arg_6_0:DestroyGo()
end

return var_0_0
