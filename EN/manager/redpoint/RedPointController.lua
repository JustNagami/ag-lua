local var_0_0 = {}
local var_0_1, var_0_2 = pcall(require, "bit")

if not var_0_1 then
	local var_0_3

	var_0_3, var_0_2 = pcall(require, "bit32")
end

var_0_0.dirtyFlagIndex = {
	[RedPointStyle.NORMAL] = var_0_2.lshift(1, 1),
	[RedPointStyle.SHOW_NEW_TAG] = var_0_2.lshift(1, 2)
}
var_0_0.StyleCsharpMap = {
	[RedPointStyle.None] = UIRedPointStyle.None,
	[RedPointStyle.NORMAL] = UIRedPointStyle.Normal,
	[RedPointStyle.SHOW_NEW_TAG] = UIRedPointStyle.New
}
var_0_0.StyleKeyMap = {}

function var_0_0.Init(arg_1_0)
	arg_1_0._groupTipDic = {}
	arg_1_0._parentTipDic = {}

	arg_1_0:InitData()
end

function var_0_0.InitData(arg_2_0)
	arg_2_0._tipDic = {}
	arg_2_0._UIKeyList = {}
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0._UIKeyList = {}
end

function var_0_0.GetKeyStyle(arg_4_0, arg_4_1)
	return arg_4_0.StyleKeyMap[arg_4_1] or RedPointStyle.NORMAL
end

function var_0_0.GetKeyStyleFlag(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0:GetKeyStyle(arg_5_1)

	return arg_5_0.dirtyFlagIndex[var_5_0] or 0
end

function var_0_0.ShowRed(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1.display

	if not arg_6_1.tProperty then
		local var_6_1 = {}
	end

	if var_6_0 == nil then
		print("redpoint cant find parent transform")

		return
	end

	local var_6_2 = arg_6_0:GetTipFlag(arg_6_2)

	if var_0_2.band(var_6_2, arg_6_0.dirtyFlagIndex[RedPointStyle.SHOW_NEW_TAG]) > 0 then
		arg_6_0:ChangeRedStyle(arg_6_1, RedPointStyle.SHOW_NEW_TAG, nil, arg_6_2)
	elseif var_0_2.band(var_6_2, arg_6_0.dirtyFlagIndex[RedPointStyle.NORMAL]) > 0 then
		arg_6_0:ChangeRedStyle(arg_6_1, RedPointStyle.NORMAL, nil, arg_6_2)
	else
		arg_6_0:ChangeRedStyle(arg_6_1, RedPointStyle.None, nil, arg_6_2)
	end
end

function var_0_0.PreShowRed(arg_7_0, arg_7_1, arg_7_2)
	if not arg_7_2 then
		return RedPointStyle.None
	end

	if arg_7_1.banNew and arg_7_2 == RedPointStyle.SHOW_NEW_TAG then
		return RedPointStyle.NORMAL
	end

	return arg_7_2
end

function var_0_0.ChangeRedStyle(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
	local var_8_0 = arg_8_1.display
	local var_8_1 = arg_8_1.tProperty or {}

	if isNil(var_8_0) then
		Debug.LogError("直接操作红点时出错<transform为空>,尝试显示Key\n(请检查transform为空,或者未解绑红点): " .. (arg_8_4 or "nil"))

		return
	end

	local var_8_2 = var_8_0:Find("notice_img")
	local var_8_3

	if not var_8_2 then
		local var_8_4 = Asset.Load("Widget/System/Com_dynamic/notice_img")

		if var_8_4 == nil then
			print("redpoint cant find current CommonNotice prefab")

			return
		end

		var_8_2 = Object.Instantiate(var_8_4, var_8_0)
		var_8_3 = var_8_2:GetComponent(typeof(UIRedPoint))
		var_8_2.name = "notice_img"
	else
		var_8_3 = var_8_2:GetComponent(typeof(UIRedPoint))
	end

	if var_8_3 then
		var_8_3:ShowRed(arg_8_0.StyleCsharpMap[arg_8_0:PreShowRed(var_8_1, arg_8_2)])
		var_8_3:SetDebugName(arg_8_4 or "NULL_KEY")

		local var_8_5 = var_8_1.x
		local var_8_6 = var_8_1.y
		local var_8_7 = var_8_1.scaleX
		local var_8_8 = var_8_1.scaleY

		if var_8_5 and var_8_6 then
			var_8_3:SetPosition(var_8_5, var_8_6)
		else
			if var_8_5 then
				var_8_3:SetPositionAxis(var_8_5, 1)
			end

			if var_8_6 then
				var_8_3:SetPositionAxis(var_8_6, 2)
			end
		end

		if var_8_7 and var_8_8 then
			var_8_3:SetScale(var_8_7, var_8_8)
		else
			if var_8_7 then
				var_8_3:SetScale(var_8_7, 1)
			end

			if var_8_8 then
				var_8_3:SetScale(var_8_8, 2)
			end
		end
	else
		Debug.LogError("是红点,但是没有绑定UIRePoint " .. var_8_0.name)

		if arg_8_5 then
			var_8_2.gameObject:SetActive(true)
		else
			var_8_2.gameObject:SetActive(false)
		end
	end
end

function var_0_0.SetKeyStyle(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.StyleKeyMap[arg_9_1] = arg_9_2 or RedPointStyle.NORMAL
end

function var_0_0.setTip(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_1

	if arg_10_3 and arg_10_3 ~= RedPointStyle.None and arg_10_3 ~= RedPointStyle.NORMAL then
		var_10_0 = string.format("%s_REDSTYLE_DECORATOR_%s", arg_10_1, arg_10_3)

		arg_10_0:appendToGroup(arg_10_1, var_10_0, arg_10_3)
	end

	local var_10_1 = 0

	if arg_10_2 == (arg_10_0._tipDic[var_10_0] == nil and 0 or arg_10_0._tipDic[var_10_0]) then
		return
	end

	arg_10_0._tipDic[var_10_0] = arg_10_2

	arg_10_0:updateKey(var_10_0)
end

function var_0_0.getTipValue(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0._tipDic[arg_11_1] or 0
	local var_11_1 = arg_11_0._groupTipDic[arg_11_1]

	if var_11_1 then
		for iter_11_0, iter_11_1 in pairs(var_11_1) do
			var_11_0 = var_11_0 + arg_11_0:getTipValue(iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.GetTipFlag(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._tipDic[arg_12_1] or 0
	local var_12_1 = 0

	if var_12_0 > 0 then
		var_12_1 = arg_12_0:GetKeyStyleFlag(arg_12_1)
	end

	local var_12_2 = arg_12_0._groupTipDic[arg_12_1]

	if var_12_2 then
		for iter_12_0, iter_12_1 in pairs(var_12_2) do
			var_12_1 = var_0_2.bor(var_12_1, arg_12_0:GetTipFlag(iter_12_1))
		end
	end

	return var_12_1
end

function var_0_0.getchildKeys(arg_13_0, arg_13_1)
	return arg_13_0._groupTipDic[arg_13_1]
end

function var_0_0.getTipBoolean(arg_14_0, arg_14_1)
	if arg_14_0._tipDic[arg_14_1] and arg_14_0._tipDic[arg_14_1] > 0 then
		return true
	end

	local var_14_0 = arg_14_0._groupTipDic[arg_14_1]

	if var_14_0 then
		for iter_14_0, iter_14_1 in pairs(var_14_0) do
			if arg_14_0:getTipBoolean(iter_14_1) == true then
				return true
			end
		end
	end

	return false
end

function var_0_0.addGroup(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	if arg_15_3 == nil then
		arg_15_3 = false
	end

	if arg_15_0._groupTipDic[arg_15_1] == nil then
		arg_15_0._groupTipDic[arg_15_1] = arg_15_2

		for iter_15_0, iter_15_1 in ipairs(arg_15_2) do
			arg_15_0._parentTipDic[iter_15_1] = arg_15_0._parentTipDic[iter_15_1] or {}

			table.insert(arg_15_0._parentTipDic[iter_15_1], arg_15_1)
		end
	else
		if arg_15_3 == true then
			if arg_15_2 then
				for iter_15_2, iter_15_3 in ipairs(arg_15_2) do
					arg_15_0._parentTipDic[iter_15_3] = arg_15_0._parentTipDic[iter_15_3] or {}

					if arg_15_0:IsInTable(arg_15_0._parentTipDic[iter_15_3], arg_15_1) == true then
						table.remove(arg_15_0._parentTipDic[iter_15_3], iter_15_2)
					end
				end
			end

			arg_15_0._groupTipDic[arg_15_1] = {}
		end

		local var_15_0 = arg_15_0._groupTipDic[arg_15_1]

		for iter_15_4, iter_15_5 in pairs(arg_15_2) do
			if arg_15_0:IsInTable(var_15_0, iter_15_5) == false then
				table.insert(var_15_0, iter_15_5)
			end
		end

		for iter_15_6, iter_15_7 in ipairs(arg_15_2) do
			arg_15_0._parentTipDic[iter_15_7] = arg_15_0._parentTipDic[iter_15_7] or {}

			if arg_15_0:IsInTable(arg_15_0._parentTipDic[iter_15_7], arg_15_1) == false then
				table.insert(arg_15_0._parentTipDic[iter_15_7], arg_15_1)
			end
		end
	end

	arg_15_0:updateRedPoint(arg_15_1)
end

function var_0_0.appendToGroup(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_0._groupTipDic[arg_16_1] or {}

	arg_16_0._groupTipDic[arg_16_1] = var_16_0

	if not arg_16_0:IsInTable(var_16_0, arg_16_2) then
		table.insert(var_16_0, arg_16_2)

		arg_16_0._parentTipDic[arg_16_2] = arg_16_0._parentTipDic[arg_16_2] or {}

		table.insert(arg_16_0._parentTipDic[arg_16_2], arg_16_1)

		if arg_16_3 then
			arg_16_0:SetKeyStyle(arg_16_2, arg_16_3)
		end
	end
end

function var_0_0.delGroup(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0._groupTipDic[arg_17_1] == nil then
		return
	end

	local var_17_0 = arg_17_0._groupTipDic[arg_17_1]

	for iter_17_0, iter_17_1 in pairs(arg_17_2) do
		if arg_17_0:IsInTable(var_17_0, iter_17_1) then
			table.remove(var_17_0, iter_17_0)
		end
	end

	for iter_17_2, iter_17_3 in ipairs(arg_17_2) do
		arg_17_0._parentTipDic[iter_17_3] = arg_17_0._parentTipDic[iter_17_3] or {}

		if arg_17_0:IsInTable(arg_17_0._parentTipDic[iter_17_3], arg_17_1) then
			table.remove(arg_17_0._parentTipDic[iter_17_3], iter_17_2)
		end
	end

	arg_17_0:updateRedPoint(arg_17_1)
end

function var_0_0.updateKey(arg_18_0, arg_18_1)
	arg_18_0:updateRedPoint(arg_18_1)

	local var_18_0 = arg_18_0._parentTipDic[arg_18_1] or {}

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		arg_18_0:updateKey(iter_18_1)
	end

	manager.notify:Invoke(RED_POINT_UPDATE, arg_18_1)
end

function var_0_0.updateRedPoint(arg_19_0, arg_19_1)
	if arg_19_0._UIKeyList[arg_19_1] ~= nil then
		local var_19_0 = arg_19_0._UIKeyList[arg_19_1]

		for iter_19_0, iter_19_1 in pairs(var_19_0) do
			arg_19_0:ShowRed(iter_19_1, arg_19_1)
		end
	end
end

function var_0_0.bindUIandKey(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if arg_20_1 == nil then
		Debug.LogError("红点绑定Key时出错<transform为空>: " .. arg_20_2)

		return
	end

	arg_20_0:unbindUIandKey(arg_20_1)

	local var_20_0 = {}

	if arg_20_0._UIKeyList[arg_20_2] == nil then
		table.insert(var_20_0, {
			display = arg_20_1,
			tProperty = arg_20_3
		})

		arg_20_0._UIKeyList[arg_20_2] = var_20_0
	else
		local var_20_1 = arg_20_0._UIKeyList[arg_20_2]

		table.insert(var_20_1, {
			display = arg_20_1,
			tProperty = arg_20_3
		})
	end

	arg_20_0:updateRedPoint(arg_20_2)
end

function var_0_0.unbindUIandKey(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 == nil then
		return
	end

	if arg_21_2 then
		local var_21_0 = -1
		local var_21_1 = arg_21_0._UIKeyList[arg_21_2]

		if var_21_1 then
			for iter_21_0, iter_21_1 in pairs(var_21_1) do
				if iter_21_1.display == arg_21_1 then
					var_21_0 = iter_21_0

					break
				end
			end

			if var_21_0 ~= -1 then
				arg_21_0:ShowRed(var_21_1[var_21_0], arg_21_2)
				table.remove(var_21_1, var_21_0)
			end
		else
			print("unbindUIandKey key is not exist! key = " .. arg_21_2)
		end
	else
		for iter_21_2, iter_21_3 in pairs(arg_21_0._UIKeyList) do
			local var_21_2 = -1

			for iter_21_4, iter_21_5 in pairs(iter_21_3) do
				if iter_21_5.display == arg_21_1 then
					var_21_2 = iter_21_4

					break
				end
			end

			if var_21_2 ~= -1 then
				arg_21_0:ShowRed(iter_21_3[var_21_2], arg_21_2)
				table.remove(iter_21_3, var_21_2)

				break
			end
		end
	end
end

function var_0_0.IsInTable(arg_22_0, arg_22_1, arg_22_2)
	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		if iter_22_1 == arg_22_2 then
			return true, iter_22_0
		end
	end

	return false
end

function var_0_0.GetRedGraphWithKey(arg_23_0, arg_23_1)
	if not arg_23_1 then
		return
	end

	local var_23_0 = {}

	arg_23_0:FindRedRoot(arg_23_1, var_23_0)

	local var_23_1 = var_23_0[1] or arg_23_1
	local var_23_2 = {}
	local var_23_3 = {}
	local var_23_4 = {}

	arg_23_0:GetKeyGraph(var_23_1, {
		keysList = var_23_2,
		keysVis = var_23_4
	})

	local var_23_5 = #var_23_2

	for iter_23_0 = 1, var_23_5 do
		table.insert(var_23_3, {})
	end

	for iter_23_1, iter_23_2 in ipairs(var_23_2) do
		local var_23_6 = arg_23_0._groupTipDic[iter_23_2.key]

		if var_23_6 then
			for iter_23_3, iter_23_4 in pairs(var_23_6) do
				table.insert(var_23_3[var_23_4[iter_23_2.key]], var_23_4[iter_23_4] - 1)
			end
		end
	end

	Debug.LogError("keysGraph如下: " .. table.toString(var_23_3))
	Debug.LogError("所有的Keys: " .. table.toString(var_23_2))

	return {
		rootIdx = 0,
		status = true,
		edges = var_23_3,
		nodes = var_23_2,
		selectNode = var_23_4[arg_23_1] - 1
	}
end

function var_0_0.FindRedRoot(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_1
	local var_24_1 = arg_24_0._parentTipDic[arg_24_1]

	if not var_24_1 or #var_24_1 == 0 then
		arg_24_2[arg_24_1] = true
	else
		for iter_24_0, iter_24_1 in ipairs(arg_24_0._parentTipDic[arg_24_1]) do
			arg_24_0:FindRedRoot(iter_24_1, arg_24_2)
		end
	end
end

function var_0_0.GetKeyGraph(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_2.keysVis[arg_25_1] then
		table.insert(arg_25_2.keysList, {
			key = tostring(arg_25_1),
			value = arg_25_0:getTipValue(arg_25_1)
		})

		arg_25_2.keysVis[arg_25_1] = #arg_25_2.keysList

		local var_25_0 = arg_25_0._groupTipDic[arg_25_1]

		if var_25_0 then
			for iter_25_0, iter_25_1 in pairs(var_25_0) do
				arg_25_0:GetKeyGraph(iter_25_1, arg_25_2)
			end
		end
	end
end

function var_0_0.GetAllKey(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0._groupTipDic) do
		table.insert(var_26_0, iter_26_0)
	end

	return var_26_0
end

return var_0_0
