local var_0_0 = singletonClass("XH3rdFlipCardData")

function var_0_0.OnReceiveFlipCardData(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.activity_id
	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.clue_list) do
		table.insert(var_1_1, {
			clue_id = iter_1_1.clue_id,
			is_viewed = iter_1_1.is_viewed
		})
	end

	var_0_0.data = {
		activity_id = var_1_0,
		clue_list = var_1_1
	}

	XH3rdFlipCardAction.UpdateClueRedPoint()
end

function var_0_0.UpdateClueData(arg_2_0, arg_2_1)
	local var_2_0 = true

	for iter_2_0, iter_2_1 in ipairs(var_0_0.data.clue_list) do
		if iter_2_1.clue_id == arg_2_1 then
			iter_2_1.is_viewed = true
			var_2_0 = false

			break
		end
	end

	if var_2_0 then
		table.insert(var_0_0.data.clue_list, {
			is_viewed = false,
			clue_id = arg_2_1
		})
	end

	XH3rdFlipCardAction.UpdateClueRedPoint()
end

function var_0_0.CheckClueIsGetted(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(var_0_0.data.clue_list) do
		if iter_3_1.clue_id == arg_3_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetActivityID(arg_4_0)
	return arg_4_0.data.activity_id
end

function var_0_0.CheckClueIsViewed(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(var_0_0.data.clue_list) do
		if iter_5_1.clue_id == arg_5_1 then
			return iter_5_1.is_viewed
		end
	end

	return false
end

function var_0_0.GetClueList(arg_6_0, arg_6_1)
	if var_0_0.data and var_0_0.data.activity_id == arg_6_1 then
		return var_0_0.data.clue_list
	end

	return {}
end

return var_0_0
