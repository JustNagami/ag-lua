local var_0_0 = class("V210MusicSettingView", ReduxView)
local var_0_1 = 5
local var_0_2 = 1
local var_0_3 = 50
local var_0_4 = -50
local var_0_5 = 50
local var_0_6 = -50
local var_0_7 = 100
local var_0_8 = 0

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_10/JapanRegionMusicUI/MusicSetUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	local var_3_0 = Asset.Load("Music/V210MusicSet")

	arg_3_0.musicSetGo = Object.Instantiate(var_3_0)
	arg_3_0.musicSetController = arg_3_0.musicSetGo:GetComponent("MusicSetController")
	arg_3_0.isVertical = MusicData:GetVerical()
	arg_3_0.spectralType = MusicData:GetSpectralType()

	arg_3_0:SetMusicCamera()

	arg_3_0.speedNum = 0
	arg_3_0.judgeNum = 0
	arg_3_0.screanNum = 0
	arg_3_0.showMovie = true
	arg_3_0.test = true
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.m_speedSlider.minValue = var_0_2
	arg_4_0.m_speedSlider.maxValue = var_0_1
	arg_4_0.m_judgeSlider.minValue = var_0_4
	arg_4_0.m_judgeSlider.maxValue = var_0_3
	arg_4_0.m_screanSlider.minValue = var_0_6
	arg_4_0.m_screanSlider.maxValue = var_0_5
	arg_4_0.m_volumeSlider.minValue = var_0_8
	arg_4_0.m_volumeSlider.maxValue = var_0_7
	arg_4_0.ratingController = ControllerUtil.GetController(arg_4_0.transform_, "rating")
	arg_4_0.testController = ControllerUtil.GetController(arg_4_0.transform_, "test")
	arg_4_0.pathController = ControllerUtil.GetController(arg_4_0.transform_, "path")
	arg_4_0.spectralController = ControllerUtil.GetController(arg_4_0.transform_, "spectral")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0.m_speedSlider.onValueChanged:AddListener(function()
		local var_6_0 = string.format("%.1f", arg_5_0.m_speedSlider.value)

		arg_5_0.speedNum = tonumber(var_6_0)
		arg_5_0.m_speedLab.text = arg_5_0.speedNum

		arg_5_0:ChangeSpeed()
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_speedAddBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.speedNum < var_0_1 then
			arg_5_0.speedNum = arg_5_0.speedNum + 0.1
			arg_5_0.speedNum = math.min(arg_5_0.speedNum, var_0_1)
			arg_5_0.m_speedSlider.value = arg_5_0.speedNum
			arg_5_0.m_speedLab.text = arg_5_0.speedNum

			arg_5_0:ChangeSpeed()

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_speedDelBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.speedNum > var_0_2 then
			arg_5_0.speedNum = arg_5_0.speedNum - 0.1
			arg_5_0.speedNum = math.max(arg_5_0.speedNum, var_0_2)
			arg_5_0.m_speedSlider.value = arg_5_0.speedNum
			arg_5_0.m_speedLab.text = arg_5_0.speedNum

			arg_5_0:ChangeSpeed()

			return true
		end

		return false
	end)
	arg_5_0.m_judgeSlider.onValueChanged:AddListener(function()
		local var_9_0 = string.format("%.0f", arg_5_0.m_judgeSlider.value)

		arg_5_0.judgeNum = tonumber(var_9_0)
		arg_5_0.m_judgeLab.text = arg_5_0.judgeNum

		arg_5_0:ChangeJudge()
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_judgeAddBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.judgeNum < var_0_3 then
			arg_5_0.judgeNum = arg_5_0.judgeNum + 1
			arg_5_0.judgeNum = math.min(arg_5_0.judgeNum, var_0_3)
			arg_5_0.m_judgeSlider.value = arg_5_0.judgeNum
			arg_5_0.m_judgeLab.text = arg_5_0.judgeNum

			arg_5_0:ChangeJudge()

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_judgeDelBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.judgeNum > var_0_4 then
			arg_5_0.judgeNum = arg_5_0.judgeNum - 1
			arg_5_0.judgeNum = math.max(arg_5_0.judgeNum, var_0_4)
			arg_5_0.m_judgeSlider.value = arg_5_0.judgeNum
			arg_5_0.m_judgeLab.text = arg_5_0.judgeNum

			arg_5_0:ChangeJudge()

			return true
		end

		return false
	end)
	arg_5_0.m_screanSlider.onValueChanged:AddListener(function()
		local var_12_0 = string.format("%.0f", arg_5_0.m_screanSlider.value)

		arg_5_0.screanNum = tonumber(var_12_0)
		arg_5_0.m_screanLab.text = arg_5_0.screanNum

		arg_5_0:ChangeScreen()
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_screanAddBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.screanNum < var_0_5 then
			arg_5_0.screanNum = arg_5_0.screanNum + 1
			arg_5_0.screanNum = math.min(arg_5_0.screanNum, var_0_5)
			arg_5_0.m_screanSlider.value = arg_5_0.screanNum
			arg_5_0.m_screanLab.text = arg_5_0.screanNum

			arg_5_0:ChangeScreen()

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_screanDelBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.screanNum > var_0_6 then
			arg_5_0.screanNum = arg_5_0.screanNum - 1
			arg_5_0.screanNum = math.max(arg_5_0.screanNum, var_0_6)
			arg_5_0.m_screanSlider.value = arg_5_0.screanNum
			arg_5_0.m_screanLab.text = arg_5_0.screanNum

			arg_5_0:ChangeScreen()

			return true
		end

		return false
	end)
	arg_5_0.m_volumeSlider.onValueChanged:AddListener(function()
		local var_15_0 = string.format("%.0f", arg_5_0.m_volumeSlider.value)

		arg_5_0.volumeNum = tonumber(var_15_0)
		arg_5_0.m_volumeLab.text = arg_5_0.volumeNum

		arg_5_0:ChangeVolume()
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_volumeAddBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.volumeNum < var_0_7 then
			arg_5_0.volumeNum = arg_5_0.volumeNum + 1
			arg_5_0.volumeNum = math.min(arg_5_0.volumeNum, var_0_7)
			arg_5_0.m_volumeSlider.value = arg_5_0.volumeNum
			arg_5_0.m_volumeLab.text = arg_5_0.volumeNum

			arg_5_0:ChangeVolume()

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.m_volumeDelBtn.gameObject, 3, 0.5, 0.2, function()
		if arg_5_0.volumeNum > var_0_8 then
			arg_5_0.volumeNum = arg_5_0.volumeNum - 1
			arg_5_0.volumeNum = math.max(arg_5_0.volumeNum, var_0_8)
			arg_5_0.m_volumeSlider.value = arg_5_0.volumeNum
			arg_5_0.m_volumeLab.text = arg_5_0.volumeNum

			arg_5_0:ChangeVolume()

			return true
		end

		return false
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_testOn, nil, function()
		arg_5_0:ChangeTestBool(true)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_testOff, nil, function()
		arg_5_0:ChangeTestBool(false)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_pathOn, nil, function()
		arg_5_0:ChangeVericalBool(false)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_pathOff, nil, function()
		arg_5_0:ChangeVericalBool(true)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_mirrorOn, nil, function()
		arg_5_0:ChangeSpectralType(MusicConst.MusicSpectralType.Mirror)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_mirrorOff, nil, function()
		arg_5_0:ChangeSpectralType(MusicConst.MusicSpectralType.None)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_RandomOn, nil, function()
		arg_5_0:ChangeSpectralType(MusicConst.MusicSpectralType.Random)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_RandomOff, nil, function()
		arg_5_0:ChangeSpectralType(MusicConst.MusicSpectralType.None)
	end)
end

function var_0_0.OnTop(arg_26_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_27_0)
	arg_27_0:SetMusicCamera()
	arg_27_0.ratingController:SetSelectedIndex(0)
	arg_27_0:InitBackScene()

	arg_27_0.isVertical = MusicData:GetVerical()
	arg_27_0.spectralType = MusicData:GetSpectralType()
	arg_27_0.speedNum = MusicData:GetSpeedValue(arg_27_0.isVertical)
	arg_27_0.m_speedSlider.value = arg_27_0.speedNum
	arg_27_0.m_speedLab.text = arg_27_0.speedNum

	arg_27_0:ChangeSpeed()

	arg_27_0.judgeNum = MusicData:GetJudgeValue()
	arg_27_0.m_judgeSlider.value = arg_27_0.judgeNum
	arg_27_0.m_judgeLab.text = arg_27_0.judgeNum

	arg_27_0:ChangeJudge()

	arg_27_0.screanNum = MusicData:GetScreanValue()
	arg_27_0.m_screanSlider.value = arg_27_0.screanNum
	arg_27_0.m_screanLab.text = arg_27_0.screanNum

	arg_27_0:ChangeScreen()

	arg_27_0.volumeNum = MusicData:GetVolumeValue()
	arg_27_0.m_volumeSlider.value = arg_27_0.volumeNum
	arg_27_0.m_volumeLab.text = arg_27_0.volumeNum

	arg_27_0:ChangeVolume()
	arg_27_0:ChangeVericalBool(arg_27_0.isVertical, true)
	arg_27_0:ChangeSpectralType(arg_27_0.spectralType)

	arg_27_0.test = arg_27_0.musicSetController.autoClick

	arg_27_0.testController:SetSelectedIndex(arg_27_0.test and 1 or 0)
	SetActive(arg_27_0.musicSetGo, true)

	arg_27_0.raycaster = manager.ui.mainCamera:AddComponent(typeof(PhysicsRaycaster))

	arg_27_0.musicSetController:Begain()
end

function var_0_0.OnExit(arg_28_0)
	manager.windowBar:HideBar()

	if arg_28_0.raycaster then
		Object.Destroy(arg_28_0.raycaster_)
	end

	arg_28_0.musicSetController:End()
	SetActive(arg_28_0.musicSetGo, false)
	MusicData:SetSpeedValue(arg_28_0.speedNum, arg_28_0.isVertical)
	MusicData:SetJudgeValue(arg_28_0.judgeNum)
	MusicData:SetScreanValue(arg_28_0.screanNum)
	MusicData:SetVolumeValue(arg_28_0.volumeNum)
	MusicData:SetShoMovie(arg_28_0.showMovie)
	MusicData:SetVerical(arg_28_0.isVertical)
	MusicData:SetSpectralType(arg_28_0.spectralType)
	SDKTools.SendMessageToSDK("activity_music_setting", {
		activity_id = ActivityConst.VOLUME_MUSIC,
		speed = tostring(arg_28_0.speedNum),
		time = tostring(arg_28_0.judgeNum),
		other_data = MusicData:GetSpectralAndVercialSDKKey()
	})

	if arg_28_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_28_0.backGround_, ASSET_TYPE.SCENE)
	end
end

function var_0_0.SetMusicCamera(arg_29_0)
	if arg_29_0.isVertical then
		manager.ui:SetMainCamera("musicSetVertical")
	else
		manager.ui:SetMainCamera("musicSet")
	end

	arg_29_0:AdaptiveSetGo()
end

function var_0_0.AdaptiveSetGo(arg_30_0)
	local var_30_0 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera
	local var_30_1 = arg_30_0.setPosTrs_.position
	local var_30_2 = UnityEngine.RectTransformUtility.WorldToScreenPoint(var_30_0, var_30_1)
	local var_30_3 = manager.ui.mainCamera.transform.localPosition.z
	local var_30_4 = manager.ui.mainCameraCom_:ScreenToWorldPoint(Vector3(var_30_2.x, var_30_2.y, 50)).x + (arg_30_0.isVertical and 0 or 3)

	arg_30_0.musicSetGo.transform.position = Vector3(var_30_4, 0, 0)
end

function var_0_0.ChangeSpeed(arg_31_0)
	local var_31_0 = 5 - arg_31_0.speedNum
	local var_31_1 = 1500
	local var_31_2 = 350
	local var_31_3 = var_31_2 + var_31_0 * (var_31_1 - var_31_2) / 4

	arg_31_0.musicSetController.stayTime = var_31_3
end

function var_0_0.ChangeJudge(arg_32_0)
	local var_32_0 = arg_32_0.judgeNum
	local var_32_1 = math.abs(var_32_0) / 50 * 300

	if var_32_0 < 0 then
		var_32_1 = -1 * var_32_1
	end

	MusicGame.MusicSetController.latency = var_32_1 - 42
end

function var_0_0.ChangeScreen(arg_33_0)
	local var_33_0 = arg_33_0.screanNum
	local var_33_1 = math.abs(var_33_0) / 50 * 300

	if var_33_0 < 0 then
		var_33_1 = -1 * var_33_1
	end

	MusicGame.MusicSetController.judgeLatency = var_33_1
end

function var_0_0.ChangeVolume(arg_34_0)
	local var_34_0 = arg_34_0.volumeNum
	local var_34_1 = math.abs(var_34_0) / 100

	manager.audio:SetEffectAisacControl("musicgame_hitsound_volume", var_34_1)
end

function var_0_0.ChangeTestBool(arg_35_0, arg_35_1)
	if arg_35_0.test == arg_35_1 then
		return
	end

	arg_35_0.test = arg_35_1

	arg_35_0.testController:SetSelectedIndex(arg_35_0.test and 1 or 0)

	arg_35_0.musicSetController.autoClick = arg_35_1
end

function var_0_0.ChangeSpectralType(arg_36_0, arg_36_1)
	arg_36_0.spectralType = arg_36_1

	local var_36_0

	if arg_36_1 == MusicConst.MusicSpectralType.None then
		var_36_0 = 0
	elseif arg_36_1 == MusicConst.MusicSpectralType.Mirror then
		var_36_0 = 1
	elseif arg_36_1 == MusicConst.MusicSpectralType.Random then
		var_36_0 = 2
	end

	if var_36_0 then
		arg_36_0.spectralController:SetSelectedIndex(var_36_0)
	end
end

function var_0_0.ChangeVericalBool(arg_37_0, arg_37_1, arg_37_2)
	if not arg_37_2 and arg_37_1 == arg_37_0.isVertical then
		return
	end

	MusicData:SetSpeedValue(arg_37_0.speedNum, arg_37_0.isVertical)

	arg_37_0.isVertical = arg_37_1
	arg_37_0.speedNum = MusicData:GetSpeedValue(arg_37_0.isVertical)
	arg_37_0.m_speedSlider.value = arg_37_0.speedNum
	arg_37_0.m_speedLab.text = arg_37_0.speedNum

	arg_37_0.pathController:SetSelectedIndex(arg_37_0.isVertical and 0 or 1)

	MusicGame.MusicSetController.isVertical = arg_37_1

	arg_37_0:ChangeSpeed()
	arg_37_0:SetMusicCamera()
end

function var_0_0.InitBackScene(arg_38_0)
	local var_38_0 = "UI/Common/BackgroundQuad"

	arg_38_0.backGround_ = manager.resourcePool:Get(var_38_0, ASSET_TYPE.SCENE)
	arg_38_0.backGroundTrs_ = arg_38_0.backGround_.transform

	arg_38_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

	arg_38_0.backGroundTrs_.localPosition = Vector3(0, 0, 100)
	arg_38_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)
	arg_38_0.backGroundTrs_.localScale = Vector3(11, 11, 1)
	arg_38_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = arg_38_0.bgImg_.sprite
end

function var_0_0.OnMusicSetNodeHit(arg_39_0, arg_39_1, arg_39_2)
	SetActive(arg_39_0.m_effect, false)
	SetActive(arg_39_0.m_effect, true)

	if arg_39_1 ~= MusicConst.MusicNodeHitRating.Miss and (MusicConst.MusicNodeHitType.Short == arg_39_2 or MusicConst.MusicNodeHitType.Long == arg_39_2) then
		manager.audio:PlayEffect("minigame_activity_2_0", "minigame_activity_2_0_musicgame_hitsound", "")
	end

	if MusicConst.MusicNodeHitRating.PerfectPlus == arg_39_1 then
		arg_39_0.ratingController:SetSelectedIndex(4)
	elseif MusicConst.MusicNodeHitRating.Perfect == arg_39_1 then
		arg_39_0.ratingController:SetSelectedIndex(3)
	elseif MusicConst.MusicNodeHitRating.Good == arg_39_1 then
		arg_39_0.ratingController:SetSelectedIndex(2)
	else
		arg_39_0.ratingController:SetSelectedIndex(1)
	end
end

return var_0_0
