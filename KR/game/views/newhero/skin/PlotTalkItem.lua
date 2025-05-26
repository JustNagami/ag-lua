local var_0_0 = class("PlotTalkItem", ReduxView)

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
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.talkBtn_, nil, function()
		manager.story:StartStoryById(arg_4_0.storyId_, function()
			manager.ui:SetMainCamera("heroSkin")
		end)

		if arg_4_0.callBack_ then
			arg_4_0.callBack_()
		end
	end)
end

function var_0_0.SetCallBack(arg_7_0, arg_7_1)
	arg_7_0.callBack_ = arg_7_1
end

function var_0_0.OnEnter(arg_8_0)
	return
end

function var_0_0.RefreshUI(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.titleText_.text = arg_9_1
	arg_9_0.storyId_ = arg_9_2
end

function var_0_0.Show(arg_10_0, arg_10_1)
	SetActive(arg_10_0.gameObject_, arg_10_1)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_10_0.descRect_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_10_0.rect_)
end

function var_0_0.OnExit(arg_11_0)
	return
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
