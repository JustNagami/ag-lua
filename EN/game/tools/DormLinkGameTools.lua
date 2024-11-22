local var_0_0 = {}

function var_0_0.OpenGameTips()
	local var_1_0 = var_0_0.GetGameHelpKey()
	local var_1_1 = var_1_0.view
	local var_1_2 = var_1_0.params

	JumpTools.OpenPageByJump(var_1_1, var_1_2)
end

function var_0_0.GetGameHelpKey()
	if var_0_0.helpKey == nil then
		var_0_0.helpKey = {
			view = "gameHelpPro",
			type = "jump",
			params = {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = GameSetting.linkgame_describe.value
			}
		}
	end

	return var_0_0.helpKey
end

function var_0_0.GetMainUIName(arg_3_0, arg_3_1)
	return "Widget/Version/NorseUI_3_2/NorseUI_3_2_LinkGame/NorseUI_3_2_LinkGameUI"
end

function var_0_0.GetTaskActivityID(arg_4_0, arg_4_1)
	return ActivityTools.GetAllTaskSubActivityID(arg_4_1)[1]
end

function var_0_0.GetLevelActivityList(arg_5_0, arg_5_1)
	return ActivityTools.GetAllSubActivityByTemplate(arg_5_1, ActivityTemplateConst.LIANLIANKAN_LEVEL)
end

function var_0_0.GetLostTimeStr(arg_6_0, arg_6_1)
	local var_6_0 = ActivityLinkGameCfg[arg_6_1].activity_id
	local var_6_1 = ActivityData:GetActivityData(var_6_0).stopTime - TimeMgr.GetInstance():GetServerTime()
	local var_6_2 = math.floor(var_6_1 / 86400)
	local var_6_3 = math.fmod(math.floor(var_6_1 / 3600), 24)
	local var_6_4 = math.fmod(math.floor(var_6_1 / 60), 60)
	local var_6_5 = math.fmod(var_6_1, 60)
	local var_6_6

	if var_6_2 > 0 then
		return var_6_6.format(GetTips("ACTIVITY_LINKGAME_TIME_LIMIT"), var_6_2 + 1)
	elseif var_6_3 > 0 then
		return var_6_3 + 1 .. GetTips("HOUR")
	elseif var_6_4 > 0 then
		return var_6_4 + 1 .. GetTips("MINUTE")
	elseif var_6_5 > 0 then
		return var_6_4 + 1 .. GetTips("MINUTE")
	end
end

function var_0_0.GetLevelIDByDiffAndActivityID(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0, iter_7_1 in ipairs(ActivityLinkGameCfg.all) do
		if ActivityLinkGameCfg[iter_7_1].activity_id == arg_7_1 and ActivityLinkGameCfg[iter_7_1].difficult == arg_7_2 then
			return iter_7_1
		end
	end

	print("未找到活动id")
end

function var_0_0.GetAwardDesc(arg_8_0, arg_8_1)
	if ActivityLinkGameRewardCfg[arg_8_1] then
		local var_8_0 = ActivityLinkGameRewardCfg[arg_8_1].condition
		local var_8_1 = ConditionCfg[var_8_0]

		if var_8_1.type == DormLinkGameConst.AwardCondition.Point then
			local var_8_2 = ActivityLinkGameRewardCfg[arg_8_1].activity_id
			local var_8_3 = var_8_1.params[1]
			local var_8_4 = var_8_1.params[2]
			local var_8_5

			for iter_8_0, iter_8_1 in ipairs(ActivityLinkGameCfg.all) do
				if ActivityLinkGameCfg[iter_8_1].activity_id == var_8_2 then
					var_8_5 = ActivityCfg[var_8_2].remark

					break
				end
			end

			if var_8_5 then
				return string.format(GetI18NText(var_8_1.desc), GetI18NText(var_8_5), var_8_4)
			end
		end
	end

	print("未找奖励id")
end

function var_0_0.GetCurrencyID(arg_9_0, arg_9_1)
	return CurrencyIdMapCfg.CURRENCY_LINKGAME_COST.item_id
end

function var_0_0.ChecklevelUnLock(arg_10_0, arg_10_1)
	if ActivityLinkGameCfg[arg_10_1] then
		local var_10_0 = ActivityLinkGameCfg[arg_10_1].activity_id
		local var_10_1, var_10_2 = arg_10_0:CheckLevelActivityUnlock(var_10_0)

		if not var_10_1 then
			return false, var_10_2
		end

		local var_10_3 = ActivityLinkGameCfg[arg_10_1].pre_stage

		if var_10_3 and var_10_3 ~= 0 and not DormLinkGameData:CheckActivityComplete(var_10_3) then
			return false, DormLinkGameConst.LevelLockType.preLevel, var_10_3
		end

		return true
	end
end

function var_0_0.CheckLevelActivityUnlock(arg_11_0, arg_11_1)
	local var_11_0 = ActivityTools.GetActivityStatus(arg_11_1)
	local var_11_1 = ActivityData:GetActivityData(arg_11_1).startTime

	if var_11_0 == 1 then
		return true
	elseif var_11_0 == 0 then
		return false, DormLinkGameConst.LevelLockType.time, var_11_1
	elseif var_11_0 == 2 then
		return false, DormLinkGameConst.LevelLockType.stop
	else
		return false
	end
end

function var_0_0.CheckAnyLevelInActivityUnlock(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in ipairs(ActivityLinkGameCfg.get_id_list_by_activity_id[arg_12_1]) do
		local var_12_0 = ActivityLinkGameCfg[iter_12_1].pre_stage or 0

		if var_12_0 == 0 or DormLinkGameData:CheckActivityComplete(var_12_0) then
			return true
		end
	end

	return false
end

function var_0_0.GetDormLinkGameItemIcon(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = ActivityLinkGameGoodsCfg[arg_13_2].path
	local var_13_1 = ActivityLinkGameGoodsCfg[arg_13_2].goods_icon_id

	if var_13_0 and var_13_1 then
		return getSpriteWithoutAtlas(var_13_0 .. "/" .. var_13_1)
	end
end

function var_0_0.GetFoodMaterialIcon(arg_14_0, arg_14_1)
	local var_14_0 = ActivityLinkGameCellCfg[arg_14_1].album_id
	local var_14_1 = ActivityLinkGameCellCfg[arg_14_1].path

	return getSpriteWithoutAtlas(var_14_1 .. "/" .. var_14_0)
end

function var_0_0.PlaySpecialVoice(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0:FindConformSpecialVoice(arg_15_1, arg_15_2)

	if var_15_0 then
		local var_15_1 = nullable(ActivityLinkGameDialogCfg, var_15_0)

		if var_15_1 then
			local var_15_2 = math.random(#var_15_1.sheetName)
			local var_15_3 = var_15_1.sheetName[var_15_2]
			local var_15_4 = var_15_1.cueName[var_15_2]
			local var_15_5 = var_15_1.awbName[var_15_2]

			if var_15_3 ~= "" then
				manager.audio:PlayEffect(var_15_3, var_15_4, var_15_5)
			end
		end
	end
end

function var_0_0.FindConformSpecialVoice(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = nullable(ActivityLinkGameDialogCfg, "all")

	if var_16_0 then
		for iter_16_0, iter_16_1 in ipairs(var_16_0) do
			local var_16_1 = ActivityLinkGameDialogCfg[iter_16_1].condition

			if ConditionCfg[var_16_1].type == arg_16_1 and arg_16_0:CheckConditionConform(var_16_1, arg_16_2, arg_16_1) then
				return iter_16_1
			end
		end
	end
end

function var_0_0.CheckConditionConform(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if arg_17_3 == DormLinkGameConst.SpecialVoiceType.SuccssBatterNum then
		local var_17_0 = arg_17_2.oldNum
		local var_17_1 = arg_17_2.newNum
		local var_17_2 = ConditionCfg[arg_17_1].params[1]

		if var_17_0 < var_17_2 and var_17_2 <= var_17_1 then
			return true
		end
	elseif arg_17_3 == DormLinkGameConst.SpecialVoiceType.FaileBatterNum then
		if arg_17_2.num >= ConditionCfg[arg_17_1].params[1] then
			return true
		end
	elseif arg_17_3 == DormLinkGameConst.SpecialVoiceType.SuccssfulLevel then
		return true
	elseif arg_17_3 == DormLinkGameConst.SpecialVoiceType.FaileLevel then
		return true
	elseif arg_17_3 == DormLinkGameConst.SpecialVoiceType.LastTime then
		local var_17_3 = arg_17_2.num
		local var_17_4 = ConditionCfg[arg_17_1].params[1]

		if var_17_4 < var_17_3 + 1 and var_17_3 <= var_17_4 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkillItemDecs(arg_18_0, arg_18_1)
	local var_18_0 = ActivityLinkGameGoodsCfg[arg_18_1].goods_des
	local var_18_1 = ActivityLinkGameGoodsCfg[arg_18_1].coin_num
	local var_18_2 = ActivityLinkGameGoodsCfg[arg_18_1].extra_param[1]

	return string.format(var_18_0, var_18_1, var_18_2)
end

function var_0_0.UseSkillItem(arg_19_0, arg_19_1)
	local var_19_0 = DormLinkGameData:GetGameCacheInfo()

	if not var_19_0.useItemList[arg_19_1] then
		var_19_0.useItemList[arg_19_1] = 0
	end

	var_19_0.useItemList[arg_19_1] = var_19_0.useItemList[arg_19_1] + 1
	var_19_0.costTokenNum = var_19_0.costTokenNum + ActivityLinkGameGoodsCfg[arg_19_1].coin_num

	arg_19_0:ImplementItemEffect(arg_19_1)
	manager.notify:Invoke(LIANLIANKAN_USE_ITEM)
end

function var_0_0.ImplementItemEffect(arg_20_0, arg_20_1)
	if arg_20_1 == DormLinkGameConst.SkillItemEffectType.Eliminate then
		manager.notify:Invoke(LIANLIANKAN_AUTO_MATCH)
	elseif arg_20_1 == DormLinkGameConst.SkillItemEffectType.ClearMaterialList then
		local var_20_0 = ActivityLinkGameGoodsCfg[arg_20_1].extra_param[1]

		DormLinkGameData:ClearConveyorMaterial(var_20_0)
		DormLinkGameData:PauseMaterialGenerate(var_20_0)
	end
end

function var_0_0.ExitGame(arg_21_0)
	DormLinkGameData:DisposeGameCacheInfo()
	LuaExchangeHelper.GoToMain()
	OpenPageUntilLoaded("/dormLinkGameLevelView")
end

return var_0_0
