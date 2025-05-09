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
	arg_5_0:RefreshActive()
end

function var_0_0.RefreshActive(arg_6_0)
	SetActive(arg_6_0.gameObject_, not arg_6_0:IsEmpty())
end

function var_0_0.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.showBtn_, nil, function()
		arg_7_0:ChangeShow(not arg_7_0.isShow_)
		arg_7_0.showClick_()
	end)
end

function var_0_0.ChangeShow(arg_9_0, arg_9_1)
	if arg_9_0.isShow_ == arg_9_1 then
		return
	end

	arg_9_0.isShow_ = arg_9_1

	arg_9_0.showController_:SetSelectedIndex(arg_9_0.isShow_ and 1 or 0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.content_)
end

function var_0_0.InitItemList(arg_10_0)
	arg_10_0:UpdateVoiceData()

	local var_10_0 = 1

	for iter_10_0, iter_10_1 in pairs(arg_10_0.voiceList_) do
		if not arg_10_0.itemList_[var_10_0] then
			local var_10_1 = Object.Instantiate(arg_10_0.itemGo_, arg_10_0.content_)

			arg_10_0.itemList_[var_10_0] = HeroFileVoiceItem.New(var_10_1)
		end

		arg_10_0.itemList_[var_10_0]:SetIsShow(true)
		arg_10_0.itemList_[var_10_0]:SetData(arg_10_0.curHeroID_, arg_10_0.voiceList_[var_10_0], function(arg_11_0)
			arg_10_0.onClick_(arg_11_0)
		end)

		var_10_0 = var_10_0 + 1
	end

	for iter_10_2, iter_10_3 in pairs(arg_10_0.itemList_) do
		if var_10_0 <= iter_10_2 then
			iter_10_3:SetIsShow(false)
		end
	end
end

function var_0_0.SetIsShow(arg_12_0, arg_12_1)
	SetActive(arg_12_0.gameObject_, arg_12_1)
end

function var_0_0.UpdateVoiceData(arg_13_0)
	arg_13_0.voiceList_ = {}

	local var_13_0 = 1
	local var_13_1 = {}

	if arg_13_0.formID_ then
		local var_13_2 = HeroVoiceDescCfg.get_id_list_by_chara_id_subtitle_id[arg_13_0.curHeroID_]

		for iter_13_0, iter_13_1 in ipairs(HeroVoiceCfg.get_id_list_by_tag_id[arg_13_0.typeID_]) do
			local var_13_3 = var_13_2[iter_13_1]
			local var_13_4

			if var_13_3 then
				var_13_4 = var_13_3[2]
			end

			if var_13_4 then
				table.insert(var_13_1, iter_13_1)
			end
		end
	else
		var_13_1 = HeroVoiceCfg.get_id_list_by_tag_id[arg_13_0.typeID_] or {}
	end

	for iter_13_2, iter_13_3 in ipairs(var_13_1) do
		local var_13_5 = HeroTools:IsUnlockVoice(arg_13_0.curHeroID_, iter_13_3)
		local var_13_6 = HeroVoiceDescCfg.Get(arg_13_0.curHeroID_, iter_13_3)

		if var_13_6 ~= nil and var_13_6 ~= "" then
			arg_13_0.voiceList_[var_13_0] = {
				id = iter_13_3,
				unlock = var_13_5
			}
			var_13_0 = var_13_0 + 1
		end
	end

	table.sort(arg_13_0.voiceList_, function(arg_14_0, arg_14_1)
		if (arg_14_0.unlock or arg_14_1.unlock) and arg_14_0.unlock ~= arg_14_1.unlock then
			return arg_14_0.unlock
		end

		return arg_14_0.id < arg_14_1.id
	end)
end

function var_0_0.IsEmpty(arg_15_0)
	if arg_15_0.voiceList_ and #arg_15_0.voiceList_ == 0 then
		return true
	else
		return false
	end
end

function var_0_0.Dispose(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.itemList_) do
		iter_16_1:Dispose()
	end

	arg_16_0.itemList_ = {}

	var_0_0.super.Dispose(arg_16_0)
end

function var_0_0.StartPlay(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.voiceList_) do
		local var_17_0 = arg_17_0.itemList_[iter_17_0]

		if var_17_0 then
			if arg_17_1 == iter_17_1.id then
				var_17_0:StartPlay()
			else
				var_17_0:StopPlay()
			end
		end
	end
end

function var_0_0.StopPlay(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.itemList_) do
		iter_18_1:StopPlay()
	end
end

function var_0_0.GetItemByID(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.itemList_) do
		if iter_19_1:GetID() == arg_19_1 then
			return iter_19_1
		end
	end

	return nil
end

return var_0_0
