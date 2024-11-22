local var_0_0 = class("AdminCatExploreEventView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.data = arg_4_1
	arg_4_0.adminCatID = arg_4_2
	arg_4_0.startTime = arg_4_3

	arg_4_0:UpdateView()
end

function var_0_0.UpdateView(arg_5_0)
	local var_5_0 = ExploringEventCfg[arg_5_0.data.content]
	local var_5_1 = ExploringEventCfg[arg_5_0.data.address]
	local var_5_2 = ExploreMeowCfg[arg_5_0.adminCatID]

	arg_5_0.timeTxt_.text = manager.time:DescCDTime(arg_5_0.data.time)

	local var_5_3 = (GetI18NText(var_5_2.meow_name) .. GetI18NText(var_5_1.description)) .. GetI18NText(var_5_0.description)

	if var_5_0.event_type == 3 then
		var_5_3 = var_5_3 .. "\n" .. GetTips("EXPLORE_PROCESS_EVENT_REWARD")

		for iter_5_0, iter_5_1 in ipairs(var_5_0.reward) do
			var_5_3 = var_5_3 .. "<color=#CFB9FB>" .. ItemTools.getItemName(iter_5_1[1]) .. " x " .. iter_5_1[2] .. "</color>  "
		end
	end

	arg_5_0.contentTxt_.text = var_5_3
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:UpdateView()
end

function var_0_0.OnExit(arg_7_0)
	return
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)
	Object.Destroy(arg_8_0.gameObject_)
end

return var_0_0
