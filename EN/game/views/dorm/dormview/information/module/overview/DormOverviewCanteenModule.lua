DormOverviewModuleBase = import("game.views.dorm.DormView.Information.Module.overview.DormOverviewModuleBase")

local var_0_0 = class("DormOverviewCanteenModule", DormOverviewModuleBase)

function var_0_0.ModuleName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/item/Infomation/overview/canteenPanel"
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddListener()
	arg_2_0:InitView()
end

function var_0_0.InitView(arg_3_0)
	arg_3_0.heroList = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.heroList[iter_3_0] = DormOverviewCanteenHeroItem.New(arg_3_0["heroItem" .. iter_3_0])
	end

	arg_3_0.scrollHelper = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.taskScroll_, DormOverviewCanteenTaskModule)
	arg_3_0.soldController1 = arg_3_0.foodController1:GetController("soldout")
	arg_3_0.soldController2 = arg_3_0.foodController2:GetController("soldout")
end

function var_0_0.OnEnter(arg_4_0)
	return
end

function var_0_0.AddListener(arg_5_0)
	arg_5_0:AddBtnListenerScale(arg_5_0.awardBtn_, nil, function()
		local var_6_0, var_6_1 = CanteenData:GetAutoNextAwardTime()

		if CanteenData:GetAutoAwardNum() == 0 then
			ShowTips("CANTEEN_ADMITTED_NULL")

			return
		end

		CanteenAction:ReceiveCanteenAutoAward(DormConst.CANTEEN_ID)
	end)
	arg_5_0:AddBtnListenerScale(arg_5_0.menuBtn_, nil, function()
		JumpTools.OpenPageByJump("/chooseSignFoodView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.taskBtnMask, nil, function()
		JumpTools.OpenPageByJump("/dormTaskDispatchView", {
			roomID = DormConst.CANTEEN_ID
		})
	end)
end

function var_0_0.RegisterEvents(arg_9_0)
	arg_9_0:RegistEventListener(DORM_RESTAURANT_UPDATE_FINISH, handler(arg_9_0, arg_9_0.OnRewardUpdate))
	arg_9_0:RegistEventListener(BACKHOME_CATEEN_AWARD_UPDATE, handler(arg_9_0, arg_9_0.OnRewardUpdate))
	arg_9_0:RegistEventListener(BACKHOME_HERO_FATIGUR_REFRESH, handler(arg_9_0, arg_9_0.RenderHeroItem))
end

function var_0_0.Render(arg_10_0)
	arg_10_0:RenderHeroItem()
	arg_10_0:RenderCanteenMenu()
	arg_10_0:RenderAward()
	arg_10_0:RenderTask()
	DormRedPointTools:UpdateCanteenNotify()
end

function var_0_0.RenderHeroItem(arg_11_0)
	arg_11_0.jobList = {}

	for iter_11_0, iter_11_1 in ipairs(DormEnum.RestaurantJobToClientMap) do
		table.insert(arg_11_0.jobList, iter_11_0)
	end

	for iter_11_2 = 1, 3 do
		arg_11_0.heroList[iter_11_2]:RefreshUI(arg_11_0.jobList[iter_11_2])
	end
end

function var_0_0.RenderCanteenMenu(arg_12_0)
	arg_12_0.signFoodList = CanteenFoodData:GetChooseFoodList() or {}

	for iter_12_0 = 1, 2 do
		local var_12_0 = arg_12_0.signFoodList[iter_12_0]

		if var_12_0 then
			SetActive(arg_12_0["foodItem" .. iter_12_0], true)

			arg_12_0["foodIcon" .. iter_12_0].sprite = CanteenTools.GetFoodSprite(var_12_0)

			local var_12_1 = CanteenFoodData:GetSignFoodInfo(var_12_0)

			arg_12_0["soldController" .. iter_12_0]:SetSelectedState(var_12_1.soldNum >= var_12_1.sellNum and "on" or "off")
		else
			SetActive(arg_12_0["foodItem" .. iter_12_0], false)
		end
	end
end

function var_0_0.RenderTask(arg_13_0)
	arg_13_0.taskList = {}

	for iter_13_0, iter_13_1 in ipairs(GameDisplayCfg.canteen_task_id_pos.value) do
		local var_13_0 = CanteenEntrustData:GetEntrustByPos(iter_13_1[2])

		if var_13_0 and var_13_0.id > 0 then
			table.insert(arg_13_0.taskList, var_13_0)
		end
	end

	arg_13_0.scrollHelper:StartScroll(#arg_13_0.taskList)
end

function var_0_0.RenderAward(arg_14_0)
	local var_14_0 = CanteenData:GetAutoAwardNum() or 0
	local var_14_1 = DormSkillData:GetInComeStorageMax()

	arg_14_0.awardNum = var_14_0
	arg_14_0.awardTotalTxt.text = string.format("%d<size=26><color=#767878>/%d</color></size>", var_14_0, var_14_1)
end

function var_0_0.OnRewardUpdate(arg_15_0)
	if (arg_15_0.awardNum or 0) ~= (CanteenData:GetAutoAwardNum() or 0) then
		arg_15_0:RenderAward()
		arg_15_0.awardAnim_:Play("Get")
	end
end

function var_0_0.indexItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.taskList[arg_16_1]

	arg_16_2:Render(var_16_0)
end

function var_0_0.Dispose(arg_17_0)
	arg_17_0.scrollHelper:Dispose()

	for iter_17_0 = 1, 3 do
		arg_17_0.heroList[iter_17_0]:Dispose()
	end

	arg_17_0.heroList = nil

	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
