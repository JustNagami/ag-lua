﻿local var_0_0 = class("SkillSettingToggle", BaseSettingToggle)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	return
end

function var_0_0.GetName(arg_2_0)
	return "AssetPend"
end

function var_0_0.UIClass(arg_3_0)
	return AssetPendSettingView
end

function var_0_0.GetPath(arg_4_0)
	return "Widget/System/Setting/AssetPend/AssetPendSettingUI"
end

function var_0_0.Order(arg_5_0)
	return 20
end

function var_0_0.RedPointKey(arg_6_0)
	return nil
end

function var_0_0.Image(arg_7_0)
	return getSprite("Atlas/SettingAtlas", "icon_setting15")
end

function var_0_0.GetParams(arg_8_0)
	return
end

function var_0_0.IsSetting(arg_9_0)
	return false
end

return var_0_0