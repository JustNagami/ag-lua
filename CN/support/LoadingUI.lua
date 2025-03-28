local var_0_0 = {}
local var_0_1 = {}
local var_0_2 = {}

function var_0_0.LoadingShow(arg_1_0, arg_1_1)
	if LoadingUIType.GameStart == arg_1_1 then
		LoadingUIManager.inst:UpdateLoadingInfo("", "", nil)
	else
		var_0_0:ChooseRandom()
	end
end

function var_0_0.ChooseRandom(arg_2_0)
	local var_2_0, var_2_1, var_2_2, var_2_3 = var_0_0:GetRandomTips()

	if var_2_3 then
		LoadingUIManager.inst:UpdateLoadingInfo(var_2_0, var_2_1, var_2_2)
	else
		LoadingUIManager.inst:UpdateLoadingInfo2(var_2_0, var_2_1, var_2_2)
	end
end

function var_0_0.ResetLoading(arg_3_0)
	var_0_1 = deepClone(LoadingTipsPoolCfg.all)
	var_0_2 = deepClone(IllustratedData:GetAllLoadingSet())
end

function var_0_0.GetRandomTips(arg_4_0)
	if #var_0_1 <= 0 and #var_0_2 <= 0 then
		var_0_0.ResetLoading()
	end

	local var_4_0 = #var_0_2

	if var_4_0 > 0 then
		local var_4_1 = math.random(1, var_4_0)
		local var_4_2 = var_0_2[var_4_1]
		local var_4_3 = CollectPictureCfg[var_4_2]

		if var_4_0 == 1 then
			var_0_2 = deepClone(IllustratedData:GetAllLoadingSet())
		else
			table.remove(var_0_2, var_4_1)
		end

		local var_4_4 = var_4_3.type == 5 and true or false

		return var_4_3.name, var_4_3.desc, var_4_3.picture, var_4_4
	end

	local var_4_5 = #var_0_1
	local var_4_6 = math.random(1, var_4_5)
	local var_4_7 = var_0_1[var_4_6]
	local var_4_8 = LoadingTipsPoolCfg[var_4_7]

	if var_4_5 == 1 then
		var_0_1 = deepClone(LoadingTipsPoolCfg.all)
	else
		table.remove(var_0_1, var_4_6)
	end

	return var_4_8.title, var_4_8.tips, var_4_8.loading_picture, true
end

LoadingUIManager.inst:SetLoadingShowAction(handler(var_0_0, var_0_0.LoadingShow))

return var_0_0
