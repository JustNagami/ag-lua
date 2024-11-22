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
	GenreateVisitHero = function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = DormCharacterManager.GetInstance()
		local var_4_1 = DormHeroTools:GetCurSkinID(arg_4_1)
		local var_4_2 = var_4_0:GenerateVisit(var_4_1, arg_4_2)

		if not var_4_2 then
			print("未生成角色" .. arg_4_1)
		end

		if DormData:CanReceiveVisitReward() then
			DormUtils.ShowCharaSpecialVfx(var_4_2, {
				DormEnum.SpecialVfx.Gift
			})
		end

		return var_4_2
	end,
	CheckIsVisitHero = function(arg_5_0, arg_5_1)
		local var_5_0 = DormCharacterManager.GetInstance()

		return var_5_0 and var_5_0:CheckIsVisitHero(arg_5_1)
	end,
	RandomSetHeroTrs = function(arg_6_0, arg_6_1)
		local var_6_0 = Dorm.DormEntityManager.QueryRadius(arg_6_1)
		local var_6_1 = DormLuaBridge.FindSpawnPos(var_6_0, 5, true)

		if var_6_1 then
			local var_6_2 = Quaternion.Euler(0, 360 * math.random(), 0) * Vector3.forward

			Dorm.DormEntityManager.PutEntityLookToDir(arg_6_1, var_6_1, var_6_2)
		else
			DormLuaBridge.TryGrabPlayerOutOfStuck(arg_6_1)
		end
	end,
	DisposeSingleHero = function(arg_7_0, arg_7_1)
		DormCharacterManager.FindAndRemove(arg_7_1)
	end,
	ReGenerateDormHeroEntity = function(arg_8_0)
		local var_8_0 = CanteenAIFunction:GetNameSpace(DormEnum.CharacterType.DormNormalHero)
		local var_8_1 = DormData:GetCurrectSceneID()

		if var_8_1 then
			local var_8_2 = DormCharacterManager.GetInstance()
			local var_8_3 = DormitoryData:GetDormHerosByArchitecture(var_8_1)
			local var_8_4 = {}

			for iter_8_0, iter_8_1 in ipairs(var_8_3) do
				var_8_4[DormData:GetHeroTemplateInfo(iter_8_1):GetHeroCurSkinID(iter_8_1)] = true
			end

			for iter_8_2, iter_8_3 in Dorm.storage:ForeachData(var_8_0, pairs) do
				if not var_8_4[iter_8_2] then
					var_8_2:Remove(iter_8_2)
				end

				var_8_4[iter_8_2] = nil
			end

			for iter_8_4, iter_8_5 in pairs(var_8_4) do
				local var_8_5 = var_8_2:Generate(iter_8_4)

				arg_8_0:RandomSetHeroTrs(var_8_5)
			end
		end
	end
}

function var_0_0.GenerateHeroWhenEnterScene(arg_9_0, arg_9_1)
	local var_9_0 = DormData:GetCurrectSceneID()

	if var_9_0 > DormConst.DORM_VISIT_ROOM_MIN then
		local var_9_1 = DormVisitTools:GetCurVisitHeroSkinDict()

		if var_9_1 then
			for iter_9_0, iter_9_1 in pairs(var_9_1) do
				local var_9_2 = DormCharacterManager.GetInstance():Generate(iter_9_1, true)

				var_0_0:RandomSetHeroTrs(var_9_2)
			end
		end

		return
	end

	local var_9_3 = DormitoryData:GetDormMapList()[var_9_0].archiveIDList

	if not var_9_3 then
		return
	end

	local var_9_4

	if BackHomeCfg[var_9_0].type == DormConst.BACKHOME_TYPE.PublicDorm then
		if var_9_3 and #var_9_3 > 0 then
			for iter_9_2, iter_9_3 in ipairs(var_9_3) do
				local var_9_5 = DormData:GetHeroInfo(iter_9_3):GetHeroId()

				if var_9_5 ~= nil then
					local var_9_6 = var_0_0:GenreateHero(var_9_5, true)

					var_0_0:RandomSetHeroTrs(var_9_6)
				end
			end
		end

		if not arg_9_1 or not arg_9_1.disAllowVisit then
			arg_9_0:GenerateVisitHero()
		end
	elseif BackHomeCfg[var_9_0].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_9_7 = var_9_3[1]
		local var_9_8 = DormData:GetHeroInfo(var_9_7)

		if var_9_8 and var_9_8:GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
			local var_9_9 = var_9_8:GetHeroId()

			if var_9_9 ~= nil then
				local var_9_10 = var_0_0:GenreateHero(var_9_9, true)

				var_0_0:RandomSetHeroTrs(var_9_10)
			end
		end
	end
end

function var_0_0.GenerateVisitHero(arg_10_0)
	local var_10_0 = DormData:GetCurrectSceneID()

	if BackHomeCfg[var_10_0].type == DormConst.BACKHOME_TYPE.PublicDorm and not DormVisitTools:CheckCurIsVisitRoom() then
		local var_10_1 = 1
		local var_10_2 = DormData:GetVisitInfo()

		for iter_10_0 = 1, var_10_1 do
			if var_10_2.visitUser[iter_10_0] then
				local var_10_3 = var_0_0:GenreateVisitHero(var_10_2.visitUser[iter_10_0].heroID, true)

				var_0_0:RandomSetHeroTrs(var_10_3)
				Dorm.InvokeEntityEvent(DORM_VISIT_CHARACTER_NICKNAME, var_10_3, var_10_2.visitUser[iter_10_0].name)
			else
				break
			end
		end
	end
end

function var_0_0.ShowVisitName(arg_11_0)
	local var_11_0 = DormData:GetCurrectSceneID()

	if BackHomeCfg[var_11_0].type == DormConst.BACKHOME_TYPE.PublicDorm and not DormVisitTools:CheckCurIsVisitRoom() then
		local var_11_1 = DormCharacterManager.GetInstance()
		local var_11_2 = 1
		local var_11_3 = DormData:GetVisitInfo()

		for iter_11_0 = 1, var_11_2 do
			if var_11_3.visitUser[iter_11_0] then
				local var_11_4 = var_11_1:GetVisitEntityID(var_11_3.visitUser[iter_11_0].heroID)

				if var_11_4 then
					Dorm.InvokeEntityEvent(DORM_VISIT_CHARACTER_NICKNAME, var_11_4, var_11_3.visitUser[iter_11_0].name)
				end
			else
				break
			end
		end
	end
end

function var_0_0.ShowVisitTalk(arg_12_0)
	local var_12_0 = DormData:GetCurrectSceneID()

	if BackHomeCfg[var_12_0].type == DormConst.BACKHOME_TYPE.PublicDorm and not DormVisitTools:CheckCurIsVisitRoom() then
		local var_12_1 = DormCharacterManager.GetInstance()
		local var_12_2 = 1
		local var_12_3 = DormData:GetVisitInfo()

		for iter_12_0 = 1, var_12_2 do
			if var_12_3.visitUser[iter_12_0] then
				local var_12_4 = var_12_1:GetVisitEntityID(var_12_3.visitUser[iter_12_0].heroID)

				if var_12_4 then
					manager.notify:Invoke(DORM_VISIT_CHARACTER_FIRST_TALK, var_12_4)
				end
			else
				break
			end
		end
	end
end

function var_0_0.FeedAllHero(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = DormData:GetHeroInfoList()
	local var_13_1 = var_0_0:GetAllHeroEIDInCurScene()
	local var_13_2 = DormData:GetCurrectSceneID()
	local var_13_3
	local var_13_4 = DormData:GetHeroArchiveID(arg_13_1)

	for iter_13_0, iter_13_1 in pairs(var_13_0) do
		if iter_13_1:CheckCanFeedFood() then
			local var_13_5

			if var_0_0:CheckHeroInRoom(var_13_2, iter_13_0) then
				local var_13_6 = iter_13_1:GetHeroId()

				var_13_5 = var_13_1[iter_13_1:GetHeroCurSkinID(var_13_6)]
			end

			if var_13_4 == iter_13_0 then
				var_13_3 = iter_13_1:FeedFood(var_13_5, arg_13_2(var_13_5))
			else
				iter_13_1:FeedFood(var_13_5, arg_13_2(var_13_5))
			end
		end
	end

	return var_13_3
end

function var_0_0.FeedMultipleHero(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0

	for iter_14_0, iter_14_1 in pairs(arg_14_1) do
		local var_14_1 = DormData:GetHeroArchiveID(iter_14_1)
		local var_14_2 = DormData:GetHeroInfo(var_14_1)

		if var_14_2:CheckCanFeedFood() then
			if iter_14_1 == arg_14_2 then
				var_14_0 = var_14_2:FeedFood(iter_14_0, arg_14_3(iter_14_0))
			else
				var_14_0 = var_14_2:FeedFood(iter_14_0, arg_14_3(iter_14_0))
			end
		end
	end

	return var_14_0
end

function var_0_0.RecallAllHero(arg_15_0, arg_15_1)
	local var_15_0 = DormConst.PUBLIC_DORM_ID
	local var_15_1 = {}
	local var_15_2 = false

	if arg_15_1 then
		for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
			if DormData:GetHeroFatigue(iter_15_1) < GameSetting.canteen_hero_fatigue_max.value[1] then
				table.insert(var_15_1, iter_15_1)
			else
				var_15_2 = true
			end
		end

		if var_15_2 then
			DormAction:DeployHeroInRoom(var_15_0, var_15_1, DormEnum.DormDeployType.ReCall)
		else
			ShowTips("DORM_NO_HERO_RECALL")
		end
	end
end

function var_0_0.GetBackHomeHeadSprite(arg_16_0, arg_16_1)
	local var_16_0

	if DormNpcTools:CheckIDIsNpc(arg_16_0) then
		var_16_0 = arg_16_0
	elseif IdolPveNpcCfg[arg_16_0] then
		var_16_0 = IdolPveNpcCfg[arg_16_0].icon
	elseif arg_16_1 then
		var_16_0 = arg_16_0
	else
		var_16_0 = var_0_0:GetCurSkinID(arg_16_0)
	end

	if var_16_0 then
		return getSpriteViaConfig("DormHeroHeadIcon", var_16_0)
	end
end

function var_0_0.GetBackHomeFullModelSprite(arg_17_0)
	local var_17_0 = var_0_0:GetCurSkinID(arg_17_0)

	if var_17_0 then
		return getSpriteViaConfig("DormHeroModelIcon", var_17_0)
	end
end

function var_0_0.GetBackHomeFullModelFowardSprite(arg_18_0)
	local var_18_0 = var_0_0:GetCurSkinID(arg_18_0)

	if var_18_0 then
		return getSpriteViaConfig("DormHeroPortrait", var_18_0)
	end
end

function var_0_0.GetBackHomeHeroSkinIcon(arg_19_0)
	if arg_19_0 then
		return getSpriteViaConfig("DormHeroPortrait", arg_19_0)
	end
end

function var_0_0.GetCurSkinID(arg_20_0, arg_20_1)
	if DormVisitTools:CheckCurIsVisitRoom() then
		local var_20_0 = HeroRecordCfg.get_id_list_by_hero_id[arg_20_1][1]

		return DormVisitTools:GetCurVisitHeroSkin(var_20_0) or arg_20_1
	end

	local var_20_1 = DormData:GetHeroTemplateInfo(arg_20_1)

	if var_20_1 then
		local var_20_2 = var_20_1:GetHeroCurSkinID(arg_20_1)

		if var_20_2 then
			return var_20_2
		else
			print("未找到角色" .. arg_20_1 .. "的皮肤id")
		end
	else
		return arg_20_1
	end
end

function var_0_0.GetCanUseDormHeroSkinList(arg_21_0)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(SkinCfg.get_id_list_by_hero[arg_21_0]) do
		if not HeroTools.GetIsSkinHide(iter_21_1) and BackHomeHeroSkinCfg[iter_21_1] then
			table.insert(var_21_0, iter_21_1)
		end
	end

	return var_21_0
end

function var_0_0.isUnlock(arg_22_0, arg_22_1)
	local var_22_0 = SkinCfg[arg_22_1].hero
	local var_22_1 = HeroTools.HeroUnlockSkinS(var_22_0)

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		if iter_22_1 == arg_22_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetDormHeroCanUseSkinList(arg_23_0, arg_23_1)
	local var_23_0 = var_0_0.GetCanUseDormHeroSkinList(arg_23_1)
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if var_0_0:isUnlock(iter_23_1) then
			table.insert(var_23_1, iter_23_1)
		end
	end

	return var_23_1
end

function var_0_0.GetDormHeroNextCanUseSkin(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0:GetDormHeroCanUseSkinList(arg_24_1)
	local var_24_1 = #var_24_0

	if var_24_1 == 0 or var_24_1 == 1 then
		return nil
	else
		local var_24_2 = table.indexof(var_24_0, arg_24_2)

		return var_24_0[var_24_2 == var_24_1 and 1 or var_24_2 + 1]
	end
end

function var_0_0.CheckDormFatigueLevel(arg_25_0, arg_25_1)
	if not DormNpcTools:CheckIDIsNpc(arg_25_1) then
		if DormData:GetHeroTemplateInfo(arg_25_1):GetFatigue() < GameDisplayCfg.dorm_hero_hungry_fatigue.value[1] then
			return false
		else
			return true
		end
	else
		return true
	end
end

function var_0_0.CheckCanteenFatigueLevel(arg_26_0, arg_26_1)
	if not DormNpcTools:CheckIDIsNpc(arg_26_1) then
		if DormData:GetHeroTemplateInfo(arg_26_1):GetFatigue() < GameDisplayCfg.canteen_hero_tired_fatigue.value[1] then
			return false
		else
			return true
		end
	else
		return true
	end
end

function var_0_0.CheckFeedTime(arg_27_0, arg_27_1)
	if not DormNpcTools:CheckIDIsNpc(arg_27_1) then
		if DormData:GetHeroTemplateInfo(arg_27_1).feed_times >= GameSetting.dorm_feed_max.value[1] then
			return false
		else
			return true
		end
	else
		return false
	end
end

function var_0_0.GetCanUseHeroInDorm(arg_28_0)
	local var_28_0 = {}
	local var_28_1 = {}

	for iter_28_0, iter_28_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
		if HeroTools.GetHeroIsUnlock(iter_28_1) and BackHomeHeroCfg[iter_28_1] then
			var_28_0[DormData:GetHeroArchiveID(iter_28_1)] = true
		end
	end

	for iter_28_2, iter_28_3 in pairs(var_28_0) do
		table.insert(var_28_1, iter_28_2)
	end

	return var_28_1
end

function var_0_0.GetAllCanUseHeroInDorm(arg_29_0)
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
		if HeroTools.GetHeroIsUnlock(iter_29_1) == true and BackHomeHeroCfg[iter_29_1] then
			table.insert(var_29_0, iter_29_1)
		end
	end

	return var_29_0
end

function var_0_0.GetUnLockBackHomeHeroIDList(arg_30_0)
	local var_30_0 = var_0_0:GetCanUseHeroInDorm()
	local var_30_1 = {}

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		local var_30_2 = DormData:GetHeroInfo(iter_30_1):GetCanUseHeroList()

		for iter_30_2, iter_30_3 in ipairs(var_30_2) do
			table.insert(var_30_1, iter_30_3)
		end
	end

	return var_30_1
end

function var_0_0.GetBackHomeCanUseHeroList(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = {}

	if BackHomeCfg[arg_31_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		local var_31_2 = {}

		for iter_31_0, iter_31_1 in ipairs(HeroCfg.get_id_list_by_private[0]) do
			if HeroTools.GetHeroIsUnlock(iter_31_1) == true and BackHomeHeroCfg[iter_31_1] then
				local var_31_3 = DormData:GetHeroArchiveID(iter_31_1)

				if not var_31_1[var_31_3] then
					var_31_1[var_31_3] = true

					table.insert(var_31_2, var_31_3)
				end
			end
		end

		for iter_31_2, iter_31_3 in pairs(var_31_2) do
			local var_31_4 = DormData:GetHeroInfo(iter_31_3)

			if #var_31_4:GetCanUseHeroList() > 0 then
				for iter_31_4, iter_31_5 in ipairs(var_31_4:GetCanUseHeroList()) do
					table.insert(var_31_0, iter_31_5)
				end
			end
		end

		return var_31_0
	elseif BackHomeCfg[arg_31_1].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_31_5 = DormitoryData:GetDormSceneData(arg_31_1).archiveIDList[1]

		if var_31_5 then
			local var_31_6 = DormData:GetHeroInfo(var_31_5):GetCanUseHeroList()

			for iter_31_6, iter_31_7 in ipairs(var_31_6) do
				table.insert(var_31_0, iter_31_7)
			end
		else
			print("未找到档案id")
		end

		return var_31_0
	end

	Debug.LogError("未找到对应房间类型")
end

function var_0_0.CheckHeroInRoom(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = DormitoryData:GetDormArchivesByArchitecture(arg_32_1)

	if BackHomeCfg[arg_32_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		for iter_32_0, iter_32_1 in ipairs(var_32_0) do
			if iter_32_1 == arg_32_2 then
				return true
			end
		end
	elseif BackHomeCfg[arg_32_1].type == DormConst.BACKHOME_TYPE.PrivateDorm and DormData:GetHeroInfo(var_32_0[1]):GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
		return true
	end

	return false
end

function var_0_0.GetTemplateIDInDorm(arg_33_0, arg_33_1)
	local var_33_0 = {}

	if arg_33_1 and HeroRecordCfg[arg_33_1] then
		local var_33_1 = HeroRecordCfg[arg_33_1].hero_id

		for iter_33_0, iter_33_1 in ipairs(var_33_1) do
			if BackHomeHeroCfg[iter_33_1] then
				table.insert(var_33_0, iter_33_1)
			end
		end
	end

	return var_33_0[1]
end

function var_0_0.GetAllCanUseHeroIDInDorm(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = {}

	if arg_34_1 and HeroRecordCfg[arg_34_1] then
		local var_34_1 = HeroRecordCfg[arg_34_1].hero_id

		for iter_34_0, iter_34_1 in ipairs(var_34_1) do
			if BackHomeHeroCfg[iter_34_1] then
				if not arg_34_2 then
					if HeroTools.GetHeroIsUnlock(iter_34_1) then
						table.insert(var_34_0, iter_34_1)
					end
				else
					table.insert(var_34_0, iter_34_1)
				end
			end
		end
	end

	return var_34_0
end

function var_0_0.GetAllHeroEIDInCurScene(arg_35_0)
	local var_35_0 = DormUtils.EIdNamespace(DormEnum.CharacterType.DormNormalHero)
	local var_35_1 = {}

	for iter_35_0, iter_35_1 in Dorm.storage:ForeachData(var_35_0, pairs) do
		var_35_1[iter_35_0] = iter_35_1
	end

	return var_35_1
end

function var_0_0.IsVoiceNeedUnlock(arg_36_0, arg_36_1, arg_36_2)
	if BackHomeHeroCfg[arg_36_2] then
		for iter_36_0, iter_36_1 in ipairs(BackHomeDormLevelRewardCfg.all) do
			local var_36_0 = BackHomeDormLevelRewardCfg[iter_36_1]

			if var_36_0.type == 2 and var_36_0.reward[1] == arg_36_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetVoiceUnlockLevel(arg_37_0, arg_37_1, arg_37_2)
	for iter_37_0, iter_37_1 in ipairs(BackHomeDormLevel.all) do
		local var_37_0 = BackHomeHeroCfg[arg_37_1].level_reward[iter_37_0]

		for iter_37_2, iter_37_3 in ipairs(var_37_0) do
			local var_37_1 = BackHomeDormLevelRewardCfg[iter_37_3]

			if var_37_1.type == 2 and var_37_1.reward[1] == arg_37_2 then
				return iter_37_1
			end
		end
	end

	return 1
end

function var_0_0.GetDormLevelByHeroID(arg_38_0, arg_38_1)
	local var_38_0 = DormData:GetHeroArchiveID(arg_38_1)
	local var_38_1 = DormRoomTools:GetDormIDViaArchive(var_38_0)

	return DormitoryData:GetDormLevel(var_38_1) or 0
end

function var_0_0.GetHeroIDByDancePos(arg_39_0, arg_39_1)
	local var_39_0 = DormData:GetHeroInfoList()

	for iter_39_0, iter_39_1 in pairs(var_39_0) do
		if iter_39_1.dancePos == arg_39_1 then
			return iter_39_1:GetHeroId()
		end
	end
end

function var_0_0.GetHeroListInDance(arg_40_0)
	local var_40_0 = {}
	local var_40_1 = DormData:GetHeroInfoList()

	for iter_40_0, iter_40_1 in pairs(var_40_1) do
		if iter_40_1.dancePos then
			table.insert(var_40_0, iter_40_1)
		end
	end

	return var_40_0
end

function var_0_0.GetCanteenFatigueLevel(arg_41_0)
	local var_41_0 = GameDisplayCfg.dorm_hero_fatigue_level.value

	if arg_41_0 <= var_41_0[1] then
		return 1
	elseif arg_41_0 > var_41_0[1] and arg_41_0 <= var_41_0[2] then
		return 2
	else
		return 3
	end
end

return var_0_0
