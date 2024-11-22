IlluMusicInfoItem = import("game.views.IllustratedHandleBook.IlluMusic.IlluMusicInfoItem")

local var_0_0 = class("VolumeMusicMainItem", IlluMusicInfoItem)

function var_0_0.InitUI(arg_1_0)
	var_0_0.super.InitUI(arg_1_0)
	arg_1_0.m_animator:Play("detail_item_off", -1, 1)
end

function var_0_0.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.m_btn, nil, function()
		if arg_2_0.clickFunc2 then
			arg_2_0.clickFunc2(arg_2_0.index)
		end
	end)
end

function var_0_0.RegistCallBack(arg_4_0, arg_4_1)
	arg_4_0.clickFunc2 = arg_4_1
end

function var_0_0.UpdateAnima(arg_5_0, arg_5_1)
	if arg_5_1 == arg_5_0.index then
		arg_5_0.m_animator:Play("detail_item_off", -1, 0)
	else
		arg_5_0.m_animator:Play("detail_item_off", -1, 1)
	end
end

return var_0_0
