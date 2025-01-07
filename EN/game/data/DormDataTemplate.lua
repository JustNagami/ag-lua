DormHeroTemplate = class("DormDataTemplate")

function DormHeroTemplate.Ctor(arg_1_0, arg_1_1)
	local var_1_0 = DormHeroTools:GetAllCanUseHeroIDInDorm(arg_1_1.archives_id)[1]

	if not arg_1_1.hero_id then
		if var_1_0 then
			arg_1_0.hero_id = var_1_0
		else
			print(debug.traceback("无可用人物,档案id为" .. arg_1_1.archives_id))

			return
		end
	else
		arg_1_0.hero_id = arg_1_1.hero_id
	end

	arg_1_0.fatigue = arg_1_1.fatigue or GameSetting.canteen_hero_fatigue_max.value[1]
	arg_1_0.feed_times = arg_1_1.feed_times or 0
	arg_1_0.archives_id = arg_1_1.archives_id
	arg_1_0.feedTotalTime = arg_1_1.totalFeedTime or 0

	arg_1_0:InitHeroSkinData(arg_1_1.skinID)
end

function DormHeroTemplate.InitHeroSkinData(arg_2_0, arg_2_1)
	arg_2_0.skinInfo = {}

	local var_2_0 = arg_2_0:GetCanUseHeroList()

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		arg_2_0.skinInfo[iter_2_1] = iter_2_1
	end

	if arg_2_1 then
		for iter_2_2, iter_2_3 in ipairs(arg_2_1) do
			local var_2_1 = iter_2_3.hero_id
			local var_2_2 = iter_2_3.skin_id

			if arg_2_0.skinInfo[var_2_1] then
				arg_2_0.skinInfo[var_2_1] = var_2_2
			else
				print("未找到对应角色")
			end
		end
	end
end

function DormHeroTemplate.InitHeroRoomID(arg_3_0, arg_3_1)
	arg_3_0.roomID = arg_3_1
end

function DormHeroTemplate.Dispose(arg_4_0)
	return
end

function DormHeroTemplate.GetHeroId(arg_5_0)
	if BackHomeHeroCfg[arg_5_0.hero_id] then
		return arg_5_0.hero_id
	else
		local var_5_0 = arg_5_0:GetCanUseHeroList()

		if #var_5_0 > 0 then
			return var_5_0[1]
		end
	end
end

function DormHeroTemplate.GetHeroTotalFeedTime(arg_6_0)
	return arg_6_0.feedTotalTime
end

function DormHeroTemplate.GetRoomID(arg_7_0)
	return arg_7_0.roomID
end

function DormHeroTemplate.SetCurHeroID(arg_8_0, arg_8_1)
	if arg_8_1 == nil then
		arg_8_0.hero_id = nil

		return
	end

	if arg_8_0.archives_id == DormData:GetHeroArchiveID(arg_8_1) then
		arg_8_0.hero_id = arg_8_1
	else
		print("传入角色id不是本档案角色")
	end
end

function DormHeroTemplate.GetHeroCurSkinID(arg_9_0, arg_9_1)
	if arg_9_0.skinInfo then
		if not arg_9_0.skinInfo[arg_9_1] and DormData:GetHeroArchiveID(arg_9_1) == arg_9_0.archives_id and BackHomeHeroCfg[arg_9_1] and HeroTools.GetHeroIsUnlock(arg_9_1) then
			arg_9_0.skinInfo[arg_9_1] = arg_9_1
		end

		if arg_9_0.skinInfo[arg_9_1] then
			return arg_9_0.skinInfo[arg_9_1]
		end
	end

	return arg_9_1
end

function DormHeroTemplate.SetHeroSkinID(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0.skinInfo then
		arg_10_0.skinInfo[arg_10_1] = arg_10_2
	end
end

function DormHeroTemplate.GetCanUseHeroList(arg_11_0)
	return DormHeroTools:GetAllCanUseHeroIDInDorm(arg_11_0.archives_id) or {}
end

function DormHeroTemplate.GetFatigue(arg_12_0)
	return arg_12_0.fatigue
end

function DormHeroTemplate.SetFatigue(arg_13_0, arg_13_1)
	if arg_13_1 < 0 then
		print("设置体力越界")

		return
	end

	arg_13_0.fatigue = arg_13_1
end

function DormHeroTemplate.CalFatigue(arg_14_0, arg_14_1)
	arg_14_0.fatigue = arg_14_0.fatigue + arg_14_1

	if arg_14_0.fatigue < 0 then
		arg_14_0.fatigue = 0
	end
end

function DormHeroTemplate.UpdataHeroState(arg_15_0)
	local var_15_0 = GameSetting.dorm_canteen_work_fatigue.value[1] / 100

	if arg_15_0.fatigue < var_15_0 - var_15_0 % 0.1 and arg_15_0.jobType then
		arg_15_0.jobType = nil

		arg_15_0:BackToDorm()
	end
end

function DormHeroTemplate.GetRecoverFatigueNum(arg_16_0)
	local var_16_0 = arg_16_0:GetHeroState()
	local var_16_1 = 3600 / GameSetting.dorm_fatigue_time.value[1]

	if var_16_0 == DormEnum.DormHeroState.InCanteenEntrust or var_16_0 == DormEnum.DormHeroState.InCanteenJob then
		return 0
	elseif var_16_0 == DormEnum.DormHeroState.OutDorm then
		return GameSetting.dorm_base_fatigue_increase.value[1] / 100
	elseif var_16_0 == DormEnum.DormHeroState.InPublicDorm then
		local var_16_2 = GameSetting.dorm_lobby_fatigue_increase.value[1] / 100
		local var_16_3 = 0

		if arg_16_0.hero_id then
			var_16_3 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverSelfFast, arg_16_0.hero_id)
			var_16_3 = var_16_3 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverAllFast, arg_16_0.hero_id)
		end

		return var_16_2 * ((100 + var_16_3) / 100) * var_16_1
	elseif var_16_0 == DormEnum.DormHeroState.InPrivateDorm then
		local var_16_4 = DormHeroTools:GetDormLevelByHeroID(arg_16_0.archives_id)
		local var_16_5 = GameSetting.dorm_fatigue_increase.value[var_16_4][2] / 100
		local var_16_6 = 0

		if arg_16_0.hero_id then
			var_16_6 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverSelfFast, arg_16_0.hero_id)
			var_16_6 = var_16_6 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverAllFast, arg_16_0.hero_id)
		end

		return var_16_5 * ((100 + var_16_6) / 100) * var_16_1
	elseif var_16_0 == DormEnum.DormHeroState.InIdolTraineeCamp then
		if arg_16_0.roomID then
			local var_16_7 = DormHeroTools:GetDormLevelByHeroID(arg_16_0.archives_id)
			local var_16_8 = GameSetting.dorm_fatigue_increase.value[var_16_7][2] / 100
			local var_16_9 = 0

			if arg_16_0.hero_id then
				var_16_9 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverSelfFast, arg_16_0.hero_id)
				var_16_9 = var_16_9 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverAllFast, arg_16_0.hero_id)
			end

			return var_16_8 * ((100 + var_16_9) / 100) * var_16_1
		else
			local var_16_10 = GameSetting.dorm_lobby_fatigue_increase.value[1] / 100
			local var_16_11 = 0

			if arg_16_0.hero_id then
				var_16_11 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverSelfFast, arg_16_0.hero_id)
				var_16_11 = var_16_11 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.FatigueRecoverAllFast, arg_16_0.hero_id)
			end

			return var_16_10 * ((100 + var_16_11) / 100) * var_16_1
		end
	else
		return 0
	end

	print("人物处于未知状态")
end

function DormHeroTemplate.GetCurRoomID(arg_17_0)
	local var_17_0 = arg_17_0:GetHeroState()

	if var_17_0 == DormEnum.DormHeroState.InCanteenEntrust or var_17_0 == DormEnum.DormHeroState.InCanteenJob then
		return DormConst.CANTEEN_ID
	end

	if var_17_0 == DormEnum.DormHeroState.InPublicDorm then
		return DormConst.PUBLIC_DORM_ID
	elseif var_17_0 == DormEnum.DormHeroState.InPrivateDorm then
		return DormRoomTools:GetDormIDViaArchive(arg_17_0.archives_id)
	end

	return nil
end

function DormHeroTemplate.GetHeroState(arg_18_0)
	local var_18_0 = DormRoomTools:GetDormIDViaArchive(arg_18_0.archives_id)

	if arg_18_0.dancePos then
		return DormEnum.DormHeroState.InIdolTraineeCamp
	end

	if CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_18_0.archives_id) then
		return DormEnum.DormHeroState.InCanteenEntrust
	end

	if arg_18_0.jobType then
		return DormEnum.DormHeroState.InCanteenJob
	end

	local var_18_1 = DormConst.PUBLIC_DORM_ID

	if var_18_1 then
		local var_18_2 = DormData:GetDormSceneData(var_18_1)

		for iter_18_0, iter_18_1 in ipairs(var_18_2.archiveIDList) do
			if iter_18_1 == arg_18_0.archives_id then
				return DormEnum.DormHeroState.InPublicDorm
			end
		end

		if var_18_0 then
			return DormEnum.DormHeroState.InPrivateDorm
		end

		return DormEnum.DormHeroState.OutDorm
	end
end

function DormHeroTemplate.GetHeroFavorability(arg_19_0)
	return ArchiveData:GetArchive(arg_19_0.archives_id).lv
end

function DormHeroTemplate.GetGiftNum(arg_20_0, arg_20_1)
	local var_20_0 = DormRoomTools:GetDormIDViaArchive(arg_20_0.archives_id)
	local var_20_1 = DormitoryData:GetDormSceneData(var_20_0)

	if var_20_1 and var_20_1.give_furnitures then
		return var_20_1.give_furnitures[arg_20_1] or 0
	else
		return 0
	end
end

function DormHeroTemplate.GetCanGiftNum(arg_21_0, arg_21_1)
	local var_21_0 = 0

	if DormRoomTools:GetDormIDViaArchive(arg_21_0.archives_id) then
		local var_21_1 = arg_21_0:GetGiftNum(arg_21_1)
		local var_21_2 = DormData:GetFurNumInfo(arg_21_1).num
		local var_21_3 = DormData:GetFurNumInfo(arg_21_1).give_num
		local var_21_4 = BackHomeFurniture[arg_21_1].give_max

		if DormSpecialFurnitureTools:JudgeFurIsSpecialType(arg_21_1) then
			var_21_4 = 1
		end

		var_21_0 = math.min(var_21_2 - var_21_3, var_21_4 - var_21_1)

		if var_21_0 < 0 then
			var_21_0 = 0
		end
	end

	return var_21_0
end

function DormHeroTemplate.GetCanBuyAndGiftNum(arg_22_0, arg_22_1)
	local var_22_0 = 0

	if DormRoomTools:GetDormIDViaArchive(arg_22_0.archives_id) then
		local var_22_1 = arg_22_0:GetGiftNum(arg_22_1)
		local var_22_2 = BackHomeFurniture[arg_22_1].give_max

		if DormSpecialFurnitureTools:JudgeFurIsSpecialType(arg_22_1) then
			var_22_2 = 1
		end

		var_22_0 = math.min(var_22_2, var_22_2 - var_22_1)

		if var_22_0 < 0 then
			var_22_0 = 0
		end
	end

	return var_22_0
end

function DormHeroTemplate.CheckCanFeedFood(arg_23_0)
	if arg_23_0.feed_times >= GameSetting.dorm_feed_max.value[1] then
		return false, "feedTime"
	end

	if arg_23_0.fatigue > GameSetting.canteen_hero_fatigue_max.value[1] then
		return false, "fatigue"
	end

	if DormHeroTools:GetDormLevelByHeroID(arg_23_0.archives_id) < GameSetting.dorm_menu_feed_unlock.value[1] then
		return false, "unlock"
	end

	return true
end

function DormHeroTemplate.ResetFeedTime(arg_24_0)
	arg_24_0.feed_times = 0
end

local function var_0_0(arg_25_0)
	if type(arg_25_0) == "number" then
		return arg_25_0, 1
	else
		return arg_25_0[1], arg_25_0[2]
	end
end

function DormHeroTemplate.PickInteractAction(arg_26_0)
	if arg_26_0 and next(arg_26_0) then
		local var_26_0 = 0

		for iter_26_0, iter_26_1 in ipairs(arg_26_0) do
			local var_26_1, var_26_2 = var_0_0(iter_26_1)

			var_26_0 = var_26_0 + var_26_2
		end

		local var_26_3 = math.random() * var_26_0

		for iter_26_2, iter_26_3 in ipairs(arg_26_0) do
			local var_26_4, var_26_5 = var_0_0(iter_26_3)

			var_26_3 = var_26_3 - var_26_5

			if var_26_3 < 0 then
				return var_26_4
			end
		end
	end

	return nil
end

function DormHeroTemplate.FeedFood(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_1 and not Dorm.DormEntityManager.TestDuringInteract(arg_27_1, true) then
		local var_27_0

		if arg_27_2 then
			Dorm.DormEntityManager.SendInteractToEntityCMD(arg_27_1, arg_27_1, arg_27_2, false)

			local var_27_1 = DormInteractSequence[arg_27_2].name
			local var_27_2 = DormCharacterInteractBehaviour.GetSequence(arg_27_1, nil, var_27_1)

			if var_27_2 then
				var_27_0 = var_27_2.duration
			end
		end

		DormUtils.ClearSingleSpecialVfx(arg_27_1, DormEnum.SpecialVfx.Hungry)

		return var_27_0
	end
end

function DormHeroTemplate.FeedFoodTime(arg_28_0, arg_28_1)
	arg_28_0.feed_times = arg_28_0.feed_times + arg_28_1
	arg_28_0.feedTotalTime = arg_28_0.feedTotalTime + arg_28_1
end

function DormHeroTemplate.GiftFur(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if arg_29_1 and arg_29_2 then
		local var_29_0 = DormRoomTools:GetDormIDViaArchive(arg_29_0.archives_id)
		local var_29_1 = DormData:GetDormSceneData(var_29_0)

		if not var_29_1.give_furnitures then
			var_29_1.give_furnitures = {}
		end

		if not var_29_1.give_furnitures[arg_29_1] then
			var_29_1.give_furnitures[arg_29_1] = 0
		end

		var_29_1.give_furnitures[arg_29_1] = var_29_1.give_furnitures[arg_29_1] + arg_29_2

		local var_29_2 = DormData:GetFurnitureInfoList()

		var_29_2[arg_29_1].give_num = var_29_2[arg_29_1].give_num + arg_29_2

		if var_29_2[arg_29_1].give_num > var_29_2[arg_29_1].num then
			print("家具礼物数量大于拥有数量")
		end

		if arg_29_3 then
			local var_29_3 = GameDisplayCfg.dorm_interaction_gift.value
			local var_29_4 = DormHeroTemplate.PickInteractAction(var_29_3)

			Dorm.DormEntityManager.SendInteractToEntityCMD(arg_29_3, arg_29_3, var_29_4, false)
		end
	else
		Debug.LogError("赠送家具id或数量为空")
	end
end

function DormHeroTemplate.TouchHero(arg_30_0, arg_30_1, arg_30_2)
	Dorm.DormEntityManager.SendInteractToEntityCMD(arg_30_1, arg_30_1, arg_30_2, false)

	if arg_30_0.hero_id then
		SDKTools.SendMessageToSDK("backhome_dorm_stroke", {
			hero_id = arg_30_0.hero_id
		})
	end

	local var_30_0 = DormInteractSequence[arg_30_2].name
	local var_30_1 = DormCharacterInteractBehaviour.GetSequence(arg_30_1, nil, var_30_0)
	local var_30_2

	if var_30_1 then
		var_30_2 = var_30_1.duration
	end

	return var_30_2
end

function DormHeroTemplate.BackToDorm(arg_31_0)
	local var_31_0 = arg_31_0:GetHeroState()

	arg_31_0.jobType = nil
	arg_31_0.dancePos = nil

	if var_31_0 == DormEnum.DormHeroState.InPublicDorm or var_31_0 == DormEnum.DormHeroState.InPrivateDorm then
		return
	end

	local var_31_1 = DormRoomTools:GetDormIDViaArchive(arg_31_0.archives_id)
	local var_31_2 = DormitoryData:GetDormSceneData(DormConst.PUBLIC_DORM_ID)

	if var_31_2 then
		local var_31_3 = var_31_2.archiveIDList

		if var_31_3 then
			local var_31_4 = #var_31_3

			if not var_31_1 and var_31_4 < GameSetting.dorm_lobby_hero_max.value[1] then
				table.insert(var_31_3, arg_31_0.archives_id)
			end
		end

		arg_31_0:ResetHeroSkill()
		CanteenHeroTools:RefreshCanteenJobList()
	end

	arg_31_0:ResetHeroSkill()
end

function DormHeroTemplate.GoToCanteen(arg_32_0)
	arg_32_0.dancePos = nil

	local var_32_0 = DormitoryData:GetDormSceneData(DormConst.PUBLIC_DORM_ID).archiveIDList

	if #var_32_0 > 0 then
		for iter_32_0 = 1, #var_32_0 do
			if var_32_0[iter_32_0] == arg_32_0.archives_id then
				table.remove(var_32_0, iter_32_0)

				break
			end
		end
	end

	arg_32_0:ResetHeroSkill()
end

function DormHeroTemplate.GoToDance(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:GetHeroState()

	if var_33_0 == DormEnum.DormHeroState.InCanteenEntrust or var_33_0 == DormEnum.DormHeroState.InCanteenJob then
		return
	end

	if arg_33_1 and var_33_0 == DormEnum.DormHeroState.InPublicDorm then
		local var_33_1 = DormitoryData:GetDormSceneData(DormConst.PUBLIC_DORM_ID).archiveIDList

		if #var_33_1 > 0 then
			for iter_33_0 = 1, #var_33_1 do
				if var_33_1[iter_33_0] == arg_33_0.archives_id then
					table.remove(var_33_1, iter_33_0)

					break
				end
			end
		end
	end

	arg_33_0.dancePos = arg_33_1

	if not arg_33_0.dancePos then
		arg_33_0:BackToDorm()
	end

	arg_33_0:ResetHeroSkill()
end

function DormHeroTemplate.DisposeRunSkill(arg_34_0)
	if arg_34_0.hero_id then
		if not BackHomeHeroCfg[arg_34_0.hero_id] then
			return
		end

		local var_34_0 = BackHomeHeroCfg[arg_34_0.hero_id].skill_list

		for iter_34_0, iter_34_1 in ipairs(var_34_0) do
			if DormSkillData:CheckSkillIsRun(arg_34_0.hero_id, iter_34_1, DormEnum.EntityType.Character) then
				DormSkillData:DisposeSkillComponent(arg_34_0.hero_id, iter_34_1, DormEnum.EntityType.Character)
			end
		end
	end
end

function DormHeroTemplate.OpenHeroSkill(arg_35_0)
	if arg_35_0.hero_id then
		local var_35_0 = BackHomeHeroCfg[arg_35_0.hero_id].skill_list
		local var_35_1 = GameSetting.dorm_hero_skill_unlock.value
		local var_35_2 = {}
		local var_35_3 = HeroData:GetHeroData(arg_35_0.hero_id).level

		for iter_35_0 = 1, #var_35_0 do
			if var_35_3 >= var_35_1[iter_35_0] then
				table.insert(var_35_2, var_35_0[iter_35_0])
			end
		end

		for iter_35_1, iter_35_2 in ipairs(var_35_2) do
			if DormSkillData:CheckSkillIsOpen(arg_35_0.hero_id, iter_35_2, DormEnum.EntityType.Character) then
				DormSkillData:AddSkillComponent(arg_35_0.hero_id, iter_35_2, DormEnum.EntityType.Character)
			end
		end
	end
end

function DormHeroTemplate.ResetHeroSkill(arg_36_0)
	arg_36_0:DisposeRunSkill()
	arg_36_0:OpenHeroSkill()
end

function DormHeroTemplate.SetJob(arg_37_0, arg_37_1)
	arg_37_0.jobType = arg_37_1
end

function DormHeroTemplate.InitDanceTrainData(arg_38_0, arg_38_1)
	if not arg_38_0.property then
		arg_38_0.property = {}
	end

	arg_38_0.property[arg_38_1.hero_id] = IdolTraineeData.ParseIdolProperty(arg_38_1.attribute_list, arg_38_1.hero_id)
end

function DormHeroTemplate.UpdataDanceTrainData(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_2.hero_id

	if not arg_39_0.property and BackHomeHeroCfg[var_39_0].idol_usable == 1 then
		arg_39_0:InitDanceTrainData({
			hero_id = var_39_0
		})
	end

	arg_39_0.property[var_39_0][arg_39_2.attribute_index] = arg_39_1.attribute_value
end

function DormHeroTemplate.GetDanceProperty(arg_40_0, arg_40_1)
	if arg_40_1 then
		local var_40_0 = arg_40_1 or arg_40_0.hero_id

		if not arg_40_0.property then
			arg_40_0:InitDanceTrainData({
				hero_id = var_40_0
			})
		end

		return arg_40_0.property[var_40_0]
	end
end

DormRoomTemplate = class("DormRoomTemplate")

function DormRoomTemplate.Ctor(arg_41_0, arg_41_1)
	arg_41_0.id = arg_41_1.id
	arg_41_0.type = arg_41_1.type
	arg_41_0.name = arg_41_1.name
	arg_41_0.posID = arg_41_1.pos
	arg_41_0.furnitureInfoS = arg_41_1.furnitureInfoS
	arg_41_0.specialFur = arg_41_1.specialFur
end

function DormRoomTemplate.GetDormTemplateFurList(arg_42_0)
	if arg_42_0.furnitureInfoS then
		return arg_42_0.furnitureInfoS
	else
		print("模板家具列表为空")
	end
end

function DormRoomTemplate.GetDormTemplateType(arg_43_0)
	if arg_43_0.type then
		return arg_43_0.type
	end

	print("模板家具类型为空")
end

function DormRoomTemplate.GetDormTemplateFurNumInfo(arg_44_0)
	local var_44_0 = 0
	local var_44_1 = {}

	if arg_44_0.furnitureInfoS then
		for iter_44_0 = 0, arg_44_0.furnitureInfoS.Length - 1 do
			var_44_0 = var_44_0 + 1

			local var_44_2 = arg_44_0.furnitureInfoS[iter_44_0]

			if not var_44_1[var_44_2.id] then
				var_44_1[var_44_2.id] = 0
			end

			var_44_1[var_44_2.id] = var_44_1[var_44_2.id] + 1
		end
	end

	for iter_44_1, iter_44_2 in pairs(arg_44_0.specialFur) do
		var_44_1[iter_44_2] = 1
	end

	return var_44_0 + DormConst.DORM_SPECIAL_FURNITURE_NUM, var_44_1
end

function DormRoomTemplate.ReviseFurTemplateNameInfo(arg_45_0, arg_45_1)
	arg_45_0.name = arg_45_1
end

function DormRoomTemplate.GetTemplateName(arg_46_0)
	return arg_46_0.name
end

function DormRoomTemplate.GetTemplateWallAndFloorInfo(arg_47_0)
	return arg_47_0.specialFur
end

function DormRoomTemplate.Dispose(arg_48_0)
	arg_48_0.id = nil
	arg_48_0.type = nil
	arg_48_0.name = nil
	arg_48_0.posID = nil
	arg_48_0.furnitureInfoS = nil
	arg_48_0.specialFur = nil
	arg_48_0.hasHit = false
end
