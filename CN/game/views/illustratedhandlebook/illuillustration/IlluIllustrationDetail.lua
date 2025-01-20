local var_0_0 = class("IlluIllustrationDetail", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/IllustratedHandbook/IlluIllustrationDetail"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.imageImg_.cacheLimit = 3
	arg_4_0.loadCon_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "loading")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backBtn_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.shareBtn_, nil, function()
		manager.share:Share(function()
			SetActive(arg_5_0.shareGo_, false)
			SetActive(arg_5_0.backGo_, false)
			SetActive(arg_5_0.descGo_, false)
			SetActive(arg_5_0.addBtn_.gameObject, false)
			SetActive(arg_5_0.content_, false)
		end, function()
			SetActive(arg_5_0.shareGo_, true)
			SetActive(arg_5_0.backGo_, true)
			SetActive(arg_5_0.descGo_, true)
			SetActive(arg_5_0.addBtn_.gameObject, true)

			if #arg_5_0.list_ > 1 then
				SetActive(arg_5_0.content_, true)
			end
		end)
	end)
	arg_5_0:AddBtnListener(arg_5_0.addBtn_, nil, function()
		local var_10_0 = getData("illustrated", "loading")

		if not var_10_0 or var_10_0 == 0 then
			JumpTools.OpenPageByJump("illustratedPop", {
				ID = arg_5_0.ID_
			})
			saveData("illustrated", "loading", 1)
		elseif IllustratedData:IsInLoadingSet(arg_5_0.ID_) then
			IllustratedAction.ChangeLoadingSet(false, arg_5_0.ID_)
		else
			if #IllustratedData:GetAllLoadingSet() >= GameSetting.loading_pic_max.value[1] then
				ShowTips("SET_FAILED")

				return
			end

			IllustratedAction.ChangeLoadingSet(true, arg_5_0.ID_)
			ShowTips("SET_CONFIRMED")
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		if #arg_5_0.list_ > 1 then
			local var_11_0 = table.indexof(arg_5_0.list_, arg_5_0.ID_)

			if var_11_0 ~= #arg_5_0.list_ then
				arg_5_0.ID_ = arg_5_0.list_[var_11_0 + 1]
			else
				arg_5_0.ID_ = arg_5_0.list_[1]
			end

			arg_5_0:RefreshUI()
		end
	end)
end

function var_0_0.OnEnter(arg_12_0)
	arg_12_0.ID_ = arg_12_0.params_.ID

	local var_12_0 = CollectPictureCfg.get_id_list_by_group_id[CollectPictureCfg[arg_12_0.ID_].group_id] or {}

	arg_12_0.list_ = {}

	for iter_12_0, iter_12_1 in pairs(var_12_0) do
		local var_12_1 = IllustratedData:GetIllustrationInfo()[iter_12_1]

		if var_12_1 ~= nil and var_12_1.is_receive == 1 then
			table.insert(arg_12_0.list_, iter_12_1)
		end
	end

	table.sort(arg_12_0.list_, function(arg_13_0, arg_13_1)
		local var_13_0 = CollectPictureCfg[arg_13_0]
		local var_13_1 = CollectPictureCfg[arg_13_1]

		return var_13_0.group_display_order < var_13_1.group_display_order
	end)
	SetActive(arg_12_0.content_, #arg_12_0.list_ > 1)

	arg_12_0.bgBtn_.interactable = #arg_12_0.list_ > 1

	arg_12_0:RefreshLiner()
	arg_12_0:RefreshUI()
end

function var_0_0.RefreshLiner(arg_14_0)
	arg_14_0:SetBarPosition(0)

	local var_14_0 = arg_14_0.sliderBg_.transform.childCount
	local var_14_1 = #arg_14_0.list_
	local var_14_2 = var_14_1 < var_14_0 and var_14_0 or var_14_1

	for iter_14_0 = 1, var_14_2 do
		if iter_14_0 <= var_14_0 then
			local var_14_3 = arg_14_0.sliderBg_.transform:GetChild(iter_14_0 - 1)

			if iter_14_0 <= var_14_1 then
				SetActive(var_14_3.gameObject, true)
			else
				SetActive(var_14_3.gameObject, false)
			end
		else
			local var_14_4 = Object.Instantiate(arg_14_0.barTemp_, arg_14_0.sliderBg_.transform)

			SetActive(var_14_4, true)
		end
	end
end

function var_0_0.SetBarPosition(arg_15_0, arg_15_1)
	arg_15_0.selectItem_.transform:SetSiblingIndex(arg_15_1)
end

function var_0_0.RefreshUI(arg_16_0)
	function _RefreshUI()
		arg_16_0.imageImg_.spriteSync = "TextureConfig/Background/" .. CollectPictureCfg[arg_16_0.ID_].picture
		arg_16_0.titleText_.text = GetI18NText(CollectPictureCfg[arg_16_0.ID_].name)
		arg_16_0.descText_.text = GetI18NText(CollectPictureCfg[arg_16_0.ID_].desc)

		arg_16_0:RefreshLoading()

		local var_17_0 = table.indexof(arg_16_0.list_, arg_16_0.ID_)

		arg_16_0:SetBarPosition(var_17_0 - 1)
	end

	arg_16_0:CheckNeedDownloadAssets(_RefreshUI)
end

function var_0_0.CheckNeedDownloadAssets(arg_18_0, arg_18_1)
	local var_18_0 = "TextureConfig/Background/" .. CollectPictureCfg[arg_18_0.ID_].picture
	local var_18_1 = {
		var_18_0
	}

	if AssetDownloadManager.CheckResourcesNeedDownload(var_18_1) then
		arg_18_0.imageImg_.spriteSync = nil

		SetForceShowQuanquan(true)
		AssetDownloadManager.Create()
		AssetDownloadManager.Instance:AddResourceToDownloadQueue(var_18_1)
		AssetDownloadManager.Instance:Run(nil, function()
			AssetDownloadManager.Destroy()
			arg_18_1()
			SetForceShowQuanquan(false)
		end, function()
			AssetDownloadManager.Destroy()
			SetForceShowQuanquan(false)
		end)
	else
		arg_18_1()
	end
end

function var_0_0.RefreshLoading(arg_21_0)
	arg_21_0.loadCon_:SetSelectedState(IllustratedData:IsInLoadingSet(arg_21_0.ID_) and "true" or "false")
end

function var_0_0.OnSaveLoadingSet(arg_22_0)
	arg_22_0:RefreshLoading()
end

function var_0_0.OnExitInput(arg_23_0)
	JumpTools.Back()

	return true
end

function var_0_0.OnExit(arg_24_0)
	return
end

function var_0_0.Dispose(arg_25_0)
	var_0_0.super.Dispose(arg_25_0)
end

return var_0_0
