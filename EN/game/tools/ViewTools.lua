local var_0_0 = {}
local var_0_1 = import("game.const.ViewConst")

function var_0_0.PreDealWithAsset(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {}
	local var_1_1 = #arg_1_1

	if var_1_1 > 0 then
		for iter_1_0 = var_1_1, arg_1_2 + 1, -1 do
			if arg_1_3 and ViewCfg[arg_1_1[iter_1_0]] and not var_0_1.IGNORE_UNLOAD[arg_1_1[iter_1_0]] then
				table.insert(var_1_0, arg_1_1[iter_1_0])
			end
		end

		var_0_0.PreUnLoadAsset(var_1_0)
	end

	local var_1_2 = {}

	for iter_1_1 = arg_1_2 + 1, #arg_1_0 do
		if arg_1_3 and ViewCfg[arg_1_0[iter_1_1]] then
			table.insert(var_1_2, arg_1_0[iter_1_1])
		end
	end

	var_0_0.PreLoadAsset(var_1_2)
end

var_0_0.isLoading = false

function var_0_0.GetIsLoadied()
	return not var_0_0.isLoading
end

function var_0_0.PreLoadAsset(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = false

	for iter_3_0 = 1, #arg_3_0 do
		local var_3_2 = ViewCfg[arg_3_0[iter_3_0]]

		for iter_3_1 = 1, #var_3_2.need_atlas do
			var_3_0[var_3_2.need_atlas[iter_3_1]] = 20
			var_3_1 = true
		end
	end

	if var_3_1 then
		var_0_0.isLoading = true

		PreLoadAsset(var_3_0, 0, function()
			for iter_4_0, iter_4_1 in pairs(var_3_0) do
				LuaForUtil.PreLoadAtlas(iter_4_0)
			end

			var_0_0.isLoading = false
		end, true)
	end
end

function var_0_0.PreUnLoadAsset(arg_5_0)
	local var_5_0 = {}

	for iter_5_0 = 1, #arg_5_0 do
		local var_5_1 = ViewCfg[arg_5_0[iter_5_0]]

		for iter_5_1 = 1, #var_5_1.need_atlas do
			if not table.keyof(var_5_0, var_5_1.need_atlas[iter_5_1]) then
				table.insert(var_5_0, var_5_1.need_atlas[iter_5_1])
			end
		end
	end

	for iter_5_2 = 1, #var_5_0 do
		Asset.Unload(var_5_0[iter_5_2])
	end
end

local var_0_2 = {
	"blank",
	"settlement",
	"battlefailed",
	"battleBossChallengeResult",
	"battleMultipleResult",
	"battleChapterResult"
}

function var_0_0.GetIsSkipRecord(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(var_0_2) do
		if table.indexof(arg_6_0, iter_6_1) then
			return true
		end
	end

	return false
end

return var_0_0
