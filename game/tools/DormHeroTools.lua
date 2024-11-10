local var_0_0 = {
	HideAllCharacter = function()
		DormCharacterManager.GetInstance():Clear()
	end,
	GenerateHeroByDrag = function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = DormCharacterManager.GetInstance()
		local var_2_1 = DormHeroTools:GetCurSkinID(arg_2_1)
		local var_2_2 = var_2_0:Generate(var_2_1)
		local var_2_3

		if arg_2_2 then
			var_2_3 = arg_2_2.pointerId
		end

		DormLuaBridge.BeginGrabPlayerEntity(var_2_2, var_2_3)

		return var_2_2
	end,
	GenreateHero = function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = DormCharacterManager.GetInstance()
		local var_3_1 = DormHeroTools:GetCurSkinID(arg_3_1)
		local var_3_2 = var_3_0:Generate(var_3_1, arg_3_2)

		if not var_3_2 then
			print("未生成角色" .. arg_3_1)
		end

		return var_3_2
	end,
	RandomSetHeroTrs = function(arg_4_0, arg_4_1)
		local var_4_0 = Dorm.DormEntityManager.QueryRadius(arg_4_1)
		local var_4_1 = DormLuaBridge.FindSpawnPos(var_4_0, 5, true)

		if var_4_1 then
			local var_4_2 = Quaternion.Euler(0, 360 * math.random(), 0) * Vector3.forward

			Dorm.DormEntityManager.PutEntityLookToDir(arg_4_1, var_4_1, var_4_2)
		else
			DormLuaBridge.TryGrabPlayerOutOfStuck(arg_4_1)
		end
	end,
	DisposeSingleHero = function(arg_5_0, arg_5_1)
		DormCharacterManager.FindAndRemove(arg_5_1)
	end,
	ReGenerateDormHeroEntity = function(arg_6_0)
		local var_6_0 = CanteenAIFunction:GetNameSpace(DormEnum.CharacterType.DormNormalHero)
		local var_6_1 = DormData:GetCurrectSceneID()

		if var_6_1 then
			local var_6_2 = DormitoryData:GetDormHerosByArchitecture(var_6_1)
			local var_6_3 = {}

			for iter_6_0, iter_6_1 in ipairs(var_6_2) do
				var_6_3[DormData:GetHeroTemplateInfo(iter_6_1):GetHeroCurSkinID(iter_6_1)] = true
			end

			for iter_6_2, iter_6_3 in Dorm.storage:ForeachData(var_6_0, pairs) do
				if not var_6_3[iter_6_2] then
					DormCharacterManager.GetInstance():Remove(iter_6_2)
				end

				var_6_3[iter_6_2] = nil
			end

			for iter_6_4, iter_6_5 in pairs(var_6_3) do
				local var_6_4 = arg_6_0:GenreateHero(iter_6_4)

				arg_6_0:RandomSetHeroTrs(var_6_4)
			end
		end

		if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.CricketBattle then
			dump("清理场景内角色")
		end
	end
}

function var_0_0.GenerateHeroWhenEnterScene(arg_7_0)
	local var_7_0 = DormData:GetCurrectSceneID()

	if var_7_0 > DormConst.DORM_VISIT_ROOM_MIN then
		local var_7_1 = DormVisitTools:GetCurVisitHeroList()

		if var_7_1 then
			for iter_7_0, iter_7_1 in ipairs(var_7_1) do
				local var_7_2 = var_0_0:GenreateHero(iter_7_1, true)

				var_0_0:RandomSetHeroTrs(var_7_2)
			end
		end

		return
	end

	local var_7_3 = DormitoryData:GetDormMapList()[var_7_0].archiveIDList

	if not var_7_3 then
		return
	end

	local var_7_4

	if BackHomeCfg[var_7_0].type == DormConst.BACKHOME_TYPE.PublicDorm then
		if var_7_3 and #var_7_3 > 0 then
			for iter_7_2, iter_7_3 in ipairs(var_7_3) do
				local var_7_5 = DormData:GetHeroInfo(iter_7_3):GetHeroId()

				if var_7_5 ~= nil then
					local var_7_6 = var_0_0:GenreateHero(var_7_5, true)

					var_0_0:RandomSetHeroTrs(var_7_6)
				end
			end
		end
	elseif BackHomeCfg[var_7_0].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_7_7 = var_7_3[1]
		local var_7_8 = DormData:GetHeroInfo(var_7_7)

		if var_7_8 and var_7_8:GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
			local var_7_9 = var_7_8:GetHeroId()

			if var_7_9 ~= nil then
				local var_7_10 = var_0_0:GenreateHero(var_7_9, true)

				var_0_0:RandomSetHeroTrs(var_7_10)
			end
		end
	end
end

function var_0_0.FeedAllHero(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = DormData:GetHeroInfoList()
	local var_8_1 = var_0_0:GetAllHeroEIDInCurScene()
	local var_8_2 = DormData:GetCurrectSceneID()
	local var_8_3
	local var_8_4 = DormData:GetHeroArchiveID(arg_8_1)

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		if iter_8_1:CheckCanFeedFood() then
			local var_8_5

			if var_0_0:CheckHeroInRoom(var_8_2, iter_8_0) then
				local var_8_6 = iter_8_1:GetHeroId()

				var_8_5 = var_8_1[iter_8_1:GetHeroCurSkinID(var_8_6)]
			end

			if var_8_4 == iter_8_0 then
				var_8_3 = iter_8_1:FeedFood(var_8_5, arg_8_2(var_8_5))
			else
				iter_8_1:FeedFood(var_8_5, arg_8_2(var_8_5))
			end
		end
	end

	return var_8_3
end

function var_0_0.FeedMultipleHero(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0

	for iter_9_0, iter_9_1 in pairs(arg_9_1) do
		local var_9_1 = DormData:GetHeroArchiveID(iter_9_1)
		local var_9_2 = DormData:GetHeroInfo(var_9_1)

		if var_9_2:CheckCanFeedFood() then
			if iter_9_1 == arg_9_2 then
				var_9_0 = var_9_2:FeedFood(iter_9_0, arg_9_3(iter_9_0))
			else
				var_9_0 = var_9_2:FeedFood(iter_9_0, arg_9_3(iter_9_0))
			end
		end
	end

	return var_9_0
end

function var_0_0.RecallAllHero(arg_10_0, arg_10_1)
	local var_10_0 = DormConst.PUBLIC_DORM_ID
	local var_10_1 = {}
	local var_10_2 = false

	if arg_10_1 then
		for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
			if DormData:GetHeroFatigue(iter_10_1) < GameSetting.canteen_hero_fatigue_max.value[1] then
				table.insert(var_10_1, iter_10_1)
			else
				var_10_2 = true
			end
		end

		if var_10_2 then
			DormAction:DeployHeroInRoom(var_10_0, var_10_1, DormEnum.DormDeployType.ReCall)
		else
			ShowTips("DORM_NO_HERO_RECALL")
		end
	end
end

function var_0_0.GetBackHomeHeadSprite(arg_11_0)
	local var_11_0

	if DormNpcTools:CheckIDIsNpc(arg_11_0) then
		var_11_0 = arg_11_0
	elseif IdolPveNpcCfg[arg_11_0] then
		var_11_0 = IdolPveNpcCfg[arg_11_0].icon
	else
		var_11_0 = var_0_0:GetCurSkinID(arg_11_0)
	end

	if var_11_0 then
		return getSpriteViaConfig("DormHeroHeadIcon", var_11_0)
	end
end

function var_0_0.GetBackHomeFullModelSprite(arg_12_0)
	local var_12_0 = var_0_0:GetCurSkinID(arg_12_0)

	if var_12_0 then
		return getSpriteViaConfig("DormHeroModelIcon", var_12_0)
	end
end

function var_0_0.GetBackHomeFullModelFowardSprite(arg_13_0)
	local var_13_0 = var_0_0:GetCurSkinID(arg_13_0)

	if var_13_0 then
		return getSpriteViaConfig("DormHeroPortrait", var_13_0)
	end
end

function var_0_0.GetBackHomeHeroSkinIcon(arg_14_0)
	if arg_14_0 then
		return getSpriteViaConfig("DormHeroPortrait", arg_14_0)
	end
end

function var_0_0.GetCurSkinID(arg_15_0, arg_15_1)
	if DormVisitTools:CheckCurIsVisitRoom() then
		return arg_15_1
	end

	local var_15_0 = DormData:GetHeroTemplateInfo(arg_15_1)

	if var_15_0 then
		local var_15_1 = var_15_0:GetHeroCurSkinID(arg_15_1)

		if var_15_1 then
			return var_15_1
		else
			print("未找到角色" .. arg_15_1 .. "的皮肤id")
		end
	else
		return arg_15_1
	end
end

function var_0_0.GetCanUseDormHeroSkinList(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(SkinCfg.get_id_list_by_hero[arg_16_0]) do
		if not HeroTools.GetIsSkinHide(iter_16_1) and BackHomeHeroSkinCfg[iter_16_1] then
			table.insert(var_16_0, iter_16_1)
		end
	end

	return var_16_0
end

function var_0_0.isUnlock(arg_17_0, arg_17_1)
	local var_17_0 = SkinCfg[arg_17_1].hero
	local var_17_1 = HeroTools.HeroUnlockSkinS(var_17_0)

	for iter_17_0, iter_17_1 in ipairs(var_17_1) do
		if iter_17_1 == arg_17_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetDormHeroCanUseSkinList(arg_18_0, arg_18_1)
	local var_18_0 = var_0_0.GetCanUseDormHeroSkinList(arg_18_1)
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		if var_0_0:isUnlock(iter_18_1) then
			table.insert(var_18_1, iter_18_1)
		end
	end

	return var_18_1
end

function var_0_0.GetDormHeroNextCanUseSkin(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:GetDormHeroCanUseSkinList(arg_19_1)
	local var_19_1 = #var_19_0

	if var_19_1 == 0 or var_19_1 == 1 then
		return nil
	else
		local var_19_2 = table.indexof(var_19_0, arg_19_2)

		return var_19_0[var_19_2 == var_19_1 and 1 or var_19_2 + 1]
	end
end

function var_0_0.CheckDormFatigueLevel(arg_20_0, arg_20_1)
	if not DormNpcTools:CheckIDIsNpc(arg_20_1) then
		if DormData:GetHeroTemplateInfo(arg_20_1):GetFatigue() < GameDisplayCfg.dorm_hero_hungry_fatigue.value[1] then
			return false
		else
			return true
		end
	else
		return true
	end
end

function var_0_0.CheckCanteenFatigueLevel(arg_21_0, arg_21_1)
	if not DormNpcTools:CheckIDIsNpc(arg_21_1) then
		if DormData:GetHeroTemplateInfo(arg_21_1):GetFatigue() < GameDisplayCfg.canteen_hero_tired_fatigue.value[1] then
			return false
		else
			return true
		end
	else
		return true
	end
end

function var_0_0.CheckFeedTime(arg_22_0, arg_22_1)
	if not DormNpcTools:CheckIDIsNpc(arg_22_1) then
		if DormData:GetHeroTemplateInfo(arg_22_1).feed_times >= GameSetting.dorm_feed_max.value[1] then
			return false
		else
			return true
		end
	else
		return false
	end
end

function var_0_0.GetCanUseHeroInDorm(arg_23_0)
	local var_23_0 = {}
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
		if HeroTools.GetHeroIsUnlock(iter_23_1) and BackHomeHeroCfg[iter_23_1] then
			var_23_0[DormData:GetHeroArchiveID(iter_23_1)] = true
		end
	end

	for iter_23_2, iter_23_3 in pairs(var_23_0) do
		table.insert(var_23_1, iter_23_2)
	end

	return var_23_1
end

function var_0_0.GetAllCanUseHeroInDorm(arg_24_0)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
		if HeroTools.GetHeroIsUnlock(iter_24_1) == true and BackHomeHeroCfg[iter_24_1] then
			table.insert(var_24_0, iter_24_1)
		end
	end

	return var_24_0
end

function var_0_0.GetUnLockBackHomeHeroIDList(arg_25_0)
	local var_25_0 = var_0_0:GetCanUseHeroInDorm()
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		local var_25_2 = DormData:GetHeroInfo(iter_25_1):GetCanUseHeroList()

		for iter_25_2, iter_25_3 in ipairs(var_25_2) do
			table.insert(var_25_1, iter_25_3)
		end
	end

	return var_25_1
end

function var_0_0.GetBackHomeCanUseHeroList(arg_26_0, arg_26_1)
	local var_26_0 = {}
	local var_26_1 = {}

	if BackHomeCfg[arg_26_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		local var_26_2 = {}

		for iter_26_0, iter_26_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
			if HeroTools.GetHeroIsUnlock(iter_26_1) == true and BackHomeHeroCfg[iter_26_1] then
				local var_26_3 = DormData:GetHeroArchiveID(iter_26_1)

				if not var_26_1[var_26_3] then
					var_26_1[var_26_3] = true

					table.insert(var_26_2, var_26_3)
				end
			end
		end

		for iter_26_2, iter_26_3 in pairs(var_26_2) do
			local var_26_4 = DormData:GetHeroInfo(iter_26_3)

			if #var_26_4:GetCanUseHeroList() > 0 then
				for iter_26_4, iter_26_5 in ipairs(var_26_4:GetCanUseHeroList()) do
					table.insert(var_26_0, iter_26_5)
				end
			end
		end

		return var_26_0
	elseif BackHomeCfg[arg_26_1].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_26_5 = DormitoryData:GetDormSceneData(arg_26_1).archiveIDList[1]

		if var_26_5 then
			local var_26_6 = DormData:GetHeroInfo(var_26_5):GetCanUseHeroList()

			for iter_26_6, iter_26_7 in ipairs(var_26_6) do
				table.insert(var_26_0, iter_26_7)
			end
		else
			print("未找到档案id")
		end

		return var_26_0
	end

	Debug.LogError("未找到对应房间类型")
end

function var_0_0.CheckHeroInRoom(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = DormitoryData:GetDormArchivesByArchitecture(arg_27_1)

	if BackHomeCfg[arg_27_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		for iter_27_0, iter_27_1 in ipairs(var_27_0) do
			if iter_27_1 == arg_27_2 then
				return true
			end
		end
	elseif BackHomeCfg[arg_27_1].type == DormConst.BACKHOME_TYPE.PrivateDorm and DormData:GetHeroInfo(var_27_0[1]):GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
		return true
	end

	return false
end

function var_0_0.GetTemplateIDInDorm(arg_28_0, arg_28_1)
	local var_28_0 = {}

	if arg_28_1 and HeroRecordCfg[arg_28_1] then
		local var_28_1 = HeroRecordCfg[arg_28_1].hero_id

		for iter_28_0, iter_28_1 in ipairs(var_28_1) do
			if BackHomeHeroCfg[iter_28_1] then
				table.insert(var_28_0, iter_28_1)
			end
		end
	end

	return var_28_0[1]
end

function var_0_0.GetAllCanUseHeroIDInDorm(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}

	if arg_29_1 and HeroRecordCfg[arg_29_1] then
		local var_29_1 = HeroRecordCfg[arg_29_1].hero_id

		for iter_29_0, iter_29_1 in ipairs(var_29_1) do
			if BackHomeHeroCfg[iter_29_1] then
				if not arg_29_2 then
					if HeroTools.GetHeroIsUnlock(iter_29_1) then
						table.insert(var_29_0, iter_29_1)
					end
				else
					table.insert(var_29_0, iter_29_1)
				end
			end
		end
	end

	return var_29_0
end

function var_0_0.GetAllHeroEIDInCurScene(arg_30_0)
	local var_30_0 = DormUtils.EIdNamespace(DormEnum.CharacterType.DormNormalHero)
	local var_30_1 = {}

	for iter_30_0, iter_30_1 in Dorm.storage:ForeachData(var_30_0, pairs) do
		var_30_1[iter_30_0] = iter_30_1
	end

	return var_30_1
end

function var_0_0.IsVoiceNeedUnlock(arg_31_0, arg_31_1, arg_31_2)
	for iter_31_0, iter_31_1 in ipairs(BackHomeDormLevelRewardCfg.all) do
		local var_31_0 = BackHomeDormLevelRewardCfg[iter_31_1]

		if var_31_0.type == 2 and var_31_0.reward[1] == arg_31_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetVoiceUnlockLevel(arg_32_0, arg_32_1, arg_32_2)
	for iter_32_0, iter_32_1 in ipairs(BackHomeDormLevel.all) do
		local var_32_0 = BackHomeHeroCfg[arg_32_1].level_reward[iter_32_0]

		for iter_32_2, iter_32_3 in ipairs(var_32_0) do
			local var_32_1 = BackHomeDormLevelRewardCfg[iter_32_3]

			if var_32_1.type == 2 and var_32_1.reward[1] == arg_32_2 then
				return iter_32_1
			end
		end
	end

	return 1
end

function var_0_0.GetDormLevelByHeroID(arg_33_0, arg_33_1)
	local var_33_0 = DormData:GetHeroArchiveID(arg_33_1)
	local var_33_1 = DormRoomTools:GetDormIDViaArchive(var_33_0)

	return DormitoryData:GetDormLevel(var_33_1) or 0
end

function var_0_0.GetHeroIDByDancePos(arg_34_0, arg_34_1)
	local var_34_0 = DormData:GetHeroInfoList()

	for iter_34_0, iter_34_1 in pairs(var_34_0) do
		if iter_34_1.dancePos == arg_34_1 then
			return iter_34_1:GetHeroId()
		end
	end
end

function var_0_0.GetHeroListInDance(arg_35_0)
	local var_35_0 = {}
	local var_35_1 = DormData:GetHeroInfoList()

	for iter_35_0, iter_35_1 in pairs(var_35_1) do
		if iter_35_1.dancePos then
			table.insert(var_35_0, iter_35_1)
		end
	end

	return var_35_0
end

return var_0_0
