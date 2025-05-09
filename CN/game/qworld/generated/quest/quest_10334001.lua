﻿local var_0_0 = {
	OnQuestUnmeet = function(arg_1_0)
		_GRAPH_API.ThingCreate(100019)
		_GRAPH_API.ThingCreate(100020)
	end,
	OnClickBubble_100019 = function(arg_2_0)
		_GRAPH_API.QuestSetFinish(arg_2_0.questId_, arg_2_0.questId_)
	end
}

var_0_0.OnClickBubble = var_0_0.OnClickBubble or {}

table.insert(var_0_0.OnClickBubble, 100019)

var_0_0.OnClickBubbleWhen = var_0_0.OnClickBubbleWhen or {}
var_0_0.OnClickBubbleWhen[100019] = 1

function var_0_0.OnQuestFinish(arg_3_0)
	_GRAPH_API.ThingDestroy(100019)
	_GRAPH_API.ThingDestroy(100020)
	_GRAPH_API.ThingCreate(100032)
	_GRAPH_API.Delay(1.5, function()
		_GRAPH_API.ThingDestroy(100032)
	end)
end

return var_0_0
