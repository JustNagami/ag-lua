﻿return {
	Play319741001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319741001
		arg_1_1.duration_ = 7.899999999999

		local var_1_0 = {
			zh = 5.932999999999,
			ja = 7.899999999999
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
				arg_1_0:Play319741002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11m"

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
				local var_4_5 = arg_1_1.bgs_.I11m

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
					if iter_4_0 ~= "I11m" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = 0
			local var_4_25 = 0.2

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_28 = 0.233333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure", "bgm_activity_3_0_story_daily_leisure.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 1.999999999999
			local var_4_33 = 0.675

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_35 = arg_1_1:FormatText(StoryNameCfg[648].name)

				arg_1_1.leftNameTxt_.text = var_4_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_36 = arg_1_1:GetWordFromCfg(319741001)
				local var_4_37 = arg_1_1:FormatText(var_4_36.content)

				arg_1_1.text_.text = var_4_37

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_38 = 27
				local var_4_39 = utf8.len(var_4_37)
				local var_4_40 = var_4_38 <= 0 and var_4_33 or var_4_33 * (var_4_39 / var_4_38)

				if var_4_40 > 0 and var_4_33 < var_4_40 then
					arg_1_1.talkMaxDuration = var_4_40
					var_4_32 = var_4_32 + 0.3

					if var_4_40 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_40 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_37
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741001", "story_v_out_319741.awb") ~= 0 then
					local var_4_41 = manager.audio:GetVoiceLength("story_v_out_319741", "319741001", "story_v_out_319741.awb") / 1000

					if var_4_41 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_32
					end

					if var_4_36.prefab_name ~= "" and arg_1_1.actors_[var_4_36.prefab_name] ~= nil then
						local var_4_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_36.prefab_name].transform, "story_v_out_319741", "319741001", "story_v_out_319741.awb")

						arg_1_1:RecordAudio("319741001", var_4_42)
						arg_1_1:RecordAudio("319741001", var_4_42)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319741", "319741001", "story_v_out_319741.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319741", "319741001", "story_v_out_319741.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = var_4_32 + 0.3
			local var_4_44 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_43) / var_4_44

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319741002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319741002
		arg_7_1.duration_ = 3.266

		local var_7_0 = {
			zh = 1.999999999999,
			ja = 3.266
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319741003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10079ui_story"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("Char/" .. var_10_0), arg_7_1.stage_.transform)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_0] = var_10_1

				local var_10_2 = var_10_1:GetComponentInChildren(typeof(CharacterEffect))

				var_10_2.enabled = true

				local var_10_3 = GameObjectTools.GetOrAddComponent(var_10_1, typeof(DynamicBoneHelper))

				if var_10_3 then
					var_10_3:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_2.transform, false)

				arg_7_1.var_[var_10_0 .. "Animator"] = var_10_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_0 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_0 .. "LipSync"] = var_10_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_4 = arg_7_1.actors_["10079ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10079ui_story = var_10_4.localPosition

				local var_10_6 = "10079ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_6 .. "Animator"].transform, false)
			end

			local var_10_7 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_7 then
				local var_10_8 = (arg_7_1.time_ - var_10_5) / var_10_7
				local var_10_9 = Vector3.New(0, -0.95, -6.05)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10079ui_story, var_10_9, var_10_8)

				local var_10_10 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_10.x, var_10_10.y, var_10_10.z)

				local var_10_11 = var_10_4.localEulerAngles

				var_10_11.z = 0
				var_10_11.x = 0
				var_10_4.localEulerAngles = var_10_11
			end

			if arg_7_1.time_ >= var_10_5 + var_10_7 and arg_7_1.time_ < var_10_5 + var_10_7 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_10_12 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_12.x, var_10_12.y, var_10_12.z)

				local var_10_13 = var_10_4.localEulerAngles

				var_10_13.z = 0
				var_10_13.x = 0
				var_10_4.localEulerAngles = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["10079ui_story"]
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect10079ui_story == nil then
				arg_7_1.var_.characterEffect10079ui_story = var_10_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_16 = 0.200000002980232

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16

				if arg_7_1.var_.characterEffect10079ui_story then
					arg_7_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect10079ui_story then
				arg_7_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_20 = 0
			local var_10_21 = 0.15

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_22 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_23 = arg_7_1:GetWordFromCfg(319741002)
				local var_10_24 = arg_7_1:FormatText(var_10_23.content)

				arg_7_1.text_.text = var_10_24

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_25 = 6
				local var_10_26 = utf8.len(var_10_24)
				local var_10_27 = var_10_25 <= 0 and var_10_21 or var_10_21 * (var_10_26 / var_10_25)

				if var_10_27 > 0 and var_10_21 < var_10_27 then
					arg_7_1.talkMaxDuration = var_10_27

					if var_10_27 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_20
					end
				end

				arg_7_1.text_.text = var_10_24
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741002", "story_v_out_319741.awb") ~= 0 then
					local var_10_28 = manager.audio:GetVoiceLength("story_v_out_319741", "319741002", "story_v_out_319741.awb") / 1000

					if var_10_28 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_28 + var_10_20
					end

					if var_10_23.prefab_name ~= "" and arg_7_1.actors_[var_10_23.prefab_name] ~= nil then
						local var_10_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_23.prefab_name].transform, "story_v_out_319741", "319741002", "story_v_out_319741.awb")

						arg_7_1:RecordAudio("319741002", var_10_29)
						arg_7_1:RecordAudio("319741002", var_10_29)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319741", "319741002", "story_v_out_319741.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319741", "319741002", "story_v_out_319741.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_30 = math.max(var_10_21, arg_7_1.talkMaxDuration)

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_30 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_20) / var_10_30

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_20 + var_10_30 and arg_7_1.time_ < var_10_20 + var_10_30 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319741003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319741003
		arg_11_1.duration_ = 3.666

		local var_11_0 = {
			zh = 3.666,
			ja = 2.566
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
				arg_11_0:Play319741004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10079ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10079ui_story == nil then
				arg_11_1.var_.characterEffect10079ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10079ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10079ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10079ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10079ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.475

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[648].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(319741003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 19
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741003", "story_v_out_319741.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_319741", "319741003", "story_v_out_319741.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_319741", "319741003", "story_v_out_319741.awb")

						arg_11_1:RecordAudio("319741003", var_14_15)
						arg_11_1:RecordAudio("319741003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319741", "319741003", "story_v_out_319741.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319741", "319741003", "story_v_out_319741.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319741004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319741004
		arg_15_1.duration_ = 6.3

		local var_15_0 = {
			zh = 6.033,
			ja = 6.3
		}
		local var_15_1 = manager.audio:GetLocalizationFlag()

		if var_15_0[var_15_1] ~= nil then
			arg_15_1.duration_ = var_15_0[var_15_1]
		end

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play319741005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.825

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[648].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319741004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 33
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741004", "story_v_out_319741.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741004", "story_v_out_319741.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319741", "319741004", "story_v_out_319741.awb")

						arg_15_1:RecordAudio("319741004", var_18_9)
						arg_15_1:RecordAudio("319741004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319741", "319741004", "story_v_out_319741.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319741", "319741004", "story_v_out_319741.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319741005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319741005
		arg_19_1.duration_ = 4.7

		local var_19_0 = {
			zh = 2.766,
			ja = 4.7
		}
		local var_19_1 = manager.audio:GetLocalizationFlag()

		if var_19_0[var_19_1] ~= nil then
			arg_19_1.duration_ = var_19_0[var_19_1]
		end

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play319741006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10079ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10079ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, -0.95, -6.05)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10079ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["10079ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect10079ui_story == nil then
				arg_19_1.var_.characterEffect10079ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect10079ui_story then
					arg_19_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect10079ui_story then
				arg_19_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_15 = 0
			local var_22_16 = 0.25

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_17 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_18 = arg_19_1:GetWordFromCfg(319741005)
				local var_22_19 = arg_19_1:FormatText(var_22_18.content)

				arg_19_1.text_.text = var_22_19

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_20 = 10
				local var_22_21 = utf8.len(var_22_19)
				local var_22_22 = var_22_20 <= 0 and var_22_16 or var_22_16 * (var_22_21 / var_22_20)

				if var_22_22 > 0 and var_22_16 < var_22_22 then
					arg_19_1.talkMaxDuration = var_22_22

					if var_22_22 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_22 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_19
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741005", "story_v_out_319741.awb") ~= 0 then
					local var_22_23 = manager.audio:GetVoiceLength("story_v_out_319741", "319741005", "story_v_out_319741.awb") / 1000

					if var_22_23 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_15
					end

					if var_22_18.prefab_name ~= "" and arg_19_1.actors_[var_22_18.prefab_name] ~= nil then
						local var_22_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_18.prefab_name].transform, "story_v_out_319741", "319741005", "story_v_out_319741.awb")

						arg_19_1:RecordAudio("319741005", var_22_24)
						arg_19_1:RecordAudio("319741005", var_22_24)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319741", "319741005", "story_v_out_319741.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319741", "319741005", "story_v_out_319741.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_25 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_25 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_25

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_25 and arg_19_1.time_ < var_22_15 + var_22_25 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319741006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319741006
		arg_23_1.duration_ = 5

		local var_23_0 = {
			zh = 4.866,
			ja = 5
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
				arg_23_0:Play319741007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10079ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story == nil then
				arg_23_1.var_.characterEffect10079ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10079ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10079ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10079ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.7

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[648].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(319741006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 28
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741006", "story_v_out_319741.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_319741", "319741006", "story_v_out_319741.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_319741", "319741006", "story_v_out_319741.awb")

						arg_23_1:RecordAudio("319741006", var_26_15)
						arg_23_1:RecordAudio("319741006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319741", "319741006", "story_v_out_319741.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319741", "319741006", "story_v_out_319741.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319741007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319741007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319741008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.925

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(319741007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 37
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319741008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319741008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play319741009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10079ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10079ui_story = var_34_0.localPosition

				local var_34_2 = "10079ui_story"

				arg_31_1:ShowWeapon(arg_31_1.var_[var_34_2 .. "Animator"].transform, false)
			end

			local var_34_3 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_1) / var_34_3
				local var_34_5 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10079ui_story, var_34_5, var_34_4)

				local var_34_6 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_6.x, var_34_6.y, var_34_6.z)

				local var_34_7 = var_34_0.localEulerAngles

				var_34_7.z = 0
				var_34_7.x = 0
				var_34_0.localEulerAngles = var_34_7
			end

			if arg_31_1.time_ >= var_34_1 + var_34_3 and arg_31_1.time_ < var_34_1 + var_34_3 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_8 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_8.x, var_34_8.y, var_34_8.z)

				local var_34_9 = var_34_0.localEulerAngles

				var_34_9.z = 0
				var_34_9.x = 0
				var_34_0.localEulerAngles = var_34_9
			end

			local var_34_10 = 0
			local var_34_11 = 1.075

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_12 = arg_31_1:GetWordFromCfg(319741008)
				local var_34_13 = arg_31_1:FormatText(var_34_12.content)

				arg_31_1.text_.text = var_34_13

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_14 = 43
				local var_34_15 = utf8.len(var_34_13)
				local var_34_16 = var_34_14 <= 0 and var_34_11 or var_34_11 * (var_34_15 / var_34_14)

				if var_34_16 > 0 and var_34_11 < var_34_16 then
					arg_31_1.talkMaxDuration = var_34_16

					if var_34_16 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_16 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_13
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_17 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_17 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_17

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_17 and arg_31_1.time_ < var_34_10 + var_34_17 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319741009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319741009
		arg_35_1.duration_ = 2.366

		local var_35_0 = {
			zh = 1.999999999999,
			ja = 2.366
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
				arg_35_0:Play319741010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "10066ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["10066ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos10066ui_story = var_38_4.localPosition
			end

			local var_38_6 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6
				local var_38_8 = Vector3.New(0, -0.99, -5.83)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10066ui_story, var_38_8, var_38_7)

				local var_38_9 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_9.x, var_38_9.y, var_38_9.z)

				local var_38_10 = var_38_4.localEulerAngles

				var_38_10.z = 0
				var_38_10.x = 0
				var_38_4.localEulerAngles = var_38_10
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_4.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_4.localEulerAngles = var_38_12
			end

			local var_38_13 = arg_35_1.actors_["10066ui_story"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story == nil then
				arg_35_1.var_.characterEffect10066ui_story = var_38_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_15 = 0.200000002980232

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.characterEffect10066ui_story then
					arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story then
				arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_38_17 = 0

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 then
				arg_35_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_38_18 = 0

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_19 = 0
			local var_38_20 = 0.125

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_21 = arg_35_1:FormatText(StoryNameCfg[640].name)

				arg_35_1.leftNameTxt_.text = var_38_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_22 = arg_35_1:GetWordFromCfg(319741009)
				local var_38_23 = arg_35_1:FormatText(var_38_22.content)

				arg_35_1.text_.text = var_38_23

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_24 = 5
				local var_38_25 = utf8.len(var_38_23)
				local var_38_26 = var_38_24 <= 0 and var_38_20 or var_38_20 * (var_38_25 / var_38_24)

				if var_38_26 > 0 and var_38_20 < var_38_26 then
					arg_35_1.talkMaxDuration = var_38_26

					if var_38_26 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_26 + var_38_19
					end
				end

				arg_35_1.text_.text = var_38_23
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741009", "story_v_out_319741.awb") ~= 0 then
					local var_38_27 = manager.audio:GetVoiceLength("story_v_out_319741", "319741009", "story_v_out_319741.awb") / 1000

					if var_38_27 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_19
					end

					if var_38_22.prefab_name ~= "" and arg_35_1.actors_[var_38_22.prefab_name] ~= nil then
						local var_38_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_22.prefab_name].transform, "story_v_out_319741", "319741009", "story_v_out_319741.awb")

						arg_35_1:RecordAudio("319741009", var_38_28)
						arg_35_1:RecordAudio("319741009", var_38_28)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319741", "319741009", "story_v_out_319741.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319741", "319741009", "story_v_out_319741.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_29 = math.max(var_38_20, arg_35_1.talkMaxDuration)

			if var_38_19 <= arg_35_1.time_ and arg_35_1.time_ < var_38_19 + var_38_29 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_19) / var_38_29

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_19 + var_38_29 and arg_35_1.time_ < var_38_19 + var_38_29 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319741010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319741010
		arg_39_1.duration_ = 6.333

		local var_39_0 = {
			zh = 3.3,
			ja = 6.333
		}
		local var_39_1 = manager.audio:GetLocalizationFlag()

		if var_39_0[var_39_1] ~= nil then
			arg_39_1.duration_ = var_39_0[var_39_1]
		end

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play319741011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10079ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story == nil then
				arg_39_1.var_.characterEffect10079ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10079ui_story then
					arg_39_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10079ui_story then
				arg_39_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_6 = arg_39_1.actors_["10066ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect10066ui_story == nil then
				arg_39_1.var_.characterEffect10066ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect10066ui_story then
					local var_42_10 = Mathf.Lerp(0, 0.5, var_42_9)

					arg_39_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10066ui_story.fillRatio = var_42_10
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect10066ui_story then
				local var_42_11 = 0.5

				arg_39_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10066ui_story.fillRatio = var_42_11
			end

			local var_42_12 = arg_39_1.actors_["10079ui_story"].transform
			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.var_.moveOldPos10079ui_story = var_42_12.localPosition
			end

			local var_42_14 = 0.001

			if var_42_13 <= arg_39_1.time_ and arg_39_1.time_ < var_42_13 + var_42_14 then
				local var_42_15 = (arg_39_1.time_ - var_42_13) / var_42_14
				local var_42_16 = Vector3.New(-0.7, -0.95, -6.05)

				var_42_12.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10079ui_story, var_42_16, var_42_15)

				local var_42_17 = manager.ui.mainCamera.transform.position - var_42_12.position

				var_42_12.forward = Vector3.New(var_42_17.x, var_42_17.y, var_42_17.z)

				local var_42_18 = var_42_12.localEulerAngles

				var_42_18.z = 0
				var_42_18.x = 0
				var_42_12.localEulerAngles = var_42_18
			end

			if arg_39_1.time_ >= var_42_13 + var_42_14 and arg_39_1.time_ < var_42_13 + var_42_14 + arg_42_0 then
				var_42_12.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_42_19 = manager.ui.mainCamera.transform.position - var_42_12.position

				var_42_12.forward = Vector3.New(var_42_19.x, var_42_19.y, var_42_19.z)

				local var_42_20 = var_42_12.localEulerAngles

				var_42_20.z = 0
				var_42_20.x = 0
				var_42_12.localEulerAngles = var_42_20
			end

			local var_42_21 = arg_39_1.actors_["10066ui_story"].transform
			local var_42_22 = 0

			if var_42_22 < arg_39_1.time_ and arg_39_1.time_ <= var_42_22 + arg_42_0 then
				arg_39_1.var_.moveOldPos10066ui_story = var_42_21.localPosition
			end

			local var_42_23 = 0.001

			if var_42_22 <= arg_39_1.time_ and arg_39_1.time_ < var_42_22 + var_42_23 then
				local var_42_24 = (arg_39_1.time_ - var_42_22) / var_42_23
				local var_42_25 = Vector3.New(0.7, -0.99, -5.83)

				var_42_21.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10066ui_story, var_42_25, var_42_24)

				local var_42_26 = manager.ui.mainCamera.transform.position - var_42_21.position

				var_42_21.forward = Vector3.New(var_42_26.x, var_42_26.y, var_42_26.z)

				local var_42_27 = var_42_21.localEulerAngles

				var_42_27.z = 0
				var_42_27.x = 0
				var_42_21.localEulerAngles = var_42_27
			end

			if arg_39_1.time_ >= var_42_22 + var_42_23 and arg_39_1.time_ < var_42_22 + var_42_23 + arg_42_0 then
				var_42_21.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_42_28 = manager.ui.mainCamera.transform.position - var_42_21.position

				var_42_21.forward = Vector3.New(var_42_28.x, var_42_28.y, var_42_28.z)

				local var_42_29 = var_42_21.localEulerAngles

				var_42_29.z = 0
				var_42_29.x = 0
				var_42_21.localEulerAngles = var_42_29
			end

			local var_42_30 = 0
			local var_42_31 = 0.425

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(319741010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 17
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741010", "story_v_out_319741.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_319741", "319741010", "story_v_out_319741.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_319741", "319741010", "story_v_out_319741.awb")

						arg_39_1:RecordAudio("319741010", var_42_39)
						arg_39_1:RecordAudio("319741010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319741", "319741010", "story_v_out_319741.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319741", "319741010", "story_v_out_319741.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319741011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319741011
		arg_43_1.duration_ = 7.6

		local var_43_0 = {
			zh = 7.6,
			ja = 7.233
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
				arg_43_0:Play319741012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = "4040ui_story"

			if arg_43_1.actors_[var_46_0] == nil then
				local var_46_1 = Object.Instantiate(Asset.Load("Char/" .. var_46_0), arg_43_1.stage_.transform)

				var_46_1.name = var_46_0
				var_46_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_0] = var_46_1

				local var_46_2 = var_46_1:GetComponentInChildren(typeof(CharacterEffect))

				var_46_2.enabled = true

				local var_46_3 = GameObjectTools.GetOrAddComponent(var_46_1, typeof(DynamicBoneHelper))

				if var_46_3 then
					var_46_3:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_2.transform, false)

				arg_43_1.var_[var_46_0 .. "Animator"] = var_46_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_0 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_0 .. "LipSync"] = var_46_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_46_4 = arg_43_1.actors_["4040ui_story"].transform
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.var_.moveOldPos4040ui_story = var_46_4.localPosition
			end

			local var_46_6 = 0.001

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6
				local var_46_8 = Vector3.New(0, -1.55, -5.5)

				var_46_4.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos4040ui_story, var_46_8, var_46_7)

				local var_46_9 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_9.x, var_46_9.y, var_46_9.z)

				local var_46_10 = var_46_4.localEulerAngles

				var_46_10.z = 0
				var_46_10.x = 0
				var_46_4.localEulerAngles = var_46_10
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 then
				var_46_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_4.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_4.localEulerAngles = var_46_12
			end

			local var_46_13 = arg_43_1.actors_["4040ui_story"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.characterEffect4040ui_story == nil then
				arg_43_1.var_.characterEffect4040ui_story = var_46_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_15 = 0.200000002980232

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.characterEffect4040ui_story then
					arg_43_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.characterEffect4040ui_story then
				arg_43_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_46_17 = 0

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_46_18 = 0

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_19 = arg_43_1.actors_["10066ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos10066ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, 100, 0)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10066ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, 100, 0)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = arg_43_1.actors_["10066ui_story"]
			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story == nil then
				arg_43_1.var_.characterEffect10066ui_story = var_46_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_30 = 0.200000002980232

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_30 then
				local var_46_31 = (arg_43_1.time_ - var_46_29) / var_46_30

				if arg_43_1.var_.characterEffect10066ui_story then
					local var_46_32 = Mathf.Lerp(0, 0.5, var_46_31)

					arg_43_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10066ui_story.fillRatio = var_46_32
				end
			end

			if arg_43_1.time_ >= var_46_29 + var_46_30 and arg_43_1.time_ < var_46_29 + var_46_30 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story then
				local var_46_33 = 0.5

				arg_43_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10066ui_story.fillRatio = var_46_33
			end

			local var_46_34 = arg_43_1.actors_["10079ui_story"].transform
			local var_46_35 = 0

			if var_46_35 < arg_43_1.time_ and arg_43_1.time_ <= var_46_35 + arg_46_0 then
				arg_43_1.var_.moveOldPos10079ui_story = var_46_34.localPosition
			end

			local var_46_36 = 0.001

			if var_46_35 <= arg_43_1.time_ and arg_43_1.time_ < var_46_35 + var_46_36 then
				local var_46_37 = (arg_43_1.time_ - var_46_35) / var_46_36
				local var_46_38 = Vector3.New(0, 100, 0)

				var_46_34.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10079ui_story, var_46_38, var_46_37)

				local var_46_39 = manager.ui.mainCamera.transform.position - var_46_34.position

				var_46_34.forward = Vector3.New(var_46_39.x, var_46_39.y, var_46_39.z)

				local var_46_40 = var_46_34.localEulerAngles

				var_46_40.z = 0
				var_46_40.x = 0
				var_46_34.localEulerAngles = var_46_40
			end

			if arg_43_1.time_ >= var_46_35 + var_46_36 and arg_43_1.time_ < var_46_35 + var_46_36 + arg_46_0 then
				var_46_34.localPosition = Vector3.New(0, 100, 0)

				local var_46_41 = manager.ui.mainCamera.transform.position - var_46_34.position

				var_46_34.forward = Vector3.New(var_46_41.x, var_46_41.y, var_46_41.z)

				local var_46_42 = var_46_34.localEulerAngles

				var_46_42.z = 0
				var_46_42.x = 0
				var_46_34.localEulerAngles = var_46_42
			end

			local var_46_43 = arg_43_1.actors_["10079ui_story"]
			local var_46_44 = 0

			if var_46_44 < arg_43_1.time_ and arg_43_1.time_ <= var_46_44 + arg_46_0 and arg_43_1.var_.characterEffect10079ui_story == nil then
				arg_43_1.var_.characterEffect10079ui_story = var_46_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_45 = 0.200000002980232

			if var_46_44 <= arg_43_1.time_ and arg_43_1.time_ < var_46_44 + var_46_45 then
				local var_46_46 = (arg_43_1.time_ - var_46_44) / var_46_45

				if arg_43_1.var_.characterEffect10079ui_story then
					local var_46_47 = Mathf.Lerp(0, 0.5, var_46_46)

					arg_43_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10079ui_story.fillRatio = var_46_47
				end
			end

			if arg_43_1.time_ >= var_46_44 + var_46_45 and arg_43_1.time_ < var_46_44 + var_46_45 + arg_46_0 and arg_43_1.var_.characterEffect10079ui_story then
				local var_46_48 = 0.5

				arg_43_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10079ui_story.fillRatio = var_46_48
			end

			local var_46_49 = 0
			local var_46_50 = 0.85

			if var_46_49 < arg_43_1.time_ and arg_43_1.time_ <= var_46_49 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_51 = arg_43_1:FormatText(StoryNameCfg[668].name)

				arg_43_1.leftNameTxt_.text = var_46_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_52 = arg_43_1:GetWordFromCfg(319741011)
				local var_46_53 = arg_43_1:FormatText(var_46_52.content)

				arg_43_1.text_.text = var_46_53

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_54 = 34
				local var_46_55 = utf8.len(var_46_53)
				local var_46_56 = var_46_54 <= 0 and var_46_50 or var_46_50 * (var_46_55 / var_46_54)

				if var_46_56 > 0 and var_46_50 < var_46_56 then
					arg_43_1.talkMaxDuration = var_46_56

					if var_46_56 + var_46_49 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_56 + var_46_49
					end
				end

				arg_43_1.text_.text = var_46_53
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741011", "story_v_out_319741.awb") ~= 0 then
					local var_46_57 = manager.audio:GetVoiceLength("story_v_out_319741", "319741011", "story_v_out_319741.awb") / 1000

					if var_46_57 + var_46_49 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_57 + var_46_49
					end

					if var_46_52.prefab_name ~= "" and arg_43_1.actors_[var_46_52.prefab_name] ~= nil then
						local var_46_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_52.prefab_name].transform, "story_v_out_319741", "319741011", "story_v_out_319741.awb")

						arg_43_1:RecordAudio("319741011", var_46_58)
						arg_43_1:RecordAudio("319741011", var_46_58)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319741", "319741011", "story_v_out_319741.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319741", "319741011", "story_v_out_319741.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_59 = math.max(var_46_50, arg_43_1.talkMaxDuration)

			if var_46_49 <= arg_43_1.time_ and arg_43_1.time_ < var_46_49 + var_46_59 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_49) / var_46_59

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_49 + var_46_59 and arg_43_1.time_ < var_46_49 + var_46_59 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319741012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319741012
		arg_47_1.duration_ = 7.4

		local var_47_0 = {
			zh = 7.4,
			ja = 5.5
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
				arg_47_0:Play319741013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.825

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[668].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(319741012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741012", "story_v_out_319741.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741012", "story_v_out_319741.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_319741", "319741012", "story_v_out_319741.awb")

						arg_47_1:RecordAudio("319741012", var_50_9)
						arg_47_1:RecordAudio("319741012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319741", "319741012", "story_v_out_319741.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319741", "319741012", "story_v_out_319741.awb")
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
	Play319741013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319741013
		arg_51_1.duration_ = 14.666

		local var_51_0 = {
			zh = 7.166,
			ja = 14.666
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
				arg_51_0:Play319741014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10079ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10079ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, -0.95, -6.05)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10079ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["10079ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect10079ui_story == nil then
				arg_51_1.var_.characterEffect10079ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect10079ui_story then
					arg_51_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect10079ui_story then
				arg_51_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_15 = arg_51_1.actors_["4040ui_story"].transform
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.var_.moveOldPos4040ui_story = var_54_15.localPosition
			end

			local var_54_17 = 0.001

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Vector3.New(0, 100, 0)

				var_54_15.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos4040ui_story, var_54_19, var_54_18)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_15.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_15.localEulerAngles = var_54_21
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				var_54_15.localPosition = Vector3.New(0, 100, 0)

				local var_54_22 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_22.x, var_54_22.y, var_54_22.z)

				local var_54_23 = var_54_15.localEulerAngles

				var_54_23.z = 0
				var_54_23.x = 0
				var_54_15.localEulerAngles = var_54_23
			end

			local var_54_24 = arg_51_1.actors_["4040ui_story"]
			local var_54_25 = 0

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 and arg_51_1.var_.characterEffect4040ui_story == nil then
				arg_51_1.var_.characterEffect4040ui_story = var_54_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_26 = 0.200000002980232

			if var_54_25 <= arg_51_1.time_ and arg_51_1.time_ < var_54_25 + var_54_26 then
				local var_54_27 = (arg_51_1.time_ - var_54_25) / var_54_26

				if arg_51_1.var_.characterEffect4040ui_story then
					local var_54_28 = Mathf.Lerp(0, 0.5, var_54_27)

					arg_51_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_51_1.var_.characterEffect4040ui_story.fillRatio = var_54_28
				end
			end

			if arg_51_1.time_ >= var_54_25 + var_54_26 and arg_51_1.time_ < var_54_25 + var_54_26 + arg_54_0 and arg_51_1.var_.characterEffect4040ui_story then
				local var_54_29 = 0.5

				arg_51_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_51_1.var_.characterEffect4040ui_story.fillRatio = var_54_29
			end

			local var_54_30 = 0
			local var_54_31 = 0.975

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_32 = arg_51_1:FormatText(StoryNameCfg[6].name)

				arg_51_1.leftNameTxt_.text = var_54_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(319741013)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 39
				local var_54_36 = utf8.len(var_54_34)
				local var_54_37 = var_54_35 <= 0 and var_54_31 or var_54_31 * (var_54_36 / var_54_35)

				if var_54_37 > 0 and var_54_31 < var_54_37 then
					arg_51_1.talkMaxDuration = var_54_37

					if var_54_37 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_30
					end
				end

				arg_51_1.text_.text = var_54_34
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741013", "story_v_out_319741.awb") ~= 0 then
					local var_54_38 = manager.audio:GetVoiceLength("story_v_out_319741", "319741013", "story_v_out_319741.awb") / 1000

					if var_54_38 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_38 + var_54_30
					end

					if var_54_33.prefab_name ~= "" and arg_51_1.actors_[var_54_33.prefab_name] ~= nil then
						local var_54_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_33.prefab_name].transform, "story_v_out_319741", "319741013", "story_v_out_319741.awb")

						arg_51_1:RecordAudio("319741013", var_54_39)
						arg_51_1:RecordAudio("319741013", var_54_39)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319741", "319741013", "story_v_out_319741.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319741", "319741013", "story_v_out_319741.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_40 = math.max(var_54_31, arg_51_1.talkMaxDuration)

			if var_54_30 <= arg_51_1.time_ and arg_51_1.time_ < var_54_30 + var_54_40 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_30) / var_54_40

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_30 + var_54_40 and arg_51_1.time_ < var_54_30 + var_54_40 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319741014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319741014
		arg_55_1.duration_ = 5.233

		local var_55_0 = {
			zh = 5.233,
			ja = 4.333
		}
		local var_55_1 = manager.audio:GetLocalizationFlag()

		if var_55_0[var_55_1] ~= nil then
			arg_55_1.duration_ = var_55_0[var_55_1]
		end

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play319741015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10066ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10066ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0.7, -0.99, -5.83)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10066ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["10066ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect10066ui_story == nil then
				arg_55_1.var_.characterEffect10066ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect10066ui_story then
					arg_55_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect10066ui_story then
				arg_55_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_2")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_15 = arg_55_1.actors_["10079ui_story"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos10079ui_story = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10079ui_story, var_58_19, var_58_18)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_15.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_15.localEulerAngles = var_58_21
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				var_58_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_58_22 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_22.x, var_58_22.y, var_58_22.z)

				local var_58_23 = var_58_15.localEulerAngles

				var_58_23.z = 0
				var_58_23.x = 0
				var_58_15.localEulerAngles = var_58_23
			end

			local var_58_24 = arg_55_1.actors_["10079ui_story"]
			local var_58_25 = 0

			if var_58_25 < arg_55_1.time_ and arg_55_1.time_ <= var_58_25 + arg_58_0 and arg_55_1.var_.characterEffect10079ui_story == nil then
				arg_55_1.var_.characterEffect10079ui_story = var_58_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_26 = 0.200000002980232

			if var_58_25 <= arg_55_1.time_ and arg_55_1.time_ < var_58_25 + var_58_26 then
				local var_58_27 = (arg_55_1.time_ - var_58_25) / var_58_26

				if arg_55_1.var_.characterEffect10079ui_story then
					local var_58_28 = Mathf.Lerp(0, 0.5, var_58_27)

					arg_55_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_55_1.var_.characterEffect10079ui_story.fillRatio = var_58_28
				end
			end

			if arg_55_1.time_ >= var_58_25 + var_58_26 and arg_55_1.time_ < var_58_25 + var_58_26 + arg_58_0 and arg_55_1.var_.characterEffect10079ui_story then
				local var_58_29 = 0.5

				arg_55_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_55_1.var_.characterEffect10079ui_story.fillRatio = var_58_29
			end

			local var_58_30 = 0
			local var_58_31 = 0.5

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_32 = arg_55_1:FormatText(StoryNameCfg[640].name)

				arg_55_1.leftNameTxt_.text = var_58_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(319741014)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 20
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741014", "story_v_out_319741.awb") ~= 0 then
					local var_58_38 = manager.audio:GetVoiceLength("story_v_out_319741", "319741014", "story_v_out_319741.awb") / 1000

					if var_58_38 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_38 + var_58_30
					end

					if var_58_33.prefab_name ~= "" and arg_55_1.actors_[var_58_33.prefab_name] ~= nil then
						local var_58_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_33.prefab_name].transform, "story_v_out_319741", "319741014", "story_v_out_319741.awb")

						arg_55_1:RecordAudio("319741014", var_58_39)
						arg_55_1:RecordAudio("319741014", var_58_39)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319741", "319741014", "story_v_out_319741.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319741", "319741014", "story_v_out_319741.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_40 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_30 <= arg_55_1.time_ and arg_55_1.time_ < var_58_30 + var_58_40 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_30) / var_58_40

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_30 + var_58_40 and arg_55_1.time_ < var_58_30 + var_58_40 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319741015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319741015
		arg_59_1.duration_ = 4.033

		local var_59_0 = {
			zh = 3.366,
			ja = 4.033
		}
		local var_59_1 = manager.audio:GetLocalizationFlag()

		if var_59_0[var_59_1] ~= nil then
			arg_59_1.duration_ = var_59_0[var_59_1]
		end

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play319741016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10066ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story == nil then
				arg_59_1.var_.characterEffect10066ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect10066ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 then
				arg_59_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_8 = arg_59_1.actors_["10079ui_story"]
			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 and arg_59_1.var_.characterEffect10079ui_story == nil then
				arg_59_1.var_.characterEffect10079ui_story = var_62_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_10 = 0.200000002980232

			if var_62_9 <= arg_59_1.time_ and arg_59_1.time_ < var_62_9 + var_62_10 then
				local var_62_11 = (arg_59_1.time_ - var_62_9) / var_62_10

				if arg_59_1.var_.characterEffect10079ui_story then
					arg_59_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_9 + var_62_10 and arg_59_1.time_ < var_62_9 + var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect10079ui_story then
				arg_59_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_62_12 = 0
			local var_62_13 = 0.45

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(319741015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 18
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741015", "story_v_out_319741.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741015", "story_v_out_319741.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_319741", "319741015", "story_v_out_319741.awb")

						arg_59_1:RecordAudio("319741015", var_62_21)
						arg_59_1:RecordAudio("319741015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319741", "319741015", "story_v_out_319741.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319741", "319741015", "story_v_out_319741.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319741016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319741016
		arg_63_1.duration_ = 6.1

		local var_63_0 = {
			zh = 2.3,
			ja = 6.1
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
				arg_63_0:Play319741017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_66_1 = arg_63_1.actors_["10066ui_story"]
			local var_66_2 = 0

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story == nil then
				arg_63_1.var_.characterEffect10066ui_story = var_66_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_3 = 0.200000002980232

			if var_66_2 <= arg_63_1.time_ and arg_63_1.time_ < var_66_2 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_2) / var_66_3

				if arg_63_1.var_.characterEffect10066ui_story then
					arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_2 + var_66_3 and arg_63_1.time_ < var_66_2 + var_66_3 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story then
				arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_66_5 = arg_63_1.actors_["10079ui_story"]
			local var_66_6 = 0

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect10079ui_story == nil then
				arg_63_1.var_.characterEffect10079ui_story = var_66_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_7 = 0.200000002980232

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_7 then
				local var_66_8 = (arg_63_1.time_ - var_66_6) / var_66_7

				if arg_63_1.var_.characterEffect10079ui_story then
					local var_66_9 = Mathf.Lerp(0, 0.5, var_66_8)

					arg_63_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10079ui_story.fillRatio = var_66_9
				end
			end

			if arg_63_1.time_ >= var_66_6 + var_66_7 and arg_63_1.time_ < var_66_6 + var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect10079ui_story then
				local var_66_10 = 0.5

				arg_63_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10079ui_story.fillRatio = var_66_10
			end

			local var_66_11 = 0
			local var_66_12 = 0.275

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_13 = arg_63_1:FormatText(StoryNameCfg[640].name)

				arg_63_1.leftNameTxt_.text = var_66_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(319741016)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 11
				local var_66_17 = utf8.len(var_66_15)
				local var_66_18 = var_66_16 <= 0 and var_66_12 or var_66_12 * (var_66_17 / var_66_16)

				if var_66_18 > 0 and var_66_12 < var_66_18 then
					arg_63_1.talkMaxDuration = var_66_18

					if var_66_18 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_11
					end
				end

				arg_63_1.text_.text = var_66_15
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741016", "story_v_out_319741.awb") ~= 0 then
					local var_66_19 = manager.audio:GetVoiceLength("story_v_out_319741", "319741016", "story_v_out_319741.awb") / 1000

					if var_66_19 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_11
					end

					if var_66_14.prefab_name ~= "" and arg_63_1.actors_[var_66_14.prefab_name] ~= nil then
						local var_66_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_14.prefab_name].transform, "story_v_out_319741", "319741016", "story_v_out_319741.awb")

						arg_63_1:RecordAudio("319741016", var_66_20)
						arg_63_1:RecordAudio("319741016", var_66_20)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319741", "319741016", "story_v_out_319741.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319741", "319741016", "story_v_out_319741.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_21 = math.max(var_66_12, arg_63_1.talkMaxDuration)

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_21 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_11) / var_66_21

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_11 + var_66_21 and arg_63_1.time_ < var_66_11 + var_66_21 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319741017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319741017
		arg_67_1.duration_ = 3.3

		local var_67_0 = {
			zh = 2.9,
			ja = 3.3
		}
		local var_67_1 = manager.audio:GetLocalizationFlag()

		if var_67_0[var_67_1] ~= nil then
			arg_67_1.duration_ = var_67_0[var_67_1]
		end

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play319741018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["4040ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos4040ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, -1.55, -5.5)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos4040ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["4040ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect4040ui_story == nil then
				arg_67_1.var_.characterEffect4040ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect4040ui_story then
					arg_67_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect4040ui_story then
				arg_67_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_70_13 = arg_67_1.actors_["10066ui_story"].transform
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.var_.moveOldPos10066ui_story = var_70_13.localPosition
			end

			local var_70_15 = 0.001

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15
				local var_70_17 = Vector3.New(0, 100, 0)

				var_70_13.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10066ui_story, var_70_17, var_70_16)

				local var_70_18 = manager.ui.mainCamera.transform.position - var_70_13.position

				var_70_13.forward = Vector3.New(var_70_18.x, var_70_18.y, var_70_18.z)

				local var_70_19 = var_70_13.localEulerAngles

				var_70_19.z = 0
				var_70_19.x = 0
				var_70_13.localEulerAngles = var_70_19
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 then
				var_70_13.localPosition = Vector3.New(0, 100, 0)

				local var_70_20 = manager.ui.mainCamera.transform.position - var_70_13.position

				var_70_13.forward = Vector3.New(var_70_20.x, var_70_20.y, var_70_20.z)

				local var_70_21 = var_70_13.localEulerAngles

				var_70_21.z = 0
				var_70_21.x = 0
				var_70_13.localEulerAngles = var_70_21
			end

			local var_70_22 = arg_67_1.actors_["10066ui_story"]
			local var_70_23 = 0

			if var_70_23 < arg_67_1.time_ and arg_67_1.time_ <= var_70_23 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story == nil then
				arg_67_1.var_.characterEffect10066ui_story = var_70_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_24 = 0.200000002980232

			if var_70_23 <= arg_67_1.time_ and arg_67_1.time_ < var_70_23 + var_70_24 then
				local var_70_25 = (arg_67_1.time_ - var_70_23) / var_70_24

				if arg_67_1.var_.characterEffect10066ui_story then
					local var_70_26 = Mathf.Lerp(0, 0.5, var_70_25)

					arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_26
				end
			end

			if arg_67_1.time_ >= var_70_23 + var_70_24 and arg_67_1.time_ < var_70_23 + var_70_24 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story then
				local var_70_27 = 0.5

				arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_27
			end

			local var_70_28 = arg_67_1.actors_["10079ui_story"].transform
			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 then
				arg_67_1.var_.moveOldPos10079ui_story = var_70_28.localPosition
			end

			local var_70_30 = 0.001

			if var_70_29 <= arg_67_1.time_ and arg_67_1.time_ < var_70_29 + var_70_30 then
				local var_70_31 = (arg_67_1.time_ - var_70_29) / var_70_30
				local var_70_32 = Vector3.New(0, 100, 0)

				var_70_28.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10079ui_story, var_70_32, var_70_31)

				local var_70_33 = manager.ui.mainCamera.transform.position - var_70_28.position

				var_70_28.forward = Vector3.New(var_70_33.x, var_70_33.y, var_70_33.z)

				local var_70_34 = var_70_28.localEulerAngles

				var_70_34.z = 0
				var_70_34.x = 0
				var_70_28.localEulerAngles = var_70_34
			end

			if arg_67_1.time_ >= var_70_29 + var_70_30 and arg_67_1.time_ < var_70_29 + var_70_30 + arg_70_0 then
				var_70_28.localPosition = Vector3.New(0, 100, 0)

				local var_70_35 = manager.ui.mainCamera.transform.position - var_70_28.position

				var_70_28.forward = Vector3.New(var_70_35.x, var_70_35.y, var_70_35.z)

				local var_70_36 = var_70_28.localEulerAngles

				var_70_36.z = 0
				var_70_36.x = 0
				var_70_28.localEulerAngles = var_70_36
			end

			local var_70_37 = arg_67_1.actors_["10079ui_story"]
			local var_70_38 = 0

			if var_70_38 < arg_67_1.time_ and arg_67_1.time_ <= var_70_38 + arg_70_0 and arg_67_1.var_.characterEffect10079ui_story == nil then
				arg_67_1.var_.characterEffect10079ui_story = var_70_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_39 = 0.200000002980232

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				local var_70_40 = (arg_67_1.time_ - var_70_38) / var_70_39

				if arg_67_1.var_.characterEffect10079ui_story then
					local var_70_41 = Mathf.Lerp(0, 0.5, var_70_40)

					arg_67_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10079ui_story.fillRatio = var_70_41
				end
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 and arg_67_1.var_.characterEffect10079ui_story then
				local var_70_42 = 0.5

				arg_67_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10079ui_story.fillRatio = var_70_42
			end

			local var_70_43 = 0

			if var_70_43 < arg_67_1.time_ and arg_67_1.time_ <= var_70_43 + arg_70_0 then
				arg_67_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_70_44 = 0

			if var_70_44 < arg_67_1.time_ and arg_67_1.time_ <= var_70_44 + arg_70_0 then
				arg_67_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_45 = 0
			local var_70_46 = 0.325

			if var_70_45 < arg_67_1.time_ and arg_67_1.time_ <= var_70_45 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_47 = arg_67_1:FormatText(StoryNameCfg[668].name)

				arg_67_1.leftNameTxt_.text = var_70_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_48 = arg_67_1:GetWordFromCfg(319741017)
				local var_70_49 = arg_67_1:FormatText(var_70_48.content)

				arg_67_1.text_.text = var_70_49

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_50 = 13
				local var_70_51 = utf8.len(var_70_49)
				local var_70_52 = var_70_50 <= 0 and var_70_46 or var_70_46 * (var_70_51 / var_70_50)

				if var_70_52 > 0 and var_70_46 < var_70_52 then
					arg_67_1.talkMaxDuration = var_70_52

					if var_70_52 + var_70_45 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_52 + var_70_45
					end
				end

				arg_67_1.text_.text = var_70_49
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741017", "story_v_out_319741.awb") ~= 0 then
					local var_70_53 = manager.audio:GetVoiceLength("story_v_out_319741", "319741017", "story_v_out_319741.awb") / 1000

					if var_70_53 + var_70_45 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_53 + var_70_45
					end

					if var_70_48.prefab_name ~= "" and arg_67_1.actors_[var_70_48.prefab_name] ~= nil then
						local var_70_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_48.prefab_name].transform, "story_v_out_319741", "319741017", "story_v_out_319741.awb")

						arg_67_1:RecordAudio("319741017", var_70_54)
						arg_67_1:RecordAudio("319741017", var_70_54)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319741", "319741017", "story_v_out_319741.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319741", "319741017", "story_v_out_319741.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_55 = math.max(var_70_46, arg_67_1.talkMaxDuration)

			if var_70_45 <= arg_67_1.time_ and arg_67_1.time_ < var_70_45 + var_70_55 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_45) / var_70_55

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_45 + var_70_55 and arg_67_1.time_ < var_70_45 + var_70_55 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319741018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319741018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play319741019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["4040ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos4040ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos4040ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, 100, 0)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["4040ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect4040ui_story == nil then
				arg_71_1.var_.characterEffect4040ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect4040ui_story then
					local var_74_13 = Mathf.Lerp(0, 0.5, var_74_12)

					arg_71_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_71_1.var_.characterEffect4040ui_story.fillRatio = var_74_13
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect4040ui_story then
				local var_74_14 = 0.5

				arg_71_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_71_1.var_.characterEffect4040ui_story.fillRatio = var_74_14
			end

			local var_74_15 = 0
			local var_74_16 = 0.975

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_17 = arg_71_1:GetWordFromCfg(319741018)
				local var_74_18 = arg_71_1:FormatText(var_74_17.content)

				arg_71_1.text_.text = var_74_18

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_19 = 39
				local var_74_20 = utf8.len(var_74_18)
				local var_74_21 = var_74_19 <= 0 and var_74_16 or var_74_16 * (var_74_20 / var_74_19)

				if var_74_21 > 0 and var_74_16 < var_74_21 then
					arg_71_1.talkMaxDuration = var_74_21

					if var_74_21 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_15
					end
				end

				arg_71_1.text_.text = var_74_18
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_16, arg_71_1.talkMaxDuration)

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_15) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_15 + var_74_22 and arg_71_1.time_ < var_74_15 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319741019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319741019
		arg_75_1.duration_ = 4.1

		local var_75_0 = {
			zh = 3.533,
			ja = 4.1
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play319741020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10066ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10066ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -0.99, -5.83)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10066ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["10066ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story == nil then
				arg_75_1.var_.characterEffect10066ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect10066ui_story then
					arg_75_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story then
				arg_75_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_78_15 = 0
			local var_78_16 = 0.375

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_17 = arg_75_1:FormatText(StoryNameCfg[640].name)

				arg_75_1.leftNameTxt_.text = var_78_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_18 = arg_75_1:GetWordFromCfg(319741019)
				local var_78_19 = arg_75_1:FormatText(var_78_18.content)

				arg_75_1.text_.text = var_78_19

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_20 = 15
				local var_78_21 = utf8.len(var_78_19)
				local var_78_22 = var_78_20 <= 0 and var_78_16 or var_78_16 * (var_78_21 / var_78_20)

				if var_78_22 > 0 and var_78_16 < var_78_22 then
					arg_75_1.talkMaxDuration = var_78_22

					if var_78_22 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_22 + var_78_15
					end
				end

				arg_75_1.text_.text = var_78_19
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741019", "story_v_out_319741.awb") ~= 0 then
					local var_78_23 = manager.audio:GetVoiceLength("story_v_out_319741", "319741019", "story_v_out_319741.awb") / 1000

					if var_78_23 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_23 + var_78_15
					end

					if var_78_18.prefab_name ~= "" and arg_75_1.actors_[var_78_18.prefab_name] ~= nil then
						local var_78_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_18.prefab_name].transform, "story_v_out_319741", "319741019", "story_v_out_319741.awb")

						arg_75_1:RecordAudio("319741019", var_78_24)
						arg_75_1:RecordAudio("319741019", var_78_24)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319741", "319741019", "story_v_out_319741.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319741", "319741019", "story_v_out_319741.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_16, arg_75_1.talkMaxDuration)

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_15) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_15 + var_78_25 and arg_75_1.time_ < var_78_15 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319741020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319741020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play319741021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10066ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story == nil then
				arg_79_1.var_.characterEffect10066ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10066ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_5
			end

			local var_82_6 = arg_79_1.actors_["10066ui_story"].transform
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				arg_79_1.var_.moveOldPos10066ui_story = var_82_6.localPosition
			end

			local var_82_8 = 0.001

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8
				local var_82_10 = Vector3.New(0, 100, 0)

				var_82_6.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10066ui_story, var_82_10, var_82_9)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_6.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_6.localEulerAngles = var_82_12
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 then
				var_82_6.localPosition = Vector3.New(0, 100, 0)

				local var_82_13 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_13.x, var_82_13.y, var_82_13.z)

				local var_82_14 = var_82_6.localEulerAngles

				var_82_14.z = 0
				var_82_14.x = 0
				var_82_6.localEulerAngles = var_82_14
			end

			local var_82_15 = 0
			local var_82_16 = 1.05

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_17 = arg_79_1:GetWordFromCfg(319741020)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 42
				local var_82_20 = utf8.len(var_82_18)
				local var_82_21 = var_82_19 <= 0 and var_82_16 or var_82_16 * (var_82_20 / var_82_19)

				if var_82_21 > 0 and var_82_16 < var_82_21 then
					arg_79_1.talkMaxDuration = var_82_21

					if var_82_21 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_18
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_22 and arg_79_1.time_ < var_82_15 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319741021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319741021
		arg_83_1.duration_ = 11.9

		local var_83_0 = {
			zh = 7.066,
			ja = 11.9
		}
		local var_83_1 = manager.audio:GetLocalizationFlag()

		if var_83_0[var_83_1] ~= nil then
			arg_83_1.duration_ = var_83_0[var_83_1]
		end

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play319741022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10066ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect10066ui_story == nil then
				arg_83_1.var_.characterEffect10066ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect10066ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_83_1.var_.characterEffect10066ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect10066ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_83_1.var_.characterEffect10066ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.6

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[640].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(319741021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 24
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741021", "story_v_out_319741.awb") ~= 0 then
					local var_86_14 = manager.audio:GetVoiceLength("story_v_out_319741", "319741021", "story_v_out_319741.awb") / 1000

					if var_86_14 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_14 + var_86_6
					end

					if var_86_9.prefab_name ~= "" and arg_83_1.actors_[var_86_9.prefab_name] ~= nil then
						local var_86_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_9.prefab_name].transform, "story_v_out_319741", "319741021", "story_v_out_319741.awb")

						arg_83_1:RecordAudio("319741021", var_86_15)
						arg_83_1:RecordAudio("319741021", var_86_15)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319741", "319741021", "story_v_out_319741.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319741", "319741021", "story_v_out_319741.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_16 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_16 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_16

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_16 and arg_83_1.time_ < var_86_6 + var_86_16 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319741022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319741022
		arg_87_1.duration_ = 12.366

		local var_87_0 = {
			zh = 11.5,
			ja = 12.366
		}
		local var_87_1 = manager.audio:GetLocalizationFlag()

		if var_87_0[var_87_1] ~= nil then
			arg_87_1.duration_ = var_87_0[var_87_1]
		end

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play319741023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.1

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[640].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(319741022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 44
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741022", "story_v_out_319741.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741022", "story_v_out_319741.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_319741", "319741022", "story_v_out_319741.awb")

						arg_87_1:RecordAudio("319741022", var_90_9)
						arg_87_1:RecordAudio("319741022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319741", "319741022", "story_v_out_319741.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319741", "319741022", "story_v_out_319741.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319741023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319741023
		arg_91_1.duration_ = 6.166

		local var_91_0 = {
			zh = 4.966,
			ja = 6.166
		}
		local var_91_1 = manager.audio:GetLocalizationFlag()

		if var_91_0[var_91_1] ~= nil then
			arg_91_1.duration_ = var_91_0[var_91_1]
		end

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play319741024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.425

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[640].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(319741023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 17
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741023", "story_v_out_319741.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741023", "story_v_out_319741.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_319741", "319741023", "story_v_out_319741.awb")

						arg_91_1:RecordAudio("319741023", var_94_9)
						arg_91_1:RecordAudio("319741023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319741", "319741023", "story_v_out_319741.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319741", "319741023", "story_v_out_319741.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319741024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319741024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319741025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10066ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10066ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10066ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["10066ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story == nil then
				arg_95_1.var_.characterEffect10066ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect10066ui_story then
					local var_98_13 = Mathf.Lerp(0, 0.5, var_98_12)

					arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_13
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story then
				local var_98_14 = 0.5

				arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_14
			end

			local var_98_15 = 0
			local var_98_16 = 0.85

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_17 = arg_95_1:GetWordFromCfg(319741024)
				local var_98_18 = arg_95_1:FormatText(var_98_17.content)

				arg_95_1.text_.text = var_98_18

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_19 = 34
				local var_98_20 = utf8.len(var_98_18)
				local var_98_21 = var_98_19 <= 0 and var_98_16 or var_98_16 * (var_98_20 / var_98_19)

				if var_98_21 > 0 and var_98_16 < var_98_21 then
					arg_95_1.talkMaxDuration = var_98_21

					if var_98_21 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_15
					end
				end

				arg_95_1.text_.text = var_98_18
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_16, arg_95_1.talkMaxDuration)

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_15) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_15 + var_98_22 and arg_95_1.time_ < var_98_15 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319741025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319741025
		arg_99_1.duration_ = 4.01600000298023

		local var_99_0 = {
			zh = 3.799999999999,
			ja = 4.01600000298023
		}
		local var_99_1 = manager.audio:GetLocalizationFlag()

		if var_99_0[var_99_1] ~= nil then
			arg_99_1.duration_ = var_99_0[var_99_1]
		end

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play319741026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["4040ui_story"].transform
			local var_102_1 = 1.8

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos4040ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.55, -5.5)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos4040ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["4040ui_story"]
			local var_102_10 = 1.8

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect4040ui_story == nil then
				arg_99_1.var_.characterEffect4040ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect4040ui_story then
					arg_99_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect4040ui_story then
				arg_99_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_102_13 = 1.8

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_102_14 = 1.8

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_102_15 = 1

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				local var_102_16 = manager.ui.mainCamera.transform.localPosition
				local var_102_17 = Vector3.New(0, 0, 10) + Vector3.New(var_102_16.x, var_102_16.y, 0)
				local var_102_18 = arg_99_1.bgs_.I11m

				var_102_18.transform.localPosition = var_102_17
				var_102_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_19 = var_102_18:GetComponent("SpriteRenderer")

				if var_102_19 and var_102_19.sprite then
					local var_102_20 = (var_102_18.transform.localPosition - var_102_16).z
					local var_102_21 = manager.ui.mainCameraCom_
					local var_102_22 = 2 * var_102_20 * Mathf.Tan(var_102_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_23 = var_102_22 * var_102_21.aspect
					local var_102_24 = var_102_19.sprite.bounds.size.x
					local var_102_25 = var_102_19.sprite.bounds.size.y
					local var_102_26 = var_102_23 / var_102_24
					local var_102_27 = var_102_22 / var_102_25
					local var_102_28 = var_102_27 < var_102_26 and var_102_26 or var_102_27

					var_102_18.transform.localScale = Vector3.New(var_102_28, var_102_28, 0)
				end

				for iter_102_0, iter_102_1 in pairs(arg_99_1.bgs_) do
					if iter_102_0 ~= "I11m" then
						iter_102_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_29 = 0

			if var_102_29 < arg_99_1.time_ and arg_99_1.time_ <= var_102_29 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_30 = 1

			if var_102_29 <= arg_99_1.time_ and arg_99_1.time_ < var_102_29 + var_102_30 then
				local var_102_31 = (arg_99_1.time_ - var_102_29) / var_102_30
				local var_102_32 = Color.New(0, 0, 0)

				var_102_32.a = Mathf.Lerp(0, 1, var_102_31)
				arg_99_1.mask_.color = var_102_32
			end

			if arg_99_1.time_ >= var_102_29 + var_102_30 and arg_99_1.time_ < var_102_29 + var_102_30 + arg_102_0 then
				local var_102_33 = Color.New(0, 0, 0)

				var_102_33.a = 1
				arg_99_1.mask_.color = var_102_33
			end

			local var_102_34 = 1

			if var_102_34 < arg_99_1.time_ and arg_99_1.time_ <= var_102_34 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_35 = 1

			if var_102_34 <= arg_99_1.time_ and arg_99_1.time_ < var_102_34 + var_102_35 then
				local var_102_36 = (arg_99_1.time_ - var_102_34) / var_102_35
				local var_102_37 = Color.New(0, 0, 0)

				var_102_37.a = Mathf.Lerp(1, 0, var_102_36)
				arg_99_1.mask_.color = var_102_37
			end

			if arg_99_1.time_ >= var_102_34 + var_102_35 and arg_99_1.time_ < var_102_34 + var_102_35 + arg_102_0 then
				local var_102_38 = Color.New(0, 0, 0)
				local var_102_39 = 0

				arg_99_1.mask_.enabled = false
				var_102_38.a = var_102_39
				arg_99_1.mask_.color = var_102_38
			end

			if arg_99_1.frameCnt_ <= 1 then
				arg_99_1.dialog_:SetActive(false)
			end

			local var_102_40 = 1.85000000298023
			local var_102_41 = 0.15

			if var_102_40 < arg_99_1.time_ and arg_99_1.time_ <= var_102_40 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				arg_99_1.dialog_:SetActive(true)

				local var_102_42 = LeanTween.value(arg_99_1.dialog_, 0, 1, 0.3)

				var_102_42:setOnUpdate(LuaHelper.FloatAction(function(arg_103_0)
					arg_99_1.dialogCg_.alpha = arg_103_0
				end))
				var_102_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_99_1.dialog_)
					var_102_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_99_1.duration_ = arg_99_1.duration_ + 0.3

				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_43 = arg_99_1:FormatText(StoryNameCfg[668].name)

				arg_99_1.leftNameTxt_.text = var_102_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_44 = arg_99_1:GetWordFromCfg(319741025)
				local var_102_45 = arg_99_1:FormatText(var_102_44.content)

				arg_99_1.text_.text = var_102_45

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_46 = 6
				local var_102_47 = utf8.len(var_102_45)
				local var_102_48 = var_102_46 <= 0 and var_102_41 or var_102_41 * (var_102_47 / var_102_46)

				if var_102_48 > 0 and var_102_41 < var_102_48 then
					arg_99_1.talkMaxDuration = var_102_48
					var_102_40 = var_102_40 + 0.3

					if var_102_48 + var_102_40 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_48 + var_102_40
					end
				end

				arg_99_1.text_.text = var_102_45
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741025", "story_v_out_319741.awb") ~= 0 then
					local var_102_49 = manager.audio:GetVoiceLength("story_v_out_319741", "319741025", "story_v_out_319741.awb") / 1000

					if var_102_49 + var_102_40 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_49 + var_102_40
					end

					if var_102_44.prefab_name ~= "" and arg_99_1.actors_[var_102_44.prefab_name] ~= nil then
						local var_102_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_44.prefab_name].transform, "story_v_out_319741", "319741025", "story_v_out_319741.awb")

						arg_99_1:RecordAudio("319741025", var_102_50)
						arg_99_1:RecordAudio("319741025", var_102_50)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319741", "319741025", "story_v_out_319741.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319741", "319741025", "story_v_out_319741.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_51 = var_102_40 + 0.3
			local var_102_52 = math.max(var_102_41, arg_99_1.talkMaxDuration)

			if var_102_51 <= arg_99_1.time_ and arg_99_1.time_ < var_102_51 + var_102_52 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_51) / var_102_52

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_51 + var_102_52 and arg_99_1.time_ < var_102_51 + var_102_52 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319741026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319741026
		arg_105_1.duration_ = 1.999999999999

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play319741027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10079ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos10079ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10079ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["10079ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect10079ui_story == nil then
				arg_105_1.var_.characterEffect10079ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect10079ui_story then
					arg_105_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect10079ui_story then
				arg_105_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_108_15 = arg_105_1.actors_["4040ui_story"].transform
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 then
				arg_105_1.var_.moveOldPos4040ui_story = var_108_15.localPosition
			end

			local var_108_17 = 0.001

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17
				local var_108_19 = Vector3.New(0.7, -1.55, -5.5)

				var_108_15.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos4040ui_story, var_108_19, var_108_18)

				local var_108_20 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_20.x, var_108_20.y, var_108_20.z)

				local var_108_21 = var_108_15.localEulerAngles

				var_108_21.z = 0
				var_108_21.x = 0
				var_108_15.localEulerAngles = var_108_21
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 then
				var_108_15.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_108_22 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_22.x, var_108_22.y, var_108_22.z)

				local var_108_23 = var_108_15.localEulerAngles

				var_108_23.z = 0
				var_108_23.x = 0
				var_108_15.localEulerAngles = var_108_23
			end

			local var_108_24 = arg_105_1.actors_["4040ui_story"]
			local var_108_25 = 0

			if var_108_25 < arg_105_1.time_ and arg_105_1.time_ <= var_108_25 + arg_108_0 and arg_105_1.var_.characterEffect4040ui_story == nil then
				arg_105_1.var_.characterEffect4040ui_story = var_108_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_26 = 0.200000002980232

			if var_108_25 <= arg_105_1.time_ and arg_105_1.time_ < var_108_25 + var_108_26 then
				local var_108_27 = (arg_105_1.time_ - var_108_25) / var_108_26

				if arg_105_1.var_.characterEffect4040ui_story then
					local var_108_28 = Mathf.Lerp(0, 0.5, var_108_27)

					arg_105_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_105_1.var_.characterEffect4040ui_story.fillRatio = var_108_28
				end
			end

			if arg_105_1.time_ >= var_108_25 + var_108_26 and arg_105_1.time_ < var_108_25 + var_108_26 + arg_108_0 and arg_105_1.var_.characterEffect4040ui_story then
				local var_108_29 = 0.5

				arg_105_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_105_1.var_.characterEffect4040ui_story.fillRatio = var_108_29
			end

			local var_108_30 = 0
			local var_108_31 = 0.05

			if var_108_30 < arg_105_1.time_ and arg_105_1.time_ <= var_108_30 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_32 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_33 = arg_105_1:GetWordFromCfg(319741026)
				local var_108_34 = arg_105_1:FormatText(var_108_33.content)

				arg_105_1.text_.text = var_108_34

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_35 = 2
				local var_108_36 = utf8.len(var_108_34)
				local var_108_37 = var_108_35 <= 0 and var_108_31 or var_108_31 * (var_108_36 / var_108_35)

				if var_108_37 > 0 and var_108_31 < var_108_37 then
					arg_105_1.talkMaxDuration = var_108_37

					if var_108_37 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_37 + var_108_30
					end
				end

				arg_105_1.text_.text = var_108_34
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741026", "story_v_out_319741.awb") ~= 0 then
					local var_108_38 = manager.audio:GetVoiceLength("story_v_out_319741", "319741026", "story_v_out_319741.awb") / 1000

					if var_108_38 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_38 + var_108_30
					end

					if var_108_33.prefab_name ~= "" and arg_105_1.actors_[var_108_33.prefab_name] ~= nil then
						local var_108_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_33.prefab_name].transform, "story_v_out_319741", "319741026", "story_v_out_319741.awb")

						arg_105_1:RecordAudio("319741026", var_108_39)
						arg_105_1:RecordAudio("319741026", var_108_39)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319741", "319741026", "story_v_out_319741.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319741", "319741026", "story_v_out_319741.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_40 = math.max(var_108_31, arg_105_1.talkMaxDuration)

			if var_108_30 <= arg_105_1.time_ and arg_105_1.time_ < var_108_30 + var_108_40 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_30) / var_108_40

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_30 + var_108_40 and arg_105_1.time_ < var_108_30 + var_108_40 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319741027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319741027
		arg_109_1.duration_ = 3.333

		local var_109_0 = {
			zh = 3.333,
			ja = 2.9
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
				arg_109_0:Play319741028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.3

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[6].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(319741027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741027", "story_v_out_319741.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741027", "story_v_out_319741.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_319741", "319741027", "story_v_out_319741.awb")

						arg_109_1:RecordAudio("319741027", var_112_9)
						arg_109_1:RecordAudio("319741027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319741", "319741027", "story_v_out_319741.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319741", "319741027", "story_v_out_319741.awb")
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
	Play319741028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319741028
		arg_113_1.duration_ = 5.666

		local var_113_0 = {
			zh = 5.2,
			ja = 5.666
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
				arg_113_0:Play319741029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10079ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect10079ui_story == nil then
				arg_113_1.var_.characterEffect10079ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect10079ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_113_1.var_.characterEffect10079ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect10079ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_113_1.var_.characterEffect10079ui_story.fillRatio = var_116_5
			end

			local var_116_6 = arg_113_1.actors_["4040ui_story"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story == nil then
				arg_113_1.var_.characterEffect4040ui_story = var_116_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_8 = 0.200000002980232

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.characterEffect4040ui_story then
					arg_113_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story then
				arg_113_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 then
				arg_113_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_1")
			end

			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_116_12 = 0
			local var_116_13 = 0.425

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[668].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(319741028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 17
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741028", "story_v_out_319741.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741028", "story_v_out_319741.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_319741", "319741028", "story_v_out_319741.awb")

						arg_113_1:RecordAudio("319741028", var_116_21)
						arg_113_1:RecordAudio("319741028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319741", "319741028", "story_v_out_319741.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319741", "319741028", "story_v_out_319741.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319741029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319741029
		arg_117_1.duration_ = 5.5

		local var_117_0 = {
			zh = 4.433,
			ja = 5.5
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
				arg_117_0:Play319741030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10079ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect10079ui_story == nil then
				arg_117_1.var_.characterEffect10079ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect10079ui_story then
					arg_117_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect10079ui_story then
				arg_117_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_120_4 = 0

			if var_120_4 < arg_117_1.time_ and arg_117_1.time_ <= var_120_4 + arg_120_0 then
				arg_117_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_2")
			end

			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_120_6 = arg_117_1.actors_["4040ui_story"]
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 and arg_117_1.var_.characterEffect4040ui_story == nil then
				arg_117_1.var_.characterEffect4040ui_story = var_120_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_8 = 0.200000002980232

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8

				if arg_117_1.var_.characterEffect4040ui_story then
					local var_120_10 = Mathf.Lerp(0, 0.5, var_120_9)

					arg_117_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_117_1.var_.characterEffect4040ui_story.fillRatio = var_120_10
				end
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 and arg_117_1.var_.characterEffect4040ui_story then
				local var_120_11 = 0.5

				arg_117_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_117_1.var_.characterEffect4040ui_story.fillRatio = var_120_11
			end

			local var_120_12 = 0
			local var_120_13 = 0.625

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_14 = arg_117_1:FormatText(StoryNameCfg[6].name)

				arg_117_1.leftNameTxt_.text = var_120_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_15 = arg_117_1:GetWordFromCfg(319741029)
				local var_120_16 = arg_117_1:FormatText(var_120_15.content)

				arg_117_1.text_.text = var_120_16

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_17 = 25
				local var_120_18 = utf8.len(var_120_16)
				local var_120_19 = var_120_17 <= 0 and var_120_13 or var_120_13 * (var_120_18 / var_120_17)

				if var_120_19 > 0 and var_120_13 < var_120_19 then
					arg_117_1.talkMaxDuration = var_120_19

					if var_120_19 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_12
					end
				end

				arg_117_1.text_.text = var_120_16
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741029", "story_v_out_319741.awb") ~= 0 then
					local var_120_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741029", "story_v_out_319741.awb") / 1000

					if var_120_20 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_12
					end

					if var_120_15.prefab_name ~= "" and arg_117_1.actors_[var_120_15.prefab_name] ~= nil then
						local var_120_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_15.prefab_name].transform, "story_v_out_319741", "319741029", "story_v_out_319741.awb")

						arg_117_1:RecordAudio("319741029", var_120_21)
						arg_117_1:RecordAudio("319741029", var_120_21)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319741", "319741029", "story_v_out_319741.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319741", "319741029", "story_v_out_319741.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_22 = math.max(var_120_13, arg_117_1.talkMaxDuration)

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_22 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_12) / var_120_22

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_12 + var_120_22 and arg_117_1.time_ < var_120_12 + var_120_22 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319741030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319741030
		arg_121_1.duration_ = 8.766

		local var_121_0 = {
			zh = 6.033,
			ja = 8.766
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play319741031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10079ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect10079ui_story == nil then
				arg_121_1.var_.characterEffect10079ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect10079ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10079ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect10079ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10079ui_story.fillRatio = var_124_5
			end

			local var_124_6 = arg_121_1.actors_["4040ui_story"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 and arg_121_1.var_.characterEffect4040ui_story == nil then
				arg_121_1.var_.characterEffect4040ui_story = var_124_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_8 = 0.200000002980232

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_8 then
				local var_124_9 = (arg_121_1.time_ - var_124_7) / var_124_8

				if arg_121_1.var_.characterEffect4040ui_story then
					arg_121_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_8 and arg_121_1.time_ < var_124_7 + var_124_8 + arg_124_0 and arg_121_1.var_.characterEffect4040ui_story then
				arg_121_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_124_10 = 0
			local var_124_11 = 0.75

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_12 = arg_121_1:FormatText(StoryNameCfg[668].name)

				arg_121_1.leftNameTxt_.text = var_124_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_13 = arg_121_1:GetWordFromCfg(319741030)
				local var_124_14 = arg_121_1:FormatText(var_124_13.content)

				arg_121_1.text_.text = var_124_14

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_15 = 30
				local var_124_16 = utf8.len(var_124_14)
				local var_124_17 = var_124_15 <= 0 and var_124_11 or var_124_11 * (var_124_16 / var_124_15)

				if var_124_17 > 0 and var_124_11 < var_124_17 then
					arg_121_1.talkMaxDuration = var_124_17

					if var_124_17 + var_124_10 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_17 + var_124_10
					end
				end

				arg_121_1.text_.text = var_124_14
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741030", "story_v_out_319741.awb") ~= 0 then
					local var_124_18 = manager.audio:GetVoiceLength("story_v_out_319741", "319741030", "story_v_out_319741.awb") / 1000

					if var_124_18 + var_124_10 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_18 + var_124_10
					end

					if var_124_13.prefab_name ~= "" and arg_121_1.actors_[var_124_13.prefab_name] ~= nil then
						local var_124_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_13.prefab_name].transform, "story_v_out_319741", "319741030", "story_v_out_319741.awb")

						arg_121_1:RecordAudio("319741030", var_124_19)
						arg_121_1:RecordAudio("319741030", var_124_19)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319741", "319741030", "story_v_out_319741.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319741", "319741030", "story_v_out_319741.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_20 = math.max(var_124_11, arg_121_1.talkMaxDuration)

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_20 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_10) / var_124_20

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_10 + var_124_20 and arg_121_1.time_ < var_124_10 + var_124_20 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319741031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319741031
		arg_125_1.duration_ = 3.5

		local var_125_0 = {
			zh = 2.866,
			ja = 3.5
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
				arg_125_0:Play319741032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10079ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10079ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10079ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["10079ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story == nil then
				arg_125_1.var_.characterEffect10079ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect10079ui_story then
					arg_125_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story then
				arg_125_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_128_13 = arg_125_1.actors_["4040ui_story"]
			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story == nil then
				arg_125_1.var_.characterEffect4040ui_story = var_128_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_15 = 0.200000002980232

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_15 then
				local var_128_16 = (arg_125_1.time_ - var_128_14) / var_128_15

				if arg_125_1.var_.characterEffect4040ui_story then
					local var_128_17 = Mathf.Lerp(0, 0.5, var_128_16)

					arg_125_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_125_1.var_.characterEffect4040ui_story.fillRatio = var_128_17
				end
			end

			if arg_125_1.time_ >= var_128_14 + var_128_15 and arg_125_1.time_ < var_128_14 + var_128_15 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story then
				local var_128_18 = 0.5

				arg_125_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_125_1.var_.characterEffect4040ui_story.fillRatio = var_128_18
			end

			local var_128_19 = 0
			local var_128_20 = 0.35

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[6].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(319741031)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 14
				local var_128_25 = utf8.len(var_128_23)
				local var_128_26 = var_128_24 <= 0 and var_128_20 or var_128_20 * (var_128_25 / var_128_24)

				if var_128_26 > 0 and var_128_20 < var_128_26 then
					arg_125_1.talkMaxDuration = var_128_26

					if var_128_26 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_26 + var_128_19
					end
				end

				arg_125_1.text_.text = var_128_23
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741031", "story_v_out_319741.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_319741", "319741031", "story_v_out_319741.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_319741", "319741031", "story_v_out_319741.awb")

						arg_125_1:RecordAudio("319741031", var_128_28)
						arg_125_1:RecordAudio("319741031", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319741", "319741031", "story_v_out_319741.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319741", "319741031", "story_v_out_319741.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_29 = math.max(var_128_20, arg_125_1.talkMaxDuration)

			if var_128_19 <= arg_125_1.time_ and arg_125_1.time_ < var_128_19 + var_128_29 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_19) / var_128_29

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_19 + var_128_29 and arg_125_1.time_ < var_128_19 + var_128_29 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319741032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319741032
		arg_129_1.duration_ = 2.666

		local var_129_0 = {
			zh = 2.666,
			ja = 2
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
				arg_129_0:Play319741033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["4040ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos4040ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0.7, -1.55, -5.5)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos4040ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["4040ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story == nil then
				arg_129_1.var_.characterEffect4040ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect4040ui_story then
					arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story then
				arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_132_13 = arg_129_1.actors_["10079ui_story"]
			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 and arg_129_1.var_.characterEffect10079ui_story == nil then
				arg_129_1.var_.characterEffect10079ui_story = var_132_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_15 = 0.200000002980232

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_15 then
				local var_132_16 = (arg_129_1.time_ - var_132_14) / var_132_15

				if arg_129_1.var_.characterEffect10079ui_story then
					local var_132_17 = Mathf.Lerp(0, 0.5, var_132_16)

					arg_129_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_129_1.var_.characterEffect10079ui_story.fillRatio = var_132_17
				end
			end

			if arg_129_1.time_ >= var_132_14 + var_132_15 and arg_129_1.time_ < var_132_14 + var_132_15 + arg_132_0 and arg_129_1.var_.characterEffect10079ui_story then
				local var_132_18 = 0.5

				arg_129_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_129_1.var_.characterEffect10079ui_story.fillRatio = var_132_18
			end

			local var_132_19 = 0

			if var_132_19 < arg_129_1.time_ and arg_129_1.time_ <= var_132_19 + arg_132_0 then
				arg_129_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_2")
			end

			local var_132_20 = 0

			if var_132_20 < arg_129_1.time_ and arg_129_1.time_ <= var_132_20 + arg_132_0 then
				arg_129_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_132_21 = 0
			local var_132_22 = 0.225

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[668].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(319741032)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741032", "story_v_out_319741.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_319741", "319741032", "story_v_out_319741.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_319741", "319741032", "story_v_out_319741.awb")

						arg_129_1:RecordAudio("319741032", var_132_30)
						arg_129_1:RecordAudio("319741032", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319741", "319741032", "story_v_out_319741.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319741", "319741032", "story_v_out_319741.awb")
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
	Play319741033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319741033
		arg_133_1.duration_ = 3.466

		local var_133_0 = {
			zh = 3.3,
			ja = 3.466
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
				arg_133_0:Play319741034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["4040ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story == nil then
				arg_133_1.var_.characterEffect4040ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect4040ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_133_1.var_.characterEffect4040ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_133_1.var_.characterEffect4040ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 then
				arg_133_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_136_8 = arg_133_1.actors_["10079ui_story"]
			local var_136_9 = 0

			if var_136_9 < arg_133_1.time_ and arg_133_1.time_ <= var_136_9 + arg_136_0 and arg_133_1.var_.characterEffect10079ui_story == nil then
				arg_133_1.var_.characterEffect10079ui_story = var_136_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_10 = 0.200000002980232

			if var_136_9 <= arg_133_1.time_ and arg_133_1.time_ < var_136_9 + var_136_10 then
				local var_136_11 = (arg_133_1.time_ - var_136_9) / var_136_10

				if arg_133_1.var_.characterEffect10079ui_story then
					arg_133_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_9 + var_136_10 and arg_133_1.time_ < var_136_9 + var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect10079ui_story then
				arg_133_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_136_12 = 0
			local var_136_13 = 0.4

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(319741033)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 16
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741033", "story_v_out_319741.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741033", "story_v_out_319741.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_319741", "319741033", "story_v_out_319741.awb")

						arg_133_1:RecordAudio("319741033", var_136_21)
						arg_133_1:RecordAudio("319741033", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319741", "319741033", "story_v_out_319741.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319741", "319741033", "story_v_out_319741.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319741034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319741034
		arg_137_1.duration_ = 15.566

		local var_137_0 = {
			zh = 10.433,
			ja = 15.566
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
				arg_137_0:Play319741035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.425

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

				local var_140_3 = arg_137_1:GetWordFromCfg(319741034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741034", "story_v_out_319741.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741034", "story_v_out_319741.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_319741", "319741034", "story_v_out_319741.awb")

						arg_137_1:RecordAudio("319741034", var_140_9)
						arg_137_1:RecordAudio("319741034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319741", "319741034", "story_v_out_319741.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319741", "319741034", "story_v_out_319741.awb")
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
	Play319741035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319741035
		arg_141_1.duration_ = 4.2

		local var_141_0 = {
			zh = 3.533,
			ja = 4.2
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
				arg_141_0:Play319741036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10079ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect10079ui_story == nil then
				arg_141_1.var_.characterEffect10079ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect10079ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10079ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect10079ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10079ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["4040ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story == nil then
				arg_141_1.var_.characterEffect4040ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.200000002980232

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect4040ui_story then
					arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect4040ui_story then
				arg_141_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action7_1")
			end

			local var_144_11 = 0

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_144_12 = 0
			local var_144_13 = 0.325

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_14 = arg_141_1:FormatText(StoryNameCfg[668].name)

				arg_141_1.leftNameTxt_.text = var_144_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(319741035)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 13
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_13 or var_144_13 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_13 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_12
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741035", "story_v_out_319741.awb") ~= 0 then
					local var_144_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741035", "story_v_out_319741.awb") / 1000

					if var_144_20 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_12
					end

					if var_144_15.prefab_name ~= "" and arg_141_1.actors_[var_144_15.prefab_name] ~= nil then
						local var_144_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_15.prefab_name].transform, "story_v_out_319741", "319741035", "story_v_out_319741.awb")

						arg_141_1:RecordAudio("319741035", var_144_21)
						arg_141_1:RecordAudio("319741035", var_144_21)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319741", "319741035", "story_v_out_319741.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319741", "319741035", "story_v_out_319741.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_13, arg_141_1.talkMaxDuration)

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_12) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_12 + var_144_22 and arg_141_1.time_ < var_144_12 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319741036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319741036
		arg_145_1.duration_ = 4.066

		local var_145_0 = {
			zh = 3,
			ja = 4.066
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
				arg_145_0:Play319741037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["4040ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story == nil then
				arg_145_1.var_.characterEffect4040ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect4040ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect4040ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_145_1.var_.characterEffect4040ui_story.fillRatio = var_148_5
			end

			local var_148_6 = arg_145_1.actors_["10079ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect10079ui_story == nil then
				arg_145_1.var_.characterEffect10079ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect10079ui_story then
					arg_145_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect10079ui_story then
				arg_145_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_148_10 = 0
			local var_148_11 = 0.325

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_12 = arg_145_1:FormatText(StoryNameCfg[6].name)

				arg_145_1.leftNameTxt_.text = var_148_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_13 = arg_145_1:GetWordFromCfg(319741036)
				local var_148_14 = arg_145_1:FormatText(var_148_13.content)

				arg_145_1.text_.text = var_148_14

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_15 = 13
				local var_148_16 = utf8.len(var_148_14)
				local var_148_17 = var_148_15 <= 0 and var_148_11 or var_148_11 * (var_148_16 / var_148_15)

				if var_148_17 > 0 and var_148_11 < var_148_17 then
					arg_145_1.talkMaxDuration = var_148_17

					if var_148_17 + var_148_10 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_17 + var_148_10
					end
				end

				arg_145_1.text_.text = var_148_14
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741036", "story_v_out_319741.awb") ~= 0 then
					local var_148_18 = manager.audio:GetVoiceLength("story_v_out_319741", "319741036", "story_v_out_319741.awb") / 1000

					if var_148_18 + var_148_10 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_18 + var_148_10
					end

					if var_148_13.prefab_name ~= "" and arg_145_1.actors_[var_148_13.prefab_name] ~= nil then
						local var_148_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_13.prefab_name].transform, "story_v_out_319741", "319741036", "story_v_out_319741.awb")

						arg_145_1:RecordAudio("319741036", var_148_19)
						arg_145_1:RecordAudio("319741036", var_148_19)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319741", "319741036", "story_v_out_319741.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319741", "319741036", "story_v_out_319741.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_20 = math.max(var_148_11, arg_145_1.talkMaxDuration)

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_20 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_10) / var_148_20

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_10 + var_148_20 and arg_145_1.time_ < var_148_10 + var_148_20 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319741037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319741037
		arg_149_1.duration_ = 1.8

		local var_149_0 = {
			zh = 1.8,
			ja = 1.666
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
				arg_149_0:Play319741038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10079ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect10079ui_story == nil then
				arg_149_1.var_.characterEffect10079ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect10079ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_149_1.var_.characterEffect10079ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect10079ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_149_1.var_.characterEffect10079ui_story.fillRatio = var_152_5
			end

			local var_152_6 = arg_149_1.actors_["4040ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story == nil then
				arg_149_1.var_.characterEffect4040ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.200000002980232

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect4040ui_story then
					arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect4040ui_story then
				arg_149_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_152_10 = 0
			local var_152_11 = 0.15

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_12 = arg_149_1:FormatText(StoryNameCfg[668].name)

				arg_149_1.leftNameTxt_.text = var_152_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_13 = arg_149_1:GetWordFromCfg(319741037)
				local var_152_14 = arg_149_1:FormatText(var_152_13.content)

				arg_149_1.text_.text = var_152_14

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_15 = 6
				local var_152_16 = utf8.len(var_152_14)
				local var_152_17 = var_152_15 <= 0 and var_152_11 or var_152_11 * (var_152_16 / var_152_15)

				if var_152_17 > 0 and var_152_11 < var_152_17 then
					arg_149_1.talkMaxDuration = var_152_17

					if var_152_17 + var_152_10 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_17 + var_152_10
					end
				end

				arg_149_1.text_.text = var_152_14
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741037", "story_v_out_319741.awb") ~= 0 then
					local var_152_18 = manager.audio:GetVoiceLength("story_v_out_319741", "319741037", "story_v_out_319741.awb") / 1000

					if var_152_18 + var_152_10 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_10
					end

					if var_152_13.prefab_name ~= "" and arg_149_1.actors_[var_152_13.prefab_name] ~= nil then
						local var_152_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_13.prefab_name].transform, "story_v_out_319741", "319741037", "story_v_out_319741.awb")

						arg_149_1:RecordAudio("319741037", var_152_19)
						arg_149_1:RecordAudio("319741037", var_152_19)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319741", "319741037", "story_v_out_319741.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319741", "319741037", "story_v_out_319741.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_20 = math.max(var_152_11, arg_149_1.talkMaxDuration)

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_20 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_10) / var_152_20

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_10 + var_152_20 and arg_149_1.time_ < var_152_10 + var_152_20 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319741038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319741038
		arg_153_1.duration_ = 8.333

		local var_153_0 = {
			zh = 5.733,
			ja = 8.333
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
				arg_153_0:Play319741039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10079ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos10079ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10079ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 then
				arg_153_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_156_11 = arg_153_1.actors_["4040ui_story"]
			local var_156_12 = 0

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story == nil then
				arg_153_1.var_.characterEffect4040ui_story = var_156_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_13 = 0.200000002980232

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_13 then
				local var_156_14 = (arg_153_1.time_ - var_156_12) / var_156_13

				if arg_153_1.var_.characterEffect4040ui_story then
					local var_156_15 = Mathf.Lerp(0, 0.5, var_156_14)

					arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_15
				end
			end

			if arg_153_1.time_ >= var_156_12 + var_156_13 and arg_153_1.time_ < var_156_12 + var_156_13 + arg_156_0 and arg_153_1.var_.characterEffect4040ui_story then
				local var_156_16 = 0.5

				arg_153_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_153_1.var_.characterEffect4040ui_story.fillRatio = var_156_16
			end

			local var_156_17 = arg_153_1.actors_["10079ui_story"]
			local var_156_18 = 0

			if var_156_18 < arg_153_1.time_ and arg_153_1.time_ <= var_156_18 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story == nil then
				arg_153_1.var_.characterEffect10079ui_story = var_156_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_19 = 0.200000002980232

			if var_156_18 <= arg_153_1.time_ and arg_153_1.time_ < var_156_18 + var_156_19 then
				local var_156_20 = (arg_153_1.time_ - var_156_18) / var_156_19

				if arg_153_1.var_.characterEffect10079ui_story then
					arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_18 + var_156_19 and arg_153_1.time_ < var_156_18 + var_156_19 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story then
				arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_156_21 = 0
			local var_156_22 = 0.7

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_23 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_24 = arg_153_1:GetWordFromCfg(319741038)
				local var_156_25 = arg_153_1:FormatText(var_156_24.content)

				arg_153_1.text_.text = var_156_25

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_26 = 28
				local var_156_27 = utf8.len(var_156_25)
				local var_156_28 = var_156_26 <= 0 and var_156_22 or var_156_22 * (var_156_27 / var_156_26)

				if var_156_28 > 0 and var_156_22 < var_156_28 then
					arg_153_1.talkMaxDuration = var_156_28

					if var_156_28 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_28 + var_156_21
					end
				end

				arg_153_1.text_.text = var_156_25
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741038", "story_v_out_319741.awb") ~= 0 then
					local var_156_29 = manager.audio:GetVoiceLength("story_v_out_319741", "319741038", "story_v_out_319741.awb") / 1000

					if var_156_29 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_29 + var_156_21
					end

					if var_156_24.prefab_name ~= "" and arg_153_1.actors_[var_156_24.prefab_name] ~= nil then
						local var_156_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_24.prefab_name].transform, "story_v_out_319741", "319741038", "story_v_out_319741.awb")

						arg_153_1:RecordAudio("319741038", var_156_30)
						arg_153_1:RecordAudio("319741038", var_156_30)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319741", "319741038", "story_v_out_319741.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319741", "319741038", "story_v_out_319741.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_31 = math.max(var_156_22, arg_153_1.talkMaxDuration)

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_31 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_21) / var_156_31

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_21 + var_156_31 and arg_153_1.time_ < var_156_21 + var_156_31 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319741039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319741039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319741040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10079ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect10079ui_story == nil then
				arg_157_1.var_.characterEffect10079ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect10079ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_157_1.var_.characterEffect10079ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect10079ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_157_1.var_.characterEffect10079ui_story.fillRatio = var_160_5
			end

			local var_160_6 = 0

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 then
				arg_157_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action7_2")
			end

			local var_160_8 = 0
			local var_160_9 = 1.725

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_10 = arg_157_1:GetWordFromCfg(319741039)
				local var_160_11 = arg_157_1:FormatText(var_160_10.content)

				arg_157_1.text_.text = var_160_11

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_12 = 69
				local var_160_13 = utf8.len(var_160_11)
				local var_160_14 = var_160_12 <= 0 and var_160_9 or var_160_9 * (var_160_13 / var_160_12)

				if var_160_14 > 0 and var_160_9 < var_160_14 then
					arg_157_1.talkMaxDuration = var_160_14

					if var_160_14 + var_160_8 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_8
					end
				end

				arg_157_1.text_.text = var_160_11
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_15 = math.max(var_160_9, arg_157_1.talkMaxDuration)

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_15 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_8) / var_160_15

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_8 + var_160_15 and arg_157_1.time_ < var_160_8 + var_160_15 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319741040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319741040
		arg_161_1.duration_ = 5.133

		local var_161_0 = {
			zh = 5.133,
			ja = 4.266
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
				arg_161_0:Play319741041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["4040ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos4040ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0.7, -1.55, -5.5)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos4040ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0.7, -1.55, -5.5)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["4040ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect4040ui_story == nil then
				arg_161_1.var_.characterEffect4040ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.200000002980232

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect4040ui_story then
					arg_161_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect4040ui_story then
				arg_161_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_164_13 = 0

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_164_14 = 0
			local var_164_15 = 0.6

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_16 = arg_161_1:FormatText(StoryNameCfg[668].name)

				arg_161_1.leftNameTxt_.text = var_164_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_17 = arg_161_1:GetWordFromCfg(319741040)
				local var_164_18 = arg_161_1:FormatText(var_164_17.content)

				arg_161_1.text_.text = var_164_18

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_19 = 24
				local var_164_20 = utf8.len(var_164_18)
				local var_164_21 = var_164_19 <= 0 and var_164_15 or var_164_15 * (var_164_20 / var_164_19)

				if var_164_21 > 0 and var_164_15 < var_164_21 then
					arg_161_1.talkMaxDuration = var_164_21

					if var_164_21 + var_164_14 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_21 + var_164_14
					end
				end

				arg_161_1.text_.text = var_164_18
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741040", "story_v_out_319741.awb") ~= 0 then
					local var_164_22 = manager.audio:GetVoiceLength("story_v_out_319741", "319741040", "story_v_out_319741.awb") / 1000

					if var_164_22 + var_164_14 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_22 + var_164_14
					end

					if var_164_17.prefab_name ~= "" and arg_161_1.actors_[var_164_17.prefab_name] ~= nil then
						local var_164_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_17.prefab_name].transform, "story_v_out_319741", "319741040", "story_v_out_319741.awb")

						arg_161_1:RecordAudio("319741040", var_164_23)
						arg_161_1:RecordAudio("319741040", var_164_23)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319741", "319741040", "story_v_out_319741.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319741", "319741040", "story_v_out_319741.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_24 = math.max(var_164_15, arg_161_1.talkMaxDuration)

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_24 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_14) / var_164_24

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_14 + var_164_24 and arg_161_1.time_ < var_164_14 + var_164_24 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319741041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319741041
		arg_165_1.duration_ = 12.033

		local var_165_0 = {
			zh = 8.733,
			ja = 12.033
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play319741042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.05

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[668].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(319741041)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 42
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741041", "story_v_out_319741.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741041", "story_v_out_319741.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_319741", "319741041", "story_v_out_319741.awb")

						arg_165_1:RecordAudio("319741041", var_168_9)
						arg_165_1:RecordAudio("319741041", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319741", "319741041", "story_v_out_319741.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319741", "319741041", "story_v_out_319741.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319741042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319741042
		arg_169_1.duration_ = 10.633

		local var_169_0 = {
			zh = 2.9,
			ja = 10.633
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play319741043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["4040ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story == nil then
				arg_169_1.var_.characterEffect4040ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect4040ui_story then
					local var_172_4 = Mathf.Lerp(0, 0.5, var_172_3)

					arg_169_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_169_1.var_.characterEffect4040ui_story.fillRatio = var_172_4
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story then
				local var_172_5 = 0.5

				arg_169_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_169_1.var_.characterEffect4040ui_story.fillRatio = var_172_5
			end

			local var_172_6 = arg_169_1.actors_["10079ui_story"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 and arg_169_1.var_.characterEffect10079ui_story == nil then
				arg_169_1.var_.characterEffect10079ui_story = var_172_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_8 = 0.200000002980232

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_8 then
				local var_172_9 = (arg_169_1.time_ - var_172_7) / var_172_8

				if arg_169_1.var_.characterEffect10079ui_story then
					arg_169_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_8 and arg_169_1.time_ < var_172_7 + var_172_8 + arg_172_0 and arg_169_1.var_.characterEffect10079ui_story then
				arg_169_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_172_10 = 0
			local var_172_11 = 0.35

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_12 = arg_169_1:FormatText(StoryNameCfg[6].name)

				arg_169_1.leftNameTxt_.text = var_172_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_13 = arg_169_1:GetWordFromCfg(319741042)
				local var_172_14 = arg_169_1:FormatText(var_172_13.content)

				arg_169_1.text_.text = var_172_14

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_15 = 14
				local var_172_16 = utf8.len(var_172_14)
				local var_172_17 = var_172_15 <= 0 and var_172_11 or var_172_11 * (var_172_16 / var_172_15)

				if var_172_17 > 0 and var_172_11 < var_172_17 then
					arg_169_1.talkMaxDuration = var_172_17

					if var_172_17 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_17 + var_172_10
					end
				end

				arg_169_1.text_.text = var_172_14
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741042", "story_v_out_319741.awb") ~= 0 then
					local var_172_18 = manager.audio:GetVoiceLength("story_v_out_319741", "319741042", "story_v_out_319741.awb") / 1000

					if var_172_18 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_18 + var_172_10
					end

					if var_172_13.prefab_name ~= "" and arg_169_1.actors_[var_172_13.prefab_name] ~= nil then
						local var_172_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_13.prefab_name].transform, "story_v_out_319741", "319741042", "story_v_out_319741.awb")

						arg_169_1:RecordAudio("319741042", var_172_19)
						arg_169_1:RecordAudio("319741042", var_172_19)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319741", "319741042", "story_v_out_319741.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319741", "319741042", "story_v_out_319741.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_20 = math.max(var_172_11, arg_169_1.talkMaxDuration)

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_20 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_10) / var_172_20

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_10 + var_172_20 and arg_169_1.time_ < var_172_10 + var_172_20 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319741043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319741043
		arg_173_1.duration_ = 6.166

		local var_173_0 = {
			zh = 5.366,
			ja = 6.166
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play319741044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10079ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect10079ui_story == nil then
				arg_173_1.var_.characterEffect10079ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect10079ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_173_1.var_.characterEffect10079ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect10079ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_173_1.var_.characterEffect10079ui_story.fillRatio = var_176_5
			end

			local var_176_6 = arg_173_1.actors_["4040ui_story"]
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 and arg_173_1.var_.characterEffect4040ui_story == nil then
				arg_173_1.var_.characterEffect4040ui_story = var_176_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_8 = 0.200000002980232

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_8 then
				local var_176_9 = (arg_173_1.time_ - var_176_7) / var_176_8

				if arg_173_1.var_.characterEffect4040ui_story then
					arg_173_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_7 + var_176_8 and arg_173_1.time_ < var_176_7 + var_176_8 + arg_176_0 and arg_173_1.var_.characterEffect4040ui_story then
				arg_173_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 then
				arg_173_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_176_11 = 0

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_176_12 = 0
			local var_176_13 = 0.325

			if var_176_12 < arg_173_1.time_ and arg_173_1.time_ <= var_176_12 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_14 = arg_173_1:FormatText(StoryNameCfg[668].name)

				arg_173_1.leftNameTxt_.text = var_176_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_15 = arg_173_1:GetWordFromCfg(319741043)
				local var_176_16 = arg_173_1:FormatText(var_176_15.content)

				arg_173_1.text_.text = var_176_16

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_17 = 13
				local var_176_18 = utf8.len(var_176_16)
				local var_176_19 = var_176_17 <= 0 and var_176_13 or var_176_13 * (var_176_18 / var_176_17)

				if var_176_19 > 0 and var_176_13 < var_176_19 then
					arg_173_1.talkMaxDuration = var_176_19

					if var_176_19 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_12
					end
				end

				arg_173_1.text_.text = var_176_16
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741043", "story_v_out_319741.awb") ~= 0 then
					local var_176_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741043", "story_v_out_319741.awb") / 1000

					if var_176_20 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_12
					end

					if var_176_15.prefab_name ~= "" and arg_173_1.actors_[var_176_15.prefab_name] ~= nil then
						local var_176_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_15.prefab_name].transform, "story_v_out_319741", "319741043", "story_v_out_319741.awb")

						arg_173_1:RecordAudio("319741043", var_176_21)
						arg_173_1:RecordAudio("319741043", var_176_21)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319741", "319741043", "story_v_out_319741.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319741", "319741043", "story_v_out_319741.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_13, arg_173_1.talkMaxDuration)

			if var_176_12 <= arg_173_1.time_ and arg_173_1.time_ < var_176_12 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_12) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_12 + var_176_22 and arg_173_1.time_ < var_176_12 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319741044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319741044
		arg_177_1.duration_ = 10.533

		local var_177_0 = {
			zh = 3.7,
			ja = 10.533
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319741045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_180_1 = arg_177_1.actors_["4040ui_story"]
			local var_180_2 = 0

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect4040ui_story == nil then
				arg_177_1.var_.characterEffect4040ui_story = var_180_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_3 = 0.200000002980232

			if var_180_2 <= arg_177_1.time_ and arg_177_1.time_ < var_180_2 + var_180_3 then
				local var_180_4 = (arg_177_1.time_ - var_180_2) / var_180_3

				if arg_177_1.var_.characterEffect4040ui_story then
					local var_180_5 = Mathf.Lerp(0, 0.5, var_180_4)

					arg_177_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_177_1.var_.characterEffect4040ui_story.fillRatio = var_180_5
				end
			end

			if arg_177_1.time_ >= var_180_2 + var_180_3 and arg_177_1.time_ < var_180_2 + var_180_3 + arg_180_0 and arg_177_1.var_.characterEffect4040ui_story then
				local var_180_6 = 0.5

				arg_177_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_177_1.var_.characterEffect4040ui_story.fillRatio = var_180_6
			end

			local var_180_7 = arg_177_1.actors_["10079ui_story"]
			local var_180_8 = 0

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect10079ui_story == nil then
				arg_177_1.var_.characterEffect10079ui_story = var_180_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_9 = 0.200000002980232

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_9 then
				local var_180_10 = (arg_177_1.time_ - var_180_8) / var_180_9

				if arg_177_1.var_.characterEffect10079ui_story then
					arg_177_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_8 + var_180_9 and arg_177_1.time_ < var_180_8 + var_180_9 + arg_180_0 and arg_177_1.var_.characterEffect10079ui_story then
				arg_177_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_180_11 = 0
			local var_180_12 = 0.475

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[6].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(319741044)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 19
				local var_180_17 = utf8.len(var_180_15)
				local var_180_18 = var_180_16 <= 0 and var_180_12 or var_180_12 * (var_180_17 / var_180_16)

				if var_180_18 > 0 and var_180_12 < var_180_18 then
					arg_177_1.talkMaxDuration = var_180_18

					if var_180_18 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_18 + var_180_11
					end
				end

				arg_177_1.text_.text = var_180_15
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741044", "story_v_out_319741.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_out_319741", "319741044", "story_v_out_319741.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_out_319741", "319741044", "story_v_out_319741.awb")

						arg_177_1:RecordAudio("319741044", var_180_20)
						arg_177_1:RecordAudio("319741044", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319741", "319741044", "story_v_out_319741.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319741", "319741044", "story_v_out_319741.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_21 = math.max(var_180_12, arg_177_1.talkMaxDuration)

			if var_180_11 <= arg_177_1.time_ and arg_177_1.time_ < var_180_11 + var_180_21 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_11) / var_180_21

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_11 + var_180_21 and arg_177_1.time_ < var_180_11 + var_180_21 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319741045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319741045
		arg_181_1.duration_ = 3.466

		local var_181_0 = {
			zh = 3.466,
			ja = 3.266
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319741046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["4040ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect4040ui_story == nil then
				arg_181_1.var_.characterEffect4040ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect4040ui_story then
					arg_181_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect4040ui_story then
				arg_181_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_184_4 = arg_181_1.actors_["10079ui_story"]
			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 and arg_181_1.var_.characterEffect10079ui_story == nil then
				arg_181_1.var_.characterEffect10079ui_story = var_184_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_6 = 0.200000002980232

			if var_184_5 <= arg_181_1.time_ and arg_181_1.time_ < var_184_5 + var_184_6 then
				local var_184_7 = (arg_181_1.time_ - var_184_5) / var_184_6

				if arg_181_1.var_.characterEffect10079ui_story then
					local var_184_8 = Mathf.Lerp(0, 0.5, var_184_7)

					arg_181_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_181_1.var_.characterEffect10079ui_story.fillRatio = var_184_8
				end
			end

			if arg_181_1.time_ >= var_184_5 + var_184_6 and arg_181_1.time_ < var_184_5 + var_184_6 + arg_184_0 and arg_181_1.var_.characterEffect10079ui_story then
				local var_184_9 = 0.5

				arg_181_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_181_1.var_.characterEffect10079ui_story.fillRatio = var_184_9
			end

			local var_184_10 = 0
			local var_184_11 = 0.4

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_12 = arg_181_1:FormatText(StoryNameCfg[668].name)

				arg_181_1.leftNameTxt_.text = var_184_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_13 = arg_181_1:GetWordFromCfg(319741045)
				local var_184_14 = arg_181_1:FormatText(var_184_13.content)

				arg_181_1.text_.text = var_184_14

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_15 = 16
				local var_184_16 = utf8.len(var_184_14)
				local var_184_17 = var_184_15 <= 0 and var_184_11 or var_184_11 * (var_184_16 / var_184_15)

				if var_184_17 > 0 and var_184_11 < var_184_17 then
					arg_181_1.talkMaxDuration = var_184_17

					if var_184_17 + var_184_10 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_17 + var_184_10
					end
				end

				arg_181_1.text_.text = var_184_14
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741045", "story_v_out_319741.awb") ~= 0 then
					local var_184_18 = manager.audio:GetVoiceLength("story_v_out_319741", "319741045", "story_v_out_319741.awb") / 1000

					if var_184_18 + var_184_10 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_10
					end

					if var_184_13.prefab_name ~= "" and arg_181_1.actors_[var_184_13.prefab_name] ~= nil then
						local var_184_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_13.prefab_name].transform, "story_v_out_319741", "319741045", "story_v_out_319741.awb")

						arg_181_1:RecordAudio("319741045", var_184_19)
						arg_181_1:RecordAudio("319741045", var_184_19)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_319741", "319741045", "story_v_out_319741.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_319741", "319741045", "story_v_out_319741.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_20 = math.max(var_184_11, arg_181_1.talkMaxDuration)

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_20 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_10) / var_184_20

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_10 + var_184_20 and arg_181_1.time_ < var_184_10 + var_184_20 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319741046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319741046
		arg_185_1.duration_ = 13.966

		local var_185_0 = {
			zh = 8,
			ja = 13.966
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play319741047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_188_2 = arg_185_1.actors_["4040ui_story"]
			local var_188_3 = 0

			if var_188_3 < arg_185_1.time_ and arg_185_1.time_ <= var_188_3 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story == nil then
				arg_185_1.var_.characterEffect4040ui_story = var_188_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_4 = 0.200000002980232

			if var_188_3 <= arg_185_1.time_ and arg_185_1.time_ < var_188_3 + var_188_4 then
				local var_188_5 = (arg_185_1.time_ - var_188_3) / var_188_4

				if arg_185_1.var_.characterEffect4040ui_story then
					local var_188_6 = Mathf.Lerp(0, 0.5, var_188_5)

					arg_185_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_185_1.var_.characterEffect4040ui_story.fillRatio = var_188_6
				end
			end

			if arg_185_1.time_ >= var_188_3 + var_188_4 and arg_185_1.time_ < var_188_3 + var_188_4 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story then
				local var_188_7 = 0.5

				arg_185_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_185_1.var_.characterEffect4040ui_story.fillRatio = var_188_7
			end

			local var_188_8 = arg_185_1.actors_["10079ui_story"]
			local var_188_9 = 0

			if var_188_9 < arg_185_1.time_ and arg_185_1.time_ <= var_188_9 + arg_188_0 and arg_185_1.var_.characterEffect10079ui_story == nil then
				arg_185_1.var_.characterEffect10079ui_story = var_188_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_10 = 0.200000002980232

			if var_188_9 <= arg_185_1.time_ and arg_185_1.time_ < var_188_9 + var_188_10 then
				local var_188_11 = (arg_185_1.time_ - var_188_9) / var_188_10

				if arg_185_1.var_.characterEffect10079ui_story then
					arg_185_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_9 + var_188_10 and arg_185_1.time_ < var_188_9 + var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect10079ui_story then
				arg_185_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_188_12 = 0
			local var_188_13 = 1

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_14 = arg_185_1:FormatText(StoryNameCfg[6].name)

				arg_185_1.leftNameTxt_.text = var_188_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_15 = arg_185_1:GetWordFromCfg(319741046)
				local var_188_16 = arg_185_1:FormatText(var_188_15.content)

				arg_185_1.text_.text = var_188_16

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_17 = 40
				local var_188_18 = utf8.len(var_188_16)
				local var_188_19 = var_188_17 <= 0 and var_188_13 or var_188_13 * (var_188_18 / var_188_17)

				if var_188_19 > 0 and var_188_13 < var_188_19 then
					arg_185_1.talkMaxDuration = var_188_19

					if var_188_19 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_12
					end
				end

				arg_185_1.text_.text = var_188_16
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741046", "story_v_out_319741.awb") ~= 0 then
					local var_188_20 = manager.audio:GetVoiceLength("story_v_out_319741", "319741046", "story_v_out_319741.awb") / 1000

					if var_188_20 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_20 + var_188_12
					end

					if var_188_15.prefab_name ~= "" and arg_185_1.actors_[var_188_15.prefab_name] ~= nil then
						local var_188_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_15.prefab_name].transform, "story_v_out_319741", "319741046", "story_v_out_319741.awb")

						arg_185_1:RecordAudio("319741046", var_188_21)
						arg_185_1:RecordAudio("319741046", var_188_21)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319741", "319741046", "story_v_out_319741.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319741", "319741046", "story_v_out_319741.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_22 = math.max(var_188_13, arg_185_1.talkMaxDuration)

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_22 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_12) / var_188_22

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_12 + var_188_22 and arg_185_1.time_ < var_188_12 + var_188_22 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319741047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319741047
		arg_189_1.duration_ = 3.966

		local var_189_0 = {
			zh = 3.966,
			ja = 3.1
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play319741048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["4040ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect4040ui_story == nil then
				arg_189_1.var_.characterEffect4040ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect4040ui_story then
					arg_189_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect4040ui_story then
				arg_189_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_192_4 = arg_189_1.actors_["10079ui_story"]
			local var_192_5 = 0

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 and arg_189_1.var_.characterEffect10079ui_story == nil then
				arg_189_1.var_.characterEffect10079ui_story = var_192_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_6 = 0.200000002980232

			if var_192_5 <= arg_189_1.time_ and arg_189_1.time_ < var_192_5 + var_192_6 then
				local var_192_7 = (arg_189_1.time_ - var_192_5) / var_192_6

				if arg_189_1.var_.characterEffect10079ui_story then
					local var_192_8 = Mathf.Lerp(0, 0.5, var_192_7)

					arg_189_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_189_1.var_.characterEffect10079ui_story.fillRatio = var_192_8
				end
			end

			if arg_189_1.time_ >= var_192_5 + var_192_6 and arg_189_1.time_ < var_192_5 + var_192_6 + arg_192_0 and arg_189_1.var_.characterEffect10079ui_story then
				local var_192_9 = 0.5

				arg_189_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_189_1.var_.characterEffect10079ui_story.fillRatio = var_192_9
			end

			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_192_11 = 0
			local var_192_12 = 0.45

			if var_192_11 < arg_189_1.time_ and arg_189_1.time_ <= var_192_11 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_13 = arg_189_1:FormatText(StoryNameCfg[668].name)

				arg_189_1.leftNameTxt_.text = var_192_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_14 = arg_189_1:GetWordFromCfg(319741047)
				local var_192_15 = arg_189_1:FormatText(var_192_14.content)

				arg_189_1.text_.text = var_192_15

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_16 = 18
				local var_192_17 = utf8.len(var_192_15)
				local var_192_18 = var_192_16 <= 0 and var_192_12 or var_192_12 * (var_192_17 / var_192_16)

				if var_192_18 > 0 and var_192_12 < var_192_18 then
					arg_189_1.talkMaxDuration = var_192_18

					if var_192_18 + var_192_11 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_18 + var_192_11
					end
				end

				arg_189_1.text_.text = var_192_15
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741047", "story_v_out_319741.awb") ~= 0 then
					local var_192_19 = manager.audio:GetVoiceLength("story_v_out_319741", "319741047", "story_v_out_319741.awb") / 1000

					if var_192_19 + var_192_11 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_19 + var_192_11
					end

					if var_192_14.prefab_name ~= "" and arg_189_1.actors_[var_192_14.prefab_name] ~= nil then
						local var_192_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_14.prefab_name].transform, "story_v_out_319741", "319741047", "story_v_out_319741.awb")

						arg_189_1:RecordAudio("319741047", var_192_20)
						arg_189_1:RecordAudio("319741047", var_192_20)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319741", "319741047", "story_v_out_319741.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319741", "319741047", "story_v_out_319741.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_21 = math.max(var_192_12, arg_189_1.talkMaxDuration)

			if var_192_11 <= arg_189_1.time_ and arg_189_1.time_ < var_192_11 + var_192_21 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_11) / var_192_21

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_11 + var_192_21 and arg_189_1.time_ < var_192_11 + var_192_21 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319741048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319741048
		arg_193_1.duration_ = 17.166

		local var_193_0 = {
			zh = 9.033,
			ja = 17.166
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play319741049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.975

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[668].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(319741048)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 39
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741048", "story_v_out_319741.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741048", "story_v_out_319741.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_319741", "319741048", "story_v_out_319741.awb")

						arg_193_1:RecordAudio("319741048", var_196_9)
						arg_193_1:RecordAudio("319741048", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319741", "319741048", "story_v_out_319741.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319741", "319741048", "story_v_out_319741.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319741049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319741049
		arg_197_1.duration_ = 8.766

		local var_197_0 = {
			zh = 8.766,
			ja = 8.633
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play319741050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.875

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[668].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(319741049)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 35
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741049", "story_v_out_319741.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741049", "story_v_out_319741.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_319741", "319741049", "story_v_out_319741.awb")

						arg_197_1:RecordAudio("319741049", var_200_9)
						arg_197_1:RecordAudio("319741049", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319741", "319741049", "story_v_out_319741.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319741", "319741049", "story_v_out_319741.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319741050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319741050
		arg_201_1.duration_ = 10.733

		local var_201_0 = {
			zh = 10.733,
			ja = 10.033
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play319741051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1.175

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[668].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(319741050)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 47
				local var_204_6 = utf8.len(var_204_4)
				local var_204_7 = var_204_5 <= 0 and var_204_1 or var_204_1 * (var_204_6 / var_204_5)

				if var_204_7 > 0 and var_204_1 < var_204_7 then
					arg_201_1.talkMaxDuration = var_204_7

					if var_204_7 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_7 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_4
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741050", "story_v_out_319741.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741050", "story_v_out_319741.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_319741", "319741050", "story_v_out_319741.awb")

						arg_201_1:RecordAudio("319741050", var_204_9)
						arg_201_1:RecordAudio("319741050", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319741", "319741050", "story_v_out_319741.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319741", "319741050", "story_v_out_319741.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_10 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_10 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_10

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_10 and arg_201_1.time_ < var_204_0 + var_204_10 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319741051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319741051
		arg_205_1.duration_ = 12.366

		local var_205_0 = {
			zh = 12.133,
			ja = 12.366
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play319741052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_208_2 = 0
			local var_208_3 = 1.425

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_4 = arg_205_1:FormatText(StoryNameCfg[668].name)

				arg_205_1.leftNameTxt_.text = var_208_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_5 = arg_205_1:GetWordFromCfg(319741051)
				local var_208_6 = arg_205_1:FormatText(var_208_5.content)

				arg_205_1.text_.text = var_208_6

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_7 = 57
				local var_208_8 = utf8.len(var_208_6)
				local var_208_9 = var_208_7 <= 0 and var_208_3 or var_208_3 * (var_208_8 / var_208_7)

				if var_208_9 > 0 and var_208_3 < var_208_9 then
					arg_205_1.talkMaxDuration = var_208_9

					if var_208_9 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_9 + var_208_2
					end
				end

				arg_205_1.text_.text = var_208_6
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741051", "story_v_out_319741.awb") ~= 0 then
					local var_208_10 = manager.audio:GetVoiceLength("story_v_out_319741", "319741051", "story_v_out_319741.awb") / 1000

					if var_208_10 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_10 + var_208_2
					end

					if var_208_5.prefab_name ~= "" and arg_205_1.actors_[var_208_5.prefab_name] ~= nil then
						local var_208_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_5.prefab_name].transform, "story_v_out_319741", "319741051", "story_v_out_319741.awb")

						arg_205_1:RecordAudio("319741051", var_208_11)
						arg_205_1:RecordAudio("319741051", var_208_11)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319741", "319741051", "story_v_out_319741.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319741", "319741051", "story_v_out_319741.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_12 = math.max(var_208_3, arg_205_1.talkMaxDuration)

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_12 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_2) / var_208_12

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_2 + var_208_12 and arg_205_1.time_ < var_208_2 + var_208_12 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319741052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319741052
		arg_209_1.duration_ = 10.4

		local var_209_0 = {
			zh = 8.8,
			ja = 10.4
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play319741053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.85

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[668].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(319741052)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 34
				local var_212_6 = utf8.len(var_212_4)
				local var_212_7 = var_212_5 <= 0 and var_212_1 or var_212_1 * (var_212_6 / var_212_5)

				if var_212_7 > 0 and var_212_1 < var_212_7 then
					arg_209_1.talkMaxDuration = var_212_7

					if var_212_7 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_7 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_4
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319741", "319741052", "story_v_out_319741.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_319741", "319741052", "story_v_out_319741.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_319741", "319741052", "story_v_out_319741.awb")

						arg_209_1:RecordAudio("319741052", var_212_9)
						arg_209_1:RecordAudio("319741052", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319741", "319741052", "story_v_out_319741.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319741", "319741052", "story_v_out_319741.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_10 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_10 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_10

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_10 and arg_209_1.time_ < var_212_0 + var_212_10 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319741053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319741053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319741054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10079ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect10079ui_story == nil then
				arg_213_1.var_.characterEffect10079ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect10079ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_213_1.var_.characterEffect10079ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect10079ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_213_1.var_.characterEffect10079ui_story.fillRatio = var_216_5
			end

			local var_216_6 = arg_213_1.actors_["4040ui_story"]
			local var_216_7 = 0

			if var_216_7 < arg_213_1.time_ and arg_213_1.time_ <= var_216_7 + arg_216_0 and arg_213_1.var_.characterEffect4040ui_story == nil then
				arg_213_1.var_.characterEffect4040ui_story = var_216_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_8 = 0.200000002980232

			if var_216_7 <= arg_213_1.time_ and arg_213_1.time_ < var_216_7 + var_216_8 then
				local var_216_9 = (arg_213_1.time_ - var_216_7) / var_216_8

				if arg_213_1.var_.characterEffect4040ui_story then
					local var_216_10 = Mathf.Lerp(0, 0.5, var_216_9)

					arg_213_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_213_1.var_.characterEffect4040ui_story.fillRatio = var_216_10
				end
			end

			if arg_213_1.time_ >= var_216_7 + var_216_8 and arg_213_1.time_ < var_216_7 + var_216_8 + arg_216_0 and arg_213_1.var_.characterEffect4040ui_story then
				local var_216_11 = 0.5

				arg_213_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_213_1.var_.characterEffect4040ui_story.fillRatio = var_216_11
			end

			local var_216_12 = arg_213_1.actors_["4040ui_story"].transform
			local var_216_13 = 0

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1.var_.moveOldPos4040ui_story = var_216_12.localPosition
			end

			local var_216_14 = 0.001

			if var_216_13 <= arg_213_1.time_ and arg_213_1.time_ < var_216_13 + var_216_14 then
				local var_216_15 = (arg_213_1.time_ - var_216_13) / var_216_14
				local var_216_16 = Vector3.New(0, 100, 0)

				var_216_12.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos4040ui_story, var_216_16, var_216_15)

				local var_216_17 = manager.ui.mainCamera.transform.position - var_216_12.position

				var_216_12.forward = Vector3.New(var_216_17.x, var_216_17.y, var_216_17.z)

				local var_216_18 = var_216_12.localEulerAngles

				var_216_18.z = 0
				var_216_18.x = 0
				var_216_12.localEulerAngles = var_216_18
			end

			if arg_213_1.time_ >= var_216_13 + var_216_14 and arg_213_1.time_ < var_216_13 + var_216_14 + arg_216_0 then
				var_216_12.localPosition = Vector3.New(0, 100, 0)

				local var_216_19 = manager.ui.mainCamera.transform.position - var_216_12.position

				var_216_12.forward = Vector3.New(var_216_19.x, var_216_19.y, var_216_19.z)

				local var_216_20 = var_216_12.localEulerAngles

				var_216_20.z = 0
				var_216_20.x = 0
				var_216_12.localEulerAngles = var_216_20
			end

			local var_216_21 = arg_213_1.actors_["10079ui_story"].transform
			local var_216_22 = 0

			if var_216_22 < arg_213_1.time_ and arg_213_1.time_ <= var_216_22 + arg_216_0 then
				arg_213_1.var_.moveOldPos10079ui_story = var_216_21.localPosition
			end

			local var_216_23 = 0.001

			if var_216_22 <= arg_213_1.time_ and arg_213_1.time_ < var_216_22 + var_216_23 then
				local var_216_24 = (arg_213_1.time_ - var_216_22) / var_216_23
				local var_216_25 = Vector3.New(0, 100, 0)

				var_216_21.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10079ui_story, var_216_25, var_216_24)

				local var_216_26 = manager.ui.mainCamera.transform.position - var_216_21.position

				var_216_21.forward = Vector3.New(var_216_26.x, var_216_26.y, var_216_26.z)

				local var_216_27 = var_216_21.localEulerAngles

				var_216_27.z = 0
				var_216_27.x = 0
				var_216_21.localEulerAngles = var_216_27
			end

			if arg_213_1.time_ >= var_216_22 + var_216_23 and arg_213_1.time_ < var_216_22 + var_216_23 + arg_216_0 then
				var_216_21.localPosition = Vector3.New(0, 100, 0)

				local var_216_28 = manager.ui.mainCamera.transform.position - var_216_21.position

				var_216_21.forward = Vector3.New(var_216_28.x, var_216_28.y, var_216_28.z)

				local var_216_29 = var_216_21.localEulerAngles

				var_216_29.z = 0
				var_216_29.x = 0
				var_216_21.localEulerAngles = var_216_29
			end

			local var_216_30 = 0
			local var_216_31 = 1.05

			if var_216_30 < arg_213_1.time_ and arg_213_1.time_ <= var_216_30 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_32 = arg_213_1:GetWordFromCfg(319741053)
				local var_216_33 = arg_213_1:FormatText(var_216_32.content)

				arg_213_1.text_.text = var_216_33

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_34 = 42
				local var_216_35 = utf8.len(var_216_33)
				local var_216_36 = var_216_34 <= 0 and var_216_31 or var_216_31 * (var_216_35 / var_216_34)

				if var_216_36 > 0 and var_216_31 < var_216_36 then
					arg_213_1.talkMaxDuration = var_216_36

					if var_216_36 + var_216_30 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_36 + var_216_30
					end
				end

				arg_213_1.text_.text = var_216_33
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_37 = math.max(var_216_31, arg_213_1.talkMaxDuration)

			if var_216_30 <= arg_213_1.time_ and arg_213_1.time_ < var_216_30 + var_216_37 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_30) / var_216_37

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_30 + var_216_37 and arg_213_1.time_ < var_216_30 + var_216_37 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319741054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319741054
		arg_217_1.duration_ = 6.182999999999

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play319741055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0.15
			local var_220_1 = 6.033
			local var_220_2 = manager.audio:GetVoiceLength("story_v_out_319741", "319741054", "story_v_out_319741.awb") / 1000

			if var_220_2 > 0 and var_220_1 < var_220_2 and var_220_2 + var_220_0 > arg_217_1.duration_ then
				local var_220_3 = var_220_2

				arg_217_1.duration_ = var_220_2 + var_220_0
			end

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				local var_220_4 = "play"
				local var_220_5 = "voice"

				arg_217_1:AudioAction(var_220_4, var_220_5, "story_v_out_319741", "319741054", "story_v_out_319741.awb")
			end

			local var_220_6 = 0

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.fswbg_:SetActive(true)
				arg_217_1.dialog_:SetActive(false)

				arg_217_1.fswtw_.percent = 0

				local var_220_7 = arg_217_1:GetWordFromCfg(319741054)
				local var_220_8 = arg_217_1:FormatText(var_220_7.content)

				arg_217_1.fswt_.text = var_220_8

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.fswt_)

				arg_217_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_217_1.fswtw_:SetDirty()

				arg_217_1.typewritterCharCountI18N = 0

				SetActive(arg_217_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_217_1:ShowNextGo(false)
			end

			local var_220_9 = 0.149999999998999

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 then
				arg_217_1.var_.oldValueTypewriter = arg_217_1.fswtw_.percent

				arg_217_1:ShowNextGo(false)
			end

			local var_220_10 = 0
			local var_220_11 = 0
			local var_220_12 = arg_217_1:GetWordFromCfg(319741054)
			local var_220_13 = arg_217_1:FormatText(var_220_12.content)
			local var_220_14, var_220_15 = arg_217_1:GetPercentByPara(var_220_13, 1)

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				local var_220_16 = var_220_10 <= 0 and var_220_11 or var_220_11 * ((var_220_15 - arg_217_1.typewritterCharCountI18N) / var_220_10)

				if var_220_16 > 0 and var_220_11 < var_220_16 then
					arg_217_1.talkMaxDuration = var_220_16

					if var_220_16 + var_220_9 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_16 + var_220_9
					end
				end
			end

			local var_220_17 = 0
			local var_220_18 = math.max(var_220_17, arg_217_1.talkMaxDuration)

			if var_220_9 <= arg_217_1.time_ and arg_217_1.time_ < var_220_9 + var_220_18 then
				local var_220_19 = (arg_217_1.time_ - var_220_9) / var_220_18

				arg_217_1.fswtw_.percent = Mathf.Lerp(arg_217_1.var_.oldValueTypewriter, var_220_14, var_220_19)
				arg_217_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_217_1.fswtw_:SetDirty()
			end

			if arg_217_1.time_ >= var_220_9 + var_220_18 and arg_217_1.time_ < var_220_9 + var_220_18 + arg_220_0 then
				arg_217_1.fswtw_.percent = var_220_14

				arg_217_1.fswtw_:SetDirty()
				arg_217_1:ShowNextGo(true)

				arg_217_1.typewritterCharCountI18N = var_220_15
			end

			local var_220_20 = 0.15

			if var_220_20 < arg_217_1.time_ and arg_217_1.time_ <= var_220_20 + arg_220_0 then
				arg_217_1.var_.oldValueTypewriter = arg_217_1.fswtw_.percent

				arg_217_1:ShowNextGo(false)
			end

			local var_220_21 = 24
			local var_220_22 = 1.6
			local var_220_23 = arg_217_1:GetWordFromCfg(319741054)
			local var_220_24 = arg_217_1:FormatText(var_220_23.content)
			local var_220_25, var_220_26 = arg_217_1:GetPercentByPara(var_220_24, 1)

			if var_220_20 < arg_217_1.time_ and arg_217_1.time_ <= var_220_20 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				local var_220_27 = var_220_21 <= 0 and var_220_22 or var_220_22 * ((var_220_26 - arg_217_1.typewritterCharCountI18N) / var_220_21)

				if var_220_27 > 0 and var_220_22 < var_220_27 then
					arg_217_1.talkMaxDuration = var_220_27

					if var_220_27 + var_220_20 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_27 + var_220_20
					end
				end
			end

			local var_220_28 = 1.6
			local var_220_29 = math.max(var_220_28, arg_217_1.talkMaxDuration)

			if var_220_20 <= arg_217_1.time_ and arg_217_1.time_ < var_220_20 + var_220_29 then
				local var_220_30 = (arg_217_1.time_ - var_220_20) / var_220_29

				arg_217_1.fswtw_.percent = Mathf.Lerp(arg_217_1.var_.oldValueTypewriter, var_220_25, var_220_30)
				arg_217_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_217_1.fswtw_:SetDirty()
			end

			if arg_217_1.time_ >= var_220_20 + var_220_29 and arg_217_1.time_ < var_220_20 + var_220_29 + arg_220_0 then
				arg_217_1.fswtw_.percent = var_220_25

				arg_217_1.fswtw_:SetDirty()
				arg_217_1:ShowNextGo(true)

				arg_217_1.typewritterCharCountI18N = var_220_26
			end

			local var_220_31 = 0

			if var_220_31 < arg_217_1.time_ and arg_217_1.time_ <= var_220_31 + arg_220_0 then
				arg_217_1.cswbg_:SetActive(true)

				local var_220_32 = arg_217_1.cswt_:GetComponent("RectTransform")

				arg_217_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_220_32.offsetMin = Vector2.New(400, 220)
				var_220_32.offsetMax = Vector2.New(-400, -200)

				local var_220_33 = arg_217_1:GetWordFromCfg(419050)
				local var_220_34 = arg_217_1:FormatText(var_220_33.content)

				arg_217_1.cswt_.text = var_220_34

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.cswt_)

				arg_217_1.cswt_.fontSize = 180
				arg_217_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_217_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_220_35 = 0

			if var_220_35 < arg_217_1.time_ and arg_217_1.time_ <= var_220_35 + arg_220_0 then
				local var_220_36 = arg_217_1.fswbg_.transform:Find("textbox/adapt/content") or arg_217_1.fswbg_.transform:Find("textbox/content")
				local var_220_37 = var_220_36:GetComponent("Text")
				local var_220_38 = var_220_36:GetComponent("RectTransform")

				var_220_37.alignment = UnityEngine.TextAnchor.LowerCenter
				var_220_38.offsetMin = Vector2.New(0, 0)
				var_220_38.offsetMax = Vector2.New(0, 0)
			end

			local var_220_39 = "STblack"

			if arg_217_1.bgs_[var_220_39] == nil then
				local var_220_40 = Object.Instantiate(arg_217_1.paintGo_)

				var_220_40:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_220_39)
				var_220_40.name = var_220_39
				var_220_40.transform.parent = arg_217_1.stage_.transform
				var_220_40.transform.localPosition = Vector3.New(0, 100, 0)
				arg_217_1.bgs_[var_220_39] = var_220_40
			end

			local var_220_41 = 0

			if var_220_41 < arg_217_1.time_ and arg_217_1.time_ <= var_220_41 + arg_220_0 then
				local var_220_42 = manager.ui.mainCamera.transform.localPosition
				local var_220_43 = Vector3.New(0, 0, 10) + Vector3.New(var_220_42.x, var_220_42.y, 0)
				local var_220_44 = arg_217_1.bgs_.STblack

				var_220_44.transform.localPosition = var_220_43
				var_220_44.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_45 = var_220_44:GetComponent("SpriteRenderer")

				if var_220_45 and var_220_45.sprite then
					local var_220_46 = (var_220_44.transform.localPosition - var_220_42).z
					local var_220_47 = manager.ui.mainCameraCom_
					local var_220_48 = 2 * var_220_46 * Mathf.Tan(var_220_47.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_49 = var_220_48 * var_220_47.aspect
					local var_220_50 = var_220_45.sprite.bounds.size.x
					local var_220_51 = var_220_45.sprite.bounds.size.y
					local var_220_52 = var_220_49 / var_220_50
					local var_220_53 = var_220_48 / var_220_51
					local var_220_54 = var_220_53 < var_220_52 and var_220_52 or var_220_53

					var_220_44.transform.localScale = Vector3.New(var_220_54, var_220_54, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "STblack" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_55 = 0

			if var_220_55 < arg_217_1.time_ and arg_217_1.time_ <= var_220_55 + arg_220_0 then
				arg_217_1.cswbg_:SetActive(true)

				local var_220_56 = arg_217_1.cswt_:GetComponent("RectTransform")

				arg_217_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_220_56.offsetMin = Vector2.New(410, 330)
				var_220_56.offsetMax = Vector2.New(-400, -180)

				local var_220_57 = arg_217_1:GetWordFromCfg(419050)
				local var_220_58 = arg_217_1:FormatText(var_220_57.content)

				arg_217_1.cswt_.text = var_220_58

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.cswt_)

				arg_217_1.cswt_.fontSize = 175
				arg_217_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_217_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319741055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319741055
		arg_221_1.duration_ = 4.782999999999

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
			arg_221_1.auto_ = false
		end

		function arg_221_1.playNext_(arg_223_0)
			arg_221_1.onStoryFinished_()
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0.15
			local var_224_1 = 4.633
			local var_224_2 = manager.audio:GetVoiceLength("story_v_out_319741", "319741055", "story_v_out_319741.awb") / 1000

			if var_224_2 > 0 and var_224_1 < var_224_2 and var_224_2 + var_224_0 > arg_221_1.duration_ then
				local var_224_3 = var_224_2

				arg_221_1.duration_ = var_224_2 + var_224_0
			end

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				local var_224_4 = "play"
				local var_224_5 = "voice"

				arg_221_1:AudioAction(var_224_4, var_224_5, "story_v_out_319741", "319741055", "story_v_out_319741.awb")
			end

			local var_224_6 = 0

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.fswbg_:SetActive(true)
				arg_221_1.dialog_:SetActive(false)

				arg_221_1.fswtw_.percent = 0

				local var_224_7 = arg_221_1:GetWordFromCfg(319741055)
				local var_224_8 = arg_221_1:FormatText(var_224_7.content)

				arg_221_1.fswt_.text = var_224_8

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.fswt_)

				arg_221_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_221_1.fswtw_:SetDirty()

				arg_221_1.typewritterCharCountI18N = 0

				SetActive(arg_221_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_221_1:ShowNextGo(false)
			end

			local var_224_9 = 0.149999999998999

			if var_224_9 < arg_221_1.time_ and arg_221_1.time_ <= var_224_9 + arg_224_0 then
				arg_221_1.var_.oldValueTypewriter = arg_221_1.fswtw_.percent

				arg_221_1:ShowNextGo(false)
			end

			local var_224_10 = 0
			local var_224_11 = 0
			local var_224_12 = arg_221_1:GetWordFromCfg(319741055)
			local var_224_13 = arg_221_1:FormatText(var_224_12.content)
			local var_224_14, var_224_15 = arg_221_1:GetPercentByPara(var_224_13, 1)

			if var_224_9 < arg_221_1.time_ and arg_221_1.time_ <= var_224_9 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				local var_224_16 = var_224_10 <= 0 and var_224_11 or var_224_11 * ((var_224_15 - arg_221_1.typewritterCharCountI18N) / var_224_10)

				if var_224_16 > 0 and var_224_11 < var_224_16 then
					arg_221_1.talkMaxDuration = var_224_16

					if var_224_16 + var_224_9 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_16 + var_224_9
					end
				end
			end

			local var_224_17 = 0
			local var_224_18 = math.max(var_224_17, arg_221_1.talkMaxDuration)

			if var_224_9 <= arg_221_1.time_ and arg_221_1.time_ < var_224_9 + var_224_18 then
				local var_224_19 = (arg_221_1.time_ - var_224_9) / var_224_18

				arg_221_1.fswtw_.percent = Mathf.Lerp(arg_221_1.var_.oldValueTypewriter, var_224_14, var_224_19)
				arg_221_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_221_1.fswtw_:SetDirty()
			end

			if arg_221_1.time_ >= var_224_9 + var_224_18 and arg_221_1.time_ < var_224_9 + var_224_18 + arg_224_0 then
				arg_221_1.fswtw_.percent = var_224_14

				arg_221_1.fswtw_:SetDirty()
				arg_221_1:ShowNextGo(true)

				arg_221_1.typewritterCharCountI18N = var_224_15
			end

			local var_224_20 = 0.15

			if var_224_20 < arg_221_1.time_ and arg_221_1.time_ <= var_224_20 + arg_224_0 then
				arg_221_1.var_.oldValueTypewriter = arg_221_1.fswtw_.percent

				arg_221_1:ShowNextGo(false)
			end

			local var_224_21 = 24
			local var_224_22 = 1.6
			local var_224_23 = arg_221_1:GetWordFromCfg(319741055)
			local var_224_24 = arg_221_1:FormatText(var_224_23.content)
			local var_224_25, var_224_26 = arg_221_1:GetPercentByPara(var_224_24, 1)

			if var_224_20 < arg_221_1.time_ and arg_221_1.time_ <= var_224_20 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				local var_224_27 = var_224_21 <= 0 and var_224_22 or var_224_22 * ((var_224_26 - arg_221_1.typewritterCharCountI18N) / var_224_21)

				if var_224_27 > 0 and var_224_22 < var_224_27 then
					arg_221_1.talkMaxDuration = var_224_27

					if var_224_27 + var_224_20 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_27 + var_224_20
					end
				end
			end

			local var_224_28 = 1.6
			local var_224_29 = math.max(var_224_28, arg_221_1.talkMaxDuration)

			if var_224_20 <= arg_221_1.time_ and arg_221_1.time_ < var_224_20 + var_224_29 then
				local var_224_30 = (arg_221_1.time_ - var_224_20) / var_224_29

				arg_221_1.fswtw_.percent = Mathf.Lerp(arg_221_1.var_.oldValueTypewriter, var_224_25, var_224_30)
				arg_221_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_221_1.fswtw_:SetDirty()
			end

			if arg_221_1.time_ >= var_224_20 + var_224_29 and arg_221_1.time_ < var_224_20 + var_224_29 + arg_224_0 then
				arg_221_1.fswtw_.percent = var_224_25

				arg_221_1.fswtw_:SetDirty()
				arg_221_1:ShowNextGo(true)

				arg_221_1.typewritterCharCountI18N = var_224_26
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11m",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319741.awb"
	}
}