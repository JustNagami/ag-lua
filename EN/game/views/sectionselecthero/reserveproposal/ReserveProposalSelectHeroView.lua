local var_0_0 = import("game.views.sectionSelectHero.SelectHeroBaseView")
local var_0_1 = class("ReserveProposalSelectHeroView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0:RegistEventListener(COMBO_SKILL_SELECT, arg_1_0.selectComboSkillHandler_)
	arg_1_0:SubViewOnEnter()
end

function var_0_1.SetContID(arg_2_0, arg_2_1)
	if #arg_2_0.loadingList_ > 0 then
		return
	end

	arg_2_0.reserveParams_.contID = arg_2_1

	local var_2_0 = clone(arg_2_0.cacheHeroTeam_)

	arg_2_0:RefreshHeroTeam()
	arg_2_0:RefreshMimir()
	arg_2_0:LoadHeroModels(var_2_0)
end

function var_0_1.LoadHeroModels(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.heroModel_
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if iter_3_1 ~= 0 then
			var_3_1[iter_3_1] = iter_3_0
		end
	end

	arg_3_0.heroModel_ = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_0.cacheHeroTeam_) do
		local var_3_2 = var_3_1[iter_3_3]

		var_3_1[iter_3_3] = nil

		if var_3_2 ~= nil and var_3_2 ~= iter_3_2 then
			local var_3_3 = var_3_0[var_3_2]

			var_3_0[var_3_2] = nil

			arg_3_0:SetHeroModelPos(var_3_3, iter_3_2)
		end
	end

	for iter_3_4, iter_3_5 in pairs(var_3_0) do
		manager.resourcePool:DestroyOrReturn(iter_3_5, ASSET_TYPE.TPOSE)
	end

	for iter_3_6, iter_3_7 in pairs(arg_3_0.loadAsyncIndex_) do
		manager.resourcePool:StopAsyncQuest(arg_3_0.loadAsyncIndex_[iter_3_6])
	end

	arg_3_0.loadAsyncIndex_ = {}
	arg_3_0.loadingList_ = {}
	arg_3_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}

	for iter_3_8, iter_3_9 in ipairs(arg_3_0.cacheHeroTeam_) do
		if iter_3_9 ~= 0 and iter_3_9 and arg_3_0.heroModel_[iter_3_8] == nil then
			local var_3_4 = arg_3_0:GetSkinCfg(iter_3_8)

			table.insert(arg_3_0.loadingList_, iter_3_9)

			arg_3_0.loadAsyncIndex_[iter_3_8] = manager.resourcePool:AsyncLoad("Char/" .. var_3_4.ui_modelId, ASSET_TYPE.TPOSE, function(arg_4_0)
				arg_3_0:SetHeroModelPos(arg_4_0, iter_3_8)

				local var_4_0 = table.keyof(arg_3_0.loadingList_, iter_3_9)

				if var_4_0 then
					table.remove(arg_3_0.loadingList_, var_4_0)
				end
			end)
		end
	end
end

function var_0_1.SetHeroModelPos(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.heroModel_[arg_5_2] = arg_5_1
	arg_5_0.heroModel_[arg_5_2].transform.localEulerAngles = SectionSelectHeroTools.HeroTransform[arg_5_2].rotation
	arg_5_0.heroModel_[arg_5_2].transform.localPosition = SectionSelectHeroTools.HeroTransform[arg_5_2].position
	arg_5_0.heroModel_[arg_5_2].transform.localScale = SectionSelectHeroTools.HeroTransform[arg_5_2].scale
end

function var_0_1.GetHeroInfoItemClass(arg_6_0)
	return SectionSelectHeroInfoItem
end

function var_0_1.GetMimirInfoViewClass(arg_7_0)
	return NewSectionMimirView
end

function var_0_1.GetComboSkillViewClass(arg_8_0)
	return NewSectionComboSkillView
end

return var_0_1
