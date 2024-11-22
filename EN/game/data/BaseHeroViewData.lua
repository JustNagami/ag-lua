local var_0_0 = class("BaseHeroViewData")

function var_0_0.GetHeroList(arg_1_0)
	Debug.LogError("Need to override function GetHeroList()")

	return {}
end

function var_0_0.GetHeroIDList(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_0:GetHeroList(arg_2_1)

	for iter_2_0, iter_2_1 in pairs(var_2_1) do
		table.insert(var_2_0, iter_2_1.id)
	end

	return var_2_0
end

function var_0_0.GetHeroData(arg_3_0, arg_3_1)
	return arg_3_0:GetHeroList()[arg_3_1]
end

function var_0_0.GetEquipInfoList(arg_4_0, arg_4_1)
	return arg_4_0:GetHeroData(arg_4_1):GetEquipInfoList()
end

function var_0_0.GetEquipDataList(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = arg_5_0:GetEquipInfoList(arg_5_1)

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if iter_5_1.equip_id ~= 0 then
			table.insert(var_5_0, EquipData:GetEquipData(iter_5_1.equip_id))
		else
			local var_5_2 = EquipStruct.New(0, iter_5_1.equip_id)

			table.insert(var_5_0, var_5_2)
		end
	end

	return var_5_0
end

function var_0_0.GetHeroWeaponInfo(arg_6_0, arg_6_1)
	return arg_6_0:GetHeroData(arg_6_1):GetWeaponInfo()
end

function var_0_0.GetHeroServantInfo(arg_7_0, arg_7_1)
	return arg_7_0:GetHeroData(arg_7_1):GetServantInfo()
end

function var_0_0.GetHeroSkillInfoList(arg_8_0, arg_8_1)
	return arg_8_0:GetHeroData(arg_8_1):GetSkillInfoList()
end

function var_0_0.GetHeroTransitionInfoList(arg_9_0, arg_9_1)
	return arg_9_0:GetHeroData(arg_9_1):GetTransitionInfoList()
end

function var_0_0.GetHeroUsingSkinInfo(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetHeroData(arg_10_1)
	local var_10_1 = var_10_0 and var_10_0.using_skin or 0

	if var_10_1 == 0 then
		var_10_1 = arg_10_1
	end

	return SkinCfg[var_10_1]
end

function var_0_0.GetExFilterSorterFunc(arg_11_0)
	return nil
end

return var_0_0
