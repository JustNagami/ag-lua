local var_0_0 = {}
local var_0_1 = import("game.const.SettingConst")

function var_0_0.GetDefaultScreenSize()
	local var_1_0 = _G.SCREEN_WIDTH / var_0_1.DESIGN_WIDTH
	local var_1_1 = _G.SCREEN_HEIGHT / var_0_1.DESIGN_HEIGHT

	if var_1_0 > 1 or var_1_1 > 1 then
		local var_1_2 = math.max(var_1_0, var_1_1)

		return math.floor(_G.SCREEN_WIDTH / var_1_2), math.floor(_G.SCREEN_HEIGHT / var_1_2)
	else
		return _G.SCREEN_WIDTH, _G.SCREEN_HEIGHT
	end
end

function var_0_0.GetSettingScreenSize(arg_2_0)
	local var_2_0 = _G.SCREEN_WIDTH
	local var_2_1 = _G.SCREEN_HEIGHT

	if GameToSDK.PLATFORM_ID == 0 then
		local var_2_2 = 3000000
		local var_2_3 = var_2_0 * var_2_1

		if var_2_2 < var_2_3 then
			local var_2_4 = math.sqrt(var_2_2 / var_2_3)

			var_2_1 = math.floor(var_2_1 * var_2_4)
			var_2_0 = math.floor(var_2_0 * var_2_4)

			print(var_2_4)
		end
	end

	local var_2_5 = 1

	if arg_2_0 == 1 then
		var_2_5 = 0.5
	elseif arg_2_0 == 2 then
		var_2_5 = 0.75
	end

	if GameToSDK.PLATFORM_ID == 1 then
		var_2_5 = var_2_5 == 0.5 and 0.75 or 1
	end

	return var_2_0 * var_2_5, var_2_1 * var_2_5
end

return var_0_0
