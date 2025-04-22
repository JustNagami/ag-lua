local var_0_0 = {}
local var_0_1 = 99
local var_0_2 = GameDisplayCfg.activity_celebration_grid_max_length.value[1]
local var_0_3 = GameDisplayCfg.activity_celebration_box_speed and GameDisplayCfg.activity_celebration_box_speed.value[1] or 0.5
local var_0_4 = 0
local var_0_5 = 0

function var_0_0.GetTaskActivityID(arg_1_0)
	local var_1_0 = ActivityCfg[arg_1_0].sub_activity_list

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if ActivityCfg[iter_1_1].activity_template == ActivityTemplateConst.TASK then
			return iter_1_1
		end
	end

	Debug.LogError("ActuvutyPushBoxTools.GetTaskActivityID() failed to find task activity id")

	return nil
end

function var_0_0.GetFatigueID(arg_2_0, arg_2_1)
	local var_2_0 = GameSetting.activity_fatigue_info.value

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		if iter_2_1[1] == arg_2_1 then
			return iter_2_1[2]
		end
	end
end

function var_0_0.GetFatigueMax(arg_3_0, arg_3_1)
	local var_3_0 = 0
	local var_3_1 = GameSetting.activity_celebration_cake_fatigue_default.value

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		if iter_3_1[1] == arg_3_1 then
			var_3_0 = iter_3_1[2]

			break
		end
	end

	return var_3_0
end

function var_0_0.SetStartTime(arg_4_0)
	var_0_4 = manager.time:GetServerTime()
end

function var_0_0.SendSdk(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	var_0_5 = manager.time:GetServerTime()

	local var_5_0 = var_0_5 - var_0_4
	local var_5_1 = {
		activity_id = arg_5_1,
		stage_id = arg_5_2,
		result = arg_5_3,
		use_seconds = var_5_0
	}

	SDKTools.SendMessageToSDK("activity_combat_over", var_5_1)
end

function var_0_0.Init(arg_6_0)
	if arg_6_0.isInit_ then
		return
	end

	arg_6_0.isInit_ = true
	arg_6_0.boxItem_ = {}
	arg_6_0.cellItem_ = {}
	arg_6_0.mapSize_ = 1
	arg_6_0.mapWidth_ = 1
	arg_6_0.mapHeight_ = 1
	arg_6_0.cellWidth_ = 1
	arg_6_0.actionCnt_ = 0
	arg_6_0.routhMap_ = {}
	arg_6_0.dirMap_ = {}
	arg_6_0.tween_ = nil
	arg_6_0.goalTbl_ = {}
end

function var_0_0.InitMap(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6)
	arg_7_0:Init()

	local var_7_0 = ActivityCelebrationGameCfg[arg_7_1]

	arg_7_0.mapWidth_ = var_7_0.width
	arg_7_0.mapHeight_ = var_7_0.height
	arg_7_0.mapSize_ = arg_7_0.mapWidth_ * arg_7_0.mapHeight_

	local var_7_1 = arg_7_4.rect.width
	local var_7_2 = arg_7_4.rect.height
	local var_7_3 = var_7_1 / arg_7_0.mapWidth_
	local var_7_4 = var_7_2 / arg_7_0.mapHeight_

	arg_7_0.cellWidth_ = var_7_3 < var_7_4 and var_7_3 or var_7_4
	arg_7_0.cellWidth_ = arg_7_0.cellWidth_ > var_0_2 and var_0_2 or arg_7_0.cellWidth_
	arg_7_2:GetComponent("GridLayoutGroup").cellSize = Vector2.New(arg_7_0.cellWidth_, arg_7_0.cellWidth_)
	arg_7_2.sizeDelta = Vector2.New(arg_7_0.mapWidth_ * arg_7_0.cellWidth_, arg_7_0.mapHeight_ * arg_7_0.cellWidth_)
	arg_7_3.sizeDelta = Vector2.New(arg_7_0.mapWidth_ * arg_7_0.cellWidth_, arg_7_0.mapHeight_ * arg_7_0.cellWidth_)

	local var_7_5 = {}
	local var_7_6 = ActivityCelebrationBoxCfg.get_id_list_by_mapId[var_7_0.mapId]

	for iter_7_0, iter_7_1 in ipairs(var_7_6) do
		local var_7_7 = ActivityCelebrationBoxCfg[iter_7_1]
		local var_7_8 = var_7_7.x + (var_7_7.y - 1) * arg_7_0.mapWidth_

		table.insert(var_7_5, {
			var_7_8,
			var_7_7.type
		})
	end

	table.sort(var_7_5, function(arg_8_0, arg_8_1)
		return arg_8_0[1] < arg_8_1[1]
	end)

	arg_7_0.goalTbl_ = {}

	local var_7_9 = 1
	local var_7_10 = arg_7_0.mapWidth_ * arg_7_0.mapHeight_

	for iter_7_2 = 1, var_7_10 do
		if not arg_7_0.cellItem_[iter_7_2] then
			local var_7_11 = Object.Instantiate(arg_7_5, arg_7_2)

			arg_7_0.cellItem_[iter_7_2] = PushBoxCellItem.New(var_7_11)
		end

		local var_7_12 = iter_7_2 % arg_7_0.mapWidth_ == 0 and arg_7_0.mapWidth_ or iter_7_2 % arg_7_0.mapWidth_
		local var_7_13 = iter_7_2 % arg_7_0.mapWidth_ == 0 and iter_7_2 / arg_7_0.mapWidth_ or math.floor(iter_7_2 / arg_7_0.mapWidth_) + 1
		local var_7_14 = PushBoxConst.CELL_TYPE.NORMAL

		if var_7_5[var_7_9] and var_7_5[var_7_9][1] == iter_7_2 then
			var_7_14 = var_7_5[var_7_9][2]
			var_7_9 = var_7_9 + 1
		end

		if var_7_14 == PushBoxConst.CELL_TYPE.GOAL then
			table.insert(arg_7_0.goalTbl_, iter_7_2)
		end

		arg_7_0.cellItem_[iter_7_2]:SetData(var_7_12, var_7_13, var_7_14)
		SetActive(arg_7_0.cellItem_[iter_7_2].gameObject_, true)
	end

	for iter_7_3 = var_7_10 + 1, #arg_7_0.cellItem_ do
		SetActive(arg_7_0.cellItem_[iter_7_3].gameObject_, false)
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_2)

	local var_7_15 = var_7_0.box_list

	for iter_7_4, iter_7_5 in ipairs(var_7_15) do
		if not arg_7_0.boxItem_[iter_7_4] then
			local var_7_16 = Object.Instantiate(arg_7_6, arg_7_3)

			arg_7_0.boxItem_[iter_7_4] = PushBoxItem.New(var_7_16)
		end

		arg_7_0.boxItem_[iter_7_4]:SetSize(arg_7_0.cellWidth_)

		local var_7_17 = iter_7_5[1]
		local var_7_18 = iter_7_5[2]

		arg_7_0:SyncBoxPosition(iter_7_4, var_7_17, var_7_18)
		arg_7_0.boxItem_[iter_7_4]:SetData(iter_7_4)
		SetActive(arg_7_0.boxItem_[iter_7_4].gameObject_, true)
	end

	for iter_7_6 = #var_7_15 + 1, #arg_7_0.boxItem_ do
		SetActive(arg_7_0.boxItem_[iter_7_6].gameObject_, false)
	end

	return arg_7_0.boxItem_, arg_7_0.cellItem_, arg_7_0.goalTbl_
end

function var_0_0.GetCellIndex(arg_9_0, arg_9_1, arg_9_2)
	return arg_9_0.mapWidth_ * (arg_9_2 - 1) + arg_9_1
end

function var_0_0.SyncBoxPosition(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0:GetCellIndex(arg_10_2, arg_10_3)
	local var_10_1, var_10_2 = arg_10_0.cellItem_[var_10_0]:GetLoaclPosition()

	arg_10_0.boxItem_[arg_10_1]:SetPos(arg_10_2, arg_10_3, var_10_1, var_10_2)
end

function var_0_0.OperateMove(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0.actionCnt_ = 0
	arg_11_0.routhMap_ = {}
	arg_11_0.dirMap_ = {}

	local var_11_0, var_11_1 = arg_11_0.boxItem_[arg_11_3]:GetCoordinate()

	if arg_11_0:CalMove(var_11_0, var_11_1, arg_11_1, arg_11_2) then
		if #arg_11_0.routhMap_ <= 1 then
			manager.notify:Invoke(PUSH_BOX_STOP)

			return
		end

		manager.audio:PlayEffect("minigame_activity_2_10", "minigame_activity_2_10_box_carmove")
		arg_11_0:AniMove(2, arg_11_3)
	end
end

function var_0_0.CalMove(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	arg_12_0.actionCnt_ = arg_12_0.actionCnt_ + 1

	table.insert(arg_12_0.routhMap_, {
		arg_12_1,
		arg_12_2
	})
	table.insert(arg_12_0.dirMap_, {
		arg_12_3,
		arg_12_4
	})

	local var_12_0 = arg_12_0:GetCellIndex(arg_12_1, arg_12_2)
	local var_12_1 = arg_12_0.cellItem_[var_12_0]

	if var_12_1:GetType() == PushBoxConst.CELL_TYPE.GOAL and arg_12_0.actionCnt_ > 1 then
		return true
	end

	if arg_12_0.actionCnt_ >= var_0_1 then
		error("路径过长")

		return false
	end

	local var_12_2 = arg_12_1 + arg_12_3
	local var_12_3 = arg_12_2 + arg_12_4
	local var_12_4 = arg_12_0:GetCellIndex(var_12_2, var_12_3)

	if var_12_2 < 1 or var_12_3 < 1 or var_12_2 > arg_12_0.mapWidth_ or var_12_3 > arg_12_0.mapHeight_ then
		return true
	end

	local var_12_5 = arg_12_0.cellItem_[var_12_4]
	local var_12_6 = var_12_5:IsCanPass()
	local var_12_7 = var_12_5:GetType()

	if var_12_6 then
		var_12_1:ActionPass()

		if var_12_7 == PushBoxConst.CELL_TYPE.UP_SLIDER then
			return arg_12_0:CalMove(var_12_2, var_12_3, 0, -1)
		elseif var_12_7 == PushBoxConst.CELL_TYPE.DOWN_SLIDER then
			return arg_12_0:CalMove(var_12_2, var_12_3, 0, 1)
		elseif var_12_7 == PushBoxConst.CELL_TYPE.LEFT_SLIDER then
			return arg_12_0:CalMove(var_12_2, var_12_3, -1, 0)
		elseif var_12_7 == PushBoxConst.CELL_TYPE.RIGHT_SLIDER then
			return arg_12_0:CalMove(var_12_2, var_12_3, 1, 0)
		else
			return arg_12_0:CalMove(var_12_2, var_12_3, arg_12_3, arg_12_4)
		end
	else
		return true
	end
end

function var_0_0.AniMove(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:RemoveTween()
	arg_13_0.boxItem_[arg_13_2]:PlayDirct(arg_13_0.dirMap_[arg_13_1 - 1])

	local var_13_0 = arg_13_0:GetCellIndex(arg_13_0.routhMap_[arg_13_1][1], arg_13_0.routhMap_[arg_13_1][2])

	arg_13_0.cellItem_[var_13_0]:OnReadyEnter()

	local var_13_1, var_13_2 = arg_13_0.cellItem_[var_13_0]:GetLoaclPosition()

	arg_13_0.tween_ = LeanTween.moveLocal(arg_13_0.boxItem_[arg_13_2].gameObject_, Vector3.New(var_13_1, var_13_2, 0), var_0_3):setEase(LeanTweenType.linear):setOnComplete(LuaHelper.VoidAction(function()
		local var_14_0 = arg_13_0:GetCellIndex(arg_13_0.routhMap_[arg_13_1 - 1][1], arg_13_0.routhMap_[arg_13_1 - 1][2])

		arg_13_0.cellItem_[var_14_0]:OnPass()

		if arg_13_1 == #arg_13_0.routhMap_ then
			arg_13_0:RemoveTween()
			arg_13_0.boxItem_[arg_13_2]:StopAni()

			local var_14_1, var_14_2 = arg_13_0.cellItem_[var_13_0]:GetPos()

			arg_13_0.boxItem_[arg_13_2]:SetPos(var_14_1, var_14_2, var_13_1, var_13_2)

			if arg_13_0.cellItem_[var_13_0]:GetType() == PushBoxConst.CELL_TYPE.GOAL then
				manager.audio:PlayEffect("minigame_activity_2_10", "minigame_activity_2_10_box_success")
			end

			manager.audio:PlayEffect("minigame_activity_2_10", "minigame_activity_2_10_box_carstop")
			manager.notify:Invoke(PUSH_BOX_STOP)

			return
		end

		arg_13_0:AniMove(arg_13_1 + 1, arg_13_2)
	end))
end

function var_0_0.GetCanPassDir(arg_15_0, arg_15_1)
	local var_15_0, var_15_1 = arg_15_0.boxItem_[arg_15_1]:GetCoordinate()
	local var_15_2 = arg_15_0:CheckCanPass(var_15_0, var_15_1, 0, -1)
	local var_15_3 = arg_15_0:CheckCanPass(var_15_0, var_15_1, 0, 1)
	local var_15_4 = arg_15_0:CheckCanPass(var_15_0, var_15_1, -1, 0)
	local var_15_5 = arg_15_0:CheckCanPass(var_15_0, var_15_1, 1, 0)

	return var_15_2, var_15_3, var_15_4, var_15_5
end

function var_0_0.CheckCanPass(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = arg_16_0:GetCellIndex(arg_16_1, arg_16_2)
	local var_16_1 = arg_16_0.cellItem_[var_16_0]
	local var_16_2 = arg_16_1 + arg_16_3
	local var_16_3 = arg_16_2 + arg_16_4
	local var_16_4 = arg_16_0:GetCellIndex(var_16_2, var_16_3)

	if var_16_2 < 1 or var_16_3 < 1 or var_16_2 > arg_16_0.mapWidth_ or var_16_3 > arg_16_0.mapHeight_ then
		return false
	end

	return (arg_16_0.cellItem_[var_16_4]:IsCanPass())
end

function var_0_0.RemoveTween(arg_17_0)
	if arg_17_0.tween_ then
		arg_17_0.tween_:setOnComplete(nil)
		LeanTween.cancel(arg_17_0.tween_.id)

		arg_17_0.tween_ = nil
	end
end

function var_0_0.OnExit(arg_18_0)
	return
end

function var_0_0.Dispose(arg_19_0)
	arg_19_0.cellItem_ = {}
	arg_19_0.boxItem_ = {}
	arg_19_0.isInit_ = false
end

return var_0_0
