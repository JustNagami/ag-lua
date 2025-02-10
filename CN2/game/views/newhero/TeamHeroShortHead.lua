local var_0_0 = class("TeamHeroShortHead", HeroShortHead)

function var_0_0.AddUIListener(arg_1_0)
	arg_1_0:AddBtnListener(arg_1_0.selfBtn_, nil, function()
		if arg_1_0.clickListener_ ~= nil then
			arg_1_0.clickListener_(arg_1_0.heroCfg_.id)
		end
	end)
end

return var_0_0
