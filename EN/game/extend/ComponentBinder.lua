local var_0_0 = singletonClass("ComponentBinder")

function var_0_0.InjectImage(arg_1_0, arg_1_1, arg_1_2)
	return ImageWrap.New(arg_1_1, arg_1_2):GetWrapper()
end

function var_0_0.BindCfgUI(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2:GetComponent("ComponentCfger")

	if var_2_0 then
		local var_2_1 = var_2_0.componentList
		local var_2_2 = var_2_0:GetLuaNames()
		local var_2_3 = var_2_0:GetComponentValues()
		local var_2_4 = var_2_0.componentList

		for iter_2_0 = 0, var_2_2.Length - 1 do
			local var_2_5 = var_2_2[iter_2_0]
			local var_2_6 = var_2_3[iter_2_0]

			arg_2_1[var_2_5] = arg_2_0:Extend(var_2_6, var_2_4[iter_2_0], arg_2_1)
		end

		arg_2_1.guideComponents = {}

		local var_2_7 = var_2_0:GetGuideLuaNames()
		local var_2_8 = var_2_0:GetGuideComponentValues()

		for iter_2_1 = 0, var_2_7.Length - 1 do
			local var_2_9 = var_2_7[iter_2_1]
			local var_2_10 = var_2_8[iter_2_1]

			arg_2_1.guideComponents[var_2_9] = var_2_10
		end
	end
end

function var_0_0.Extend(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_2.type

	if var_3_0 == ComponentCfger.UIComponentType.Text then
		if arg_3_2.go:GetComponent("I18NTextKeyToValue") then
			return I18NExtendText.Extend(arg_3_1)
		else
			return arg_3_1
		end
	elseif var_3_0 == ComponentCfger.UIComponentType.Image or var_3_0 == ComponentCfger.UIComponentType.RawImage or var_3_0 == ComponentCfger.UIComponentType.SelfAdaptImage then
		return arg_3_0:InjectImage(arg_3_1, arg_3_3)
	end

	return arg_3_1
end

return var_0_0
