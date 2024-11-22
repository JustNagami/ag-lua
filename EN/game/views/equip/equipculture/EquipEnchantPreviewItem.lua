local var_0_0 = class("EquipEnchantPreviewItem", ReduxView)

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
	arg_3_0:InitEnchant()

	arg_3_0.stateController_ = arg_3_0.transCon_:GetController("state")
	arg_3_0.skillItemList = {}
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btnChoose_, nil, function()
		arg_4_0:OnEnchantConfirmClick(true)
	end)
	arg_4_0:AddBtnListener(arg_4_0.btnDelete_, nil, function()
		arg_4_0:OnEnchantConfirmClick(false)
	end)
end

function var_0_0.InitEnchant(arg_7_0)
	arg_7_0.skills = {}

	for iter_7_0 = 1, 2 do
		arg_7_0.skills[iter_7_0] = EnchantSkillItem.New(arg_7_0["skill_" .. iter_7_0])
	end
end

function var_0_0.OnEnchantConfirmClick(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.equipId
	local var_8_1 = arg_8_0.enchatPos

	EquipAction.QueryEquipEnchantConfirm(var_8_0, var_8_1, arg_8_1, arg_8_0.index)
end

function var_0_0.Refresh(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	arg_9_0.equipId = arg_9_3
	arg_9_0.prefabId = EquipData:GetEquipData(arg_9_0.equipId).prefab_id
	arg_9_0.enchatPos = arg_9_4
	arg_9_0.index = arg_9_5
	arg_9_0.textIndex_.text = arg_9_0.index
	arg_9_0.isEmpty_ = true

	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		var_9_0[iter_9_1.id] = var_9_0[iter_9_1.id] and var_9_0[iter_9_1.id] + 1 or 1
	end

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.skills) do
		local var_9_1

		if arg_9_1[iter_9_2] then
			arg_9_0.isEmpty_ = false

			local var_9_2 = arg_9_1[iter_9_2].id
			local var_9_3 = {
				isEquip = true,
				level = 1,
				id = arg_9_0.equipId,
				prefab_id = arg_9_0.prefabId
			}
			local var_9_4 = 1

			if arg_9_2 and arg_9_2[var_9_2] then
				local var_9_5 = clone(arg_9_2[var_9_2])

				if not arg_9_6[var_9_2] then
					var_9_5.num = var_9_5.num + 1
				else
					var_9_4 = var_9_0[var_9_2] - arg_9_6[var_9_2]
					var_9_5.num = var_9_5.num + var_9_4
				end

				local var_9_6 = false

				for iter_9_4, iter_9_5 in ipairs(var_9_5.location) do
					if iter_9_5.id == arg_9_0.equipId then
						iter_9_5.level = iter_9_5.level + var_9_4
						var_9_6 = true

						break
					end
				end

				if not var_9_6 then
					table.insert(var_9_5.location, var_9_3)
				end

				var_9_1 = var_9_5
			else
				var_9_1 = {
					num = 1,
					isShowLocate = true,
					id = var_9_2,
					location = {
						var_9_3
					}
				}
			end
		end

		iter_9_3:RefreshData(var_9_1)
		iter_9_3:RegistCallBack(function(arg_10_0, arg_10_1)
			if arg_9_0.skllCallBack then
				arg_9_0.skllCallBack(arg_10_0, arg_10_1)
			end
		end)
	end

	arg_9_0.stateController_:SetSelectedState(arg_9_0.isEmpty_ and "empty" or "notEmpty")
end

function var_0_0.RegistSkillClickCallBck(arg_11_0, arg_11_1)
	arg_11_0.skllCallBack = arg_11_1
end

function var_0_0.ShowAnim(arg_12_0)
	arg_12_0.glowAnim_:Play("glow_bg", -1, 0)
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.skillItemList then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0.skillItemList) do
			iter_13_1:Dispose()
		end

		arg_13_0.skillItemList = {}
	end

	for iter_13_2, iter_13_3 in pairs(arg_13_0.skills) do
		iter_13_3:Dispose()
	end

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
