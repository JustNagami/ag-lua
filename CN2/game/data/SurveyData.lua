local var_0_0 = singletonClass("SurveyData")
local var_0_1 = {}
local var_0_2 = false
local var_0_3 = 0
local var_0_4 = false
local var_0_5

function var_0_0.InitData(arg_1_0, arg_1_1)
	var_0_1 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.survey_list) do
		local var_1_0 = {
			id = iter_1_1.id,
			question_num = iter_1_1.question_num,
			url = iter_1_1.url,
			name = iter_1_1.name,
			type = iter_1_1.type,
			start_time = iter_1_1.start_time,
			stop_time = iter_1_1.stop_time,
			attachment_list = {},
			status = iter_1_1.status
		}

		for iter_1_2, iter_1_3 in ipairs(iter_1_1.attachment_list) do
			table.insert(var_1_0.attachment_list, {
				id = iter_1_3.id,
				num = iter_1_3.num
			})
		end

		var_0_1[iter_1_1.id] = var_1_0
	end

	print(var_0_1)

	var_0_2 = false
end

function var_0_0.FinishSurvey(arg_2_0, arg_2_1)
	if var_0_1[arg_2_1] then
		var_0_1[arg_2_1].status = 1
	end
end

function var_0_0.GotReward(arg_3_0, arg_3_1)
	var_0_1[arg_3_1].status = 2
end

function var_0_0.GetSurveyList(arg_4_0)
	return var_0_1
end

function var_0_0.ReservationGame(arg_5_0, arg_5_1)
	var_0_4 = arg_5_1
end

function var_0_0.IsReservation(arg_6_0)
	return var_0_4
end

function var_0_0.GetPraise(arg_7_0)
	return var_0_2
end

function var_0_0.GetSourceId(arg_8_0)
	return var_0_3
end

function var_0_0.SetSourceId(arg_9_0, arg_9_1)
	var_0_3 = arg_9_1
end

function var_0_0.SetPraise(arg_10_0, arg_10_1)
	var_0_2 = arg_10_1
end

function var_0_0.CacheFollowTip(arg_11_0, arg_11_1)
	var_0_5 = arg_11_1
end

function var_0_0.GetCacheFollowTip(arg_12_0)
	local var_12_0 = var_0_5

	var_0_5 = nil

	return var_12_0
end

return var_0_0
