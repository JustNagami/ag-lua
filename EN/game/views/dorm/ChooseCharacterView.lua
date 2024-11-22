local var_0_0 = class("ChooseCharacterView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/canteen/EmptyDreamHreoTaskPop"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.characterScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexCharacter), arg_4_0.characteruilistUilist_, CharacterItem)
	arg_4_0.recomendScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexRecommendClass), arg_4_0.recuilistUilist_, DormRecommendBigItem)
end

function var_0_0.RegisterEvent(arg_5_0)
	arg_5_0:RegistEventListener(DORM_REFRESH_DISPATCH_LIST, function()
		arg_5_0.characterScroll_:Refresh()
		arg_5_0.recomendScroll_:Refresh()
		arg_5_0:UpdateSuccess()
		arg_5_0:UpdataDispatchNum()
		arg_5_0:UpdataNeedFatigue()
	end)
	arg_5_0:RegistEventListener(BACKHOME_HERO_FATIGUR_REFRESH, function()
		arg_5_0.characterScroll_:Refresh()
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0:RegisterEvent()
	arg_8_0:UpdateItemData()
	arg_8_0:UpdataRecItem()
	arg_8_0:UpdataDispatchNum()
	arg_8_0:UpdataNeedFatigue()
	arg_8_0.characterScroll_:StartScroll(#arg_8_0.itemList_)
	arg_8_0.recomendScroll_:StartScroll(#arg_8_0.reList_)

	arg_8_0.successnumText_.text = 0
	arg_8_0.tasknmaeText_.text = GetI18NText(BackHomeCanteenTaskCfg[CanteenEntrustData:GetCurDispatchTask().id].name)
end

function var_0_0.indexCharacter(arg_9_0, arg_9_1, arg_9_2)
	arg_9_2:RegistCallBack(function(arg_10_0, arg_10_1)
		local var_10_0 = DormData:GetHeroTemplateInfo(arg_10_0)

		if CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_10_0) == true or var_10_0.jobType then
			ShowTips("CANTEEN_TASK_CANT_CHOOSE")

			return
		end

		if DormData:GetHeroFatigue(arg_10_0) < GameSetting.dorm_canteen_work_fatigue.value[1] / 100 then
			ShowTips("CANTEEN_HERO_FATIGUE_NULL")

			return
		end

		if #CanteenEntrustData:GetDispatchCharacterList() <= DormConst.CANTEEN_TRUST_CHARACTER_NUM and CanteenEntrustData:CheckDispatchCharacterList(arg_10_0) == false then
			CanteenEntrustData:SetDispatchCharacterList(arg_10_0)
			arg_10_1:SetSelectedState("select")
		elseif CanteenEntrustData:CheckDispatchCharacterList(arg_10_0) == true then
			CanteenEntrustData:RemoveDispatchCharacterList(arg_10_0)
			arg_10_1:SetSelectedState("normal")
		end

		manager.notify:Invoke(DORM_REFRESH_DISPATCH_LIST)
	end)
	arg_9_2:RegistFullListCallBack(function(arg_11_0, arg_11_1)
		if #CanteenEntrustData:GetDispatchCharacterList() == BackHomeCanteenTaskCfg[CanteenEntrustData:GetCurDispatchTask().id].need[2] then
			if not CanteenEntrustData:CheckDispatchCharacterList(arg_11_0) then
				if not CanteenEntrustData:CheckDispatchCharacterArchiveList(arg_11_0) then
					arg_11_1:SetSelectedState("full")
				else
					arg_11_1:SetSelectedState("normal")
				end
			else
				arg_11_1:SetSelectedState("select")
			end
		elseif not CanteenEntrustData:CheckDispatchCharacterList(arg_11_0) then
			arg_11_1:SetSelectedState("normal")
		else
			arg_11_1:SetSelectedState("select")
		end
	end)
	arg_9_2:RefreshUI(arg_9_0.itemList_[arg_9_1])
end

function var_0_0.indexRecommendClass(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:RefreshUI(arg_12_0.reList_[arg_12_1])
end

function var_0_0.AddUIListener(arg_13_0)
	arg_13_0:AddBtnListener(arg_13_0.battlebtnBtn_, nil, function()
		local var_14_0 = CanteenEntrustData:GetCurDispatchTask()
		local var_14_1 = CanteenEntrustData:GetDispatchCharacterList()

		if #var_14_1 < BackHomeCanteenTaskCfg[var_14_0.id].need[1] then
			ShowTips(string.format(GetTips("CANTEEN_TASK_NOT_CHOOSE"), BackHomeCanteenTaskCfg[var_14_0.id].need[1]))

			return false
		end

		local var_14_2 = 0

		for iter_14_0, iter_14_1 in ipairs(var_14_1) do
			var_14_2 = var_14_2 + DormData:GetHeroFatigue(iter_14_1)
		end

		if var_14_2 < arg_13_0.fatigue then
			ShowTips("CANTEEN_TASK_FATIGUE_NOT_ENOUGH")

			return false
		end

		CanteenEntrustData:ConfirmEntrustList()
		JumpTools.OpenPageByJump("/dormTaskDispatchView")
		ShowTips("CANTEEN_TASK_DISPATCH")
	end)
	arg_13_0:AddBtnListener(arg_13_0.bgmaskBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_13_0:AddBtnListener(arg_13_0.quickBtn_, nil, function()
		local var_16_0 = CanteenEntrustData:GetCurDispatchTask()

		CanteenEntrustData:ClearDispatchCharacterList()

		arg_13_0.autoHeroList = {}

		for iter_16_0 = DormConst.DORM_HERO_TAG_MAX, 0, -1 do
			arg_13_0.autoHeroList[iter_16_0] = {}
		end

		local var_16_1 = CanteenEntrustData:GetEntrustByPos(var_16_0.pos).tags

		for iter_16_1, iter_16_2 in ipairs(arg_13_0.itemList_) do
			repeat
				if GameSetting.dorm_canteen_work_fatigue.value[1] / 100 > DormData:GetHeroFatigue(iter_16_2) then
					break
				end

				local var_16_2 = DormData:GetHeroTemplateInfo(iter_16_2)

				if CanteenEntrustData:CheckHasChooseEntrustCharacter(iter_16_2) == true or var_16_2.jobType then
					break
				end

				local var_16_3 = CanteenEntrustData:CalHeroMatchNum(iter_16_2, var_16_1) + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustExternSucceedAdd, iter_16_2) / BackHomeCanteenTaskCfg[CanteenEntrustData:GetCurDispatchTask().id].tag_success

				if var_16_3 > DormConst.DORM_HERO_TAG_MAX then
					var_16_3 = DormConst.DORM_HERO_TAG_MAX
				end

				if not arg_13_0.autoHeroList[var_16_3] then
					arg_13_0.autoHeroList[var_16_3] = {}
				end

				table.insert(arg_13_0.autoHeroList[var_16_3], iter_16_2)
			until true
		end

		for iter_16_3, iter_16_4 in pairs(arg_13_0.autoHeroList) do
			if #iter_16_4 > 0 then
				CommonTools.UniversalSortEx(iter_16_4, {
					map = function(arg_17_0)
						return (DormData:GetHeroFatigue(arg_17_0))
					end
				})
			end
		end

		local var_16_4 = BackHomeCanteenTaskCfg[var_16_0.id].need[2]
		local var_16_5 = {}
		local var_16_6 = BackHomeCanteenTaskCfg[var_16_0.id].cost

		arg_13_0.trackFlag = false
		arg_13_0.fatigueNum = var_16_6
		arg_13_0.fatigueNum = 0

		arg_13_0:BackTrack(var_16_5, var_16_4, DormConst.DORM_HERO_TAG_MAX, 1, var_16_6)

		if #var_16_5 == 0 then
			ShowTips(GetTips("DORM_CANTEEN_TASK_CANT_FIT"))
			manager.notify:Invoke(DORM_REFRESH_DISPATCH_LIST)

			return
		end

		for iter_16_5, iter_16_6 in ipairs(var_16_5) do
			CanteenEntrustData:SetDispatchCharacterList(iter_16_6)
		end

		manager.notify:Invoke(DORM_REFRESH_DISPATCH_LIST)
	end)
end

function var_0_0.BackTrack(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5)
	if arg_18_2 == 0 then
		if arg_18_5 <= 0 then
			arg_18_0.trackFlag = true
		end

		return
	end

	for iter_18_0 = arg_18_3, 0, -1 do
		repeat
			if #arg_18_0.autoHeroList[iter_18_0] == 0 or #arg_18_0.autoHeroList[iter_18_0] > 0 and arg_18_4 > #arg_18_0.autoHeroList[iter_18_0] then
				if iter_18_0 == 0 and arg_18_5 <= 0 then
					arg_18_0.trackFlag = true

					return
				end

				arg_18_4 = 1

				break
			end

			arg_18_4 = 1

			for iter_18_1 = arg_18_4, #arg_18_0.autoHeroList[iter_18_0] do
				local var_18_0 = arg_18_0.autoHeroList[iter_18_0][iter_18_1]

				if var_18_0 then
					repeat
						local var_18_1 = HeroRecordCfg.get_id_list_by_hero_id[var_18_0][1]
						local var_18_2 = false

						for iter_18_2, iter_18_3 in ipairs(arg_18_1) do
							if var_18_1 == HeroRecordCfg.get_id_list_by_hero_id[iter_18_3][1] then
								var_18_2 = true

								break
							end
						end

						if var_18_2 then
							break
						end

						local var_18_3 = DormData:GetHeroFatigue(var_18_0)

						table.insert(arg_18_1, var_18_0)

						local var_18_4 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustTotalFatigueReduce, var_18_0)
						local var_18_5 = arg_18_0.fatigueNum - math.ceil(arg_18_0.fatigueNum * (100 - var_18_4) / 100)

						arg_18_0:BackTrack(arg_18_1, arg_18_2 - 1, iter_18_0, iter_18_1 + 1, arg_18_5 - var_18_3 - var_18_5)

						if arg_18_0.trackFlag then
							do return end

							break
						end

						table.remove(arg_18_1, #arg_18_1)
					until true
				end
			end
		until true
	end
end

function var_0_0.UpdateItemData(arg_19_0)
	arg_19_0.itemList_ = DormHeroTools:GetUnLockBackHomeHeroIDList()

	CommonTools.UniversalSortEx(arg_19_0.itemList_, {
		ascend = true,
		map = function(arg_20_0)
			local var_20_0 = DormData:GetHeroTemplateInfo(arg_20_0)

			if (CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_20_0) or var_20_0.jobType ~= nil) == false then
				return 1
			else
				return 2
			end
		end
	}, {
		map = function(arg_21_0)
			return DormData:GetHeroFatigue(arg_21_0)
		end
	}, {
		map = function(arg_22_0)
			return (DormData:GetHeroArchiveID(arg_22_0))
		end
	}, {
		map = function(arg_23_0)
			return arg_23_0
		end
	})
end

function var_0_0.UpdataRecItem(arg_24_0)
	local var_24_0 = CanteenEntrustData:GetCurDispatchTask().pos

	arg_24_0.reList_ = {}

	local var_24_1 = CanteenEntrustData:GetEntrustList()[var_24_0]

	for iter_24_0 = 1, #var_24_1.tags do
		local var_24_2 = {
			type = var_24_1.tags[iter_24_0].type,
			tag = var_24_1.tags[iter_24_0].tag
		}

		table.insert(arg_24_0.reList_, var_24_2)
	end

	arg_24_0.recomendScroll_:StartScroll(#arg_24_0.reList_)

	arg_24_0.recuilistUilist_:GetComponent("ScrollRectEx").horizontal = false
end

function var_0_0.UpdateSuccess(arg_25_0)
	local var_25_0 = CanteenEntrustData:CalculateEntrustSuccess()

	arg_25_0.successnumText_.text = var_25_0 .. "%"
end

function var_0_0.UpdataDispatchNum(arg_26_0)
	local var_26_0 = CanteenEntrustData:GetCurDispatchTask().id
	local var_26_1 = BackHomeCanteenTaskCfg[var_26_0].need[2]
	local var_26_2 = #CanteenEntrustData:GetDispatchCharacterList()

	arg_26_0.numText_.text = string.format("%d<size=28><color=#767878>/%d</color></size>", var_26_2, var_26_1)
end

function var_0_0.UpdataNeedFatigue(arg_27_0)
	local var_27_0 = CanteenEntrustData:GetDispatchCharacterList()
	local var_27_1 = 0

	if var_27_0 then
		for iter_27_0, iter_27_1 in ipairs(var_27_0) do
			var_27_1 = var_27_1 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustTotalFatigueReduce, iter_27_1)
		end

		if var_27_1 > 100 then
			var_27_1 = 100
		end
	end

	local var_27_2 = BackHomeCanteenTaskCfg[CanteenEntrustData:GetCurDispatchTask().id]

	arg_27_0.fatigue = math.ceil(var_27_2.cost * (100 - var_27_1) / 100)
	arg_27_0.resourcetextText_.text = arg_27_0.fatigue
end

function var_0_0.OnExit(arg_28_0)
	CanteenEntrustData:ClearDispatchCharacterList()
	arg_28_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_29_0)
	if arg_29_0.characterScroll_ then
		arg_29_0.characterScroll_:Dispose()
	end

	if arg_29_0.recomendScroll_ then
		arg_29_0.recomendScroll_:Dispose()
	end

	var_0_0.super.Dispose(arg_29_0)
end

return var_0_0
