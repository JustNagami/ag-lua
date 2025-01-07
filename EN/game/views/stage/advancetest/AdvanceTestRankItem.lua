local var_0_0 = class("AdvanceTestRankItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:initUI()
	arg_1_0:AddListeners()
end

function var_0_0.initUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.commonPortrait_ = CommonHeadPortrait.New(arg_2_0.headItem_)
	arg_2_0.rankController_ = arg_2_0.conExCollection_:GetController("rank")
	arg_2_0.heroCountController_ = arg_2_0.conExCollection_:GetController("heroCount")
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.Refresh(arg_4_0, arg_4_1)
	arg_4_0.user_id = arg_4_1.user_id
	arg_4_0.rankText_.text = arg_4_1.rank
	arg_4_0.scoreText_.text = arg_4_1.score

	if arg_4_1.rank <= 3 then
		arg_4_0.rankController_:SetSelectedIndex(arg_4_1.rank)
	else
		arg_4_0.rankController_:SetSelectedIndex(0)
	end

	arg_4_0.name_ = arg_4_1.nick
	arg_4_0.nickText_.text = arg_4_1.nick

	arg_4_0.commonPortrait_:RenderHead(arg_4_1.portrait)
	arg_4_0.commonPortrait_:RenderFrame(arg_4_1.frame)

	local var_4_0 = arg_4_1:GetSingleSelectHeroList()
	local var_4_1 = math.min(#var_4_0, 3)

	arg_4_0.heroCountController_:SetSelectedIndex(var_4_1)

	for iter_4_0 = 1, var_4_1 do
		local var_4_2 = var_4_0[iter_4_0].skin_id

		if var_4_2 == 0 then
			var_4_2 = var_4_0[iter_4_0].hero_id
		end

		arg_4_0["heroImg_" .. iter_4_0].sprite = getSpriteViaConfig("HeroLittleIcon", var_4_2)
	end
end

function firstLargeSize(arg_5_0, arg_5_1)
	if #arg_5_0 <= 0 then
		return arg_5_0
	end

	local var_5_0, var_5_1, var_5_2, var_5_3 = string.find(arg_5_0, "<(.-)>(.+)")

	var_5_3 = var_5_3 or arg_5_0

	local var_5_4 = {
		"“",
		"《"
	}
	local var_5_5 = 0
	local var_5_6

	for iter_5_0 = 1, var_5_3:getWCharCount() do
		local var_5_7 = var_5_3:getWChar(iter_5_0)

		if table.indexOf(var_5_4, var_5_7) == -1 then
			local var_5_8 = string.sub(var_5_3, 1, var_5_5)

			var_5_5 = var_5_5 + string.len(var_5_7)

			local var_5_9 = string.sub(var_5_3, var_5_5 + 1, -1)

			var_5_6 = string.format("%s<size=%d>%s</size>%s", var_5_8, arg_5_1, var_5_7, var_5_9)

			break
		else
			var_5_5 = var_5_5 + string.len(var_5_7)
		end
	end

	if not var_5_6 then
		return arg_5_0
	end

	if var_5_2 then
		var_5_6 = string.format("<%s>%s", var_5_2, var_5_6)
	end

	return var_5_6
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.commonPortrait_:Dispose()
	var_0_0.super.Dispose(arg_6_0)
end

return var_0_0
