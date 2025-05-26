local var_0_0 = class("TetrisGameRankItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()

	arg_2_0.commonPortrait_ = CommonHeadPortrait.New(arg_2_0.headItem_)

	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.index_ = arg_4_1
	arg_4_0.data_ = arg_4_2

	arg_4_0:UpdateView()
end

function var_0_0.UpdateView(arg_5_0)
	arg_5_0.userID_ = arg_5_0.data_.id
	arg_5_0.nickText_.text = GetI18NText(arg_5_0.data_.nick)
	arg_5_0.rankText_.text = tostring(arg_5_0.index_)
	arg_5_0.scoreText_.text = arg_5_0.data_.score

	arg_5_0.commonPortrait_:RenderHead(arg_5_0.data_.portrait)
	arg_5_0.commonPortrait_:RenderFrame(arg_5_0.data_.frame)
end

function var_0_0.AddUIListener(arg_6_0)
	return
end

function var_0_0.AddEventListeners(arg_7_0)
	return
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.commonPortrait_:Dispose()
	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
