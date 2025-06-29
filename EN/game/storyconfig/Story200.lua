﻿return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 50

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"

			SetActive(arg_1_1.choicesGo_, true)

			for iter_2_0, iter_2_1 in ipairs(arg_1_1.choices_) do
				local var_2_0 = iter_2_0 <= 3

				SetActive(iter_2_1.go, var_2_0)
			end

			arg_1_1.choices_[1].txt.text = arg_1_1:FormatText(StoryChoiceCfg[4].name)
			arg_1_1.choices_[2].txt.text = arg_1_1:FormatText(StoryChoiceCfg[5].name)
			arg_1_1.choices_[3].txt.text = arg_1_1:FormatText(StoryChoiceCfg[6].name)
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play101(arg_1_1)
			end

			if arg_3_0 == 2 then
				arg_1_0:Play113(arg_1_1)
			end

			if arg_3_0 == 3 then
				arg_1_0:Play114(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "1148ui_story"

			if arg_1_1.actors_[var_4_0] == nil then
				local var_4_1 = Asset.Load("Char/" .. "1148ui_story")

				if not isNil(var_4_1) then
					local var_4_2 = Object.Instantiate(Asset.Load("Char/" .. "1148ui_story"), arg_1_1.stage_.transform)

					var_4_2.name = var_4_0
					var_4_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_0] = var_4_2

					local var_4_3 = var_4_2:GetComponentInChildren(typeof(CharacterEffect))

					var_4_3.enabled = true

					local var_4_4 = GameObjectTools.GetOrAddComponent(var_4_2, typeof(DynamicBoneHelper))

					if var_4_4 then
						var_4_4:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_3.transform, false)

					arg_1_1.var_[var_4_0 .. "Animator"] = var_4_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_0 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_0 .. "LipSync"] = var_4_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_5 = arg_1_1.actors_["1148ui_story"]
			local var_4_6 = 0

			if var_4_6 < arg_1_1.time_ and arg_1_1.time_ <= var_4_6 + arg_4_0 and not isNil(var_4_5) and arg_1_1.var_.characterEffect1148ui_story == nil then
				arg_1_1.var_.characterEffect1148ui_story = var_4_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_7 = 0.1

			if var_4_6 <= arg_1_1.time_ and arg_1_1.time_ < var_4_6 + var_4_7 and not isNil(var_4_5) then
				local var_4_8 = (arg_1_1.time_ - var_4_6) / var_4_7

				if arg_1_1.var_.characterEffect1148ui_story and not isNil(var_4_5) then
					arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_6 + var_4_7 and arg_1_1.time_ < var_4_6 + var_4_7 + arg_4_0 and not isNil(var_4_5) and arg_1_1.var_.characterEffect1148ui_story then
				arg_1_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_4_9 = "1084ui_story"

			if arg_1_1.actors_[var_4_9] == nil then
				local var_4_10 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_4_10) then
					local var_4_11 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_1_1.stage_.transform)

					var_4_11.name = var_4_9
					var_4_11.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_9] = var_4_11

					local var_4_12 = var_4_11:GetComponentInChildren(typeof(CharacterEffect))

					var_4_12.enabled = true

					local var_4_13 = GameObjectTools.GetOrAddComponent(var_4_11, typeof(DynamicBoneHelper))

					if var_4_13 then
						var_4_13:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_12.transform, false)

					arg_1_1.var_[var_4_9 .. "Animator"] = var_4_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_9 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_9 .. "LipSync"] = var_4_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_14 = arg_1_1.actors_["1084ui_story"]
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 and not isNil(var_4_14) and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_16 = 0.1

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_16 and not isNil(var_4_14) then
				local var_4_17 = (arg_1_1.time_ - var_4_15) / var_4_16

				if arg_1_1.var_.characterEffect1084ui_story and not isNil(var_4_14) then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_16 and arg_1_1.time_ < var_4_15 + var_4_16 + arg_4_0 and not isNil(var_4_14) and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_18 = "ST01"

			if arg_1_1.bgs_[var_4_18] == nil then
				local var_4_19 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_19:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_18)
				var_4_19.name = var_4_18
				var_4_19.transform.parent = arg_1_1.stage_.transform
				var_4_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_18] = var_4_19
			end

			local var_4_20 = 0

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_21 = manager.ui.mainCamera.transform.localPosition
				local var_4_22 = Vector3.New(0, 0, 10) + Vector3.New(var_4_21.x, var_4_21.y, 0)
				local var_4_23 = arg_1_1.bgs_.ST01

				var_4_23.transform.localPosition = var_4_22
				var_4_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_24 = var_4_23:GetComponent("SpriteRenderer")

				if var_4_24 and var_4_24.sprite then
					local var_4_25 = (var_4_23.transform.localPosition - var_4_21).z
					local var_4_26 = manager.ui.mainCameraCom_
					local var_4_27 = 2 * var_4_25 * Mathf.Tan(var_4_26.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_28 = var_4_27 * var_4_26.aspect
					local var_4_29 = var_4_24.sprite.bounds.size.x
					local var_4_30 = var_4_24.sprite.bounds.size.y
					local var_4_31 = var_4_28 / var_4_29
					local var_4_32 = var_4_27 / var_4_30
					local var_4_33 = var_4_32 < var_4_31 and var_4_31 or var_4_32

					var_4_23.transform.localScale = Vector3.New(var_4_33, var_4_33, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "ST01" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_34 = "10102ui_story"

			if arg_1_1.actors_[var_4_34] == nil then
				local var_4_35 = Asset.Load("Char/" .. "10102ui_story")

				if not isNil(var_4_35) then
					local var_4_36 = Object.Instantiate(Asset.Load("Char/" .. "10102ui_story"), arg_1_1.stage_.transform)

					var_4_36.name = var_4_34
					var_4_36.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_34] = var_4_36

					local var_4_37 = var_4_36:GetComponentInChildren(typeof(CharacterEffect))

					var_4_37.enabled = true

					local var_4_38 = GameObjectTools.GetOrAddComponent(var_4_36, typeof(DynamicBoneHelper))

					if var_4_38 then
						var_4_38:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_37.transform, false)

					arg_1_1.var_[var_4_34 .. "Animator"] = var_4_37.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_34 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_34 .. "LipSync"] = var_4_37.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_39 = arg_1_1.actors_["10102ui_story"].transform
			local var_4_40 = 0

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.var_.moveOldPos10102ui_story = var_4_39.localPosition
			end

			local var_4_41 = 0.001

			if var_4_40 <= arg_1_1.time_ and arg_1_1.time_ < var_4_40 + var_4_41 then
				local var_4_42 = (arg_1_1.time_ - var_4_40) / var_4_41
				local var_4_43 = Vector3.New(0, -0.985, -6.275)

				var_4_39.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10102ui_story, var_4_43, var_4_42)

				local var_4_44 = manager.ui.mainCamera.transform.position - var_4_39.position

				var_4_39.forward = Vector3.New(var_4_44.x, var_4_44.y, var_4_44.z)

				local var_4_45 = var_4_39.localEulerAngles

				var_4_45.z = 0
				var_4_45.x = 0
				var_4_39.localEulerAngles = var_4_45
			end

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				var_4_39.localPosition = Vector3.New(0, -0.985, -6.275)

				local var_4_46 = manager.ui.mainCamera.transform.position - var_4_39.position

				var_4_39.forward = Vector3.New(var_4_46.x, var_4_46.y, var_4_46.z)

				local var_4_47 = var_4_39.localEulerAngles

				var_4_47.z = 0
				var_4_47.x = 0
				var_4_39.localEulerAngles = var_4_47
			end

			local var_4_48 = 0

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "")
			end

			local var_4_49 = arg_1_1.actors_["1148ui_story"].transform
			local var_4_50 = 0

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.var_.moveOldPos1148ui_story = var_4_49.localPosition
			end

			local var_4_51 = 0.001

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				local var_4_52 = (arg_1_1.time_ - var_4_50) / var_4_51
				local var_4_53 = Vector3.New(0.7, -0.8, -6.2)

				var_4_49.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1148ui_story, var_4_53, var_4_52)

				local var_4_54 = manager.ui.mainCamera.transform.position - var_4_49.position

				var_4_49.forward = Vector3.New(var_4_54.x, var_4_54.y, var_4_54.z)

				local var_4_55 = var_4_49.localEulerAngles

				var_4_55.z = 0
				var_4_55.x = 0
				var_4_49.localEulerAngles = var_4_55
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				var_4_49.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_4_56 = manager.ui.mainCamera.transform.position - var_4_49.position

				var_4_49.forward = Vector3.New(var_4_56.x, var_4_56.y, var_4_56.z)

				local var_4_57 = var_4_49.localEulerAngles

				var_4_57.z = 0
				var_4_57.x = 0
				var_4_49.localEulerAngles = var_4_57
			end

			local var_4_58 = 0

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				arg_1_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_4_59 = arg_1_1.actors_["1148ui_story"].transform
			local var_4_60 = 0

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				local var_4_61 = arg_1_1.var_.effect1148ui_storylianchaojihong1

				if not var_4_61 then
					var_4_61 = Object.Instantiate(Asset.Load("UITimeLine/Charactor/107501/fx_107501_Head_red1"))
					var_4_61.name = "lianchaojihong1"
					arg_1_1.var_.effect1148ui_storylianchaojihong1 = var_4_61
				end

				local var_4_62 = var_4_59:Find("1148ui/1148ui_tpose/root/Bip001/Bip001 Pelvis/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head")

				if var_4_62 then
					var_4_61.transform.parent = var_4_62
				else
					var_4_61.transform.parent = var_4_59
				end

				var_4_61.transform.localPosition = Vector3.New(-0.03, 0, 0)
				var_4_61.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_4_63 = 1.17961196366423e-16

			if var_4_63 < arg_1_1.time_ and arg_1_1.time_ <= var_4_63 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_wuganA", "EmotionTimelineAnimator")
			end

			local var_4_64 = 2

			if var_4_64 < arg_1_1.time_ and arg_1_1.time_ <= var_4_64 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_wuganC", "EmotionTimelineAnimator")
			end

			local var_4_65 = 4

			if var_4_65 < arg_1_1.time_ and arg_1_1.time_ <= var_4_65 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_deyiA", "EmotionTimelineAnimator")
			end

			local var_4_66 = 6

			if var_4_66 < arg_1_1.time_ and arg_1_1.time_ <= var_4_66 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_deyiB", "EmotionTimelineAnimator")
			end

			local var_4_67 = 8

			if var_4_67 < arg_1_1.time_ and arg_1_1.time_ <= var_4_67 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_gandong", "EmotionTimelineAnimator")
			end

			local var_4_68 = 10

			if var_4_68 < arg_1_1.time_ and arg_1_1.time_ <= var_4_68 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_haixiuA", "EmotionTimelineAnimator")
			end

			local var_4_69 = 12

			if var_4_69 < arg_1_1.time_ and arg_1_1.time_ <= var_4_69 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_jingyaA", "EmotionTimelineAnimator")
			end

			local var_4_70 = 14

			if var_4_70 < arg_1_1.time_ and arg_1_1.time_ <= var_4_70 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_jingyaC", "EmotionTimelineAnimator")
			end

			local var_4_71 = 16

			if var_4_71 < arg_1_1.time_ and arg_1_1.time_ <= var_4_71 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileA_weixiao", "EmotionTimelineAnimator")
			end

			local var_4_72 = 18

			if var_4_72 < arg_1_1.time_ and arg_1_1.time_ <= var_4_72 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileC_biyan", "EmotionTimelineAnimator")
			end

			local var_4_73 = 20

			if var_4_73 < arg_1_1.time_ and arg_1_1.time_ <= var_4_73 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileD", "EmotionTimelineAnimator")
			end

			local var_4_74 = 22

			if var_4_74 < arg_1_1.time_ and arg_1_1.time_ <= var_4_74 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileF_biyan", "EmotionTimelineAnimator")
			end

			local var_4_75 = 24

			if var_4_75 < arg_1_1.time_ and arg_1_1.time_ <= var_4_75 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_kunraoA_sikao", "EmotionTimelineAnimator")
			end

			local var_4_76 = 26

			if var_4_76 < arg_1_1.time_ and arg_1_1.time_ <= var_4_76 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_nanguoA", "EmotionTimelineAnimator")
			end

			local var_4_77 = 28

			if var_4_77 < arg_1_1.time_ and arg_1_1.time_ <= var_4_77 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_shengqiA", "EmotionTimelineAnimator")
			end

			local var_4_78 = 30

			if var_4_78 < arg_1_1.time_ and arg_1_1.time_ <= var_4_78 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_shengqiB", "EmotionTimelineAnimator")
			end

			local var_4_79 = 32

			if var_4_79 < arg_1_1.time_ and arg_1_1.time_ <= var_4_79 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_wuyuA", "EmotionTimelineAnimator")
			end

			local var_4_80 = 34

			if var_4_80 < arg_1_1.time_ and arg_1_1.time_ <= var_4_80 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_wuyuC", "EmotionTimelineAnimator")
			end

			local var_4_81 = 36

			if var_4_81 < arg_1_1.time_ and arg_1_1.time_ <= var_4_81 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_xinwei", "EmotionTimelineAnimator")
			end

			local var_4_82 = 38

			if var_4_82 < arg_1_1.time_ and arg_1_1.time_ <= var_4_82 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_zhayanL", "EmotionTimelineAnimator")
			end

			local var_4_83 = 40

			if var_4_83 < arg_1_1.time_ and arg_1_1.time_ <= var_4_83 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_zhayanR", "EmotionTimelineAnimator")
			end

			local var_4_84 = 42

			if var_4_84 < arg_1_1.time_ and arg_1_1.time_ <= var_4_84 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_zhushiA", "EmotionTimelineAnimator")
			end

			local var_4_85 = 44

			if var_4_85 < arg_1_1.time_ and arg_1_1.time_ <= var_4_85 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_biyanbiaozhun", "EmotionTimelineAnimator")
			end

			local var_4_86 = 46

			if var_4_86 < arg_1_1.time_ and arg_1_1.time_ <= var_4_86 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_biyanbiaozhun", "EmotionTimelineAnimator")
			end

			local var_4_87 = 48

			if var_4_87 < arg_1_1.time_ and arg_1_1.time_ <= var_4_87 + arg_4_0 then
				arg_1_1:PlayTimeline("10102ui_story", "StoryTimeline/CharAction/public_expression/expr_renzhen", "EmotionTimelineAnimator")
			end

			local var_4_88 = 0
			local var_4_89 = 0.1

			if var_4_88 < arg_1_1.time_ and arg_1_1.time_ <= var_4_88 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_90 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_90:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_90:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_90:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_91 = arg_1_1:GetWordFromCfg(100)
				local var_4_92 = arg_1_1:FormatText(var_4_91.content)

				arg_1_1.text_.text = var_4_92

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_93 = 4
				local var_4_94 = utf8.len(var_4_92)
				local var_4_95 = var_4_93 <= 0 and var_4_89 or var_4_89 * (var_4_94 / var_4_93)

				if var_4_95 > 0 and var_4_89 < var_4_95 then
					arg_1_1.talkMaxDuration = var_4_95
					var_4_88 = var_4_88 + 0.3

					if var_4_95 + var_4_88 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_95 + var_4_88
					end
				end

				arg_1_1.text_.text = var_4_92
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_96 = var_4_88 + 0.3
			local var_4_97 = math.max(var_4_89, arg_1_1.talkMaxDuration)

			if var_4_96 <= arg_1_1.time_ and arg_1_1.time_ < var_4_96 + var_4_97 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_96) / var_4_97

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_96 + var_4_97 and arg_1_1.time_ < var_4_96 + var_4_97 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play101 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101
		arg_7_1.duration_ = 2

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play102(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1148ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and not isNil(var_10_0) and arg_7_1.var_.characterEffect1148ui_story == nil then
				arg_7_1.var_.characterEffect1148ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 and not isNil(var_10_0) then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1148ui_story and not isNil(var_10_0) then
					arg_7_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and not isNil(var_10_0) and arg_7_1.var_.characterEffect1148ui_story then
				arg_7_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_10_4 = arg_7_1.actors_["1084ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and not isNil(var_10_4) and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 and not isNil(var_10_4) then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1084ui_story and not isNil(var_10_4) then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and not isNil(var_10_4) and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_8 = "ST02"

			if arg_7_1.bgs_[var_10_8] == nil then
				local var_10_9 = Object.Instantiate(arg_7_1.paintGo_)

				var_10_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_10_8)
				var_10_9.name = var_10_8
				var_10_9.transform.parent = arg_7_1.stage_.transform
				var_10_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.bgs_[var_10_8] = var_10_9
			end

			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				local var_10_11 = manager.ui.mainCamera.transform.localPosition
				local var_10_12 = Vector3.New(0, 0, 10) + Vector3.New(var_10_11.x, var_10_11.y, 0)
				local var_10_13 = arg_7_1.bgs_.ST02

				var_10_13.transform.localPosition = var_10_12
				var_10_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_10_14 = var_10_13:GetComponent("SpriteRenderer")

				if var_10_14 and var_10_14.sprite then
					local var_10_15 = (var_10_13.transform.localPosition - var_10_11).z
					local var_10_16 = manager.ui.mainCameraCom_
					local var_10_17 = 2 * var_10_15 * Mathf.Tan(var_10_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_10_18 = var_10_17 * var_10_16.aspect
					local var_10_19 = var_10_14.sprite.bounds.size.x
					local var_10_20 = var_10_14.sprite.bounds.size.y
					local var_10_21 = var_10_18 / var_10_19
					local var_10_22 = var_10_17 / var_10_20
					local var_10_23 = var_10_22 < var_10_21 and var_10_21 or var_10_22

					var_10_13.transform.localScale = Vector3.New(var_10_23, var_10_23, 0)
				end

				for iter_10_0, iter_10_1 in pairs(arg_7_1.bgs_) do
					if iter_10_0 ~= "ST02" then
						iter_10_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_10_24 = arg_7_1.bgs_.ST01.transform
			local var_10_25 = 0

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.var_.moveOldPosST01 = var_10_24.localPosition
			end

			local var_10_26 = 0.001

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_26 then
				local var_10_27 = (arg_7_1.time_ - var_10_25) / var_10_26
				local var_10_28 = Vector3.New(0, -100, 10)

				var_10_24.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPosST01, var_10_28, var_10_27)
			end

			if arg_7_1.time_ >= var_10_25 + var_10_26 and arg_7_1.time_ < var_10_25 + var_10_26 + arg_10_0 then
				var_10_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_10_29 = arg_7_1.bgs_.ST02.transform
			local var_10_30 = 0

			if var_10_30 < arg_7_1.time_ and arg_7_1.time_ <= var_10_30 + arg_10_0 then
				local var_10_31 = arg_7_1.var_.effectST02脸红

				if not var_10_31 then
					var_10_31 = Object.Instantiate(Asset.Load("Effect/Hero/1048/fx_1048_ui_001"))
					var_10_31.name = "脸红"
					arg_7_1.var_.effectST02脸红 = var_10_31
				end

				local var_10_32 = var_10_29:Find("")

				if var_10_32 then
					var_10_31.transform.parent = var_10_32
				else
					var_10_31.transform.parent = var_10_29
				end

				var_10_31.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_31.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_33 = 0

			if var_10_33 < arg_7_1.time_ and arg_7_1.time_ <= var_10_33 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4139")
			end

			local var_10_34 = manager.ui.mainCamera.transform
			local var_10_35 = 0

			if var_10_35 < arg_7_1.time_ and arg_7_1.time_ <= var_10_35 + arg_10_0 then
				local var_10_36 = arg_7_1.var_.effectMainCamera1048镜头前特效

				if not var_10_36 then
					var_10_36 = Object.Instantiate(Asset.Load("Effect/Hero/1048/fx_1048_ui_001"))
					var_10_36.name = "1048镜头前特效"
					arg_7_1.var_.effectMainCamera1048镜头前特效 = var_10_36
				end

				local var_10_37 = var_10_34:Find("")

				if var_10_37 then
					var_10_36.transform.parent = var_10_37
				else
					var_10_36.transform.parent = var_10_34
				end

				var_10_36.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_36.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_38 = "10066ui_story"

			if arg_7_1.actors_[var_10_38] == nil then
				local var_10_39 = Asset.Load("Char/" .. "10066ui_story")

				if not isNil(var_10_39) then
					local var_10_40 = Object.Instantiate(Asset.Load("Char/" .. "10066ui_story"), arg_7_1.stage_.transform)

					var_10_40.name = var_10_38
					var_10_40.transform.localPosition = Vector3.New(0, 100, 0)
					arg_7_1.actors_[var_10_38] = var_10_40

					local var_10_41 = var_10_40:GetComponentInChildren(typeof(CharacterEffect))

					var_10_41.enabled = true

					local var_10_42 = GameObjectTools.GetOrAddComponent(var_10_40, typeof(DynamicBoneHelper))

					if var_10_42 then
						var_10_42:EnableDynamicBone(false)
					end

					arg_7_1:ShowWeapon(var_10_41.transform, false)

					arg_7_1.var_[var_10_38 .. "Animator"] = var_10_41.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_7_1.var_[var_10_38 .. "Animator"].applyRootMotion = true
					arg_7_1.var_[var_10_38 .. "LipSync"] = var_10_41.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_10_43 = 0

			if var_10_43 < arg_7_1.time_ and arg_7_1.time_ <= var_10_43 + arg_10_0 then
				arg_7_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/expr_nanguoA")
			end

			local var_10_44 = arg_7_1.actors_["10102ui_story"].transform
			local var_10_45 = 0

			if var_10_45 < arg_7_1.time_ and arg_7_1.time_ <= var_10_45 + arg_10_0 then
				arg_7_1.var_.moveOldPos10102ui_story = var_10_44.localPosition
			end

			local var_10_46 = 0.001

			if var_10_45 <= arg_7_1.time_ and arg_7_1.time_ < var_10_45 + var_10_46 then
				local var_10_47 = (arg_7_1.time_ - var_10_45) / var_10_46
				local var_10_48 = Vector3.New(0, 100, 0)

				var_10_44.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10102ui_story, var_10_48, var_10_47)

				local var_10_49 = manager.ui.mainCamera.transform.position - var_10_44.position

				var_10_44.forward = Vector3.New(var_10_49.x, var_10_49.y, var_10_49.z)

				local var_10_50 = var_10_44.localEulerAngles

				var_10_50.z = 0
				var_10_50.x = 0
				var_10_44.localEulerAngles = var_10_50
			end

			if arg_7_1.time_ >= var_10_45 + var_10_46 and arg_7_1.time_ < var_10_45 + var_10_46 + arg_10_0 then
				var_10_44.localPosition = Vector3.New(0, 100, 0)

				local var_10_51 = manager.ui.mainCamera.transform.position - var_10_44.position

				var_10_44.forward = Vector3.New(var_10_51.x, var_10_51.y, var_10_51.z)

				local var_10_52 = var_10_44.localEulerAngles

				var_10_52.z = 0
				var_10_52.x = 0
				var_10_44.localEulerAngles = var_10_52
			end

			local var_10_53 = arg_7_1.actors_["1148ui_story"].transform
			local var_10_54 = 0

			if var_10_54 < arg_7_1.time_ and arg_7_1.time_ <= var_10_54 + arg_10_0 then
				arg_7_1.var_.moveOldPos1148ui_story = var_10_53.localPosition
			end

			local var_10_55 = 0.001

			if var_10_54 <= arg_7_1.time_ and arg_7_1.time_ < var_10_54 + var_10_55 then
				local var_10_56 = (arg_7_1.time_ - var_10_54) / var_10_55
				local var_10_57 = Vector3.New(0, 100, 0)

				var_10_53.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1148ui_story, var_10_57, var_10_56)

				local var_10_58 = manager.ui.mainCamera.transform.position - var_10_53.position

				var_10_53.forward = Vector3.New(var_10_58.x, var_10_58.y, var_10_58.z)

				local var_10_59 = var_10_53.localEulerAngles

				var_10_59.z = 0
				var_10_59.x = 0
				var_10_53.localEulerAngles = var_10_59
			end

			if arg_7_1.time_ >= var_10_54 + var_10_55 and arg_7_1.time_ < var_10_54 + var_10_55 + arg_10_0 then
				var_10_53.localPosition = Vector3.New(0, 100, 0)

				local var_10_60 = manager.ui.mainCamera.transform.position - var_10_53.position

				var_10_53.forward = Vector3.New(var_10_60.x, var_10_60.y, var_10_60.z)

				local var_10_61 = var_10_53.localEulerAngles

				var_10_61.z = 0
				var_10_61.x = 0
				var_10_53.localEulerAngles = var_10_61
			end

			local var_10_62 = "1020ui_story"

			if arg_7_1.actors_[var_10_62] == nil then
				local var_10_63 = Asset.Load("Char/" .. "1020ui_story")

				if not isNil(var_10_63) then
					local var_10_64 = Object.Instantiate(Asset.Load("Char/" .. "1020ui_story"), arg_7_1.stage_.transform)

					var_10_64.name = var_10_62
					var_10_64.transform.localPosition = Vector3.New(0, 100, 0)
					arg_7_1.actors_[var_10_62] = var_10_64

					local var_10_65 = var_10_64:GetComponentInChildren(typeof(CharacterEffect))

					var_10_65.enabled = true

					local var_10_66 = GameObjectTools.GetOrAddComponent(var_10_64, typeof(DynamicBoneHelper))

					if var_10_66 then
						var_10_66:EnableDynamicBone(false)
					end

					arg_7_1:ShowWeapon(var_10_65.transform, false)

					arg_7_1.var_[var_10_62 .. "Animator"] = var_10_65.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_7_1.var_[var_10_62 .. "Animator"].applyRootMotion = true
					arg_7_1.var_[var_10_62 .. "LipSync"] = var_10_65.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_10_67 = arg_7_1.actors_["1020ui_story"].transform
			local var_10_68 = 0

			if var_10_68 < arg_7_1.time_ and arg_7_1.time_ <= var_10_68 + arg_10_0 then
				arg_7_1.var_.moveOldPos1020ui_story = var_10_67.localPosition
			end

			local var_10_69 = 0.001

			if var_10_68 <= arg_7_1.time_ and arg_7_1.time_ < var_10_68 + var_10_69 then
				local var_10_70 = (arg_7_1.time_ - var_10_68) / var_10_69
				local var_10_71 = Vector3.New(-0.7, -0.85, -6.25)

				var_10_67.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1020ui_story, var_10_71, var_10_70)

				local var_10_72 = manager.ui.mainCamera.transform.position - var_10_67.position

				var_10_67.forward = Vector3.New(var_10_72.x, var_10_72.y, var_10_72.z)

				local var_10_73 = var_10_67.localEulerAngles

				var_10_73.z = 0
				var_10_73.x = 0
				var_10_67.localEulerAngles = var_10_73
			end

			if arg_7_1.time_ >= var_10_68 + var_10_69 and arg_7_1.time_ < var_10_68 + var_10_69 + arg_10_0 then
				var_10_67.localPosition = Vector3.New(-0.7, -0.85, -6.25)

				local var_10_74 = manager.ui.mainCamera.transform.position - var_10_67.position

				var_10_67.forward = Vector3.New(var_10_74.x, var_10_74.y, var_10_74.z)

				local var_10_75 = var_10_67.localEulerAngles

				var_10_75.z = 0
				var_10_75.x = 0
				var_10_67.localEulerAngles = var_10_75
			end

			local var_10_76 = 0

			if var_10_76 < arg_7_1.time_ and arg_7_1.time_ <= var_10_76 + arg_10_0 then
				arg_7_1:PlayTimeline("1020ui_story", "StoryTimeline/CharAction/story1020/story1020action/1020action1_1")
			end

			local var_10_77 = 0

			if var_10_77 < arg_7_1.time_ and arg_7_1.time_ <= var_10_77 + arg_10_0 then
				arg_7_1:PlayTimeline("1020ui_story", "StoryTimeline/CharAction/public_expression/expr_deyiB", "EmotionTimelineAnimator")
			end

			local var_10_78 = "1156ui_story"

			if arg_7_1.actors_[var_10_78] == nil then
				local var_10_79 = Asset.Load("Char/" .. "1156ui_story")

				if not isNil(var_10_79) then
					local var_10_80 = Object.Instantiate(Asset.Load("Char/" .. "1156ui_story"), arg_7_1.stage_.transform)

					var_10_80.name = var_10_78
					var_10_80.transform.localPosition = Vector3.New(0, 100, 0)
					arg_7_1.actors_[var_10_78] = var_10_80

					local var_10_81 = var_10_80:GetComponentInChildren(typeof(CharacterEffect))

					var_10_81.enabled = true

					local var_10_82 = GameObjectTools.GetOrAddComponent(var_10_80, typeof(DynamicBoneHelper))

					if var_10_82 then
						var_10_82:EnableDynamicBone(false)
					end

					arg_7_1:ShowWeapon(var_10_81.transform, false)

					arg_7_1.var_[var_10_78 .. "Animator"] = var_10_81.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_7_1.var_[var_10_78 .. "Animator"].applyRootMotion = true
					arg_7_1.var_[var_10_78 .. "LipSync"] = var_10_81.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_10_83 = arg_7_1.actors_["1156ui_story"].transform
			local var_10_84 = 0

			if var_10_84 < arg_7_1.time_ and arg_7_1.time_ <= var_10_84 + arg_10_0 then
				arg_7_1.var_.moveOldPos1156ui_story = var_10_83.localPosition
			end

			local var_10_85 = 0.001

			if var_10_84 <= arg_7_1.time_ and arg_7_1.time_ < var_10_84 + var_10_85 then
				local var_10_86 = (arg_7_1.time_ - var_10_84) / var_10_85
				local var_10_87 = Vector3.New(0.7, -1.1, -6.18)

				var_10_83.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1156ui_story, var_10_87, var_10_86)

				local var_10_88 = manager.ui.mainCamera.transform.position - var_10_83.position

				var_10_83.forward = Vector3.New(var_10_88.x, var_10_88.y, var_10_88.z)

				local var_10_89 = var_10_83.localEulerAngles

				var_10_89.z = 0
				var_10_89.x = 0
				var_10_83.localEulerAngles = var_10_89
			end

			if arg_7_1.time_ >= var_10_84 + var_10_85 and arg_7_1.time_ < var_10_84 + var_10_85 + arg_10_0 then
				var_10_83.localPosition = Vector3.New(0.7, -1.1, -6.18)

				local var_10_90 = manager.ui.mainCamera.transform.position - var_10_83.position

				var_10_83.forward = Vector3.New(var_10_90.x, var_10_90.y, var_10_90.z)

				local var_10_91 = var_10_83.localEulerAngles

				var_10_91.z = 0
				var_10_91.x = 0
				var_10_83.localEulerAngles = var_10_91
			end

			local var_10_92 = 0

			if var_10_92 < arg_7_1.time_ and arg_7_1.time_ <= var_10_92 + arg_10_0 then
				arg_7_1:PlayTimeline("1156ui_story", "StoryTimeline/CharAction/story1156/story1156action/1156action1_1")
			end

			local var_10_93 = 0

			if var_10_93 < arg_7_1.time_ and arg_7_1.time_ <= var_10_93 + arg_10_0 then
				arg_7_1:PlayTimeline("1156ui_story", "StoryTimeline/CharAction/public_expression/expr_deyiB", "EmotionTimelineAnimator")
			end

			local var_10_94 = 0
			local var_10_95 = 0.1

			if var_10_94 < arg_7_1.time_ and arg_7_1.time_ <= var_10_94 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0

				arg_7_1.dialog_:SetActive(true)

				local var_10_96 = LeanTween.value(arg_7_1.dialog_, 0, 1, 0.3)

				var_10_96:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_7_1.dialogCg_.alpha = arg_11_0
				end))
				var_10_96:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_7_1.dialog_)
					var_10_96:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_7_1.duration_ = arg_7_1.duration_ + 0.3

				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_97 = arg_7_1:GetWordFromCfg(100)
				local var_10_98 = arg_7_1:FormatText(var_10_97.content)

				arg_7_1.text_.text = var_10_98

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_99 = 4
				local var_10_100 = utf8.len(var_10_98)
				local var_10_101 = var_10_99 <= 0 and var_10_95 or var_10_95 * (var_10_100 / var_10_99)

				if var_10_101 > 0 and var_10_95 < var_10_101 then
					arg_7_1.talkMaxDuration = var_10_101
					var_10_94 = var_10_94 + 0.3

					if var_10_101 + var_10_94 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_101 + var_10_94
					end
				end

				arg_7_1.text_.text = var_10_98
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_102 = var_10_94 + 0.3
			local var_10_103 = math.max(var_10_95, arg_7_1.talkMaxDuration)

			if var_10_102 <= arg_7_1.time_ and arg_7_1.time_ < var_10_102 + var_10_103 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_102) / var_10_103

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_102 + var_10_103 and arg_7_1.time_ < var_10_102 + var_10_103 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play102 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 102
		arg_13_1.duration_ = 2

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play103(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1148ui_story"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1148ui_story == nil then
				arg_13_1.var_.characterEffect1148ui_story = var_16_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_2 = 0.1

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 and not isNil(var_16_0) then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.characterEffect1148ui_story and not isNil(var_16_0) then
					arg_13_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1148ui_story then
				arg_13_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_16_4 = arg_13_1.actors_["1084ui_story"]
			local var_16_5 = 0

			if var_16_5 < arg_13_1.time_ and arg_13_1.time_ <= var_16_5 + arg_16_0 and not isNil(var_16_4) and arg_13_1.var_.characterEffect1084ui_story == nil then
				arg_13_1.var_.characterEffect1084ui_story = var_16_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_6 = 0.1

			if var_16_5 <= arg_13_1.time_ and arg_13_1.time_ < var_16_5 + var_16_6 and not isNil(var_16_4) then
				local var_16_7 = (arg_13_1.time_ - var_16_5) / var_16_6

				if arg_13_1.var_.characterEffect1084ui_story and not isNil(var_16_4) then
					arg_13_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_5 + var_16_6 and arg_13_1.time_ < var_16_5 + var_16_6 + arg_16_0 and not isNil(var_16_4) and arg_13_1.var_.characterEffect1084ui_story then
				arg_13_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_16_8 = "ST03"

			if arg_13_1.bgs_[var_16_8] == nil then
				local var_16_9 = Object.Instantiate(arg_13_1.paintGo_)

				var_16_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_16_8)
				var_16_9.name = var_16_8
				var_16_9.transform.parent = arg_13_1.stage_.transform
				var_16_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.bgs_[var_16_8] = var_16_9
			end

			local var_16_10 = 0

			if var_16_10 < arg_13_1.time_ and arg_13_1.time_ <= var_16_10 + arg_16_0 then
				local var_16_11 = manager.ui.mainCamera.transform.localPosition
				local var_16_12 = Vector3.New(0, 0, 10) + Vector3.New(var_16_11.x, var_16_11.y, 0)
				local var_16_13 = arg_13_1.bgs_.ST03

				var_16_13.transform.localPosition = var_16_12
				var_16_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_16_14 = var_16_13:GetComponent("SpriteRenderer")

				if var_16_14 and var_16_14.sprite then
					local var_16_15 = (var_16_13.transform.localPosition - var_16_11).z
					local var_16_16 = manager.ui.mainCameraCom_
					local var_16_17 = 2 * var_16_15 * Mathf.Tan(var_16_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_16_18 = var_16_17 * var_16_16.aspect
					local var_16_19 = var_16_14.sprite.bounds.size.x
					local var_16_20 = var_16_14.sprite.bounds.size.y
					local var_16_21 = var_16_18 / var_16_19
					local var_16_22 = var_16_17 / var_16_20
					local var_16_23 = var_16_22 < var_16_21 and var_16_21 or var_16_22

					var_16_13.transform.localScale = Vector3.New(var_16_23, var_16_23, 0)
				end

				for iter_16_0, iter_16_1 in pairs(arg_13_1.bgs_) do
					if iter_16_0 ~= "ST03" then
						iter_16_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_16_24 = arg_13_1.bgs_.ST02.transform
			local var_16_25 = 0

			if var_16_25 < arg_13_1.time_ and arg_13_1.time_ <= var_16_25 + arg_16_0 then
				arg_13_1.var_.moveOldPosST02 = var_16_24.localPosition
			end

			local var_16_26 = 0.001

			if var_16_25 <= arg_13_1.time_ and arg_13_1.time_ < var_16_25 + var_16_26 then
				local var_16_27 = (arg_13_1.time_ - var_16_25) / var_16_26
				local var_16_28 = Vector3.New(0, -100, 10)

				var_16_24.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPosST02, var_16_28, var_16_27)
			end

			if arg_13_1.time_ >= var_16_25 + var_16_26 and arg_13_1.time_ < var_16_25 + var_16_26 + arg_16_0 then
				var_16_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_16_29 = 0

			if var_16_29 < arg_13_1.time_ and arg_13_1.time_ <= var_16_29 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = false

				arg_13_1:SetGaussion(false)
			end

			local var_16_30 = 0.5

			if var_16_29 <= arg_13_1.time_ and arg_13_1.time_ < var_16_29 + var_16_30 then
				local var_16_31 = (arg_13_1.time_ - var_16_29) / var_16_30
				local var_16_32 = Color.New(1, 1, 1)

				var_16_32.a = Mathf.Lerp(0, 1, var_16_31)
				arg_13_1.mask_.color = var_16_32
			end

			if arg_13_1.time_ >= var_16_29 + var_16_30 and arg_13_1.time_ < var_16_29 + var_16_30 + arg_16_0 then
				local var_16_33 = Color.New(1, 1, 1)

				var_16_33.a = 1
				arg_13_1.mask_.color = var_16_33
			end

			local var_16_34 = 1

			if var_16_34 < arg_13_1.time_ and arg_13_1.time_ <= var_16_34 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = false

				arg_13_1:SetGaussion(false)
			end

			local var_16_35 = 0.5

			if var_16_34 <= arg_13_1.time_ and arg_13_1.time_ < var_16_34 + var_16_35 then
				local var_16_36 = (arg_13_1.time_ - var_16_34) / var_16_35
				local var_16_37 = Color.New(1, 1, 1)

				var_16_37.a = Mathf.Lerp(1, 0, var_16_36)
				arg_13_1.mask_.color = var_16_37
			end

			if arg_13_1.time_ >= var_16_34 + var_16_35 and arg_13_1.time_ < var_16_34 + var_16_35 + arg_16_0 then
				local var_16_38 = Color.New(1, 1, 1)
				local var_16_39 = 0

				arg_13_1.mask_.enabled = false
				var_16_38.a = var_16_39
				arg_13_1.mask_.color = var_16_38
			end

			local var_16_40 = 0

			if var_16_40 < arg_13_1.time_ and arg_13_1.time_ <= var_16_40 + arg_16_0 then
				arg_13_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action495")
			end

			local var_16_41 = 0

			if var_16_41 < arg_13_1.time_ and arg_13_1.time_ <= var_16_41 + arg_16_0 then
				arg_13_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/expr_wuyuC")
			end

			local var_16_42 = 0
			local var_16_43 = 0.1

			if var_16_42 < arg_13_1.time_ and arg_13_1.time_ <= var_16_42 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0

				arg_13_1.dialog_:SetActive(true)

				local var_16_44 = LeanTween.value(arg_13_1.dialog_, 0, 1, 0.3)

				var_16_44:setOnUpdate(LuaHelper.FloatAction(function(arg_17_0)
					arg_13_1.dialogCg_.alpha = arg_17_0
				end))
				var_16_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_13_1.dialog_)
					var_16_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_13_1.duration_ = arg_13_1.duration_ + 0.3

				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_45 = arg_13_1:GetWordFromCfg(100)
				local var_16_46 = arg_13_1:FormatText(var_16_45.content)

				arg_13_1.text_.text = var_16_46

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_47 = 4
				local var_16_48 = utf8.len(var_16_46)
				local var_16_49 = var_16_47 <= 0 and var_16_43 or var_16_43 * (var_16_48 / var_16_47)

				if var_16_49 > 0 and var_16_43 < var_16_49 then
					arg_13_1.talkMaxDuration = var_16_49
					var_16_42 = var_16_42 + 0.3

					if var_16_49 + var_16_42 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_49 + var_16_42
					end
				end

				arg_13_1.text_.text = var_16_46
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_50 = var_16_42 + 0.3
			local var_16_51 = math.max(var_16_43, arg_13_1.talkMaxDuration)

			if var_16_50 <= arg_13_1.time_ and arg_13_1.time_ < var_16_50 + var_16_51 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_50) / var_16_51

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_50 + var_16_51 and arg_13_1.time_ < var_16_50 + var_16_51 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play103 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103
		arg_19_1.duration_ = 7.07

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play104(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1148ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and not isNil(var_22_0) and arg_19_1.var_.characterEffect1148ui_story == nil then
				arg_19_1.var_.characterEffect1148ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 and not isNil(var_22_0) then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1148ui_story and not isNil(var_22_0) then
					arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and not isNil(var_22_0) and arg_19_1.var_.characterEffect1148ui_story then
				arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and not isNil(var_22_4) and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 and not isNil(var_22_4) then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1084ui_story and not isNil(var_22_4) then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and not isNil(var_22_4) and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_8 = "ST03a"

			if arg_19_1.bgs_[var_22_8] == nil then
				local var_22_9 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_8)
				var_22_9.name = var_22_8
				var_22_9.transform.parent = arg_19_1.stage_.transform
				var_22_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_8] = var_22_9
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				local var_22_11 = manager.ui.mainCamera.transform.localPosition
				local var_22_12 = Vector3.New(0, 0, 10) + Vector3.New(var_22_11.x, var_22_11.y, 0)
				local var_22_13 = arg_19_1.bgs_.ST03a

				var_22_13.transform.localPosition = var_22_12
				var_22_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_14 = var_22_13:GetComponent("SpriteRenderer")

				if var_22_14 and var_22_14.sprite then
					local var_22_15 = (var_22_13.transform.localPosition - var_22_11).z
					local var_22_16 = manager.ui.mainCameraCom_
					local var_22_17 = 2 * var_22_15 * Mathf.Tan(var_22_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_18 = var_22_17 * var_22_16.aspect
					local var_22_19 = var_22_14.sprite.bounds.size.x
					local var_22_20 = var_22_14.sprite.bounds.size.y
					local var_22_21 = var_22_18 / var_22_19
					local var_22_22 = var_22_17 / var_22_20
					local var_22_23 = var_22_22 < var_22_21 and var_22_21 or var_22_22

					var_22_13.transform.localScale = Vector3.New(var_22_23, var_22_23, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST03a" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_24 = arg_19_1.bgs_.ST03.transform
			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.var_.moveOldPosST03 = var_22_24.localPosition
			end

			local var_22_26 = 0.001

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / var_22_26
				local var_22_28 = Vector3.New(0, -100, 10)

				var_22_24.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPosST03, var_22_28, var_22_27)
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 then
				var_22_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_22_29 = 0

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action492")
			end

			local var_22_30 = 0
			local var_22_31 = 0.1

			if var_22_30 < arg_19_1.time_ and arg_19_1.time_ <= var_22_30 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_32 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_32:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_33 = arg_19_1:GetWordFromCfg(100)
				local var_22_34 = arg_19_1:FormatText(var_22_33.content)

				arg_19_1.text_.text = var_22_34

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_35 = 4
				local var_22_36 = utf8.len(var_22_34)
				local var_22_37 = var_22_35 <= 0 and var_22_31 or var_22_31 * (var_22_36 / var_22_35)

				if var_22_37 > 0 and var_22_31 < var_22_37 then
					arg_19_1.talkMaxDuration = var_22_37
					var_22_30 = var_22_30 + 0.3

					if var_22_37 + var_22_30 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_30
					end
				end

				arg_19_1.text_.text = var_22_34
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_38 = var_22_30 + 0.3
			local var_22_39 = math.max(var_22_31, arg_19_1.talkMaxDuration)

			if var_22_38 <= arg_19_1.time_ and arg_19_1.time_ < var_22_38 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_38) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_38 + var_22_39 and arg_19_1.time_ < var_22_38 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 104
		arg_25_1.duration_ = 7.13

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play105(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1148ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story == nil then
				arg_25_1.var_.characterEffect1148ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 and not isNil(var_28_0) then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1148ui_story and not isNil(var_28_0) then
					arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story then
				arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_28_4 = arg_25_1.actors_["1084ui_story"]
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story == nil then
				arg_25_1.var_.characterEffect1084ui_story = var_28_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_6 = 0.1

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 and not isNil(var_28_4) then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6

				if arg_25_1.var_.characterEffect1084ui_story and not isNil(var_28_4) then
					arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story then
				arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_28_8 = "ST05"

			if arg_25_1.bgs_[var_28_8] == nil then
				local var_28_9 = Object.Instantiate(arg_25_1.paintGo_)

				var_28_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_28_8)
				var_28_9.name = var_28_8
				var_28_9.transform.parent = arg_25_1.stage_.transform
				var_28_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.bgs_[var_28_8] = var_28_9
			end

			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				local var_28_11 = manager.ui.mainCamera.transform.localPosition
				local var_28_12 = Vector3.New(0, 0, 10) + Vector3.New(var_28_11.x, var_28_11.y, 0)
				local var_28_13 = arg_25_1.bgs_.ST05

				var_28_13.transform.localPosition = var_28_12
				var_28_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_28_14 = var_28_13:GetComponent("SpriteRenderer")

				if var_28_14 and var_28_14.sprite then
					local var_28_15 = (var_28_13.transform.localPosition - var_28_11).z
					local var_28_16 = manager.ui.mainCameraCom_
					local var_28_17 = 2 * var_28_15 * Mathf.Tan(var_28_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_28_18 = var_28_17 * var_28_16.aspect
					local var_28_19 = var_28_14.sprite.bounds.size.x
					local var_28_20 = var_28_14.sprite.bounds.size.y
					local var_28_21 = var_28_18 / var_28_19
					local var_28_22 = var_28_17 / var_28_20
					local var_28_23 = var_28_22 < var_28_21 and var_28_21 or var_28_22

					var_28_13.transform.localScale = Vector3.New(var_28_23, var_28_23, 0)
				end

				for iter_28_0, iter_28_1 in pairs(arg_25_1.bgs_) do
					if iter_28_0 ~= "ST05" then
						iter_28_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_28_24 = arg_25_1.bgs_.ST03a.transform
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 then
				arg_25_1.var_.moveOldPosST03a = var_28_24.localPosition
			end

			local var_28_26 = 0.001

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_26 then
				local var_28_27 = (arg_25_1.time_ - var_28_25) / var_28_26
				local var_28_28 = Vector3.New(0, -100, 10)

				var_28_24.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPosST03a, var_28_28, var_28_27)
			end

			if arg_25_1.time_ >= var_28_25 + var_28_26 and arg_25_1.time_ < var_28_25 + var_28_26 + arg_28_0 then
				var_28_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_28_29 = 0

			if var_28_29 < arg_25_1.time_ and arg_25_1.time_ <= var_28_29 + arg_28_0 then
				arg_25_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action452")
			end

			local var_28_30 = 0
			local var_28_31 = 0.1

			if var_28_30 < arg_25_1.time_ and arg_25_1.time_ <= var_28_30 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_32 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_32:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_33 = arg_25_1:GetWordFromCfg(100)
				local var_28_34 = arg_25_1:FormatText(var_28_33.content)

				arg_25_1.text_.text = var_28_34

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_35 = 4
				local var_28_36 = utf8.len(var_28_34)
				local var_28_37 = var_28_35 <= 0 and var_28_31 or var_28_31 * (var_28_36 / var_28_35)

				if var_28_37 > 0 and var_28_31 < var_28_37 then
					arg_25_1.talkMaxDuration = var_28_37
					var_28_30 = var_28_30 + 0.3

					if var_28_37 + var_28_30 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_37 + var_28_30
					end
				end

				arg_25_1.text_.text = var_28_34
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_38 = var_28_30 + 0.3
			local var_28_39 = math.max(var_28_31, arg_25_1.talkMaxDuration)

			if var_28_38 <= arg_25_1.time_ and arg_25_1.time_ < var_28_38 + var_28_39 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_38) / var_28_39

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_38 + var_28_39 and arg_25_1.time_ < var_28_38 + var_28_39 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play105 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 105
		arg_31_1.duration_ = 7.37

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play106(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1148ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story == nil then
				arg_31_1.var_.characterEffect1148ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 and not isNil(var_34_0) then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1148ui_story and not isNil(var_34_0) then
					arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story then
				arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1084ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 and not isNil(var_34_4) then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1084ui_story and not isNil(var_34_4) then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_8 = "ST05a"

			if arg_31_1.bgs_[var_34_8] == nil then
				local var_34_9 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_8)
				var_34_9.name = var_34_8
				var_34_9.transform.parent = arg_31_1.stage_.transform
				var_34_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_8] = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				local var_34_11 = manager.ui.mainCamera.transform.localPosition
				local var_34_12 = Vector3.New(0, 0, 10) + Vector3.New(var_34_11.x, var_34_11.y, 0)
				local var_34_13 = arg_31_1.bgs_.ST05a

				var_34_13.transform.localPosition = var_34_12
				var_34_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_14 = var_34_13:GetComponent("SpriteRenderer")

				if var_34_14 and var_34_14.sprite then
					local var_34_15 = (var_34_13.transform.localPosition - var_34_11).z
					local var_34_16 = manager.ui.mainCameraCom_
					local var_34_17 = 2 * var_34_15 * Mathf.Tan(var_34_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_18 = var_34_17 * var_34_16.aspect
					local var_34_19 = var_34_14.sprite.bounds.size.x
					local var_34_20 = var_34_14.sprite.bounds.size.y
					local var_34_21 = var_34_18 / var_34_19
					local var_34_22 = var_34_17 / var_34_20
					local var_34_23 = var_34_22 < var_34_21 and var_34_21 or var_34_22

					var_34_13.transform.localScale = Vector3.New(var_34_23, var_34_23, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST05a" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_24 = arg_31_1.bgs_.ST05.transform
			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.var_.moveOldPosST05 = var_34_24.localPosition
			end

			local var_34_26 = 0.001

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26
				local var_34_28 = Vector3.New(0, -100, 10)

				var_34_24.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPosST05, var_34_28, var_34_27)
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				var_34_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action423")
			end

			local var_34_30 = 0
			local var_34_31 = 0.1

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_32 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_32:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(100)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 4
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37
					var_34_30 = var_34_30 + 0.3

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_38 = var_34_30 + 0.3
			local var_34_39 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_38 <= arg_31_1.time_ and arg_31_1.time_ < var_34_38 + var_34_39 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_38) / var_34_39

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_38 + var_34_39 and arg_31_1.time_ < var_34_38 + var_34_39 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play106 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 106
		arg_37_1.duration_ = 6.83

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play107(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1148ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story == nil then
				arg_37_1.var_.characterEffect1148ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.1

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 and not isNil(var_40_0) then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1148ui_story and not isNil(var_40_0) then
					arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story then
				arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_40_4 = arg_37_1.actors_["1084ui_story"]
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_6 = 0.1

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 and not isNil(var_40_4) then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6

				if arg_37_1.var_.characterEffect1084ui_story and not isNil(var_40_4) then
					arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story then
				arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_40_8 = "ST06"

			if arg_37_1.bgs_[var_40_8] == nil then
				local var_40_9 = Object.Instantiate(arg_37_1.paintGo_)

				var_40_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_40_8)
				var_40_9.name = var_40_8
				var_40_9.transform.parent = arg_37_1.stage_.transform
				var_40_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.bgs_[var_40_8] = var_40_9
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				local var_40_11 = manager.ui.mainCamera.transform.localPosition
				local var_40_12 = Vector3.New(0, 0, 10) + Vector3.New(var_40_11.x, var_40_11.y, 0)
				local var_40_13 = arg_37_1.bgs_.ST06

				var_40_13.transform.localPosition = var_40_12
				var_40_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_40_14 = var_40_13:GetComponent("SpriteRenderer")

				if var_40_14 and var_40_14.sprite then
					local var_40_15 = (var_40_13.transform.localPosition - var_40_11).z
					local var_40_16 = manager.ui.mainCameraCom_
					local var_40_17 = 2 * var_40_15 * Mathf.Tan(var_40_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_40_18 = var_40_17 * var_40_16.aspect
					local var_40_19 = var_40_14.sprite.bounds.size.x
					local var_40_20 = var_40_14.sprite.bounds.size.y
					local var_40_21 = var_40_18 / var_40_19
					local var_40_22 = var_40_17 / var_40_20
					local var_40_23 = var_40_22 < var_40_21 and var_40_21 or var_40_22

					var_40_13.transform.localScale = Vector3.New(var_40_23, var_40_23, 0)
				end

				for iter_40_0, iter_40_1 in pairs(arg_37_1.bgs_) do
					if iter_40_0 ~= "ST06" then
						iter_40_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_40_24 = arg_37_1.bgs_.ST05a.transform
			local var_40_25 = 0

			if var_40_25 < arg_37_1.time_ and arg_37_1.time_ <= var_40_25 + arg_40_0 then
				arg_37_1.var_.moveOldPosST05a = var_40_24.localPosition
			end

			local var_40_26 = 0.001

			if var_40_25 <= arg_37_1.time_ and arg_37_1.time_ < var_40_25 + var_40_26 then
				local var_40_27 = (arg_37_1.time_ - var_40_25) / var_40_26
				local var_40_28 = Vector3.New(0, -100, 10)

				var_40_24.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPosST05a, var_40_28, var_40_27)
			end

			if arg_37_1.time_ >= var_40_25 + var_40_26 and arg_37_1.time_ < var_40_25 + var_40_26 + arg_40_0 then
				var_40_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_40_29 = 0

			if var_40_29 < arg_37_1.time_ and arg_37_1.time_ <= var_40_29 + arg_40_0 then
				arg_37_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action423")
			end

			local var_40_30 = 0
			local var_40_31 = 0.1

			if var_40_30 < arg_37_1.time_ and arg_37_1.time_ <= var_40_30 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_32 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_32:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_33 = arg_37_1:GetWordFromCfg(100)
				local var_40_34 = arg_37_1:FormatText(var_40_33.content)

				arg_37_1.text_.text = var_40_34

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_35 = 4
				local var_40_36 = utf8.len(var_40_34)
				local var_40_37 = var_40_35 <= 0 and var_40_31 or var_40_31 * (var_40_36 / var_40_35)

				if var_40_37 > 0 and var_40_31 < var_40_37 then
					arg_37_1.talkMaxDuration = var_40_37
					var_40_30 = var_40_30 + 0.3

					if var_40_37 + var_40_30 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_37 + var_40_30
					end
				end

				arg_37_1.text_.text = var_40_34
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_38 = var_40_30 + 0.3
			local var_40_39 = math.max(var_40_31, arg_37_1.talkMaxDuration)

			if var_40_38 <= arg_37_1.time_ and arg_37_1.time_ < var_40_38 + var_40_39 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_38) / var_40_39

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_38 + var_40_39 and arg_37_1.time_ < var_40_38 + var_40_39 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play107 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 107
		arg_43_1.duration_ = 6.8

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play108(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1148ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story == nil then
				arg_43_1.var_.characterEffect1148ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 and not isNil(var_46_0) then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1148ui_story and not isNil(var_46_0) then
					arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story then
				arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1084ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 and not isNil(var_46_4) then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1084ui_story and not isNil(var_46_4) then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_8 = "ST06a"

			if arg_43_1.bgs_[var_46_8] == nil then
				local var_46_9 = Object.Instantiate(arg_43_1.paintGo_)

				var_46_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_8)
				var_46_9.name = var_46_8
				var_46_9.transform.parent = arg_43_1.stage_.transform
				var_46_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_8] = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				local var_46_11 = manager.ui.mainCamera.transform.localPosition
				local var_46_12 = Vector3.New(0, 0, 10) + Vector3.New(var_46_11.x, var_46_11.y, 0)
				local var_46_13 = arg_43_1.bgs_.ST06a

				var_46_13.transform.localPosition = var_46_12
				var_46_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_14 = var_46_13:GetComponent("SpriteRenderer")

				if var_46_14 and var_46_14.sprite then
					local var_46_15 = (var_46_13.transform.localPosition - var_46_11).z
					local var_46_16 = manager.ui.mainCameraCom_
					local var_46_17 = 2 * var_46_15 * Mathf.Tan(var_46_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_18 = var_46_17 * var_46_16.aspect
					local var_46_19 = var_46_14.sprite.bounds.size.x
					local var_46_20 = var_46_14.sprite.bounds.size.y
					local var_46_21 = var_46_18 / var_46_19
					local var_46_22 = var_46_17 / var_46_20
					local var_46_23 = var_46_22 < var_46_21 and var_46_21 or var_46_22

					var_46_13.transform.localScale = Vector3.New(var_46_23, var_46_23, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "ST06a" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_24 = arg_43_1.bgs_.ST06.transform
			local var_46_25 = 0

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.var_.moveOldPosST06 = var_46_24.localPosition
			end

			local var_46_26 = 0.001

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_25) / var_46_26
				local var_46_28 = Vector3.New(0, -100, 10)

				var_46_24.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPosST06, var_46_28, var_46_27)
			end

			if arg_43_1.time_ >= var_46_25 + var_46_26 and arg_43_1.time_ < var_46_25 + var_46_26 + arg_46_0 then
				var_46_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_46_30 = 0
			local var_46_31 = 0.1

			if var_46_30 < arg_43_1.time_ and arg_43_1.time_ <= var_46_30 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_32 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_32:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_33 = arg_43_1:GetWordFromCfg(100)
				local var_46_34 = arg_43_1:FormatText(var_46_33.content)

				arg_43_1.text_.text = var_46_34

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_35 = 4
				local var_46_36 = utf8.len(var_46_34)
				local var_46_37 = var_46_35 <= 0 and var_46_31 or var_46_31 * (var_46_36 / var_46_35)

				if var_46_37 > 0 and var_46_31 < var_46_37 then
					arg_43_1.talkMaxDuration = var_46_37
					var_46_30 = var_46_30 + 0.3

					if var_46_37 + var_46_30 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_37 + var_46_30
					end
				end

				arg_43_1.text_.text = var_46_34
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_38 = var_46_30 + 0.3
			local var_46_39 = math.max(var_46_31, arg_43_1.talkMaxDuration)

			if var_46_38 <= arg_43_1.time_ and arg_43_1.time_ < var_46_38 + var_46_39 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_38) / var_46_39

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_38 + var_46_39 and arg_43_1.time_ < var_46_38 + var_46_39 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play108 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 108
		arg_49_1.duration_ = 7.05

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play109(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1148ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story == nil then
				arg_49_1.var_.characterEffect1148ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 and not isNil(var_52_0) then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1148ui_story and not isNil(var_52_0) then
					arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story then
				arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_52_4 = arg_49_1.actors_["1084ui_story"]
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_6 = 0.1

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 and not isNil(var_52_4) then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6

				if arg_49_1.var_.characterEffect1084ui_story and not isNil(var_52_4) then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_52_8 = "ST06b"

			if arg_49_1.bgs_[var_52_8] == nil then
				local var_52_9 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_8)
				var_52_9.name = var_52_8
				var_52_9.transform.parent = arg_49_1.stage_.transform
				var_52_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_8] = var_52_9
			end

			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 then
				local var_52_11 = manager.ui.mainCamera.transform.localPosition
				local var_52_12 = Vector3.New(0, 0, 10) + Vector3.New(var_52_11.x, var_52_11.y, 0)
				local var_52_13 = arg_49_1.bgs_.ST06b

				var_52_13.transform.localPosition = var_52_12
				var_52_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_14 = var_52_13:GetComponent("SpriteRenderer")

				if var_52_14 and var_52_14.sprite then
					local var_52_15 = (var_52_13.transform.localPosition - var_52_11).z
					local var_52_16 = manager.ui.mainCameraCom_
					local var_52_17 = 2 * var_52_15 * Mathf.Tan(var_52_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_18 = var_52_17 * var_52_16.aspect
					local var_52_19 = var_52_14.sprite.bounds.size.x
					local var_52_20 = var_52_14.sprite.bounds.size.y
					local var_52_21 = var_52_18 / var_52_19
					local var_52_22 = var_52_17 / var_52_20
					local var_52_23 = var_52_22 < var_52_21 and var_52_21 or var_52_22

					var_52_13.transform.localScale = Vector3.New(var_52_23, var_52_23, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "ST06b" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_24 = arg_49_1.bgs_.ST06a.transform
			local var_52_25 = 0

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 then
				arg_49_1.var_.moveOldPosST06a = var_52_24.localPosition
			end

			local var_52_26 = 0.001

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_26 then
				local var_52_27 = (arg_49_1.time_ - var_52_25) / var_52_26
				local var_52_28 = Vector3.New(0, -100, 10)

				var_52_24.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPosST06a, var_52_28, var_52_27)
			end

			if arg_49_1.time_ >= var_52_25 + var_52_26 and arg_49_1.time_ < var_52_25 + var_52_26 + arg_52_0 then
				var_52_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_52_29 = 0

			if var_52_29 < arg_49_1.time_ and arg_49_1.time_ <= var_52_29 + arg_52_0 then
				arg_49_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action434")
			end

			local var_52_30 = 0
			local var_52_31 = 0.1

			if var_52_30 < arg_49_1.time_ and arg_49_1.time_ <= var_52_30 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_32 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_32:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_33 = arg_49_1:GetWordFromCfg(100)
				local var_52_34 = arg_49_1:FormatText(var_52_33.content)

				arg_49_1.text_.text = var_52_34

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_35 = 4
				local var_52_36 = utf8.len(var_52_34)
				local var_52_37 = var_52_35 <= 0 and var_52_31 or var_52_31 * (var_52_36 / var_52_35)

				if var_52_37 > 0 and var_52_31 < var_52_37 then
					arg_49_1.talkMaxDuration = var_52_37
					var_52_30 = var_52_30 + 0.3

					if var_52_37 + var_52_30 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_37 + var_52_30
					end
				end

				arg_49_1.text_.text = var_52_34
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_38 = var_52_30 + 0.3
			local var_52_39 = math.max(var_52_31, arg_49_1.talkMaxDuration)

			if var_52_38 <= arg_49_1.time_ and arg_49_1.time_ < var_52_38 + var_52_39 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_38) / var_52_39

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_38 + var_52_39 and arg_49_1.time_ < var_52_38 + var_52_39 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play109 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 109
		arg_55_1.duration_ = 6.67

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1148ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 and not isNil(var_58_0) then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1148ui_story and not isNil(var_58_0) then
					arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story then
				arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1084ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 and not isNil(var_58_4) then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1084ui_story and not isNil(var_58_4) then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_8 = arg_55_1.bgs_.ST06b.transform
			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1.var_.moveOldPosST06b = var_58_8.localPosition
			end

			local var_58_10 = 0.001

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_9) / var_58_10
				local var_58_12 = Vector3.New(0, -100, 10)

				var_58_8.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosST06b, var_58_12, var_58_11)
			end

			if arg_55_1.time_ >= var_58_9 + var_58_10 and arg_55_1.time_ < var_58_9 + var_58_10 + arg_58_0 then
				var_58_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_58_13 = "ST07a"

			if arg_55_1.bgs_[var_58_13] == nil then
				local var_58_14 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_13)
				var_58_14.name = var_58_13
				var_58_14.transform.parent = arg_55_1.stage_.transform
				var_58_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_13] = var_58_14
			end

			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				local var_58_16 = manager.ui.mainCamera.transform.localPosition
				local var_58_17 = Vector3.New(0, 0, 10) + Vector3.New(var_58_16.x, var_58_16.y, 0)
				local var_58_18 = arg_55_1.bgs_.ST07a

				var_58_18.transform.localPosition = var_58_17
				var_58_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_19 = var_58_18:GetComponent("SpriteRenderer")

				if var_58_19 and var_58_19.sprite then
					local var_58_20 = (var_58_18.transform.localPosition - var_58_16).z
					local var_58_21 = manager.ui.mainCameraCom_
					local var_58_22 = 2 * var_58_20 * Mathf.Tan(var_58_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_23 = var_58_22 * var_58_21.aspect
					local var_58_24 = var_58_19.sprite.bounds.size.x
					local var_58_25 = var_58_19.sprite.bounds.size.y
					local var_58_26 = var_58_23 / var_58_24
					local var_58_27 = var_58_22 / var_58_25
					local var_58_28 = var_58_27 < var_58_26 and var_58_26 or var_58_27

					var_58_18.transform.localScale = Vector3.New(var_58_28, var_58_28, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "ST07a" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_29 = 0

			if var_58_29 < arg_55_1.time_ and arg_55_1.time_ <= var_58_29 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_58_30 = 0
			local var_58_31 = 0.1

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_32 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_32:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(100)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 4
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37
					var_58_30 = var_58_30 + 0.3

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_38 = var_58_30 + 0.3
			local var_58_39 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_39 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_38) / var_58_39

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_38 + var_58_39 and arg_55_1.time_ < var_58_38 + var_58_39 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 110
		arg_61_1.duration_ = 6.77

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play111(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1148ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story == nil then
				arg_61_1.var_.characterEffect1148ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 and not isNil(var_64_0) then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1148ui_story and not isNil(var_64_0) then
					arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story then
				arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1084ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story == nil then
				arg_61_1.var_.characterEffect1084ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 and not isNil(var_64_4) then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1084ui_story and not isNil(var_64_4) then
					arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story then
				arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_64_8 = arg_61_1.bgs_.ST07a.transform
			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 then
				arg_61_1.var_.moveOldPosST07a = var_64_8.localPosition
			end

			local var_64_10 = 0.001

			if var_64_9 <= arg_61_1.time_ and arg_61_1.time_ < var_64_9 + var_64_10 then
				local var_64_11 = (arg_61_1.time_ - var_64_9) / var_64_10
				local var_64_12 = Vector3.New(0, -100, 10)

				var_64_8.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPosST07a, var_64_12, var_64_11)
			end

			if arg_61_1.time_ >= var_64_9 + var_64_10 and arg_61_1.time_ < var_64_9 + var_64_10 + arg_64_0 then
				var_64_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_64_13 = "ST07b"

			if arg_61_1.bgs_[var_64_13] == nil then
				local var_64_14 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_13)
				var_64_14.name = var_64_13
				var_64_14.transform.parent = arg_61_1.stage_.transform
				var_64_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_13] = var_64_14
			end

			local var_64_15 = 0

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				local var_64_16 = manager.ui.mainCamera.transform.localPosition
				local var_64_17 = Vector3.New(0, 0, 10) + Vector3.New(var_64_16.x, var_64_16.y, 0)
				local var_64_18 = arg_61_1.bgs_.ST07b

				var_64_18.transform.localPosition = var_64_17
				var_64_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_19 = var_64_18:GetComponent("SpriteRenderer")

				if var_64_19 and var_64_19.sprite then
					local var_64_20 = (var_64_18.transform.localPosition - var_64_16).z
					local var_64_21 = manager.ui.mainCameraCom_
					local var_64_22 = 2 * var_64_20 * Mathf.Tan(var_64_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_23 = var_64_22 * var_64_21.aspect
					local var_64_24 = var_64_19.sprite.bounds.size.x
					local var_64_25 = var_64_19.sprite.bounds.size.y
					local var_64_26 = var_64_23 / var_64_24
					local var_64_27 = var_64_22 / var_64_25
					local var_64_28 = var_64_27 < var_64_26 and var_64_26 or var_64_27

					var_64_18.transform.localScale = Vector3.New(var_64_28, var_64_28, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "ST07b" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action445")
			end

			local var_64_30 = 0
			local var_64_31 = 0.1

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_32 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_32:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_33 = arg_61_1:GetWordFromCfg(100)
				local var_64_34 = arg_61_1:FormatText(var_64_33.content)

				arg_61_1.text_.text = var_64_34

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_35 = 4
				local var_64_36 = utf8.len(var_64_34)
				local var_64_37 = var_64_35 <= 0 and var_64_31 or var_64_31 * (var_64_36 / var_64_35)

				if var_64_37 > 0 and var_64_31 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37
					var_64_30 = var_64_30 + 0.3

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end

				arg_61_1.text_.text = var_64_34
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_38 = var_64_30 + 0.3
			local var_64_39 = math.max(var_64_31, arg_61_1.talkMaxDuration)

			if var_64_38 <= arg_61_1.time_ and arg_61_1.time_ < var_64_38 + var_64_39 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_38) / var_64_39

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_38 + var_64_39 and arg_61_1.time_ < var_64_38 + var_64_39 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play111 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 111
		arg_67_1.duration_ = 7.33

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play112(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1148ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 and not isNil(var_70_0) then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1148ui_story and not isNil(var_70_0) then
					arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story then
				arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1084ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 and not isNil(var_70_4) then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1084ui_story and not isNil(var_70_4) then
					arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story then
				arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_70_8 = arg_67_1.bgs_.ST07b.transform
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.var_.moveOldPosST07b = var_70_8.localPosition
			end

			local var_70_10 = 0.001

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_9) / var_70_10
				local var_70_12 = Vector3.New(0, -100, 10)

				var_70_8.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPosST07b, var_70_12, var_70_11)
			end

			if arg_67_1.time_ >= var_70_9 + var_70_10 and arg_67_1.time_ < var_70_9 + var_70_10 + arg_70_0 then
				var_70_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_70_13 = "ST08"

			if arg_67_1.bgs_[var_70_13] == nil then
				local var_70_14 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_13)
				var_70_14.name = var_70_13
				var_70_14.transform.parent = arg_67_1.stage_.transform
				var_70_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_13] = var_70_14
			end

			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				local var_70_16 = manager.ui.mainCamera.transform.localPosition
				local var_70_17 = Vector3.New(0, 0, 10) + Vector3.New(var_70_16.x, var_70_16.y, 0)
				local var_70_18 = arg_67_1.bgs_.ST08

				var_70_18.transform.localPosition = var_70_17
				var_70_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_19 = var_70_18:GetComponent("SpriteRenderer")

				if var_70_19 and var_70_19.sprite then
					local var_70_20 = (var_70_18.transform.localPosition - var_70_16).z
					local var_70_21 = manager.ui.mainCameraCom_
					local var_70_22 = 2 * var_70_20 * Mathf.Tan(var_70_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_23 = var_70_22 * var_70_21.aspect
					local var_70_24 = var_70_19.sprite.bounds.size.x
					local var_70_25 = var_70_19.sprite.bounds.size.y
					local var_70_26 = var_70_23 / var_70_24
					local var_70_27 = var_70_22 / var_70_25
					local var_70_28 = var_70_27 < var_70_26 and var_70_26 or var_70_27

					var_70_18.transform.localScale = Vector3.New(var_70_28, var_70_28, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST08" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action456")
			end

			local var_70_30 = 0
			local var_70_31 = 0.1

			if var_70_30 < arg_67_1.time_ and arg_67_1.time_ <= var_70_30 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_32 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_32:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_33 = arg_67_1:GetWordFromCfg(100)
				local var_70_34 = arg_67_1:FormatText(var_70_33.content)

				arg_67_1.text_.text = var_70_34

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_35 = 4
				local var_70_36 = utf8.len(var_70_34)
				local var_70_37 = var_70_35 <= 0 and var_70_31 or var_70_31 * (var_70_36 / var_70_35)

				if var_70_37 > 0 and var_70_31 < var_70_37 then
					arg_67_1.talkMaxDuration = var_70_37
					var_70_30 = var_70_30 + 0.3

					if var_70_37 + var_70_30 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_37 + var_70_30
					end
				end

				arg_67_1.text_.text = var_70_34
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_38 = var_70_30 + 0.3
			local var_70_39 = math.max(var_70_31, arg_67_1.talkMaxDuration)

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_38) / var_70_39

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play112 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 112
		arg_73_1.duration_ = 6.93

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
			arg_73_1.auto_ = false
		end

		function arg_73_1.playNext_(arg_75_0)
			arg_73_1.onStoryFinished_()
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1148ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect1148ui_story == nil then
				arg_73_1.var_.characterEffect1148ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 and not isNil(var_76_0) then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1148ui_story and not isNil(var_76_0) then
					arg_73_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect1148ui_story then
				arg_73_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1084ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and not isNil(var_76_4) and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.1

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 and not isNil(var_76_4) then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1084ui_story and not isNil(var_76_4) then
					arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and not isNil(var_76_4) and arg_73_1.var_.characterEffect1084ui_story then
				arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_76_8 = arg_73_1.bgs_.ST08.transform
			local var_76_9 = 0

			if var_76_9 < arg_73_1.time_ and arg_73_1.time_ <= var_76_9 + arg_76_0 then
				arg_73_1.var_.moveOldPosST08 = var_76_8.localPosition
			end

			local var_76_10 = 0.001

			if var_76_9 <= arg_73_1.time_ and arg_73_1.time_ < var_76_9 + var_76_10 then
				local var_76_11 = (arg_73_1.time_ - var_76_9) / var_76_10
				local var_76_12 = Vector3.New(0, -100, 10)

				var_76_8.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPosST08, var_76_12, var_76_11)
			end

			if arg_73_1.time_ >= var_76_9 + var_76_10 and arg_73_1.time_ < var_76_9 + var_76_10 + arg_76_0 then
				var_76_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_76_13 = "ST12"

			if arg_73_1.bgs_[var_76_13] == nil then
				local var_76_14 = Object.Instantiate(arg_73_1.paintGo_)

				var_76_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_76_13)
				var_76_14.name = var_76_13
				var_76_14.transform.parent = arg_73_1.stage_.transform
				var_76_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.bgs_[var_76_13] = var_76_14
			end

			local var_76_15 = 0

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				local var_76_16 = manager.ui.mainCamera.transform.localPosition
				local var_76_17 = Vector3.New(0, 0, 10) + Vector3.New(var_76_16.x, var_76_16.y, 0)
				local var_76_18 = arg_73_1.bgs_.ST12

				var_76_18.transform.localPosition = var_76_17
				var_76_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_19 = var_76_18:GetComponent("SpriteRenderer")

				if var_76_19 and var_76_19.sprite then
					local var_76_20 = (var_76_18.transform.localPosition - var_76_16).z
					local var_76_21 = manager.ui.mainCameraCom_
					local var_76_22 = 2 * var_76_20 * Mathf.Tan(var_76_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_23 = var_76_22 * var_76_21.aspect
					local var_76_24 = var_76_19.sprite.bounds.size.x
					local var_76_25 = var_76_19.sprite.bounds.size.y
					local var_76_26 = var_76_23 / var_76_24
					local var_76_27 = var_76_22 / var_76_25
					local var_76_28 = var_76_27 < var_76_26 and var_76_26 or var_76_27

					var_76_18.transform.localScale = Vector3.New(var_76_28, var_76_28, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "ST12" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_29 = 0

			if var_76_29 < arg_73_1.time_ and arg_73_1.time_ <= var_76_29 + arg_76_0 then
				arg_73_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action456")
			end

			local var_76_30 = 0
			local var_76_31 = 0.1

			if var_76_30 < arg_73_1.time_ and arg_73_1.time_ <= var_76_30 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_32 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_32:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_33 = arg_73_1:GetWordFromCfg(100)
				local var_76_34 = arg_73_1:FormatText(var_76_33.content)

				arg_73_1.text_.text = var_76_34

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_35 = 4
				local var_76_36 = utf8.len(var_76_34)
				local var_76_37 = var_76_35 <= 0 and var_76_31 or var_76_31 * (var_76_36 / var_76_35)

				if var_76_37 > 0 and var_76_31 < var_76_37 then
					arg_73_1.talkMaxDuration = var_76_37
					var_76_30 = var_76_30 + 0.3

					if var_76_37 + var_76_30 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_37 + var_76_30
					end
				end

				arg_73_1.text_.text = var_76_34
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_38 = var_76_30 + 0.3
			local var_76_39 = math.max(var_76_31, arg_73_1.talkMaxDuration)

			if var_76_38 <= arg_73_1.time_ and arg_73_1.time_ < var_76_38 + var_76_39 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_38) / var_76_39

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_38 + var_76_39 and arg_73_1.time_ < var_76_38 + var_76_39 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play113 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 113
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
			arg_79_1.auto_ = false
		end

		function arg_79_1.playNext_(arg_81_0)
			arg_79_1.onStoryFinished_()
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = 0

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				local var_82_10 = "A01a"
				local var_82_11 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_82_10)

				arg_79_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").sprite = var_82_11
			end

			local var_82_12 = 0

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.fswbg_:SetActive(true)
				arg_79_1.dialog_:SetActive(false)

				arg_79_1.fswtw_.percent = 0

				local var_82_13 = arg_79_1:GetWordFromCfg(100011003)
				local var_82_14 = arg_79_1:FormatText(var_82_13.content)

				arg_79_1.fswt_.text = var_82_14

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.fswt_)

				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()

				arg_79_1.typewritterCharCountI18N = 0

				arg_79_1:ShowNextGo(false)
			end

			local var_82_15 = 0.1

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.var_.oldValueTypewriter = arg_79_1.fswtw_.percent

				arg_79_1:ShowNextGo(false)
			end

			local var_82_16 = 64
			local var_82_17 = 4.4
			local var_82_18 = arg_79_1:GetWordFromCfg(100011003)
			local var_82_19 = arg_79_1:FormatText(var_82_18.content)
			local var_82_20, var_82_21 = arg_79_1:GetPercentByPara(var_82_19, 1)

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				local var_82_22 = var_82_16 <= 0 and var_82_17 or var_82_17 * ((var_82_21 - arg_79_1.typewritterCharCountI18N) / var_82_16)

				if var_82_22 > 0 and var_82_17 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end
			end

			local var_82_23 = 4.4
			local var_82_24 = math.max(var_82_23, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_24 then
				local var_82_25 = (arg_79_1.time_ - var_82_15) / var_82_24

				arg_79_1.fswtw_.percent = Mathf.Lerp(arg_79_1.var_.oldValueTypewriter, var_82_20, var_82_25)
				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_24 and arg_79_1.time_ < var_82_15 + var_82_24 + arg_82_0 then
				arg_79_1.fswtw_.percent = var_82_20

				arg_79_1.fswtw_:SetDirty()
				arg_79_1:ShowNextGo(true)

				arg_79_1.typewritterCharCountI18N = var_82_21
			end

			local var_82_26 = 0

			if var_82_26 < arg_79_1.time_ and arg_79_1.time_ <= var_82_26 + arg_82_0 then
				local var_82_27 = arg_79_1.fswbg_.transform:Find("textbox/adapt/content") or arg_79_1.fswbg_.transform:Find("textbox/content")
				local var_82_28 = var_82_27:GetComponent("Text")
				local var_82_29 = var_82_27:GetComponent("RectTransform")

				var_82_28.alignment = UnityEngine.TextAnchor.UpperLeft
				var_82_29.offsetMin = Vector2.New(450, -200)
				var_82_29.offsetMax = Vector2.New(-450, -200)
			end

			local var_82_30 = 0
			local var_82_31 = 1

			if var_82_30 < arg_79_1.time_ and arg_79_1.time_ <= var_82_30 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_32 = arg_79_1:GetWordFromCfg(100)
				local var_82_33 = arg_79_1:FormatText(var_82_32.content)

				arg_79_1.text_.text = var_82_33

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_34 = 4
				local var_82_35 = utf8.len(var_82_33)
				local var_82_36 = var_82_34 <= 0 and var_82_31 or var_82_31 * (var_82_35 / var_82_34)

				if var_82_36 > 0 and var_82_31 < var_82_36 then
					arg_79_1.talkMaxDuration = var_82_36

					if var_82_36 + var_82_30 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_36 + var_82_30
					end
				end

				arg_79_1.text_.text = var_82_33
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_37 = math.max(var_82_31, arg_79_1.talkMaxDuration)

			if var_82_30 <= arg_79_1.time_ and arg_79_1.time_ < var_82_30 + var_82_37 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_30) / var_82_37

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_30 + var_82_37 and arg_79_1.time_ < var_82_30 + var_82_37 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play114 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114
		arg_83_1.duration_ = 1

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play115(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, 100, 0)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1148ui_story"].transform
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.var_.moveOldPos1148ui_story = var_86_9.localPosition
			end

			local var_86_11 = 0.001

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11
				local var_86_13 = Vector3.New(0, 100, 0)

				var_86_9.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1148ui_story, var_86_13, var_86_12)

				local var_86_14 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_14.x, var_86_14.y, var_86_14.z)

				local var_86_15 = var_86_9.localEulerAngles

				var_86_15.z = 0
				var_86_15.x = 0
				var_86_9.localEulerAngles = var_86_15
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 then
				var_86_9.localPosition = Vector3.New(0, 100, 0)

				local var_86_16 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_16.x, var_86_16.y, var_86_16.z)

				local var_86_17 = var_86_9.localEulerAngles

				var_86_17.z = 0
				var_86_17.x = 0
				var_86_9.localEulerAngles = var_86_17
			end

			local var_86_18 = "2330001"

			if arg_83_1.actors_[var_86_18] == nil then
				local var_86_19 = Object.Instantiate(arg_83_1.imageGo_, arg_83_1.canvasGo_.transform)

				var_86_19.transform:SetSiblingIndex(1)

				var_86_19.name = var_86_18

				local var_86_20 = var_86_19:GetComponent(typeof(Image))

				var_86_20.sprite = getSpriteWithoutAtlas("TextureConfig/WeaponServant/Portrait/" .. "2330001")

				var_86_20:SetNativeSize()

				var_86_19.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_83_1.actors_[var_86_18] = var_86_19
			end

			local var_86_21 = arg_83_1.actors_["2330001"].transform
			local var_86_22 = 0

			if var_86_22 < arg_83_1.time_ and arg_83_1.time_ <= var_86_22 + arg_86_0 then
				arg_83_1.var_.moveOldPos2330001 = var_86_21.localPosition
				var_86_21.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("2330001", 2)
			end

			local var_86_23 = 0.001

			if var_86_22 <= arg_83_1.time_ and arg_83_1.time_ < var_86_22 + var_86_23 then
				local var_86_24 = (arg_83_1.time_ - var_86_22) / var_86_23
				local var_86_25 = Vector3.New(-350, -100, 0)

				var_86_21.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos2330001, var_86_25, var_86_24)
			end

			if arg_83_1.time_ >= var_86_22 + var_86_23 and arg_83_1.time_ < var_86_22 + var_86_23 + arg_86_0 then
				var_86_21.localPosition = Vector3.New(-350, -100, 0)
			end

			local var_86_26 = arg_83_1.actors_["2330001"].transform
			local var_86_27 = 0

			if var_86_27 < arg_83_1.time_ and arg_83_1.time_ <= var_86_27 + arg_86_0 then
				arg_83_1.var_.moveOldPos2330001 = var_86_26.localPosition
				var_86_26.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("2330001", 4)
			end

			local var_86_28 = 0.999999999999

			if var_86_27 <= arg_83_1.time_ and arg_83_1.time_ < var_86_27 + var_86_28 then
				local var_86_29 = (arg_83_1.time_ - var_86_27) / var_86_28
				local var_86_30 = Vector3.New(350, -350, 0)

				var_86_26.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos2330001, var_86_30, var_86_29)
			end

			if arg_83_1.time_ >= var_86_27 + var_86_28 and arg_83_1.time_ < var_86_27 + var_86_28 + arg_86_0 then
				var_86_26.localPosition = Vector3.New(350, -350, 0)
			end
		end
	end,
	Play115 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115
		arg_87_1.duration_ = 5.63

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
			arg_87_1.auto_ = false
		end

		function arg_87_1.playNext_(arg_89_0)
			arg_87_1.onStoryFinished_()
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = "2330002"

			if arg_87_1.actors_[var_90_0] == nil then
				local var_90_1 = Object.Instantiate(arg_87_1.imageGo_, arg_87_1.canvasGo_.transform)

				var_90_1.transform:SetSiblingIndex(1)

				var_90_1.name = var_90_0

				local var_90_2 = var_90_1:GetComponent(typeof(Image))

				var_90_2.sprite = getSpriteWithoutAtlas("TextureConfig/WeaponServant/Portrait/" .. "2330002")

				var_90_2:SetNativeSize()

				var_90_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_87_1.actors_[var_90_0] = var_90_1
			end

			local var_90_3 = arg_87_1.actors_["2330002"].transform
			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1.var_.moveOldPos2330002 = var_90_3.localPosition
				var_90_3.localScale = Vector3.New(1, 1, 1)
			end

			local var_90_5 = 0.1

			if var_90_4 <= arg_87_1.time_ and arg_87_1.time_ < var_90_4 + var_90_5 then
				local var_90_6 = (arg_87_1.time_ - var_90_4) / var_90_5
				local var_90_7 = Vector3.New(-500, 20, 0)

				var_90_3.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos2330002, var_90_7, var_90_6)
			end

			if arg_87_1.time_ >= var_90_4 + var_90_5 and arg_87_1.time_ < var_90_4 + var_90_5 + arg_90_0 then
				var_90_3.localPosition = Vector3.New(-500, 20, 0)
			end

			local var_90_8 = arg_87_1.actors_["2330002"].transform
			local var_90_9 = 0

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				if var_90_8.parent.name == "2330002_mask" then
					local var_90_10 = var_90_8.parent.gameObject:GetComponent("RectTransform")

					arg_87_1["2330002_mask"] = var_90_10
				else
					local var_90_11 = arg_87_1.canvasGo_.transform:Find("sprite_mask").gameObject
					local var_90_12 = Object.Instantiate(var_90_11)

					var_90_12.name = "2330002_mask"

					var_90_12.transform:SetParent(arg_87_1.canvasGo_.transform)
					var_90_12.transform:SetSiblingIndex(1)

					var_90_12.transform.localPosition = Vector3.New(0, 0, 0)
					var_90_12.transform.localScale = Vector3.New(1, 1, 1)

					var_90_12:SetActive(true)

					local var_90_13 = var_90_12:GetComponent("RectTransform")

					var_90_8.transform:SetParent(var_90_12.transform)

					arg_87_1["2330002_mask"] = var_90_13
				end
			end

			local var_90_14 = 2.6

			if var_90_9 <= arg_87_1.time_ and arg_87_1.time_ < var_90_9 + var_90_14 then
				local var_90_15 = arg_87_1["2330002_mask"]
				local var_90_16 = (arg_87_1.time_ - var_90_9) / var_90_14
				local var_90_17 = Mathf.Lerp(0, 200, var_90_16)

				var_90_15.localPosition = Vector3.New(-500, 20, 0)
				var_90_15.sizeDelta = Vector2.New(var_90_17, 2048)
				var_90_8.transform.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_87_1.time_ >= var_90_9 + var_90_14 and arg_87_1.time_ < var_90_9 + var_90_14 + arg_90_0 then
				arg_87_1["2330002_mask"].sizeDelta = Vector2.New(200, 2048)
			end

			local var_90_18 = arg_87_1.actors_["2330002"].transform
			local var_90_19 = 3.76666666666667

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				if var_90_18.parent.name == "2330002_mask" then
					local var_90_20 = var_90_18.parent.gameObject:GetComponent("RectTransform")

					arg_87_1["2330002_mask"] = var_90_20
				else
					local var_90_21 = arg_87_1.canvasGo_.transform:Find("sprite_mask").gameObject
					local var_90_22 = Object.Instantiate(var_90_21)

					var_90_22.name = "2330002_mask"

					var_90_22.transform:SetParent(arg_87_1.canvasGo_.transform)
					var_90_22.transform:SetSiblingIndex(1)

					var_90_22.transform.localPosition = Vector3.New(0, 0, 0)
					var_90_22.transform.localScale = Vector3.New(1, 1, 1)

					var_90_22:SetActive(true)

					local var_90_23 = var_90_22:GetComponent("RectTransform")

					var_90_18.transform:SetParent(var_90_22.transform)

					arg_87_1["2330002_mask"] = var_90_23
				end
			end

			local var_90_24 = 1.86666666666667

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_24 then
				local var_90_25 = arg_87_1["2330002_mask"]
				local var_90_26 = (arg_87_1.time_ - var_90_19) / var_90_24
				local var_90_27 = Mathf.Lerp(200, 0, var_90_26)

				var_90_25.localPosition = Vector3.New(-500, 20, 0)
				var_90_25.sizeDelta = Vector2.New(var_90_27, 2048)
				var_90_18.transform.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_87_1.time_ >= var_90_19 + var_90_24 and arg_87_1.time_ < var_90_19 + var_90_24 + arg_90_0 then
				arg_87_1["2330002_mask"].sizeDelta = Vector2.New(0, 2048)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST08",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12"
	},
	voices = {}
}
