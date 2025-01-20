﻿local var_0_0 = {}

manager.net:Bind(86033, function(arg_1_0)
	var_0_0.InitIlluData(arg_1_0)
end)

function var_0_0.InitIlluData(arg_2_0)
	SandplayIlluData:InitData(arg_2_0)
	var_0_0.UpdateRedPoint()
end

function var_0_0.ViewItem(arg_3_0)
	local var_3_0 = {
		activity_id = SandplayIlluData:GetActivityID(),
		id = arg_3_0
	}

	manager.net:SendWithLoadingNew(86028, var_3_0, 86029, var_0_0.OnViewItem)
end

function var_0_0.OnViewItem(arg_4_0, arg_4_1)
	if isSuccess(arg_4_0.result) then
		SandplayIlluData:UpdateItemDataSaw(arg_4_1.id, true)
		manager.notify:CallUpdateFunc(SANDPLAY_ILLU_MODIFYITEM)
	else
		ShowTips(GetTips(arg_4_0.result))
	end
end

function var_0_0.GetReward(arg_5_0)
	local var_5_0 = {
		activity_id = SandplayIlluData:GetActivityID(),
		id = arg_5_0
	}

	manager.net:SendWithLoadingNew(86030, var_5_0, 86031, var_0_0.OnGetReward)
end

function var_0_0.OnGetReward(arg_6_0, arg_6_1)
	if isSuccess(arg_6_0.result) then
		getReward(arg_6_0.item_list, nil, function()
			SandplayIlluData:UpdateItemDataReward(arg_6_1.id, true)
			var_0_0.UpdateRedPoint()
			manager.notify:CallUpdateFunc(SANDPLAY_ILLU_MODIFYITEM)
		end)
	else
		ShowTips(GetTips(arg_6_0.result))
	end
end

function var_0_0.ModifyMainQuestID(arg_8_0)
	SandplayIlluData:ModifyMainQuestID(arg_8_0)
	manager.notify:CallUpdateFunc(SANDPLAY_ILLU_MODIFYITEM, true)
	var_0_0.UpdateRedPoint()
end

function var_0_0.UpdateRedPoint()
	local var_9_0, var_9_1 = SandplayIlluData:GetAwardID()

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_2 = string.format("%s_%s", RedPointConst.ACTIVITY_SANDPLAY_ILLU_ITEM, tostring(iter_9_1))

		manager.redPoint:setTip(var_9_2, 1)
	end

	for iter_9_2, iter_9_3 in ipairs(var_9_1) do
		local var_9_3 = string.format("%s_%s", RedPointConst.ACTIVITY_SANDPLAY_ILLU_ITEM, tostring(iter_9_3))

		manager.redPoint:setTip(var_9_3, 0)
	end
end

return var_0_0
