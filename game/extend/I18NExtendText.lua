return {
	Extend = function(arg_1_0)
		local var_1_0 = arg_1_0.gameObject:GetComponent("I18NTextKeyToValue")

		if not var_1_0 then
			return arg_1_0
		end

		local var_1_1 = {}

		tolua.setpeer(arg_1_0, var_1_1)

		var_1_1.__index = var_1_1
		tolua.initset(var_1_1).text = function(arg_2_0, arg_2_1)
			var_1_0:RefreshText(arg_2_1, true)
		end

		return arg_1_0
	end
}
