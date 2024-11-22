local var_0_0 = {}

var_0_0.fps = 30

local var_0_1 = 43 / var_0_0.fps

var_0_0.duration = 3.733
var_0_0.sequence = {
	[0] = function(arg_1_0)
		local var_1_0 = arg_1_0.entityID

		Dorm.DormEntityManager.PlayAnimeDuringInteract(var_1_0, "dressingroom", "01", 0)
		Dorm.DormEntityManager.SetFadeCMD(var_1_0, 0)
		Dorm.DormEntityManager.SetPlayerMainColliderEnabled(var_1_0, false)
		Dorm.DormEntityManager.PlayEffect(var_1_0, "root", "Dorm/Effect/houzhai/fx_yigui_huanyifu", -1)
	end,
	[var_0_1] = function(arg_2_0)
		local var_2_0 = arg_2_0.entityID

		arg_2_0.removeOldChara, arg_2_0.oldCharaEID = arg_2_0.oldCharaEID

		Dorm.DormEntityManager.SetFadeCMD(var_2_0, 1)
		Dorm.DormEntityManager.SetPlayerMainColliderEnabled(var_2_0, true)
		DormAction:SetHeroSkin(DormUtils.GetEntityData(var_2_0).cfgID, DormConst.DORM_CHANGESKIN_TYPE.furniture)
	end
}

return var_0_0
