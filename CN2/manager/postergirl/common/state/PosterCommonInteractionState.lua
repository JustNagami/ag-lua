local var_0_0 = class("PosterCommonInteractionState", PosterCommonTimelineState)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.interactionKey = arg_1_2
end

function var_0_0.Enter(arg_2_0)
	arg_2_0:CheckInsteraction()
end

function var_0_0.CheckInsteraction(arg_3_0)
	arg_3_0.actor:EnableEyeController(false)

	local var_3_0 = arg_3_0.actor:GetSkinId()
	local var_3_1 = SkinCfg[var_3_0].hero
	local var_3_2 = arg_3_0.actor:GetInteractionCfg()
	local var_3_3 = var_3_2[arg_3_0.interactionKey]
	local var_3_4 = var_3_2[arg_3_0.interactionKey .. "_talk"]
	local var_3_5 = var_3_2[arg_3_0.interactionKey .. "_delay"]
	local var_3_6 = 1

	if #var_3_3 > 1 then
		var_3_6 = arg_3_0:RandomIndexOfInteractionType(arg_3_0.interactionKey)
	end

	local var_3_7 = var_3_3[var_3_6]
	local var_3_8 = var_3_4[var_3_6]
	local var_3_9 = var_3_5[var_3_6]
	local var_3_10 = manager.posterGirl:GetForceRandomIndex()
	local var_3_11 = HeroInteractionCfg[var_3_1][arg_3_0.interactionKey]

	if var_3_11 and var_3_10 and var_3_10 <= #var_3_11 then
		var_3_7 = var_3_11[var_3_10]

		local var_3_12 = HeroInteractionCfg[var_3_1][arg_3_0.interactionKey .. "_talk"]
		local var_3_13 = HeroInteractionCfg[var_3_1][arg_3_0.interactionKey .. "_delay"]

		var_3_8 = var_3_12 and var_3_12[var_3_10]
		var_3_9 = var_3_13 and var_3_13[var_3_10]
	end

	if var_3_7 then
		arg_3_0.talking_ = var_3_8

		arg_3_0:PlayAni(var_3_7)

		if var_3_8 and var_3_9 then
			arg_3_0:PlaySpecialTalk(var_3_8, var_3_9)
		end
	end

	if arg_3_0.interactionKey == PosterGirlConst.InteractionKey.mainTouch or arg_3_0.interactionKey == PosterGirlConst.InteractionKey.mainQuickTouch then
		PlayerAction.TouchPosterGirl()
	end
end

function var_0_0.RandomIndexOfInteractionType(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 .. "_talk"
	local var_4_1 = arg_4_0.actor:GetSkinId()
	local var_4_2 = SkinCfg[var_4_1].hero
	local var_4_3 = arg_4_0.actor:GetInteractionCfg()
	local var_4_4 = arg_4_0.lastIndex or 0
	local var_4_5 = {}
	local var_4_6 = {}

	if not var_4_3 then
		error("RandomIndexOfInteractionType error")

		return 1
	end

	for iter_4_0, iter_4_1 in ipairs(var_4_3[var_4_0]) do
		if iter_4_0 ~= var_4_4 then
			table.insert(var_4_5, iter_4_1)
			table.insert(var_4_6, iter_4_0)
		end
	end

	local var_4_7 = 1
	local var_4_8 = var_4_3[arg_4_1 .. "_weight"]

	if var_4_8 and #var_4_8 > 0 then
		local var_4_9 = 0

		for iter_4_2, iter_4_3 in ipairs(var_4_6) do
			var_4_9 = var_4_9 + var_4_8[iter_4_3]
		end

		local var_4_10 = math.round(math.random(var_4_9))

		for iter_4_4, iter_4_5 in ipairs(var_4_6) do
			local var_4_11 = var_4_8[iter_4_5]

			if var_4_10 <= var_4_11 then
				var_4_7 = iter_4_4

				break
			else
				var_4_10 = var_4_10 - var_4_11
			end
		end
	else
		local var_4_12 = #var_4_6

		var_4_7 = math.round(math.random(var_4_12))
	end

	local var_4_13 = var_4_6[var_4_7]

	arg_4_0.lastIndex = var_4_13

	return var_4_13
end

function var_0_0.PlaySpecialTalk(arg_5_0, arg_5_1, arg_5_2)
	if manager.story:IsPlay() then
		return
	end

	local var_5_0 = string.split(arg_5_1, "_")

	if #var_5_0 < 2 then
		return
	end

	if arg_5_0.talkDelayTimer_ then
		arg_5_0.talkDelayTimer_:Stop()

		arg_5_0.talkDelayTimer_ = nil
	end

	if arg_5_2 > 0 then
		arg_5_0.talkDelayTimer_ = Timer.New(function()
			arg_5_0.actor:PlayHeroTalk(var_5_0[1], var_5_0[2], nil)
		end, arg_5_2 / 1000)

		arg_5_0.talkDelayTimer_:Start()
	else
		arg_5_0.actor:PlayHeroTalk(var_5_0[1], var_5_0[2], nil)
	end
end

function var_0_0.Exit(arg_7_0)
	var_0_0.super.Exit(arg_7_0)

	if arg_7_0.talkDelayTimer_ then
		arg_7_0.talkDelayTimer_:Stop()

		arg_7_0.talkDelayTimer_ = nil
	end
end

return var_0_0
