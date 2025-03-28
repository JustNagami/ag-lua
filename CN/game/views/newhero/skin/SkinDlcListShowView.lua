SkinDlcShowView = import("game.views.newHero.skin.SkinDlcShowView")

local var_0_0 = class("SkinDlcShowListView", SkinDlcShowView)

function var_0_0.AddUIListener(arg_1_0)
	arg_1_0:AddBtnListener(arg_1_0.skipBtn_, nil, function()
		arg_1_0.criMovie_:Stop()
	end)
end

function var_0_0.OnTop(arg_3_0)
	manager.windowBar:SwitchBar({})
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.dlcPlayList_ = arg_4_0.params_.dlcPlayList
	arg_4_0.callBack = arg_4_0.params_.callBack
	arg_4_0.params_.callBack = nil
	arg_4_0.index_ = 1

	arg_4_0:SetData()
end

function var_0_0.SetData(arg_5_0)
	local var_5_0 = arg_5_0.dlcPlayList_[arg_5_0.index_]
	local var_5_1 = var_5_0.goodId
	local var_5_2 = var_5_0.dlcItemID
	local var_5_3 = var_5_0.dlcId
	local var_5_4 = var_5_0.start_path

	if not var_5_4 then
		if var_5_3 then
			var_5_1 = var_5_3
		end

		local var_5_5 = getShopCfg(var_5_1)
		local var_5_6
		local var_5_7

		if var_5_5 then
			local var_5_8

			var_5_6, var_5_8 = var_5_5.give_id or var_5_5.description, var_5_5.give or 1
		end

		local var_5_9
		local var_5_10

		if var_5_5 and var_5_5.description then
			local var_5_11 = var_5_5.description

			var_5_10 = RechargeShopDescriptionCfg[var_5_11]
		elseif var_5_5 then
			var_5_10 = ItemCfg[var_5_6]
		else
			var_5_10 = ItemCfg[var_5_2]
		end

		local var_5_12 = true

		for iter_5_0, iter_5_1 in ipairs(SkinSceneActionCfg.all) do
			local var_5_13 = SkinSceneActionCfg[iter_5_1]

			if var_5_13.special_scene_id == var_5_10.param[1] then
				arg_5_0.start_path = var_5_13.start_path

				arg_5_0:Play()

				break
			end
		end
	else
		arg_5_0.start_path = var_5_4

		arg_5_0:Play()
	end
end

function var_0_0.OnExit(arg_6_0)
	if arg_6_0.callBack then
		arg_6_0.callBack()

		arg_6_0.callBack = nil
	end

	arg_6_0.criplayer_.statusChangeCallback = nil

	arg_6_0.criMovie_:Stop()
	manager.windowBar:HideBar()
end

function var_0_0.Play(arg_7_0)
	SetFile(arg_7_0.criplayer_, nil, arg_7_0.start_path, CriMana.Player.SetMode.New)

	local var_7_0 = manager.audio:GetMusicVolume()

	arg_7_0.criplayer_:SetVolume(var_7_0)
	arg_7_0:SetVideoTrack(arg_7_0.criplayer_, arg_7_0.start_path)
	arg_7_0.criMovie_:Play()

	if not arg_7_0.criplayer_.statusChangeCallback then
		arg_7_0.criplayer_.statusChangeCallback = handler(arg_7_0, arg_7_0.CirMovieStatusChange)
	end
end

function var_0_0.CirMovieStatusChange(arg_8_0, arg_8_1)
	local var_8_0 = tostring(arg_8_1)

	if var_8_0 == "PlayEnd" or var_8_0 == "Stop" then
		arg_8_0:DoNextDLC()
	end
end

function var_0_0.DoNextDLC(arg_9_0)
	if arg_9_0.index_ >= #arg_9_0.dlcPlayList_ then
		arg_9_0:Back()
	else
		arg_9_0.index_ = arg_9_0.index_ + 1

		arg_9_0:SetData()
	end
end

return var_0_0
