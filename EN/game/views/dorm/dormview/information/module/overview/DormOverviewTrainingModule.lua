﻿DormOverviewModuleBase = import("game.views.dorm.DormView.Information.Module.overview.DormOverviewModuleBase")

local var_0_0 = class("DormOverviewTrainingModule", DormOverviewModuleBase)

function var_0_0.ModuleName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/item/Infomation/overview/trainingPanel"
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddListener()
	arg_2_0:InitView()
end

function var_0_0.InitView(arg_3_0)
	arg_3_0.items = {}

	for iter_3_0 = 1, 5 do
		table.insert(arg_3_0.items, DormInfomationHeroItem.New(arg_3_0["heroItem" .. iter_3_0]))
		arg_3_0.items[iter_3_0]:RegistCallBack(function(arg_4_0)
			arg_3_0:OnHeroItemClick(arg_4_0)
		end)
	end
end

function var_0_0.OnHeroItemClick(arg_5_0, arg_5_1)
	JumpTools.OpenPageByJump("/dormInfomationTrainSetHeroView", {
		state = "train"
	})
end

function var_0_0.AddListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.goBtn_, nil, function()
		IdolTraineeData:SetLastJumpContext({
			trainView = true,
			backToDormInfo = true
		})
		BackHomeTools:GotoBackHomeRoom(nil, true)
	end)
	arg_6_0:AddBtnListener(arg_6_0.imgGoBtn_, nil, function()
		IdolTraineeData:SetLastJumpContext({
			trainView = true,
			backToDormInfo = true
		})
		BackHomeTools:GotoBackHomeRoom(nil, true)
	end)
end

function var_0_0.RegisterEvents(arg_9_0)
	arg_9_0:RegistEventListener(BACKHOME_HERO_FATIGUR_REFRESH, handler(arg_9_0, arg_9_0.Render))
end

function var_0_0.Render(arg_10_0)
	local var_10_0 = IdolTraineeData:GetHeroPosList()

	for iter_10_0 = 1, 5 do
		if var_10_0[iter_10_0] then
			arg_10_0.items[iter_10_0]:SetData({
				heroID = var_10_0[iter_10_0]
			})
		else
			arg_10_0.items[iter_10_0]:SetData(nil)
		end
	end

	local var_10_1 = IdolTraineeTools:GetCurTrainMaxTimes()
	local var_10_2 = IdolTraineeData:GetCurTrainTimes()

	arg_10_0.todayTimes_.text = var_10_1 - var_10_2 .. "/" .. var_10_1
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0 = 1, 5 do
		arg_11_0.items[iter_11_0]:Dispose()
	end

	arg_11_0.items = nil

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
