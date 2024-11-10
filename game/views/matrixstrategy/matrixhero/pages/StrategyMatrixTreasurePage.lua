local var_0_0 = class("StrategyMatrixTreasurePage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.handler_ = arg_1_1
	arg_1_0.gameObject_ = arg_1_2
	arg_1_0.transform_ = arg_1_2.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.list_ = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.m_list, MatrixTreasureAtlasItem)
end

function var_0_0.SetMatirxHeroInfo(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.matrix_activity_id = arg_4_1
	arg_4_0.data = arg_4_0:GetArtifactList()

	table.sort(arg_4_0.data, function(arg_5_0, arg_5_1)
		local var_5_0 = MatrixItemCfg[arg_5_0.id]
		local var_5_1 = MatrixItemCfg[arg_5_1.id]

		if var_5_0.rare ~= var_5_1.rare then
			return var_5_0.rare > var_5_1.rare
		end

		return arg_5_0.id < arg_5_1.id
	end)

	local var_4_0 = #arg_4_0.data

	arg_4_0.list_:StartScroll(var_4_0)
end

function var_0_0.indexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.data[arg_6_1].id
	local var_6_1 = arg_6_0.data[arg_6_1].wins

	arg_6_2:Refresh(var_6_0, var_6_1)
end

function var_0_0.Hide(arg_7_0)
	SetActive(arg_7_0.gameObject_, false)
end

function var_0_0.Show(arg_8_0)
	SetActive(arg_8_0.gameObject_, true)
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:RemoveAllListeners()

	arg_9_0.handler_ = nil

	arg_9_0.list_:Dispose()
	var_0_0.super.Dispose(arg_9_0)
end

function var_0_0.GetArtifactList(arg_10_0)
	return StrategyMatrixData:GetArtifactList(arg_10_0.matrix_activity_id)
end

return var_0_0
