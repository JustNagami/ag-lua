local var_0_0 = singletonClass("ActivityHeroEnhanceData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}

function var_0_0.Init(arg_1_0)
	var_0_2 = {}
	read_list = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	var_0_1[var_2_0] = arg_2_1.day
	var_0_2[var_2_0] = arg_2_1.mission_list
	var_0_3[var_2_0] = arg_2_1.talent_list

	manager.notify:CallUpdateFunc("OnActivityHeroEnhanceDataInit")
end

local function var_0_4(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if ActivityHeroEnhanceTools.IsTalentLock(arg_3_0, iter_3_1) then
			table.removebyvalue(var_0_3[arg_3_0], iter_3_1)
		end
	end
end

function var_0_0.ActivateTalent(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_3[arg_4_1]

	if table.keyof(var_4_0, arg_4_2) then
		return
	end

	local var_4_1 = ActivityHeroEnhanceTools.GetCfgByTalentId(arg_4_1, arg_4_2)
	local var_4_2 = TalentTreeCfg[arg_4_2]
	local var_4_3 = ActivityHeroEnhanceTools.GetCfgTalentListByStage(var_4_1, var_4_2.stage)

	for iter_4_0, iter_4_1 in ipairs(var_4_3) do
		table.removebyvalue(var_4_0, iter_4_1)
	end

	table.insert(var_4_0, arg_4_2)
	var_0_4(arg_4_1, var_4_1.talent_list)
end

function var_0_0.DeactivateTalent(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = var_0_3[arg_5_1]

	if var_5_0 == nil then
		return
	end

	table.removebyvalue(var_5_0, arg_5_2)

	local var_5_1 = ActivityHeroEnhanceTools.GetCfgByTalentId(arg_5_1, arg_5_2)

	var_0_4(arg_5_1, var_5_1.talent_list)
end

function var_0_0.AddClearedStage(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = var_0_2[arg_6_1]

	if table.indexof(var_6_0, arg_6_2) then
		return
	end

	table.insert(var_6_0, arg_6_2)
end

function var_0_0.IsTalentActivated(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = var_0_3[arg_7_1]

	if var_7_0 == nil then
		return false
	end

	return table.indexof(var_7_0, arg_7_2) ~= false
end

function var_0_0.IsStageClear(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_2[arg_8_1]

	if var_8_0 == nil then
		return false
	end

	return table.indexof(var_8_0, arg_8_2) ~= false
end

function var_0_0.GetDay(arg_9_0, arg_9_1)
	return var_0_1[arg_9_1] or -1
end

return var_0_0
