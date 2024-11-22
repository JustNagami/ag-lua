local var_0_0 = class("RaceCollectRewardItemView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.taskItems_ = {}
end

function var_0_0.indexItem(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2:SetData(arg_4_1, arg_4_0.raceTaskIds_[arg_4_1], arg_4_0.raceId_)
end

function var_0_0.AddUIListener(arg_5_0)
	return
end

function var_0_0.AddEventListeners(arg_6_0)
	return
end

function var_0_0.SetData(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.index_ = arg_7_1
	arg_7_0.raceId_ = arg_7_2
	arg_7_0.raceCfg_ = RaceEffectCfg[arg_7_0.raceId_]
	arg_7_0.raceTaskIds_ = CollectHeroRaceCfg.get_id_list_by_hero_race[arg_7_2]

	arg_7_0:UpdateView()
end

function var_0_0.UpdateView(arg_8_0)
	arg_8_0.nameLabel.text = arg_8_0.raceCfg_.name
	arg_8_0.raceIcon_.sprite = getSprite("Atlas/CampItemAtlas", arg_8_0.raceCfg_.icon)

	for iter_8_0, iter_8_1 in pairs(arg_8_0.raceTaskIds_) do
		if arg_8_0.taskItems_[iter_8_0] == nil then
			arg_8_0.taskItems_[iter_8_0] = RaceCollectRewardConditionItemView.New(arg_8_0.itemGo_, arg_8_0.itemParent_)
		end

		arg_8_0.taskItems_[iter_8_0]:SetData(iter_8_0, iter_8_1, arg_8_0.raceId_)
	end
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:AddEventListeners()
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0:RemoveAllEventListener()
end

function var_0_0.OnMainHomeViewTop(arg_11_0)
	return
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0.data_ = nil

	for iter_12_0, iter_12_1 in pairs(arg_12_0.taskItems_) do
		iter_12_1:Dispose()
	end

	arg_12_0.taskItems_ = {}

	var_0_0.super.Dispose(arg_12_0)
	Object.Destroy(arg_12_0.gameObject_)
end

return var_0_0
