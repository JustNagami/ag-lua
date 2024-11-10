local var_0_0 = import("game.views.sectionSelectHero.NewSectionSelectHeroBaseView")
local var_0_1 = class("MythicSelectHeroView", var_0_0)

function var_0_1.RefreshCustomUI(arg_1_0)
	arg_1_0:GetHeroTeam()
	arg_1_0:RefreshBtnText()
end

function var_0_1.RefreshBtnText(arg_2_0)
	local var_2_0 = arg_2_0.startBtn_.gameObject:GetComponentInChildren(typeof(Text))

	if var_2_0 then
		var_2_0.text = GetTips("CONFIRM_TEAM")
	end
end

function var_0_1.AddListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.startBtn_, nil, function()
		arg_3_0:OnClickStartBattle()
	end)
	arg_3_0:AddBtnListener(arg_3_0.reservesBtn_, nil, function()
		if not arg_3_0.sectionProxy_.canChangeReserveProposal then
			return
		end

		arg_3_0:GotoReservesProposalUI()
	end)
end

function var_0_1.OnClickStartBattle(arg_6_0)
	arg_6_0:ConfirmTeam()
end

function var_0_1.GetHeroTeam(arg_7_0)
	arg_7_0.heroTeam_, _, _, arg_7_0.heroTrialList_ = ReserveTools.GetHeroList(arg_7_0.params_.reserveParams)
end

function var_0_1.OnSectionClickHero(arg_8_0, arg_8_1)
	arg_8_0.sectionProxy_:GotoHeroInfoUI(arg_8_1)
end

function var_0_1.ConfirmTeam(arg_9_0)
	arg_9_0:GetHeroTeam()

	local var_9_0 = clone(arg_9_0.heroTeam_)
	local var_9_1 = clone(arg_9_0.heroTrialList_)
	local var_9_2
	local var_9_3 = {}
	local var_9_4 = {}

	for iter_9_0 = 1, 2 do
		if arg_9_0.params_.reserveParams.teamIndex ~= iter_9_0 then
			local var_9_5 = ReserveParams.New(nil, arg_9_0.params_.reserveParams.contID, iter_9_0, {
				stageType = arg_9_0.params_.stageType,
				stageID = arg_9_0.params_.stageID
			})
			local var_9_6 = ReserveTools.GetHeroList(var_9_5)

			for iter_9_1, iter_9_2 in ipairs(var_9_6) do
				if iter_9_2 ~= 0 then
					for iter_9_3 = 1, 3 do
						if iter_9_2 == var_9_0[iter_9_3] then
							var_9_2 = iter_9_0
							var_9_3 = var_9_6

							table.insert(var_9_4, iter_9_1)
						end
					end
				end
			end
		end
	end

	if var_9_2 then
		local var_9_7 = GetTips("NUM_" .. var_9_2)

		ShowMessageBox({
			content = string.format(GetTips("CURHERO_USED"), var_9_7),
			OkCallback = function()
				for iter_10_0, iter_10_1 in pairs(var_9_4) do
					var_9_3[iter_10_1] = 0
				end

				for iter_10_2 = 1, 2 do
					for iter_10_3 = iter_10_2 + 1, 3 do
						if var_9_3[iter_10_2] == 0 then
							var_9_3[iter_10_2] = var_9_3[iter_10_3]
							var_9_3[iter_10_3] = 0
						end
					end
				end

				local var_10_0 = ReserveParams.New(nil, arg_9_0.params_.reserveParams.contID, var_9_2, {
					stageType = arg_9_0.params_.stageType,
					stageID = arg_9_0.params_.stageID
				})

				ReserveTools.SetHeroList(var_10_0, var_9_3, {
					0,
					0,
					0
				})
				arg_9_0:ChangeTeam(var_9_0, var_9_1)
				CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
				arg_9_0:Back()
			end
		})
	else
		arg_9_0:ChangeTeam(var_9_0, var_9_1)
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
		arg_9_0:Back()
	end
end

function var_0_1.ChangeTeam(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}

	for iter_11_0 = 1, 3 do
		if arg_11_1[iter_11_0] ~= 0 then
			var_11_0[#var_11_0 + 1] = arg_11_1[iter_11_0]
		end
	end

	for iter_11_1 = #var_11_0 + 1, 3 do
		var_11_0[iter_11_1] = 0
	end

	local var_11_1 = ReserveTools.GetComboSkillID(arg_11_0.params_.reserveParams)
	local var_11_2, var_11_3 = ReserveTools.GetMimirData(arg_11_0.params_.reserveParams)
	local var_11_4 = ReserveParams.New(ReserveConst.RESERVE_TYPE.MYTHIC_FINAL, ReserveConst.MYTHIC_CONT_ID.FINAL_MULTI, arg_11_0.params_.reserveParams.teamIndex, {
		stageType = BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL,
		stageID = stageID
	})

	ReserveTools.SetTeam(var_11_4, var_11_0, arg_11_2 or {}, var_11_1, var_11_2, var_11_3)
end

return var_0_1
