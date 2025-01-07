local var_0_0 = class("HeroFileVoiceContentItem", ReduxView)

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

	arg_3_0.typeID_ = -1
	arg_3_0.itemList_ = {}
	arg_3_0.curHeroID_ = -1
	arg_3_0.showController_ = arg_3_0.mainControllerEx_:GetController("show")
	arg_3_0.isShow_ = false
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
	arg_4_0.curHeroID_ = arg_4_1
	arg_4_0.typeID_ = arg_4_2
	arg_4_0.formID_ = arg_4_3 or nil
	arg_4_0.onClick_ = arg_4_4
	arg_4_0.showClick_ = arg_4_5

	arg_4_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_5_0)
	arg_5_0.typeText_.text = HeroVoiceTagCfg[arg_5_0.typeID_].tag_name

	arg_5_0:InitItemList()
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.showBtn_, nil, function()
		arg_6_0:ChangeShow(not arg_6_0.isShow_)
		arg_6_0.showClick_()
	end)
end

function var_0_0.ChangeShow(arg_8_0, arg_8_1)
	if arg_8_0.isShow_ == arg_8_1 then
		return
	end

	arg_8_0.isShow_ = arg_8_1

	arg_8_0.showController_:SetSelectedIndex(arg_8_0.isShow_ and 1 or 0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content_)
end

function var_0_0.InitItemList(arg_9_0)
	arg_9_0:UpdateVoiceData()

	local var_9_0 = 1

	for iter_9_0, iter_9_1 in pairs(arg_9_0.voiceList_) do
		if not arg_9_0.itemList_[var_9_0] then
			local var_9_1 = Object.Instantiate(arg_9_0.itemGo_, arg_9_0.content_)

			arg_9_0.itemList_[var_9_0] = HeroFileVoiceItem.New(var_9_1)
		end

		arg_9_0.itemList_[var_9_0]:SetIsShow(true)
		arg_9_0.itemList_[var_9_0]:SetData(arg_9_0.curHeroID_, arg_9_0.voiceList_[var_9_0], function(arg_10_0)
			arg_9_0.onClick_(arg_10_0)
		end)

		var_9_0 = var_9_0 + 1
	end

	for iter_9_2, iter_9_3 in pairs(arg_9_0.itemList_) do
		if var_9_0 <= iter_9_2 then
			iter_9_3:SetIsShow(false)
		end
	end
end

function var_0_0.SetIsShow(arg_11_0, arg_11_1)
	SetActive(arg_11_0.gameObject_, arg_11_1)
end

function var_0_0.UpdateVoiceData(arg_12_0)
	arg_12_0.voiceList_ = {}

	local var_12_0 = 1
	local var_12_1 = {}

	if arg_12_0.formID_ then
		for iter_12_0, iter_12_1 in ipairs(HeroVoiceCfg.get_id_list_by_tag_id[arg_12_0.typeID_]) do
			local var_12_2 = HeroVoiceDescCfg.get_id_list_by_chara_id_subtitle_id[arg_12_0.curHeroID_][iter_12_1]
			local var_12_3

			if var_12_2 then
				var_12_3 = var_12_2[2]
			end

			if var_12_3 then
				table.insert(var_12_1, iter_12_1)
			end
		end
	else
		var_12_1 = HeroVoiceCfg.get_id_list_by_tag_id[arg_12_0.typeID_]
	end

	for iter_12_2, iter_12_3 in ipairs(var_12_1) do
		local var_12_4 = HeroTools:IsUnlockVoice(arg_12_0.curHeroID_, iter_12_3)
		local var_12_5 = HeroVoiceDescCfg.Get(arg_12_0.curHeroID_, iter_12_3)

		if var_12_5 ~= nil and var_12_5 ~= "" then
			arg_12_0.voiceList_[var_12_0] = {
				id = iter_12_3,
				unlock = var_12_4
			}
			var_12_0 = var_12_0 + 1
		end
	end

	table.sort(arg_12_0.voiceList_, function(arg_13_0, arg_13_1)
		if (arg_13_0.unlock or arg_13_1.unlock) and arg_13_0.unlock ~= arg_13_1.unlock then
			return arg_13_0.unlock
		end

		return arg_13_0.id < arg_13_1.id
	end)
end

function var_0_0.IsEmpty(arg_14_0)
	if arg_14_0.voiceList_ and #arg_14_0.voiceList_ == 0 then
		return true
	else
		return false
	end
end

function var_0_0.Dispose(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.itemList_) do
		iter_15_1:Dispose()
	end

	arg_15_0.itemList_ = {}

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.StartPlay(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.voiceList_) do
		local var_16_0 = arg_16_0.itemList_[iter_16_0]

		if var_16_0 then
			if arg_16_1 == iter_16_1.id then
				var_16_0:StartPlay()
			else
				var_16_0:StopPlay()
			end
		end
	end
end

function var_0_0.StopPlay(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.itemList_) do
		iter_17_1:StopPlay()
	end
end

function var_0_0.GetItemByID(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.itemList_) do
		if iter_18_1:GetID() == arg_18_1 then
			return iter_18_1
		end
	end

	return nil
end

return var_0_0
