SectionBaseView = import("game.views.sectionInfo.SectionInfoBaseView")

local var_0_0 = class("BlisterChapterSectionInfoView", ReduxView)

function var_0_0.Init(arg_1_0)
	arg_1_0:InitUI()

	arg_1_0.nodeList = {}

	arg_1_0:AddListeners()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.lockControl = arg_2_0.btnControllerexcollection_:GetController("lock")
	arg_2_0.sectionControl = arg_2_0.sububbleinfouiControllerexcollection_:GetController("section")
end

function var_0_0.UIParent(arg_3_0)
	return manager.ui.uiMain.transform
end

function var_0_0.UIName(arg_4_0)
	return "Widget/System/Summer2024/Summer2024_Bubble/SUBubbleInfoUI"
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.battleBtn_, nil, function()
		arg_5_0:Back()
		arg_5_0:OnClickBtn()
	end)
	arg_5_0:AddBtnListener(arg_5_0.backBtn_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.id = arg_8_0.params_.id

	var_0_0.super.OnEnter(arg_8_0)
	arg_8_0:RefreshData()
end

function var_0_0.RefreshData(arg_9_0)
	local var_9_0 = arg_9_0.params_.id
	local var_9_1 = ActivityBubbleCfg[var_9_0]

	if var_9_1 then
		local var_9_2 = BlisterGameData:GetStageInfo(var_9_0)

		arg_9_0.textcheckpointnameText_.text = var_9_1.name

		for iter_9_0 = 1, 3 do
			if not arg_9_0.nodeList[iter_9_0] then
				arg_9_0.nodeList[iter_9_0] = BlisterGoalItem.New(arg_9_0[string.format("ndnum0%sGo_", iter_9_0)])
			end

			isGet = var_9_2 and iter_9_0 <= var_9_2.star or false

			arg_9_0.nodeList[iter_9_0]:SetData(isGet, var_9_1.score_level[iter_9_0] or 0)
		end

		arg_9_0.lockControl:SetSelectedState(BlisterGameData:GetStageIdIsOpen(var_9_0) and "false" or "true")

		local var_9_3 = var_9_1.activity_id == ActivityConst.ACTIVITY_3_4_BLISTER_GAMEPOINT1

		arg_9_0.textnum01Text_.text = var_9_2 and var_9_2.value or "-----------"

		arg_9_0.sectionControl:SetSelectedState(var_9_3 and "up" or "down")
	end
end

function var_0_0.OnClickBtn(arg_10_0)
	local var_10_0 = ActivityBubbleCfg[arg_10_0.id]

	BlisterGameData:SavePassId(arg_10_0.id)
	BlisterGameAction.PlayGame(var_10_0.map)
end

function var_0_0.OnExit(arg_11_0)
	var_0_0.super.OnExit(arg_11_0)
end

function var_0_0.Dispose(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.nodeList) do
		iter_12_1:Dispose()
	end

	arg_12_0.nodeList = {}

	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
