local var_0_0 = class("IdolTraineeCampView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/IdolTrainee/IdolTraineeCampView"
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

	arg_4_0.quickView = BackHomeQuickJumpView.New(arg_4_0.quickJumpSubView_)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		JumpTools.OpenPageByJump("/idolTraineeQuest")
	end)
	arg_5_0:AddBtnListener(arg_5_0.changeHeroBtn_, nil, function()
		JumpTools.OpenPageByJump("/idolTraineeDepolyChara")
	end)
	arg_5_0:AddBtnListener(arg_5_0.heroPropBtn_, nil, function()
		JumpTools.OpenPageByJump("/idolTraineeTrain")
	end)
	arg_5_0:AddBtnListener(arg_5_0.pvpBtn_, nil, function()
		JumpTools.OpenPageByJump("/idolTraineeEnterBattleView", {
			pvpBattle = true
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.challengeBtn_, nil, function()
		JumpTools.OpenPageByJump("/idolTraineeChapterMain")
	end)
	arg_5_0.quickView:AddClickCallBack(function()
		manager.windowBar:HideBar()
	end)
	arg_5_0.quickView:CloseCallBack(function()
		arg_5_0:RefreshBar()
	end)
end

local var_0_1 = {
	"CamShootAtPos1",
	"CamShootAtPos2",
	"CamShootAtPos3",
	"CamShootAtPos4",
	"CamShootAtPos5"
}

function var_0_0.RestoreVCam(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(var_0_1) do
		IdolTraineeCampBridge.SetVCamActive(iter_13_1, false)
	end

	if IdolTraineeCampBridge.cinemachineBrain.IsBlending then
		arg_13_0:StartWaitCamBlend()
	end
end

function var_0_0.RegisterEvents(arg_14_0)
	arg_14_0:RegistEventListener(DORM_CLICK_ENTITY, function(arg_15_0)
		manager.windowBar:HideBar()

		local var_15_0 = IdolTraineeCampBridge.GetPosByCharacter(arg_15_0)

		IdolTraineeCampBridge.SetVCamActive(var_0_1[var_15_0], true)
		arg_14_0:StartWaitCamBlend(function()
			JumpTools.OpenPageByJump("/heroInteractView", {
				heroEID = arg_15_0,
				camPos = var_0_1[var_15_0]
			})
		end)
		DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.InteractCam)
	end)
end

function var_0_0.StartWaitCamBlend(arg_17_0, arg_17_1)
	arg_17_0:StopWaitCamBlend()
	SetActive(arg_17_0.gameObject_, false)

	arg_17_0.timer = Timer.New(function()
		if not IdolTraineeCampBridge.cinemachineBrain.IsBlending then
			arg_17_0:StopWaitCamBlend()
			SetActive(arg_17_0.gameObject_, true)

			if arg_17_1 then
				arg_17_1()
			end
		end
	end, 0.34, -1)

	arg_17_0.timer:Start()
end

function var_0_0.StopWaitCamBlend(arg_19_0)
	if arg_19_0.timer then
		arg_19_0.timer:Stop()

		arg_19_0.timer = nil
	end
end

function var_0_0.OnEnter(arg_20_0)
	arg_20_0:RefreshBar()
	arg_20_0:RegisterEvents()
	arg_20_0.quickView:OnEnter()
	arg_20_0.quickView:ShowView(false)
	arg_20_0:RestoreVCam()
	manager.redPoint:bindUIandKey(arg_20_0.taskBtn_.transform, RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK)
	BackHomeCricketBattleData:InvokeDanceBackCB()
end

function var_0_0.RefreshBar(arg_21_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		JumpTools.OpenPageByJump("/dormChooseRoomView")
	end)
	manager.windowBar:RegistHomeCallBack(function()
		BackHomeTools:BackHomeGotoMain()
	end)

	local var_21_0 = GameSetting.idol_dance_info_describe.value

	if #var_21_0 > 0 then
		manager.windowBar:SetGameHelpKey({
			view = "/gameHelpPro",
			type = "jump",
			params = {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = var_21_0
			}
		})
	end
end

function var_0_0.OnExit(arg_24_0)
	manager.windowBar:HideBar()
	arg_24_0:RemoveAllEventListener()
	arg_24_0:StopWaitCamBlend()
	arg_24_0.quickView:OnExit()
	manager.redPoint:unbindUIandKey(arg_24_0.taskBtn_.transform, RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK)
end

function var_0_0.Dispose(arg_25_0)
	arg_25_0.quickView:Dispose()
	arg_25_0:StopWaitCamBlend()
	var_0_0.super.Dispose(arg_25_0)
end

return var_0_0
