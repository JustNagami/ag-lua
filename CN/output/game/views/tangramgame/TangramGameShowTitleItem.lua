﻿local var_0_0 = class("TangramGameShowTitleItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1.gameObject
	arg_1_0.transform_ = arg_1_1

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
end

function var_0_0.RefreshUI(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.numerText_.text = arg_3_2
	arg_3_0.name1Text_.text = ActivityTangramGameStageCfg[arg_3_1].name
	arg_3_0.name2Text_.text = ActivityTangramGameStageCfg[arg_3_1].name
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
end

return var_0_0