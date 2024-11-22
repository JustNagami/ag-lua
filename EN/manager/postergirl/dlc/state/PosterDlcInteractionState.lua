local var_0_0 = class("PosterDlcInteractionState", PosterDlcTimelineState)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.interactionKey = arg_1_2
end

function var_0_0.Enter(arg_2_0)
	var_0_0.super.Enter(arg_2_0)
	arg_2_0.actor:EnableEyeController(false)

	local var_2_0 = HeroTools:GetUnlockInteractionCfg(arg_2_0.actor:GetSkinId())
	local var_2_1 = var_2_0[arg_2_0.interactionKey]
	local var_2_2 = var_2_0[arg_2_0.interactionKey .. "_talk"]
	local var_2_3 = var_2_0[arg_2_0.interactionKey .. "_delay"]
	local var_2_4 = 1

	if #var_2_1 > 1 then
		var_2_4 = arg_2_0:RandomIndexOfInteractionType(arg_2_0.interactionKey)
	end

	local var_2_5 = var_2_1[var_2_4]
	local var_2_6 = var_2_2[var_2_4]
	local var_2_7 = var_2_3[var_2_4]
	local var_2_8 = arg_2_0.actor:GetSkinId()
	local var_2_9 = manager.posterGirl:GetForceRandomIndex()
	local var_2_10 = HeroInteractionCfg[var_2_8][arg_2_0.interactionKey]

	if var_2_10 and var_2_9 and var_2_9 <= #var_2_10 then
		var_2_5 = var_2_10[var_2_9]

		local var_2_11 = HeroInteractionCfg[var_2_8][arg_2_0.interactionKey .. "_talk"]
		local var_2_12 = HeroInteractionCfg[var_2_8][arg_2_0.interactionKey .. "delay"]

		var_2_6 = var_2_11 and var_2_11[var_2_4]
		var_2_7 = var_2_12 and var_2_12[var_2_4]
	end

	if var_2_5 then
		arg_2_0:PlayAni(var_2_5)

		if var_2_6 and var_2_7 then
			arg_2_0:PlaySpecialTalk(var_2_6, var_2_7)
		end
	end

	if arg_2_0.interactionKey == PosterGirlConst.InteractionKey.mainTouch or arg_2_0.interactionKey == PosterGirlConst.InteractionKey.mainQuickTouch or arg_2_0.interactionKey == PosterGirlConst.InteractionKey.touch2 or arg_2_0.interactionKey == PosterGirlConst.InteractionKey.touch3 then
		PlayerAction.TouchPosterGirl()
	end
end

function var_0_0.RandomIndexOfInteractionType(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1 .. "_talk"
	local var_3_1 = HeroTools:GetUnlockInteractionCfg(arg_3_0.actor:GetSkinId())
	local var_3_2 = arg_3_0.lastIndex or 0
	local var_3_3 = {}
	local var_3_4 = {}

	if not var_3_1 then
		error("RandomIndexOfInteractionType error")

		return 1
	end

	for iter_3_0, iter_3_1 in ipairs(var_3_1[var_3_0]) do
		if iter_3_0 ~= var_3_2 then
			table.insert(var_3_3, iter_3_1)
			table.insert(var_3_4, iter_3_0)
		end
	end

	local var_3_5 = 1
	local var_3_6 = var_3_1[arg_3_1 .. "_weight"]

	if var_3_6 and #var_3_6 > 0 then
		local var_3_7 = 0

		for iter_3_2, iter_3_3 in ipairs(var_3_4) do
			var_3_7 = var_3_7 + var_3_6[iter_3_3]
		end

		local var_3_8 = math.round(math.random(var_3_7))

		for iter_3_4, iter_3_5 in ipairs(var_3_4) do
			local var_3_9 = var_3_6[iter_3_5]

			if var_3_8 <= var_3_9 then
				var_3_5 = iter_3_4

				break
			else
				var_3_8 = var_3_8 - var_3_9
			end
		end
	else
		local var_3_10 = #var_3_4

		var_3_5 = math.round(math.random(var_3_10))
	end

	local var_3_11 = var_3_4[var_3_5]

	arg_3_0.lastIndex = var_3_11

	return var_3_11
end

function var_0_0.PlaySpecialTalk(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = string.split(arg_4_1, "_")

	if #var_4_0 < 2 then
		return
	end

	if arg_4_0.talkDelayTimer_ then
		arg_4_0.talkDelayTimer_:Stop()

		arg_4_0.talkDelayTimer_ = nil
	end

	if arg_4_2 > 0 then
		arg_4_0.talkDelayTimer_ = Timer.New(function()
			arg_4_0.actor:PlayHeroTalk(var_4_0[1], var_4_0[2], nil)
		end, arg_4_2 / 1000)

		arg_4_0.talkDelayTimer_:Start()
	else
		arg_4_0.actor:PlayHeroTalk(var_4_0[1], var_4_0[2], nil)
	end
end

function var_0_0.Exit(arg_6_0, arg_6_1)
	var_0_0.super.Exit(arg_6_0, arg_6_1)

	if arg_6_0.talkDelayTimer_ then
		arg_6_0.talkDelayTimer_:Stop()

		arg_6_0.talkDelayTimer_ = nil
	end
end

return var_0_0
