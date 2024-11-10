local var_0_0 = class("SequentialBattleFactoryTeamHero", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.heroIndex_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.controller_ = ControllerUtil.GetController(arg_1_0.transform_, "name")
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.activityID_ = arg_2_1
	arg_2_0.stageIndex_ = arg_2_2
	arg_2_0.heroID_ = arg_2_3
	arg_2_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, arg_2_0.activityID_, arg_2_0.stageIndex_, {
		stageType = BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE,
		stageID = SequentialBattleChapterCfg[arg_2_0.activityID_].stage_id[arg_2_0.stageIndex_],
		activityID = arg_2_0.activityID_
	})

	arg_2_0:RefreshHero()
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.teamButton_, nil, function()
		SequentialBattleData:CacheChapterData(arg_3_0.activityID_)

		local var_4_0 = SequentialBattleChapterCfg[arg_3_0.activityID_].stage_id[arg_3_0.stageIndex_]

		arg_3_0:Go("/sectionSelectHero", {
			section = var_4_0,
			sectionType = BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE,
			activityID = arg_3_0.activityID_,
			reserveParams = arg_3_0.reserveParams_
		})
	end)
end

function var_0_0.RefreshHero(arg_5_0, arg_5_1)
	if arg_5_0.heroID_ ~= 0 then
		arg_5_0.icon_.sprite = HeroTools.GetHeadSprite(arg_5_0.heroID_)

		arg_5_0.controller_:SetSelectedState("true")
	else
		arg_5_0.controller_:SetSelectedState("false")
	end
end

return var_0_0
