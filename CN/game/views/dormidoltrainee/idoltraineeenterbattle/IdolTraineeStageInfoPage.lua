local var_0_0 = class("IdolTraineeStageInfoPage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.ememyItem = {}

	arg_2_0:BindCfgUI(arg_2_0.changeCharaGo_, arg_2_0.ememyItem)
	arg_2_0:AddUIListener()

	arg_2_0.raceUIList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexRaceItem), arg_2_0.advanceRace_, EnterBattleRaceListItem)
	arg_2_0.styleUIList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexStyleItem), arg_2_0.advanceStyle_, EnterBattleStyleListItem)
	arg_2_0.stateController = arg_2_0.controller:GetController("state")
	arg_2_0.raceEmptyController = arg_2_0.controller:GetController("raceEmpty")
	arg_2_0.styleEmptyController = arg_2_0.controller:GetController("styleEmpty")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.headbtn, nil, function()
		JumpTools.OpenPageByJump("idolTraineeBattleComparePop", {
			userID = arg_3_0.curUserID_,
			friendType = arg_3_0.friendType
		})
	end)
end

function var_0_0.IndexRaceItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(arg_5_0.raceData_[arg_5_1])
end

function var_0_0.IndexStyleItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:SetData(arg_6_0.styleData_[arg_6_1])
end

function var_0_0.IndexEnemyItem(arg_7_0, arg_7_1, arg_7_2)
	arg_7_2:SetData(arg_7_0.enemyData[arg_7_1])
end

function var_0_0.ShowPage(arg_8_0, arg_8_1)
	return
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:RefreshUI()
end

function var_0_0.OnExit(arg_10_0)
	return
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.pvpBattle_ = arg_11_0.params_.pvpBattle
	arg_11_0.stageID_ = arg_11_0.params_.stageID

	local var_11_0

	if arg_11_0.pvpBattle_ then
		arg_11_0.stageID_ = IdolTraineeData:GetCurPVPStage()
		var_11_0 = IdolTraineePvpBattleCfg[arg_11_0.stageID_]

		arg_11_0.stateController:SetSelectedState("pvp")
	elseif arg_11_0.params_.idolCompetition then
		arg_11_0.stageID_ = arg_11_0.params_.stageID
		var_11_0 = IdolTraineePvpBattleCfg[arg_11_0.stageID_]

		arg_11_0.stateController:SetSelectedState("pvp")
	else
		var_11_0 = IdolTraineePveBattleCfg[arg_11_0.stageID_]

		arg_11_0.stateController:SetSelectedState("pve")

		arg_11_0.friendType = IdolTraineeConst.friendType.npc
		arg_11_0.ememyItem.headIcon_.sprite = DormHeroTools.GetBackHomeHeadSprite(var_11_0.npc_id)
	end

	if var_11_0 then
		local var_11_1 = IdolStageSceneCfg[var_11_0.scene_id].stage_picture

		arg_11_0.scene_.sprite = getSpriteWithoutAtlas(SpritePathCfg.IdolStageIcon.path .. var_11_1)
		arg_11_0.bgmName_.text = IdolStageMusicCfg[var_11_0.bgm].music_name
		arg_11_0.descText_.text = var_11_0.stage_desc
		arg_11_0.raceData_ = var_11_0.race_id_list
		arg_11_0.styleData_ = {}

		for iter_11_0, iter_11_1 in ipairs(var_11_0.peculiarity_rate) do
			if iter_11_1 > 100 then
				table.insert(arg_11_0.styleData_, iter_11_0)
			end
		end

		arg_11_0.raceUIList_:StartScroll(#arg_11_0.raceData_)
		arg_11_0.styleUIList_:StartScroll(#arg_11_0.styleData_)
		arg_11_0.raceEmptyController:SetSelectedState(#arg_11_0.raceData_ == 0 and "true" or "false")
		arg_11_0.styleEmptyController:SetSelectedState(#arg_11_0.styleData_ == 0 and "true" or "false")
	end
end

function var_0_0.OnIdolPvpStageUpdateFromServer(arg_12_0)
	arg_12_0:RefreshUI()

	for iter_12_0 = 1, #arg_12_0.styleData_ do
		local var_12_0 = arg_12_0.styleUIList_:GetItemByIndex(iter_12_0)

		if var_12_0 then
			var_12_0.gameObject_:GetComponent("RectTransform"):SetAnchoredPositionY(-2)
		end
	end
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.raceUIList_ then
		arg_13_0.raceUIList_:Dispose()

		arg_13_0.raceUIList_ = nil
	end

	if arg_13_0.styleUIList_ then
		arg_13_0.styleUIList_:Dispose()

		arg_13_0.styleUIList_ = nil
	end

	arg_13_0.gameObject_ = nil

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
