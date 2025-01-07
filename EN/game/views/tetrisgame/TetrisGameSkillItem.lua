local var_0_0 = class("TetrisGameSkillItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.statusController = arg_3_0.controller:GetController("status")
	arg_3_0.notController = arg_3_0.controller:GetController("not")
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1)
	arg_4_0.skillID = arg_4_1
	arg_4_0.conficID = nil

	if arg_4_0.skillID then
		local var_4_0 = ActivityTetrisGameSkillCfg[arg_4_0.skillID]

		arg_4_0.name.text = var_4_0.name
		arg_4_0.skillDesc.text = var_4_0.desc
		arg_4_0.skillImg.sprite = TetrisGameTools:GetSkillIcon(arg_4_1)

		local var_4_1, var_4_2 = TetrisGameTools:CheckSkillIsUnlock(arg_4_0.skillID)

		if var_4_1 then
			if TetrisGameTools:CheckSkillInList(arg_4_0.skillID) then
				arg_4_0.statusController:SetSelectedState("cancel")
			else
				arg_4_0.statusController:SetSelectedState("normal")
			end
		else
			arg_4_0.statusController:SetSelectedState("lock")

			local var_4_3 = ActivityTetrisGameSkillCfg[arg_4_0.skillID].unlock_stage_id
			local var_4_4 = ""

			for iter_4_0, iter_4_1 in ipairs(var_4_3) do
				if TetrisGameTools:GetStageState(iter_4_1) ~= "finish" then
					if iter_4_0 == 1 then
						var_4_4 = string.format("%s%s", var_4_4, ActivityTetrisGameStageCfg[iter_4_1].desc)
					else
						var_4_4 = string.format("%s,%s", var_4_4, ActivityTetrisGameStageCfg[iter_4_1].desc)
					end
				end
			end

			arg_4_0.lockDesc.text = string.format(GetTips("TETRIS_GAME_SKILL_UNLOCK_CONDITION"), var_4_4)
		end

		local var_4_5, var_4_6 = TetrisGameTools:CheckSkillIsConflict(arg_4_1)

		if var_4_5 then
			arg_4_0.notController:SetSelectedState("on")

			arg_4_0.confictText.text = string.format(GetTips("TETRIS_GAME_SKILL_CONFLICT"), ActivityTetrisGameSkillCfg[var_4_6].name)
			arg_4_0.conficID = var_4_6
			arg_4_0.mutualImg_.sprite = TetrisGameTools:GetSkillIcon(var_4_6)
		else
			arg_4_0.notController:SetSelectedState("off")
		end
	end

	arg_4_0:RefreshRedPoint()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.addBtn_, nil, function()
		if arg_5_0.notController:GetSelectedState() == "on" then
			local var_6_0 = ActivityTetrisGameSkillCfg[arg_5_0.skillID].name
			local var_6_1 = ActivityTetrisGameSkillCfg[arg_5_0.conficID].name

			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips(GetTips("TETRIS_GAME_SKILL_CONFLICT_CONFIRM")), var_6_1),
				OkCallback = function()
					TetrisGameTools:AddOrReduceSkill(arg_5_0.skillID, arg_5_0.conficID)
				end
			})
		else
			TetrisGameTools:AddOrReduceSkill(arg_5_0.skillID)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.reduceBtn_, nil, function()
		TetrisGameTools:AddOrReduceSkill(arg_5_0.skillID)
	end)
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)
end

function var_0_0.RefreshRedPoint(arg_10_0)
	if manager.redPoint:getTipBoolean(string.format("%s_%s", RedPointConst.ACTIVITY_TETIRS_GAME_NEW_SKILL, arg_10_0.skillID)) then
		manager.redPoint:SetRedPointIndependent(arg_10_0.transform_, true, nil)
	else
		manager.redPoint:SetRedPointIndependent(arg_10_0.transform_, false, nil)
	end
end

return var_0_0
