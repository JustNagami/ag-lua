﻿local var_0_0 = class("BackHomeEnterView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/BackHouseUI/BackHouseUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListenerScale(arg_6_0.canteenBtn_, nil, function()
		if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.Canteen then
			CanteenTools:SwitchCanteenBgm(DormEnum.RestaurantMode.Start)
			JumpTools.OpenPageByJump("/restaurantMain")
		else
			local var_7_0 = GameDisplayCfg.dorm_restaurant_begin_story.value[1]

			if var_7_0 and not manager.story:IsStoryPlayed(var_7_0) then
				manager.story:StartStoryById(var_7_0, function(arg_8_0)
					BackHomeTools:GotoBackHomeRoom(DormConst.CANTEEN_ID)
				end)
			else
				BackHomeTools:GotoBackHomeRoom(DormConst.CANTEEN_ID)
			end
		end
	end)
	arg_6_0:AddBtnListenerScale(arg_6_0.dormBtn_, nil, function()
		JumpTools.OpenPageByJump("/dormChooseRoomView")
	end)
	arg_6_0:AddBtnListenerScale(arg_6_0.lockBtn_, nil, function()
		return
	end)
end

function var_0_0.OnEnter(arg_11_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.Main then
			JumpTools.OpenPageByJump("/home")
		else
			BackHomeTools:BackHomeGotoMain()
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.Main then
			JumpTools.OpenPageByJump("/home")
		else
			BackHomeTools:BackHomeGotoMain()
		end
	end)
	manager.redPoint:bindUIandKey(arg_11_0.dormBtn_.transform, RedPointConst.DORM)
	manager.redPoint:bindUIandKey(arg_11_0.canteenBtn_.transform, RedPointConst.CANTEEN)
end

function var_0_0.OnExit(arg_14_0)
	manager.windowBar:HideBar()
	manager.redPoint:unbindUIandKey(arg_14_0.dormBtn_.transform, RedPointConst.DORM)
	manager.redPoint:unbindUIandKey(arg_14_0.canteenBtn_.transform, RedPointConst.CANTEEN)
end

function var_0_0.Dispose(arg_15_0)
	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
