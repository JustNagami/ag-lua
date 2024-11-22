return {
	Play120452001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120452001
		arg_1_1.duration_ = 5.033

		local var_1_0 = {
			zh = 5.033,
			ja = 4.199999999999
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120452002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J05h"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 0

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.J05h

				var_4_5.transform.localPosition = var_4_4
				var_4_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_6 = var_4_5:GetComponent("SpriteRenderer")

				if var_4_6 and var_4_6.sprite then
					local var_4_7 = (var_4_5.transform.localPosition - var_4_3).z
					local var_4_8 = manager.ui.mainCameraCom_
					local var_4_9 = 2 * var_4_7 * Mathf.Tan(var_4_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_10 = var_4_9 * var_4_8.aspect
					local var_4_11 = var_4_6.sprite.bounds.size.x
					local var_4_12 = var_4_6.sprite.bounds.size.y
					local var_4_13 = var_4_10 / var_4_11
					local var_4_14 = var_4_9 / var_4_12
					local var_4_15 = var_4_14 < var_4_13 and var_4_13 or var_4_14

					var_4_5.transform.localScale = Vector3.New(var_4_15, var_4_15, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "J05h" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_17 = 2

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_17 then
				local var_4_18 = (arg_1_1.time_ - var_4_16) / var_4_17
				local var_4_19 = Color.New(1, 1, 1)

				var_4_19.a = Mathf.Lerp(1, 0, var_4_18)
				arg_1_1.mask_.color = var_4_19
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				local var_4_20 = Color.New(1, 1, 1)
				local var_4_21 = 0

				arg_1_1.mask_.enabled = false
				var_4_20.a = var_4_21
				arg_1_1.mask_.color = var_4_20
			end

			local var_4_22 = 0
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_120_04", "se_story_120_04_1076_move", "")
			end

			local var_4_26 = "1076ui_story"

			if arg_1_1.actors_[var_4_26] == nil then
				local var_4_27 = Object.Instantiate(Asset.Load("Char/" .. var_4_26), arg_1_1.stage_.transform)

				var_4_27.name = var_4_26
				var_4_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_26] = var_4_27

				local var_4_28 = var_4_27:GetComponentInChildren(typeof(CharacterEffect))

				var_4_28.enabled = true

				local var_4_29 = GameObjectTools.GetOrAddComponent(var_4_27, typeof(DynamicBoneHelper))

				if var_4_29 then
					var_4_29:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_28.transform, false)

				arg_1_1.var_[var_4_26 .. "Animator"] = var_4_28.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_26 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_26 .. "LipSync"] = var_4_28.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_30 = arg_1_1.actors_["1076ui_story"].transform
			local var_4_31 = 1.8

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.var_.moveOldPos1076ui_story = var_4_30.localPosition
			end

			local var_4_32 = 0.001

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Vector3.New(0, -1.06, -6.2)

				var_4_30.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1076ui_story, var_4_34, var_4_33)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_30.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_30.localEulerAngles = var_4_36
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				var_4_30.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_30.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_30.localEulerAngles = var_4_38
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_4_41 = arg_1_1.actors_["1076ui_story"]
			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 and arg_1_1.var_.characterEffect1076ui_story == nil then
				arg_1_1.var_.characterEffect1076ui_story = var_4_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_43 = 0.2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				if arg_1_1.var_.characterEffect1076ui_story then
					arg_1_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 and arg_1_1.var_.characterEffect1076ui_story then
				arg_1_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_4_45 = 0.433333333333333
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			local var_4_49 = 0
			local var_4_50 = 0.2

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.15

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_55 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_55:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[389].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(120452001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 6
				local var_4_60 = utf8.len(var_4_58)
				local var_4_61 = var_4_59 <= 0 and var_4_54 or var_4_54 * (var_4_60 / var_4_59)

				if var_4_61 > 0 and var_4_54 < var_4_61 then
					arg_1_1.talkMaxDuration = var_4_61
					var_4_53 = var_4_53 + 0.3

					if var_4_61 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_53
					end
				end

				arg_1_1.text_.text = var_4_58
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452001", "story_v_out_120452.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_120452", "120452001", "story_v_out_120452.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_120452", "120452001", "story_v_out_120452.awb")

						arg_1_1:RecordAudio("120452001", var_4_63)
						arg_1_1:RecordAudio("120452001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120452", "120452001", "story_v_out_120452.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120452", "120452001", "story_v_out_120452.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_64 = var_4_53 + 0.3
			local var_4_65 = math.max(var_4_54, arg_1_1.talkMaxDuration)

			if var_4_64 <= arg_1_1.time_ and arg_1_1.time_ < var_4_64 + var_4_65 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_64) / var_4_65

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_64 + var_4_65 and arg_1_1.time_ < var_4_64 + var_4_65 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120452002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120452002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120452003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1076ui_story"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1076ui_story = var_10_0.localPosition
			end

			local var_10_2 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2
				local var_10_4 = Vector3.New(0, 100, 0)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1076ui_story, var_10_4, var_10_3)

				local var_10_5 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_5.x, var_10_5.y, var_10_5.z)

				local var_10_6 = var_10_0.localEulerAngles

				var_10_6.z = 0
				var_10_6.x = 0
				var_10_0.localEulerAngles = var_10_6
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, 100, 0)

				local var_10_7 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_7.x, var_10_7.y, var_10_7.z)

				local var_10_8 = var_10_0.localEulerAngles

				var_10_8.z = 0
				var_10_8.x = 0
				var_10_0.localEulerAngles = var_10_8
			end

			local var_10_9 = 0
			local var_10_10 = 0.775

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_11 = arg_7_1:GetWordFromCfg(120452002)
				local var_10_12 = arg_7_1:FormatText(var_10_11.content)

				arg_7_1.text_.text = var_10_12

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_13 = 31
				local var_10_14 = utf8.len(var_10_12)
				local var_10_15 = var_10_13 <= 0 and var_10_10 or var_10_10 * (var_10_14 / var_10_13)

				if var_10_15 > 0 and var_10_10 < var_10_15 then
					arg_7_1.talkMaxDuration = var_10_15

					if var_10_15 + var_10_9 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_15 + var_10_9
					end
				end

				arg_7_1.text_.text = var_10_12
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_10, arg_7_1.talkMaxDuration)

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_9) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_9 + var_10_16 and arg_7_1.time_ < var_10_9 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play120452003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120452003
		arg_11_1.duration_ = 2.266

		local var_11_0 = {
			zh = 1.799999999999,
			ja = 2.266
		}
		local var_11_1 = manager.audio:GetLocalizationFlag()

		if var_11_0[var_11_1] ~= nil then
			arg_11_1.duration_ = var_11_0[var_11_1]
		end

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play120452004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = manager.ui.mainCamera.transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.shakeOldPos = var_14_0.localPosition
			end

			local var_14_2 = 0.6

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / 0.066
				local var_14_4, var_14_5 = math.modf(var_14_3)

				var_14_0.localPosition = Vector3.New(var_14_5 * 0.13, var_14_5 * 0.13, var_14_5 * 0.13) + arg_11_1.var_.shakeOldPos
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = arg_11_1.var_.shakeOldPos
			end

			local var_14_6 = 0
			local var_14_7 = 0.366666666666667

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				local var_14_8 = "play"
				local var_14_9 = "effect"

				arg_11_1:AudioAction(var_14_8, var_14_9, "se_story_120_04", "se_story_120_04_1084_attack", "")
			end

			local var_14_10 = 0.466666666666667
			local var_14_11 = 0.833333333333333

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				local var_14_12 = "play"
				local var_14_13 = "effect"

				arg_11_1:AudioAction(var_14_12, var_14_13, "se_story_120_04", "se_story_120_04_enemy_dead", "")
			end

			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_15 = 0.6

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			local var_14_16 = manager.ui.mainCamera.transform
			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				local var_14_18 = arg_11_1.var_.effectweierzhanji1

				if not var_14_18 then
					var_14_18 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_14_18.name = "weierzhanji1"
					arg_11_1.var_.effectweierzhanji1 = var_14_18
				end

				local var_14_19 = var_14_16:Find("")

				if var_14_19 then
					var_14_18.transform.parent = var_14_19
				else
					var_14_18.transform.parent = var_14_16
				end

				var_14_18.transform.localPosition = Vector3.New(0, 0, 0)
				var_14_18.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_14_20 = manager.ui.mainCamera.transform
			local var_14_21 = 1.3

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				local var_14_22 = arg_11_1.var_.effectweierzhanji1

				if var_14_22 then
					Object.Destroy(var_14_22)

					arg_11_1.var_.effectweierzhanji1 = nil
				end
			end

			local var_14_23 = 0
			local var_14_24 = 0.125

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_25 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_26 = arg_11_1:GetWordFromCfg(120452003)
				local var_14_27 = arg_11_1:FormatText(var_14_26.content)

				arg_11_1.text_.text = var_14_27

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_28 = 5
				local var_14_29 = utf8.len(var_14_27)
				local var_14_30 = var_14_28 <= 0 and var_14_24 or var_14_24 * (var_14_29 / var_14_28)

				if var_14_30 > 0 and var_14_24 < var_14_30 then
					arg_11_1.talkMaxDuration = var_14_30

					if var_14_30 + var_14_23 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_30 + var_14_23
					end
				end

				arg_11_1.text_.text = var_14_27
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452003", "story_v_out_120452.awb") ~= 0 then
					local var_14_31 = manager.audio:GetVoiceLength("story_v_out_120452", "120452003", "story_v_out_120452.awb") / 1000

					if var_14_31 + var_14_23 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_31 + var_14_23
					end

					if var_14_26.prefab_name ~= "" and arg_11_1.actors_[var_14_26.prefab_name] ~= nil then
						local var_14_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_26.prefab_name].transform, "story_v_out_120452", "120452003", "story_v_out_120452.awb")

						arg_11_1:RecordAudio("120452003", var_14_32)
						arg_11_1:RecordAudio("120452003", var_14_32)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120452", "120452003", "story_v_out_120452.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120452", "120452003", "story_v_out_120452.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_33 = math.max(var_14_24, arg_11_1.talkMaxDuration)

			if var_14_23 <= arg_11_1.time_ and arg_11_1.time_ < var_14_23 + var_14_33 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_23) / var_14_33

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_23 + var_14_33 and arg_11_1.time_ < var_14_23 + var_14_33 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120452004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120452004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play120452005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.775

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(120452004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 31
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120452005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120452005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play120452006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.775

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_2 = arg_19_1:GetWordFromCfg(120452005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 31
				local var_22_5 = utf8.len(var_22_3)
				local var_22_6 = var_22_4 <= 0 and var_22_1 or var_22_1 * (var_22_5 / var_22_4)

				if var_22_6 > 0 and var_22_1 < var_22_6 then
					arg_19_1.talkMaxDuration = var_22_6

					if var_22_6 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_6 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_3
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_7 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_7 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_7

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_7 and arg_19_1.time_ < var_22_0 + var_22_7 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120452006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120452006
		arg_23_1.duration_ = 6.033

		local var_23_0 = {
			zh = 4.7,
			ja = 6.033
		}
		local var_23_1 = manager.audio:GetLocalizationFlag()

		if var_23_0[var_23_1] ~= nil then
			arg_23_1.duration_ = var_23_0[var_23_1]
		end

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120452007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.175

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[57].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2026")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(120452006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 7
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452006", "story_v_out_120452.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452006", "story_v_out_120452.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_120452", "120452006", "story_v_out_120452.awb")

						arg_23_1:RecordAudio("120452006", var_26_9)
						arg_23_1:RecordAudio("120452006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_120452", "120452006", "story_v_out_120452.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_120452", "120452006", "story_v_out_120452.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play120452007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120452007
		arg_27_1.duration_ = 3.166

		local var_27_0 = {
			zh = 3.166,
			ja = 1.999999999999
		}
		local var_27_1 = manager.audio:GetLocalizationFlag()

		if var_27_0[var_27_1] ~= nil then
			arg_27_1.duration_ = var_27_0[var_27_1]
		end

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play120452008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1076ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1076ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1076ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_30_11 = arg_27_1.actors_["1076ui_story"]
			local var_30_12 = 0

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story == nil then
				arg_27_1.var_.characterEffect1076ui_story = var_30_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_13 = 0.2

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_13 then
				local var_30_14 = (arg_27_1.time_ - var_30_12) / var_30_13

				if arg_27_1.var_.characterEffect1076ui_story then
					arg_27_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_12 + var_30_13 and arg_27_1.time_ < var_30_12 + var_30_13 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story then
				arg_27_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_30_15 = 0
			local var_30_16 = 0.05

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_17 = arg_27_1:FormatText(StoryNameCfg[389].name)

				arg_27_1.leftNameTxt_.text = var_30_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_18 = arg_27_1:GetWordFromCfg(120452007)
				local var_30_19 = arg_27_1:FormatText(var_30_18.content)

				arg_27_1.text_.text = var_30_19

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_20 = 2
				local var_30_21 = utf8.len(var_30_19)
				local var_30_22 = var_30_20 <= 0 and var_30_16 or var_30_16 * (var_30_21 / var_30_20)

				if var_30_22 > 0 and var_30_16 < var_30_22 then
					arg_27_1.talkMaxDuration = var_30_22

					if var_30_22 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_22 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_19
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452007", "story_v_out_120452.awb") ~= 0 then
					local var_30_23 = manager.audio:GetVoiceLength("story_v_out_120452", "120452007", "story_v_out_120452.awb") / 1000

					if var_30_23 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_23 + var_30_15
					end

					if var_30_18.prefab_name ~= "" and arg_27_1.actors_[var_30_18.prefab_name] ~= nil then
						local var_30_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_18.prefab_name].transform, "story_v_out_120452", "120452007", "story_v_out_120452.awb")

						arg_27_1:RecordAudio("120452007", var_30_24)
						arg_27_1:RecordAudio("120452007", var_30_24)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120452", "120452007", "story_v_out_120452.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120452", "120452007", "story_v_out_120452.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_25 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_25 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_25

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_25 and arg_27_1.time_ < var_30_15 + var_30_25 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120452008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120452008
		arg_31_1.duration_ = 7.3

		local var_31_0 = {
			zh = 4.3,
			ja = 7.3
		}
		local var_31_1 = manager.audio:GetLocalizationFlag()

		if var_31_0[var_31_1] ~= nil then
			arg_31_1.duration_ = var_31_0[var_31_1]
		end

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play120452009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1184ui_story"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("Char/" .. var_34_0), arg_31_1.stage_.transform)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_0] = var_34_1

				local var_34_2 = var_34_1:GetComponentInChildren(typeof(CharacterEffect))

				var_34_2.enabled = true

				local var_34_3 = GameObjectTools.GetOrAddComponent(var_34_1, typeof(DynamicBoneHelper))

				if var_34_3 then
					var_34_3:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_2.transform, false)

				arg_31_1.var_[var_34_0 .. "Animator"] = var_34_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_0 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_0 .. "LipSync"] = var_34_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_4 = arg_31_1.actors_["1184ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos1184ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0.7, -0.97, -6)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1184ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_34_15 = arg_31_1.actors_["1184ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story == nil then
				arg_31_1.var_.characterEffect1184ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect1184ui_story then
					arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story then
				arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_34_19 = arg_31_1.actors_["1076ui_story"]
			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 and arg_31_1.var_.characterEffect1076ui_story == nil then
				arg_31_1.var_.characterEffect1076ui_story = var_34_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_21 = 0.2

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_21 then
				local var_34_22 = (arg_31_1.time_ - var_34_20) / var_34_21

				if arg_31_1.var_.characterEffect1076ui_story then
					local var_34_23 = Mathf.Lerp(0, 0.5, var_34_22)

					arg_31_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1076ui_story.fillRatio = var_34_23
				end
			end

			if arg_31_1.time_ >= var_34_20 + var_34_21 and arg_31_1.time_ < var_34_20 + var_34_21 + arg_34_0 and arg_31_1.var_.characterEffect1076ui_story then
				local var_34_24 = 0.5

				arg_31_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1076ui_story.fillRatio = var_34_24
			end

			local var_34_25 = 0
			local var_34_26 = 0.433333333333333

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				local var_34_27 = "play"
				local var_34_28 = "music"

				arg_31_1:AudioAction(var_34_27, var_34_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_34_29 = 0
			local var_34_30 = 0.475

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_31 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_32 = arg_31_1:GetWordFromCfg(120452008)
				local var_34_33 = arg_31_1:FormatText(var_34_32.content)

				arg_31_1.text_.text = var_34_33

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_34 = 19
				local var_34_35 = utf8.len(var_34_33)
				local var_34_36 = var_34_34 <= 0 and var_34_30 or var_34_30 * (var_34_35 / var_34_34)

				if var_34_36 > 0 and var_34_30 < var_34_36 then
					arg_31_1.talkMaxDuration = var_34_36

					if var_34_36 + var_34_29 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_36 + var_34_29
					end
				end

				arg_31_1.text_.text = var_34_33
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452008", "story_v_out_120452.awb") ~= 0 then
					local var_34_37 = manager.audio:GetVoiceLength("story_v_out_120452", "120452008", "story_v_out_120452.awb") / 1000

					if var_34_37 + var_34_29 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_29
					end

					if var_34_32.prefab_name ~= "" and arg_31_1.actors_[var_34_32.prefab_name] ~= nil then
						local var_34_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_32.prefab_name].transform, "story_v_out_120452", "120452008", "story_v_out_120452.awb")

						arg_31_1:RecordAudio("120452008", var_34_38)
						arg_31_1:RecordAudio("120452008", var_34_38)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120452", "120452008", "story_v_out_120452.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120452", "120452008", "story_v_out_120452.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_39 = math.max(var_34_30, arg_31_1.talkMaxDuration)

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_39 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_29) / var_34_39

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_29 + var_34_39 and arg_31_1.time_ < var_34_29 + var_34_39 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120452009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120452009
		arg_35_1.duration_ = 6.966

		local var_35_0 = {
			zh = 4.466,
			ja = 6.966
		}
		local var_35_1 = manager.audio:GetLocalizationFlag()

		if var_35_0[var_35_1] ~= nil then
			arg_35_1.duration_ = var_35_0[var_35_1]
		end

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play120452010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1184ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story == nil then
				arg_35_1.var_.characterEffect1184ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1184ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["1076ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story == nil then
				arg_35_1.var_.characterEffect1076ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.2

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect1076ui_story then
					arg_35_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story then
				arg_35_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_38_10 = 0
			local var_38_11 = 1

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				local var_38_12 = "play"
				local var_38_13 = "music"

				arg_35_1:AudioAction(var_38_12, var_38_13, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			local var_38_14 = 0
			local var_38_15 = 0.5

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_16 = arg_35_1:FormatText(StoryNameCfg[389].name)

				arg_35_1.leftNameTxt_.text = var_38_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_17 = arg_35_1:GetWordFromCfg(120452009)
				local var_38_18 = arg_35_1:FormatText(var_38_17.content)

				arg_35_1.text_.text = var_38_18

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_19 = 20
				local var_38_20 = utf8.len(var_38_18)
				local var_38_21 = var_38_19 <= 0 and var_38_15 or var_38_15 * (var_38_20 / var_38_19)

				if var_38_21 > 0 and var_38_15 < var_38_21 then
					arg_35_1.talkMaxDuration = var_38_21

					if var_38_21 + var_38_14 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_14
					end
				end

				arg_35_1.text_.text = var_38_18
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452009", "story_v_out_120452.awb") ~= 0 then
					local var_38_22 = manager.audio:GetVoiceLength("story_v_out_120452", "120452009", "story_v_out_120452.awb") / 1000

					if var_38_22 + var_38_14 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_14
					end

					if var_38_17.prefab_name ~= "" and arg_35_1.actors_[var_38_17.prefab_name] ~= nil then
						local var_38_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_17.prefab_name].transform, "story_v_out_120452", "120452009", "story_v_out_120452.awb")

						arg_35_1:RecordAudio("120452009", var_38_23)
						arg_35_1:RecordAudio("120452009", var_38_23)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120452", "120452009", "story_v_out_120452.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120452", "120452009", "story_v_out_120452.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_24 = math.max(var_38_15, arg_35_1.talkMaxDuration)

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_24 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_14) / var_38_24

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_14 + var_38_24 and arg_35_1.time_ < var_38_14 + var_38_24 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120452010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120452010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play120452011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1076ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story == nil then
				arg_39_1.var_.characterEffect1076ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1076ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1076ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1076ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.35

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(120452010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 14
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120452011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120452011
		arg_43_1.duration_ = 4.9

		local var_43_0 = {
			zh = 3.133,
			ja = 4.9
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play120452012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1076ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story == nil then
				arg_43_1.var_.characterEffect1076ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1076ui_story then
					arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story then
				arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.35

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[389].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(120452011)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 14
				local var_46_10 = utf8.len(var_46_8)
				local var_46_11 = var_46_9 <= 0 and var_46_5 or var_46_5 * (var_46_10 / var_46_9)

				if var_46_11 > 0 and var_46_5 < var_46_11 then
					arg_43_1.talkMaxDuration = var_46_11

					if var_46_11 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_11 + var_46_4
					end
				end

				arg_43_1.text_.text = var_46_8
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452011", "story_v_out_120452.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452011", "story_v_out_120452.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_out_120452", "120452011", "story_v_out_120452.awb")

						arg_43_1:RecordAudio("120452011", var_46_13)
						arg_43_1:RecordAudio("120452011", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120452", "120452011", "story_v_out_120452.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120452", "120452011", "story_v_out_120452.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_5, arg_43_1.talkMaxDuration)

			if var_46_4 <= arg_43_1.time_ and arg_43_1.time_ < var_46_4 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_4) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_4 + var_46_14 and arg_43_1.time_ < var_46_4 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120452012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120452012
		arg_47_1.duration_ = 4.266

		local var_47_0 = {
			zh = 4.233,
			ja = 4.266
		}
		local var_47_1 = manager.audio:GetLocalizationFlag()

		if var_47_0[var_47_1] ~= nil then
			arg_47_1.duration_ = var_47_0[var_47_1]
		end

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play120452013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.45

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[389].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(120452012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 18
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452012", "story_v_out_120452.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452012", "story_v_out_120452.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_120452", "120452012", "story_v_out_120452.awb")

						arg_47_1:RecordAudio("120452012", var_50_9)
						arg_47_1:RecordAudio("120452012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120452", "120452012", "story_v_out_120452.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120452", "120452012", "story_v_out_120452.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120452013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120452013
		arg_51_1.duration_ = 4.1

		local var_51_0 = {
			zh = 3.2,
			ja = 4.1
		}
		local var_51_1 = manager.audio:GetLocalizationFlag()

		if var_51_0[var_51_1] ~= nil then
			arg_51_1.duration_ = var_51_0[var_51_1]
		end

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120452014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1184ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1184ui_story == nil then
				arg_51_1.var_.characterEffect1184ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1184ui_story then
					arg_51_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1184ui_story then
				arg_51_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1076ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story == nil then
				arg_51_1.var_.characterEffect1076ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.2

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1076ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1076ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1076ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action41312")
			end

			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_54_12 = 0
			local var_54_13 = 0.45

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[6].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(120452013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 18
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452013", "story_v_out_120452.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_out_120452", "120452013", "story_v_out_120452.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_out_120452", "120452013", "story_v_out_120452.awb")

						arg_51_1:RecordAudio("120452013", var_54_21)
						arg_51_1:RecordAudio("120452013", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_120452", "120452013", "story_v_out_120452.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_120452", "120452013", "story_v_out_120452.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120452014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120452014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play120452015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1184ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story == nil then
				arg_55_1.var_.characterEffect1184ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1184ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1184ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1184ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 0.65

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(120452014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 26
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_14 and arg_55_1.time_ < var_58_6 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120452015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120452015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play120452016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.825

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(120452015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 33
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120452016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120452016
		arg_63_1.duration_ = 7.233

		local var_63_0 = {
			zh = 7.233,
			ja = 6.9
		}
		local var_63_1 = manager.audio:GetLocalizationFlag()

		if var_63_0[var_63_1] ~= nil then
			arg_63_1.duration_ = var_63_0[var_63_1]
		end

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play120452017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "ST29a"

			if arg_63_1.bgs_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(arg_63_1.paintGo_)

				var_66_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_66_0)
				var_66_1.name = var_66_0
				var_66_1.transform.parent = arg_63_1.stage_.transform
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.bgs_[var_66_0] = var_66_1
			end

			local var_66_2 = 2

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 then
				local var_66_3 = manager.ui.mainCamera.transform.localPosition
				local var_66_4 = Vector3.New(0, 0, 10) + Vector3.New(var_66_3.x, var_66_3.y, 0)
				local var_66_5 = arg_63_1.bgs_.ST29a

				var_66_5.transform.localPosition = var_66_4
				var_66_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_6 = var_66_5:GetComponent("SpriteRenderer")

				if var_66_6 and var_66_6.sprite then
					local var_66_7 = (var_66_5.transform.localPosition - var_66_3).z
					local var_66_8 = manager.ui.mainCameraCom_
					local var_66_9 = 2 * var_66_7 * Mathf.Tan(var_66_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_10 = var_66_9 * var_66_8.aspect
					local var_66_11 = var_66_6.sprite.bounds.size.x
					local var_66_12 = var_66_6.sprite.bounds.size.y
					local var_66_13 = var_66_10 / var_66_11
					local var_66_14 = var_66_9 / var_66_12
					local var_66_15 = var_66_14 < var_66_13 and var_66_13 or var_66_14

					var_66_5.transform.localScale = Vector3.New(var_66_15, var_66_15, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "ST29a" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_17 = 2

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Color.New(0, 0, 0)

				var_66_19.a = Mathf.Lerp(0, 1, var_66_18)
				arg_63_1.mask_.color = var_66_19
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				local var_66_20 = Color.New(0, 0, 0)

				var_66_20.a = 1
				arg_63_1.mask_.color = var_66_20
			end

			local var_66_21 = 2

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_22 = 2

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Color.New(0, 0, 0)

				var_66_24.a = Mathf.Lerp(1, 0, var_66_23)
				arg_63_1.mask_.color = var_66_24
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				local var_66_25 = Color.New(0, 0, 0)
				local var_66_26 = 0

				arg_63_1.mask_.enabled = false
				var_66_25.a = var_66_26
				arg_63_1.mask_.color = var_66_25
			end

			local var_66_27 = arg_63_1.actors_["1184ui_story"].transform
			local var_66_28 = 2

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1.var_.moveOldPos1184ui_story = var_66_27.localPosition
			end

			local var_66_29 = 0.001

			if var_66_28 <= arg_63_1.time_ and arg_63_1.time_ < var_66_28 + var_66_29 then
				local var_66_30 = (arg_63_1.time_ - var_66_28) / var_66_29
				local var_66_31 = Vector3.New(0, 100, 0)

				var_66_27.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1184ui_story, var_66_31, var_66_30)

				local var_66_32 = manager.ui.mainCamera.transform.position - var_66_27.position

				var_66_27.forward = Vector3.New(var_66_32.x, var_66_32.y, var_66_32.z)

				local var_66_33 = var_66_27.localEulerAngles

				var_66_33.z = 0
				var_66_33.x = 0
				var_66_27.localEulerAngles = var_66_33
			end

			if arg_63_1.time_ >= var_66_28 + var_66_29 and arg_63_1.time_ < var_66_28 + var_66_29 + arg_66_0 then
				var_66_27.localPosition = Vector3.New(0, 100, 0)

				local var_66_34 = manager.ui.mainCamera.transform.position - var_66_27.position

				var_66_27.forward = Vector3.New(var_66_34.x, var_66_34.y, var_66_34.z)

				local var_66_35 = var_66_27.localEulerAngles

				var_66_35.z = 0
				var_66_35.x = 0
				var_66_27.localEulerAngles = var_66_35
			end

			local var_66_36 = arg_63_1.actors_["1076ui_story"].transform
			local var_66_37 = 2

			if var_66_37 < arg_63_1.time_ and arg_63_1.time_ <= var_66_37 + arg_66_0 then
				arg_63_1.var_.moveOldPos1076ui_story = var_66_36.localPosition
			end

			local var_66_38 = 0.001

			if var_66_37 <= arg_63_1.time_ and arg_63_1.time_ < var_66_37 + var_66_38 then
				local var_66_39 = (arg_63_1.time_ - var_66_37) / var_66_38
				local var_66_40 = Vector3.New(0, 100, 0)

				var_66_36.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1076ui_story, var_66_40, var_66_39)

				local var_66_41 = manager.ui.mainCamera.transform.position - var_66_36.position

				var_66_36.forward = Vector3.New(var_66_41.x, var_66_41.y, var_66_41.z)

				local var_66_42 = var_66_36.localEulerAngles

				var_66_42.z = 0
				var_66_42.x = 0
				var_66_36.localEulerAngles = var_66_42
			end

			if arg_63_1.time_ >= var_66_37 + var_66_38 and arg_63_1.time_ < var_66_37 + var_66_38 + arg_66_0 then
				var_66_36.localPosition = Vector3.New(0, 100, 0)

				local var_66_43 = manager.ui.mainCamera.transform.position - var_66_36.position

				var_66_36.forward = Vector3.New(var_66_43.x, var_66_43.y, var_66_43.z)

				local var_66_44 = var_66_36.localEulerAngles

				var_66_44.z = 0
				var_66_44.x = 0
				var_66_36.localEulerAngles = var_66_44
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_45 = 4
			local var_66_46 = 0.25

			if var_66_45 < arg_63_1.time_ and arg_63_1.time_ <= var_66_45 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_47 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_47:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_48 = arg_63_1:FormatText(StoryNameCfg[406].name)

				arg_63_1.leftNameTxt_.text = var_66_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_49 = arg_63_1:GetWordFromCfg(120452016)
				local var_66_50 = arg_63_1:FormatText(var_66_49.content)

				arg_63_1.text_.text = var_66_50

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_51 = 10
				local var_66_52 = utf8.len(var_66_50)
				local var_66_53 = var_66_51 <= 0 and var_66_46 or var_66_46 * (var_66_52 / var_66_51)

				if var_66_53 > 0 and var_66_46 < var_66_53 then
					arg_63_1.talkMaxDuration = var_66_53
					var_66_45 = var_66_45 + 0.3

					if var_66_53 + var_66_45 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_53 + var_66_45
					end
				end

				arg_63_1.text_.text = var_66_50
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452016", "story_v_out_120452.awb") ~= 0 then
					local var_66_54 = manager.audio:GetVoiceLength("story_v_out_120452", "120452016", "story_v_out_120452.awb") / 1000

					if var_66_54 + var_66_45 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_54 + var_66_45
					end

					if var_66_49.prefab_name ~= "" and arg_63_1.actors_[var_66_49.prefab_name] ~= nil then
						local var_66_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_49.prefab_name].transform, "story_v_out_120452", "120452016", "story_v_out_120452.awb")

						arg_63_1:RecordAudio("120452016", var_66_55)
						arg_63_1:RecordAudio("120452016", var_66_55)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_120452", "120452016", "story_v_out_120452.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_120452", "120452016", "story_v_out_120452.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_56 = var_66_45 + 0.3
			local var_66_57 = math.max(var_66_46, arg_63_1.talkMaxDuration)

			if var_66_56 <= arg_63_1.time_ and arg_63_1.time_ < var_66_56 + var_66_57 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_56) / var_66_57

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_56 + var_66_57 and arg_63_1.time_ < var_66_56 + var_66_57 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120452017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 120452017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play120452018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.8

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_2 = arg_69_1:GetWordFromCfg(120452017)
				local var_72_3 = arg_69_1:FormatText(var_72_2.content)

				arg_69_1.text_.text = var_72_3

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_4 = 39
				local var_72_5 = utf8.len(var_72_3)
				local var_72_6 = var_72_4 <= 0 and var_72_1 or var_72_1 * (var_72_5 / var_72_4)

				if var_72_6 > 0 and var_72_1 < var_72_6 then
					arg_69_1.talkMaxDuration = var_72_6

					if var_72_6 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_6 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_3
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_7 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_7 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_7

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_7 and arg_69_1.time_ < var_72_0 + var_72_7 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play120452018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 120452018
		arg_73_1.duration_ = 3.833

		local var_73_0 = {
			zh = 3.066,
			ja = 3.833
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play120452019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1076ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1076ui_story == nil then
				arg_73_1.var_.characterEffect1076ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1076ui_story then
					arg_73_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1076ui_story then
				arg_73_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1184ui_story"].transform
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.var_.moveOldPos1184ui_story = var_76_4.localPosition
			end

			local var_76_6 = 0.001

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6
				local var_76_8 = Vector3.New(-0.7, -0.97, -6)

				var_76_4.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1184ui_story, var_76_8, var_76_7)

				local var_76_9 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_9.x, var_76_9.y, var_76_9.z)

				local var_76_10 = var_76_4.localEulerAngles

				var_76_10.z = 0
				var_76_10.x = 0
				var_76_4.localEulerAngles = var_76_10
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 then
				var_76_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_4.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_4.localEulerAngles = var_76_12
			end

			local var_76_13 = arg_73_1.actors_["1076ui_story"].transform
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1.var_.moveOldPos1076ui_story = var_76_13.localPosition
			end

			local var_76_15 = 0.001

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15
				local var_76_17 = Vector3.New(0.7, -1.06, -6.2)

				var_76_13.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1076ui_story, var_76_17, var_76_16)

				local var_76_18 = manager.ui.mainCamera.transform.position - var_76_13.position

				var_76_13.forward = Vector3.New(var_76_18.x, var_76_18.y, var_76_18.z)

				local var_76_19 = var_76_13.localEulerAngles

				var_76_19.z = 0
				var_76_19.x = 0
				var_76_13.localEulerAngles = var_76_19
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 then
				var_76_13.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_76_20 = manager.ui.mainCamera.transform.position - var_76_13.position

				var_76_13.forward = Vector3.New(var_76_20.x, var_76_20.y, var_76_20.z)

				local var_76_21 = var_76_13.localEulerAngles

				var_76_21.z = 0
				var_76_21.x = 0
				var_76_13.localEulerAngles = var_76_21
			end

			local var_76_22 = arg_73_1.actors_["1184ui_story"]
			local var_76_23 = 0

			if var_76_23 < arg_73_1.time_ and arg_73_1.time_ <= var_76_23 + arg_76_0 and arg_73_1.var_.characterEffect1184ui_story == nil then
				arg_73_1.var_.characterEffect1184ui_story = var_76_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_24 = 0.0166666666666667

			if var_76_23 <= arg_73_1.time_ and arg_73_1.time_ < var_76_23 + var_76_24 then
				local var_76_25 = (arg_73_1.time_ - var_76_23) / var_76_24

				if arg_73_1.var_.characterEffect1184ui_story then
					local var_76_26 = Mathf.Lerp(0, 0.5, var_76_25)

					arg_73_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1184ui_story.fillRatio = var_76_26
				end
			end

			if arg_73_1.time_ >= var_76_23 + var_76_24 and arg_73_1.time_ < var_76_23 + var_76_24 + arg_76_0 and arg_73_1.var_.characterEffect1184ui_story then
				local var_76_27 = 0.5

				arg_73_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1184ui_story.fillRatio = var_76_27
			end

			local var_76_28 = 0
			local var_76_29 = 0.325

			if var_76_28 < arg_73_1.time_ and arg_73_1.time_ <= var_76_28 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_30 = arg_73_1:FormatText(StoryNameCfg[389].name)

				arg_73_1.leftNameTxt_.text = var_76_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_31 = arg_73_1:GetWordFromCfg(120452018)
				local var_76_32 = arg_73_1:FormatText(var_76_31.content)

				arg_73_1.text_.text = var_76_32

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_33 = 13
				local var_76_34 = utf8.len(var_76_32)
				local var_76_35 = var_76_33 <= 0 and var_76_29 or var_76_29 * (var_76_34 / var_76_33)

				if var_76_35 > 0 and var_76_29 < var_76_35 then
					arg_73_1.talkMaxDuration = var_76_35

					if var_76_35 + var_76_28 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_35 + var_76_28
					end
				end

				arg_73_1.text_.text = var_76_32
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452018", "story_v_out_120452.awb") ~= 0 then
					local var_76_36 = manager.audio:GetVoiceLength("story_v_out_120452", "120452018", "story_v_out_120452.awb") / 1000

					if var_76_36 + var_76_28 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_36 + var_76_28
					end

					if var_76_31.prefab_name ~= "" and arg_73_1.actors_[var_76_31.prefab_name] ~= nil then
						local var_76_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_31.prefab_name].transform, "story_v_out_120452", "120452018", "story_v_out_120452.awb")

						arg_73_1:RecordAudio("120452018", var_76_37)
						arg_73_1:RecordAudio("120452018", var_76_37)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_120452", "120452018", "story_v_out_120452.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_120452", "120452018", "story_v_out_120452.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_38 = math.max(var_76_29, arg_73_1.talkMaxDuration)

			if var_76_28 <= arg_73_1.time_ and arg_73_1.time_ < var_76_28 + var_76_38 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_28) / var_76_38

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_28 + var_76_38 and arg_73_1.time_ < var_76_28 + var_76_38 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play120452019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 120452019
		arg_77_1.duration_ = 6.233

		local var_77_0 = {
			zh = 3.3,
			ja = 6.233
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play120452020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1076ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1076ui_story == nil then
				arg_77_1.var_.characterEffect1076ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1076ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1076ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1076ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1076ui_story.fillRatio = var_80_5
			end

			local var_80_6 = 0
			local var_80_7 = 0.425

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[406].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(120452019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 17
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_7 or var_80_7 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_7 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452019", "story_v_out_120452.awb") ~= 0 then
					local var_80_14 = manager.audio:GetVoiceLength("story_v_out_120452", "120452019", "story_v_out_120452.awb") / 1000

					if var_80_14 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_14 + var_80_6
					end

					if var_80_9.prefab_name ~= "" and arg_77_1.actors_[var_80_9.prefab_name] ~= nil then
						local var_80_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_9.prefab_name].transform, "story_v_out_120452", "120452019", "story_v_out_120452.awb")

						arg_77_1:RecordAudio("120452019", var_80_15)
						arg_77_1:RecordAudio("120452019", var_80_15)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_120452", "120452019", "story_v_out_120452.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_120452", "120452019", "story_v_out_120452.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_16 and arg_77_1.time_ < var_80_6 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play120452020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 120452020
		arg_81_1.duration_ = 1.766

		local var_81_0 = {
			zh = 1.133,
			ja = 1.766
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play120452021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.1

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[406].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(120452020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 4
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452020", "story_v_out_120452.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452020", "story_v_out_120452.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_120452", "120452020", "story_v_out_120452.awb")

						arg_81_1:RecordAudio("120452020", var_84_9)
						arg_81_1:RecordAudio("120452020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_120452", "120452020", "story_v_out_120452.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_120452", "120452020", "story_v_out_120452.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play120452021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 120452021
		arg_85_1.duration_ = 4.033

		local var_85_0 = {
			zh = 3.266,
			ja = 4.033
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play120452022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1076ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1076ui_story == nil then
				arg_85_1.var_.characterEffect1076ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1076ui_story then
					arg_85_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1076ui_story then
				arg_85_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_88_4 = 0
			local var_88_5 = 0.275

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_6 = arg_85_1:FormatText(StoryNameCfg[389].name)

				arg_85_1.leftNameTxt_.text = var_88_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_7 = arg_85_1:GetWordFromCfg(120452021)
				local var_88_8 = arg_85_1:FormatText(var_88_7.content)

				arg_85_1.text_.text = var_88_8

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_9 = 11
				local var_88_10 = utf8.len(var_88_8)
				local var_88_11 = var_88_9 <= 0 and var_88_5 or var_88_5 * (var_88_10 / var_88_9)

				if var_88_11 > 0 and var_88_5 < var_88_11 then
					arg_85_1.talkMaxDuration = var_88_11

					if var_88_11 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_11 + var_88_4
					end
				end

				arg_85_1.text_.text = var_88_8
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452021", "story_v_out_120452.awb") ~= 0 then
					local var_88_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452021", "story_v_out_120452.awb") / 1000

					if var_88_12 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_12 + var_88_4
					end

					if var_88_7.prefab_name ~= "" and arg_85_1.actors_[var_88_7.prefab_name] ~= nil then
						local var_88_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_7.prefab_name].transform, "story_v_out_120452", "120452021", "story_v_out_120452.awb")

						arg_85_1:RecordAudio("120452021", var_88_13)
						arg_85_1:RecordAudio("120452021", var_88_13)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_120452", "120452021", "story_v_out_120452.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_120452", "120452021", "story_v_out_120452.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_14 = math.max(var_88_5, arg_85_1.talkMaxDuration)

			if var_88_4 <= arg_85_1.time_ and arg_85_1.time_ < var_88_4 + var_88_14 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_4) / var_88_14

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_4 + var_88_14 and arg_85_1.time_ < var_88_4 + var_88_14 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play120452022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 120452022
		arg_89_1.duration_ = 9.733

		local var_89_0 = {
			zh = 7.533,
			ja = 9.733
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play120452023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1076ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1076ui_story == nil then
				arg_89_1.var_.characterEffect1076ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1076ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1076ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1076ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1076ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 1

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[406].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(120452022)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 40
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452022", "story_v_out_120452.awb") ~= 0 then
					local var_92_14 = manager.audio:GetVoiceLength("story_v_out_120452", "120452022", "story_v_out_120452.awb") / 1000

					if var_92_14 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_14 + var_92_6
					end

					if var_92_9.prefab_name ~= "" and arg_89_1.actors_[var_92_9.prefab_name] ~= nil then
						local var_92_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_9.prefab_name].transform, "story_v_out_120452", "120452022", "story_v_out_120452.awb")

						arg_89_1:RecordAudio("120452022", var_92_15)
						arg_89_1:RecordAudio("120452022", var_92_15)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_120452", "120452022", "story_v_out_120452.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_120452", "120452022", "story_v_out_120452.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_16 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_16 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_16

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_16 and arg_89_1.time_ < var_92_6 + var_92_16 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play120452023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 120452023
		arg_93_1.duration_ = 5.666

		local var_93_0 = {
			zh = 3.4,
			ja = 5.666
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play120452024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1076ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1076ui_story == nil then
				arg_93_1.var_.characterEffect1076ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1076ui_story then
					arg_93_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1076ui_story then
				arg_93_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_96_4 = 0
			local var_96_5 = 0.35

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_6 = arg_93_1:FormatText(StoryNameCfg[389].name)

				arg_93_1.leftNameTxt_.text = var_96_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_7 = arg_93_1:GetWordFromCfg(120452023)
				local var_96_8 = arg_93_1:FormatText(var_96_7.content)

				arg_93_1.text_.text = var_96_8

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_9 = 14
				local var_96_10 = utf8.len(var_96_8)
				local var_96_11 = var_96_9 <= 0 and var_96_5 or var_96_5 * (var_96_10 / var_96_9)

				if var_96_11 > 0 and var_96_5 < var_96_11 then
					arg_93_1.talkMaxDuration = var_96_11

					if var_96_11 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_11 + var_96_4
					end
				end

				arg_93_1.text_.text = var_96_8
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452023", "story_v_out_120452.awb") ~= 0 then
					local var_96_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452023", "story_v_out_120452.awb") / 1000

					if var_96_12 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_4
					end

					if var_96_7.prefab_name ~= "" and arg_93_1.actors_[var_96_7.prefab_name] ~= nil then
						local var_96_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_7.prefab_name].transform, "story_v_out_120452", "120452023", "story_v_out_120452.awb")

						arg_93_1:RecordAudio("120452023", var_96_13)
						arg_93_1:RecordAudio("120452023", var_96_13)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_120452", "120452023", "story_v_out_120452.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_120452", "120452023", "story_v_out_120452.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_5, arg_93_1.talkMaxDuration)

			if var_96_4 <= arg_93_1.time_ and arg_93_1.time_ < var_96_4 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_4) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_4 + var_96_14 and arg_93_1.time_ < var_96_4 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play120452024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 120452024
		arg_97_1.duration_ = 3.6

		local var_97_0 = {
			zh = 1.966,
			ja = 3.6
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play120452025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.25

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[406].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(120452024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 10
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452024", "story_v_out_120452.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452024", "story_v_out_120452.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_120452", "120452024", "story_v_out_120452.awb")

						arg_97_1:RecordAudio("120452024", var_100_9)
						arg_97_1:RecordAudio("120452024", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_120452", "120452024", "story_v_out_120452.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_120452", "120452024", "story_v_out_120452.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play120452025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 120452025
		arg_101_1.duration_ = 9.4

		local var_101_0 = {
			zh = 5.133,
			ja = 9.4
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play120452026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.7

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[406].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(120452025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 28
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452025", "story_v_out_120452.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452025", "story_v_out_120452.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_120452", "120452025", "story_v_out_120452.awb")

						arg_101_1:RecordAudio("120452025", var_104_9)
						arg_101_1:RecordAudio("120452025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_120452", "120452025", "story_v_out_120452.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_120452", "120452025", "story_v_out_120452.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play120452026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 120452026
		arg_105_1.duration_ = 2.5

		local var_105_0 = {
			zh = 1.633,
			ja = 2.5
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play120452027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1076ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1076ui_story == nil then
				arg_105_1.var_.characterEffect1076ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.2

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1076ui_story then
					arg_105_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1076ui_story then
				arg_105_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_108_4 = 0
			local var_108_5 = 0.25

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_6 = arg_105_1:FormatText(StoryNameCfg[389].name)

				arg_105_1.leftNameTxt_.text = var_108_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_7 = arg_105_1:GetWordFromCfg(120452026)
				local var_108_8 = arg_105_1:FormatText(var_108_7.content)

				arg_105_1.text_.text = var_108_8

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_9 = 10
				local var_108_10 = utf8.len(var_108_8)
				local var_108_11 = var_108_9 <= 0 and var_108_5 or var_108_5 * (var_108_10 / var_108_9)

				if var_108_11 > 0 and var_108_5 < var_108_11 then
					arg_105_1.talkMaxDuration = var_108_11

					if var_108_11 + var_108_4 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_11 + var_108_4
					end
				end

				arg_105_1.text_.text = var_108_8
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452026", "story_v_out_120452.awb") ~= 0 then
					local var_108_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452026", "story_v_out_120452.awb") / 1000

					if var_108_12 + var_108_4 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_4
					end

					if var_108_7.prefab_name ~= "" and arg_105_1.actors_[var_108_7.prefab_name] ~= nil then
						local var_108_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_7.prefab_name].transform, "story_v_out_120452", "120452026", "story_v_out_120452.awb")

						arg_105_1:RecordAudio("120452026", var_108_13)
						arg_105_1:RecordAudio("120452026", var_108_13)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_120452", "120452026", "story_v_out_120452.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_120452", "120452026", "story_v_out_120452.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_14 = math.max(var_108_5, arg_105_1.talkMaxDuration)

			if var_108_4 <= arg_105_1.time_ and arg_105_1.time_ < var_108_4 + var_108_14 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_4) / var_108_14

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_4 + var_108_14 and arg_105_1.time_ < var_108_4 + var_108_14 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play120452027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 120452027
		arg_109_1.duration_ = 1.433

		local var_109_0 = {
			zh = 0.999999999999,
			ja = 1.433
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play120452028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.075

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[406].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifang")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(120452027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 3
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452027", "story_v_out_120452.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452027", "story_v_out_120452.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_120452", "120452027", "story_v_out_120452.awb")

						arg_109_1:RecordAudio("120452027", var_112_9)
						arg_109_1:RecordAudio("120452027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_120452", "120452027", "story_v_out_120452.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_120452", "120452027", "story_v_out_120452.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play120452028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 120452028
		arg_113_1.duration_ = 12.666

		local var_113_0 = {
			zh = 8.266,
			ja = 12.666
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play120452029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1076ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1076ui_story == nil then
				arg_113_1.var_.characterEffect1076ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1076ui_story then
					arg_113_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1076ui_story then
				arg_113_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_116_4 = 0
			local var_116_5 = 0.825

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_6 = arg_113_1:FormatText(StoryNameCfg[389].name)

				arg_113_1.leftNameTxt_.text = var_116_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_7 = arg_113_1:GetWordFromCfg(120452028)
				local var_116_8 = arg_113_1:FormatText(var_116_7.content)

				arg_113_1.text_.text = var_116_8

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_9 = 33
				local var_116_10 = utf8.len(var_116_8)
				local var_116_11 = var_116_9 <= 0 and var_116_5 or var_116_5 * (var_116_10 / var_116_9)

				if var_116_11 > 0 and var_116_5 < var_116_11 then
					arg_113_1.talkMaxDuration = var_116_11

					if var_116_11 + var_116_4 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_11 + var_116_4
					end
				end

				arg_113_1.text_.text = var_116_8
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452028", "story_v_out_120452.awb") ~= 0 then
					local var_116_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452028", "story_v_out_120452.awb") / 1000

					if var_116_12 + var_116_4 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_12 + var_116_4
					end

					if var_116_7.prefab_name ~= "" and arg_113_1.actors_[var_116_7.prefab_name] ~= nil then
						local var_116_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_7.prefab_name].transform, "story_v_out_120452", "120452028", "story_v_out_120452.awb")

						arg_113_1:RecordAudio("120452028", var_116_13)
						arg_113_1:RecordAudio("120452028", var_116_13)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_120452", "120452028", "story_v_out_120452.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_120452", "120452028", "story_v_out_120452.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_14 = math.max(var_116_5, arg_113_1.talkMaxDuration)

			if var_116_4 <= arg_113_1.time_ and arg_113_1.time_ < var_116_4 + var_116_14 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_4) / var_116_14

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_4 + var_116_14 and arg_113_1.time_ < var_116_4 + var_116_14 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play120452029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 120452029
		arg_117_1.duration_ = 6.8

		local var_117_0 = {
			zh = 3.7,
			ja = 6.8
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play120452030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.475

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[389].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(120452029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 19
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452029", "story_v_out_120452.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452029", "story_v_out_120452.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_120452", "120452029", "story_v_out_120452.awb")

						arg_117_1:RecordAudio("120452029", var_120_9)
						arg_117_1:RecordAudio("120452029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_120452", "120452029", "story_v_out_120452.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_120452", "120452029", "story_v_out_120452.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play120452030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 120452030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play120452031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1076ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1076ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, 100, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1076ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, 100, 0)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1184ui_story"].transform
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1.var_.moveOldPos1184ui_story = var_124_9.localPosition
			end

			local var_124_11 = 0.001

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11
				local var_124_13 = Vector3.New(0, 100, 0)

				var_124_9.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1184ui_story, var_124_13, var_124_12)

				local var_124_14 = manager.ui.mainCamera.transform.position - var_124_9.position

				var_124_9.forward = Vector3.New(var_124_14.x, var_124_14.y, var_124_14.z)

				local var_124_15 = var_124_9.localEulerAngles

				var_124_15.z = 0
				var_124_15.x = 0
				var_124_9.localEulerAngles = var_124_15
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 then
				var_124_9.localPosition = Vector3.New(0, 100, 0)

				local var_124_16 = manager.ui.mainCamera.transform.position - var_124_9.position

				var_124_9.forward = Vector3.New(var_124_16.x, var_124_16.y, var_124_16.z)

				local var_124_17 = var_124_9.localEulerAngles

				var_124_17.z = 0
				var_124_17.x = 0
				var_124_9.localEulerAngles = var_124_17
			end

			local var_124_18 = 0
			local var_124_19 = 1.05

			if var_124_18 < arg_121_1.time_ and arg_121_1.time_ <= var_124_18 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_20 = arg_121_1:GetWordFromCfg(120452030)
				local var_124_21 = arg_121_1:FormatText(var_124_20.content)

				arg_121_1.text_.text = var_124_21

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_22 = 42
				local var_124_23 = utf8.len(var_124_21)
				local var_124_24 = var_124_22 <= 0 and var_124_19 or var_124_19 * (var_124_23 / var_124_22)

				if var_124_24 > 0 and var_124_19 < var_124_24 then
					arg_121_1.talkMaxDuration = var_124_24

					if var_124_24 + var_124_18 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_24 + var_124_18
					end
				end

				arg_121_1.text_.text = var_124_21
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_25 = math.max(var_124_19, arg_121_1.talkMaxDuration)

			if var_124_18 <= arg_121_1.time_ and arg_121_1.time_ < var_124_18 + var_124_25 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_18) / var_124_25

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_18 + var_124_25 and arg_121_1.time_ < var_124_18 + var_124_25 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play120452031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 120452031
		arg_125_1.duration_ = 6.033

		local var_125_0 = {
			zh = 5.633,
			ja = 6.033
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play120452032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1184ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1184ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(-0.7, -0.97, -6)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1184ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_128_11 = arg_125_1.actors_["1184ui_story"]
			local var_128_12 = 0

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 and arg_125_1.var_.characterEffect1184ui_story == nil then
				arg_125_1.var_.characterEffect1184ui_story = var_128_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_13 = 0.2

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_13 then
				local var_128_14 = (arg_125_1.time_ - var_128_12) / var_128_13

				if arg_125_1.var_.characterEffect1184ui_story then
					arg_125_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_12 + var_128_13 and arg_125_1.time_ < var_128_12 + var_128_13 + arg_128_0 and arg_125_1.var_.characterEffect1184ui_story then
				arg_125_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_128_15 = 0
			local var_128_16 = 0.475

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[6].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(120452031)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 19
				local var_128_21 = utf8.len(var_128_19)
				local var_128_22 = var_128_20 <= 0 and var_128_16 or var_128_16 * (var_128_21 / var_128_20)

				if var_128_22 > 0 and var_128_16 < var_128_22 then
					arg_125_1.talkMaxDuration = var_128_22

					if var_128_22 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_22 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_19
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452031", "story_v_out_120452.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_out_120452", "120452031", "story_v_out_120452.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_out_120452", "120452031", "story_v_out_120452.awb")

						arg_125_1:RecordAudio("120452031", var_128_24)
						arg_125_1:RecordAudio("120452031", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_120452", "120452031", "story_v_out_120452.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_120452", "120452031", "story_v_out_120452.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_25 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_25 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_25

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_25 and arg_125_1.time_ < var_128_15 + var_128_25 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play120452032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 120452032
		arg_129_1.duration_ = 5.866

		local var_129_0 = {
			zh = 2.766,
			ja = 5.866
		}
		local var_129_1 = manager.audio:GetLocalizationFlag()

		if var_129_0[var_129_1] ~= nil then
			arg_129_1.duration_ = var_129_0[var_129_1]
		end

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play120452033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_132_1 = arg_129_1.actors_["1076ui_story"]
			local var_132_2 = 0

			if var_132_2 < arg_129_1.time_ and arg_129_1.time_ <= var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1076ui_story == nil then
				arg_129_1.var_.characterEffect1076ui_story = var_132_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_3 = 0.2

			if var_132_2 <= arg_129_1.time_ and arg_129_1.time_ < var_132_2 + var_132_3 then
				local var_132_4 = (arg_129_1.time_ - var_132_2) / var_132_3

				if arg_129_1.var_.characterEffect1076ui_story then
					arg_129_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_2 + var_132_3 and arg_129_1.time_ < var_132_2 + var_132_3 + arg_132_0 and arg_129_1.var_.characterEffect1076ui_story then
				arg_129_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_132_5 = arg_129_1.actors_["1076ui_story"].transform
			local var_132_6 = 0

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.var_.moveOldPos1076ui_story = var_132_5.localPosition
			end

			local var_132_7 = 0.001

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_7 then
				local var_132_8 = (arg_129_1.time_ - var_132_6) / var_132_7
				local var_132_9 = Vector3.New(0.7, -1.06, -6.2)

				var_132_5.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1076ui_story, var_132_9, var_132_8)

				local var_132_10 = manager.ui.mainCamera.transform.position - var_132_5.position

				var_132_5.forward = Vector3.New(var_132_10.x, var_132_10.y, var_132_10.z)

				local var_132_11 = var_132_5.localEulerAngles

				var_132_11.z = 0
				var_132_11.x = 0
				var_132_5.localEulerAngles = var_132_11
			end

			if arg_129_1.time_ >= var_132_6 + var_132_7 and arg_129_1.time_ < var_132_6 + var_132_7 + arg_132_0 then
				var_132_5.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_132_12 = manager.ui.mainCamera.transform.position - var_132_5.position

				var_132_5.forward = Vector3.New(var_132_12.x, var_132_12.y, var_132_12.z)

				local var_132_13 = var_132_5.localEulerAngles

				var_132_13.z = 0
				var_132_13.x = 0
				var_132_5.localEulerAngles = var_132_13
			end

			local var_132_14 = arg_129_1.actors_["1184ui_story"]
			local var_132_15 = 0

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 and arg_129_1.var_.characterEffect1184ui_story == nil then
				arg_129_1.var_.characterEffect1184ui_story = var_132_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_16 = 0.2

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_16 then
				local var_132_17 = (arg_129_1.time_ - var_132_15) / var_132_16

				if arg_129_1.var_.characterEffect1184ui_story then
					local var_132_18 = Mathf.Lerp(0, 0.5, var_132_17)

					arg_129_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1184ui_story.fillRatio = var_132_18
				end
			end

			if arg_129_1.time_ >= var_132_15 + var_132_16 and arg_129_1.time_ < var_132_15 + var_132_16 + arg_132_0 and arg_129_1.var_.characterEffect1184ui_story then
				local var_132_19 = 0.5

				arg_129_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1184ui_story.fillRatio = var_132_19
			end

			local var_132_20 = 0

			if var_132_20 < arg_129_1.time_ and arg_129_1.time_ <= var_132_20 + arg_132_0 then
				arg_129_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action6_1")
			end

			local var_132_21 = 0
			local var_132_22 = 0.35

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[389].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(120452032)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 14
				local var_132_27 = utf8.len(var_132_25)
				local var_132_28 = var_132_26 <= 0 and var_132_22 or var_132_22 * (var_132_27 / var_132_26)

				if var_132_28 > 0 and var_132_22 < var_132_28 then
					arg_129_1.talkMaxDuration = var_132_28

					if var_132_28 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_21
					end
				end

				arg_129_1.text_.text = var_132_25
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452032", "story_v_out_120452.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_120452", "120452032", "story_v_out_120452.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_120452", "120452032", "story_v_out_120452.awb")

						arg_129_1:RecordAudio("120452032", var_132_30)
						arg_129_1:RecordAudio("120452032", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_120452", "120452032", "story_v_out_120452.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_120452", "120452032", "story_v_out_120452.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_31 = math.max(var_132_22, arg_129_1.talkMaxDuration)

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_31 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_21) / var_132_31

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_21 + var_132_31 and arg_129_1.time_ < var_132_21 + var_132_31 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play120452033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 120452033
		arg_133_1.duration_ = 10.566

		local var_133_0 = {
			zh = 6.7,
			ja = 10.566
		}
		local var_133_1 = manager.audio:GetLocalizationFlag()

		if var_133_0[var_133_1] ~= nil then
			arg_133_1.duration_ = var_133_0[var_133_1]
		end

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play120452034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1184ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1184ui_story == nil then
				arg_133_1.var_.characterEffect1184ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1184ui_story then
					arg_133_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1184ui_story then
				arg_133_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_136_4 = arg_133_1.actors_["1076ui_story"]
			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 and arg_133_1.var_.characterEffect1076ui_story == nil then
				arg_133_1.var_.characterEffect1076ui_story = var_136_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_6 = 0.2

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_5) / var_136_6

				if arg_133_1.var_.characterEffect1076ui_story then
					local var_136_8 = Mathf.Lerp(0, 0.5, var_136_7)

					arg_133_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1076ui_story.fillRatio = var_136_8
				end
			end

			if arg_133_1.time_ >= var_136_5 + var_136_6 and arg_133_1.time_ < var_136_5 + var_136_6 + arg_136_0 and arg_133_1.var_.characterEffect1076ui_story then
				local var_136_9 = 0.5

				arg_133_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1076ui_story.fillRatio = var_136_9
			end

			local var_136_10 = 0
			local var_136_11 = 0.875

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_12 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_13 = arg_133_1:GetWordFromCfg(120452033)
				local var_136_14 = arg_133_1:FormatText(var_136_13.content)

				arg_133_1.text_.text = var_136_14

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_15 = 35
				local var_136_16 = utf8.len(var_136_14)
				local var_136_17 = var_136_15 <= 0 and var_136_11 or var_136_11 * (var_136_16 / var_136_15)

				if var_136_17 > 0 and var_136_11 < var_136_17 then
					arg_133_1.talkMaxDuration = var_136_17

					if var_136_17 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_17 + var_136_10
					end
				end

				arg_133_1.text_.text = var_136_14
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452033", "story_v_out_120452.awb") ~= 0 then
					local var_136_18 = manager.audio:GetVoiceLength("story_v_out_120452", "120452033", "story_v_out_120452.awb") / 1000

					if var_136_18 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_18 + var_136_10
					end

					if var_136_13.prefab_name ~= "" and arg_133_1.actors_[var_136_13.prefab_name] ~= nil then
						local var_136_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_13.prefab_name].transform, "story_v_out_120452", "120452033", "story_v_out_120452.awb")

						arg_133_1:RecordAudio("120452033", var_136_19)
						arg_133_1:RecordAudio("120452033", var_136_19)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_120452", "120452033", "story_v_out_120452.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_120452", "120452033", "story_v_out_120452.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_20 = math.max(var_136_11, arg_133_1.talkMaxDuration)

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_20 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_10) / var_136_20

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_10 + var_136_20 and arg_133_1.time_ < var_136_10 + var_136_20 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play120452034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 120452034
		arg_137_1.duration_ = 13.9

		local var_137_0 = {
			zh = 8.3,
			ja = 13.9
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play120452035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.05

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[6].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(120452034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 42
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452034", "story_v_out_120452.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452034", "story_v_out_120452.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_120452", "120452034", "story_v_out_120452.awb")

						arg_137_1:RecordAudio("120452034", var_140_9)
						arg_137_1:RecordAudio("120452034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_120452", "120452034", "story_v_out_120452.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_120452", "120452034", "story_v_out_120452.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play120452035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 120452035
		arg_141_1.duration_ = 18.1

		local var_141_0 = {
			zh = 5.766,
			ja = 18.1
		}
		local var_141_1 = manager.audio:GetLocalizationFlag()

		if var_141_0[var_141_1] ~= nil then
			arg_141_1.duration_ = var_141_0[var_141_1]
		end

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play120452036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1184ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1184ui_story == nil then
				arg_141_1.var_.characterEffect1184ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1184ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1184ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1184ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1184ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["1076ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect1076ui_story == nil then
				arg_141_1.var_.characterEffect1076ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.2

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect1076ui_story then
					arg_141_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect1076ui_story then
				arg_141_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action6_2")
			end

			local var_144_11 = 0
			local var_144_12 = 0.625

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_13 = arg_141_1:FormatText(StoryNameCfg[389].name)

				arg_141_1.leftNameTxt_.text = var_144_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_14 = arg_141_1:GetWordFromCfg(120452035)
				local var_144_15 = arg_141_1:FormatText(var_144_14.content)

				arg_141_1.text_.text = var_144_15

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_16 = 25
				local var_144_17 = utf8.len(var_144_15)
				local var_144_18 = var_144_16 <= 0 and var_144_12 or var_144_12 * (var_144_17 / var_144_16)

				if var_144_18 > 0 and var_144_12 < var_144_18 then
					arg_141_1.talkMaxDuration = var_144_18

					if var_144_18 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_18 + var_144_11
					end
				end

				arg_141_1.text_.text = var_144_15
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452035", "story_v_out_120452.awb") ~= 0 then
					local var_144_19 = manager.audio:GetVoiceLength("story_v_out_120452", "120452035", "story_v_out_120452.awb") / 1000

					if var_144_19 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_11
					end

					if var_144_14.prefab_name ~= "" and arg_141_1.actors_[var_144_14.prefab_name] ~= nil then
						local var_144_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_14.prefab_name].transform, "story_v_out_120452", "120452035", "story_v_out_120452.awb")

						arg_141_1:RecordAudio("120452035", var_144_20)
						arg_141_1:RecordAudio("120452035", var_144_20)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_120452", "120452035", "story_v_out_120452.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_120452", "120452035", "story_v_out_120452.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_21 = math.max(var_144_12, arg_141_1.talkMaxDuration)

			if var_144_11 <= arg_141_1.time_ and arg_141_1.time_ < var_144_11 + var_144_21 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_11) / var_144_21

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_11 + var_144_21 and arg_141_1.time_ < var_144_11 + var_144_21 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play120452036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 120452036
		arg_145_1.duration_ = 12.033

		local var_145_0 = {
			zh = 8.833,
			ja = 12.033
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play120452037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.925

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[389].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(120452036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 37
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452036", "story_v_out_120452.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452036", "story_v_out_120452.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_120452", "120452036", "story_v_out_120452.awb")

						arg_145_1:RecordAudio("120452036", var_148_9)
						arg_145_1:RecordAudio("120452036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_120452", "120452036", "story_v_out_120452.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_120452", "120452036", "story_v_out_120452.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play120452037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 120452037
		arg_149_1.duration_ = 9.333

		local var_149_0 = {
			zh = 3.9,
			ja = 9.333
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play120452038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.5

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[389].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(120452037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 19
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452037", "story_v_out_120452.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452037", "story_v_out_120452.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_120452", "120452037", "story_v_out_120452.awb")

						arg_149_1:RecordAudio("120452037", var_152_9)
						arg_149_1:RecordAudio("120452037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_120452", "120452037", "story_v_out_120452.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_120452", "120452037", "story_v_out_120452.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play120452038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 120452038
		arg_153_1.duration_ = 11.733

		local var_153_0 = {
			zh = 5.7,
			ja = 11.733
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play120452039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1184ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1184ui_story == nil then
				arg_153_1.var_.characterEffect1184ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1184ui_story then
					arg_153_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1184ui_story then
				arg_153_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1076ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1076ui_story == nil then
				arg_153_1.var_.characterEffect1076ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.2

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1076ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1076ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1076ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1076ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0
			local var_156_11 = 0.65

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_12 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_13 = arg_153_1:GetWordFromCfg(120452038)
				local var_156_14 = arg_153_1:FormatText(var_156_13.content)

				arg_153_1.text_.text = var_156_14

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_15 = 25
				local var_156_16 = utf8.len(var_156_14)
				local var_156_17 = var_156_15 <= 0 and var_156_11 or var_156_11 * (var_156_16 / var_156_15)

				if var_156_17 > 0 and var_156_11 < var_156_17 then
					arg_153_1.talkMaxDuration = var_156_17

					if var_156_17 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_17 + var_156_10
					end
				end

				arg_153_1.text_.text = var_156_14
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452038", "story_v_out_120452.awb") ~= 0 then
					local var_156_18 = manager.audio:GetVoiceLength("story_v_out_120452", "120452038", "story_v_out_120452.awb") / 1000

					if var_156_18 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_10
					end

					if var_156_13.prefab_name ~= "" and arg_153_1.actors_[var_156_13.prefab_name] ~= nil then
						local var_156_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_13.prefab_name].transform, "story_v_out_120452", "120452038", "story_v_out_120452.awb")

						arg_153_1:RecordAudio("120452038", var_156_19)
						arg_153_1:RecordAudio("120452038", var_156_19)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_120452", "120452038", "story_v_out_120452.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_120452", "120452038", "story_v_out_120452.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_20 = math.max(var_156_11, arg_153_1.talkMaxDuration)

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_20 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_10) / var_156_20

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_10 + var_156_20 and arg_153_1.time_ < var_156_10 + var_156_20 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play120452039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 120452039
		arg_157_1.duration_ = 8.533

		local var_157_0 = {
			zh = 5.7,
			ja = 8.533
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play120452040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1184ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1184ui_story == nil then
				arg_157_1.var_.characterEffect1184ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1184ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1184ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1184ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1184ui_story.fillRatio = var_160_5
			end

			local var_160_6 = arg_157_1.actors_["1076ui_story"]
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 and arg_157_1.var_.characterEffect1076ui_story == nil then
				arg_157_1.var_.characterEffect1076ui_story = var_160_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_8 = 0.2

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_8 then
				local var_160_9 = (arg_157_1.time_ - var_160_7) / var_160_8

				if arg_157_1.var_.characterEffect1076ui_story then
					arg_157_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_7 + var_160_8 and arg_157_1.time_ < var_160_7 + var_160_8 + arg_160_0 and arg_157_1.var_.characterEffect1076ui_story then
				arg_157_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_160_10 = 0
			local var_160_11 = 0.65

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_12 = arg_157_1:FormatText(StoryNameCfg[389].name)

				arg_157_1.leftNameTxt_.text = var_160_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_13 = arg_157_1:GetWordFromCfg(120452039)
				local var_160_14 = arg_157_1:FormatText(var_160_13.content)

				arg_157_1.text_.text = var_160_14

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_15 = 26
				local var_160_16 = utf8.len(var_160_14)
				local var_160_17 = var_160_15 <= 0 and var_160_11 or var_160_11 * (var_160_16 / var_160_15)

				if var_160_17 > 0 and var_160_11 < var_160_17 then
					arg_157_1.talkMaxDuration = var_160_17

					if var_160_17 + var_160_10 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_17 + var_160_10
					end
				end

				arg_157_1.text_.text = var_160_14
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452039", "story_v_out_120452.awb") ~= 0 then
					local var_160_18 = manager.audio:GetVoiceLength("story_v_out_120452", "120452039", "story_v_out_120452.awb") / 1000

					if var_160_18 + var_160_10 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_18 + var_160_10
					end

					if var_160_13.prefab_name ~= "" and arg_157_1.actors_[var_160_13.prefab_name] ~= nil then
						local var_160_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_13.prefab_name].transform, "story_v_out_120452", "120452039", "story_v_out_120452.awb")

						arg_157_1:RecordAudio("120452039", var_160_19)
						arg_157_1:RecordAudio("120452039", var_160_19)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_120452", "120452039", "story_v_out_120452.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_120452", "120452039", "story_v_out_120452.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_20 = math.max(var_160_11, arg_157_1.talkMaxDuration)

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_20 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_10) / var_160_20

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_10 + var_160_20 and arg_157_1.time_ < var_160_10 + var_160_20 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play120452040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 120452040
		arg_161_1.duration_ = 11.733

		local var_161_0 = {
			zh = 8.7,
			ja = 11.733
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play120452041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.85

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[389].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(120452040)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 34
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452040", "story_v_out_120452.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452040", "story_v_out_120452.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_120452", "120452040", "story_v_out_120452.awb")

						arg_161_1:RecordAudio("120452040", var_164_9)
						arg_161_1:RecordAudio("120452040", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_120452", "120452040", "story_v_out_120452.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_120452", "120452040", "story_v_out_120452.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play120452041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 120452041
		arg_165_1.duration_ = 8.999999999999

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play120452042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = "XH0207"

			if arg_165_1.bgs_[var_168_0] == nil then
				local var_168_1 = Object.Instantiate(arg_165_1.paintGo_)

				var_168_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_168_0)
				var_168_1.name = var_168_0
				var_168_1.transform.parent = arg_165_1.stage_.transform
				var_168_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_165_1.bgs_[var_168_0] = var_168_1
			end

			local var_168_2 = 2

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				local var_168_3 = manager.ui.mainCamera.transform.localPosition
				local var_168_4 = Vector3.New(0, 0, 10) + Vector3.New(var_168_3.x, var_168_3.y, 0)
				local var_168_5 = arg_165_1.bgs_.XH0207

				var_168_5.transform.localPosition = var_168_4
				var_168_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_168_6 = var_168_5:GetComponent("SpriteRenderer")

				if var_168_6 and var_168_6.sprite then
					local var_168_7 = (var_168_5.transform.localPosition - var_168_3).z
					local var_168_8 = manager.ui.mainCameraCom_
					local var_168_9 = 2 * var_168_7 * Mathf.Tan(var_168_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_168_10 = var_168_9 * var_168_8.aspect
					local var_168_11 = var_168_6.sprite.bounds.size.x
					local var_168_12 = var_168_6.sprite.bounds.size.y
					local var_168_13 = var_168_10 / var_168_11
					local var_168_14 = var_168_9 / var_168_12
					local var_168_15 = var_168_14 < var_168_13 and var_168_13 or var_168_14

					var_168_5.transform.localScale = Vector3.New(var_168_15, var_168_15, 0)
				end

				for iter_168_0, iter_168_1 in pairs(arg_165_1.bgs_) do
					if iter_168_0 ~= "XH0207" then
						iter_168_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_17 = 2

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Color.New(0, 0, 0)

				var_168_19.a = Mathf.Lerp(0, 1, var_168_18)
				arg_165_1.mask_.color = var_168_19
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				local var_168_20 = Color.New(0, 0, 0)

				var_168_20.a = 1
				arg_165_1.mask_.color = var_168_20
			end

			local var_168_21 = 2

			if var_168_21 < arg_165_1.time_ and arg_165_1.time_ <= var_168_21 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_22 = 2

			if var_168_21 <= arg_165_1.time_ and arg_165_1.time_ < var_168_21 + var_168_22 then
				local var_168_23 = (arg_165_1.time_ - var_168_21) / var_168_22
				local var_168_24 = Color.New(0, 0, 0)

				var_168_24.a = Mathf.Lerp(1, 0, var_168_23)
				arg_165_1.mask_.color = var_168_24
			end

			if arg_165_1.time_ >= var_168_21 + var_168_22 and arg_165_1.time_ < var_168_21 + var_168_22 + arg_168_0 then
				local var_168_25 = Color.New(0, 0, 0)
				local var_168_26 = 0

				arg_165_1.mask_.enabled = false
				var_168_25.a = var_168_26
				arg_165_1.mask_.color = var_168_25
			end

			local var_168_27 = arg_165_1.actors_["1076ui_story"].transform
			local var_168_28 = 1.966

			if var_168_28 < arg_165_1.time_ and arg_165_1.time_ <= var_168_28 + arg_168_0 then
				arg_165_1.var_.moveOldPos1076ui_story = var_168_27.localPosition
			end

			local var_168_29 = 0.001

			if var_168_28 <= arg_165_1.time_ and arg_165_1.time_ < var_168_28 + var_168_29 then
				local var_168_30 = (arg_165_1.time_ - var_168_28) / var_168_29
				local var_168_31 = Vector3.New(0, 100, 0)

				var_168_27.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1076ui_story, var_168_31, var_168_30)

				local var_168_32 = manager.ui.mainCamera.transform.position - var_168_27.position

				var_168_27.forward = Vector3.New(var_168_32.x, var_168_32.y, var_168_32.z)

				local var_168_33 = var_168_27.localEulerAngles

				var_168_33.z = 0
				var_168_33.x = 0
				var_168_27.localEulerAngles = var_168_33
			end

			if arg_165_1.time_ >= var_168_28 + var_168_29 and arg_165_1.time_ < var_168_28 + var_168_29 + arg_168_0 then
				var_168_27.localPosition = Vector3.New(0, 100, 0)

				local var_168_34 = manager.ui.mainCamera.transform.position - var_168_27.position

				var_168_27.forward = Vector3.New(var_168_34.x, var_168_34.y, var_168_34.z)

				local var_168_35 = var_168_27.localEulerAngles

				var_168_35.z = 0
				var_168_35.x = 0
				var_168_27.localEulerAngles = var_168_35
			end

			local var_168_36 = arg_165_1.actors_["1184ui_story"].transform
			local var_168_37 = 1.966

			if var_168_37 < arg_165_1.time_ and arg_165_1.time_ <= var_168_37 + arg_168_0 then
				arg_165_1.var_.moveOldPos1184ui_story = var_168_36.localPosition
			end

			local var_168_38 = 0.001

			if var_168_37 <= arg_165_1.time_ and arg_165_1.time_ < var_168_37 + var_168_38 then
				local var_168_39 = (arg_165_1.time_ - var_168_37) / var_168_38
				local var_168_40 = Vector3.New(0, 100, 0)

				var_168_36.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1184ui_story, var_168_40, var_168_39)

				local var_168_41 = manager.ui.mainCamera.transform.position - var_168_36.position

				var_168_36.forward = Vector3.New(var_168_41.x, var_168_41.y, var_168_41.z)

				local var_168_42 = var_168_36.localEulerAngles

				var_168_42.z = 0
				var_168_42.x = 0
				var_168_36.localEulerAngles = var_168_42
			end

			if arg_165_1.time_ >= var_168_37 + var_168_38 and arg_165_1.time_ < var_168_37 + var_168_38 + arg_168_0 then
				var_168_36.localPosition = Vector3.New(0, 100, 0)

				local var_168_43 = manager.ui.mainCamera.transform.position - var_168_36.position

				var_168_36.forward = Vector3.New(var_168_43.x, var_168_43.y, var_168_43.z)

				local var_168_44 = var_168_36.localEulerAngles

				var_168_44.z = 0
				var_168_44.x = 0
				var_168_36.localEulerAngles = var_168_44
			end

			if arg_165_1.frameCnt_ <= 1 then
				arg_165_1.dialog_:SetActive(false)
			end

			local var_168_45 = 3.999999999999
			local var_168_46 = 0.6

			if var_168_45 < arg_165_1.time_ and arg_165_1.time_ <= var_168_45 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0

				arg_165_1.dialog_:SetActive(true)

				local var_168_47 = LeanTween.value(arg_165_1.dialog_, 0, 1, 0.3)

				var_168_47:setOnUpdate(LuaHelper.FloatAction(function(arg_169_0)
					arg_165_1.dialogCg_.alpha = arg_169_0
				end))
				var_168_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_165_1.dialog_)
					var_168_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_165_1.duration_ = arg_165_1.duration_ + 0.3

				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_48 = arg_165_1:GetWordFromCfg(120452041)
				local var_168_49 = arg_165_1:FormatText(var_168_48.content)

				arg_165_1.text_.text = var_168_49

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_50 = 24
				local var_168_51 = utf8.len(var_168_49)
				local var_168_52 = var_168_50 <= 0 and var_168_46 or var_168_46 * (var_168_51 / var_168_50)

				if var_168_52 > 0 and var_168_46 < var_168_52 then
					arg_165_1.talkMaxDuration = var_168_52
					var_168_45 = var_168_45 + 0.3

					if var_168_52 + var_168_45 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_52 + var_168_45
					end
				end

				arg_165_1.text_.text = var_168_49
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_53 = var_168_45 + 0.3
			local var_168_54 = math.max(var_168_46, arg_165_1.talkMaxDuration)

			if var_168_53 <= arg_165_1.time_ and arg_165_1.time_ < var_168_53 + var_168_54 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_53) / var_168_54

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_53 + var_168_54 and arg_165_1.time_ < var_168_53 + var_168_54 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play120452042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120452042
		arg_171_1.duration_ = 5.2

		local var_171_0 = {
			zh = 4.033,
			ja = 5.2
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play120452043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.525

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[6].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(120452042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 21
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452042", "story_v_out_120452.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452042", "story_v_out_120452.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_120452", "120452042", "story_v_out_120452.awb")

						arg_171_1:RecordAudio("120452042", var_174_9)
						arg_171_1:RecordAudio("120452042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120452", "120452042", "story_v_out_120452.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120452", "120452042", "story_v_out_120452.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120452043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120452043
		arg_175_1.duration_ = 8.533

		local var_175_0 = {
			zh = 7.3,
			ja = 8.533
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play120452044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.725

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[389].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(120452043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 29
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452043", "story_v_out_120452.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452043", "story_v_out_120452.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_120452", "120452043", "story_v_out_120452.awb")

						arg_175_1:RecordAudio("120452043", var_178_9)
						arg_175_1:RecordAudio("120452043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120452", "120452043", "story_v_out_120452.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120452", "120452043", "story_v_out_120452.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120452044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120452044
		arg_179_1.duration_ = 7.766

		local var_179_0 = {
			zh = 7,
			ja = 7.766
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120452045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.7

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[389].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(120452044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 28
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452044", "story_v_out_120452.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452044", "story_v_out_120452.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_120452", "120452044", "story_v_out_120452.awb")

						arg_179_1:RecordAudio("120452044", var_182_9)
						arg_179_1:RecordAudio("120452044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120452", "120452044", "story_v_out_120452.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120452", "120452044", "story_v_out_120452.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120452045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120452045
		arg_183_1.duration_ = 7.6

		local var_183_0 = {
			zh = 5.9,
			ja = 7.6
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play120452046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.525

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[6].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, true)
				arg_183_1.iconController_:SetSelectedState("hero")

				arg_183_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(120452045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 21
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452045", "story_v_out_120452.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452045", "story_v_out_120452.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_120452", "120452045", "story_v_out_120452.awb")

						arg_183_1:RecordAudio("120452045", var_186_9)
						arg_183_1:RecordAudio("120452045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120452", "120452045", "story_v_out_120452.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120452", "120452045", "story_v_out_120452.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120452046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120452046
		arg_187_1.duration_ = 10.433

		local var_187_0 = {
			zh = 4.7,
			ja = 10.433
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120452047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.35

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[389].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(120452046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 14
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452046", "story_v_out_120452.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452046", "story_v_out_120452.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_120452", "120452046", "story_v_out_120452.awb")

						arg_187_1:RecordAudio("120452046", var_190_9)
						arg_187_1:RecordAudio("120452046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120452", "120452046", "story_v_out_120452.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120452", "120452046", "story_v_out_120452.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120452047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120452047
		arg_191_1.duration_ = 4.733

		local var_191_0 = {
			zh = 4.733,
			ja = 4.333
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120452048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.475

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[389].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(120452047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 19
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452047", "story_v_out_120452.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452047", "story_v_out_120452.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_120452", "120452047", "story_v_out_120452.awb")

						arg_191_1:RecordAudio("120452047", var_194_9)
						arg_191_1:RecordAudio("120452047", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_120452", "120452047", "story_v_out_120452.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_120452", "120452047", "story_v_out_120452.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_10 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_10 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_10

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_10 and arg_191_1.time_ < var_194_0 + var_194_10 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120452048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120452048
		arg_195_1.duration_ = 2.766

		local var_195_0 = {
			zh = 2.766,
			ja = 2.266
		}
		local var_195_1 = manager.audio:GetLocalizationFlag()

		if var_195_0[var_195_1] ~= nil then
			arg_195_1.duration_ = var_195_0[var_195_1]
		end

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play120452049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.3

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(120452048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 12
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452048", "story_v_out_120452.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452048", "story_v_out_120452.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_120452", "120452048", "story_v_out_120452.awb")

						arg_195_1:RecordAudio("120452048", var_198_9)
						arg_195_1:RecordAudio("120452048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120452", "120452048", "story_v_out_120452.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120452", "120452048", "story_v_out_120452.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120452049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120452049
		arg_199_1.duration_ = 3.566

		local var_199_0 = {
			zh = 3.566,
			ja = 1.633
		}
		local var_199_1 = manager.audio:GetLocalizationFlag()

		if var_199_0[var_199_1] ~= nil then
			arg_199_1.duration_ = var_199_0[var_199_1]
		end

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play120452050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.125

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[389].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(120452049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 5
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452049", "story_v_out_120452.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452049", "story_v_out_120452.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_120452", "120452049", "story_v_out_120452.awb")

						arg_199_1:RecordAudio("120452049", var_202_9)
						arg_199_1:RecordAudio("120452049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120452", "120452049", "story_v_out_120452.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120452", "120452049", "story_v_out_120452.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120452050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120452050
		arg_203_1.duration_ = 10

		local var_203_0 = {
			zh = 7.1,
			ja = 10
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120452051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.6

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[389].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(120452050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 24
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452050", "story_v_out_120452.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452050", "story_v_out_120452.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_120452", "120452050", "story_v_out_120452.awb")

						arg_203_1:RecordAudio("120452050", var_206_9)
						arg_203_1:RecordAudio("120452050", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_120452", "120452050", "story_v_out_120452.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_120452", "120452050", "story_v_out_120452.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120452051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120452051
		arg_207_1.duration_ = 12.3

		local var_207_0 = {
			zh = 12.266,
			ja = 12.3
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play120452052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.075

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[389].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(120452051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 43
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452051", "story_v_out_120452.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452051", "story_v_out_120452.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_120452", "120452051", "story_v_out_120452.awb")

						arg_207_1:RecordAudio("120452051", var_210_9)
						arg_207_1:RecordAudio("120452051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120452", "120452051", "story_v_out_120452.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120452", "120452051", "story_v_out_120452.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120452052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120452052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play120452053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.475

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[7].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(120452052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 19
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_8 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_8 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_8

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_8 and arg_211_1.time_ < var_214_0 + var_214_8 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play120452053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120452053
		arg_215_1.duration_ = 2.366

		local var_215_0 = {
			zh = 1.566,
			ja = 2.366
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play120452054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.175

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(120452053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 7
				local var_218_6 = utf8.len(var_218_4)
				local var_218_7 = var_218_5 <= 0 and var_218_1 or var_218_1 * (var_218_6 / var_218_5)

				if var_218_7 > 0 and var_218_1 < var_218_7 then
					arg_215_1.talkMaxDuration = var_218_7

					if var_218_7 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_7 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_4
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452053", "story_v_out_120452.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452053", "story_v_out_120452.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_120452", "120452053", "story_v_out_120452.awb")

						arg_215_1:RecordAudio("120452053", var_218_9)
						arg_215_1:RecordAudio("120452053", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_120452", "120452053", "story_v_out_120452.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_120452", "120452053", "story_v_out_120452.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_10 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_10 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_10

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_10 and arg_215_1.time_ < var_218_0 + var_218_10 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play120452054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120452054
		arg_219_1.duration_ = 13.566

		local var_219_0 = {
			zh = 9.933,
			ja = 13.566
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play120452055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 2

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				local var_222_1 = manager.ui.mainCamera.transform.localPosition
				local var_222_2 = Vector3.New(0, 0, 10) + Vector3.New(var_222_1.x, var_222_1.y, 0)
				local var_222_3 = arg_219_1.bgs_.ST29a

				var_222_3.transform.localPosition = var_222_2
				var_222_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_222_4 = var_222_3:GetComponent("SpriteRenderer")

				if var_222_4 and var_222_4.sprite then
					local var_222_5 = (var_222_3.transform.localPosition - var_222_1).z
					local var_222_6 = manager.ui.mainCameraCom_
					local var_222_7 = 2 * var_222_5 * Mathf.Tan(var_222_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_222_8 = var_222_7 * var_222_6.aspect
					local var_222_9 = var_222_4.sprite.bounds.size.x
					local var_222_10 = var_222_4.sprite.bounds.size.y
					local var_222_11 = var_222_8 / var_222_9
					local var_222_12 = var_222_7 / var_222_10
					local var_222_13 = var_222_12 < var_222_11 and var_222_11 or var_222_12

					var_222_3.transform.localScale = Vector3.New(var_222_13, var_222_13, 0)
				end

				for iter_222_0, iter_222_1 in pairs(arg_219_1.bgs_) do
					if iter_222_0 ~= "ST29a" then
						iter_222_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_15 = 2

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15
				local var_222_17 = Color.New(0, 0, 0)

				var_222_17.a = Mathf.Lerp(0, 1, var_222_16)
				arg_219_1.mask_.color = var_222_17
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 then
				local var_222_18 = Color.New(0, 0, 0)

				var_222_18.a = 1
				arg_219_1.mask_.color = var_222_18
			end

			local var_222_19 = 2

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_20 = 2

			if var_222_19 <= arg_219_1.time_ and arg_219_1.time_ < var_222_19 + var_222_20 then
				local var_222_21 = (arg_219_1.time_ - var_222_19) / var_222_20
				local var_222_22 = Color.New(0, 0, 0)

				var_222_22.a = Mathf.Lerp(1, 0, var_222_21)
				arg_219_1.mask_.color = var_222_22
			end

			if arg_219_1.time_ >= var_222_19 + var_222_20 and arg_219_1.time_ < var_222_19 + var_222_20 + arg_222_0 then
				local var_222_23 = Color.New(0, 0, 0)
				local var_222_24 = 0

				arg_219_1.mask_.enabled = false
				var_222_23.a = var_222_24
				arg_219_1.mask_.color = var_222_23
			end

			local var_222_25 = arg_219_1.actors_["1184ui_story"].transform
			local var_222_26 = 4

			if var_222_26 < arg_219_1.time_ and arg_219_1.time_ <= var_222_26 + arg_222_0 then
				arg_219_1.var_.moveOldPos1184ui_story = var_222_25.localPosition
			end

			local var_222_27 = 0.001

			if var_222_26 <= arg_219_1.time_ and arg_219_1.time_ < var_222_26 + var_222_27 then
				local var_222_28 = (arg_219_1.time_ - var_222_26) / var_222_27
				local var_222_29 = Vector3.New(-0.7, -0.97, -6)

				var_222_25.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1184ui_story, var_222_29, var_222_28)

				local var_222_30 = manager.ui.mainCamera.transform.position - var_222_25.position

				var_222_25.forward = Vector3.New(var_222_30.x, var_222_30.y, var_222_30.z)

				local var_222_31 = var_222_25.localEulerAngles

				var_222_31.z = 0
				var_222_31.x = 0
				var_222_25.localEulerAngles = var_222_31
			end

			if arg_219_1.time_ >= var_222_26 + var_222_27 and arg_219_1.time_ < var_222_26 + var_222_27 + arg_222_0 then
				var_222_25.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_222_32 = manager.ui.mainCamera.transform.position - var_222_25.position

				var_222_25.forward = Vector3.New(var_222_32.x, var_222_32.y, var_222_32.z)

				local var_222_33 = var_222_25.localEulerAngles

				var_222_33.z = 0
				var_222_33.x = 0
				var_222_25.localEulerAngles = var_222_33
			end

			local var_222_34 = 4

			if var_222_34 < arg_219_1.time_ and arg_219_1.time_ <= var_222_34 + arg_222_0 then
				arg_219_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_222_35 = 4

			if var_222_35 < arg_219_1.time_ and arg_219_1.time_ <= var_222_35 + arg_222_0 then
				arg_219_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_222_36 = arg_219_1.actors_["1184ui_story"]
			local var_222_37 = 4

			if var_222_37 < arg_219_1.time_ and arg_219_1.time_ <= var_222_37 + arg_222_0 and arg_219_1.var_.characterEffect1184ui_story == nil then
				arg_219_1.var_.characterEffect1184ui_story = var_222_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_38 = 0.2

			if var_222_37 <= arg_219_1.time_ and arg_219_1.time_ < var_222_37 + var_222_38 then
				local var_222_39 = (arg_219_1.time_ - var_222_37) / var_222_38

				if arg_219_1.var_.characterEffect1184ui_story then
					arg_219_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_37 + var_222_38 and arg_219_1.time_ < var_222_37 + var_222_38 + arg_222_0 and arg_219_1.var_.characterEffect1184ui_story then
				arg_219_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_40 = 4
			local var_222_41 = 0.675

			if var_222_40 < arg_219_1.time_ and arg_219_1.time_ <= var_222_40 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_42 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_42:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_43 = arg_219_1:FormatText(StoryNameCfg[6].name)

				arg_219_1.leftNameTxt_.text = var_222_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_44 = arg_219_1:GetWordFromCfg(120452054)
				local var_222_45 = arg_219_1:FormatText(var_222_44.content)

				arg_219_1.text_.text = var_222_45

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_46 = 27
				local var_222_47 = utf8.len(var_222_45)
				local var_222_48 = var_222_46 <= 0 and var_222_41 or var_222_41 * (var_222_47 / var_222_46)

				if var_222_48 > 0 and var_222_41 < var_222_48 then
					arg_219_1.talkMaxDuration = var_222_48
					var_222_40 = var_222_40 + 0.3

					if var_222_48 + var_222_40 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_48 + var_222_40
					end
				end

				arg_219_1.text_.text = var_222_45
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452054", "story_v_out_120452.awb") ~= 0 then
					local var_222_49 = manager.audio:GetVoiceLength("story_v_out_120452", "120452054", "story_v_out_120452.awb") / 1000

					if var_222_49 + var_222_40 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_49 + var_222_40
					end

					if var_222_44.prefab_name ~= "" and arg_219_1.actors_[var_222_44.prefab_name] ~= nil then
						local var_222_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_44.prefab_name].transform, "story_v_out_120452", "120452054", "story_v_out_120452.awb")

						arg_219_1:RecordAudio("120452054", var_222_50)
						arg_219_1:RecordAudio("120452054", var_222_50)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120452", "120452054", "story_v_out_120452.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120452", "120452054", "story_v_out_120452.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_51 = var_222_40 + 0.3
			local var_222_52 = math.max(var_222_41, arg_219_1.talkMaxDuration)

			if var_222_51 <= arg_219_1.time_ and arg_219_1.time_ < var_222_51 + var_222_52 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_51) / var_222_52

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_51 + var_222_52 and arg_219_1.time_ < var_222_51 + var_222_52 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play120452055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 120452055
		arg_225_1.duration_ = 2.733

		local var_225_0 = {
			zh = 1.999999999999,
			ja = 2.733
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play120452056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1076ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1076ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0.7, -1.06, -6.2)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1076ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = 0

			if var_228_9 < arg_225_1.time_ and arg_225_1.time_ <= var_228_9 + arg_228_0 then
				arg_225_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 then
				arg_225_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_228_11 = arg_225_1.actors_["1076ui_story"]
			local var_228_12 = 0

			if var_228_12 < arg_225_1.time_ and arg_225_1.time_ <= var_228_12 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story == nil then
				arg_225_1.var_.characterEffect1076ui_story = var_228_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_13 = 0.2

			if var_228_12 <= arg_225_1.time_ and arg_225_1.time_ < var_228_12 + var_228_13 then
				local var_228_14 = (arg_225_1.time_ - var_228_12) / var_228_13

				if arg_225_1.var_.characterEffect1076ui_story then
					arg_225_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_12 + var_228_13 and arg_225_1.time_ < var_228_12 + var_228_13 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story then
				arg_225_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_228_15 = arg_225_1.actors_["1184ui_story"]
			local var_228_16 = 0

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 and arg_225_1.var_.characterEffect1184ui_story == nil then
				arg_225_1.var_.characterEffect1184ui_story = var_228_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_17 = 0.2

			if var_228_16 <= arg_225_1.time_ and arg_225_1.time_ < var_228_16 + var_228_17 then
				local var_228_18 = (arg_225_1.time_ - var_228_16) / var_228_17

				if arg_225_1.var_.characterEffect1184ui_story then
					local var_228_19 = Mathf.Lerp(0, 0.5, var_228_18)

					arg_225_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1184ui_story.fillRatio = var_228_19
				end
			end

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 and arg_225_1.var_.characterEffect1184ui_story then
				local var_228_20 = 0.5

				arg_225_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1184ui_story.fillRatio = var_228_20
			end

			local var_228_21 = 0
			local var_228_22 = 0.2

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_23 = arg_225_1:FormatText(StoryNameCfg[389].name)

				arg_225_1.leftNameTxt_.text = var_228_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_24 = arg_225_1:GetWordFromCfg(120452055)
				local var_228_25 = arg_225_1:FormatText(var_228_24.content)

				arg_225_1.text_.text = var_228_25

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_26 = 8
				local var_228_27 = utf8.len(var_228_25)
				local var_228_28 = var_228_26 <= 0 and var_228_22 or var_228_22 * (var_228_27 / var_228_26)

				if var_228_28 > 0 and var_228_22 < var_228_28 then
					arg_225_1.talkMaxDuration = var_228_28

					if var_228_28 + var_228_21 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_28 + var_228_21
					end
				end

				arg_225_1.text_.text = var_228_25
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452055", "story_v_out_120452.awb") ~= 0 then
					local var_228_29 = manager.audio:GetVoiceLength("story_v_out_120452", "120452055", "story_v_out_120452.awb") / 1000

					if var_228_29 + var_228_21 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_29 + var_228_21
					end

					if var_228_24.prefab_name ~= "" and arg_225_1.actors_[var_228_24.prefab_name] ~= nil then
						local var_228_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_24.prefab_name].transform, "story_v_out_120452", "120452055", "story_v_out_120452.awb")

						arg_225_1:RecordAudio("120452055", var_228_30)
						arg_225_1:RecordAudio("120452055", var_228_30)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_120452", "120452055", "story_v_out_120452.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_120452", "120452055", "story_v_out_120452.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_31 = math.max(var_228_22, arg_225_1.talkMaxDuration)

			if var_228_21 <= arg_225_1.time_ and arg_225_1.time_ < var_228_21 + var_228_31 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_21) / var_228_31

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_21 + var_228_31 and arg_225_1.time_ < var_228_21 + var_228_31 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play120452056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 120452056
		arg_229_1.duration_ = 9.266

		local var_229_0 = {
			zh = 9.266,
			ja = 8.866
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play120452057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action437")
			end

			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_232_2 = arg_229_1.actors_["1184ui_story"]
			local var_232_3 = 0

			if var_232_3 < arg_229_1.time_ and arg_229_1.time_ <= var_232_3 + arg_232_0 and arg_229_1.var_.characterEffect1184ui_story == nil then
				arg_229_1.var_.characterEffect1184ui_story = var_232_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_4 = 0.2

			if var_232_3 <= arg_229_1.time_ and arg_229_1.time_ < var_232_3 + var_232_4 then
				local var_232_5 = (arg_229_1.time_ - var_232_3) / var_232_4

				if arg_229_1.var_.characterEffect1184ui_story then
					arg_229_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_3 + var_232_4 and arg_229_1.time_ < var_232_3 + var_232_4 + arg_232_0 and arg_229_1.var_.characterEffect1184ui_story then
				arg_229_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_232_6 = arg_229_1.actors_["1076ui_story"]
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 and arg_229_1.var_.characterEffect1076ui_story == nil then
				arg_229_1.var_.characterEffect1076ui_story = var_232_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_8 = 0.2

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_8 then
				local var_232_9 = (arg_229_1.time_ - var_232_7) / var_232_8

				if arg_229_1.var_.characterEffect1076ui_story then
					local var_232_10 = Mathf.Lerp(0, 0.5, var_232_9)

					arg_229_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1076ui_story.fillRatio = var_232_10
				end
			end

			if arg_229_1.time_ >= var_232_7 + var_232_8 and arg_229_1.time_ < var_232_7 + var_232_8 + arg_232_0 and arg_229_1.var_.characterEffect1076ui_story then
				local var_232_11 = 0.5

				arg_229_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1076ui_story.fillRatio = var_232_11
			end

			local var_232_12 = 0
			local var_232_13 = 1.15

			if var_232_12 < arg_229_1.time_ and arg_229_1.time_ <= var_232_12 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_14 = arg_229_1:FormatText(StoryNameCfg[6].name)

				arg_229_1.leftNameTxt_.text = var_232_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_15 = arg_229_1:GetWordFromCfg(120452056)
				local var_232_16 = arg_229_1:FormatText(var_232_15.content)

				arg_229_1.text_.text = var_232_16

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_17 = 46
				local var_232_18 = utf8.len(var_232_16)
				local var_232_19 = var_232_17 <= 0 and var_232_13 or var_232_13 * (var_232_18 / var_232_17)

				if var_232_19 > 0 and var_232_13 < var_232_19 then
					arg_229_1.talkMaxDuration = var_232_19

					if var_232_19 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_12
					end
				end

				arg_229_1.text_.text = var_232_16
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452056", "story_v_out_120452.awb") ~= 0 then
					local var_232_20 = manager.audio:GetVoiceLength("story_v_out_120452", "120452056", "story_v_out_120452.awb") / 1000

					if var_232_20 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_20 + var_232_12
					end

					if var_232_15.prefab_name ~= "" and arg_229_1.actors_[var_232_15.prefab_name] ~= nil then
						local var_232_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_15.prefab_name].transform, "story_v_out_120452", "120452056", "story_v_out_120452.awb")

						arg_229_1:RecordAudio("120452056", var_232_21)
						arg_229_1:RecordAudio("120452056", var_232_21)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_120452", "120452056", "story_v_out_120452.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_120452", "120452056", "story_v_out_120452.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_22 = math.max(var_232_13, arg_229_1.talkMaxDuration)

			if var_232_12 <= arg_229_1.time_ and arg_229_1.time_ < var_232_12 + var_232_22 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_12) / var_232_22

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_12 + var_232_22 and arg_229_1.time_ < var_232_12 + var_232_22 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play120452057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 120452057
		arg_233_1.duration_ = 5.566

		local var_233_0 = {
			zh = 5.566,
			ja = 5.266
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play120452058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1076ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story == nil then
				arg_233_1.var_.characterEffect1076ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.2

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1076ui_story then
					arg_233_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story then
				arg_233_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_236_4 = 0

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_236_5 = arg_233_1.actors_["1184ui_story"]
			local var_236_6 = 0

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 and arg_233_1.var_.characterEffect1184ui_story == nil then
				arg_233_1.var_.characterEffect1184ui_story = var_236_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_7 = 0.2

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_7 then
				local var_236_8 = (arg_233_1.time_ - var_236_6) / var_236_7

				if arg_233_1.var_.characterEffect1184ui_story then
					local var_236_9 = Mathf.Lerp(0, 0.5, var_236_8)

					arg_233_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1184ui_story.fillRatio = var_236_9
				end
			end

			if arg_233_1.time_ >= var_236_6 + var_236_7 and arg_233_1.time_ < var_236_6 + var_236_7 + arg_236_0 and arg_233_1.var_.characterEffect1184ui_story then
				local var_236_10 = 0.5

				arg_233_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1184ui_story.fillRatio = var_236_10
			end

			local var_236_11 = 0
			local var_236_12 = 0.375

			if var_236_11 < arg_233_1.time_ and arg_233_1.time_ <= var_236_11 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_13 = arg_233_1:FormatText(StoryNameCfg[389].name)

				arg_233_1.leftNameTxt_.text = var_236_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_14 = arg_233_1:GetWordFromCfg(120452057)
				local var_236_15 = arg_233_1:FormatText(var_236_14.content)

				arg_233_1.text_.text = var_236_15

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_16 = 15
				local var_236_17 = utf8.len(var_236_15)
				local var_236_18 = var_236_16 <= 0 and var_236_12 or var_236_12 * (var_236_17 / var_236_16)

				if var_236_18 > 0 and var_236_12 < var_236_18 then
					arg_233_1.talkMaxDuration = var_236_18

					if var_236_18 + var_236_11 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_18 + var_236_11
					end
				end

				arg_233_1.text_.text = var_236_15
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452057", "story_v_out_120452.awb") ~= 0 then
					local var_236_19 = manager.audio:GetVoiceLength("story_v_out_120452", "120452057", "story_v_out_120452.awb") / 1000

					if var_236_19 + var_236_11 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_19 + var_236_11
					end

					if var_236_14.prefab_name ~= "" and arg_233_1.actors_[var_236_14.prefab_name] ~= nil then
						local var_236_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_14.prefab_name].transform, "story_v_out_120452", "120452057", "story_v_out_120452.awb")

						arg_233_1:RecordAudio("120452057", var_236_20)
						arg_233_1:RecordAudio("120452057", var_236_20)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_120452", "120452057", "story_v_out_120452.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_120452", "120452057", "story_v_out_120452.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_21 = math.max(var_236_12, arg_233_1.talkMaxDuration)

			if var_236_11 <= arg_233_1.time_ and arg_233_1.time_ < var_236_11 + var_236_21 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_11) / var_236_21

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_11 + var_236_21 and arg_233_1.time_ < var_236_11 + var_236_21 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play120452058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 120452058
		arg_237_1.duration_ = 5.3

		local var_237_0 = {
			zh = 4.6,
			ja = 5.3
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play120452059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.325

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[389].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(120452058)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 13
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452058", "story_v_out_120452.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452058", "story_v_out_120452.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_120452", "120452058", "story_v_out_120452.awb")

						arg_237_1:RecordAudio("120452058", var_240_9)
						arg_237_1:RecordAudio("120452058", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_120452", "120452058", "story_v_out_120452.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_120452", "120452058", "story_v_out_120452.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play120452059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 120452059
		arg_241_1.duration_ = 8.999999999999

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play120452060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_1 = 2

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_1 then
				local var_244_2 = (arg_241_1.time_ - var_244_0) / var_244_1
				local var_244_3 = Color.New(0, 0, 0)

				var_244_3.a = Mathf.Lerp(0, 1, var_244_2)
				arg_241_1.mask_.color = var_244_3
			end

			if arg_241_1.time_ >= var_244_0 + var_244_1 and arg_241_1.time_ < var_244_0 + var_244_1 + arg_244_0 then
				local var_244_4 = Color.New(0, 0, 0)

				var_244_4.a = 1
				arg_241_1.mask_.color = var_244_4
			end

			local var_244_5 = 2

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_6 = 2

			if var_244_5 <= arg_241_1.time_ and arg_241_1.time_ < var_244_5 + var_244_6 then
				local var_244_7 = (arg_241_1.time_ - var_244_5) / var_244_6
				local var_244_8 = Color.New(0, 0, 0)

				var_244_8.a = Mathf.Lerp(1, 0, var_244_7)
				arg_241_1.mask_.color = var_244_8
			end

			if arg_241_1.time_ >= var_244_5 + var_244_6 and arg_241_1.time_ < var_244_5 + var_244_6 + arg_244_0 then
				local var_244_9 = Color.New(0, 0, 0)
				local var_244_10 = 0

				arg_241_1.mask_.enabled = false
				var_244_9.a = var_244_10
				arg_241_1.mask_.color = var_244_9
			end

			local var_244_11 = 2

			if var_244_11 < arg_241_1.time_ and arg_241_1.time_ <= var_244_11 + arg_244_0 then
				local var_244_12 = manager.ui.mainCamera.transform.localPosition
				local var_244_13 = Vector3.New(0, 0, 10) + Vector3.New(var_244_12.x, var_244_12.y, 0)
				local var_244_14 = arg_241_1.bgs_.ST29a

				var_244_14.transform.localPosition = var_244_13
				var_244_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_244_15 = var_244_14:GetComponent("SpriteRenderer")

				if var_244_15 and var_244_15.sprite then
					local var_244_16 = (var_244_14.transform.localPosition - var_244_12).z
					local var_244_17 = manager.ui.mainCameraCom_
					local var_244_18 = 2 * var_244_16 * Mathf.Tan(var_244_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_244_19 = var_244_18 * var_244_17.aspect
					local var_244_20 = var_244_15.sprite.bounds.size.x
					local var_244_21 = var_244_15.sprite.bounds.size.y
					local var_244_22 = var_244_19 / var_244_20
					local var_244_23 = var_244_18 / var_244_21
					local var_244_24 = var_244_23 < var_244_22 and var_244_22 or var_244_23

					var_244_14.transform.localScale = Vector3.New(var_244_24, var_244_24, 0)
				end

				for iter_244_0, iter_244_1 in pairs(arg_241_1.bgs_) do
					if iter_244_0 ~= "ST29a" then
						iter_244_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_244_25 = arg_241_1.actors_["1076ui_story"].transform
			local var_244_26 = 1.966

			if var_244_26 < arg_241_1.time_ and arg_241_1.time_ <= var_244_26 + arg_244_0 then
				arg_241_1.var_.moveOldPos1076ui_story = var_244_25.localPosition
			end

			local var_244_27 = 0.001

			if var_244_26 <= arg_241_1.time_ and arg_241_1.time_ < var_244_26 + var_244_27 then
				local var_244_28 = (arg_241_1.time_ - var_244_26) / var_244_27
				local var_244_29 = Vector3.New(0, 100, 0)

				var_244_25.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1076ui_story, var_244_29, var_244_28)

				local var_244_30 = manager.ui.mainCamera.transform.position - var_244_25.position

				var_244_25.forward = Vector3.New(var_244_30.x, var_244_30.y, var_244_30.z)

				local var_244_31 = var_244_25.localEulerAngles

				var_244_31.z = 0
				var_244_31.x = 0
				var_244_25.localEulerAngles = var_244_31
			end

			if arg_241_1.time_ >= var_244_26 + var_244_27 and arg_241_1.time_ < var_244_26 + var_244_27 + arg_244_0 then
				var_244_25.localPosition = Vector3.New(0, 100, 0)

				local var_244_32 = manager.ui.mainCamera.transform.position - var_244_25.position

				var_244_25.forward = Vector3.New(var_244_32.x, var_244_32.y, var_244_32.z)

				local var_244_33 = var_244_25.localEulerAngles

				var_244_33.z = 0
				var_244_33.x = 0
				var_244_25.localEulerAngles = var_244_33
			end

			local var_244_34 = arg_241_1.actors_["1184ui_story"].transform
			local var_244_35 = 1.966

			if var_244_35 < arg_241_1.time_ and arg_241_1.time_ <= var_244_35 + arg_244_0 then
				arg_241_1.var_.moveOldPos1184ui_story = var_244_34.localPosition
			end

			local var_244_36 = 0.001

			if var_244_35 <= arg_241_1.time_ and arg_241_1.time_ < var_244_35 + var_244_36 then
				local var_244_37 = (arg_241_1.time_ - var_244_35) / var_244_36
				local var_244_38 = Vector3.New(0, 100, 0)

				var_244_34.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1184ui_story, var_244_38, var_244_37)

				local var_244_39 = manager.ui.mainCamera.transform.position - var_244_34.position

				var_244_34.forward = Vector3.New(var_244_39.x, var_244_39.y, var_244_39.z)

				local var_244_40 = var_244_34.localEulerAngles

				var_244_40.z = 0
				var_244_40.x = 0
				var_244_34.localEulerAngles = var_244_40
			end

			if arg_241_1.time_ >= var_244_35 + var_244_36 and arg_241_1.time_ < var_244_35 + var_244_36 + arg_244_0 then
				var_244_34.localPosition = Vector3.New(0, 100, 0)

				local var_244_41 = manager.ui.mainCamera.transform.position - var_244_34.position

				var_244_34.forward = Vector3.New(var_244_41.x, var_244_41.y, var_244_41.z)

				local var_244_42 = var_244_34.localEulerAngles

				var_244_42.z = 0
				var_244_42.x = 0
				var_244_34.localEulerAngles = var_244_42
			end

			if arg_241_1.frameCnt_ <= 1 then
				arg_241_1.dialog_:SetActive(false)
			end

			local var_244_43 = 3.999999999999
			local var_244_44 = 0.875

			if var_244_43 < arg_241_1.time_ and arg_241_1.time_ <= var_244_43 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0

				arg_241_1.dialog_:SetActive(true)

				local var_244_45 = LeanTween.value(arg_241_1.dialog_, 0, 1, 0.3)

				var_244_45:setOnUpdate(LuaHelper.FloatAction(function(arg_245_0)
					arg_241_1.dialogCg_.alpha = arg_245_0
				end))
				var_244_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_241_1.dialog_)
					var_244_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_241_1.duration_ = arg_241_1.duration_ + 0.3

				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_46 = arg_241_1:GetWordFromCfg(120452059)
				local var_244_47 = arg_241_1:FormatText(var_244_46.content)

				arg_241_1.text_.text = var_244_47

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_48 = 35
				local var_244_49 = utf8.len(var_244_47)
				local var_244_50 = var_244_48 <= 0 and var_244_44 or var_244_44 * (var_244_49 / var_244_48)

				if var_244_50 > 0 and var_244_44 < var_244_50 then
					arg_241_1.talkMaxDuration = var_244_50
					var_244_43 = var_244_43 + 0.3

					if var_244_50 + var_244_43 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_50 + var_244_43
					end
				end

				arg_241_1.text_.text = var_244_47
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_51 = var_244_43 + 0.3
			local var_244_52 = math.max(var_244_44, arg_241_1.talkMaxDuration)

			if var_244_51 <= arg_241_1.time_ and arg_241_1.time_ < var_244_51 + var_244_52 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_51) / var_244_52

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_51 + var_244_52 and arg_241_1.time_ < var_244_51 + var_244_52 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play120452060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120452060
		arg_247_1.duration_ = 6.5

		local var_247_0 = {
			zh = 3.333,
			ja = 6.5
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play120452061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1076ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1076ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1076ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = 0

			if var_250_9 < arg_247_1.time_ and arg_247_1.time_ <= var_250_9 + arg_250_0 then
				arg_247_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_250_11 = arg_247_1.actors_["1076ui_story"]
			local var_250_12 = 0

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 and arg_247_1.var_.characterEffect1076ui_story == nil then
				arg_247_1.var_.characterEffect1076ui_story = var_250_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_13 = 0.2

			if var_250_12 <= arg_247_1.time_ and arg_247_1.time_ < var_250_12 + var_250_13 then
				local var_250_14 = (arg_247_1.time_ - var_250_12) / var_250_13

				if arg_247_1.var_.characterEffect1076ui_story then
					arg_247_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_12 + var_250_13 and arg_247_1.time_ < var_250_12 + var_250_13 + arg_250_0 and arg_247_1.var_.characterEffect1076ui_story then
				arg_247_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_250_15 = 0
			local var_250_16 = 0.325

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_17 = arg_247_1:FormatText(StoryNameCfg[389].name)

				arg_247_1.leftNameTxt_.text = var_250_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_18 = arg_247_1:GetWordFromCfg(120452060)
				local var_250_19 = arg_247_1:FormatText(var_250_18.content)

				arg_247_1.text_.text = var_250_19

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_20 = 13
				local var_250_21 = utf8.len(var_250_19)
				local var_250_22 = var_250_20 <= 0 and var_250_16 or var_250_16 * (var_250_21 / var_250_20)

				if var_250_22 > 0 and var_250_16 < var_250_22 then
					arg_247_1.talkMaxDuration = var_250_22

					if var_250_22 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_22 + var_250_15
					end
				end

				arg_247_1.text_.text = var_250_19
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452060", "story_v_out_120452.awb") ~= 0 then
					local var_250_23 = manager.audio:GetVoiceLength("story_v_out_120452", "120452060", "story_v_out_120452.awb") / 1000

					if var_250_23 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_23 + var_250_15
					end

					if var_250_18.prefab_name ~= "" and arg_247_1.actors_[var_250_18.prefab_name] ~= nil then
						local var_250_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_18.prefab_name].transform, "story_v_out_120452", "120452060", "story_v_out_120452.awb")

						arg_247_1:RecordAudio("120452060", var_250_24)
						arg_247_1:RecordAudio("120452060", var_250_24)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120452", "120452060", "story_v_out_120452.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120452", "120452060", "story_v_out_120452.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_25 = math.max(var_250_16, arg_247_1.talkMaxDuration)

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_25 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_15) / var_250_25

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_15 + var_250_25 and arg_247_1.time_ < var_250_15 + var_250_25 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play120452061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120452061
		arg_251_1.duration_ = 4.366

		local var_251_0 = {
			zh = 2.966,
			ja = 4.366
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play120452062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1184ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1184ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0.7, -0.97, -6)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1184ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = 0

			if var_254_9 < arg_251_1.time_ and arg_251_1.time_ <= var_254_9 + arg_254_0 then
				arg_251_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_254_10 = arg_251_1.actors_["1184ui_story"]
			local var_254_11 = 0

			if var_254_11 < arg_251_1.time_ and arg_251_1.time_ <= var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1184ui_story == nil then
				arg_251_1.var_.characterEffect1184ui_story = var_254_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_12 = 0.2

			if var_254_11 <= arg_251_1.time_ and arg_251_1.time_ < var_254_11 + var_254_12 then
				local var_254_13 = (arg_251_1.time_ - var_254_11) / var_254_12

				if arg_251_1.var_.characterEffect1184ui_story then
					arg_251_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_11 + var_254_12 and arg_251_1.time_ < var_254_11 + var_254_12 + arg_254_0 and arg_251_1.var_.characterEffect1184ui_story then
				arg_251_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_254_14 = arg_251_1.actors_["1076ui_story"]
			local var_254_15 = 0

			if var_254_15 < arg_251_1.time_ and arg_251_1.time_ <= var_254_15 + arg_254_0 and arg_251_1.var_.characterEffect1076ui_story == nil then
				arg_251_1.var_.characterEffect1076ui_story = var_254_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_16 = 0.2

			if var_254_15 <= arg_251_1.time_ and arg_251_1.time_ < var_254_15 + var_254_16 then
				local var_254_17 = (arg_251_1.time_ - var_254_15) / var_254_16

				if arg_251_1.var_.characterEffect1076ui_story then
					local var_254_18 = Mathf.Lerp(0, 0.5, var_254_17)

					arg_251_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1076ui_story.fillRatio = var_254_18
				end
			end

			if arg_251_1.time_ >= var_254_15 + var_254_16 and arg_251_1.time_ < var_254_15 + var_254_16 + arg_254_0 and arg_251_1.var_.characterEffect1076ui_story then
				local var_254_19 = 0.5

				arg_251_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1076ui_story.fillRatio = var_254_19
			end

			local var_254_20 = 0
			local var_254_21 = 0.325

			if var_254_20 < arg_251_1.time_ and arg_251_1.time_ <= var_254_20 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_22 = arg_251_1:FormatText(StoryNameCfg[6].name)

				arg_251_1.leftNameTxt_.text = var_254_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_23 = arg_251_1:GetWordFromCfg(120452061)
				local var_254_24 = arg_251_1:FormatText(var_254_23.content)

				arg_251_1.text_.text = var_254_24

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_25 = 13
				local var_254_26 = utf8.len(var_254_24)
				local var_254_27 = var_254_25 <= 0 and var_254_21 or var_254_21 * (var_254_26 / var_254_25)

				if var_254_27 > 0 and var_254_21 < var_254_27 then
					arg_251_1.talkMaxDuration = var_254_27

					if var_254_27 + var_254_20 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_27 + var_254_20
					end
				end

				arg_251_1.text_.text = var_254_24
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452061", "story_v_out_120452.awb") ~= 0 then
					local var_254_28 = manager.audio:GetVoiceLength("story_v_out_120452", "120452061", "story_v_out_120452.awb") / 1000

					if var_254_28 + var_254_20 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_28 + var_254_20
					end

					if var_254_23.prefab_name ~= "" and arg_251_1.actors_[var_254_23.prefab_name] ~= nil then
						local var_254_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_23.prefab_name].transform, "story_v_out_120452", "120452061", "story_v_out_120452.awb")

						arg_251_1:RecordAudio("120452061", var_254_29)
						arg_251_1:RecordAudio("120452061", var_254_29)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_120452", "120452061", "story_v_out_120452.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_120452", "120452061", "story_v_out_120452.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_30 = math.max(var_254_21, arg_251_1.talkMaxDuration)

			if var_254_20 <= arg_251_1.time_ and arg_251_1.time_ < var_254_20 + var_254_30 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_20) / var_254_30

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_20 + var_254_30 and arg_251_1.time_ < var_254_20 + var_254_30 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120452062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120452062
		arg_255_1.duration_ = 6.8

		local var_255_0 = {
			zh = 5.8,
			ja = 6.8
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play120452063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1076ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1076ui_story == nil then
				arg_255_1.var_.characterEffect1076ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1076ui_story then
					arg_255_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1076ui_story then
				arg_255_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_258_4 = arg_255_1.actors_["1184ui_story"]
			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 and arg_255_1.var_.characterEffect1184ui_story == nil then
				arg_255_1.var_.characterEffect1184ui_story = var_258_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_6 = 0.2

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_6 then
				local var_258_7 = (arg_255_1.time_ - var_258_5) / var_258_6

				if arg_255_1.var_.characterEffect1184ui_story then
					local var_258_8 = Mathf.Lerp(0, 0.5, var_258_7)

					arg_255_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1184ui_story.fillRatio = var_258_8
				end
			end

			if arg_255_1.time_ >= var_258_5 + var_258_6 and arg_255_1.time_ < var_258_5 + var_258_6 + arg_258_0 and arg_255_1.var_.characterEffect1184ui_story then
				local var_258_9 = 0.5

				arg_255_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1184ui_story.fillRatio = var_258_9
			end

			local var_258_10 = 0
			local var_258_11 = 0.5

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_12 = arg_255_1:FormatText(StoryNameCfg[389].name)

				arg_255_1.leftNameTxt_.text = var_258_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_13 = arg_255_1:GetWordFromCfg(120452062)
				local var_258_14 = arg_255_1:FormatText(var_258_13.content)

				arg_255_1.text_.text = var_258_14

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_15 = 20
				local var_258_16 = utf8.len(var_258_14)
				local var_258_17 = var_258_15 <= 0 and var_258_11 or var_258_11 * (var_258_16 / var_258_15)

				if var_258_17 > 0 and var_258_11 < var_258_17 then
					arg_255_1.talkMaxDuration = var_258_17

					if var_258_17 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_17 + var_258_10
					end
				end

				arg_255_1.text_.text = var_258_14
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452062", "story_v_out_120452.awb") ~= 0 then
					local var_258_18 = manager.audio:GetVoiceLength("story_v_out_120452", "120452062", "story_v_out_120452.awb") / 1000

					if var_258_18 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_18 + var_258_10
					end

					if var_258_13.prefab_name ~= "" and arg_255_1.actors_[var_258_13.prefab_name] ~= nil then
						local var_258_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_13.prefab_name].transform, "story_v_out_120452", "120452062", "story_v_out_120452.awb")

						arg_255_1:RecordAudio("120452062", var_258_19)
						arg_255_1:RecordAudio("120452062", var_258_19)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120452", "120452062", "story_v_out_120452.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120452", "120452062", "story_v_out_120452.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_20 = math.max(var_258_11, arg_255_1.talkMaxDuration)

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_20 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_10) / var_258_20

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_10 + var_258_20 and arg_255_1.time_ < var_258_10 + var_258_20 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120452063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120452063
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play120452064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1184ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1184ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, 100, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1184ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, 100, 0)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["1076ui_story"].transform
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1.var_.moveOldPos1076ui_story = var_262_9.localPosition
			end

			local var_262_11 = 0.001

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11
				local var_262_13 = Vector3.New(0, 100, 0)

				var_262_9.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1076ui_story, var_262_13, var_262_12)

				local var_262_14 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_14.x, var_262_14.y, var_262_14.z)

				local var_262_15 = var_262_9.localEulerAngles

				var_262_15.z = 0
				var_262_15.x = 0
				var_262_9.localEulerAngles = var_262_15
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 then
				var_262_9.localPosition = Vector3.New(0, 100, 0)

				local var_262_16 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_16.x, var_262_16.y, var_262_16.z)

				local var_262_17 = var_262_9.localEulerAngles

				var_262_17.z = 0
				var_262_17.x = 0
				var_262_9.localEulerAngles = var_262_17
			end

			local var_262_18 = 0
			local var_262_19 = 0.35

			if var_262_18 < arg_259_1.time_ and arg_259_1.time_ <= var_262_18 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_20 = arg_259_1:GetWordFromCfg(120452063)
				local var_262_21 = arg_259_1:FormatText(var_262_20.content)

				arg_259_1.text_.text = var_262_21

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_22 = 14
				local var_262_23 = utf8.len(var_262_21)
				local var_262_24 = var_262_22 <= 0 and var_262_19 or var_262_19 * (var_262_23 / var_262_22)

				if var_262_24 > 0 and var_262_19 < var_262_24 then
					arg_259_1.talkMaxDuration = var_262_24

					if var_262_24 + var_262_18 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_24 + var_262_18
					end
				end

				arg_259_1.text_.text = var_262_21
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_25 = math.max(var_262_19, arg_259_1.talkMaxDuration)

			if var_262_18 <= arg_259_1.time_ and arg_259_1.time_ < var_262_18 + var_262_25 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_18) / var_262_25

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_18 + var_262_25 and arg_259_1.time_ < var_262_18 + var_262_25 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120452064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120452064
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play120452065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1076ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1076ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, 100, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1076ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, 100, 0)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1184ui_story"].transform
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 then
				arg_263_1.var_.moveOldPos1184ui_story = var_266_9.localPosition
			end

			local var_266_11 = 0.001

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11
				local var_266_13 = Vector3.New(0, 100, 0)

				var_266_9.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1184ui_story, var_266_13, var_266_12)

				local var_266_14 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_14.x, var_266_14.y, var_266_14.z)

				local var_266_15 = var_266_9.localEulerAngles

				var_266_15.z = 0
				var_266_15.x = 0
				var_266_9.localEulerAngles = var_266_15
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 then
				var_266_9.localPosition = Vector3.New(0, 100, 0)

				local var_266_16 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_16.x, var_266_16.y, var_266_16.z)

				local var_266_17 = var_266_9.localEulerAngles

				var_266_17.z = 0
				var_266_17.x = 0
				var_266_9.localEulerAngles = var_266_17
			end

			local var_266_18 = 0
			local var_266_19 = 0.675

			if var_266_18 < arg_263_1.time_ and arg_263_1.time_ <= var_266_18 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_20 = arg_263_1:GetWordFromCfg(120452064)
				local var_266_21 = arg_263_1:FormatText(var_266_20.content)

				arg_263_1.text_.text = var_266_21

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_22 = 27
				local var_266_23 = utf8.len(var_266_21)
				local var_266_24 = var_266_22 <= 0 and var_266_19 or var_266_19 * (var_266_23 / var_266_22)

				if var_266_24 > 0 and var_266_19 < var_266_24 then
					arg_263_1.talkMaxDuration = var_266_24

					if var_266_24 + var_266_18 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_24 + var_266_18
					end
				end

				arg_263_1.text_.text = var_266_21
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_25 = math.max(var_266_19, arg_263_1.talkMaxDuration)

			if var_266_18 <= arg_263_1.time_ and arg_263_1.time_ < var_266_18 + var_266_25 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_18) / var_266_25

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_18 + var_266_25 and arg_263_1.time_ < var_266_18 + var_266_25 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120452065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120452065
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play120452066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.4

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(120452065)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 16
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_8 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_8 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_8

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_8 and arg_267_1.time_ < var_270_0 + var_270_8 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120452066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120452066
		arg_271_1.duration_ = 2.766

		local var_271_0 = {
			zh = 2.766,
			ja = 2.666
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play120452067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1184ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1184ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0, -0.97, -6)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1184ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = 0

			if var_274_9 < arg_271_1.time_ and arg_271_1.time_ <= var_274_9 + arg_274_0 then
				arg_271_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_274_11 = arg_271_1.actors_["1184ui_story"]
			local var_274_12 = 0

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 and arg_271_1.var_.characterEffect1184ui_story == nil then
				arg_271_1.var_.characterEffect1184ui_story = var_274_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_13 = 0.2

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_13 then
				local var_274_14 = (arg_271_1.time_ - var_274_12) / var_274_13

				if arg_271_1.var_.characterEffect1184ui_story then
					arg_271_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_12 + var_274_13 and arg_271_1.time_ < var_274_12 + var_274_13 + arg_274_0 and arg_271_1.var_.characterEffect1184ui_story then
				arg_271_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_274_15 = 0
			local var_274_16 = 0.175

			if var_274_15 < arg_271_1.time_ and arg_271_1.time_ <= var_274_15 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_17 = arg_271_1:FormatText(StoryNameCfg[6].name)

				arg_271_1.leftNameTxt_.text = var_274_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_18 = arg_271_1:GetWordFromCfg(120452066)
				local var_274_19 = arg_271_1:FormatText(var_274_18.content)

				arg_271_1.text_.text = var_274_19

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_20 = 7
				local var_274_21 = utf8.len(var_274_19)
				local var_274_22 = var_274_20 <= 0 and var_274_16 or var_274_16 * (var_274_21 / var_274_20)

				if var_274_22 > 0 and var_274_16 < var_274_22 then
					arg_271_1.talkMaxDuration = var_274_22

					if var_274_22 + var_274_15 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_22 + var_274_15
					end
				end

				arg_271_1.text_.text = var_274_19
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452066", "story_v_out_120452.awb") ~= 0 then
					local var_274_23 = manager.audio:GetVoiceLength("story_v_out_120452", "120452066", "story_v_out_120452.awb") / 1000

					if var_274_23 + var_274_15 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_23 + var_274_15
					end

					if var_274_18.prefab_name ~= "" and arg_271_1.actors_[var_274_18.prefab_name] ~= nil then
						local var_274_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_18.prefab_name].transform, "story_v_out_120452", "120452066", "story_v_out_120452.awb")

						arg_271_1:RecordAudio("120452066", var_274_24)
						arg_271_1:RecordAudio("120452066", var_274_24)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_120452", "120452066", "story_v_out_120452.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_120452", "120452066", "story_v_out_120452.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_25 = math.max(var_274_16, arg_271_1.talkMaxDuration)

			if var_274_15 <= arg_271_1.time_ and arg_271_1.time_ < var_274_15 + var_274_25 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_15) / var_274_25

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_15 + var_274_25 and arg_271_1.time_ < var_274_15 + var_274_25 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120452067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120452067
		arg_275_1.duration_ = 6

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play120452068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1184ui_story"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1184ui_story = var_278_0.localPosition
			end

			local var_278_2 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2
				local var_278_4 = Vector3.New(0, 100, 0)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1184ui_story, var_278_4, var_278_3)

				local var_278_5 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_5.x, var_278_5.y, var_278_5.z)

				local var_278_6 = var_278_0.localEulerAngles

				var_278_6.z = 0
				var_278_6.x = 0
				var_278_0.localEulerAngles = var_278_6
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, 100, 0)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_0.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_0.localEulerAngles = var_278_8
			end

			local var_278_9 = 0
			local var_278_10 = 1

			if var_278_9 < arg_275_1.time_ and arg_275_1.time_ <= var_278_9 + arg_278_0 then
				local var_278_11 = "play"
				local var_278_12 = "effect"

				arg_275_1:AudioAction(var_278_11, var_278_12, "se_story_120_04", "se_story_120_04_queak_loop", "")
			end

			local var_278_13 = 0.1
			local var_278_14 = 0.9

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				local var_278_15 = "play"
				local var_278_16 = "effect"

				arg_275_1:AudioAction(var_278_15, var_278_16, "se_story_17", "se_story_17_messenger03", "")
			end

			local var_278_17 = manager.ui.mainCamera.transform
			local var_278_18 = 0

			if var_278_18 < arg_275_1.time_ and arg_275_1.time_ <= var_278_18 + arg_278_0 then
				arg_275_1.var_.shakeOldPos = var_278_17.localPosition
			end

			local var_278_19 = 1

			if var_278_18 <= arg_275_1.time_ and arg_275_1.time_ < var_278_18 + var_278_19 then
				local var_278_20 = (arg_275_1.time_ - var_278_18) / 0.066
				local var_278_21, var_278_22 = math.modf(var_278_20)

				var_278_17.localPosition = Vector3.New(var_278_22 * 0.13, var_278_22 * 0.13, var_278_22 * 0.13) + arg_275_1.var_.shakeOldPos
			end

			if arg_275_1.time_ >= var_278_18 + var_278_19 and arg_275_1.time_ < var_278_18 + var_278_19 + arg_278_0 then
				var_278_17.localPosition = arg_275_1.var_.shakeOldPos
			end

			local var_278_23 = 0

			if var_278_23 < arg_275_1.time_ and arg_275_1.time_ <= var_278_23 + arg_278_0 then
				arg_275_1.allBtn_.enabled = false
			end

			local var_278_24 = 1

			if arg_275_1.time_ >= var_278_23 + var_278_24 and arg_275_1.time_ < var_278_23 + var_278_24 + arg_278_0 then
				arg_275_1.allBtn_.enabled = true
			end

			local var_278_25 = 0
			local var_278_26 = 0.1

			if var_278_25 < arg_275_1.time_ and arg_275_1.time_ <= var_278_25 + arg_278_0 then
				local var_278_27 = "play"
				local var_278_28 = "music"

				arg_275_1:AudioAction(var_278_27, var_278_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_278_29 = 0.0666666666666667
			local var_278_30 = 1

			if var_278_29 < arg_275_1.time_ and arg_275_1.time_ <= var_278_29 + arg_278_0 then
				local var_278_31 = "play"
				local var_278_32 = "music"

				arg_275_1:AudioAction(var_278_31, var_278_32, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_275_1.frameCnt_ <= 1 then
				arg_275_1.dialog_:SetActive(false)
			end

			local var_278_33 = 1
			local var_278_34 = 0.975

			if var_278_33 < arg_275_1.time_ and arg_275_1.time_ <= var_278_33 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0

				arg_275_1.dialog_:SetActive(true)

				local var_278_35 = LeanTween.value(arg_275_1.dialog_, 0, 1, 0.3)

				var_278_35:setOnUpdate(LuaHelper.FloatAction(function(arg_279_0)
					arg_275_1.dialogCg_.alpha = arg_279_0
				end))
				var_278_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_275_1.dialog_)
					var_278_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_275_1.duration_ = arg_275_1.duration_ + 0.3

				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_36 = arg_275_1:GetWordFromCfg(120452067)
				local var_278_37 = arg_275_1:FormatText(var_278_36.content)

				arg_275_1.text_.text = var_278_37

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_38 = 39
				local var_278_39 = utf8.len(var_278_37)
				local var_278_40 = var_278_38 <= 0 and var_278_34 or var_278_34 * (var_278_39 / var_278_38)

				if var_278_40 > 0 and var_278_34 < var_278_40 then
					arg_275_1.talkMaxDuration = var_278_40
					var_278_33 = var_278_33 + 0.3

					if var_278_40 + var_278_33 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_40 + var_278_33
					end
				end

				arg_275_1.text_.text = var_278_37
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_41 = var_278_33 + 0.3
			local var_278_42 = math.max(var_278_34, arg_275_1.talkMaxDuration)

			if var_278_41 <= arg_275_1.time_ and arg_275_1.time_ < var_278_41 + var_278_42 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_41) / var_278_42

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_41 + var_278_42 and arg_275_1.time_ < var_278_41 + var_278_42 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play120452068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 120452068
		arg_281_1.duration_ = 7.7

		local var_281_0 = {
			zh = 5.333,
			ja = 7.7
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play120452069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.6

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[10].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(120452068)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 23
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452068", "story_v_out_120452.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452068", "story_v_out_120452.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_120452", "120452068", "story_v_out_120452.awb")

						arg_281_1:RecordAudio("120452068", var_284_9)
						arg_281_1:RecordAudio("120452068", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_120452", "120452068", "story_v_out_120452.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_120452", "120452068", "story_v_out_120452.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play120452069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 120452069
		arg_285_1.duration_ = 6.9

		local var_285_0 = {
			zh = 4.966,
			ja = 6.9
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play120452070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.475

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[10].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(120452069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 19
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452069", "story_v_out_120452.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_120452", "120452069", "story_v_out_120452.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_120452", "120452069", "story_v_out_120452.awb")

						arg_285_1:RecordAudio("120452069", var_288_9)
						arg_285_1:RecordAudio("120452069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_120452", "120452069", "story_v_out_120452.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_120452", "120452069", "story_v_out_120452.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play120452070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 120452070
		arg_289_1.duration_ = 9.2

		local var_289_0 = {
			zh = 5.433,
			ja = 9.2
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play120452071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0.4
			local var_292_1 = 0.45

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				local var_292_2 = "stop"
				local var_292_3 = "effect"

				arg_289_1:AudioAction(var_292_2, var_292_3, "se_story_120_04", "se_story_120_04_queak_loop", "")
			end

			local var_292_4 = 0
			local var_292_5 = 0.55

			if var_292_4 < arg_289_1.time_ and arg_289_1.time_ <= var_292_4 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_6 = arg_289_1:FormatText(StoryNameCfg[10].name)

				arg_289_1.leftNameTxt_.text = var_292_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_7 = arg_289_1:GetWordFromCfg(120452070)
				local var_292_8 = arg_289_1:FormatText(var_292_7.content)

				arg_289_1.text_.text = var_292_8

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_9 = 22
				local var_292_10 = utf8.len(var_292_8)
				local var_292_11 = var_292_9 <= 0 and var_292_5 or var_292_5 * (var_292_10 / var_292_9)

				if var_292_11 > 0 and var_292_5 < var_292_11 then
					arg_289_1.talkMaxDuration = var_292_11

					if var_292_11 + var_292_4 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_11 + var_292_4
					end
				end

				arg_289_1.text_.text = var_292_8
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120452", "120452070", "story_v_out_120452.awb") ~= 0 then
					local var_292_12 = manager.audio:GetVoiceLength("story_v_out_120452", "120452070", "story_v_out_120452.awb") / 1000

					if var_292_12 + var_292_4 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_12 + var_292_4
					end

					if var_292_7.prefab_name ~= "" and arg_289_1.actors_[var_292_7.prefab_name] ~= nil then
						local var_292_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_7.prefab_name].transform, "story_v_out_120452", "120452070", "story_v_out_120452.awb")

						arg_289_1:RecordAudio("120452070", var_292_13)
						arg_289_1:RecordAudio("120452070", var_292_13)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_120452", "120452070", "story_v_out_120452.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_120452", "120452070", "story_v_out_120452.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_14 = math.max(var_292_5, arg_289_1.talkMaxDuration)

			if var_292_4 <= arg_289_1.time_ and arg_289_1.time_ < var_292_4 + var_292_14 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_4) / var_292_14

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_4 + var_292_14 and arg_289_1.time_ < var_292_4 + var_292_14 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play120452071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 120452071
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play120452072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.225

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[7].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(120452071)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 9
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_8 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_8 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_8

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_8 and arg_293_1.time_ < var_296_0 + var_296_8 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play120452072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 120452072
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
			arg_297_1.auto_ = false
		end

		function arg_297_1.playNext_(arg_299_0)
			arg_297_1.onStoryFinished_()
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.5

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_2 = arg_297_1:GetWordFromCfg(120452072)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 20
				local var_300_5 = utf8.len(var_300_3)
				local var_300_6 = var_300_4 <= 0 and var_300_1 or var_300_1 * (var_300_5 / var_300_4)

				if var_300_6 > 0 and var_300_1 < var_300_6 then
					arg_297_1.talkMaxDuration = var_300_6

					if var_300_6 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_6 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_3
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_7 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_7 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_7

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_7 and arg_297_1.time_ < var_300_0 + var_300_7 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J05h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0207"
	},
	voices = {
		"story_v_out_120452.awb"
	}
}
