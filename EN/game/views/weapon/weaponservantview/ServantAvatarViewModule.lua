local var_0_0 = class("ServantAvatarViewModule", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:BuildContext()
	arg_2_0:AddUIListener()
end

function var_0_0.BuildContext(arg_3_0)
	local var_3_0 = arg_3_0:FindCom("UIScaleImage", nil, arg_3_0.scaleImageObj_)

	arg_3_0.staticVar = {
		sliderIsHiden = true,
		scaleImage = var_3_0,
		minValue = var_3_0.minScale,
		maxValue = var_3_0.maxScale,
		ScaleLen = var_3_0.maxScale - var_3_0.minScale,
		hidenTimer = Timer.New(function()
			arg_3_0:OnHidenTimerReached()
		end, 2, -1)
	}
	arg_3_0.controller = {
		comps = arg_3_0.controller_,
		state = {
			checkView = {
				False = "false",
				name = "checkView",
				True = "true",
				comps = arg_3_0.controller_:GetController("checkView")
			}
		}
	}
	arg_3_0.servantId = nil
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.closeBtn_, nil, function()
		arg_5_0:OnCloseBtnClick()
	end)
	arg_5_0.avatarSlider_.onValueChanged:AddListener(function(arg_7_0)
		arg_5_0:OnAvatarSliderChanged(arg_7_0)
	end)
	arg_5_0.staticVar.scaleImage.onScaleEvent:AddListener(function(arg_8_0)
		arg_5_0:OnAvatarScale(arg_8_0)
	end)
	arg_5_0.staticVar.scaleImage.onValueChanged:AddListener(function()
		arg_5_0:RestartAvatarBar()
	end)
	arg_5_0:AddBtnListener(arg_5_0.subBtn_, nil, function()
		arg_5_0:OnSliderBtnChange(-0.05)
	end)
	arg_5_0:AddBtnListener(arg_5_0.addBtn_, nil, function()
		arg_5_0:OnSliderBtnChange(0.05)
	end)
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0:RemoveAllListeners()
	arg_12_0.staticVar.scaleImage.onScaleEvent:RemoveAllListeners()
	arg_12_0.staticVar.scaleImage.onValueChanged:RemoveAllListeners()

	arg_12_0.staticVar.scaleImage = nil

	arg_12_0.avatarSlider_.onValueChanged:RemoveAllListeners()
	arg_12_0.staticVar.hidenTimer:Stop()

	arg_12_0.staticVar.hidenTimer = nil

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.RegisterCloseCallback(arg_13_0, arg_13_1)
	arg_13_0.staticVar.closeCallback = arg_13_1
end

function var_0_0.EnterAvatarView(arg_14_0, arg_14_1)
	if arg_14_1 then
		arg_14_0:SwitchControllerState(arg_14_0.controller.state.checkView.name, arg_14_0.controller.state.checkView.True)

		arg_14_0.staticVar.scaleImage.enabled = true
		arg_14_0.staticVar.sliderIsHiden = true

		arg_14_0:OnAvatarScale(1)
		arg_14_0:RestartTimer()
		SetActive(arg_14_0.gameObject_, true)
	else
		arg_14_0:SwitchControllerState(arg_14_0.controller.state.checkView.name, arg_14_0.controller.state.checkView.False)

		arg_14_0.staticVar.scaleImage.enabled = false

		arg_14_0:ResetAvatar()
		arg_14_0.staticVar.hidenTimer:Stop()
		SetActive(arg_14_0.gameObject_, false)
	end
end

function var_0_0.OnCloseBtnClick(arg_15_0)
	local var_15_0 = arg_15_0.staticVar.closeCallback

	if var_15_0 then
		var_15_0()
	end
end

function var_0_0.OnSliderBtnChange(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.avatarSlider_.value + arg_16_1

	if var_16_0 > 1 then
		var_16_0 = 1
	end

	if var_16_0 < 0 then
		var_16_0 = 0
	end

	arg_16_0.avatarSlider_.value = var_16_0
end

function var_0_0.SetAvatarSprite(arg_17_0, arg_17_1)
	arg_17_0.avatarIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/WeaponServant/Portrait/" .. arg_17_1)
	arg_17_0.servantId = arg_17_1
end

function var_0_0.ResetAvatar(arg_18_0)
	arg_18_0.staticVar.scaleImage:ResetContent()
end

function var_0_0.OnAvatarSliderChanged(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.staticVar.ScaleLen * arg_19_1 + arg_19_0.staticVar.minValue

	arg_19_0.staticVar.scaleImage:SetScale(var_19_0)
	arg_19_0:RestartTimer()
end

function var_0_0.OnAvatarScale(arg_20_0, arg_20_1)
	arg_20_0:RestartAvatarBar()

	local var_20_0 = (arg_20_1 - arg_20_0.staticVar.minValue) / arg_20_0.staticVar.ScaleLen

	arg_20_0.avatarSlider_.value = var_20_0
end

function var_0_0.RestartAvatarBar(arg_21_0)
	SetActive(arg_21_0.sliderObj_, true)

	arg_21_0.staticVar.sliderIsHiden = false

	arg_21_0:RestartTimer()
end

function var_0_0.SwitchControllerState(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.controller.state[arg_22_1]

	if var_22_0 and var_22_0.comps then
		var_22_0.comps:SetSelectedState(arg_22_2)
	end
end

function var_0_0.OnHidenTimerReached(arg_23_0)
	SetActive(arg_23_0.sliderObj_, false)

	arg_23_0.staticVar.sliderIsHiden = true

	arg_23_0.staticVar.hidenTimer:Stop()
end

function var_0_0.RestartTimer(arg_24_0)
	arg_24_0.staticVar.hidenTimer:Stop()

	arg_24_0.staticVar.hidenTimer = Timer.New(function()
		arg_24_0:OnHidenTimerReached()
	end, 2, -1)

	arg_24_0.staticVar.hidenTimer:Start()
end

return var_0_0
