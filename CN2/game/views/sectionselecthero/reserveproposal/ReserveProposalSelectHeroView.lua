local var_0_0 = import("game.views.sectionSelectHero.SelectHeroBaseView")
local var_0_1 = class("ReserveProposalSelectHeroView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0:AddEventListener()
	arg_1_0:SubViewOnEnter()
end

function var_0_1.Refresh(arg_2_0)
	return
end

function var_0_1.AddEventListener(arg_3_0)
	arg_3_0:RegistEventListener(COMBO_SKILL_SELECT, arg_3_0.selectComboSkillHandler_)
end

function var_0_1.SetContID(arg_4_0, arg_4_1)
	if #arg_4_0.loadingList_ > 0 then
		return
	end

	arg_4_0.reserveParams_.contID = arg_4_1

	local var_4_0 = clone(arg_4_0.cacheHeroTeam_)

	arg_4_0:RefreshHeroTeam()
	arg_4_0:LoadHeroModels(var_4_0)
end

function var_0_1.LoadHeroModels(arg_5_0, arg_5_1)
	if not arg_5_1 then
		return
	end

	local var_5_0 = arg_5_0.heroModel_
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		if iter_5_1 ~= 0 then
			var_5_1[iter_5_1] = iter_5_0
		end
	end

	arg_5_0.heroModel_ = {}

	for iter_5_2, iter_5_3 in ipairs(arg_5_0.cacheHeroTeam_) do
		local var_5_2 = var_5_1[iter_5_3]

		var_5_1[iter_5_3] = nil

		if var_5_2 ~= nil and var_5_2 ~= iter_5_2 then
			local var_5_3 = var_5_0[var_5_2]

			var_5_0[var_5_2] = nil

			arg_5_0:SetHeroModelPos(var_5_3, iter_5_2)
		end
	end

	for iter_5_4, iter_5_5 in pairs(var_5_0) do
		manager.resourcePool:DestroyOrReturn(iter_5_5, ASSET_TYPE.TPOSE)
	end

	for iter_5_6, iter_5_7 in pairs(arg_5_0.loadAsyncIndex_) do
		manager.resourcePool:StopAsyncQuest(arg_5_0.loadAsyncIndex_[iter_5_6])
	end

	arg_5_0.loadAsyncIndex_ = {}
	arg_5_0.loadingList_ = {}
	arg_5_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}

	for iter_5_8, iter_5_9 in ipairs(arg_5_0.cacheHeroTeam_) do
		if iter_5_9 ~= 0 and iter_5_9 and arg_5_0.heroModel_[iter_5_8] == nil then
			local var_5_4 = arg_5_0:GetSkinCfg(iter_5_8)

			table.insert(arg_5_0.loadingList_, iter_5_9)
			manager.ui:UIEventEnabled(false)

			arg_5_0.loadAsyncIndex_[iter_5_8] = manager.resourcePool:AsyncLoad("Char/" .. var_5_4.ui_modelId, ASSET_TYPE.TPOSE, function(arg_6_0)
				arg_5_0:SetHeroModelPos(arg_6_0, iter_5_8)

				local var_6_0 = table.keyof(arg_5_0.loadingList_, iter_5_9)

				if var_6_0 then
					table.remove(arg_5_0.loadingList_, var_6_0)
				end

				if #arg_5_0.loadingList_ == 0 then
					manager.ui:UIEventEnabled(true)
				end
			end)
		end
	end
end

function var_0_1.SetHeroModelPos(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.heroModel_[arg_7_2] = arg_7_1
	arg_7_0.heroModel_[arg_7_2].transform.localEulerAngles = SectionSelectHeroConst.HeroModelTransform[arg_7_2].rotation
	arg_7_0.heroModel_[arg_7_2].transform.localPosition = SectionSelectHeroConst.HeroModelTransform[arg_7_2].position
	arg_7_0.heroModel_[arg_7_2].transform.localScale = SectionSelectHeroConst.HeroModelTransform[arg_7_2].scale
end

function var_0_1.GetHeroInfoItemClass(arg_8_0)
	return SectionSelectHeroInfoItem
end

function var_0_1.GetMimirInfoViewClass(arg_9_0)
	return NewSectionMimirView
end

function var_0_1.GetComboSkillViewClass(arg_10_0)
	return NewSectionComboSkillView
end

return var_0_1
