local var_0_0 = class("GraphicSettingView", ReduxView)

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.hander_ = arg_2_1
	arg_2_0.transform_ = arg_2_2.transform
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.info_ = arg_2_3

	arg_2_0:Init()
end

function var_0_0.BindRedPointUI(arg_3_0)
	manager.redPoint:bindUIandKey(arg_3_0.fps120go_.transform, RedPointConst.HIGH_FPS_DEVICE_SURRPORT)
end

function var_0_0.UnBindRedPointUI(arg_4_0)
	manager.redPoint:unbindUIandKey(arg_4_0.fps120go_.transform, RedPointConst.HIGH_FPS_DEVICE_SURRPORT)
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.picQualityList_ = {
		6,
		2,
		3,
		4,
		5,
		7
	}
	arg_5_0.picQualityNum_ = #arg_5_0.picQualityList_
	arg_5_0.picToggle_ = {}
	arg_5_0.picToggleController_ = {}

	for iter_5_0 = 1, arg_5_0.picQualityNum_ do
		local var_5_0 = arg_5_0.picQualityList_[iter_5_0]

		arg_5_0.picToggle_[var_5_0] = arg_5_0["pic" .. var_5_0 .. "Btn_"]

		local var_5_1 = arg_5_0.picToggle_[var_5_0]:GetComponent(typeof(RectTransform))

		arg_5_0.picToggleController_[var_5_0] = ControllerUtil.GetController(var_5_1, "name")
	end
end

function var_0_0.AddUIListener(arg_6_0)
	for iter_6_0 = 1, arg_6_0.picQualityNum_ do
		local var_6_0 = arg_6_0.picQualityList_[iter_6_0]

		arg_6_0:AddBtnListener(arg_6_0.picToggle_[var_6_0], nil, function()
			SettingAction.ChangePicSetting("picOptionId", var_6_0)
		end)
	end

	for iter_6_1 = 1, 3 do
		arg_6_0:AddBtnListener(arg_6_0["fps" .. iter_6_1 .. "Tgl_"], nil, function()
			if arg_6_0.settingData_.frame ~= iter_6_1 - 1 then
				if iter_6_1 == 3 then
					manager.redPoint:setTip(RedPointConst.HIGH_FPS_DEVICE_SURRPORT, 0)

					if GameLocalData:GetCommonModule("highFps").isFirstSet == nil == true then
						ShowMessageBox({
							isTop = true,
							content = GetTips("WARN_HIGH_FPS_TIPS"),
							OkCallback = function()
								SettingAction.ChangePicSetting("frame", iter_6_1 - 1)
								GameLocalData:SaveToCommonModule("highFps", "isFirstSet", false)
							end,
							CancelCallback = function()
								return
							end
						})
					else
						SettingAction.ChangePicSetting("frame", iter_6_1 - 1)
					end

					GameLocalData:SaveToCommonModule("highFps", "checkDevice", true)
				else
					SettingAction.ChangePicSetting("frame", iter_6_1 - 1)
				end
			end
		end)
	end

	for iter_6_2 = 1, 3 do
		arg_6_0:AddBtnListener(arg_6_0["resolution" .. iter_6_2 .. "Tgl_"], nil, function()
			if arg_6_0.settingData_.resolution ~= iter_6_2 then
				SettingAction.ChangePicSetting("resolution", iter_6_2)
			end
		end)
	end

	for iter_6_3 = 1, 3 do
		arg_6_0:AddBtnListener(arg_6_0["teammate" .. iter_6_3 .. "Tgl_"], nil, function()
			if arg_6_0.settingData_.teammate_effect ~= iter_6_3 then
				SettingAction.ChangePicSetting("teammate_effect", iter_6_3)
			end
		end)
	end

	for iter_6_4 = 1, 3 do
		arg_6_0:AddBtnListener(arg_6_0["user" .. iter_6_4 .. "Tgl_"], nil, function()
			if arg_6_0.settingData_.user_effect ~= iter_6_4 then
				SettingAction.ChangePicSetting("user_effect", iter_6_4)
			end
		end)
	end

	arg_6_0:AddBtnListener(arg_6_0.antialiasTgl_, nil, function()
		local var_14_0 = arg_6_0.settingData_.anti_aliasing == 1 and 0 or 1

		if arg_6_0.settingData_.anti_aliasing ~= var_14_0 then
			SettingAction.ChangePicSetting("anti_aliasing", var_14_0)
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.reflectTgl_, nil, function()
		local var_15_0 = arg_6_0.settingData_.reflection_effect == 1 and 0 or 1

		if arg_6_0.settingData_.reflection_effect ~= var_15_0 then
			SettingAction.ChangePicSetting("reflection_effect", var_15_0)
		end
	end)
end

function var_0_0.RefreshPicOption(arg_16_0)
	local var_16_0 = arg_16_0.settingData_.picOptionId

	for iter_16_0, iter_16_1 in pairs(arg_16_0.picToggleController_) do
		if iter_16_0 == var_16_0 then
			iter_16_1:SetSelectedIndex(0)
		else
			iter_16_1:SetSelectedIndex(1)
		end
	end
end

function var_0_0.RefreshFPS(arg_17_0)
	local var_17_0 = arg_17_0.settingData_.frame + 1

	for iter_17_0 = 1, 3 do
		SetActive(arg_17_0[string.format("fps%dCheck_", iter_17_0)], var_17_0 == iter_17_0)
	end
end

function var_0_0.RefreshResolution(arg_18_0)
	local var_18_0 = arg_18_0.settingData_.resolution

	for iter_18_0 = 1, 3 do
		SetActive(arg_18_0[string.format("resolution%dCheck_", iter_18_0)], var_18_0 == iter_18_0)
	end
end

function var_0_0.RefreshTeamMateEffect(arg_19_0)
	local var_19_0 = arg_19_0.settingData_.teammate_effect

	for iter_19_0 = 1, 3 do
		SetActive(arg_19_0[string.format("teammate%dCheck_", iter_19_0)], var_19_0 == iter_19_0)
	end
end

function var_0_0.RefreshUserEffect(arg_20_0)
	local var_20_0 = arg_20_0.settingData_.user_effect

	for iter_20_0 = 1, 3 do
		SetActive(arg_20_0[string.format("user%dCheck_", iter_20_0)], var_20_0 == iter_20_0)
	end
end

function var_0_0.RefreshAntiAlias(arg_21_0)
	local var_21_0 = arg_21_0.settingData_.anti_aliasing

	arg_21_0.antialiasTgl_.transform:GetComponent("ControllerExCollection"):GetController("default0"):SetSelectedIndex(var_21_0)
end

function var_0_0.RefreshReflect(arg_22_0)
	local var_22_0 = arg_22_0.settingData_.reflection_effect

	arg_22_0.reflectTgl_.transform:GetComponent("ControllerExCollection"):GetController("default0"):SetSelectedIndex(var_22_0)
end

function var_0_0.CheckDataChange(arg_23_0, arg_23_1)
	local var_23_0 = ""

	if arg_23_0.tmpSettingData_ and not table.equal(arg_23_0.tmpSettingData_, arg_23_0.settingData_, "all") then
		print("CheckDataChange, 新旧数据不同！！！")

		return true
	end

	return false
end

function var_0_0.SaveData(arg_24_0)
	if arg_24_0:CheckDataChange() then
		arg_24_0.json_ = require("cjson")

		local var_24_0 = deepClone(arg_24_0.settingData_)

		if var_24_0.picOptionId ~= 7 then
			var_24_0.pic = {
				quality = "quality_" .. var_24_0.picOptionId
			}
		end

		var_24_0.type = 1

		local var_24_1 = arg_24_0.json_.encode(var_24_0)
		local var_24_2 = {
			6,
			2,
			3,
			4,
			5,
			7
		}
		local var_24_3 = table.indexof(var_24_2, var_24_0.picOptionId)
		local var_24_4 = 0

		if var_24_3 > 0 then
			var_24_4 = var_24_3 - 1
		end

		SDKTools.SendMessageToSDK("graphics_setting", {
			graphics = var_24_4,
			fps_setting = arg_24_0.settingData_.frame == 0 and 30 or arg_24_0.settingData_.frame == 1 and 60 or 120,
			dpi_setting = arg_24_0.settingData_.resolution,
			teammate_effect_setting = arg_24_0.settingData_.teammate_effect,
			anti_aliasing_setting = arg_24_0.settingData_.anti_aliasing == 0 and "false" or "true",
			reflect_setting = arg_24_0.settingData_.reflection_effect == 0 and "false" or "true",
			user_effect_setting = arg_24_0.settingData_.user_effect
		})

		local var_24_5 = arg_24_0.json_.encode(var_24_0)
	end

	arg_24_0.tmpSettingData_ = deepClone(arg_24_0.settingData_)
end

function var_0_0.RecoverTmpData(arg_25_0)
	if arg_25_0:CheckDataChange() then
		SettingAction.ChangePicSetting("allData", arg_25_0.tmpSettingData_)
	end
end

function var_0_0.OnPicSettingChange(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:RefreshPicOption()

	if arg_26_2.key == "picOptionId" or arg_26_2.key == "allData" then
		arg_26_0:RefreshResolution()
		arg_26_0:RefreshTeamMateEffect()
		arg_26_0:RefreshUserEffect()
		arg_26_0:RefreshFPS()
		arg_26_0:RefreshAntiAlias()
		arg_26_0:RefreshReflect()
	elseif arg_26_2.key == "resolution" then
		arg_26_0:RefreshResolution()
	elseif arg_26_2.key == "teammate_effect" then
		arg_26_0:RefreshTeamMateEffect()
	elseif arg_26_2.key == "frame" then
		arg_26_0:RefreshFPS()
	elseif arg_26_2.key == "anti_aliasing" then
		arg_26_0:RefreshAntiAlias()
	elseif arg_26_2.key == "reflection_effect" then
		arg_26_0:RefreshReflect()
	elseif arg_26_2.key == "user_effect" then
		arg_26_0:RefreshUserEffect()
	end
end

function var_0_0.Init(arg_27_0)
	arg_27_0:InitUI()
	arg_27_0:AddUIListener()
	arg_27_0:OnEnter()
end

function var_0_0.OnEnter(arg_28_0)
	arg_28_0.settingData_ = SettingData:GetPicSettingData()

	arg_28_0:RefreshPicOption()
	arg_28_0:RefreshFPS()
	arg_28_0:RefreshResolution()
	arg_28_0:RefreshTeamMateEffect()
	arg_28_0:RefreshUserEffect()
	arg_28_0:RefreshAntiAlias()
	arg_28_0:RefreshReflect()

	arg_28_0.tmpSettingData_ = deepClone(arg_28_0.settingData_)

	arg_28_0:BindRedPointUI()
end

function var_0_0.OnExit(arg_29_0)
	arg_29_0:UnBindRedPointUI()
end

function var_0_0.Dispose(arg_30_0)
	arg_30_0.hander_ = nil

	var_0_0.super.Dispose(arg_30_0)
end

return var_0_0
