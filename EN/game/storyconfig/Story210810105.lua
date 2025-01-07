﻿return {
	Play1108105001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1108105001
		arg_1_1.duration_ = 7.03

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1108105002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_1 = 2.03333333333333

			if var_4_0 <= arg_1_1.time_ and arg_1_1.time_ < var_4_0 + var_4_1 then
				local var_4_2 = (arg_1_1.time_ - var_4_0) / var_4_1
				local var_4_3 = Color.New(0, 0, 0)

				var_4_3.a = Mathf.Lerp(1, 0, var_4_2)
				arg_1_1.mask_.color = var_4_3
			end

			if arg_1_1.time_ >= var_4_0 + var_4_1 and arg_1_1.time_ < var_4_0 + var_4_1 + arg_4_0 then
				local var_4_4 = Color.New(0, 0, 0)
				local var_4_5 = 0

				arg_1_1.mask_.enabled = false
				var_4_4.a = var_4_5
				arg_1_1.mask_.color = var_4_4
			end

			local var_4_6 = "ST0403"

			if arg_1_1.bgs_[var_4_6] == nil then
				local var_4_7 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_6)
				var_4_7.name = var_4_6
				var_4_7.transform.parent = arg_1_1.stage_.transform
				var_4_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_6] = var_4_7
			end

			local var_4_8 = 0

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_9 = manager.ui.mainCamera.transform.localPosition
				local var_4_10 = Vector3.New(0, 0, 10) + Vector3.New(var_4_9.x, var_4_9.y, 0)
				local var_4_11 = arg_1_1.bgs_.ST0403

				var_4_11.transform.localPosition = var_4_10
				var_4_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_12 = var_4_11:GetComponent("SpriteRenderer")

				if var_4_12 and var_4_12.sprite then
					local var_4_13 = (var_4_11.transform.localPosition - var_4_9).z
					local var_4_14 = manager.ui.mainCameraCom_
					local var_4_15 = 2 * var_4_13 * Mathf.Tan(var_4_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_16 = var_4_15 * var_4_14.aspect
					local var_4_17 = var_4_12.sprite.bounds.size.x
					local var_4_18 = var_4_12.sprite.bounds.size.y
					local var_4_19 = var_4_16 / var_4_17
					local var_4_20 = var_4_15 / var_4_18
					local var_4_21 = var_4_20 < var_4_19 and var_4_19 or var_4_20

					var_4_11.transform.localScale = Vector3.New(var_4_21, var_4_21, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "ST0403" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_22 = 0
			local var_4_23 = 0.166666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_26 = ""
				local var_4_27 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_27 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_27 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_27

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_27
					end

					if arg_1_1.bgmTimer then
						arg_1_1.bgmTimer:Stop()

						arg_1_1.bgmTimer = nil
					end

					if arg_1_1.settingData.show_music_name == 1 then
						arg_1_1.musicController:SetSelectedState("show")
						arg_1_1.musicAnimator_:Play("open", 0, 0)

						if arg_1_1.settingData.music_time ~= 0 then
							arg_1_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_1_1.settingData.music_time), function()
								if arg_1_1 == nil or isNil(arg_1_1.bgmTxt_) then
									return
								end

								arg_1_1.musicController:SetSelectedState("hide")
								arg_1_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_4_28 = 0.166666666666667
			local var_4_29 = 0.166666666666667

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "effect"

				arg_1_1:AudioAction(var_4_30, var_4_31, "se_story", "se_story_communication", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 2.03333333333333
			local var_4_33 = 0.3

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_35 = arg_1_1:GetWordFromCfg(1108105001)
				local var_4_36 = arg_1_1:FormatText(var_4_35.content)

				arg_1_1.text_.text = var_4_36

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_37 = 15
				local var_4_38 = utf8.len(var_4_36)
				local var_4_39 = var_4_37 <= 0 and var_4_33 or var_4_33 * (var_4_38 / var_4_37)

				if var_4_39 > 0 and var_4_33 < var_4_39 then
					arg_1_1.talkMaxDuration = var_4_39
					var_4_32 = var_4_32 + 0.3

					if var_4_39 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_36
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_40 = var_4_32 + 0.3
			local var_4_41 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_40 <= arg_1_1.time_ and arg_1_1.time_ < var_4_40 + var_4_41 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_40) / var_4_41

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 1108105002
		arg_8_1.duration_ = 5

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play1108105003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = 0
			local var_11_1 = 1

			if var_11_0 < arg_8_1.time_ and arg_8_1.time_ <= var_11_0 + arg_11_0 then
				local var_11_2 = "play"
				local var_11_3 = "music"

				arg_8_1:AudioAction(var_11_2, var_11_3, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")

				local var_11_4 = ""
				local var_11_5 = manager.audio:GetAudioName("bgm_side_daily03", "bgm_side_daily03")

				if var_11_5 ~= "" then
					if arg_8_1.bgmTxt_.text ~= var_11_5 and arg_8_1.bgmTxt_.text ~= "" then
						if arg_8_1.bgmTxt2_.text ~= "" then
							arg_8_1.bgmTxt_.text = arg_8_1.bgmTxt2_.text
						end

						arg_8_1.bgmTxt2_.text = var_11_5

						arg_8_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_8_1.bgmTxt_.text = var_11_5
					end

					if arg_8_1.bgmTimer then
						arg_8_1.bgmTimer:Stop()

						arg_8_1.bgmTimer = nil
					end

					if arg_8_1.settingData.show_music_name == 1 then
						arg_8_1.musicController:SetSelectedState("show")
						arg_8_1.musicAnimator_:Play("open", 0, 0)

						if arg_8_1.settingData.music_time ~= 0 then
							arg_8_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_8_1.settingData.music_time), function()
								if arg_8_1 == nil or isNil(arg_8_1.bgmTxt_) then
									return
								end

								arg_8_1.musicController:SetSelectedState("hide")
								arg_8_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_11_6 = 0
			local var_11_7 = 1.275

			if var_11_6 < arg_8_1.time_ and arg_8_1.time_ <= var_11_6 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, false)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_8 = arg_8_1:GetWordFromCfg(1108105002)
				local var_11_9 = arg_8_1:FormatText(var_11_8.content)

				arg_8_1.text_.text = var_11_9

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_10 = 51
				local var_11_11 = utf8.len(var_11_9)
				local var_11_12 = var_11_10 <= 0 and var_11_7 or var_11_7 * (var_11_11 / var_11_10)

				if var_11_12 > 0 and var_11_7 < var_11_12 then
					arg_8_1.talkMaxDuration = var_11_12

					if var_11_12 + var_11_6 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_12 + var_11_6
					end
				end

				arg_8_1.text_.text = var_11_9
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)
				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_13 = math.max(var_11_7, arg_8_1.talkMaxDuration)

			if var_11_6 <= arg_8_1.time_ and arg_8_1.time_ < var_11_6 + var_11_13 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_6) / var_11_13

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_6 + var_11_13 and arg_8_1.time_ < var_11_6 + var_11_13 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 1108105003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play1108105004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = "1081ui_story"

			if arg_13_1.actors_[var_16_0] == nil then
				local var_16_1 = Object.Instantiate(Asset.Load("Char/" .. var_16_0), arg_13_1.stage_.transform)

				var_16_1.name = var_16_0
				var_16_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.actors_[var_16_0] = var_16_1

				local var_16_2 = var_16_1:GetComponentInChildren(typeof(CharacterEffect))

				var_16_2.enabled = true

				local var_16_3 = GameObjectTools.GetOrAddComponent(var_16_1, typeof(DynamicBoneHelper))

				if var_16_3 then
					var_16_3:EnableDynamicBone(false)
				end

				arg_13_1:ShowWeapon(var_16_2.transform, false)

				arg_13_1.var_[var_16_0 .. "Animator"] = var_16_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_13_1.var_[var_16_0 .. "Animator"].applyRootMotion = true
				arg_13_1.var_[var_16_0 .. "LipSync"] = var_16_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_16_4 = arg_13_1.actors_["1081ui_story"].transform
			local var_16_5 = 0

			if var_16_5 < arg_13_1.time_ and arg_13_1.time_ <= var_16_5 + arg_16_0 then
				arg_13_1.var_.moveOldPos1081ui_story = var_16_4.localPosition

				local var_16_6 = "1081ui_story"

				arg_13_1:ShowWeapon(arg_13_1.var_[var_16_6 .. "Animator"].transform, false)
			end

			local var_16_7 = 0.001

			if var_16_5 <= arg_13_1.time_ and arg_13_1.time_ < var_16_5 + var_16_7 then
				local var_16_8 = (arg_13_1.time_ - var_16_5) / var_16_7
				local var_16_9 = Vector3.New(0, -0.92, -5.8)

				var_16_4.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1081ui_story, var_16_9, var_16_8)

				local var_16_10 = manager.ui.mainCamera.transform.position - var_16_4.position

				var_16_4.forward = Vector3.New(var_16_10.x, var_16_10.y, var_16_10.z)

				local var_16_11 = var_16_4.localEulerAngles

				var_16_11.z = 0
				var_16_11.x = 0
				var_16_4.localEulerAngles = var_16_11
			end

			if arg_13_1.time_ >= var_16_5 + var_16_7 and arg_13_1.time_ < var_16_5 + var_16_7 + arg_16_0 then
				var_16_4.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_16_12 = manager.ui.mainCamera.transform.position - var_16_4.position

				var_16_4.forward = Vector3.New(var_16_12.x, var_16_12.y, var_16_12.z)

				local var_16_13 = var_16_4.localEulerAngles

				var_16_13.z = 0
				var_16_13.x = 0
				var_16_4.localEulerAngles = var_16_13
			end

			local var_16_14 = arg_13_1.actors_["1081ui_story"]
			local var_16_15 = 0

			if var_16_15 < arg_13_1.time_ and arg_13_1.time_ <= var_16_15 + arg_16_0 and arg_13_1.var_.characterEffect1081ui_story == nil then
				arg_13_1.var_.characterEffect1081ui_story = var_16_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_16 = 0.200000002980232

			if var_16_15 <= arg_13_1.time_ and arg_13_1.time_ < var_16_15 + var_16_16 then
				local var_16_17 = (arg_13_1.time_ - var_16_15) / var_16_16

				if arg_13_1.var_.characterEffect1081ui_story then
					arg_13_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_15 + var_16_16 and arg_13_1.time_ < var_16_15 + var_16_16 + arg_16_0 and arg_13_1.var_.characterEffect1081ui_story then
				arg_13_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_16_18 = 0

			if var_16_18 < arg_13_1.time_ and arg_13_1.time_ <= var_16_18 + arg_16_0 then
				arg_13_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_16_19 = 0

			if var_16_19 < arg_13_1.time_ and arg_13_1.time_ <= var_16_19 + arg_16_0 then
				arg_13_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_16_20 = arg_13_1.actors_["1081ui_story"]
			local var_16_21 = 0

			if var_16_21 < arg_13_1.time_ and arg_13_1.time_ <= var_16_21 + arg_16_0 then
				if arg_13_1.var_.characterEffect1081ui_story == nil then
					arg_13_1.var_.characterEffect1081ui_story = var_16_20:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_16_22 = arg_13_1.var_.characterEffect1081ui_story

				var_16_22.imageEffect:turnOff()

				var_16_22.interferenceEffect.enabled = true
				var_16_22.interferenceEffect.noise = 0.001
				var_16_22.interferenceEffect.simTimeScale = 1
				var_16_22.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_16_23 = arg_13_1.actors_["1081ui_story"]
			local var_16_24 = 0
			local var_16_25 = 5

			if var_16_24 < arg_13_1.time_ and arg_13_1.time_ <= var_16_24 + arg_16_0 then
				if arg_13_1.var_.characterEffect1081ui_story == nil then
					arg_13_1.var_.characterEffect1081ui_story = var_16_23:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_13_1.var_.characterEffect1081ui_story.imageEffect:turnOn(false)
			end

			local var_16_26 = 0
			local var_16_27 = 0.65

			if var_16_26 < arg_13_1.time_ and arg_13_1.time_ <= var_16_26 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_28 = arg_13_1:FormatText(StoryNameCfg[202].name)

				arg_13_1.leftNameTxt_.text = var_16_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_29 = arg_13_1:GetWordFromCfg(1108105003)
				local var_16_30 = arg_13_1:FormatText(var_16_29.content)

				arg_13_1.text_.text = var_16_30

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_31 = 26
				local var_16_32 = utf8.len(var_16_30)
				local var_16_33 = var_16_31 <= 0 and var_16_27 or var_16_27 * (var_16_32 / var_16_31)

				if var_16_33 > 0 and var_16_27 < var_16_33 then
					arg_13_1.talkMaxDuration = var_16_33

					if var_16_33 + var_16_26 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_33 + var_16_26
					end
				end

				arg_13_1.text_.text = var_16_30
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_34 = math.max(var_16_27, arg_13_1.talkMaxDuration)

			if var_16_26 <= arg_13_1.time_ and arg_13_1.time_ < var_16_26 + var_16_34 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_26) / var_16_34

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_26 + var_16_34 and arg_13_1.time_ < var_16_26 + var_16_34 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 1108105004
		arg_17_1.duration_ = 1

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"

			SetActive(arg_17_1.choicesGo_, true)

			for iter_18_0, iter_18_1 in ipairs(arg_17_1.choices_) do
				local var_18_0 = iter_18_0 <= 2

				SetActive(iter_18_1.go, var_18_0)
			end

			arg_17_1.choices_[1].txt.text = arg_17_1:FormatText(StoryChoiceCfg[965].name)
			arg_17_1.choices_[2].txt.text = arg_17_1:FormatText(StoryChoiceCfg[966].name)
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play1108105005(arg_17_1)
			end

			if arg_19_0 == 2 then
				arg_17_0:Play1108105006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1081ui_story"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 and arg_17_1.var_.characterEffect1081ui_story == nil then
				arg_17_1.var_.characterEffect1081ui_story = var_20_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_2 = 0.200000002980232

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2

				if arg_17_1.var_.characterEffect1081ui_story then
					local var_20_4 = Mathf.Lerp(0, 0.5, var_20_3)

					arg_17_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_17_1.var_.characterEffect1081ui_story.fillRatio = var_20_4
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 and arg_17_1.var_.characterEffect1081ui_story then
				local var_20_5 = 0.5

				arg_17_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_17_1.var_.characterEffect1081ui_story.fillRatio = var_20_5
			end
		end
	end,
	Play1108105005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 1108105005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play1108105007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_24_2 = arg_21_1.actors_["1081ui_story"]
			local var_24_3 = 0

			if var_24_3 < arg_21_1.time_ and arg_21_1.time_ <= var_24_3 + arg_24_0 and arg_21_1.var_.characterEffect1081ui_story == nil then
				arg_21_1.var_.characterEffect1081ui_story = var_24_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_4 = 0.200000002980232

			if var_24_3 <= arg_21_1.time_ and arg_21_1.time_ < var_24_3 + var_24_4 then
				local var_24_5 = (arg_21_1.time_ - var_24_3) / var_24_4

				if arg_21_1.var_.characterEffect1081ui_story then
					arg_21_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_3 + var_24_4 and arg_21_1.time_ < var_24_3 + var_24_4 + arg_24_0 and arg_21_1.var_.characterEffect1081ui_story then
				arg_21_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_24_6 = 0
			local var_24_7 = 0.45

			if var_24_6 < arg_21_1.time_ and arg_21_1.time_ <= var_24_6 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				arg_21_1.dialog_:SetActive(true)

				local var_24_8 = LeanTween.value(arg_21_1.dialog_, 0, 1, 0.3)

				var_24_8:setOnUpdate(LuaHelper.FloatAction(function(arg_25_0)
					arg_21_1.dialogCg_.alpha = arg_25_0
				end))
				var_24_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_21_1.dialog_)
					var_24_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_21_1.duration_ = arg_21_1.duration_ + 0.3

				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_9 = arg_21_1:FormatText(StoryNameCfg[202].name)

				arg_21_1.leftNameTxt_.text = var_24_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_10 = arg_21_1:GetWordFromCfg(1108105005)
				local var_24_11 = arg_21_1:FormatText(var_24_10.content)

				arg_21_1.text_.text = var_24_11

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_12 = 18
				local var_24_13 = utf8.len(var_24_11)
				local var_24_14 = var_24_12 <= 0 and var_24_7 or var_24_7 * (var_24_13 / var_24_12)

				if var_24_14 > 0 and var_24_7 < var_24_14 then
					arg_21_1.talkMaxDuration = var_24_14
					var_24_6 = var_24_6 + 0.3

					if var_24_14 + var_24_6 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_14 + var_24_6
					end
				end

				arg_21_1.text_.text = var_24_11
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_15 = var_24_6 + 0.3
			local var_24_16 = math.max(var_24_7, arg_21_1.talkMaxDuration)

			if var_24_15 <= arg_21_1.time_ and arg_21_1.time_ < var_24_15 + var_24_16 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_15) / var_24_16

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_15 + var_24_16 and arg_21_1.time_ < var_24_15 + var_24_16 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1108105007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play1108105008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_30_2 = arg_27_1.actors_["1081ui_story"]
			local var_30_3 = 0

			if var_30_3 < arg_27_1.time_ and arg_27_1.time_ <= var_30_3 + arg_30_0 and arg_27_1.var_.characterEffect1081ui_story == nil then
				arg_27_1.var_.characterEffect1081ui_story = var_30_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_4 = 0.0166666666666667

			if var_30_3 <= arg_27_1.time_ and arg_27_1.time_ < var_30_3 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_3) / var_30_4

				if arg_27_1.var_.characterEffect1081ui_story then
					local var_30_6 = Mathf.Lerp(0, 0.5, var_30_5)

					arg_27_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1081ui_story.fillRatio = var_30_6
				end
			end

			if arg_27_1.time_ >= var_30_3 + var_30_4 and arg_27_1.time_ < var_30_3 + var_30_4 + arg_30_0 and arg_27_1.var_.characterEffect1081ui_story then
				local var_30_7 = 0.5

				arg_27_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1081ui_story.fillRatio = var_30_7
			end

			local var_30_8 = arg_27_1.actors_["1081ui_story"]
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 and arg_27_1.var_.characterEffect1081ui_story == nil then
				arg_27_1.var_.characterEffect1081ui_story = var_30_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_10 = 0.200000002980232

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10

				if arg_27_1.var_.characterEffect1081ui_story then
					local var_30_12 = Mathf.Lerp(0, 0.5, var_30_11)

					arg_27_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1081ui_story.fillRatio = var_30_12
				end
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1081ui_story then
				local var_30_13 = 0.5

				arg_27_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1081ui_story.fillRatio = var_30_13
			end

			local var_30_14 = 0
			local var_30_15 = 0.95

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_16 = arg_27_1:FormatText(StoryNameCfg[7].name)

				arg_27_1.leftNameTxt_.text = var_30_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(1108105007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 38
				local var_30_20 = utf8.len(var_30_18)
				local var_30_21 = var_30_19 <= 0 and var_30_15 or var_30_15 * (var_30_20 / var_30_19)

				if var_30_21 > 0 and var_30_15 < var_30_21 then
					arg_27_1.talkMaxDuration = var_30_21

					if var_30_21 + var_30_14 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_14
					end
				end

				arg_27_1.text_.text = var_30_18
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_15, arg_27_1.talkMaxDuration)

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_14) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_14 + var_30_22 and arg_27_1.time_ < var_30_14 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1108105008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1108105009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1081ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1081ui_story == nil then
				arg_31_1.var_.characterEffect1081ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1081ui_story then
					arg_31_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1081ui_story then
				arg_31_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_34_4 = 0.034000001847744

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action2_1")
			end

			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_34_6 = 0
			local var_34_7 = 0.875

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[202].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(1108105008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 35
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_14 and arg_31_1.time_ < var_34_6 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1108105009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play1108105010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1081ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1081ui_story == nil then
				arg_35_1.var_.characterEffect1081ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.0166666666666667

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1081ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1081ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1081ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1081ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["1081ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect1081ui_story == nil then
				arg_35_1.var_.characterEffect1081ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.200000002980232

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect1081ui_story then
					local var_38_10 = Mathf.Lerp(0, 0.5, var_38_9)

					arg_35_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1081ui_story.fillRatio = var_38_10
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect1081ui_story then
				local var_38_11 = 0.5

				arg_35_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1081ui_story.fillRatio = var_38_11
			end

			local var_38_12 = 0
			local var_38_13 = 0.525

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_14 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(1108105009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 21
				local var_38_18 = utf8.len(var_38_16)
				local var_38_19 = var_38_17 <= 0 and var_38_13 or var_38_13 * (var_38_18 / var_38_17)

				if var_38_19 > 0 and var_38_13 < var_38_19 then
					arg_35_1.talkMaxDuration = var_38_19

					if var_38_19 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_12
					end
				end

				arg_35_1.text_.text = var_38_16
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_13, arg_35_1.talkMaxDuration)

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_12) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_12 + var_38_20 and arg_35_1.time_ < var_38_12 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1108105010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1108105011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1081ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1081ui_story == nil then
				arg_39_1.var_.characterEffect1081ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1081ui_story then
					arg_39_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1081ui_story then
				arg_39_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action2_2")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_42_6 = 0
			local var_42_7 = 0.225

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[202].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(1108105010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 9
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
	Play1108105011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1108105011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1108105012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1081ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1081ui_story == nil then
				arg_43_1.var_.characterEffect1081ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1081ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1081ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1081ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1081ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.925

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(1108105011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 37
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_14 and arg_43_1.time_ < var_46_6 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1108105012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play1108105013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1081ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1081ui_story == nil then
				arg_47_1.var_.characterEffect1081ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.078245498239994

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1081ui_story then
					arg_47_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1081ui_story then
				arg_47_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action6_1")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_50_6 = 0
			local var_50_7 = 0.925

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[202].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(1108105012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 37
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_14 and arg_47_1.time_ < var_50_6 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1108105013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1108105014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action6_2")
			end

			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_2 = 0
			local var_54_3 = 0.675

			if var_54_2 < arg_51_1.time_ and arg_51_1.time_ <= var_54_2 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_4 = arg_51_1:FormatText(StoryNameCfg[202].name)

				arg_51_1.leftNameTxt_.text = var_54_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_5 = arg_51_1:GetWordFromCfg(1108105013)
				local var_54_6 = arg_51_1:FormatText(var_54_5.content)

				arg_51_1.text_.text = var_54_6

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_7 = 27
				local var_54_8 = utf8.len(var_54_6)
				local var_54_9 = var_54_7 <= 0 and var_54_3 or var_54_3 * (var_54_8 / var_54_7)

				if var_54_9 > 0 and var_54_3 < var_54_9 then
					arg_51_1.talkMaxDuration = var_54_9

					if var_54_9 + var_54_2 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_2
					end
				end

				arg_51_1.text_.text = var_54_6
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_3, arg_51_1.talkMaxDuration)

			if var_54_2 <= arg_51_1.time_ and arg_51_1.time_ < var_54_2 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_2) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_2 + var_54_10 and arg_51_1.time_ < var_54_2 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1108105014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play1108105015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.7

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[202].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(1108105014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 28
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_8 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_8

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_8 and arg_55_1.time_ < var_58_0 + var_58_8 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1108105015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play1108105016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1081ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1081ui_story == nil then
				arg_59_1.var_.characterEffect1081ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1081ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1081ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1081ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1081ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.55

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(1108105015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 22
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_14 and arg_59_1.time_ < var_62_6 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1108105016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1108105017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.55

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[7].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(1108105016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 22
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_8 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_8 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_8

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_8 and arg_63_1.time_ < var_66_0 + var_66_8 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1108105017
		arg_67_1.duration_ = 6

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play1108105018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1081ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1081ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, 100, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1081ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, 100, 0)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = manager.ui.mainCamera.transform
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1.var_.shakeOldPos = var_70_9.localPosition
			end

			local var_70_11 = 0.666666666666667

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / 0.066
				local var_70_13, var_70_14 = math.modf(var_70_12)

				var_70_9.localPosition = Vector3.New(var_70_14 * 0.13, var_70_14 * 0.13, var_70_14 * 0.13) + arg_67_1.var_.shakeOldPos
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 then
				var_70_9.localPosition = arg_67_1.var_.shakeOldPos
			end

			local var_70_15 = 0
			local var_70_16 = 0.166666666666667

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				local var_70_17 = "play"
				local var_70_18 = "effect"

				arg_67_1:AudioAction(var_70_17, var_70_18, "se_story_side_1081", "se_story_side_1081_phoneimpact", "")
			end

			local var_70_19 = 0

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.allBtn_.enabled = false
			end

			local var_70_20 = 0.666666666666667

			if arg_67_1.time_ >= var_70_19 + var_70_20 and arg_67_1.time_ < var_70_19 + var_70_20 + arg_70_0 then
				arg_67_1.allBtn_.enabled = true
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_21 = 1
			local var_70_22 = 1.075

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_23 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_23:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_24 = arg_67_1:GetWordFromCfg(1108105017)
				local var_70_25 = arg_67_1:FormatText(var_70_24.content)

				arg_67_1.text_.text = var_70_25

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_26 = 43
				local var_70_27 = utf8.len(var_70_25)
				local var_70_28 = var_70_26 <= 0 and var_70_22 or var_70_22 * (var_70_27 / var_70_26)

				if var_70_28 > 0 and var_70_22 < var_70_28 then
					arg_67_1.talkMaxDuration = var_70_28
					var_70_21 = var_70_21 + 0.3

					if var_70_28 + var_70_21 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_28 + var_70_21
					end
				end

				arg_67_1.text_.text = var_70_25
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = var_70_21 + 0.3
			local var_70_30 = math.max(var_70_22, arg_67_1.talkMaxDuration)

			if var_70_29 <= arg_67_1.time_ and arg_67_1.time_ < var_70_29 + var_70_30 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_29) / var_70_30

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_29 + var_70_30 and arg_67_1.time_ < var_70_29 + var_70_30 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1108105018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play1108105019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.4

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(1108105018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 16
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_8 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_8 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_8

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_8 and arg_73_1.time_ < var_76_0 + var_76_8 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1108105019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1108105020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1081ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1081ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, -0.92, -5.8)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1081ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1081ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect1081ui_story == nil then
				arg_77_1.var_.characterEffect1081ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect1081ui_story then
					arg_77_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect1081ui_story then
				arg_77_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_15 = 0
			local var_80_16 = 0.55

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[202].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(1108105019)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 22
				local var_80_21 = utf8.len(var_80_19)
				local var_80_22 = var_80_20 <= 0 and var_80_16 or var_80_16 * (var_80_21 / var_80_20)

				if var_80_22 > 0 and var_80_16 < var_80_22 then
					arg_77_1.talkMaxDuration = var_80_22

					if var_80_22 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_22 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_19
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_23 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_23 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_23

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_23 and arg_77_1.time_ < var_80_15 + var_80_23 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1108105020
		arg_81_1.duration_ = 9.07

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1108105021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 2.03333333333333

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				local var_84_1 = manager.ui.mainCamera.transform.localPosition
				local var_84_2 = Vector3.New(0, 0, 10) + Vector3.New(var_84_1.x, var_84_1.y, 0)
				local var_84_3 = arg_81_1.bgs_.ST0403

				var_84_3.transform.localPosition = var_84_2
				var_84_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_84_4 = var_84_3:GetComponent("SpriteRenderer")

				if var_84_4 and var_84_4.sprite then
					local var_84_5 = (var_84_3.transform.localPosition - var_84_1).z
					local var_84_6 = manager.ui.mainCameraCom_
					local var_84_7 = 2 * var_84_5 * Mathf.Tan(var_84_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_84_8 = var_84_7 * var_84_6.aspect
					local var_84_9 = var_84_4.sprite.bounds.size.x
					local var_84_10 = var_84_4.sprite.bounds.size.y
					local var_84_11 = var_84_8 / var_84_9
					local var_84_12 = var_84_7 / var_84_10
					local var_84_13 = var_84_12 < var_84_11 and var_84_11 or var_84_12

					var_84_3.transform.localScale = Vector3.New(var_84_13, var_84_13, 0)
				end

				for iter_84_0, iter_84_1 in pairs(arg_81_1.bgs_) do
					if iter_84_0 ~= "ST0403" then
						iter_84_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_84_14 = 4.06733333518108

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 then
				arg_81_1.allBtn_.enabled = false
			end

			local var_84_15 = 0.3

			if arg_81_1.time_ >= var_84_14 + var_84_15 and arg_81_1.time_ < var_84_14 + var_84_15 + arg_84_0 then
				arg_81_1.allBtn_.enabled = true
			end

			local var_84_16 = 0

			if var_84_16 < arg_81_1.time_ and arg_81_1.time_ <= var_84_16 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_17 = 2.03333333333333

			if var_84_16 <= arg_81_1.time_ and arg_81_1.time_ < var_84_16 + var_84_17 then
				local var_84_18 = (arg_81_1.time_ - var_84_16) / var_84_17
				local var_84_19 = Color.New(0, 0, 0)

				var_84_19.a = Mathf.Lerp(0, 1, var_84_18)
				arg_81_1.mask_.color = var_84_19
			end

			if arg_81_1.time_ >= var_84_16 + var_84_17 and arg_81_1.time_ < var_84_16 + var_84_17 + arg_84_0 then
				local var_84_20 = Color.New(0, 0, 0)

				var_84_20.a = 1
				arg_81_1.mask_.color = var_84_20
			end

			local var_84_21 = 2.03333333333333

			if var_84_21 < arg_81_1.time_ and arg_81_1.time_ <= var_84_21 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_22 = 2.03400000184774

			if var_84_21 <= arg_81_1.time_ and arg_81_1.time_ < var_84_21 + var_84_22 then
				local var_84_23 = (arg_81_1.time_ - var_84_21) / var_84_22
				local var_84_24 = Color.New(0, 0, 0)

				var_84_24.a = Mathf.Lerp(1, 0, var_84_23)
				arg_81_1.mask_.color = var_84_24
			end

			if arg_81_1.time_ >= var_84_21 + var_84_22 and arg_81_1.time_ < var_84_21 + var_84_22 + arg_84_0 then
				local var_84_25 = Color.New(0, 0, 0)
				local var_84_26 = 0

				arg_81_1.mask_.enabled = false
				var_84_25.a = var_84_26
				arg_81_1.mask_.color = var_84_25
			end

			local var_84_27 = arg_81_1.actors_["1081ui_story"].transform
			local var_84_28 = 2.03333333333408

			if var_84_28 < arg_81_1.time_ and arg_81_1.time_ <= var_84_28 + arg_84_0 then
				arg_81_1.var_.moveOldPos1081ui_story = var_84_27.localPosition
			end

			local var_84_29 = 0.001

			if var_84_28 <= arg_81_1.time_ and arg_81_1.time_ < var_84_28 + var_84_29 then
				local var_84_30 = (arg_81_1.time_ - var_84_28) / var_84_29
				local var_84_31 = Vector3.New(0, 100, 0)

				var_84_27.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1081ui_story, var_84_31, var_84_30)

				local var_84_32 = manager.ui.mainCamera.transform.position - var_84_27.position

				var_84_27.forward = Vector3.New(var_84_32.x, var_84_32.y, var_84_32.z)

				local var_84_33 = var_84_27.localEulerAngles

				var_84_33.z = 0
				var_84_33.x = 0
				var_84_27.localEulerAngles = var_84_33
			end

			if arg_81_1.time_ >= var_84_28 + var_84_29 and arg_81_1.time_ < var_84_28 + var_84_29 + arg_84_0 then
				var_84_27.localPosition = Vector3.New(0, 100, 0)

				local var_84_34 = manager.ui.mainCamera.transform.position - var_84_27.position

				var_84_27.forward = Vector3.New(var_84_34.x, var_84_34.y, var_84_34.z)

				local var_84_35 = var_84_27.localEulerAngles

				var_84_35.z = 0
				var_84_35.x = 0
				var_84_27.localEulerAngles = var_84_35
			end

			local var_84_36 = arg_81_1.actors_["1081ui_story"]
			local var_84_37 = 2.03333333333333
			local var_84_38 = 0.466666666666667

			if var_84_37 < arg_81_1.time_ and arg_81_1.time_ <= var_84_37 + arg_84_0 then
				if arg_81_1.var_.characterEffect1081ui_story == nil then
					arg_81_1.var_.characterEffect1081ui_story = var_84_36:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_81_1.var_.characterEffect1081ui_story.imageEffect:turnOff()
			end

			local var_84_39 = arg_81_1.actors_["1081ui_story"]
			local var_84_40 = 2.03333333333333

			if var_84_40 < arg_81_1.time_ and arg_81_1.time_ <= var_84_40 + arg_84_0 then
				if arg_81_1.var_.characterEffect1081ui_story == nil then
					arg_81_1.var_.characterEffect1081ui_story = var_84_39:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_84_41 = arg_81_1.var_.characterEffect1081ui_story

				var_84_41.imageEffect:turnOff()

				var_84_41.interferenceEffect.enabled = false
				var_84_41.interferenceEffect.noise = 0.001
				var_84_41.interferenceEffect.simTimeScale = 1
				var_84_41.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			if arg_81_1.frameCnt_ <= 1 then
				arg_81_1.dialog_:SetActive(false)
			end

			local var_84_42 = 4.06733333518108
			local var_84_43 = 1.03400000184774

			if var_84_42 < arg_81_1.time_ and arg_81_1.time_ <= var_84_42 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				arg_81_1.dialog_:SetActive(true)

				local var_84_44 = LeanTween.value(arg_81_1.dialog_, 0, 1, 0.3)

				var_84_44:setOnUpdate(LuaHelper.FloatAction(function(arg_85_0)
					arg_81_1.dialogCg_.alpha = arg_85_0
				end))
				var_84_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_81_1.dialog_)
					var_84_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_81_1.duration_ = arg_81_1.duration_ + 0.3

				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_45 = arg_81_1:GetWordFromCfg(1108105020)
				local var_84_46 = arg_81_1:FormatText(var_84_45.content)

				arg_81_1.text_.text = var_84_46

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_47 = 53
				local var_84_48 = utf8.len(var_84_46)
				local var_84_49 = var_84_47 <= 0 and var_84_43 or var_84_43 * (var_84_48 / var_84_47)

				if var_84_49 > 0 and var_84_43 < var_84_49 then
					arg_81_1.talkMaxDuration = var_84_49
					var_84_42 = var_84_42 + 0.3

					if var_84_49 + var_84_42 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_49 + var_84_42
					end
				end

				arg_81_1.text_.text = var_84_46
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_50 = var_84_42 + 0.3
			local var_84_51 = math.max(var_84_43, arg_81_1.talkMaxDuration)

			if var_84_50 <= arg_81_1.time_ and arg_81_1.time_ < var_84_50 + var_84_51 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_50) / var_84_51

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_50 + var_84_51 and arg_81_1.time_ < var_84_50 + var_84_51 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 1108105021
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play1108105022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.025

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_2 = arg_87_1:GetWordFromCfg(1108105021)
				local var_90_3 = arg_87_1:FormatText(var_90_2.content)

				arg_87_1.text_.text = var_90_3

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_4 = 41
				local var_90_5 = utf8.len(var_90_3)
				local var_90_6 = var_90_4 <= 0 and var_90_1 or var_90_1 * (var_90_5 / var_90_4)

				if var_90_6 > 0 and var_90_1 < var_90_6 then
					arg_87_1.talkMaxDuration = var_90_6

					if var_90_6 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_6 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_3
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_7 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_7 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_7

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_7 and arg_87_1.time_ < var_90_0 + var_90_7 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 1108105022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play1108105023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "1080ui_story"

			if arg_91_1.actors_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(Asset.Load("Char/" .. var_94_0), arg_91_1.stage_.transform)

				var_94_1.name = var_94_0
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.actors_[var_94_0] = var_94_1

				local var_94_2 = var_94_1:GetComponentInChildren(typeof(CharacterEffect))

				var_94_2.enabled = true

				local var_94_3 = GameObjectTools.GetOrAddComponent(var_94_1, typeof(DynamicBoneHelper))

				if var_94_3 then
					var_94_3:EnableDynamicBone(false)
				end

				arg_91_1:ShowWeapon(var_94_2.transform, false)

				arg_91_1.var_[var_94_0 .. "Animator"] = var_94_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_91_1.var_[var_94_0 .. "Animator"].applyRootMotion = true
				arg_91_1.var_[var_94_0 .. "LipSync"] = var_94_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_94_4 = arg_91_1.actors_["1080ui_story"].transform
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.var_.moveOldPos1080ui_story = var_94_4.localPosition

				local var_94_6 = "1080ui_story"

				arg_91_1:ShowWeapon(arg_91_1.var_[var_94_6 .. "Animator"].transform, false)
			end

			local var_94_7 = 0.001

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_7 then
				local var_94_8 = (arg_91_1.time_ - var_94_5) / var_94_7
				local var_94_9 = Vector3.New(0, -1.01, -6.05)

				var_94_4.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1080ui_story, var_94_9, var_94_8)

				local var_94_10 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_10.x, var_94_10.y, var_94_10.z)

				local var_94_11 = var_94_4.localEulerAngles

				var_94_11.z = 0
				var_94_11.x = 0
				var_94_4.localEulerAngles = var_94_11
			end

			if arg_91_1.time_ >= var_94_5 + var_94_7 and arg_91_1.time_ < var_94_5 + var_94_7 + arg_94_0 then
				var_94_4.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_94_12 = manager.ui.mainCamera.transform.position - var_94_4.position

				var_94_4.forward = Vector3.New(var_94_12.x, var_94_12.y, var_94_12.z)

				local var_94_13 = var_94_4.localEulerAngles

				var_94_13.z = 0
				var_94_13.x = 0
				var_94_4.localEulerAngles = var_94_13
			end

			local var_94_14 = arg_91_1.actors_["1080ui_story"]
			local var_94_15 = 0

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 and arg_91_1.var_.characterEffect1080ui_story == nil then
				arg_91_1.var_.characterEffect1080ui_story = var_94_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_16 = 0.200000002980232

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_16 then
				local var_94_17 = (arg_91_1.time_ - var_94_15) / var_94_16

				if arg_91_1.var_.characterEffect1080ui_story then
					arg_91_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_15 + var_94_16 and arg_91_1.time_ < var_94_15 + var_94_16 + arg_94_0 and arg_91_1.var_.characterEffect1080ui_story then
				arg_91_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_94_18 = 0

			if var_94_18 < arg_91_1.time_ and arg_91_1.time_ <= var_94_18 + arg_94_0 then
				arg_91_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action4_1")
			end

			local var_94_19 = 0

			if var_94_19 < arg_91_1.time_ and arg_91_1.time_ <= var_94_19 + arg_94_0 then
				arg_91_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_20 = 0
			local var_94_21 = 0.225

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_22 = arg_91_1:FormatText(StoryNameCfg[55].name)

				arg_91_1.leftNameTxt_.text = var_94_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_23 = arg_91_1:GetWordFromCfg(1108105022)
				local var_94_24 = arg_91_1:FormatText(var_94_23.content)

				arg_91_1.text_.text = var_94_24

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_25 = 9
				local var_94_26 = utf8.len(var_94_24)
				local var_94_27 = var_94_25 <= 0 and var_94_21 or var_94_21 * (var_94_26 / var_94_25)

				if var_94_27 > 0 and var_94_21 < var_94_27 then
					arg_91_1.talkMaxDuration = var_94_27

					if var_94_27 + var_94_20 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_27 + var_94_20
					end
				end

				arg_91_1.text_.text = var_94_24
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_28 = math.max(var_94_21, arg_91_1.talkMaxDuration)

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_28 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_20) / var_94_28

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_20 + var_94_28 and arg_91_1.time_ < var_94_20 + var_94_28 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 1108105023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play1108105024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1080ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1080ui_story == nil then
				arg_95_1.var_.characterEffect1080ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1080ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1080ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1080ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1080ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.4

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[7].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(1108105023)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 16
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_14 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_14 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_14

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_14 and arg_95_1.time_ < var_98_6 + var_98_14 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 1108105024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play1108105025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1080ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1080ui_story == nil then
				arg_99_1.var_.characterEffect1080ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1080ui_story then
					arg_99_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1080ui_story then
				arg_99_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_102_4 = 0
			local var_102_5 = 0.4

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_6 = arg_99_1:FormatText(StoryNameCfg[55].name)

				arg_99_1.leftNameTxt_.text = var_102_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_7 = arg_99_1:GetWordFromCfg(1108105024)
				local var_102_8 = arg_99_1:FormatText(var_102_7.content)

				arg_99_1.text_.text = var_102_8

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_9 = 16
				local var_102_10 = utf8.len(var_102_8)
				local var_102_11 = var_102_9 <= 0 and var_102_5 or var_102_5 * (var_102_10 / var_102_9)

				if var_102_11 > 0 and var_102_5 < var_102_11 then
					arg_99_1.talkMaxDuration = var_102_11

					if var_102_11 + var_102_4 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_11 + var_102_4
					end
				end

				arg_99_1.text_.text = var_102_8
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_12 = math.max(var_102_5, arg_99_1.talkMaxDuration)

			if var_102_4 <= arg_99_1.time_ and arg_99_1.time_ < var_102_4 + var_102_12 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_4) / var_102_12

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_4 + var_102_12 and arg_99_1.time_ < var_102_4 + var_102_12 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 1108105025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play1108105026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action4_2")
			end

			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_2 = 0
			local var_106_3 = 0.55

			if var_106_2 < arg_103_1.time_ and arg_103_1.time_ <= var_106_2 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_4 = arg_103_1:FormatText(StoryNameCfg[55].name)

				arg_103_1.leftNameTxt_.text = var_106_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_5 = arg_103_1:GetWordFromCfg(1108105025)
				local var_106_6 = arg_103_1:FormatText(var_106_5.content)

				arg_103_1.text_.text = var_106_6

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_7 = 22
				local var_106_8 = utf8.len(var_106_6)
				local var_106_9 = var_106_7 <= 0 and var_106_3 or var_106_3 * (var_106_8 / var_106_7)

				if var_106_9 > 0 and var_106_3 < var_106_9 then
					arg_103_1.talkMaxDuration = var_106_9

					if var_106_9 + var_106_2 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_9 + var_106_2
					end
				end

				arg_103_1.text_.text = var_106_6
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_3, arg_103_1.talkMaxDuration)

			if var_106_2 <= arg_103_1.time_ and arg_103_1.time_ < var_106_2 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_2) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_2 + var_106_10 and arg_103_1.time_ < var_106_2 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 1108105026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play1108105027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1080ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1080ui_story == nil then
				arg_107_1.var_.characterEffect1080ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1080ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1080ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1080ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1080ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.575

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(1108105026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 23
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_14 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_14 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_14

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_14 and arg_107_1.time_ < var_110_6 + var_110_14 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 1108105027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play1108105028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1080ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1080ui_story == nil then
				arg_111_1.var_.characterEffect1080ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1080ui_story then
					arg_111_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1080ui_story then
				arg_111_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_114_4 = 0

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				arg_111_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_114_5 = 0
			local var_114_6 = 0.35

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_7 = arg_111_1:FormatText(StoryNameCfg[55].name)

				arg_111_1.leftNameTxt_.text = var_114_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(1108105027)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 14
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_6 or var_114_6 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_6 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_5 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_5
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_6, arg_111_1.talkMaxDuration)

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_5) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_5 + var_114_13 and arg_111_1.time_ < var_114_5 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 1108105028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play1108105029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1080ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1080ui_story == nil then
				arg_115_1.var_.characterEffect1080ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1080ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1080ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1080ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1080ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 1.2

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(1108105028)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 48
				local var_118_12 = utf8.len(var_118_10)
				local var_118_13 = var_118_11 <= 0 and var_118_7 or var_118_7 * (var_118_12 / var_118_11)

				if var_118_13 > 0 and var_118_7 < var_118_13 then
					arg_115_1.talkMaxDuration = var_118_13

					if var_118_13 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_13 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_10
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_14 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_14 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_14

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_14 and arg_115_1.time_ < var_118_6 + var_118_14 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 1108105029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play1108105030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.725

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(1108105029)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 29
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 1108105030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play1108105031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.8

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(1108105030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 32
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_8 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_8 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_8

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_8 and arg_123_1.time_ < var_126_0 + var_126_8 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 1108105031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play1108105032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1080ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1080ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -1.01, -6.05)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1080ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1080ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1080ui_story == nil then
				arg_127_1.var_.characterEffect1080ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1080ui_story then
					arg_127_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1080ui_story then
				arg_127_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action6_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.4

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[55].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(1108105031)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 16
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_23 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_23 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_23

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_23 and arg_127_1.time_ < var_130_15 + var_130_23 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 1108105032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play1108105033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1080ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1080ui_story == nil then
				arg_131_1.var_.characterEffect1080ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1080ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1080ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1080ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1080ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 0.166666666666667

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				local var_134_8 = "play"
				local var_134_9 = "effect"

				arg_131_1:AudioAction(var_134_8, var_134_9, "se_story_side_1081", "se_story_side_1081_engine", "")
			end

			local var_134_10 = arg_131_1.actors_["1080ui_story"].transform
			local var_134_11 = 0

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.var_.moveOldPos1080ui_story = var_134_10.localPosition
			end

			local var_134_12 = 0.001

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_12 then
				local var_134_13 = (arg_131_1.time_ - var_134_11) / var_134_12
				local var_134_14 = Vector3.New(0, 100, 0)

				var_134_10.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1080ui_story, var_134_14, var_134_13)

				local var_134_15 = manager.ui.mainCamera.transform.position - var_134_10.position

				var_134_10.forward = Vector3.New(var_134_15.x, var_134_15.y, var_134_15.z)

				local var_134_16 = var_134_10.localEulerAngles

				var_134_16.z = 0
				var_134_16.x = 0
				var_134_10.localEulerAngles = var_134_16
			end

			if arg_131_1.time_ >= var_134_11 + var_134_12 and arg_131_1.time_ < var_134_11 + var_134_12 + arg_134_0 then
				var_134_10.localPosition = Vector3.New(0, 100, 0)

				local var_134_17 = manager.ui.mainCamera.transform.position - var_134_10.position

				var_134_10.forward = Vector3.New(var_134_17.x, var_134_17.y, var_134_17.z)

				local var_134_18 = var_134_10.localEulerAngles

				var_134_18.z = 0
				var_134_18.x = 0
				var_134_10.localEulerAngles = var_134_18
			end

			local var_134_19 = 0
			local var_134_20 = 0.725

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_21 = arg_131_1:GetWordFromCfg(1108105032)
				local var_134_22 = arg_131_1:FormatText(var_134_21.content)

				arg_131_1.text_.text = var_134_22

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_23 = 29
				local var_134_24 = utf8.len(var_134_22)
				local var_134_25 = var_134_23 <= 0 and var_134_20 or var_134_20 * (var_134_24 / var_134_23)

				if var_134_25 > 0 and var_134_20 < var_134_25 then
					arg_131_1.talkMaxDuration = var_134_25

					if var_134_25 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_25 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_22
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_26 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_26 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_26

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_26 and arg_131_1.time_ < var_134_19 + var_134_26 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 1108105033
		arg_135_1.duration_ = 9

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play1108105034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 2

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				local var_138_1 = manager.ui.mainCamera.transform.localPosition
				local var_138_2 = Vector3.New(0, 0, 10) + Vector3.New(var_138_1.x, var_138_1.y, 0)
				local var_138_3 = arg_135_1.bgs_.ST0403

				var_138_3.transform.localPosition = var_138_2
				var_138_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_138_4 = var_138_3:GetComponent("SpriteRenderer")

				if var_138_4 and var_138_4.sprite then
					local var_138_5 = (var_138_3.transform.localPosition - var_138_1).z
					local var_138_6 = manager.ui.mainCameraCom_
					local var_138_7 = 2 * var_138_5 * Mathf.Tan(var_138_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_138_8 = var_138_7 * var_138_6.aspect
					local var_138_9 = var_138_4.sprite.bounds.size.x
					local var_138_10 = var_138_4.sprite.bounds.size.y
					local var_138_11 = var_138_8 / var_138_9
					local var_138_12 = var_138_7 / var_138_10
					local var_138_13 = var_138_12 < var_138_11 and var_138_11 or var_138_12

					var_138_3.transform.localScale = Vector3.New(var_138_13, var_138_13, 0)
				end

				for iter_138_0, iter_138_1 in pairs(arg_135_1.bgs_) do
					if iter_138_0 ~= "ST0403" then
						iter_138_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_138_14 = 4

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1.allBtn_.enabled = false
			end

			local var_138_15 = 0.3

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 then
				arg_135_1.allBtn_.enabled = true
			end

			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.mask_.enabled = true
				arg_135_1.mask_.raycastTarget = true

				arg_135_1:SetGaussion(false)
			end

			local var_138_17 = 2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Color.New(0, 0, 0)

				var_138_19.a = Mathf.Lerp(0, 1, var_138_18)
				arg_135_1.mask_.color = var_138_19
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				local var_138_20 = Color.New(0, 0, 0)

				var_138_20.a = 1
				arg_135_1.mask_.color = var_138_20
			end

			local var_138_21 = 2

			if var_138_21 < arg_135_1.time_ and arg_135_1.time_ <= var_138_21 + arg_138_0 then
				arg_135_1.mask_.enabled = true
				arg_135_1.mask_.raycastTarget = true

				arg_135_1:SetGaussion(false)
			end

			local var_138_22 = 2

			if var_138_21 <= arg_135_1.time_ and arg_135_1.time_ < var_138_21 + var_138_22 then
				local var_138_23 = (arg_135_1.time_ - var_138_21) / var_138_22
				local var_138_24 = Color.New(0, 0, 0)

				var_138_24.a = Mathf.Lerp(1, 0, var_138_23)
				arg_135_1.mask_.color = var_138_24
			end

			if arg_135_1.time_ >= var_138_21 + var_138_22 and arg_135_1.time_ < var_138_21 + var_138_22 + arg_138_0 then
				local var_138_25 = Color.New(0, 0, 0)
				local var_138_26 = 0

				arg_135_1.mask_.enabled = false
				var_138_25.a = var_138_26
				arg_135_1.mask_.color = var_138_25
			end

			local var_138_27 = arg_135_1.actors_["1080ui_story"].transform
			local var_138_28 = 2

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1.var_.moveOldPos1080ui_story = var_138_27.localPosition
			end

			local var_138_29 = 0.001

			if var_138_28 <= arg_135_1.time_ and arg_135_1.time_ < var_138_28 + var_138_29 then
				local var_138_30 = (arg_135_1.time_ - var_138_28) / var_138_29
				local var_138_31 = Vector3.New(0, 100, 0)

				var_138_27.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1080ui_story, var_138_31, var_138_30)

				local var_138_32 = manager.ui.mainCamera.transform.position - var_138_27.position

				var_138_27.forward = Vector3.New(var_138_32.x, var_138_32.y, var_138_32.z)

				local var_138_33 = var_138_27.localEulerAngles

				var_138_33.z = 0
				var_138_33.x = 0
				var_138_27.localEulerAngles = var_138_33
			end

			if arg_135_1.time_ >= var_138_28 + var_138_29 and arg_135_1.time_ < var_138_28 + var_138_29 + arg_138_0 then
				var_138_27.localPosition = Vector3.New(0, 100, 0)

				local var_138_34 = manager.ui.mainCamera.transform.position - var_138_27.position

				var_138_27.forward = Vector3.New(var_138_34.x, var_138_34.y, var_138_34.z)

				local var_138_35 = var_138_27.localEulerAngles

				var_138_35.z = 0
				var_138_35.x = 0
				var_138_27.localEulerAngles = var_138_35
			end

			local var_138_36 = 0
			local var_138_37 = 1

			if var_138_36 < arg_135_1.time_ and arg_135_1.time_ <= var_138_36 + arg_138_0 then
				local var_138_38 = "play"
				local var_138_39 = "effect"

				arg_135_1:AudioAction(var_138_38, var_138_39, "se_story_side_1081", "se_story_side_1081_impact", "")
			end

			if arg_135_1.frameCnt_ <= 1 then
				arg_135_1.dialog_:SetActive(false)
			end

			local var_138_40 = 4
			local var_138_41 = 0.85

			if var_138_40 < arg_135_1.time_ and arg_135_1.time_ <= var_138_40 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				arg_135_1.dialog_:SetActive(true)

				local var_138_42 = LeanTween.value(arg_135_1.dialog_, 0, 1, 0.3)

				var_138_42:setOnUpdate(LuaHelper.FloatAction(function(arg_139_0)
					arg_135_1.dialogCg_.alpha = arg_139_0
				end))
				var_138_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_135_1.dialog_)
					var_138_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_135_1.duration_ = arg_135_1.duration_ + 0.3

				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_43 = arg_135_1:GetWordFromCfg(1108105033)
				local var_138_44 = arg_135_1:FormatText(var_138_43.content)

				arg_135_1.text_.text = var_138_44

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_45 = 34
				local var_138_46 = utf8.len(var_138_44)
				local var_138_47 = var_138_45 <= 0 and var_138_41 or var_138_41 * (var_138_46 / var_138_45)

				if var_138_47 > 0 and var_138_41 < var_138_47 then
					arg_135_1.talkMaxDuration = var_138_47
					var_138_40 = var_138_40 + 0.3

					if var_138_47 + var_138_40 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_47 + var_138_40
					end
				end

				arg_135_1.text_.text = var_138_44
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_48 = var_138_40 + 0.3
			local var_138_49 = math.max(var_138_41, arg_135_1.talkMaxDuration)

			if var_138_48 <= arg_135_1.time_ and arg_135_1.time_ < var_138_48 + var_138_49 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_48) / var_138_49

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_48 + var_138_49 and arg_135_1.time_ < var_138_48 + var_138_49 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1108105034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1108105035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1081ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1081ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.0666666666666667

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -0.92, -5.8)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1081ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1081ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1081ui_story == nil then
				arg_141_1.var_.characterEffect1081ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.0166666666666667

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1081ui_story then
					arg_141_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1081ui_story then
				arg_141_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action4_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_15 = arg_141_1.actors_["1081ui_story"]
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 and arg_141_1.var_.characterEffect1081ui_story == nil then
				arg_141_1.var_.characterEffect1081ui_story = var_144_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_17 = 0.200000002980232

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17

				if arg_141_1.var_.characterEffect1081ui_story then
					arg_141_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 and arg_141_1.var_.characterEffect1081ui_story then
				arg_141_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_144_19 = 0
			local var_144_20 = 0.2

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_21 = arg_141_1:FormatText(StoryNameCfg[202].name)

				arg_141_1.leftNameTxt_.text = var_144_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_22 = arg_141_1:GetWordFromCfg(1108105034)
				local var_144_23 = arg_141_1:FormatText(var_144_22.content)

				arg_141_1.text_.text = var_144_23

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_24 = 8
				local var_144_25 = utf8.len(var_144_23)
				local var_144_26 = var_144_24 <= 0 and var_144_20 or var_144_20 * (var_144_25 / var_144_24)

				if var_144_26 > 0 and var_144_20 < var_144_26 then
					arg_141_1.talkMaxDuration = var_144_26

					if var_144_26 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_26 + var_144_19
					end
				end

				arg_141_1.text_.text = var_144_23
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_27 = math.max(var_144_20, arg_141_1.talkMaxDuration)

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_27 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_19) / var_144_27

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_19 + var_144_27 and arg_141_1.time_ < var_144_19 + var_144_27 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1108105035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1108105036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1081ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1081ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.0666666666666667

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, 100, 0)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1081ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, 100, 0)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = 0
			local var_148_10 = 0.975

			if var_148_9 < arg_145_1.time_ and arg_145_1.time_ <= var_148_9 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_11 = arg_145_1:GetWordFromCfg(1108105035)
				local var_148_12 = arg_145_1:FormatText(var_148_11.content)

				arg_145_1.text_.text = var_148_12

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_13 = 39
				local var_148_14 = utf8.len(var_148_12)
				local var_148_15 = var_148_13 <= 0 and var_148_10 or var_148_10 * (var_148_14 / var_148_13)

				if var_148_15 > 0 and var_148_10 < var_148_15 then
					arg_145_1.talkMaxDuration = var_148_15

					if var_148_15 + var_148_9 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_15 + var_148_9
					end
				end

				arg_145_1.text_.text = var_148_12
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_16 = math.max(var_148_10, arg_145_1.talkMaxDuration)

			if var_148_9 <= arg_145_1.time_ and arg_145_1.time_ < var_148_9 + var_148_16 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_9) / var_148_16

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_9 + var_148_16 and arg_145_1.time_ < var_148_9 + var_148_16 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1108105036
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1108105037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1081ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1081ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0, -0.92, -5.8)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1081ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1081ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect1081ui_story == nil then
				arg_149_1.var_.characterEffect1081ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect1081ui_story then
					arg_149_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect1081ui_story then
				arg_149_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_152_14 = 0

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action4_2")
			end

			local var_152_15 = 0
			local var_152_16 = 0.5

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_17 = arg_149_1:FormatText(StoryNameCfg[202].name)

				arg_149_1.leftNameTxt_.text = var_152_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_18 = arg_149_1:GetWordFromCfg(1108105036)
				local var_152_19 = arg_149_1:FormatText(var_152_18.content)

				arg_149_1.text_.text = var_152_19

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_20 = 20
				local var_152_21 = utf8.len(var_152_19)
				local var_152_22 = var_152_20 <= 0 and var_152_16 or var_152_16 * (var_152_21 / var_152_20)

				if var_152_22 > 0 and var_152_16 < var_152_22 then
					arg_149_1.talkMaxDuration = var_152_22

					if var_152_22 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_15
					end
				end

				arg_149_1.text_.text = var_152_19
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_23 = math.max(var_152_16, arg_149_1.talkMaxDuration)

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_23 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_15) / var_152_23

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_15 + var_152_23 and arg_149_1.time_ < var_152_15 + var_152_23 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1108105037
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1108105038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1081ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1081ui_story == nil then
				arg_153_1.var_.characterEffect1081ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1081ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1081ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1081ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1081ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 0.95

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_8 = arg_153_1:GetWordFromCfg(1108105037)
				local var_156_9 = arg_153_1:FormatText(var_156_8.content)

				arg_153_1.text_.text = var_156_9

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_10 = 38
				local var_156_11 = utf8.len(var_156_9)
				local var_156_12 = var_156_10 <= 0 and var_156_7 or var_156_7 * (var_156_11 / var_156_10)

				if var_156_12 > 0 and var_156_7 < var_156_12 then
					arg_153_1.talkMaxDuration = var_156_12

					if var_156_12 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_9
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_13 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_13 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_13

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_13 and arg_153_1.time_ < var_156_6 + var_156_13 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1108105038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1108105039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1081ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1081ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, -0.92, -5.8)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1081ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1081ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect1081ui_story == nil then
				arg_157_1.var_.characterEffect1081ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 1

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1081ui_story then
					arg_157_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect1081ui_story then
				arg_157_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_160_15 = 0
			local var_160_16 = 0.2

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_17 = arg_157_1:FormatText(StoryNameCfg[202].name)

				arg_157_1.leftNameTxt_.text = var_160_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_18 = arg_157_1:GetWordFromCfg(1108105038)
				local var_160_19 = arg_157_1:FormatText(var_160_18.content)

				arg_157_1.text_.text = var_160_19

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_20 = 8
				local var_160_21 = utf8.len(var_160_19)
				local var_160_22 = var_160_20 <= 0 and var_160_16 or var_160_16 * (var_160_21 / var_160_20)

				if var_160_22 > 0 and var_160_16 < var_160_22 then
					arg_157_1.talkMaxDuration = var_160_22

					if var_160_22 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_22 + var_160_15
					end
				end

				arg_157_1.text_.text = var_160_19
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_23 = math.max(var_160_16, arg_157_1.talkMaxDuration)

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_23 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_15) / var_160_23

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_15 + var_160_23 and arg_157_1.time_ < var_160_15 + var_160_23 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1108105039
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1108105040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1081ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1081ui_story == nil then
				arg_161_1.var_.characterEffect1081ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1081ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1081ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1081ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1081ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.275

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_8 = arg_161_1:FormatText(StoryNameCfg[7].name)

				arg_161_1.leftNameTxt_.text = var_164_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_9 = arg_161_1:GetWordFromCfg(1108105039)
				local var_164_10 = arg_161_1:FormatText(var_164_9.content)

				arg_161_1.text_.text = var_164_10

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_11 = 11
				local var_164_12 = utf8.len(var_164_10)
				local var_164_13 = var_164_11 <= 0 and var_164_7 or var_164_7 * (var_164_12 / var_164_11)

				if var_164_13 > 0 and var_164_7 < var_164_13 then
					arg_161_1.talkMaxDuration = var_164_13

					if var_164_13 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_13 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_10
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_14 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_14 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_14

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_14 and arg_161_1.time_ < var_164_6 + var_164_14 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1108105040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1108105041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_168_2 = arg_165_1.actors_["1081ui_story"]
			local var_168_3 = 0

			if var_168_3 < arg_165_1.time_ and arg_165_1.time_ <= var_168_3 + arg_168_0 and arg_165_1.var_.characterEffect1081ui_story == nil then
				arg_165_1.var_.characterEffect1081ui_story = var_168_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_4 = 0.200000002980232

			if var_168_3 <= arg_165_1.time_ and arg_165_1.time_ < var_168_3 + var_168_4 then
				local var_168_5 = (arg_165_1.time_ - var_168_3) / var_168_4

				if arg_165_1.var_.characterEffect1081ui_story then
					arg_165_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_3 + var_168_4 and arg_165_1.time_ < var_168_3 + var_168_4 + arg_168_0 and arg_165_1.var_.characterEffect1081ui_story then
				arg_165_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_168_6 = 0
			local var_168_7 = 0.575

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_8 = arg_165_1:FormatText(StoryNameCfg[202].name)

				arg_165_1.leftNameTxt_.text = var_168_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_9 = arg_165_1:GetWordFromCfg(1108105040)
				local var_168_10 = arg_165_1:FormatText(var_168_9.content)

				arg_165_1.text_.text = var_168_10

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_11 = 23
				local var_168_12 = utf8.len(var_168_10)
				local var_168_13 = var_168_11 <= 0 and var_168_7 or var_168_7 * (var_168_12 / var_168_11)

				if var_168_13 > 0 and var_168_7 < var_168_13 then
					arg_165_1.talkMaxDuration = var_168_13

					if var_168_13 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_10
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_14 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_14 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_14

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_14 and arg_165_1.time_ < var_168_6 + var_168_14 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1108105041
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1108105042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1081ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1081ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, 100, 0)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1081ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, 100, 0)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = 0
			local var_172_10 = 0.95

			if var_172_9 < arg_169_1.time_ and arg_169_1.time_ <= var_172_9 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_11 = arg_169_1:GetWordFromCfg(1108105041)
				local var_172_12 = arg_169_1:FormatText(var_172_11.content)

				arg_169_1.text_.text = var_172_12

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_13 = 38
				local var_172_14 = utf8.len(var_172_12)
				local var_172_15 = var_172_13 <= 0 and var_172_10 or var_172_10 * (var_172_14 / var_172_13)

				if var_172_15 > 0 and var_172_10 < var_172_15 then
					arg_169_1.talkMaxDuration = var_172_15

					if var_172_15 + var_172_9 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_15 + var_172_9
					end
				end

				arg_169_1.text_.text = var_172_12
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_16 = math.max(var_172_10, arg_169_1.talkMaxDuration)

			if var_172_9 <= arg_169_1.time_ and arg_169_1.time_ < var_172_9 + var_172_16 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_9) / var_172_16

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_9 + var_172_16 and arg_169_1.time_ < var_172_9 + var_172_16 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1108105042
		arg_173_1.duration_ = 9.09

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1108105043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = "ST0403a"

			if arg_173_1.bgs_[var_176_0] == nil then
				local var_176_1 = Object.Instantiate(arg_173_1.paintGo_)

				var_176_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_176_0)
				var_176_1.name = var_176_0
				var_176_1.transform.parent = arg_173_1.stage_.transform
				var_176_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_173_1.bgs_[var_176_0] = var_176_1
			end

			local var_176_2 = 2

			if var_176_2 < arg_173_1.time_ and arg_173_1.time_ <= var_176_2 + arg_176_0 then
				local var_176_3 = manager.ui.mainCamera.transform.localPosition
				local var_176_4 = Vector3.New(0, 0, 10) + Vector3.New(var_176_3.x, var_176_3.y, 0)
				local var_176_5 = arg_173_1.bgs_.ST0403a

				var_176_5.transform.localPosition = var_176_4
				var_176_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_176_6 = var_176_5:GetComponent("SpriteRenderer")

				if var_176_6 and var_176_6.sprite then
					local var_176_7 = (var_176_5.transform.localPosition - var_176_3).z
					local var_176_8 = manager.ui.mainCameraCom_
					local var_176_9 = 2 * var_176_7 * Mathf.Tan(var_176_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_176_10 = var_176_9 * var_176_8.aspect
					local var_176_11 = var_176_6.sprite.bounds.size.x
					local var_176_12 = var_176_6.sprite.bounds.size.y
					local var_176_13 = var_176_10 / var_176_11
					local var_176_14 = var_176_9 / var_176_12
					local var_176_15 = var_176_14 < var_176_13 and var_176_13 or var_176_14

					var_176_5.transform.localScale = Vector3.New(var_176_15, var_176_15, 0)
				end

				for iter_176_0, iter_176_1 in pairs(arg_173_1.bgs_) do
					if iter_176_0 ~= "ST0403a" then
						iter_176_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_176_16 = 0

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_17 = 2

			if var_176_16 <= arg_173_1.time_ and arg_173_1.time_ < var_176_16 + var_176_17 then
				local var_176_18 = (arg_173_1.time_ - var_176_16) / var_176_17
				local var_176_19 = Color.New(0, 0, 0)

				var_176_19.a = Mathf.Lerp(0, 1, var_176_18)
				arg_173_1.mask_.color = var_176_19
			end

			if arg_173_1.time_ >= var_176_16 + var_176_17 and arg_173_1.time_ < var_176_16 + var_176_17 + arg_176_0 then
				local var_176_20 = Color.New(0, 0, 0)

				var_176_20.a = 1
				arg_173_1.mask_.color = var_176_20
			end

			local var_176_21 = 2

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_22 = 2

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_22 then
				local var_176_23 = (arg_173_1.time_ - var_176_21) / var_176_22
				local var_176_24 = Color.New(0, 0, 0)

				var_176_24.a = Mathf.Lerp(1, 0, var_176_23)
				arg_173_1.mask_.color = var_176_24
			end

			if arg_173_1.time_ >= var_176_21 + var_176_22 and arg_173_1.time_ < var_176_21 + var_176_22 + arg_176_0 then
				local var_176_25 = Color.New(0, 0, 0)
				local var_176_26 = 0

				arg_173_1.mask_.enabled = false
				var_176_25.a = var_176_26
				arg_173_1.mask_.color = var_176_25
			end

			local var_176_27 = arg_173_1.actors_["1081ui_story"].transform
			local var_176_28 = 1.98333333333333

			if var_176_28 < arg_173_1.time_ and arg_173_1.time_ <= var_176_28 + arg_176_0 then
				arg_173_1.var_.moveOldPos1081ui_story = var_176_27.localPosition
			end

			local var_176_29 = 0.001

			if var_176_28 <= arg_173_1.time_ and arg_173_1.time_ < var_176_28 + var_176_29 then
				local var_176_30 = (arg_173_1.time_ - var_176_28) / var_176_29
				local var_176_31 = Vector3.New(0, 100, 0)

				var_176_27.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1081ui_story, var_176_31, var_176_30)

				local var_176_32 = manager.ui.mainCamera.transform.position - var_176_27.position

				var_176_27.forward = Vector3.New(var_176_32.x, var_176_32.y, var_176_32.z)

				local var_176_33 = var_176_27.localEulerAngles

				var_176_33.z = 0
				var_176_33.x = 0
				var_176_27.localEulerAngles = var_176_33
			end

			if arg_173_1.time_ >= var_176_28 + var_176_29 and arg_173_1.time_ < var_176_28 + var_176_29 + arg_176_0 then
				var_176_27.localPosition = Vector3.New(0, 100, 0)

				local var_176_34 = manager.ui.mainCamera.transform.position - var_176_27.position

				var_176_27.forward = Vector3.New(var_176_34.x, var_176_34.y, var_176_34.z)

				local var_176_35 = var_176_27.localEulerAngles

				var_176_35.z = 0
				var_176_35.x = 0
				var_176_27.localEulerAngles = var_176_35
			end

			local var_176_36 = arg_173_1.actors_["1080ui_story"].transform
			local var_176_37 = 1.98333333333333

			if var_176_37 < arg_173_1.time_ and arg_173_1.time_ <= var_176_37 + arg_176_0 then
				arg_173_1.var_.moveOldPos1080ui_story = var_176_36.localPosition
			end

			local var_176_38 = 0.001

			if var_176_37 <= arg_173_1.time_ and arg_173_1.time_ < var_176_37 + var_176_38 then
				local var_176_39 = (arg_173_1.time_ - var_176_37) / var_176_38
				local var_176_40 = Vector3.New(0, 100, 0)

				var_176_36.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1080ui_story, var_176_40, var_176_39)

				local var_176_41 = manager.ui.mainCamera.transform.position - var_176_36.position

				var_176_36.forward = Vector3.New(var_176_41.x, var_176_41.y, var_176_41.z)

				local var_176_42 = var_176_36.localEulerAngles

				var_176_42.z = 0
				var_176_42.x = 0
				var_176_36.localEulerAngles = var_176_42
			end

			if arg_173_1.time_ >= var_176_37 + var_176_38 and arg_173_1.time_ < var_176_37 + var_176_38 + arg_176_0 then
				var_176_36.localPosition = Vector3.New(0, 100, 0)

				local var_176_43 = manager.ui.mainCamera.transform.position - var_176_36.position

				var_176_36.forward = Vector3.New(var_176_43.x, var_176_43.y, var_176_43.z)

				local var_176_44 = var_176_36.localEulerAngles

				var_176_44.z = 0
				var_176_44.x = 0
				var_176_36.localEulerAngles = var_176_44
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_45 = 4.08963386608908
			local var_176_46 = 0.999999999999998

			if var_176_45 < arg_173_1.time_ and arg_173_1.time_ <= var_176_45 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_47 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_47:setOnUpdate(LuaHelper.FloatAction(function(arg_177_0)
					arg_173_1.dialogCg_.alpha = arg_177_0
				end))
				var_176_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_48 = arg_173_1:GetWordFromCfg(1108105042)
				local var_176_49 = arg_173_1:FormatText(var_176_48.content)

				arg_173_1.text_.text = var_176_49

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_50 = 52
				local var_176_51 = utf8.len(var_176_49)
				local var_176_52 = var_176_50 <= 0 and var_176_46 or var_176_46 * (var_176_51 / var_176_50)

				if var_176_52 > 0 and var_176_46 < var_176_52 then
					arg_173_1.talkMaxDuration = var_176_52
					var_176_45 = var_176_45 + 0.3

					if var_176_52 + var_176_45 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_52 + var_176_45
					end
				end

				arg_173_1.text_.text = var_176_49
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_53 = var_176_45 + 0.3
			local var_176_54 = math.max(var_176_46, arg_173_1.talkMaxDuration)

			if var_176_53 <= arg_173_1.time_ and arg_173_1.time_ < var_176_53 + var_176_54 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_53) / var_176_54

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_53 + var_176_54 and arg_173_1.time_ < var_176_53 + var_176_54 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 1108105043
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play1108105044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1081ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1081ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, -0.92, -5.8)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1081ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1081ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1081ui_story == nil then
				arg_179_1.var_.characterEffect1081ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.034000001847744

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1081ui_story then
					arg_179_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1081ui_story then
				arg_179_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_182_13 = 0

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_182_15 = arg_179_1.actors_["1081ui_story"]
			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 and arg_179_1.var_.characterEffect1081ui_story == nil then
				arg_179_1.var_.characterEffect1081ui_story = var_182_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_17 = 0.200000002980232

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17

				if arg_179_1.var_.characterEffect1081ui_story then
					arg_179_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 and arg_179_1.var_.characterEffect1081ui_story then
				arg_179_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_182_19 = 0
			local var_182_20 = 0.8

			if var_182_19 < arg_179_1.time_ and arg_179_1.time_ <= var_182_19 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_21 = arg_179_1:FormatText(StoryNameCfg[202].name)

				arg_179_1.leftNameTxt_.text = var_182_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_22 = arg_179_1:GetWordFromCfg(1108105043)
				local var_182_23 = arg_179_1:FormatText(var_182_22.content)

				arg_179_1.text_.text = var_182_23

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_24 = 32
				local var_182_25 = utf8.len(var_182_23)
				local var_182_26 = var_182_24 <= 0 and var_182_20 or var_182_20 * (var_182_25 / var_182_24)

				if var_182_26 > 0 and var_182_20 < var_182_26 then
					arg_179_1.talkMaxDuration = var_182_26

					if var_182_26 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_26 + var_182_19
					end
				end

				arg_179_1.text_.text = var_182_23
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_27 = math.max(var_182_20, arg_179_1.talkMaxDuration)

			if var_182_19 <= arg_179_1.time_ and arg_179_1.time_ < var_182_19 + var_182_27 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_19) / var_182_27

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_19 + var_182_27 and arg_179_1.time_ < var_182_19 + var_182_27 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 1108105044
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play1108105045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1081ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1081ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.0971643999218941

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(-0.7, -0.92, -5.8)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1081ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-0.7, -0.92, -5.8)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1080ui_story"].transform
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1.var_.moveOldPos1080ui_story = var_186_9.localPosition
			end

			local var_186_11 = 0.0971643999218941

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11
				local var_186_13 = Vector3.New(0.7, -1.01, -6.05)

				var_186_9.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1080ui_story, var_186_13, var_186_12)

				local var_186_14 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_14.x, var_186_14.y, var_186_14.z)

				local var_186_15 = var_186_9.localEulerAngles

				var_186_15.z = 0
				var_186_15.x = 0
				var_186_9.localEulerAngles = var_186_15
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 then
				var_186_9.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_186_16 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_16.x, var_186_16.y, var_186_16.z)

				local var_186_17 = var_186_9.localEulerAngles

				var_186_17.z = 0
				var_186_17.x = 0
				var_186_9.localEulerAngles = var_186_17
			end

			local var_186_18 = arg_183_1.actors_["1080ui_story"]
			local var_186_19 = 0

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 and arg_183_1.var_.characterEffect1080ui_story == nil then
				arg_183_1.var_.characterEffect1080ui_story = var_186_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_20 = 0.200000002980232

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_20 then
				local var_186_21 = (arg_183_1.time_ - var_186_19) / var_186_20

				if arg_183_1.var_.characterEffect1080ui_story then
					arg_183_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_19 + var_186_20 and arg_183_1.time_ < var_186_19 + var_186_20 + arg_186_0 and arg_183_1.var_.characterEffect1080ui_story then
				arg_183_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_186_22 = 0

			if var_186_22 < arg_183_1.time_ and arg_183_1.time_ <= var_186_22 + arg_186_0 then
				arg_183_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action6_1")
			end

			local var_186_23 = 0

			if var_186_23 < arg_183_1.time_ and arg_183_1.time_ <= var_186_23 + arg_186_0 then
				arg_183_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_24 = arg_183_1.actors_["1081ui_story"]
			local var_186_25 = 0

			if var_186_25 < arg_183_1.time_ and arg_183_1.time_ <= var_186_25 + arg_186_0 and arg_183_1.var_.characterEffect1081ui_story == nil then
				arg_183_1.var_.characterEffect1081ui_story = var_186_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_26 = 0.200000002980232

			if var_186_25 <= arg_183_1.time_ and arg_183_1.time_ < var_186_25 + var_186_26 then
				local var_186_27 = (arg_183_1.time_ - var_186_25) / var_186_26

				if arg_183_1.var_.characterEffect1081ui_story then
					local var_186_28 = Mathf.Lerp(0, 0.5, var_186_27)

					arg_183_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1081ui_story.fillRatio = var_186_28
				end
			end

			if arg_183_1.time_ >= var_186_25 + var_186_26 and arg_183_1.time_ < var_186_25 + var_186_26 + arg_186_0 and arg_183_1.var_.characterEffect1081ui_story then
				local var_186_29 = 0.5

				arg_183_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1081ui_story.fillRatio = var_186_29
			end

			local var_186_30 = 0
			local var_186_31 = 0.3

			if var_186_30 < arg_183_1.time_ and arg_183_1.time_ <= var_186_30 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_32 = arg_183_1:FormatText(StoryNameCfg[55].name)

				arg_183_1.leftNameTxt_.text = var_186_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_33 = arg_183_1:GetWordFromCfg(1108105044)
				local var_186_34 = arg_183_1:FormatText(var_186_33.content)

				arg_183_1.text_.text = var_186_34

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_35 = 12
				local var_186_36 = utf8.len(var_186_34)
				local var_186_37 = var_186_35 <= 0 and var_186_31 or var_186_31 * (var_186_36 / var_186_35)

				if var_186_37 > 0 and var_186_31 < var_186_37 then
					arg_183_1.talkMaxDuration = var_186_37

					if var_186_37 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_37 + var_186_30
					end
				end

				arg_183_1.text_.text = var_186_34
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_38 = math.max(var_186_31, arg_183_1.talkMaxDuration)

			if var_186_30 <= arg_183_1.time_ and arg_183_1.time_ < var_186_30 + var_186_38 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_30) / var_186_38

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_30 + var_186_38 and arg_183_1.time_ < var_186_30 + var_186_38 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 1108105045
		arg_187_1.duration_ = 7.1

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play1108105046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 1

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				local var_190_1 = manager.ui.mainCamera.transform.localPosition
				local var_190_2 = Vector3.New(0, 0, 10) + Vector3.New(var_190_1.x, var_190_1.y, 0)
				local var_190_3 = arg_187_1.bgs_.ST0403a

				var_190_3.transform.localPosition = var_190_2
				var_190_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_190_4 = var_190_3:GetComponent("SpriteRenderer")

				if var_190_4 and var_190_4.sprite then
					local var_190_5 = (var_190_3.transform.localPosition - var_190_1).z
					local var_190_6 = manager.ui.mainCameraCom_
					local var_190_7 = 2 * var_190_5 * Mathf.Tan(var_190_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_190_8 = var_190_7 * var_190_6.aspect
					local var_190_9 = var_190_4.sprite.bounds.size.x
					local var_190_10 = var_190_4.sprite.bounds.size.y
					local var_190_11 = var_190_8 / var_190_9
					local var_190_12 = var_190_7 / var_190_10
					local var_190_13 = var_190_12 < var_190_11 and var_190_11 or var_190_12

					var_190_3.transform.localScale = Vector3.New(var_190_13, var_190_13, 0)
				end

				for iter_190_0, iter_190_1 in pairs(arg_187_1.bgs_) do
					if iter_190_0 ~= "ST0403a" then
						iter_190_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1.allBtn_.enabled = false
			end

			local var_190_15 = 0.3

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 then
				arg_187_1.allBtn_.enabled = true
			end

			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_17 = 1

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Color.New(0, 0, 0)

				var_190_19.a = Mathf.Lerp(0, 1, var_190_18)
				arg_187_1.mask_.color = var_190_19
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				local var_190_20 = Color.New(0, 0, 0)

				var_190_20.a = 1
				arg_187_1.mask_.color = var_190_20
			end

			local var_190_21 = 1

			if var_190_21 < arg_187_1.time_ and arg_187_1.time_ <= var_190_21 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_22 = 1.16666666666667

			if var_190_21 <= arg_187_1.time_ and arg_187_1.time_ < var_190_21 + var_190_22 then
				local var_190_23 = (arg_187_1.time_ - var_190_21) / var_190_22
				local var_190_24 = Color.New(0, 0, 0)

				var_190_24.a = Mathf.Lerp(1, 0, var_190_23)
				arg_187_1.mask_.color = var_190_24
			end

			if arg_187_1.time_ >= var_190_21 + var_190_22 and arg_187_1.time_ < var_190_21 + var_190_22 + arg_190_0 then
				local var_190_25 = Color.New(0, 0, 0)
				local var_190_26 = 0

				arg_187_1.mask_.enabled = false
				var_190_25.a = var_190_26
				arg_187_1.mask_.color = var_190_25
			end

			local var_190_27 = arg_187_1.actors_["1081ui_story"].transform
			local var_190_28 = 1

			if var_190_28 < arg_187_1.time_ and arg_187_1.time_ <= var_190_28 + arg_190_0 then
				arg_187_1.var_.moveOldPos1081ui_story = var_190_27.localPosition
			end

			local var_190_29 = 0.001

			if var_190_28 <= arg_187_1.time_ and arg_187_1.time_ < var_190_28 + var_190_29 then
				local var_190_30 = (arg_187_1.time_ - var_190_28) / var_190_29
				local var_190_31 = Vector3.New(0, 100, 0)

				var_190_27.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1081ui_story, var_190_31, var_190_30)

				local var_190_32 = manager.ui.mainCamera.transform.position - var_190_27.position

				var_190_27.forward = Vector3.New(var_190_32.x, var_190_32.y, var_190_32.z)

				local var_190_33 = var_190_27.localEulerAngles

				var_190_33.z = 0
				var_190_33.x = 0
				var_190_27.localEulerAngles = var_190_33
			end

			if arg_187_1.time_ >= var_190_28 + var_190_29 and arg_187_1.time_ < var_190_28 + var_190_29 + arg_190_0 then
				var_190_27.localPosition = Vector3.New(0, 100, 0)

				local var_190_34 = manager.ui.mainCamera.transform.position - var_190_27.position

				var_190_27.forward = Vector3.New(var_190_34.x, var_190_34.y, var_190_34.z)

				local var_190_35 = var_190_27.localEulerAngles

				var_190_35.z = 0
				var_190_35.x = 0
				var_190_27.localEulerAngles = var_190_35
			end

			local var_190_36 = arg_187_1.actors_["1080ui_story"].transform
			local var_190_37 = 1

			if var_190_37 < arg_187_1.time_ and arg_187_1.time_ <= var_190_37 + arg_190_0 then
				arg_187_1.var_.moveOldPos1080ui_story = var_190_36.localPosition
			end

			local var_190_38 = 0.001

			if var_190_37 <= arg_187_1.time_ and arg_187_1.time_ < var_190_37 + var_190_38 then
				local var_190_39 = (arg_187_1.time_ - var_190_37) / var_190_38
				local var_190_40 = Vector3.New(0, 100, 0)

				var_190_36.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1080ui_story, var_190_40, var_190_39)

				local var_190_41 = manager.ui.mainCamera.transform.position - var_190_36.position

				var_190_36.forward = Vector3.New(var_190_41.x, var_190_41.y, var_190_41.z)

				local var_190_42 = var_190_36.localEulerAngles

				var_190_42.z = 0
				var_190_42.x = 0
				var_190_36.localEulerAngles = var_190_42
			end

			if arg_187_1.time_ >= var_190_37 + var_190_38 and arg_187_1.time_ < var_190_37 + var_190_38 + arg_190_0 then
				var_190_36.localPosition = Vector3.New(0, 100, 0)

				local var_190_43 = manager.ui.mainCamera.transform.position - var_190_36.position

				var_190_36.forward = Vector3.New(var_190_43.x, var_190_43.y, var_190_43.z)

				local var_190_44 = var_190_36.localEulerAngles

				var_190_44.z = 0
				var_190_44.x = 0
				var_190_36.localEulerAngles = var_190_44
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_45 = 2.1
			local var_190_46 = 1.075

			if var_190_45 < arg_187_1.time_ and arg_187_1.time_ <= var_190_45 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_47 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_47:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_48 = arg_187_1:GetWordFromCfg(1108105045)
				local var_190_49 = arg_187_1:FormatText(var_190_48.content)

				arg_187_1.text_.text = var_190_49

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_50 = 43
				local var_190_51 = utf8.len(var_190_49)
				local var_190_52 = var_190_50 <= 0 and var_190_46 or var_190_46 * (var_190_51 / var_190_50)

				if var_190_52 > 0 and var_190_46 < var_190_52 then
					arg_187_1.talkMaxDuration = var_190_52
					var_190_45 = var_190_45 + 0.3

					if var_190_52 + var_190_45 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_52 + var_190_45
					end
				end

				arg_187_1.text_.text = var_190_49
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_53 = var_190_45 + 0.3
			local var_190_54 = math.max(var_190_46, arg_187_1.talkMaxDuration)

			if var_190_53 <= arg_187_1.time_ and arg_187_1.time_ < var_190_53 + var_190_54 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_53) / var_190_54

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_53 + var_190_54 and arg_187_1.time_ < var_190_53 + var_190_54 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1108105046
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1108105047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1081ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1081ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, -0.92, -5.8)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1081ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1081ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1081ui_story == nil then
				arg_193_1.var_.characterEffect1081ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1081ui_story then
					arg_193_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1081ui_story then
				arg_193_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_196_14 = 0

			if var_196_14 < arg_193_1.time_ and arg_193_1.time_ <= var_196_14 + arg_196_0 then
				arg_193_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_196_15 = arg_193_1.actors_["1080ui_story"].transform
			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				arg_193_1.var_.moveOldPos1080ui_story = var_196_15.localPosition
			end

			local var_196_17 = 0.001

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17
				local var_196_19 = Vector3.New(0, 100, 0)

				var_196_15.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1080ui_story, var_196_19, var_196_18)

				local var_196_20 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_20.x, var_196_20.y, var_196_20.z)

				local var_196_21 = var_196_15.localEulerAngles

				var_196_21.z = 0
				var_196_21.x = 0
				var_196_15.localEulerAngles = var_196_21
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 then
				var_196_15.localPosition = Vector3.New(0, 100, 0)

				local var_196_22 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_22.x, var_196_22.y, var_196_22.z)

				local var_196_23 = var_196_15.localEulerAngles

				var_196_23.z = 0
				var_196_23.x = 0
				var_196_15.localEulerAngles = var_196_23
			end

			local var_196_24 = 0
			local var_196_25 = 0.25

			if var_196_24 < arg_193_1.time_ and arg_193_1.time_ <= var_196_24 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_26 = arg_193_1:FormatText(StoryNameCfg[202].name)

				arg_193_1.leftNameTxt_.text = var_196_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_27 = arg_193_1:GetWordFromCfg(1108105046)
				local var_196_28 = arg_193_1:FormatText(var_196_27.content)

				arg_193_1.text_.text = var_196_28

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_29 = 10
				local var_196_30 = utf8.len(var_196_28)
				local var_196_31 = var_196_29 <= 0 and var_196_25 or var_196_25 * (var_196_30 / var_196_29)

				if var_196_31 > 0 and var_196_25 < var_196_31 then
					arg_193_1.talkMaxDuration = var_196_31

					if var_196_31 + var_196_24 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_31 + var_196_24
					end
				end

				arg_193_1.text_.text = var_196_28
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_32 = math.max(var_196_25, arg_193_1.talkMaxDuration)

			if var_196_24 <= arg_193_1.time_ and arg_193_1.time_ < var_196_24 + var_196_32 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_24) / var_196_32

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_24 + var_196_32 and arg_193_1.time_ < var_196_24 + var_196_32 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1108105047
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1108105048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1081ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1081ui_story == nil then
				arg_197_1.var_.characterEffect1081ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1081ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1081ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1081ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1081ui_story.fillRatio = var_200_5
			end

			local var_200_6 = arg_197_1.actors_["1081ui_story"].transform
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 then
				arg_197_1.var_.moveOldPos1081ui_story = var_200_6.localPosition
			end

			local var_200_8 = 0.001

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8
				local var_200_10 = Vector3.New(0, -0.92, -5.8)

				var_200_6.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1081ui_story, var_200_10, var_200_9)

				local var_200_11 = manager.ui.mainCamera.transform.position - var_200_6.position

				var_200_6.forward = Vector3.New(var_200_11.x, var_200_11.y, var_200_11.z)

				local var_200_12 = var_200_6.localEulerAngles

				var_200_12.z = 0
				var_200_12.x = 0
				var_200_6.localEulerAngles = var_200_12
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 then
				var_200_6.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_200_13 = manager.ui.mainCamera.transform.position - var_200_6.position

				var_200_6.forward = Vector3.New(var_200_13.x, var_200_13.y, var_200_13.z)

				local var_200_14 = var_200_6.localEulerAngles

				var_200_14.z = 0
				var_200_14.x = 0
				var_200_6.localEulerAngles = var_200_14
			end

			local var_200_15 = arg_197_1.actors_["1080ui_story"].transform
			local var_200_16 = 0

			if var_200_16 < arg_197_1.time_ and arg_197_1.time_ <= var_200_16 + arg_200_0 then
				arg_197_1.var_.moveOldPos1080ui_story = var_200_15.localPosition
			end

			local var_200_17 = 0.001

			if var_200_16 <= arg_197_1.time_ and arg_197_1.time_ < var_200_16 + var_200_17 then
				local var_200_18 = (arg_197_1.time_ - var_200_16) / var_200_17
				local var_200_19 = Vector3.New(0, 100, 0)

				var_200_15.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1080ui_story, var_200_19, var_200_18)

				local var_200_20 = manager.ui.mainCamera.transform.position - var_200_15.position

				var_200_15.forward = Vector3.New(var_200_20.x, var_200_20.y, var_200_20.z)

				local var_200_21 = var_200_15.localEulerAngles

				var_200_21.z = 0
				var_200_21.x = 0
				var_200_15.localEulerAngles = var_200_21
			end

			if arg_197_1.time_ >= var_200_16 + var_200_17 and arg_197_1.time_ < var_200_16 + var_200_17 + arg_200_0 then
				var_200_15.localPosition = Vector3.New(0, 100, 0)

				local var_200_22 = manager.ui.mainCamera.transform.position - var_200_15.position

				var_200_15.forward = Vector3.New(var_200_22.x, var_200_22.y, var_200_22.z)

				local var_200_23 = var_200_15.localEulerAngles

				var_200_23.z = 0
				var_200_23.x = 0
				var_200_15.localEulerAngles = var_200_23
			end

			local var_200_24 = 0
			local var_200_25 = 0.325

			if var_200_24 < arg_197_1.time_ and arg_197_1.time_ <= var_200_24 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_26 = arg_197_1:FormatText(StoryNameCfg[7].name)

				arg_197_1.leftNameTxt_.text = var_200_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_27 = arg_197_1:GetWordFromCfg(1108105047)
				local var_200_28 = arg_197_1:FormatText(var_200_27.content)

				arg_197_1.text_.text = var_200_28

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_29 = 13
				local var_200_30 = utf8.len(var_200_28)
				local var_200_31 = var_200_29 <= 0 and var_200_25 or var_200_25 * (var_200_30 / var_200_29)

				if var_200_31 > 0 and var_200_25 < var_200_31 then
					arg_197_1.talkMaxDuration = var_200_31

					if var_200_31 + var_200_24 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_31 + var_200_24
					end
				end

				arg_197_1.text_.text = var_200_28
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_32 = math.max(var_200_25, arg_197_1.talkMaxDuration)

			if var_200_24 <= arg_197_1.time_ and arg_197_1.time_ < var_200_24 + var_200_32 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_24) / var_200_32

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_24 + var_200_32 and arg_197_1.time_ < var_200_24 + var_200_32 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1108105048
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1108105049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1080ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1080ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, 100, 0)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1080ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, 100, 0)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1081ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1081ui_story == nil then
				arg_201_1.var_.characterEffect1081ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1081ui_story then
					arg_201_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1081ui_story then
				arg_201_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1303cva")
			end

			local var_204_15 = 0
			local var_204_16 = 0.75

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_17 = arg_201_1:FormatText(StoryNameCfg[202].name)

				arg_201_1.leftNameTxt_.text = var_204_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_18 = arg_201_1:GetWordFromCfg(1108105048)
				local var_204_19 = arg_201_1:FormatText(var_204_18.content)

				arg_201_1.text_.text = var_204_19

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_20 = 30
				local var_204_21 = utf8.len(var_204_19)
				local var_204_22 = var_204_20 <= 0 and var_204_16 or var_204_16 * (var_204_21 / var_204_20)

				if var_204_22 > 0 and var_204_16 < var_204_22 then
					arg_201_1.talkMaxDuration = var_204_22

					if var_204_22 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_15
					end
				end

				arg_201_1.text_.text = var_204_19
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_23 = math.max(var_204_16, arg_201_1.talkMaxDuration)

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_23 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_15) / var_204_23

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_15 + var_204_23 and arg_201_1.time_ < var_204_15 + var_204_23 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1108105049
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1108105050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1081ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1081ui_story == nil then
				arg_205_1.var_.characterEffect1081ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1081ui_story then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1081ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1081ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1081ui_story.fillRatio = var_208_5
			end

			local var_208_6 = 0
			local var_208_7 = 0.575

			if var_208_6 < arg_205_1.time_ and arg_205_1.time_ <= var_208_6 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_8 = arg_205_1:FormatText(StoryNameCfg[7].name)

				arg_205_1.leftNameTxt_.text = var_208_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_9 = arg_205_1:GetWordFromCfg(1108105049)
				local var_208_10 = arg_205_1:FormatText(var_208_9.content)

				arg_205_1.text_.text = var_208_10

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_11 = 23
				local var_208_12 = utf8.len(var_208_10)
				local var_208_13 = var_208_11 <= 0 and var_208_7 or var_208_7 * (var_208_12 / var_208_11)

				if var_208_13 > 0 and var_208_7 < var_208_13 then
					arg_205_1.talkMaxDuration = var_208_13

					if var_208_13 + var_208_6 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_6
					end
				end

				arg_205_1.text_.text = var_208_10
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_14 = math.max(var_208_7, arg_205_1.talkMaxDuration)

			if var_208_6 <= arg_205_1.time_ and arg_205_1.time_ < var_208_6 + var_208_14 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_6) / var_208_14

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_6 + var_208_14 and arg_205_1.time_ < var_208_6 + var_208_14 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1108105050
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1108105051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1081ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1081ui_story == nil then
				arg_209_1.var_.characterEffect1081ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.0166666666666667

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1081ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1081ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1081ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1081ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0
			local var_212_7 = 0.875

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_8 = arg_209_1:FormatText(StoryNameCfg[7].name)

				arg_209_1.leftNameTxt_.text = var_212_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_9 = arg_209_1:GetWordFromCfg(1108105050)
				local var_212_10 = arg_209_1:FormatText(var_212_9.content)

				arg_209_1.text_.text = var_212_10

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_11 = 35
				local var_212_12 = utf8.len(var_212_10)
				local var_212_13 = var_212_11 <= 0 and var_212_7 or var_212_7 * (var_212_12 / var_212_11)

				if var_212_13 > 0 and var_212_7 < var_212_13 then
					arg_209_1.talkMaxDuration = var_212_13

					if var_212_13 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_13 + var_212_6
					end
				end

				arg_209_1.text_.text = var_212_10
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_14 = math.max(var_212_7, arg_209_1.talkMaxDuration)

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_14 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_6) / var_212_14

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_6 + var_212_14 and arg_209_1.time_ < var_212_6 + var_212_14 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1108105051
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1108105052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1081ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1081ui_story == nil then
				arg_213_1.var_.characterEffect1081ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1081ui_story then
					arg_213_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1081ui_story then
				arg_213_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_216_5 = 0

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_216_6 = arg_213_1.actors_["1081ui_story"].transform
			local var_216_7 = 0

			if var_216_7 < arg_213_1.time_ and arg_213_1.time_ <= var_216_7 + arg_216_0 then
				arg_213_1.var_.moveOldPos1081ui_story = var_216_6.localPosition
			end

			local var_216_8 = 0.001

			if var_216_7 <= arg_213_1.time_ and arg_213_1.time_ < var_216_7 + var_216_8 then
				local var_216_9 = (arg_213_1.time_ - var_216_7) / var_216_8
				local var_216_10 = Vector3.New(0, -0.92, -5.8)

				var_216_6.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1081ui_story, var_216_10, var_216_9)

				local var_216_11 = manager.ui.mainCamera.transform.position - var_216_6.position

				var_216_6.forward = Vector3.New(var_216_11.x, var_216_11.y, var_216_11.z)

				local var_216_12 = var_216_6.localEulerAngles

				var_216_12.z = 0
				var_216_12.x = 0
				var_216_6.localEulerAngles = var_216_12
			end

			if arg_213_1.time_ >= var_216_7 + var_216_8 and arg_213_1.time_ < var_216_7 + var_216_8 + arg_216_0 then
				var_216_6.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_216_13 = manager.ui.mainCamera.transform.position - var_216_6.position

				var_216_6.forward = Vector3.New(var_216_13.x, var_216_13.y, var_216_13.z)

				local var_216_14 = var_216_6.localEulerAngles

				var_216_14.z = 0
				var_216_14.x = 0
				var_216_6.localEulerAngles = var_216_14
			end

			local var_216_15 = 0
			local var_216_16 = 0.3

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_17 = arg_213_1:FormatText(StoryNameCfg[202].name)

				arg_213_1.leftNameTxt_.text = var_216_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_18 = arg_213_1:GetWordFromCfg(1108105051)
				local var_216_19 = arg_213_1:FormatText(var_216_18.content)

				arg_213_1.text_.text = var_216_19

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_20 = 12
				local var_216_21 = utf8.len(var_216_19)
				local var_216_22 = var_216_20 <= 0 and var_216_16 or var_216_16 * (var_216_21 / var_216_20)

				if var_216_22 > 0 and var_216_16 < var_216_22 then
					arg_213_1.talkMaxDuration = var_216_22

					if var_216_22 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_22 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_19
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_23 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_23 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_23

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_23 and arg_213_1.time_ < var_216_15 + var_216_23 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1108105052
		arg_217_1.duration_ = 1

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"

			SetActive(arg_217_1.choicesGo_, true)

			for iter_218_0, iter_218_1 in ipairs(arg_217_1.choices_) do
				local var_218_0 = iter_218_0 <= 2

				SetActive(iter_218_1.go, var_218_0)
			end

			arg_217_1.choices_[1].txt.text = arg_217_1:FormatText(StoryChoiceCfg[967].name)
			arg_217_1.choices_[2].txt.text = arg_217_1:FormatText(StoryChoiceCfg[968].name)
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1108105053(arg_217_1)
			end

			if arg_219_0 == 2 then
				arg_217_0:Play1108105053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1081ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1081ui_story == nil then
				arg_217_1.var_.characterEffect1081ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.0166666666666667

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1081ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1081ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1081ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1081ui_story.fillRatio = var_220_5
			end
		end
	end,
	Play1108105053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1108105053
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1108105054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1081ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1081ui_story == nil then
				arg_221_1.var_.characterEffect1081ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.0166666666666667

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1081ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1081ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1081ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1081ui_story.fillRatio = var_224_5
			end

			local var_224_6 = 0
			local var_224_7 = 0.575

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_9 = arg_221_1:GetWordFromCfg(1108105053)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 23
				local var_224_12 = utf8.len(var_224_10)
				local var_224_13 = var_224_11 <= 0 and var_224_7 or var_224_7 * (var_224_12 / var_224_11)

				if var_224_13 > 0 and var_224_7 < var_224_13 then
					arg_221_1.talkMaxDuration = var_224_13

					if var_224_13 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_13 + var_224_6
					end
				end

				arg_221_1.text_.text = var_224_10
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_14 and arg_221_1.time_ < var_224_6 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1108105054
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1108105055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1081ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1081ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, -0.92, -5.8)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1081ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["1081ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect1081ui_story == nil then
				arg_225_1.var_.characterEffect1081ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect1081ui_story then
					arg_225_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect1081ui_story then
				arg_225_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action2_1")
			end

			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_228_15 = 0
			local var_228_16 = 0.475

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_17 = arg_225_1:FormatText(StoryNameCfg[202].name)

				arg_225_1.leftNameTxt_.text = var_228_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_18 = arg_225_1:GetWordFromCfg(1108105054)
				local var_228_19 = arg_225_1:FormatText(var_228_18.content)

				arg_225_1.text_.text = var_228_19

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_20 = 19
				local var_228_21 = utf8.len(var_228_19)
				local var_228_22 = var_228_20 <= 0 and var_228_16 or var_228_16 * (var_228_21 / var_228_20)

				if var_228_22 > 0 and var_228_16 < var_228_22 then
					arg_225_1.talkMaxDuration = var_228_22

					if var_228_22 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_19
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_23 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_23 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_23

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_23 and arg_225_1.time_ < var_228_15 + var_228_23 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1108105055
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1108105056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1081ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1081ui_story == nil then
				arg_229_1.var_.characterEffect1081ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1081ui_story then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1081ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1081ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1081ui_story.fillRatio = var_232_5
			end

			local var_232_6 = 0
			local var_232_7 = 0.325

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[7].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(1108105055)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 13
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_14 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_14 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_14

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_14 and arg_229_1.time_ < var_232_6 + var_232_14 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1108105056
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1108105057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1081ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1081ui_story == nil then
				arg_233_1.var_.characterEffect1081ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1081ui_story then
					arg_233_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1081ui_story then
				arg_233_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_236_4 = 0

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action2_2")
			end

			local var_236_5 = 0

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 then
				arg_233_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_236_6 = 0
			local var_236_7 = 0.85

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[202].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_9 = arg_233_1:GetWordFromCfg(1108105056)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 34
				local var_236_12 = utf8.len(var_236_10)
				local var_236_13 = var_236_11 <= 0 and var_236_7 or var_236_7 * (var_236_12 / var_236_11)

				if var_236_13 > 0 and var_236_7 < var_236_13 then
					arg_233_1.talkMaxDuration = var_236_13

					if var_236_13 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_13 + var_236_6
					end
				end

				arg_233_1.text_.text = var_236_10
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_14 = math.max(var_236_7, arg_233_1.talkMaxDuration)

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_14 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_6) / var_236_14

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_6 + var_236_14 and arg_233_1.time_ < var_236_6 + var_236_14 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1108105057
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1108105058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1081ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1081ui_story == nil then
				arg_237_1.var_.characterEffect1081ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1081ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1081ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1081ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1081ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.975

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_8 = arg_237_1:GetWordFromCfg(1108105057)
				local var_240_9 = arg_237_1:FormatText(var_240_8.content)

				arg_237_1.text_.text = var_240_9

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_10 = 39
				local var_240_11 = utf8.len(var_240_9)
				local var_240_12 = var_240_10 <= 0 and var_240_7 or var_240_7 * (var_240_11 / var_240_10)

				if var_240_12 > 0 and var_240_7 < var_240_12 then
					arg_237_1.talkMaxDuration = var_240_12

					if var_240_12 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_9
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_13 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_13 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_13

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_13 and arg_237_1.time_ < var_240_6 + var_240_13 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1108105058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1108105059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1081ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1081ui_story == nil then
				arg_241_1.var_.characterEffect1081ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1081ui_story then
					arg_241_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1081ui_story then
				arg_241_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_244_4 = 0

			if var_244_4 < arg_241_1.time_ and arg_241_1.time_ <= var_244_4 + arg_244_0 then
				arg_241_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_244_5 = 0

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_244_6 = 0
			local var_244_7 = 0.45

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[202].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(1108105058)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 18
				local var_244_12 = utf8.len(var_244_10)
				local var_244_13 = var_244_11 <= 0 and var_244_7 or var_244_7 * (var_244_12 / var_244_11)

				if var_244_13 > 0 and var_244_7 < var_244_13 then
					arg_241_1.talkMaxDuration = var_244_13

					if var_244_13 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_13 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_10
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_14 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_14 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_14

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_14 and arg_241_1.time_ < var_244_6 + var_244_14 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1108105059
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1108105060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1081ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1081ui_story == nil then
				arg_245_1.var_.characterEffect1081ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.0166666666666667

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1081ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1081ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1081ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1081ui_story.fillRatio = var_248_5
			end

			local var_248_6 = arg_245_1.actors_["1081ui_story"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 and arg_245_1.var_.characterEffect1081ui_story == nil then
				arg_245_1.var_.characterEffect1081ui_story = var_248_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_8 = 0.200000002980232

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8

				if arg_245_1.var_.characterEffect1081ui_story then
					local var_248_10 = Mathf.Lerp(0, 0.5, var_248_9)

					arg_245_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1081ui_story.fillRatio = var_248_10
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 and arg_245_1.var_.characterEffect1081ui_story then
				local var_248_11 = 0.5

				arg_245_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1081ui_story.fillRatio = var_248_11
			end

			local var_248_12 = arg_245_1.actors_["1081ui_story"].transform
			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1.var_.moveOldPos1081ui_story = var_248_12.localPosition
			end

			local var_248_14 = 0.001

			if var_248_13 <= arg_245_1.time_ and arg_245_1.time_ < var_248_13 + var_248_14 then
				local var_248_15 = (arg_245_1.time_ - var_248_13) / var_248_14
				local var_248_16 = Vector3.New(0, 100, 0)

				var_248_12.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1081ui_story, var_248_16, var_248_15)

				local var_248_17 = manager.ui.mainCamera.transform.position - var_248_12.position

				var_248_12.forward = Vector3.New(var_248_17.x, var_248_17.y, var_248_17.z)

				local var_248_18 = var_248_12.localEulerAngles

				var_248_18.z = 0
				var_248_18.x = 0
				var_248_12.localEulerAngles = var_248_18
			end

			if arg_245_1.time_ >= var_248_13 + var_248_14 and arg_245_1.time_ < var_248_13 + var_248_14 + arg_248_0 then
				var_248_12.localPosition = Vector3.New(0, 100, 0)

				local var_248_19 = manager.ui.mainCamera.transform.position - var_248_12.position

				var_248_12.forward = Vector3.New(var_248_19.x, var_248_19.y, var_248_19.z)

				local var_248_20 = var_248_12.localEulerAngles

				var_248_20.z = 0
				var_248_20.x = 0
				var_248_12.localEulerAngles = var_248_20
			end

			local var_248_21 = 0
			local var_248_22 = 1.25

			if var_248_21 < arg_245_1.time_ and arg_245_1.time_ <= var_248_21 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_23 = arg_245_1:GetWordFromCfg(1108105059)
				local var_248_24 = arg_245_1:FormatText(var_248_23.content)

				arg_245_1.text_.text = var_248_24

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_25 = 50
				local var_248_26 = utf8.len(var_248_24)
				local var_248_27 = var_248_25 <= 0 and var_248_22 or var_248_22 * (var_248_26 / var_248_25)

				if var_248_27 > 0 and var_248_22 < var_248_27 then
					arg_245_1.talkMaxDuration = var_248_27

					if var_248_27 + var_248_21 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_27 + var_248_21
					end
				end

				arg_245_1.text_.text = var_248_24
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_28 = math.max(var_248_22, arg_245_1.talkMaxDuration)

			if var_248_21 <= arg_245_1.time_ and arg_245_1.time_ < var_248_21 + var_248_28 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_21) / var_248_28

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_21 + var_248_28 and arg_245_1.time_ < var_248_21 + var_248_28 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1108105060
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1108105061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1081ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1081ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -0.92, -5.8)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1081ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1081ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1081ui_story == nil then
				arg_249_1.var_.characterEffect1081ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1081ui_story then
					arg_249_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1081ui_story then
				arg_249_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_252_14 = 0
			local var_252_15 = 0.475

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_16 = arg_249_1:FormatText(StoryNameCfg[202].name)

				arg_249_1.leftNameTxt_.text = var_252_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_17 = arg_249_1:GetWordFromCfg(1108105060)
				local var_252_18 = arg_249_1:FormatText(var_252_17.content)

				arg_249_1.text_.text = var_252_18

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_19 = 19
				local var_252_20 = utf8.len(var_252_18)
				local var_252_21 = var_252_19 <= 0 and var_252_15 or var_252_15 * (var_252_20 / var_252_19)

				if var_252_21 > 0 and var_252_15 < var_252_21 then
					arg_249_1.talkMaxDuration = var_252_21

					if var_252_21 + var_252_14 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_21 + var_252_14
					end
				end

				arg_249_1.text_.text = var_252_18
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_15, arg_249_1.talkMaxDuration)

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_14) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_14 + var_252_22 and arg_249_1.time_ < var_252_14 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1108105061
		arg_253_1.duration_ = 6.17

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1108105062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_253_1.frameCnt_ <= 1 then
				arg_253_1.dialog_:SetActive(false)
			end

			local var_256_1 = 1.16666666666667
			local var_256_2 = 0.3

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				arg_253_1.dialog_:SetActive(true)

				local var_256_3 = LeanTween.value(arg_253_1.dialog_, 0, 1, 0.3)

				var_256_3:setOnUpdate(LuaHelper.FloatAction(function(arg_257_0)
					arg_253_1.dialogCg_.alpha = arg_257_0
				end))
				var_256_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_253_1.dialog_)
					var_256_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_253_1.duration_ = arg_253_1.duration_ + 0.3

				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_4 = arg_253_1:FormatText(StoryNameCfg[202].name)

				arg_253_1.leftNameTxt_.text = var_256_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_5 = arg_253_1:GetWordFromCfg(1108105061)
				local var_256_6 = arg_253_1:FormatText(var_256_5.content)

				arg_253_1.text_.text = var_256_6

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_7 = 12
				local var_256_8 = utf8.len(var_256_6)
				local var_256_9 = var_256_7 <= 0 and var_256_2 or var_256_2 * (var_256_8 / var_256_7)

				if var_256_9 > 0 and var_256_2 < var_256_9 then
					arg_253_1.talkMaxDuration = var_256_9
					var_256_1 = var_256_1 + 0.3

					if var_256_9 + var_256_1 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_9 + var_256_1
					end
				end

				arg_253_1.text_.text = var_256_6
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = var_256_1 + 0.3
			local var_256_11 = math.max(var_256_2, arg_253_1.talkMaxDuration)

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_10) / var_256_11

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 1108105062
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play1108105063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1081ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1081ui_story == nil then
				arg_259_1.var_.characterEffect1081ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1081ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1081ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1081ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1081ui_story.fillRatio = var_262_5
			end

			local var_262_6 = arg_259_1.actors_["1081ui_story"].transform
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 then
				arg_259_1.var_.moveOldPos1081ui_story = var_262_6.localPosition
			end

			local var_262_8 = 0.001

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_8 then
				local var_262_9 = (arg_259_1.time_ - var_262_7) / var_262_8
				local var_262_10 = Vector3.New(0, 100, 0)

				var_262_6.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1081ui_story, var_262_10, var_262_9)

				local var_262_11 = manager.ui.mainCamera.transform.position - var_262_6.position

				var_262_6.forward = Vector3.New(var_262_11.x, var_262_11.y, var_262_11.z)

				local var_262_12 = var_262_6.localEulerAngles

				var_262_12.z = 0
				var_262_12.x = 0
				var_262_6.localEulerAngles = var_262_12
			end

			if arg_259_1.time_ >= var_262_7 + var_262_8 and arg_259_1.time_ < var_262_7 + var_262_8 + arg_262_0 then
				var_262_6.localPosition = Vector3.New(0, 100, 0)

				local var_262_13 = manager.ui.mainCamera.transform.position - var_262_6.position

				var_262_6.forward = Vector3.New(var_262_13.x, var_262_13.y, var_262_13.z)

				local var_262_14 = var_262_6.localEulerAngles

				var_262_14.z = 0
				var_262_14.x = 0
				var_262_6.localEulerAngles = var_262_14
			end

			local var_262_15 = 0
			local var_262_16 = 1.025

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_17 = arg_259_1:GetWordFromCfg(1108105062)
				local var_262_18 = arg_259_1:FormatText(var_262_17.content)

				arg_259_1.text_.text = var_262_18

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_19 = 41
				local var_262_20 = utf8.len(var_262_18)
				local var_262_21 = var_262_19 <= 0 and var_262_16 or var_262_16 * (var_262_20 / var_262_19)

				if var_262_21 > 0 and var_262_16 < var_262_21 then
					arg_259_1.talkMaxDuration = var_262_21

					if var_262_21 + var_262_15 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_21 + var_262_15
					end
				end

				arg_259_1.text_.text = var_262_18
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_22 = math.max(var_262_16, arg_259_1.talkMaxDuration)

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_22 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_15) / var_262_22

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_15 + var_262_22 and arg_259_1.time_ < var_262_15 + var_262_22 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1108105063
		arg_263_1.duration_ = 1

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"

			SetActive(arg_263_1.choicesGo_, true)

			for iter_264_0, iter_264_1 in ipairs(arg_263_1.choices_) do
				local var_264_0 = iter_264_0 <= 2

				SetActive(iter_264_1.go, var_264_0)
			end

			arg_263_1.choices_[1].txt.text = arg_263_1:FormatText(StoryChoiceCfg[969].name)
			arg_263_1.choices_[2].txt.text = arg_263_1:FormatText(StoryChoiceCfg[970].name)
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play1108105064(arg_263_1)
			end

			if arg_265_0 == 2 then
				arg_263_0:Play1108105065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			return
		end
	end,
	Play1108105064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1108105064
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1108105066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1081ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1081ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, -0.92, -5.8)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1081ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = 0

			if var_270_9 < arg_267_1.time_ and arg_267_1.time_ <= var_270_9 + arg_270_0 then
				arg_267_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_1")
			end

			local var_270_10 = arg_267_1.actors_["1081ui_story"]
			local var_270_11 = 0

			if var_270_11 < arg_267_1.time_ and arg_267_1.time_ <= var_270_11 + arg_270_0 and arg_267_1.var_.characterEffect1081ui_story == nil then
				arg_267_1.var_.characterEffect1081ui_story = var_270_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_12 = 0.0166666666666667

			if var_270_11 <= arg_267_1.time_ and arg_267_1.time_ < var_270_11 + var_270_12 then
				local var_270_13 = (arg_267_1.time_ - var_270_11) / var_270_12

				if arg_267_1.var_.characterEffect1081ui_story then
					arg_267_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_11 + var_270_12 and arg_267_1.time_ < var_270_11 + var_270_12 + arg_270_0 and arg_267_1.var_.characterEffect1081ui_story then
				arg_267_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_270_14 = arg_267_1.actors_["1081ui_story"]
			local var_270_15 = 0

			if var_270_15 < arg_267_1.time_ and arg_267_1.time_ <= var_270_15 + arg_270_0 and arg_267_1.var_.characterEffect1081ui_story == nil then
				arg_267_1.var_.characterEffect1081ui_story = var_270_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_16 = 0.200000002980232

			if var_270_15 <= arg_267_1.time_ and arg_267_1.time_ < var_270_15 + var_270_16 then
				local var_270_17 = (arg_267_1.time_ - var_270_15) / var_270_16

				if arg_267_1.var_.characterEffect1081ui_story then
					arg_267_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_15 + var_270_16 and arg_267_1.time_ < var_270_15 + var_270_16 + arg_270_0 and arg_267_1.var_.characterEffect1081ui_story then
				arg_267_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_270_18 = 0

			if var_270_18 < arg_267_1.time_ and arg_267_1.time_ <= var_270_18 + arg_270_0 then
				arg_267_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_270_19 = 0
			local var_270_20 = 0.5

			if var_270_19 < arg_267_1.time_ and arg_267_1.time_ <= var_270_19 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_21 = arg_267_1:FormatText(StoryNameCfg[202].name)

				arg_267_1.leftNameTxt_.text = var_270_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_22 = arg_267_1:GetWordFromCfg(1108105064)
				local var_270_23 = arg_267_1:FormatText(var_270_22.content)

				arg_267_1.text_.text = var_270_23

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_24 = 20
				local var_270_25 = utf8.len(var_270_23)
				local var_270_26 = var_270_24 <= 0 and var_270_20 or var_270_20 * (var_270_25 / var_270_24)

				if var_270_26 > 0 and var_270_20 < var_270_26 then
					arg_267_1.talkMaxDuration = var_270_26

					if var_270_26 + var_270_19 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_26 + var_270_19
					end
				end

				arg_267_1.text_.text = var_270_23
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_27 = math.max(var_270_20, arg_267_1.talkMaxDuration)

			if var_270_19 <= arg_267_1.time_ and arg_267_1.time_ < var_270_19 + var_270_27 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_19) / var_270_27

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_19 + var_270_27 and arg_267_1.time_ < var_270_19 + var_270_27 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 1108105066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play1108105067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1081ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1081ui_story == nil then
				arg_271_1.var_.characterEffect1081ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.0166666666666667

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1081ui_story then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1081ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1081ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1081ui_story.fillRatio = var_274_5
			end

			local var_274_6 = 0
			local var_274_7 = 0.166666666666667

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				local var_274_8 = "play"
				local var_274_9 = "music"

				arg_271_1:AudioAction(var_274_8, var_274_9, "ui_battle", "ui_battle_stopbgm", "")

				local var_274_10 = ""
				local var_274_11 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_274_11 ~= "" then
					if arg_271_1.bgmTxt_.text ~= var_274_11 and arg_271_1.bgmTxt_.text ~= "" then
						if arg_271_1.bgmTxt2_.text ~= "" then
							arg_271_1.bgmTxt_.text = arg_271_1.bgmTxt2_.text
						end

						arg_271_1.bgmTxt2_.text = var_274_11

						arg_271_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_271_1.bgmTxt_.text = var_274_11
					end

					if arg_271_1.bgmTimer then
						arg_271_1.bgmTimer:Stop()

						arg_271_1.bgmTimer = nil
					end

					if arg_271_1.settingData.show_music_name == 1 then
						arg_271_1.musicController:SetSelectedState("show")
						arg_271_1.musicAnimator_:Play("open", 0, 0)

						if arg_271_1.settingData.music_time ~= 0 then
							arg_271_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_271_1.settingData.music_time), function()
								if arg_271_1 == nil or isNil(arg_271_1.bgmTxt_) then
									return
								end

								arg_271_1.musicController:SetSelectedState("hide")
								arg_271_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_274_12 = 0
			local var_274_13 = 0.075

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_14 = arg_271_1:FormatText(StoryNameCfg[7].name)

				arg_271_1.leftNameTxt_.text = var_274_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_15 = arg_271_1:GetWordFromCfg(1108105066)
				local var_274_16 = arg_271_1:FormatText(var_274_15.content)

				arg_271_1.text_.text = var_274_16

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_17 = 3
				local var_274_18 = utf8.len(var_274_16)
				local var_274_19 = var_274_17 <= 0 and var_274_13 or var_274_13 * (var_274_18 / var_274_17)

				if var_274_19 > 0 and var_274_13 < var_274_19 then
					arg_271_1.talkMaxDuration = var_274_19

					if var_274_19 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_12
					end
				end

				arg_271_1.text_.text = var_274_16
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_20 = math.max(var_274_13, arg_271_1.talkMaxDuration)

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_20 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_12) / var_274_20

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_12 + var_274_20 and arg_271_1.time_ < var_274_12 + var_274_20 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105067 = function(arg_276_0, arg_276_1)
		arg_276_1.time_ = 0
		arg_276_1.frameCnt_ = 0
		arg_276_1.state_ = "playing"
		arg_276_1.curTalkId_ = 1108105067
		arg_276_1.duration_ = 5

		SetActive(arg_276_1.tipsGo_, false)

		function arg_276_1.onSingleLineFinish_()
			arg_276_1.onSingleLineUpdate_ = nil
			arg_276_1.onSingleLineFinish_ = nil
			arg_276_1.state_ = "waiting"
		end

		function arg_276_1.playNext_(arg_278_0)
			if arg_278_0 == 1 then
				arg_276_0:Play1108105068(arg_276_1)
			end
		end

		function arg_276_1.onSingleLineUpdate_(arg_279_0)
			local var_279_0 = arg_276_1.actors_["1081ui_story"].transform
			local var_279_1 = 0

			if var_279_1 < arg_276_1.time_ and arg_276_1.time_ <= var_279_1 + arg_279_0 then
				arg_276_1.var_.moveOldPos1081ui_story = var_279_0.localPosition
			end

			local var_279_2 = 0.001

			if var_279_1 <= arg_276_1.time_ and arg_276_1.time_ < var_279_1 + var_279_2 then
				local var_279_3 = (arg_276_1.time_ - var_279_1) / var_279_2
				local var_279_4 = Vector3.New(0, 100, 0)

				var_279_0.localPosition = Vector3.Lerp(arg_276_1.var_.moveOldPos1081ui_story, var_279_4, var_279_3)

				local var_279_5 = manager.ui.mainCamera.transform.position - var_279_0.position

				var_279_0.forward = Vector3.New(var_279_5.x, var_279_5.y, var_279_5.z)

				local var_279_6 = var_279_0.localEulerAngles

				var_279_6.z = 0
				var_279_6.x = 0
				var_279_0.localEulerAngles = var_279_6
			end

			if arg_276_1.time_ >= var_279_1 + var_279_2 and arg_276_1.time_ < var_279_1 + var_279_2 + arg_279_0 then
				var_279_0.localPosition = Vector3.New(0, 100, 0)

				local var_279_7 = manager.ui.mainCamera.transform.position - var_279_0.position

				var_279_0.forward = Vector3.New(var_279_7.x, var_279_7.y, var_279_7.z)

				local var_279_8 = var_279_0.localEulerAngles

				var_279_8.z = 0
				var_279_8.x = 0
				var_279_0.localEulerAngles = var_279_8
			end

			local var_279_9 = 0
			local var_279_10 = 1.1

			if var_279_9 < arg_276_1.time_ and arg_276_1.time_ <= var_279_9 + arg_279_0 then
				arg_276_1.talkMaxDuration = 0
				arg_276_1.dialogCg_.alpha = 1

				arg_276_1.dialog_:SetActive(true)
				SetActive(arg_276_1.leftNameGo_, false)

				arg_276_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_276_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_276_1:RecordName(arg_276_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_276_1.iconTrs_.gameObject, false)
				arg_276_1.callingController_:SetSelectedState("normal")

				local var_279_11 = arg_276_1:GetWordFromCfg(1108105067)
				local var_279_12 = arg_276_1:FormatText(var_279_11.content)

				arg_276_1.text_.text = var_279_12

				LuaForUtil.ClearLinePrefixSymbol(arg_276_1.text_)

				local var_279_13 = 44
				local var_279_14 = utf8.len(var_279_12)
				local var_279_15 = var_279_13 <= 0 and var_279_10 or var_279_10 * (var_279_14 / var_279_13)

				if var_279_15 > 0 and var_279_10 < var_279_15 then
					arg_276_1.talkMaxDuration = var_279_15

					if var_279_15 + var_279_9 > arg_276_1.duration_ then
						arg_276_1.duration_ = var_279_15 + var_279_9
					end
				end

				arg_276_1.text_.text = var_279_12
				arg_276_1.typewritter.percent = 0

				arg_276_1.typewritter:SetDirty()
				arg_276_1:ShowNextGo(false)
				arg_276_1:RecordContent(arg_276_1.text_.text)
			end

			local var_279_16 = math.max(var_279_10, arg_276_1.talkMaxDuration)

			if var_279_9 <= arg_276_1.time_ and arg_276_1.time_ < var_279_9 + var_279_16 then
				arg_276_1.typewritter.percent = (arg_276_1.time_ - var_279_9) / var_279_16

				arg_276_1.typewritter:SetDirty()
			end

			if arg_276_1.time_ >= var_279_9 + var_279_16 and arg_276_1.time_ < var_279_9 + var_279_16 + arg_279_0 then
				arg_276_1.typewritter.percent = 1

				arg_276_1.typewritter:SetDirty()
				arg_276_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105068 = function(arg_280_0, arg_280_1)
		arg_280_1.time_ = 0
		arg_280_1.frameCnt_ = 0
		arg_280_1.state_ = "playing"
		arg_280_1.curTalkId_ = 1108105068
		arg_280_1.duration_ = 5

		SetActive(arg_280_1.tipsGo_, false)

		function arg_280_1.onSingleLineFinish_()
			arg_280_1.onSingleLineUpdate_ = nil
			arg_280_1.onSingleLineFinish_ = nil
			arg_280_1.state_ = "waiting"
		end

		function arg_280_1.playNext_(arg_282_0)
			if arg_282_0 == 1 then
				arg_280_0:Play1108105069(arg_280_1)
			end
		end

		function arg_280_1.onSingleLineUpdate_(arg_283_0)
			local var_283_0 = 0
			local var_283_1 = 0.166666666666667

			if var_283_0 < arg_280_1.time_ and arg_280_1.time_ <= var_283_0 + arg_283_0 then
				local var_283_2 = "play"
				local var_283_3 = "music"

				arg_280_1:AudioAction(var_283_2, var_283_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_283_4 = ""
				local var_283_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_283_5 ~= "" then
					if arg_280_1.bgmTxt_.text ~= var_283_5 and arg_280_1.bgmTxt_.text ~= "" then
						if arg_280_1.bgmTxt2_.text ~= "" then
							arg_280_1.bgmTxt_.text = arg_280_1.bgmTxt2_.text
						end

						arg_280_1.bgmTxt2_.text = var_283_5

						arg_280_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_280_1.bgmTxt_.text = var_283_5
					end

					if arg_280_1.bgmTimer then
						arg_280_1.bgmTimer:Stop()

						arg_280_1.bgmTimer = nil
					end

					if arg_280_1.settingData.show_music_name == 1 then
						arg_280_1.musicController:SetSelectedState("show")
						arg_280_1.musicAnimator_:Play("open", 0, 0)

						if arg_280_1.settingData.music_time ~= 0 then
							arg_280_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_280_1.settingData.music_time), function()
								if arg_280_1 == nil or isNil(arg_280_1.bgmTxt_) then
									return
								end

								arg_280_1.musicController:SetSelectedState("hide")
								arg_280_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_283_6 = 0.3
			local var_283_7 = 1

			if var_283_6 < arg_280_1.time_ and arg_280_1.time_ <= var_283_6 + arg_283_0 then
				local var_283_8 = "play"
				local var_283_9 = "music"

				arg_280_1:AudioAction(var_283_8, var_283_9, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")

				local var_283_10 = ""
				local var_283_11 = manager.audio:GetAudioName("bgm_side_daily03", "bgm_side_daily03")

				if var_283_11 ~= "" then
					if arg_280_1.bgmTxt_.text ~= var_283_11 and arg_280_1.bgmTxt_.text ~= "" then
						if arg_280_1.bgmTxt2_.text ~= "" then
							arg_280_1.bgmTxt_.text = arg_280_1.bgmTxt2_.text
						end

						arg_280_1.bgmTxt2_.text = var_283_11

						arg_280_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_280_1.bgmTxt_.text = var_283_11
					end

					if arg_280_1.bgmTimer then
						arg_280_1.bgmTimer:Stop()

						arg_280_1.bgmTimer = nil
					end

					if arg_280_1.settingData.show_music_name == 1 then
						arg_280_1.musicController:SetSelectedState("show")
						arg_280_1.musicAnimator_:Play("open", 0, 0)

						if arg_280_1.settingData.music_time ~= 0 then
							arg_280_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_280_1.settingData.music_time), function()
								if arg_280_1 == nil or isNil(arg_280_1.bgmTxt_) then
									return
								end

								arg_280_1.musicController:SetSelectedState("hide")
								arg_280_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_283_12 = 0
			local var_283_13 = 0.475

			if var_283_12 < arg_280_1.time_ and arg_280_1.time_ <= var_283_12 + arg_283_0 then
				arg_280_1.talkMaxDuration = 0
				arg_280_1.dialogCg_.alpha = 1

				arg_280_1.dialog_:SetActive(true)
				SetActive(arg_280_1.leftNameGo_, true)

				local var_283_14 = arg_280_1:FormatText(StoryNameCfg[7].name)

				arg_280_1.leftNameTxt_.text = var_283_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_280_1.leftNameTxt_.transform)

				arg_280_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_280_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_280_1:RecordName(arg_280_1.leftNameTxt_.text)
				SetActive(arg_280_1.iconTrs_.gameObject, false)
				arg_280_1.callingController_:SetSelectedState("normal")

				local var_283_15 = arg_280_1:GetWordFromCfg(1108105068)
				local var_283_16 = arg_280_1:FormatText(var_283_15.content)

				arg_280_1.text_.text = var_283_16

				LuaForUtil.ClearLinePrefixSymbol(arg_280_1.text_)

				local var_283_17 = 19
				local var_283_18 = utf8.len(var_283_16)
				local var_283_19 = var_283_17 <= 0 and var_283_13 or var_283_13 * (var_283_18 / var_283_17)

				if var_283_19 > 0 and var_283_13 < var_283_19 then
					arg_280_1.talkMaxDuration = var_283_19

					if var_283_19 + var_283_12 > arg_280_1.duration_ then
						arg_280_1.duration_ = var_283_19 + var_283_12
					end
				end

				arg_280_1.text_.text = var_283_16
				arg_280_1.typewritter.percent = 0

				arg_280_1.typewritter:SetDirty()
				arg_280_1:ShowNextGo(false)
				arg_280_1:RecordContent(arg_280_1.text_.text)
			end

			local var_283_20 = math.max(var_283_13, arg_280_1.talkMaxDuration)

			if var_283_12 <= arg_280_1.time_ and arg_280_1.time_ < var_283_12 + var_283_20 then
				arg_280_1.typewritter.percent = (arg_280_1.time_ - var_283_12) / var_283_20

				arg_280_1.typewritter:SetDirty()
			end

			if arg_280_1.time_ >= var_283_12 + var_283_20 and arg_280_1.time_ < var_283_12 + var_283_20 + arg_283_0 then
				arg_280_1.typewritter.percent = 1

				arg_280_1.typewritter:SetDirty()
				arg_280_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105069 = function(arg_286_0, arg_286_1)
		arg_286_1.time_ = 0
		arg_286_1.frameCnt_ = 0
		arg_286_1.state_ = "playing"
		arg_286_1.curTalkId_ = 1108105069
		arg_286_1.duration_ = 5

		SetActive(arg_286_1.tipsGo_, false)

		function arg_286_1.onSingleLineFinish_()
			arg_286_1.onSingleLineUpdate_ = nil
			arg_286_1.onSingleLineFinish_ = nil
			arg_286_1.state_ = "waiting"
		end

		function arg_286_1.playNext_(arg_288_0)
			if arg_288_0 == 1 then
				arg_286_0:Play1108105070(arg_286_1)
			end
		end

		function arg_286_1.onSingleLineUpdate_(arg_289_0)
			local var_289_0 = 0
			local var_289_1 = 0.7

			if var_289_0 < arg_286_1.time_ and arg_286_1.time_ <= var_289_0 + arg_289_0 then
				arg_286_1.talkMaxDuration = 0
				arg_286_1.dialogCg_.alpha = 1

				arg_286_1.dialog_:SetActive(true)
				SetActive(arg_286_1.leftNameGo_, true)

				local var_289_2 = arg_286_1:FormatText(StoryNameCfg[7].name)

				arg_286_1.leftNameTxt_.text = var_289_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_286_1.leftNameTxt_.transform)

				arg_286_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_286_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_286_1:RecordName(arg_286_1.leftNameTxt_.text)
				SetActive(arg_286_1.iconTrs_.gameObject, false)
				arg_286_1.callingController_:SetSelectedState("normal")

				local var_289_3 = arg_286_1:GetWordFromCfg(1108105069)
				local var_289_4 = arg_286_1:FormatText(var_289_3.content)

				arg_286_1.text_.text = var_289_4

				LuaForUtil.ClearLinePrefixSymbol(arg_286_1.text_)

				local var_289_5 = 28
				local var_289_6 = utf8.len(var_289_4)
				local var_289_7 = var_289_5 <= 0 and var_289_1 or var_289_1 * (var_289_6 / var_289_5)

				if var_289_7 > 0 and var_289_1 < var_289_7 then
					arg_286_1.talkMaxDuration = var_289_7

					if var_289_7 + var_289_0 > arg_286_1.duration_ then
						arg_286_1.duration_ = var_289_7 + var_289_0
					end
				end

				arg_286_1.text_.text = var_289_4
				arg_286_1.typewritter.percent = 0

				arg_286_1.typewritter:SetDirty()
				arg_286_1:ShowNextGo(false)
				arg_286_1:RecordContent(arg_286_1.text_.text)
			end

			local var_289_8 = math.max(var_289_1, arg_286_1.talkMaxDuration)

			if var_289_0 <= arg_286_1.time_ and arg_286_1.time_ < var_289_0 + var_289_8 then
				arg_286_1.typewritter.percent = (arg_286_1.time_ - var_289_0) / var_289_8

				arg_286_1.typewritter:SetDirty()
			end

			if arg_286_1.time_ >= var_289_0 + var_289_8 and arg_286_1.time_ < var_289_0 + var_289_8 + arg_289_0 then
				arg_286_1.typewritter.percent = 1

				arg_286_1.typewritter:SetDirty()
				arg_286_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105070 = function(arg_290_0, arg_290_1)
		arg_290_1.time_ = 0
		arg_290_1.frameCnt_ = 0
		arg_290_1.state_ = "playing"
		arg_290_1.curTalkId_ = 1108105070
		arg_290_1.duration_ = 5

		SetActive(arg_290_1.tipsGo_, false)

		function arg_290_1.onSingleLineFinish_()
			arg_290_1.onSingleLineUpdate_ = nil
			arg_290_1.onSingleLineFinish_ = nil
			arg_290_1.state_ = "waiting"
		end

		function arg_290_1.playNext_(arg_292_0)
			if arg_292_0 == 1 then
				arg_290_0:Play1108105071(arg_290_1)
			end
		end

		function arg_290_1.onSingleLineUpdate_(arg_293_0)
			local var_293_0 = arg_290_1.actors_["1081ui_story"].transform
			local var_293_1 = 0

			if var_293_1 < arg_290_1.time_ and arg_290_1.time_ <= var_293_1 + arg_293_0 then
				arg_290_1.var_.moveOldPos1081ui_story = var_293_0.localPosition
			end

			local var_293_2 = 0.001

			if var_293_1 <= arg_290_1.time_ and arg_290_1.time_ < var_293_1 + var_293_2 then
				local var_293_3 = (arg_290_1.time_ - var_293_1) / var_293_2
				local var_293_4 = Vector3.New(0, -0.92, -5.8)

				var_293_0.localPosition = Vector3.Lerp(arg_290_1.var_.moveOldPos1081ui_story, var_293_4, var_293_3)

				local var_293_5 = manager.ui.mainCamera.transform.position - var_293_0.position

				var_293_0.forward = Vector3.New(var_293_5.x, var_293_5.y, var_293_5.z)

				local var_293_6 = var_293_0.localEulerAngles

				var_293_6.z = 0
				var_293_6.x = 0
				var_293_0.localEulerAngles = var_293_6
			end

			if arg_290_1.time_ >= var_293_1 + var_293_2 and arg_290_1.time_ < var_293_1 + var_293_2 + arg_293_0 then
				var_293_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_293_7 = manager.ui.mainCamera.transform.position - var_293_0.position

				var_293_0.forward = Vector3.New(var_293_7.x, var_293_7.y, var_293_7.z)

				local var_293_8 = var_293_0.localEulerAngles

				var_293_8.z = 0
				var_293_8.x = 0
				var_293_0.localEulerAngles = var_293_8
			end

			local var_293_9 = arg_290_1.actors_["1081ui_story"]
			local var_293_10 = 0

			if var_293_10 < arg_290_1.time_ and arg_290_1.time_ <= var_293_10 + arg_293_0 and arg_290_1.var_.characterEffect1081ui_story == nil then
				arg_290_1.var_.characterEffect1081ui_story = var_293_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_293_11 = 0.200000002980232

			if var_293_10 <= arg_290_1.time_ and arg_290_1.time_ < var_293_10 + var_293_11 then
				local var_293_12 = (arg_290_1.time_ - var_293_10) / var_293_11

				if arg_290_1.var_.characterEffect1081ui_story then
					arg_290_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_290_1.time_ >= var_293_10 + var_293_11 and arg_290_1.time_ < var_293_10 + var_293_11 + arg_293_0 and arg_290_1.var_.characterEffect1081ui_story then
				arg_290_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_293_13 = 0

			if var_293_13 < arg_290_1.time_ and arg_290_1.time_ <= var_293_13 + arg_293_0 then
				arg_290_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_293_14 = 0

			if var_293_14 < arg_290_1.time_ and arg_290_1.time_ <= var_293_14 + arg_293_0 then
				arg_290_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_293_15 = 0
			local var_293_16 = 0.65

			if var_293_15 < arg_290_1.time_ and arg_290_1.time_ <= var_293_15 + arg_293_0 then
				arg_290_1.talkMaxDuration = 0
				arg_290_1.dialogCg_.alpha = 1

				arg_290_1.dialog_:SetActive(true)
				SetActive(arg_290_1.leftNameGo_, true)

				local var_293_17 = arg_290_1:FormatText(StoryNameCfg[202].name)

				arg_290_1.leftNameTxt_.text = var_293_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_290_1.leftNameTxt_.transform)

				arg_290_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_290_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_290_1:RecordName(arg_290_1.leftNameTxt_.text)
				SetActive(arg_290_1.iconTrs_.gameObject, false)
				arg_290_1.callingController_:SetSelectedState("normal")

				local var_293_18 = arg_290_1:GetWordFromCfg(1108105070)
				local var_293_19 = arg_290_1:FormatText(var_293_18.content)

				arg_290_1.text_.text = var_293_19

				LuaForUtil.ClearLinePrefixSymbol(arg_290_1.text_)

				local var_293_20 = 26
				local var_293_21 = utf8.len(var_293_19)
				local var_293_22 = var_293_20 <= 0 and var_293_16 or var_293_16 * (var_293_21 / var_293_20)

				if var_293_22 > 0 and var_293_16 < var_293_22 then
					arg_290_1.talkMaxDuration = var_293_22

					if var_293_22 + var_293_15 > arg_290_1.duration_ then
						arg_290_1.duration_ = var_293_22 + var_293_15
					end
				end

				arg_290_1.text_.text = var_293_19
				arg_290_1.typewritter.percent = 0

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(false)
				arg_290_1:RecordContent(arg_290_1.text_.text)
			end

			local var_293_23 = math.max(var_293_16, arg_290_1.talkMaxDuration)

			if var_293_15 <= arg_290_1.time_ and arg_290_1.time_ < var_293_15 + var_293_23 then
				arg_290_1.typewritter.percent = (arg_290_1.time_ - var_293_15) / var_293_23

				arg_290_1.typewritter:SetDirty()
			end

			if arg_290_1.time_ >= var_293_15 + var_293_23 and arg_290_1.time_ < var_293_15 + var_293_23 + arg_293_0 then
				arg_290_1.typewritter.percent = 1

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105071 = function(arg_294_0, arg_294_1)
		arg_294_1.time_ = 0
		arg_294_1.frameCnt_ = 0
		arg_294_1.state_ = "playing"
		arg_294_1.curTalkId_ = 1108105071
		arg_294_1.duration_ = 5

		SetActive(arg_294_1.tipsGo_, false)

		function arg_294_1.onSingleLineFinish_()
			arg_294_1.onSingleLineUpdate_ = nil
			arg_294_1.onSingleLineFinish_ = nil
			arg_294_1.state_ = "waiting"
		end

		function arg_294_1.playNext_(arg_296_0)
			if arg_296_0 == 1 then
				arg_294_0:Play1108105072(arg_294_1)
			end
		end

		function arg_294_1.onSingleLineUpdate_(arg_297_0)
			local var_297_0 = arg_294_1.actors_["1081ui_story"]
			local var_297_1 = 0

			if var_297_1 < arg_294_1.time_ and arg_294_1.time_ <= var_297_1 + arg_297_0 and arg_294_1.var_.characterEffect1081ui_story == nil then
				arg_294_1.var_.characterEffect1081ui_story = var_297_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_297_2 = 0.200000002980232

			if var_297_1 <= arg_294_1.time_ and arg_294_1.time_ < var_297_1 + var_297_2 then
				local var_297_3 = (arg_294_1.time_ - var_297_1) / var_297_2

				if arg_294_1.var_.characterEffect1081ui_story then
					local var_297_4 = Mathf.Lerp(0, 0.5, var_297_3)

					arg_294_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_294_1.var_.characterEffect1081ui_story.fillRatio = var_297_4
				end
			end

			if arg_294_1.time_ >= var_297_1 + var_297_2 and arg_294_1.time_ < var_297_1 + var_297_2 + arg_297_0 and arg_294_1.var_.characterEffect1081ui_story then
				local var_297_5 = 0.5

				arg_294_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_294_1.var_.characterEffect1081ui_story.fillRatio = var_297_5
			end

			local var_297_6 = 0
			local var_297_7 = 1.05

			if var_297_6 < arg_294_1.time_ and arg_294_1.time_ <= var_297_6 + arg_297_0 then
				arg_294_1.talkMaxDuration = 0
				arg_294_1.dialogCg_.alpha = 1

				arg_294_1.dialog_:SetActive(true)
				SetActive(arg_294_1.leftNameGo_, false)

				arg_294_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_294_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_294_1:RecordName(arg_294_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_294_1.iconTrs_.gameObject, false)
				arg_294_1.callingController_:SetSelectedState("normal")

				local var_297_8 = arg_294_1:GetWordFromCfg(1108105071)
				local var_297_9 = arg_294_1:FormatText(var_297_8.content)

				arg_294_1.text_.text = var_297_9

				LuaForUtil.ClearLinePrefixSymbol(arg_294_1.text_)

				local var_297_10 = 42
				local var_297_11 = utf8.len(var_297_9)
				local var_297_12 = var_297_10 <= 0 and var_297_7 or var_297_7 * (var_297_11 / var_297_10)

				if var_297_12 > 0 and var_297_7 < var_297_12 then
					arg_294_1.talkMaxDuration = var_297_12

					if var_297_12 + var_297_6 > arg_294_1.duration_ then
						arg_294_1.duration_ = var_297_12 + var_297_6
					end
				end

				arg_294_1.text_.text = var_297_9
				arg_294_1.typewritter.percent = 0

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(false)
				arg_294_1:RecordContent(arg_294_1.text_.text)
			end

			local var_297_13 = math.max(var_297_7, arg_294_1.talkMaxDuration)

			if var_297_6 <= arg_294_1.time_ and arg_294_1.time_ < var_297_6 + var_297_13 then
				arg_294_1.typewritter.percent = (arg_294_1.time_ - var_297_6) / var_297_13

				arg_294_1.typewritter:SetDirty()
			end

			if arg_294_1.time_ >= var_297_6 + var_297_13 and arg_294_1.time_ < var_297_6 + var_297_13 + arg_297_0 then
				arg_294_1.typewritter.percent = 1

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105072 = function(arg_298_0, arg_298_1)
		arg_298_1.time_ = 0
		arg_298_1.frameCnt_ = 0
		arg_298_1.state_ = "playing"
		arg_298_1.curTalkId_ = 1108105072
		arg_298_1.duration_ = 1

		SetActive(arg_298_1.tipsGo_, false)

		function arg_298_1.onSingleLineFinish_()
			arg_298_1.onSingleLineUpdate_ = nil
			arg_298_1.onSingleLineFinish_ = nil
			arg_298_1.state_ = "waiting"

			SetActive(arg_298_1.choicesGo_, true)

			for iter_299_0, iter_299_1 in ipairs(arg_298_1.choices_) do
				local var_299_0 = iter_299_0 <= 2

				SetActive(iter_299_1.go, var_299_0)
			end

			arg_298_1.choices_[1].txt.text = arg_298_1:FormatText(StoryChoiceCfg[971].name)
			arg_298_1.choices_[2].txt.text = arg_298_1:FormatText(StoryChoiceCfg[972].name)
		end

		function arg_298_1.playNext_(arg_300_0)
			if arg_300_0 == 1 then
				arg_298_0:Play1108105073(arg_298_1)
			end

			if arg_300_0 == 2 then
				arg_298_0:Play1108105073(arg_298_1)
			end
		end

		function arg_298_1.onSingleLineUpdate_(arg_301_0)
			return
		end
	end,
	Play1108105073 = function(arg_302_0, arg_302_1)
		arg_302_1.time_ = 0
		arg_302_1.frameCnt_ = 0
		arg_302_1.state_ = "playing"
		arg_302_1.curTalkId_ = 1108105073
		arg_302_1.duration_ = 5

		SetActive(arg_302_1.tipsGo_, false)

		function arg_302_1.onSingleLineFinish_()
			arg_302_1.onSingleLineUpdate_ = nil
			arg_302_1.onSingleLineFinish_ = nil
			arg_302_1.state_ = "waiting"
		end

		function arg_302_1.playNext_(arg_304_0)
			if arg_304_0 == 1 then
				arg_302_0:Play1108105074(arg_302_1)
			end
		end

		function arg_302_1.onSingleLineUpdate_(arg_305_0)
			local var_305_0 = arg_302_1.actors_["1081ui_story"]
			local var_305_1 = 0

			if var_305_1 < arg_302_1.time_ and arg_302_1.time_ <= var_305_1 + arg_305_0 and arg_302_1.var_.characterEffect1081ui_story == nil then
				arg_302_1.var_.characterEffect1081ui_story = var_305_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_305_2 = 0.200000002980232

			if var_305_1 <= arg_302_1.time_ and arg_302_1.time_ < var_305_1 + var_305_2 then
				local var_305_3 = (arg_302_1.time_ - var_305_1) / var_305_2

				if arg_302_1.var_.characterEffect1081ui_story then
					arg_302_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_302_1.time_ >= var_305_1 + var_305_2 and arg_302_1.time_ < var_305_1 + var_305_2 + arg_305_0 and arg_302_1.var_.characterEffect1081ui_story then
				arg_302_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_305_4 = "1081ui_story"

			if arg_302_1.actors_[var_305_4] == nil then
				local var_305_5 = Object.Instantiate(Asset.Load("Char/" .. var_305_4), arg_302_1.stage_.transform)

				var_305_5.name = var_305_4
				var_305_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_302_1.actors_[var_305_4] = var_305_5

				local var_305_6 = var_305_5:GetComponentInChildren(typeof(CharacterEffect))

				var_305_6.enabled = true

				local var_305_7 = GameObjectTools.GetOrAddComponent(var_305_5, typeof(DynamicBoneHelper))

				if var_305_7 then
					var_305_7:EnableDynamicBone(false)
				end

				arg_302_1:ShowWeapon(var_305_6.transform, false)

				arg_302_1.var_[var_305_4 .. "Animator"] = var_305_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_302_1.var_[var_305_4 .. "Animator"].applyRootMotion = true
				arg_302_1.var_[var_305_4 .. "LipSync"] = var_305_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_305_8 = 0

			if var_305_8 < arg_302_1.time_ and arg_302_1.time_ <= var_305_8 + arg_305_0 then
				arg_302_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_305_9 = "1081ui_story"

			if arg_302_1.actors_[var_305_9] == nil then
				local var_305_10 = Object.Instantiate(Asset.Load("Char/" .. var_305_9), arg_302_1.stage_.transform)

				var_305_10.name = var_305_9
				var_305_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_302_1.actors_[var_305_9] = var_305_10

				local var_305_11 = var_305_10:GetComponentInChildren(typeof(CharacterEffect))

				var_305_11.enabled = true

				local var_305_12 = GameObjectTools.GetOrAddComponent(var_305_10, typeof(DynamicBoneHelper))

				if var_305_12 then
					var_305_12:EnableDynamicBone(false)
				end

				arg_302_1:ShowWeapon(var_305_11.transform, false)

				arg_302_1.var_[var_305_9 .. "Animator"] = var_305_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_302_1.var_[var_305_9 .. "Animator"].applyRootMotion = true
				arg_302_1.var_[var_305_9 .. "LipSync"] = var_305_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_305_13 = 0

			if var_305_13 < arg_302_1.time_ and arg_302_1.time_ <= var_305_13 + arg_305_0 then
				arg_302_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_305_14 = 0
			local var_305_15 = 0.6

			if var_305_14 < arg_302_1.time_ and arg_302_1.time_ <= var_305_14 + arg_305_0 then
				arg_302_1.talkMaxDuration = 0
				arg_302_1.dialogCg_.alpha = 1

				arg_302_1.dialog_:SetActive(true)
				SetActive(arg_302_1.leftNameGo_, true)

				local var_305_16 = arg_302_1:FormatText(StoryNameCfg[202].name)

				arg_302_1.leftNameTxt_.text = var_305_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_302_1.leftNameTxt_.transform)

				arg_302_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_302_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_302_1:RecordName(arg_302_1.leftNameTxt_.text)
				SetActive(arg_302_1.iconTrs_.gameObject, false)
				arg_302_1.callingController_:SetSelectedState("normal")

				local var_305_17 = arg_302_1:GetWordFromCfg(1108105073)
				local var_305_18 = arg_302_1:FormatText(var_305_17.content)

				arg_302_1.text_.text = var_305_18

				LuaForUtil.ClearLinePrefixSymbol(arg_302_1.text_)

				local var_305_19 = 24
				local var_305_20 = utf8.len(var_305_18)
				local var_305_21 = var_305_19 <= 0 and var_305_15 or var_305_15 * (var_305_20 / var_305_19)

				if var_305_21 > 0 and var_305_15 < var_305_21 then
					arg_302_1.talkMaxDuration = var_305_21

					if var_305_21 + var_305_14 > arg_302_1.duration_ then
						arg_302_1.duration_ = var_305_21 + var_305_14
					end
				end

				arg_302_1.text_.text = var_305_18
				arg_302_1.typewritter.percent = 0

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(false)
				arg_302_1:RecordContent(arg_302_1.text_.text)
			end

			local var_305_22 = math.max(var_305_15, arg_302_1.talkMaxDuration)

			if var_305_14 <= arg_302_1.time_ and arg_302_1.time_ < var_305_14 + var_305_22 then
				arg_302_1.typewritter.percent = (arg_302_1.time_ - var_305_14) / var_305_22

				arg_302_1.typewritter:SetDirty()
			end

			if arg_302_1.time_ >= var_305_14 + var_305_22 and arg_302_1.time_ < var_305_14 + var_305_22 + arg_305_0 then
				arg_302_1.typewritter.percent = 1

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105074 = function(arg_306_0, arg_306_1)
		arg_306_1.time_ = 0
		arg_306_1.frameCnt_ = 0
		arg_306_1.state_ = "playing"
		arg_306_1.curTalkId_ = 1108105074
		arg_306_1.duration_ = 5

		SetActive(arg_306_1.tipsGo_, false)

		function arg_306_1.onSingleLineFinish_()
			arg_306_1.onSingleLineUpdate_ = nil
			arg_306_1.onSingleLineFinish_ = nil
			arg_306_1.state_ = "waiting"
		end

		function arg_306_1.playNext_(arg_308_0)
			if arg_308_0 == 1 then
				arg_306_0:Play1108105075(arg_306_1)
			end
		end

		function arg_306_1.onSingleLineUpdate_(arg_309_0)
			local var_309_0 = arg_306_1.actors_["1081ui_story"].transform
			local var_309_1 = 0

			if var_309_1 < arg_306_1.time_ and arg_306_1.time_ <= var_309_1 + arg_309_0 then
				arg_306_1.var_.moveOldPos1081ui_story = var_309_0.localPosition
			end

			local var_309_2 = 0.001

			if var_309_1 <= arg_306_1.time_ and arg_306_1.time_ < var_309_1 + var_309_2 then
				local var_309_3 = (arg_306_1.time_ - var_309_1) / var_309_2
				local var_309_4 = Vector3.New(0, 100, 0)

				var_309_0.localPosition = Vector3.Lerp(arg_306_1.var_.moveOldPos1081ui_story, var_309_4, var_309_3)

				local var_309_5 = manager.ui.mainCamera.transform.position - var_309_0.position

				var_309_0.forward = Vector3.New(var_309_5.x, var_309_5.y, var_309_5.z)

				local var_309_6 = var_309_0.localEulerAngles

				var_309_6.z = 0
				var_309_6.x = 0
				var_309_0.localEulerAngles = var_309_6
			end

			if arg_306_1.time_ >= var_309_1 + var_309_2 and arg_306_1.time_ < var_309_1 + var_309_2 + arg_309_0 then
				var_309_0.localPosition = Vector3.New(0, 100, 0)

				local var_309_7 = manager.ui.mainCamera.transform.position - var_309_0.position

				var_309_0.forward = Vector3.New(var_309_7.x, var_309_7.y, var_309_7.z)

				local var_309_8 = var_309_0.localEulerAngles

				var_309_8.z = 0
				var_309_8.x = 0
				var_309_0.localEulerAngles = var_309_8
			end

			local var_309_9 = 0
			local var_309_10 = 0.4

			if var_309_9 < arg_306_1.time_ and arg_306_1.time_ <= var_309_9 + arg_309_0 then
				arg_306_1.talkMaxDuration = 0
				arg_306_1.dialogCg_.alpha = 1

				arg_306_1.dialog_:SetActive(true)
				SetActive(arg_306_1.leftNameGo_, true)

				local var_309_11 = arg_306_1:FormatText(StoryNameCfg[55].name)

				arg_306_1.leftNameTxt_.text = var_309_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_306_1.leftNameTxt_.transform)

				arg_306_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_306_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_306_1:RecordName(arg_306_1.leftNameTxt_.text)
				SetActive(arg_306_1.iconTrs_.gameObject, true)
				arg_306_1.iconController_:SetSelectedState("hero")

				arg_306_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_306_1.callingController_:SetSelectedState("normal")

				arg_306_1.keyicon_.color = Color.New(1, 1, 1)
				arg_306_1.icon_.color = Color.New(1, 1, 1)

				local var_309_12 = arg_306_1:GetWordFromCfg(1108105074)
				local var_309_13 = arg_306_1:FormatText(var_309_12.content)

				arg_306_1.text_.text = var_309_13

				LuaForUtil.ClearLinePrefixSymbol(arg_306_1.text_)

				local var_309_14 = 16
				local var_309_15 = utf8.len(var_309_13)
				local var_309_16 = var_309_14 <= 0 and var_309_10 or var_309_10 * (var_309_15 / var_309_14)

				if var_309_16 > 0 and var_309_10 < var_309_16 then
					arg_306_1.talkMaxDuration = var_309_16

					if var_309_16 + var_309_9 > arg_306_1.duration_ then
						arg_306_1.duration_ = var_309_16 + var_309_9
					end
				end

				arg_306_1.text_.text = var_309_13
				arg_306_1.typewritter.percent = 0

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(false)
				arg_306_1:RecordContent(arg_306_1.text_.text)
			end

			local var_309_17 = math.max(var_309_10, arg_306_1.talkMaxDuration)

			if var_309_9 <= arg_306_1.time_ and arg_306_1.time_ < var_309_9 + var_309_17 then
				arg_306_1.typewritter.percent = (arg_306_1.time_ - var_309_9) / var_309_17

				arg_306_1.typewritter:SetDirty()
			end

			if arg_306_1.time_ >= var_309_9 + var_309_17 and arg_306_1.time_ < var_309_9 + var_309_17 + arg_309_0 then
				arg_306_1.typewritter.percent = 1

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105075 = function(arg_310_0, arg_310_1)
		arg_310_1.time_ = 0
		arg_310_1.frameCnt_ = 0
		arg_310_1.state_ = "playing"
		arg_310_1.curTalkId_ = 1108105075
		arg_310_1.duration_ = 7.03

		SetActive(arg_310_1.tipsGo_, false)

		function arg_310_1.onSingleLineFinish_()
			arg_310_1.onSingleLineUpdate_ = nil
			arg_310_1.onSingleLineFinish_ = nil
			arg_310_1.state_ = "waiting"
		end

		function arg_310_1.playNext_(arg_312_0)
			if arg_312_0 == 1 then
				arg_310_0:Play1108105076(arg_310_1)
			end
		end

		function arg_310_1.onSingleLineUpdate_(arg_313_0)
			local var_313_0 = 1

			if var_313_0 < arg_310_1.time_ and arg_310_1.time_ <= var_313_0 + arg_313_0 then
				local var_313_1 = manager.ui.mainCamera.transform.localPosition
				local var_313_2 = Vector3.New(0, 0, 10) + Vector3.New(var_313_1.x, var_313_1.y, 0)
				local var_313_3 = arg_310_1.bgs_.ST0403a

				var_313_3.transform.localPosition = var_313_2
				var_313_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_313_4 = var_313_3:GetComponent("SpriteRenderer")

				if var_313_4 and var_313_4.sprite then
					local var_313_5 = (var_313_3.transform.localPosition - var_313_1).z
					local var_313_6 = manager.ui.mainCameraCom_
					local var_313_7 = 2 * var_313_5 * Mathf.Tan(var_313_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_313_8 = var_313_7 * var_313_6.aspect
					local var_313_9 = var_313_4.sprite.bounds.size.x
					local var_313_10 = var_313_4.sprite.bounds.size.y
					local var_313_11 = var_313_8 / var_313_9
					local var_313_12 = var_313_7 / var_313_10
					local var_313_13 = var_313_12 < var_313_11 and var_313_11 or var_313_12

					var_313_3.transform.localScale = Vector3.New(var_313_13, var_313_13, 0)
				end

				for iter_313_0, iter_313_1 in pairs(arg_310_1.bgs_) do
					if iter_313_0 ~= "ST0403a" then
						iter_313_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_313_14 = 2.03333333333333

			if var_313_14 < arg_310_1.time_ and arg_310_1.time_ <= var_313_14 + arg_313_0 then
				arg_310_1.allBtn_.enabled = false
			end

			local var_313_15 = 0.3

			if arg_310_1.time_ >= var_313_14 + var_313_15 and arg_310_1.time_ < var_313_14 + var_313_15 + arg_313_0 then
				arg_310_1.allBtn_.enabled = true
			end

			local var_313_16 = 0

			if var_313_16 < arg_310_1.time_ and arg_310_1.time_ <= var_313_16 + arg_313_0 then
				arg_310_1.mask_.enabled = true
				arg_310_1.mask_.raycastTarget = true

				arg_310_1:SetGaussion(false)
			end

			local var_313_17 = 0.966666666666667

			if var_313_16 <= arg_310_1.time_ and arg_310_1.time_ < var_313_16 + var_313_17 then
				local var_313_18 = (arg_310_1.time_ - var_313_16) / var_313_17
				local var_313_19 = Color.New(0, 0, 0)

				var_313_19.a = Mathf.Lerp(0, 1, var_313_18)
				arg_310_1.mask_.color = var_313_19
			end

			if arg_310_1.time_ >= var_313_16 + var_313_17 and arg_310_1.time_ < var_313_16 + var_313_17 + arg_313_0 then
				local var_313_20 = Color.New(0, 0, 0)

				var_313_20.a = 1
				arg_310_1.mask_.color = var_313_20
			end

			local var_313_21 = 0.966666666666667

			if var_313_21 < arg_310_1.time_ and arg_310_1.time_ <= var_313_21 + arg_313_0 then
				arg_310_1.mask_.enabled = true
				arg_310_1.mask_.raycastTarget = true

				arg_310_1:SetGaussion(false)
			end

			local var_313_22 = 2.03333333333333

			if var_313_21 <= arg_310_1.time_ and arg_310_1.time_ < var_313_21 + var_313_22 then
				local var_313_23 = (arg_310_1.time_ - var_313_21) / var_313_22
				local var_313_24 = Color.New(0, 0, 0)

				var_313_24.a = Mathf.Lerp(1, 0, var_313_23)
				arg_310_1.mask_.color = var_313_24
			end

			if arg_310_1.time_ >= var_313_21 + var_313_22 and arg_310_1.time_ < var_313_21 + var_313_22 + arg_313_0 then
				local var_313_25 = Color.New(0, 0, 0)
				local var_313_26 = 0

				arg_310_1.mask_.enabled = false
				var_313_25.a = var_313_26
				arg_310_1.mask_.color = var_313_25
			end

			local var_313_27 = arg_310_1.actors_["1080ui_story"].transform
			local var_313_28 = 0.95

			if var_313_28 < arg_310_1.time_ and arg_310_1.time_ <= var_313_28 + arg_313_0 then
				arg_310_1.var_.moveOldPos1080ui_story = var_313_27.localPosition
			end

			local var_313_29 = 0.001

			if var_313_28 <= arg_310_1.time_ and arg_310_1.time_ < var_313_28 + var_313_29 then
				local var_313_30 = (arg_310_1.time_ - var_313_28) / var_313_29
				local var_313_31 = Vector3.New(0, 100, 0)

				var_313_27.localPosition = Vector3.Lerp(arg_310_1.var_.moveOldPos1080ui_story, var_313_31, var_313_30)

				local var_313_32 = manager.ui.mainCamera.transform.position - var_313_27.position

				var_313_27.forward = Vector3.New(var_313_32.x, var_313_32.y, var_313_32.z)

				local var_313_33 = var_313_27.localEulerAngles

				var_313_33.z = 0
				var_313_33.x = 0
				var_313_27.localEulerAngles = var_313_33
			end

			if arg_310_1.time_ >= var_313_28 + var_313_29 and arg_310_1.time_ < var_313_28 + var_313_29 + arg_313_0 then
				var_313_27.localPosition = Vector3.New(0, 100, 0)

				local var_313_34 = manager.ui.mainCamera.transform.position - var_313_27.position

				var_313_27.forward = Vector3.New(var_313_34.x, var_313_34.y, var_313_34.z)

				local var_313_35 = var_313_27.localEulerAngles

				var_313_35.z = 0
				var_313_35.x = 0
				var_313_27.localEulerAngles = var_313_35
			end

			if arg_310_1.frameCnt_ <= 1 then
				arg_310_1.dialog_:SetActive(false)
			end

			local var_313_36 = 2.03333333333333
			local var_313_37 = 1.525

			if var_313_36 < arg_310_1.time_ and arg_310_1.time_ <= var_313_36 + arg_313_0 then
				arg_310_1.talkMaxDuration = 0

				arg_310_1.dialog_:SetActive(true)

				local var_313_38 = LeanTween.value(arg_310_1.dialog_, 0, 1, 0.3)

				var_313_38:setOnUpdate(LuaHelper.FloatAction(function(arg_314_0)
					arg_310_1.dialogCg_.alpha = arg_314_0
				end))
				var_313_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_310_1.dialog_)
					var_313_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_310_1.duration_ = arg_310_1.duration_ + 0.3

				SetActive(arg_310_1.leftNameGo_, false)

				arg_310_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_310_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_310_1:RecordName(arg_310_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_310_1.iconTrs_.gameObject, false)
				arg_310_1.callingController_:SetSelectedState("normal")

				local var_313_39 = arg_310_1:GetWordFromCfg(1108105075)
				local var_313_40 = arg_310_1:FormatText(var_313_39.content)

				arg_310_1.text_.text = var_313_40

				LuaForUtil.ClearLinePrefixSymbol(arg_310_1.text_)

				local var_313_41 = 61
				local var_313_42 = utf8.len(var_313_40)
				local var_313_43 = var_313_41 <= 0 and var_313_37 or var_313_37 * (var_313_42 / var_313_41)

				if var_313_43 > 0 and var_313_37 < var_313_43 then
					arg_310_1.talkMaxDuration = var_313_43
					var_313_36 = var_313_36 + 0.3

					if var_313_43 + var_313_36 > arg_310_1.duration_ then
						arg_310_1.duration_ = var_313_43 + var_313_36
					end
				end

				arg_310_1.text_.text = var_313_40
				arg_310_1.typewritter.percent = 0

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(false)
				arg_310_1:RecordContent(arg_310_1.text_.text)
			end

			local var_313_44 = var_313_36 + 0.3
			local var_313_45 = math.max(var_313_37, arg_310_1.talkMaxDuration)

			if var_313_44 <= arg_310_1.time_ and arg_310_1.time_ < var_313_44 + var_313_45 then
				arg_310_1.typewritter.percent = (arg_310_1.time_ - var_313_44) / var_313_45

				arg_310_1.typewritter:SetDirty()
			end

			if arg_310_1.time_ >= var_313_44 + var_313_45 and arg_310_1.time_ < var_313_44 + var_313_45 + arg_313_0 then
				arg_310_1.typewritter.percent = 1

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105076 = function(arg_316_0, arg_316_1)
		arg_316_1.time_ = 0
		arg_316_1.frameCnt_ = 0
		arg_316_1.state_ = "playing"
		arg_316_1.curTalkId_ = 1108105076
		arg_316_1.duration_ = 5

		SetActive(arg_316_1.tipsGo_, false)

		function arg_316_1.onSingleLineFinish_()
			arg_316_1.onSingleLineUpdate_ = nil
			arg_316_1.onSingleLineFinish_ = nil
			arg_316_1.state_ = "waiting"
		end

		function arg_316_1.playNext_(arg_318_0)
			if arg_318_0 == 1 then
				arg_316_0:Play1108105077(arg_316_1)
			end
		end

		function arg_316_1.onSingleLineUpdate_(arg_319_0)
			local var_319_0 = arg_316_1.actors_["1081ui_story"].transform
			local var_319_1 = 0

			if var_319_1 < arg_316_1.time_ and arg_316_1.time_ <= var_319_1 + arg_319_0 then
				arg_316_1.var_.moveOldPos1081ui_story = var_319_0.localPosition
			end

			local var_319_2 = 0.001

			if var_319_1 <= arg_316_1.time_ and arg_316_1.time_ < var_319_1 + var_319_2 then
				local var_319_3 = (arg_316_1.time_ - var_319_1) / var_319_2
				local var_319_4 = Vector3.New(0, -0.92, -5.8)

				var_319_0.localPosition = Vector3.Lerp(arg_316_1.var_.moveOldPos1081ui_story, var_319_4, var_319_3)

				local var_319_5 = manager.ui.mainCamera.transform.position - var_319_0.position

				var_319_0.forward = Vector3.New(var_319_5.x, var_319_5.y, var_319_5.z)

				local var_319_6 = var_319_0.localEulerAngles

				var_319_6.z = 0
				var_319_6.x = 0
				var_319_0.localEulerAngles = var_319_6
			end

			if arg_316_1.time_ >= var_319_1 + var_319_2 and arg_316_1.time_ < var_319_1 + var_319_2 + arg_319_0 then
				var_319_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_319_7 = manager.ui.mainCamera.transform.position - var_319_0.position

				var_319_0.forward = Vector3.New(var_319_7.x, var_319_7.y, var_319_7.z)

				local var_319_8 = var_319_0.localEulerAngles

				var_319_8.z = 0
				var_319_8.x = 0
				var_319_0.localEulerAngles = var_319_8
			end

			local var_319_9 = arg_316_1.actors_["1081ui_story"]
			local var_319_10 = 0

			if var_319_10 < arg_316_1.time_ and arg_316_1.time_ <= var_319_10 + arg_319_0 and arg_316_1.var_.characterEffect1081ui_story == nil then
				arg_316_1.var_.characterEffect1081ui_story = var_319_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_319_11 = 0.200000002980232

			if var_319_10 <= arg_316_1.time_ and arg_316_1.time_ < var_319_10 + var_319_11 then
				local var_319_12 = (arg_316_1.time_ - var_319_10) / var_319_11

				if arg_316_1.var_.characterEffect1081ui_story then
					arg_316_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_316_1.time_ >= var_319_10 + var_319_11 and arg_316_1.time_ < var_319_10 + var_319_11 + arg_319_0 and arg_316_1.var_.characterEffect1081ui_story then
				arg_316_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_319_13 = 0

			if var_319_13 < arg_316_1.time_ and arg_316_1.time_ <= var_319_13 + arg_319_0 then
				arg_316_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_319_14 = 0

			if var_319_14 < arg_316_1.time_ and arg_316_1.time_ <= var_319_14 + arg_319_0 then
				arg_316_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_319_15 = 0
			local var_319_16 = 0.325

			if var_319_15 < arg_316_1.time_ and arg_316_1.time_ <= var_319_15 + arg_319_0 then
				arg_316_1.talkMaxDuration = 0
				arg_316_1.dialogCg_.alpha = 1

				arg_316_1.dialog_:SetActive(true)
				SetActive(arg_316_1.leftNameGo_, true)

				local var_319_17 = arg_316_1:FormatText(StoryNameCfg[202].name)

				arg_316_1.leftNameTxt_.text = var_319_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_316_1.leftNameTxt_.transform)

				arg_316_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_316_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_316_1:RecordName(arg_316_1.leftNameTxt_.text)
				SetActive(arg_316_1.iconTrs_.gameObject, false)
				arg_316_1.callingController_:SetSelectedState("normal")

				local var_319_18 = arg_316_1:GetWordFromCfg(1108105076)
				local var_319_19 = arg_316_1:FormatText(var_319_18.content)

				arg_316_1.text_.text = var_319_19

				LuaForUtil.ClearLinePrefixSymbol(arg_316_1.text_)

				local var_319_20 = 13
				local var_319_21 = utf8.len(var_319_19)
				local var_319_22 = var_319_20 <= 0 and var_319_16 or var_319_16 * (var_319_21 / var_319_20)

				if var_319_22 > 0 and var_319_16 < var_319_22 then
					arg_316_1.talkMaxDuration = var_319_22

					if var_319_22 + var_319_15 > arg_316_1.duration_ then
						arg_316_1.duration_ = var_319_22 + var_319_15
					end
				end

				arg_316_1.text_.text = var_319_19
				arg_316_1.typewritter.percent = 0

				arg_316_1.typewritter:SetDirty()
				arg_316_1:ShowNextGo(false)
				arg_316_1:RecordContent(arg_316_1.text_.text)
			end

			local var_319_23 = math.max(var_319_16, arg_316_1.talkMaxDuration)

			if var_319_15 <= arg_316_1.time_ and arg_316_1.time_ < var_319_15 + var_319_23 then
				arg_316_1.typewritter.percent = (arg_316_1.time_ - var_319_15) / var_319_23

				arg_316_1.typewritter:SetDirty()
			end

			if arg_316_1.time_ >= var_319_15 + var_319_23 and arg_316_1.time_ < var_319_15 + var_319_23 + arg_319_0 then
				arg_316_1.typewritter.percent = 1

				arg_316_1.typewritter:SetDirty()
				arg_316_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105077 = function(arg_320_0, arg_320_1)
		arg_320_1.time_ = 0
		arg_320_1.frameCnt_ = 0
		arg_320_1.state_ = "playing"
		arg_320_1.curTalkId_ = 1108105077
		arg_320_1.duration_ = 5

		SetActive(arg_320_1.tipsGo_, false)

		function arg_320_1.onSingleLineFinish_()
			arg_320_1.onSingleLineUpdate_ = nil
			arg_320_1.onSingleLineFinish_ = nil
			arg_320_1.state_ = "waiting"
		end

		function arg_320_1.playNext_(arg_322_0)
			if arg_322_0 == 1 then
				arg_320_0:Play1108105078(arg_320_1)
			end
		end

		function arg_320_1.onSingleLineUpdate_(arg_323_0)
			local var_323_0 = arg_320_1.actors_["1081ui_story"]
			local var_323_1 = 0

			if var_323_1 < arg_320_1.time_ and arg_320_1.time_ <= var_323_1 + arg_323_0 and arg_320_1.var_.characterEffect1081ui_story == nil then
				arg_320_1.var_.characterEffect1081ui_story = var_323_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_323_2 = 0.200000002980232

			if var_323_1 <= arg_320_1.time_ and arg_320_1.time_ < var_323_1 + var_323_2 then
				local var_323_3 = (arg_320_1.time_ - var_323_1) / var_323_2

				if arg_320_1.var_.characterEffect1081ui_story then
					local var_323_4 = Mathf.Lerp(0, 0.5, var_323_3)

					arg_320_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_320_1.var_.characterEffect1081ui_story.fillRatio = var_323_4
				end
			end

			if arg_320_1.time_ >= var_323_1 + var_323_2 and arg_320_1.time_ < var_323_1 + var_323_2 + arg_323_0 and arg_320_1.var_.characterEffect1081ui_story then
				local var_323_5 = 0.5

				arg_320_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_320_1.var_.characterEffect1081ui_story.fillRatio = var_323_5
			end

			local var_323_6 = arg_320_1.actors_["1081ui_story"].transform
			local var_323_7 = 0

			if var_323_7 < arg_320_1.time_ and arg_320_1.time_ <= var_323_7 + arg_323_0 then
				arg_320_1.var_.moveOldPos1081ui_story = var_323_6.localPosition
			end

			local var_323_8 = 0.001

			if var_323_7 <= arg_320_1.time_ and arg_320_1.time_ < var_323_7 + var_323_8 then
				local var_323_9 = (arg_320_1.time_ - var_323_7) / var_323_8
				local var_323_10 = Vector3.New(0, 100, 0)

				var_323_6.localPosition = Vector3.Lerp(arg_320_1.var_.moveOldPos1081ui_story, var_323_10, var_323_9)

				local var_323_11 = manager.ui.mainCamera.transform.position - var_323_6.position

				var_323_6.forward = Vector3.New(var_323_11.x, var_323_11.y, var_323_11.z)

				local var_323_12 = var_323_6.localEulerAngles

				var_323_12.z = 0
				var_323_12.x = 0
				var_323_6.localEulerAngles = var_323_12
			end

			if arg_320_1.time_ >= var_323_7 + var_323_8 and arg_320_1.time_ < var_323_7 + var_323_8 + arg_323_0 then
				var_323_6.localPosition = Vector3.New(0, 100, 0)

				local var_323_13 = manager.ui.mainCamera.transform.position - var_323_6.position

				var_323_6.forward = Vector3.New(var_323_13.x, var_323_13.y, var_323_13.z)

				local var_323_14 = var_323_6.localEulerAngles

				var_323_14.z = 0
				var_323_14.x = 0
				var_323_6.localEulerAngles = var_323_14
			end

			local var_323_15 = 0
			local var_323_16 = 1.375

			if var_323_15 < arg_320_1.time_ and arg_320_1.time_ <= var_323_15 + arg_323_0 then
				arg_320_1.talkMaxDuration = 0
				arg_320_1.dialogCg_.alpha = 1

				arg_320_1.dialog_:SetActive(true)
				SetActive(arg_320_1.leftNameGo_, false)

				arg_320_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_320_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_320_1:RecordName(arg_320_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_320_1.iconTrs_.gameObject, false)
				arg_320_1.callingController_:SetSelectedState("normal")

				local var_323_17 = arg_320_1:GetWordFromCfg(1108105077)
				local var_323_18 = arg_320_1:FormatText(var_323_17.content)

				arg_320_1.text_.text = var_323_18

				LuaForUtil.ClearLinePrefixSymbol(arg_320_1.text_)

				local var_323_19 = 55
				local var_323_20 = utf8.len(var_323_18)
				local var_323_21 = var_323_19 <= 0 and var_323_16 or var_323_16 * (var_323_20 / var_323_19)

				if var_323_21 > 0 and var_323_16 < var_323_21 then
					arg_320_1.talkMaxDuration = var_323_21

					if var_323_21 + var_323_15 > arg_320_1.duration_ then
						arg_320_1.duration_ = var_323_21 + var_323_15
					end
				end

				arg_320_1.text_.text = var_323_18
				arg_320_1.typewritter.percent = 0

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(false)
				arg_320_1:RecordContent(arg_320_1.text_.text)
			end

			local var_323_22 = math.max(var_323_16, arg_320_1.talkMaxDuration)

			if var_323_15 <= arg_320_1.time_ and arg_320_1.time_ < var_323_15 + var_323_22 then
				arg_320_1.typewritter.percent = (arg_320_1.time_ - var_323_15) / var_323_22

				arg_320_1.typewritter:SetDirty()
			end

			if arg_320_1.time_ >= var_323_15 + var_323_22 and arg_320_1.time_ < var_323_15 + var_323_22 + arg_323_0 then
				arg_320_1.typewritter.percent = 1

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105078 = function(arg_324_0, arg_324_1)
		arg_324_1.time_ = 0
		arg_324_1.frameCnt_ = 0
		arg_324_1.state_ = "playing"
		arg_324_1.curTalkId_ = 1108105078
		arg_324_1.duration_ = 5

		SetActive(arg_324_1.tipsGo_, false)

		function arg_324_1.onSingleLineFinish_()
			arg_324_1.onSingleLineUpdate_ = nil
			arg_324_1.onSingleLineFinish_ = nil
			arg_324_1.state_ = "waiting"
		end

		function arg_324_1.playNext_(arg_326_0)
			if arg_326_0 == 1 then
				arg_324_0:Play1108105079(arg_324_1)
			end
		end

		function arg_324_1.onSingleLineUpdate_(arg_327_0)
			local var_327_0 = 0
			local var_327_1 = 0.475

			if var_327_0 < arg_324_1.time_ and arg_324_1.time_ <= var_327_0 + arg_327_0 then
				arg_324_1.talkMaxDuration = 0
				arg_324_1.dialogCg_.alpha = 1

				arg_324_1.dialog_:SetActive(true)
				SetActive(arg_324_1.leftNameGo_, true)

				local var_327_2 = arg_324_1:FormatText(StoryNameCfg[7].name)

				arg_324_1.leftNameTxt_.text = var_327_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_324_1.leftNameTxt_.transform)

				arg_324_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_324_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_324_1:RecordName(arg_324_1.leftNameTxt_.text)
				SetActive(arg_324_1.iconTrs_.gameObject, false)
				arg_324_1.callingController_:SetSelectedState("normal")

				local var_327_3 = arg_324_1:GetWordFromCfg(1108105078)
				local var_327_4 = arg_324_1:FormatText(var_327_3.content)

				arg_324_1.text_.text = var_327_4

				LuaForUtil.ClearLinePrefixSymbol(arg_324_1.text_)

				local var_327_5 = 19
				local var_327_6 = utf8.len(var_327_4)
				local var_327_7 = var_327_5 <= 0 and var_327_1 or var_327_1 * (var_327_6 / var_327_5)

				if var_327_7 > 0 and var_327_1 < var_327_7 then
					arg_324_1.talkMaxDuration = var_327_7

					if var_327_7 + var_327_0 > arg_324_1.duration_ then
						arg_324_1.duration_ = var_327_7 + var_327_0
					end
				end

				arg_324_1.text_.text = var_327_4
				arg_324_1.typewritter.percent = 0

				arg_324_1.typewritter:SetDirty()
				arg_324_1:ShowNextGo(false)
				arg_324_1:RecordContent(arg_324_1.text_.text)
			end

			local var_327_8 = math.max(var_327_1, arg_324_1.talkMaxDuration)

			if var_327_0 <= arg_324_1.time_ and arg_324_1.time_ < var_327_0 + var_327_8 then
				arg_324_1.typewritter.percent = (arg_324_1.time_ - var_327_0) / var_327_8

				arg_324_1.typewritter:SetDirty()
			end

			if arg_324_1.time_ >= var_327_0 + var_327_8 and arg_324_1.time_ < var_327_0 + var_327_8 + arg_327_0 then
				arg_324_1.typewritter.percent = 1

				arg_324_1.typewritter:SetDirty()
				arg_324_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105079 = function(arg_328_0, arg_328_1)
		arg_328_1.time_ = 0
		arg_328_1.frameCnt_ = 0
		arg_328_1.state_ = "playing"
		arg_328_1.curTalkId_ = 1108105079
		arg_328_1.duration_ = 5

		SetActive(arg_328_1.tipsGo_, false)

		function arg_328_1.onSingleLineFinish_()
			arg_328_1.onSingleLineUpdate_ = nil
			arg_328_1.onSingleLineFinish_ = nil
			arg_328_1.state_ = "waiting"
		end

		function arg_328_1.playNext_(arg_330_0)
			if arg_330_0 == 1 then
				arg_328_0:Play1108105080(arg_328_1)
			end
		end

		function arg_328_1.onSingleLineUpdate_(arg_331_0)
			local var_331_0 = arg_328_1.actors_["1081ui_story"].transform
			local var_331_1 = 0

			if var_331_1 < arg_328_1.time_ and arg_328_1.time_ <= var_331_1 + arg_331_0 then
				arg_328_1.var_.moveOldPos1081ui_story = var_331_0.localPosition
			end

			local var_331_2 = 0.001

			if var_331_1 <= arg_328_1.time_ and arg_328_1.time_ < var_331_1 + var_331_2 then
				local var_331_3 = (arg_328_1.time_ - var_331_1) / var_331_2
				local var_331_4 = Vector3.New(0, -0.92, -5.8)

				var_331_0.localPosition = Vector3.Lerp(arg_328_1.var_.moveOldPos1081ui_story, var_331_4, var_331_3)

				local var_331_5 = manager.ui.mainCamera.transform.position - var_331_0.position

				var_331_0.forward = Vector3.New(var_331_5.x, var_331_5.y, var_331_5.z)

				local var_331_6 = var_331_0.localEulerAngles

				var_331_6.z = 0
				var_331_6.x = 0
				var_331_0.localEulerAngles = var_331_6
			end

			if arg_328_1.time_ >= var_331_1 + var_331_2 and arg_328_1.time_ < var_331_1 + var_331_2 + arg_331_0 then
				var_331_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_331_7 = manager.ui.mainCamera.transform.position - var_331_0.position

				var_331_0.forward = Vector3.New(var_331_7.x, var_331_7.y, var_331_7.z)

				local var_331_8 = var_331_0.localEulerAngles

				var_331_8.z = 0
				var_331_8.x = 0
				var_331_0.localEulerAngles = var_331_8
			end

			local var_331_9 = arg_328_1.actors_["1081ui_story"]
			local var_331_10 = 0

			if var_331_10 < arg_328_1.time_ and arg_328_1.time_ <= var_331_10 + arg_331_0 and arg_328_1.var_.characterEffect1081ui_story == nil then
				arg_328_1.var_.characterEffect1081ui_story = var_331_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_331_11 = 0.200000002980232

			if var_331_10 <= arg_328_1.time_ and arg_328_1.time_ < var_331_10 + var_331_11 then
				local var_331_12 = (arg_328_1.time_ - var_331_10) / var_331_11

				if arg_328_1.var_.characterEffect1081ui_story then
					arg_328_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_328_1.time_ >= var_331_10 + var_331_11 and arg_328_1.time_ < var_331_10 + var_331_11 + arg_331_0 and arg_328_1.var_.characterEffect1081ui_story then
				arg_328_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_331_13 = 0

			if var_331_13 < arg_328_1.time_ and arg_328_1.time_ <= var_331_13 + arg_331_0 then
				arg_328_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081actionlink/1081action453")
			end

			local var_331_14 = 0

			if var_331_14 < arg_328_1.time_ and arg_328_1.time_ <= var_331_14 + arg_331_0 then
				arg_328_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_331_15 = 0
			local var_331_16 = 0.6

			if var_331_15 < arg_328_1.time_ and arg_328_1.time_ <= var_331_15 + arg_331_0 then
				arg_328_1.talkMaxDuration = 0
				arg_328_1.dialogCg_.alpha = 1

				arg_328_1.dialog_:SetActive(true)
				SetActive(arg_328_1.leftNameGo_, true)

				local var_331_17 = arg_328_1:FormatText(StoryNameCfg[202].name)

				arg_328_1.leftNameTxt_.text = var_331_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_328_1.leftNameTxt_.transform)

				arg_328_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_328_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_328_1:RecordName(arg_328_1.leftNameTxt_.text)
				SetActive(arg_328_1.iconTrs_.gameObject, false)
				arg_328_1.callingController_:SetSelectedState("normal")

				local var_331_18 = arg_328_1:GetWordFromCfg(1108105079)
				local var_331_19 = arg_328_1:FormatText(var_331_18.content)

				arg_328_1.text_.text = var_331_19

				LuaForUtil.ClearLinePrefixSymbol(arg_328_1.text_)

				local var_331_20 = 24
				local var_331_21 = utf8.len(var_331_19)
				local var_331_22 = var_331_20 <= 0 and var_331_16 or var_331_16 * (var_331_21 / var_331_20)

				if var_331_22 > 0 and var_331_16 < var_331_22 then
					arg_328_1.talkMaxDuration = var_331_22

					if var_331_22 + var_331_15 > arg_328_1.duration_ then
						arg_328_1.duration_ = var_331_22 + var_331_15
					end
				end

				arg_328_1.text_.text = var_331_19
				arg_328_1.typewritter.percent = 0

				arg_328_1.typewritter:SetDirty()
				arg_328_1:ShowNextGo(false)
				arg_328_1:RecordContent(arg_328_1.text_.text)
			end

			local var_331_23 = math.max(var_331_16, arg_328_1.talkMaxDuration)

			if var_331_15 <= arg_328_1.time_ and arg_328_1.time_ < var_331_15 + var_331_23 then
				arg_328_1.typewritter.percent = (arg_328_1.time_ - var_331_15) / var_331_23

				arg_328_1.typewritter:SetDirty()
			end

			if arg_328_1.time_ >= var_331_15 + var_331_23 and arg_328_1.time_ < var_331_15 + var_331_23 + arg_331_0 then
				arg_328_1.typewritter.percent = 1

				arg_328_1.typewritter:SetDirty()
				arg_328_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105080 = function(arg_332_0, arg_332_1)
		arg_332_1.time_ = 0
		arg_332_1.frameCnt_ = 0
		arg_332_1.state_ = "playing"
		arg_332_1.curTalkId_ = 1108105080
		arg_332_1.duration_ = 5

		SetActive(arg_332_1.tipsGo_, false)

		function arg_332_1.onSingleLineFinish_()
			arg_332_1.onSingleLineUpdate_ = nil
			arg_332_1.onSingleLineFinish_ = nil
			arg_332_1.state_ = "waiting"
		end

		function arg_332_1.playNext_(arg_334_0)
			if arg_334_0 == 1 then
				arg_332_0:Play1108105081(arg_332_1)
			end
		end

		function arg_332_1.onSingleLineUpdate_(arg_335_0)
			local var_335_0 = arg_332_1.actors_["1081ui_story"].transform
			local var_335_1 = 0

			if var_335_1 < arg_332_1.time_ and arg_332_1.time_ <= var_335_1 + arg_335_0 then
				arg_332_1.var_.moveOldPos1081ui_story = var_335_0.localPosition
			end

			local var_335_2 = 0.001

			if var_335_1 <= arg_332_1.time_ and arg_332_1.time_ < var_335_1 + var_335_2 then
				local var_335_3 = (arg_332_1.time_ - var_335_1) / var_335_2
				local var_335_4 = Vector3.New(0, 100, 0)

				var_335_0.localPosition = Vector3.Lerp(arg_332_1.var_.moveOldPos1081ui_story, var_335_4, var_335_3)

				local var_335_5 = manager.ui.mainCamera.transform.position - var_335_0.position

				var_335_0.forward = Vector3.New(var_335_5.x, var_335_5.y, var_335_5.z)

				local var_335_6 = var_335_0.localEulerAngles

				var_335_6.z = 0
				var_335_6.x = 0
				var_335_0.localEulerAngles = var_335_6
			end

			if arg_332_1.time_ >= var_335_1 + var_335_2 and arg_332_1.time_ < var_335_1 + var_335_2 + arg_335_0 then
				var_335_0.localPosition = Vector3.New(0, 100, 0)

				local var_335_7 = manager.ui.mainCamera.transform.position - var_335_0.position

				var_335_0.forward = Vector3.New(var_335_7.x, var_335_7.y, var_335_7.z)

				local var_335_8 = var_335_0.localEulerAngles

				var_335_8.z = 0
				var_335_8.x = 0
				var_335_0.localEulerAngles = var_335_8
			end

			local var_335_9 = 0
			local var_335_10 = 0.65

			if var_335_9 < arg_332_1.time_ and arg_332_1.time_ <= var_335_9 + arg_335_0 then
				arg_332_1.talkMaxDuration = 0
				arg_332_1.dialogCg_.alpha = 1

				arg_332_1.dialog_:SetActive(true)
				SetActive(arg_332_1.leftNameGo_, false)

				arg_332_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_332_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_332_1:RecordName(arg_332_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_332_1.iconTrs_.gameObject, false)
				arg_332_1.callingController_:SetSelectedState("normal")

				local var_335_11 = arg_332_1:GetWordFromCfg(1108105080)
				local var_335_12 = arg_332_1:FormatText(var_335_11.content)

				arg_332_1.text_.text = var_335_12

				LuaForUtil.ClearLinePrefixSymbol(arg_332_1.text_)

				local var_335_13 = 26
				local var_335_14 = utf8.len(var_335_12)
				local var_335_15 = var_335_13 <= 0 and var_335_10 or var_335_10 * (var_335_14 / var_335_13)

				if var_335_15 > 0 and var_335_10 < var_335_15 then
					arg_332_1.talkMaxDuration = var_335_15

					if var_335_15 + var_335_9 > arg_332_1.duration_ then
						arg_332_1.duration_ = var_335_15 + var_335_9
					end
				end

				arg_332_1.text_.text = var_335_12
				arg_332_1.typewritter.percent = 0

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(false)
				arg_332_1:RecordContent(arg_332_1.text_.text)
			end

			local var_335_16 = math.max(var_335_10, arg_332_1.talkMaxDuration)

			if var_335_9 <= arg_332_1.time_ and arg_332_1.time_ < var_335_9 + var_335_16 then
				arg_332_1.typewritter.percent = (arg_332_1.time_ - var_335_9) / var_335_16

				arg_332_1.typewritter:SetDirty()
			end

			if arg_332_1.time_ >= var_335_9 + var_335_16 and arg_332_1.time_ < var_335_9 + var_335_16 + arg_335_0 then
				arg_332_1.typewritter.percent = 1

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105081 = function(arg_336_0, arg_336_1)
		arg_336_1.time_ = 0
		arg_336_1.frameCnt_ = 0
		arg_336_1.state_ = "playing"
		arg_336_1.curTalkId_ = 1108105081
		arg_336_1.duration_ = 5

		SetActive(arg_336_1.tipsGo_, false)

		function arg_336_1.onSingleLineFinish_()
			arg_336_1.onSingleLineUpdate_ = nil
			arg_336_1.onSingleLineFinish_ = nil
			arg_336_1.state_ = "waiting"
		end

		function arg_336_1.playNext_(arg_338_0)
			if arg_338_0 == 1 then
				arg_336_0:Play1108105082(arg_336_1)
			end
		end

		function arg_336_1.onSingleLineUpdate_(arg_339_0)
			local var_339_0 = 0
			local var_339_1 = 0.625

			if var_339_0 < arg_336_1.time_ and arg_336_1.time_ <= var_339_0 + arg_339_0 then
				arg_336_1.talkMaxDuration = 0
				arg_336_1.dialogCg_.alpha = 1

				arg_336_1.dialog_:SetActive(true)
				SetActive(arg_336_1.leftNameGo_, true)

				local var_339_2 = arg_336_1:FormatText(StoryNameCfg[7].name)

				arg_336_1.leftNameTxt_.text = var_339_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_336_1.leftNameTxt_.transform)

				arg_336_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_336_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_336_1:RecordName(arg_336_1.leftNameTxt_.text)
				SetActive(arg_336_1.iconTrs_.gameObject, false)
				arg_336_1.callingController_:SetSelectedState("normal")

				local var_339_3 = arg_336_1:GetWordFromCfg(1108105081)
				local var_339_4 = arg_336_1:FormatText(var_339_3.content)

				arg_336_1.text_.text = var_339_4

				LuaForUtil.ClearLinePrefixSymbol(arg_336_1.text_)

				local var_339_5 = 25
				local var_339_6 = utf8.len(var_339_4)
				local var_339_7 = var_339_5 <= 0 and var_339_1 or var_339_1 * (var_339_6 / var_339_5)

				if var_339_7 > 0 and var_339_1 < var_339_7 then
					arg_336_1.talkMaxDuration = var_339_7

					if var_339_7 + var_339_0 > arg_336_1.duration_ then
						arg_336_1.duration_ = var_339_7 + var_339_0
					end
				end

				arg_336_1.text_.text = var_339_4
				arg_336_1.typewritter.percent = 0

				arg_336_1.typewritter:SetDirty()
				arg_336_1:ShowNextGo(false)
				arg_336_1:RecordContent(arg_336_1.text_.text)
			end

			local var_339_8 = math.max(var_339_1, arg_336_1.talkMaxDuration)

			if var_339_0 <= arg_336_1.time_ and arg_336_1.time_ < var_339_0 + var_339_8 then
				arg_336_1.typewritter.percent = (arg_336_1.time_ - var_339_0) / var_339_8

				arg_336_1.typewritter:SetDirty()
			end

			if arg_336_1.time_ >= var_339_0 + var_339_8 and arg_336_1.time_ < var_339_0 + var_339_8 + arg_339_0 then
				arg_336_1.typewritter.percent = 1

				arg_336_1.typewritter:SetDirty()
				arg_336_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105082 = function(arg_340_0, arg_340_1)
		arg_340_1.time_ = 0
		arg_340_1.frameCnt_ = 0
		arg_340_1.state_ = "playing"
		arg_340_1.curTalkId_ = 1108105082
		arg_340_1.duration_ = 5

		SetActive(arg_340_1.tipsGo_, false)

		function arg_340_1.onSingleLineFinish_()
			arg_340_1.onSingleLineUpdate_ = nil
			arg_340_1.onSingleLineFinish_ = nil
			arg_340_1.state_ = "waiting"
		end

		function arg_340_1.playNext_(arg_342_0)
			if arg_342_0 == 1 then
				arg_340_0:Play1108105083(arg_340_1)
			end
		end

		function arg_340_1.onSingleLineUpdate_(arg_343_0)
			local var_343_0 = arg_340_1.actors_["1080ui_story"].transform
			local var_343_1 = 0

			if var_343_1 < arg_340_1.time_ and arg_340_1.time_ <= var_343_1 + arg_343_0 then
				arg_340_1.var_.moveOldPos1080ui_story = var_343_0.localPosition
			end

			local var_343_2 = 0.001

			if var_343_1 <= arg_340_1.time_ and arg_340_1.time_ < var_343_1 + var_343_2 then
				local var_343_3 = (arg_340_1.time_ - var_343_1) / var_343_2
				local var_343_4 = Vector3.New(0, -1.01, -6.05)

				var_343_0.localPosition = Vector3.Lerp(arg_340_1.var_.moveOldPos1080ui_story, var_343_4, var_343_3)

				local var_343_5 = manager.ui.mainCamera.transform.position - var_343_0.position

				var_343_0.forward = Vector3.New(var_343_5.x, var_343_5.y, var_343_5.z)

				local var_343_6 = var_343_0.localEulerAngles

				var_343_6.z = 0
				var_343_6.x = 0
				var_343_0.localEulerAngles = var_343_6
			end

			if arg_340_1.time_ >= var_343_1 + var_343_2 and arg_340_1.time_ < var_343_1 + var_343_2 + arg_343_0 then
				var_343_0.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_343_7 = manager.ui.mainCamera.transform.position - var_343_0.position

				var_343_0.forward = Vector3.New(var_343_7.x, var_343_7.y, var_343_7.z)

				local var_343_8 = var_343_0.localEulerAngles

				var_343_8.z = 0
				var_343_8.x = 0
				var_343_0.localEulerAngles = var_343_8
			end

			local var_343_9 = arg_340_1.actors_["1080ui_story"]
			local var_343_10 = 0

			if var_343_10 < arg_340_1.time_ and arg_340_1.time_ <= var_343_10 + arg_343_0 and arg_340_1.var_.characterEffect1080ui_story == nil then
				arg_340_1.var_.characterEffect1080ui_story = var_343_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_343_11 = 0.200000002980232

			if var_343_10 <= arg_340_1.time_ and arg_340_1.time_ < var_343_10 + var_343_11 then
				local var_343_12 = (arg_340_1.time_ - var_343_10) / var_343_11

				if arg_340_1.var_.characterEffect1080ui_story then
					arg_340_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_340_1.time_ >= var_343_10 + var_343_11 and arg_340_1.time_ < var_343_10 + var_343_11 + arg_343_0 and arg_340_1.var_.characterEffect1080ui_story then
				arg_340_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_343_13 = 0

			if var_343_13 < arg_340_1.time_ and arg_340_1.time_ <= var_343_13 + arg_343_0 then
				arg_340_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action7_1")
			end

			local var_343_14 = 0

			if var_343_14 < arg_340_1.time_ and arg_340_1.time_ <= var_343_14 + arg_343_0 then
				arg_340_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_343_15 = 0
			local var_343_16 = 0.475

			if var_343_15 < arg_340_1.time_ and arg_340_1.time_ <= var_343_15 + arg_343_0 then
				arg_340_1.talkMaxDuration = 0
				arg_340_1.dialogCg_.alpha = 1

				arg_340_1.dialog_:SetActive(true)
				SetActive(arg_340_1.leftNameGo_, true)

				local var_343_17 = arg_340_1:FormatText(StoryNameCfg[55].name)

				arg_340_1.leftNameTxt_.text = var_343_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_340_1.leftNameTxt_.transform)

				arg_340_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_340_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_340_1:RecordName(arg_340_1.leftNameTxt_.text)
				SetActive(arg_340_1.iconTrs_.gameObject, false)
				arg_340_1.callingController_:SetSelectedState("normal")

				local var_343_18 = arg_340_1:GetWordFromCfg(1108105082)
				local var_343_19 = arg_340_1:FormatText(var_343_18.content)

				arg_340_1.text_.text = var_343_19

				LuaForUtil.ClearLinePrefixSymbol(arg_340_1.text_)

				local var_343_20 = 19
				local var_343_21 = utf8.len(var_343_19)
				local var_343_22 = var_343_20 <= 0 and var_343_16 or var_343_16 * (var_343_21 / var_343_20)

				if var_343_22 > 0 and var_343_16 < var_343_22 then
					arg_340_1.talkMaxDuration = var_343_22

					if var_343_22 + var_343_15 > arg_340_1.duration_ then
						arg_340_1.duration_ = var_343_22 + var_343_15
					end
				end

				arg_340_1.text_.text = var_343_19
				arg_340_1.typewritter.percent = 0

				arg_340_1.typewritter:SetDirty()
				arg_340_1:ShowNextGo(false)
				arg_340_1:RecordContent(arg_340_1.text_.text)
			end

			local var_343_23 = math.max(var_343_16, arg_340_1.talkMaxDuration)

			if var_343_15 <= arg_340_1.time_ and arg_340_1.time_ < var_343_15 + var_343_23 then
				arg_340_1.typewritter.percent = (arg_340_1.time_ - var_343_15) / var_343_23

				arg_340_1.typewritter:SetDirty()
			end

			if arg_340_1.time_ >= var_343_15 + var_343_23 and arg_340_1.time_ < var_343_15 + var_343_23 + arg_343_0 then
				arg_340_1.typewritter.percent = 1

				arg_340_1.typewritter:SetDirty()
				arg_340_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105083 = function(arg_344_0, arg_344_1)
		arg_344_1.time_ = 0
		arg_344_1.frameCnt_ = 0
		arg_344_1.state_ = "playing"
		arg_344_1.curTalkId_ = 1108105083
		arg_344_1.duration_ = 5

		SetActive(arg_344_1.tipsGo_, false)

		function arg_344_1.onSingleLineFinish_()
			arg_344_1.onSingleLineUpdate_ = nil
			arg_344_1.onSingleLineFinish_ = nil
			arg_344_1.state_ = "waiting"
		end

		function arg_344_1.playNext_(arg_346_0)
			if arg_346_0 == 1 then
				arg_344_0:Play1108105084(arg_344_1)
			end
		end

		function arg_344_1.onSingleLineUpdate_(arg_347_0)
			local var_347_0 = arg_344_1.actors_["1080ui_story"]
			local var_347_1 = 0

			if var_347_1 < arg_344_1.time_ and arg_344_1.time_ <= var_347_1 + arg_347_0 and arg_344_1.var_.characterEffect1080ui_story == nil then
				arg_344_1.var_.characterEffect1080ui_story = var_347_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_347_2 = 0.0166666666666667

			if var_347_1 <= arg_344_1.time_ and arg_344_1.time_ < var_347_1 + var_347_2 then
				local var_347_3 = (arg_344_1.time_ - var_347_1) / var_347_2

				if arg_344_1.var_.characterEffect1080ui_story then
					local var_347_4 = Mathf.Lerp(0, 0.5, var_347_3)

					arg_344_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_344_1.var_.characterEffect1080ui_story.fillRatio = var_347_4
				end
			end

			if arg_344_1.time_ >= var_347_1 + var_347_2 and arg_344_1.time_ < var_347_1 + var_347_2 + arg_347_0 and arg_344_1.var_.characterEffect1080ui_story then
				local var_347_5 = 0.5

				arg_344_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_344_1.var_.characterEffect1080ui_story.fillRatio = var_347_5
			end

			local var_347_6 = arg_344_1.actors_["1080ui_story"].transform
			local var_347_7 = 0

			if var_347_7 < arg_344_1.time_ and arg_344_1.time_ <= var_347_7 + arg_347_0 then
				arg_344_1.var_.moveOldPos1080ui_story = var_347_6.localPosition
			end

			local var_347_8 = 0.001

			if var_347_7 <= arg_344_1.time_ and arg_344_1.time_ < var_347_7 + var_347_8 then
				local var_347_9 = (arg_344_1.time_ - var_347_7) / var_347_8
				local var_347_10 = Vector3.New(0, 100, 0)

				var_347_6.localPosition = Vector3.Lerp(arg_344_1.var_.moveOldPos1080ui_story, var_347_10, var_347_9)

				local var_347_11 = manager.ui.mainCamera.transform.position - var_347_6.position

				var_347_6.forward = Vector3.New(var_347_11.x, var_347_11.y, var_347_11.z)

				local var_347_12 = var_347_6.localEulerAngles

				var_347_12.z = 0
				var_347_12.x = 0
				var_347_6.localEulerAngles = var_347_12
			end

			if arg_344_1.time_ >= var_347_7 + var_347_8 and arg_344_1.time_ < var_347_7 + var_347_8 + arg_347_0 then
				var_347_6.localPosition = Vector3.New(0, 100, 0)

				local var_347_13 = manager.ui.mainCamera.transform.position - var_347_6.position

				var_347_6.forward = Vector3.New(var_347_13.x, var_347_13.y, var_347_13.z)

				local var_347_14 = var_347_6.localEulerAngles

				var_347_14.z = 0
				var_347_14.x = 0
				var_347_6.localEulerAngles = var_347_14
			end

			local var_347_15 = 0
			local var_347_16 = 1

			if var_347_15 < arg_344_1.time_ and arg_344_1.time_ <= var_347_15 + arg_347_0 then
				arg_344_1.talkMaxDuration = 0
				arg_344_1.dialogCg_.alpha = 1

				arg_344_1.dialog_:SetActive(true)
				SetActive(arg_344_1.leftNameGo_, false)

				arg_344_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_344_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_344_1:RecordName(arg_344_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_344_1.iconTrs_.gameObject, false)
				arg_344_1.callingController_:SetSelectedState("normal")

				local var_347_17 = arg_344_1:GetWordFromCfg(1108105083)
				local var_347_18 = arg_344_1:FormatText(var_347_17.content)

				arg_344_1.text_.text = var_347_18

				LuaForUtil.ClearLinePrefixSymbol(arg_344_1.text_)

				local var_347_19 = 49
				local var_347_20 = utf8.len(var_347_18)
				local var_347_21 = var_347_19 <= 0 and var_347_16 or var_347_16 * (var_347_20 / var_347_19)

				if var_347_21 > 0 and var_347_16 < var_347_21 then
					arg_344_1.talkMaxDuration = var_347_21

					if var_347_21 + var_347_15 > arg_344_1.duration_ then
						arg_344_1.duration_ = var_347_21 + var_347_15
					end
				end

				arg_344_1.text_.text = var_347_18
				arg_344_1.typewritter.percent = 0

				arg_344_1.typewritter:SetDirty()
				arg_344_1:ShowNextGo(false)
				arg_344_1:RecordContent(arg_344_1.text_.text)
			end

			local var_347_22 = math.max(var_347_16, arg_344_1.talkMaxDuration)

			if var_347_15 <= arg_344_1.time_ and arg_344_1.time_ < var_347_15 + var_347_22 then
				arg_344_1.typewritter.percent = (arg_344_1.time_ - var_347_15) / var_347_22

				arg_344_1.typewritter:SetDirty()
			end

			if arg_344_1.time_ >= var_347_15 + var_347_22 and arg_344_1.time_ < var_347_15 + var_347_22 + arg_347_0 then
				arg_344_1.typewritter.percent = 1

				arg_344_1.typewritter:SetDirty()
				arg_344_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105084 = function(arg_348_0, arg_348_1)
		arg_348_1.time_ = 0
		arg_348_1.frameCnt_ = 0
		arg_348_1.state_ = "playing"
		arg_348_1.curTalkId_ = 1108105084
		arg_348_1.duration_ = 5

		SetActive(arg_348_1.tipsGo_, false)

		function arg_348_1.onSingleLineFinish_()
			arg_348_1.onSingleLineUpdate_ = nil
			arg_348_1.onSingleLineFinish_ = nil
			arg_348_1.state_ = "waiting"
		end

		function arg_348_1.playNext_(arg_350_0)
			if arg_350_0 == 1 then
				arg_348_0:Play1108105085(arg_348_1)
			end
		end

		function arg_348_1.onSingleLineUpdate_(arg_351_0)
			local var_351_0 = 0
			local var_351_1 = 0.25

			if var_351_0 < arg_348_1.time_ and arg_348_1.time_ <= var_351_0 + arg_351_0 then
				arg_348_1.talkMaxDuration = 0
				arg_348_1.dialogCg_.alpha = 1

				arg_348_1.dialog_:SetActive(true)
				SetActive(arg_348_1.leftNameGo_, true)

				local var_351_2 = arg_348_1:FormatText(StoryNameCfg[7].name)

				arg_348_1.leftNameTxt_.text = var_351_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_348_1.leftNameTxt_.transform)

				arg_348_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_348_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_348_1:RecordName(arg_348_1.leftNameTxt_.text)
				SetActive(arg_348_1.iconTrs_.gameObject, false)
				arg_348_1.callingController_:SetSelectedState("normal")

				local var_351_3 = arg_348_1:GetWordFromCfg(1108105084)
				local var_351_4 = arg_348_1:FormatText(var_351_3.content)

				arg_348_1.text_.text = var_351_4

				LuaForUtil.ClearLinePrefixSymbol(arg_348_1.text_)

				local var_351_5 = 10
				local var_351_6 = utf8.len(var_351_4)
				local var_351_7 = var_351_5 <= 0 and var_351_1 or var_351_1 * (var_351_6 / var_351_5)

				if var_351_7 > 0 and var_351_1 < var_351_7 then
					arg_348_1.talkMaxDuration = var_351_7

					if var_351_7 + var_351_0 > arg_348_1.duration_ then
						arg_348_1.duration_ = var_351_7 + var_351_0
					end
				end

				arg_348_1.text_.text = var_351_4
				arg_348_1.typewritter.percent = 0

				arg_348_1.typewritter:SetDirty()
				arg_348_1:ShowNextGo(false)
				arg_348_1:RecordContent(arg_348_1.text_.text)
			end

			local var_351_8 = math.max(var_351_1, arg_348_1.talkMaxDuration)

			if var_351_0 <= arg_348_1.time_ and arg_348_1.time_ < var_351_0 + var_351_8 then
				arg_348_1.typewritter.percent = (arg_348_1.time_ - var_351_0) / var_351_8

				arg_348_1.typewritter:SetDirty()
			end

			if arg_348_1.time_ >= var_351_0 + var_351_8 and arg_348_1.time_ < var_351_0 + var_351_8 + arg_351_0 then
				arg_348_1.typewritter.percent = 1

				arg_348_1.typewritter:SetDirty()
				arg_348_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105085 = function(arg_352_0, arg_352_1)
		arg_352_1.time_ = 0
		arg_352_1.frameCnt_ = 0
		arg_352_1.state_ = "playing"
		arg_352_1.curTalkId_ = 1108105085
		arg_352_1.duration_ = 5

		SetActive(arg_352_1.tipsGo_, false)

		function arg_352_1.onSingleLineFinish_()
			arg_352_1.onSingleLineUpdate_ = nil
			arg_352_1.onSingleLineFinish_ = nil
			arg_352_1.state_ = "waiting"
		end

		function arg_352_1.playNext_(arg_354_0)
			if arg_354_0 == 1 then
				arg_352_0:Play1108105086(arg_352_1)
			end
		end

		function arg_352_1.onSingleLineUpdate_(arg_355_0)
			local var_355_0 = 0
			local var_355_1 = 1.075

			if var_355_0 < arg_352_1.time_ and arg_352_1.time_ <= var_355_0 + arg_355_0 then
				arg_352_1.talkMaxDuration = 0
				arg_352_1.dialogCg_.alpha = 1

				arg_352_1.dialog_:SetActive(true)
				SetActive(arg_352_1.leftNameGo_, true)

				local var_355_2 = arg_352_1:FormatText(StoryNameCfg[7].name)

				arg_352_1.leftNameTxt_.text = var_355_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_352_1.leftNameTxt_.transform)

				arg_352_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_352_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_352_1:RecordName(arg_352_1.leftNameTxt_.text)
				SetActive(arg_352_1.iconTrs_.gameObject, false)
				arg_352_1.callingController_:SetSelectedState("normal")

				local var_355_3 = arg_352_1:GetWordFromCfg(1108105085)
				local var_355_4 = arg_352_1:FormatText(var_355_3.content)

				arg_352_1.text_.text = var_355_4

				LuaForUtil.ClearLinePrefixSymbol(arg_352_1.text_)

				local var_355_5 = 43
				local var_355_6 = utf8.len(var_355_4)
				local var_355_7 = var_355_5 <= 0 and var_355_1 or var_355_1 * (var_355_6 / var_355_5)

				if var_355_7 > 0 and var_355_1 < var_355_7 then
					arg_352_1.talkMaxDuration = var_355_7

					if var_355_7 + var_355_0 > arg_352_1.duration_ then
						arg_352_1.duration_ = var_355_7 + var_355_0
					end
				end

				arg_352_1.text_.text = var_355_4
				arg_352_1.typewritter.percent = 0

				arg_352_1.typewritter:SetDirty()
				arg_352_1:ShowNextGo(false)
				arg_352_1:RecordContent(arg_352_1.text_.text)
			end

			local var_355_8 = math.max(var_355_1, arg_352_1.talkMaxDuration)

			if var_355_0 <= arg_352_1.time_ and arg_352_1.time_ < var_355_0 + var_355_8 then
				arg_352_1.typewritter.percent = (arg_352_1.time_ - var_355_0) / var_355_8

				arg_352_1.typewritter:SetDirty()
			end

			if arg_352_1.time_ >= var_355_0 + var_355_8 and arg_352_1.time_ < var_355_0 + var_355_8 + arg_355_0 then
				arg_352_1.typewritter.percent = 1

				arg_352_1.typewritter:SetDirty()
				arg_352_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105086 = function(arg_356_0, arg_356_1)
		arg_356_1.time_ = 0
		arg_356_1.frameCnt_ = 0
		arg_356_1.state_ = "playing"
		arg_356_1.curTalkId_ = 1108105086
		arg_356_1.duration_ = 5

		SetActive(arg_356_1.tipsGo_, false)

		function arg_356_1.onSingleLineFinish_()
			arg_356_1.onSingleLineUpdate_ = nil
			arg_356_1.onSingleLineFinish_ = nil
			arg_356_1.state_ = "waiting"
		end

		function arg_356_1.playNext_(arg_358_0)
			if arg_358_0 == 1 then
				arg_356_0:Play1108105087(arg_356_1)
			end
		end

		function arg_356_1.onSingleLineUpdate_(arg_359_0)
			local var_359_0 = arg_356_1.actors_["1080ui_story"].transform
			local var_359_1 = 0

			if var_359_1 < arg_356_1.time_ and arg_356_1.time_ <= var_359_1 + arg_359_0 then
				arg_356_1.var_.moveOldPos1080ui_story = var_359_0.localPosition
			end

			local var_359_2 = 0.001

			if var_359_1 <= arg_356_1.time_ and arg_356_1.time_ < var_359_1 + var_359_2 then
				local var_359_3 = (arg_356_1.time_ - var_359_1) / var_359_2
				local var_359_4 = Vector3.New(0, 100, 0)

				var_359_0.localPosition = Vector3.Lerp(arg_356_1.var_.moveOldPos1080ui_story, var_359_4, var_359_3)

				local var_359_5 = manager.ui.mainCamera.transform.position - var_359_0.position

				var_359_0.forward = Vector3.New(var_359_5.x, var_359_5.y, var_359_5.z)

				local var_359_6 = var_359_0.localEulerAngles

				var_359_6.z = 0
				var_359_6.x = 0
				var_359_0.localEulerAngles = var_359_6
			end

			if arg_356_1.time_ >= var_359_1 + var_359_2 and arg_356_1.time_ < var_359_1 + var_359_2 + arg_359_0 then
				var_359_0.localPosition = Vector3.New(0, 100, 0)

				local var_359_7 = manager.ui.mainCamera.transform.position - var_359_0.position

				var_359_0.forward = Vector3.New(var_359_7.x, var_359_7.y, var_359_7.z)

				local var_359_8 = var_359_0.localEulerAngles

				var_359_8.z = 0
				var_359_8.x = 0
				var_359_0.localEulerAngles = var_359_8
			end

			local var_359_9 = arg_356_1.actors_["1081ui_story"].transform
			local var_359_10 = 0

			if var_359_10 < arg_356_1.time_ and arg_356_1.time_ <= var_359_10 + arg_359_0 then
				arg_356_1.var_.moveOldPos1081ui_story = var_359_9.localPosition
			end

			local var_359_11 = 0.001

			if var_359_10 <= arg_356_1.time_ and arg_356_1.time_ < var_359_10 + var_359_11 then
				local var_359_12 = (arg_356_1.time_ - var_359_10) / var_359_11
				local var_359_13 = Vector3.New(0, -0.92, -5.8)

				var_359_9.localPosition = Vector3.Lerp(arg_356_1.var_.moveOldPos1081ui_story, var_359_13, var_359_12)

				local var_359_14 = manager.ui.mainCamera.transform.position - var_359_9.position

				var_359_9.forward = Vector3.New(var_359_14.x, var_359_14.y, var_359_14.z)

				local var_359_15 = var_359_9.localEulerAngles

				var_359_15.z = 0
				var_359_15.x = 0
				var_359_9.localEulerAngles = var_359_15
			end

			if arg_356_1.time_ >= var_359_10 + var_359_11 and arg_356_1.time_ < var_359_10 + var_359_11 + arg_359_0 then
				var_359_9.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_359_16 = manager.ui.mainCamera.transform.position - var_359_9.position

				var_359_9.forward = Vector3.New(var_359_16.x, var_359_16.y, var_359_16.z)

				local var_359_17 = var_359_9.localEulerAngles

				var_359_17.z = 0
				var_359_17.x = 0
				var_359_9.localEulerAngles = var_359_17
			end

			local var_359_18 = arg_356_1.actors_["1081ui_story"]
			local var_359_19 = 0

			if var_359_19 < arg_356_1.time_ and arg_356_1.time_ <= var_359_19 + arg_359_0 and arg_356_1.var_.characterEffect1081ui_story == nil then
				arg_356_1.var_.characterEffect1081ui_story = var_359_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_359_20 = 0.200000002980232

			if var_359_19 <= arg_356_1.time_ and arg_356_1.time_ < var_359_19 + var_359_20 then
				local var_359_21 = (arg_356_1.time_ - var_359_19) / var_359_20

				if arg_356_1.var_.characterEffect1081ui_story then
					arg_356_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_356_1.time_ >= var_359_19 + var_359_20 and arg_356_1.time_ < var_359_19 + var_359_20 + arg_359_0 and arg_356_1.var_.characterEffect1081ui_story then
				arg_356_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_359_22 = 0

			if var_359_22 < arg_356_1.time_ and arg_356_1.time_ <= var_359_22 + arg_359_0 then
				arg_356_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_359_23 = 0

			if var_359_23 < arg_356_1.time_ and arg_356_1.time_ <= var_359_23 + arg_359_0 then
				arg_356_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_359_24 = 0
			local var_359_25 = 0.1

			if var_359_24 < arg_356_1.time_ and arg_356_1.time_ <= var_359_24 + arg_359_0 then
				arg_356_1.talkMaxDuration = 0
				arg_356_1.dialogCg_.alpha = 1

				arg_356_1.dialog_:SetActive(true)
				SetActive(arg_356_1.leftNameGo_, true)

				local var_359_26 = arg_356_1:FormatText(StoryNameCfg[202].name)

				arg_356_1.leftNameTxt_.text = var_359_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_356_1.leftNameTxt_.transform)

				arg_356_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_356_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_356_1:RecordName(arg_356_1.leftNameTxt_.text)
				SetActive(arg_356_1.iconTrs_.gameObject, false)
				arg_356_1.callingController_:SetSelectedState("normal")

				local var_359_27 = arg_356_1:GetWordFromCfg(1108105086)
				local var_359_28 = arg_356_1:FormatText(var_359_27.content)

				arg_356_1.text_.text = var_359_28

				LuaForUtil.ClearLinePrefixSymbol(arg_356_1.text_)

				local var_359_29 = 4
				local var_359_30 = utf8.len(var_359_28)
				local var_359_31 = var_359_29 <= 0 and var_359_25 or var_359_25 * (var_359_30 / var_359_29)

				if var_359_31 > 0 and var_359_25 < var_359_31 then
					arg_356_1.talkMaxDuration = var_359_31

					if var_359_31 + var_359_24 > arg_356_1.duration_ then
						arg_356_1.duration_ = var_359_31 + var_359_24
					end
				end

				arg_356_1.text_.text = var_359_28
				arg_356_1.typewritter.percent = 0

				arg_356_1.typewritter:SetDirty()
				arg_356_1:ShowNextGo(false)
				arg_356_1:RecordContent(arg_356_1.text_.text)
			end

			local var_359_32 = math.max(var_359_25, arg_356_1.talkMaxDuration)

			if var_359_24 <= arg_356_1.time_ and arg_356_1.time_ < var_359_24 + var_359_32 then
				arg_356_1.typewritter.percent = (arg_356_1.time_ - var_359_24) / var_359_32

				arg_356_1.typewritter:SetDirty()
			end

			if arg_356_1.time_ >= var_359_24 + var_359_32 and arg_356_1.time_ < var_359_24 + var_359_32 + arg_359_0 then
				arg_356_1.typewritter.percent = 1

				arg_356_1.typewritter:SetDirty()
				arg_356_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105087 = function(arg_360_0, arg_360_1)
		arg_360_1.time_ = 0
		arg_360_1.frameCnt_ = 0
		arg_360_1.state_ = "playing"
		arg_360_1.curTalkId_ = 1108105087
		arg_360_1.duration_ = 1

		SetActive(arg_360_1.tipsGo_, false)

		function arg_360_1.onSingleLineFinish_()
			arg_360_1.onSingleLineUpdate_ = nil
			arg_360_1.onSingleLineFinish_ = nil
			arg_360_1.state_ = "waiting"

			SetActive(arg_360_1.choicesGo_, true)

			for iter_361_0, iter_361_1 in ipairs(arg_360_1.choices_) do
				local var_361_0 = iter_361_0 <= 2

				SetActive(iter_361_1.go, var_361_0)
			end

			arg_360_1.choices_[1].txt.text = arg_360_1:FormatText(StoryChoiceCfg[973].name)
			arg_360_1.choices_[2].txt.text = arg_360_1:FormatText(StoryChoiceCfg[974].name)
		end

		function arg_360_1.playNext_(arg_362_0)
			if arg_362_0 == 1 then
				arg_360_0:Play1108105088(arg_360_1)
			end

			if arg_362_0 == 2 then
				arg_360_0:Play1108105088(arg_360_1)
			end
		end

		function arg_360_1.onSingleLineUpdate_(arg_363_0)
			local var_363_0 = arg_360_1.actors_["1081ui_story"]
			local var_363_1 = 0

			if var_363_1 < arg_360_1.time_ and arg_360_1.time_ <= var_363_1 + arg_363_0 and arg_360_1.var_.characterEffect1081ui_story == nil then
				arg_360_1.var_.characterEffect1081ui_story = var_363_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_363_2 = 0.200000002980232

			if var_363_1 <= arg_360_1.time_ and arg_360_1.time_ < var_363_1 + var_363_2 then
				local var_363_3 = (arg_360_1.time_ - var_363_1) / var_363_2

				if arg_360_1.var_.characterEffect1081ui_story then
					local var_363_4 = Mathf.Lerp(0, 0.5, var_363_3)

					arg_360_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_360_1.var_.characterEffect1081ui_story.fillRatio = var_363_4
				end
			end

			if arg_360_1.time_ >= var_363_1 + var_363_2 and arg_360_1.time_ < var_363_1 + var_363_2 + arg_363_0 and arg_360_1.var_.characterEffect1081ui_story then
				local var_363_5 = 0.5

				arg_360_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_360_1.var_.characterEffect1081ui_story.fillRatio = var_363_5
			end
		end
	end,
	Play1108105088 = function(arg_364_0, arg_364_1)
		arg_364_1.time_ = 0
		arg_364_1.frameCnt_ = 0
		arg_364_1.state_ = "playing"
		arg_364_1.curTalkId_ = 1108105088
		arg_364_1.duration_ = 5

		SetActive(arg_364_1.tipsGo_, false)

		function arg_364_1.onSingleLineFinish_()
			arg_364_1.onSingleLineUpdate_ = nil
			arg_364_1.onSingleLineFinish_ = nil
			arg_364_1.state_ = "waiting"
		end

		function arg_364_1.playNext_(arg_366_0)
			if arg_366_0 == 1 then
				arg_364_0:Play1108105089(arg_364_1)
			end
		end

		function arg_364_1.onSingleLineUpdate_(arg_367_0)
			local var_367_0 = 0
			local var_367_1 = 0.3

			if var_367_0 < arg_364_1.time_ and arg_364_1.time_ <= var_367_0 + arg_367_0 then
				arg_364_1.talkMaxDuration = 0
				arg_364_1.dialogCg_.alpha = 1

				arg_364_1.dialog_:SetActive(true)
				SetActive(arg_364_1.leftNameGo_, true)

				local var_367_2 = arg_364_1:FormatText(StoryNameCfg[7].name)

				arg_364_1.leftNameTxt_.text = var_367_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_364_1.leftNameTxt_.transform)

				arg_364_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_364_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_364_1:RecordName(arg_364_1.leftNameTxt_.text)
				SetActive(arg_364_1.iconTrs_.gameObject, false)
				arg_364_1.callingController_:SetSelectedState("normal")

				local var_367_3 = arg_364_1:GetWordFromCfg(1108105088)
				local var_367_4 = arg_364_1:FormatText(var_367_3.content)

				arg_364_1.text_.text = var_367_4

				LuaForUtil.ClearLinePrefixSymbol(arg_364_1.text_)

				local var_367_5 = 12
				local var_367_6 = utf8.len(var_367_4)
				local var_367_7 = var_367_5 <= 0 and var_367_1 or var_367_1 * (var_367_6 / var_367_5)

				if var_367_7 > 0 and var_367_1 < var_367_7 then
					arg_364_1.talkMaxDuration = var_367_7

					if var_367_7 + var_367_0 > arg_364_1.duration_ then
						arg_364_1.duration_ = var_367_7 + var_367_0
					end
				end

				arg_364_1.text_.text = var_367_4
				arg_364_1.typewritter.percent = 0

				arg_364_1.typewritter:SetDirty()
				arg_364_1:ShowNextGo(false)
				arg_364_1:RecordContent(arg_364_1.text_.text)
			end

			local var_367_8 = math.max(var_367_1, arg_364_1.talkMaxDuration)

			if var_367_0 <= arg_364_1.time_ and arg_364_1.time_ < var_367_0 + var_367_8 then
				arg_364_1.typewritter.percent = (arg_364_1.time_ - var_367_0) / var_367_8

				arg_364_1.typewritter:SetDirty()
			end

			if arg_364_1.time_ >= var_367_0 + var_367_8 and arg_364_1.time_ < var_367_0 + var_367_8 + arg_367_0 then
				arg_364_1.typewritter.percent = 1

				arg_364_1.typewritter:SetDirty()
				arg_364_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105089 = function(arg_368_0, arg_368_1)
		arg_368_1.time_ = 0
		arg_368_1.frameCnt_ = 0
		arg_368_1.state_ = "playing"
		arg_368_1.curTalkId_ = 1108105089
		arg_368_1.duration_ = 5

		SetActive(arg_368_1.tipsGo_, false)

		function arg_368_1.onSingleLineFinish_()
			arg_368_1.onSingleLineUpdate_ = nil
			arg_368_1.onSingleLineFinish_ = nil
			arg_368_1.state_ = "waiting"
		end

		function arg_368_1.playNext_(arg_370_0)
			if arg_370_0 == 1 then
				arg_368_0:Play1108105090(arg_368_1)
			end
		end

		function arg_368_1.onSingleLineUpdate_(arg_371_0)
			local var_371_0 = arg_368_1.actors_["1081ui_story"].transform
			local var_371_1 = 0

			if var_371_1 < arg_368_1.time_ and arg_368_1.time_ <= var_371_1 + arg_371_0 then
				arg_368_1.var_.moveOldPos1081ui_story = var_371_0.localPosition
			end

			local var_371_2 = 0.001

			if var_371_1 <= arg_368_1.time_ and arg_368_1.time_ < var_371_1 + var_371_2 then
				local var_371_3 = (arg_368_1.time_ - var_371_1) / var_371_2
				local var_371_4 = Vector3.New(0, 100, 0)

				var_371_0.localPosition = Vector3.Lerp(arg_368_1.var_.moveOldPos1081ui_story, var_371_4, var_371_3)

				local var_371_5 = manager.ui.mainCamera.transform.position - var_371_0.position

				var_371_0.forward = Vector3.New(var_371_5.x, var_371_5.y, var_371_5.z)

				local var_371_6 = var_371_0.localEulerAngles

				var_371_6.z = 0
				var_371_6.x = 0
				var_371_0.localEulerAngles = var_371_6
			end

			if arg_368_1.time_ >= var_371_1 + var_371_2 and arg_368_1.time_ < var_371_1 + var_371_2 + arg_371_0 then
				var_371_0.localPosition = Vector3.New(0, 100, 0)

				local var_371_7 = manager.ui.mainCamera.transform.position - var_371_0.position

				var_371_0.forward = Vector3.New(var_371_7.x, var_371_7.y, var_371_7.z)

				local var_371_8 = var_371_0.localEulerAngles

				var_371_8.z = 0
				var_371_8.x = 0
				var_371_0.localEulerAngles = var_371_8
			end

			local var_371_9 = 0
			local var_371_10 = 0.925

			if var_371_9 < arg_368_1.time_ and arg_368_1.time_ <= var_371_9 + arg_371_0 then
				arg_368_1.talkMaxDuration = 0
				arg_368_1.dialogCg_.alpha = 1

				arg_368_1.dialog_:SetActive(true)
				SetActive(arg_368_1.leftNameGo_, false)

				arg_368_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_368_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_368_1:RecordName(arg_368_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_368_1.iconTrs_.gameObject, false)
				arg_368_1.callingController_:SetSelectedState("normal")

				local var_371_11 = arg_368_1:GetWordFromCfg(1108105089)
				local var_371_12 = arg_368_1:FormatText(var_371_11.content)

				arg_368_1.text_.text = var_371_12

				LuaForUtil.ClearLinePrefixSymbol(arg_368_1.text_)

				local var_371_13 = 37
				local var_371_14 = utf8.len(var_371_12)
				local var_371_15 = var_371_13 <= 0 and var_371_10 or var_371_10 * (var_371_14 / var_371_13)

				if var_371_15 > 0 and var_371_10 < var_371_15 then
					arg_368_1.talkMaxDuration = var_371_15

					if var_371_15 + var_371_9 > arg_368_1.duration_ then
						arg_368_1.duration_ = var_371_15 + var_371_9
					end
				end

				arg_368_1.text_.text = var_371_12
				arg_368_1.typewritter.percent = 0

				arg_368_1.typewritter:SetDirty()
				arg_368_1:ShowNextGo(false)
				arg_368_1:RecordContent(arg_368_1.text_.text)
			end

			local var_371_16 = math.max(var_371_10, arg_368_1.talkMaxDuration)

			if var_371_9 <= arg_368_1.time_ and arg_368_1.time_ < var_371_9 + var_371_16 then
				arg_368_1.typewritter.percent = (arg_368_1.time_ - var_371_9) / var_371_16

				arg_368_1.typewritter:SetDirty()
			end

			if arg_368_1.time_ >= var_371_9 + var_371_16 and arg_368_1.time_ < var_371_9 + var_371_16 + arg_371_0 then
				arg_368_1.typewritter.percent = 1

				arg_368_1.typewritter:SetDirty()
				arg_368_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105090 = function(arg_372_0, arg_372_1)
		arg_372_1.time_ = 0
		arg_372_1.frameCnt_ = 0
		arg_372_1.state_ = "playing"
		arg_372_1.curTalkId_ = 1108105090
		arg_372_1.duration_ = 5

		SetActive(arg_372_1.tipsGo_, false)

		function arg_372_1.onSingleLineFinish_()
			arg_372_1.onSingleLineUpdate_ = nil
			arg_372_1.onSingleLineFinish_ = nil
			arg_372_1.state_ = "waiting"
		end

		function arg_372_1.playNext_(arg_374_0)
			if arg_374_0 == 1 then
				arg_372_0:Play1108105091(arg_372_1)
			end
		end

		function arg_372_1.onSingleLineUpdate_(arg_375_0)
			local var_375_0 = arg_372_1.actors_["1081ui_story"].transform
			local var_375_1 = 0

			if var_375_1 < arg_372_1.time_ and arg_372_1.time_ <= var_375_1 + arg_375_0 then
				arg_372_1.var_.moveOldPos1081ui_story = var_375_0.localPosition
			end

			local var_375_2 = 0.001

			if var_375_1 <= arg_372_1.time_ and arg_372_1.time_ < var_375_1 + var_375_2 then
				local var_375_3 = (arg_372_1.time_ - var_375_1) / var_375_2
				local var_375_4 = Vector3.New(0, -0.92, -5.8)

				var_375_0.localPosition = Vector3.Lerp(arg_372_1.var_.moveOldPos1081ui_story, var_375_4, var_375_3)

				local var_375_5 = manager.ui.mainCamera.transform.position - var_375_0.position

				var_375_0.forward = Vector3.New(var_375_5.x, var_375_5.y, var_375_5.z)

				local var_375_6 = var_375_0.localEulerAngles

				var_375_6.z = 0
				var_375_6.x = 0
				var_375_0.localEulerAngles = var_375_6
			end

			if arg_372_1.time_ >= var_375_1 + var_375_2 and arg_372_1.time_ < var_375_1 + var_375_2 + arg_375_0 then
				var_375_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_375_7 = manager.ui.mainCamera.transform.position - var_375_0.position

				var_375_0.forward = Vector3.New(var_375_7.x, var_375_7.y, var_375_7.z)

				local var_375_8 = var_375_0.localEulerAngles

				var_375_8.z = 0
				var_375_8.x = 0
				var_375_0.localEulerAngles = var_375_8
			end

			local var_375_9 = arg_372_1.actors_["1081ui_story"]
			local var_375_10 = 0

			if var_375_10 < arg_372_1.time_ and arg_372_1.time_ <= var_375_10 + arg_375_0 and arg_372_1.var_.characterEffect1081ui_story == nil then
				arg_372_1.var_.characterEffect1081ui_story = var_375_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_375_11 = 0.200000002980232

			if var_375_10 <= arg_372_1.time_ and arg_372_1.time_ < var_375_10 + var_375_11 then
				local var_375_12 = (arg_372_1.time_ - var_375_10) / var_375_11

				if arg_372_1.var_.characterEffect1081ui_story then
					arg_372_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_372_1.time_ >= var_375_10 + var_375_11 and arg_372_1.time_ < var_375_10 + var_375_11 + arg_375_0 and arg_372_1.var_.characterEffect1081ui_story then
				arg_372_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_375_13 = 0

			if var_375_13 < arg_372_1.time_ and arg_372_1.time_ <= var_375_13 + arg_375_0 then
				arg_372_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action9_1")
			end

			local var_375_14 = 0

			if var_375_14 < arg_372_1.time_ and arg_372_1.time_ <= var_375_14 + arg_375_0 then
				arg_372_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_375_15 = 0
			local var_375_16 = 0.275

			if var_375_15 < arg_372_1.time_ and arg_372_1.time_ <= var_375_15 + arg_375_0 then
				arg_372_1.talkMaxDuration = 0
				arg_372_1.dialogCg_.alpha = 1

				arg_372_1.dialog_:SetActive(true)
				SetActive(arg_372_1.leftNameGo_, true)

				local var_375_17 = arg_372_1:FormatText(StoryNameCfg[202].name)

				arg_372_1.leftNameTxt_.text = var_375_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_372_1.leftNameTxt_.transform)

				arg_372_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_372_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_372_1:RecordName(arg_372_1.leftNameTxt_.text)
				SetActive(arg_372_1.iconTrs_.gameObject, false)
				arg_372_1.callingController_:SetSelectedState("normal")

				local var_375_18 = arg_372_1:GetWordFromCfg(1108105090)
				local var_375_19 = arg_372_1:FormatText(var_375_18.content)

				arg_372_1.text_.text = var_375_19

				LuaForUtil.ClearLinePrefixSymbol(arg_372_1.text_)

				local var_375_20 = 11
				local var_375_21 = utf8.len(var_375_19)
				local var_375_22 = var_375_20 <= 0 and var_375_16 or var_375_16 * (var_375_21 / var_375_20)

				if var_375_22 > 0 and var_375_16 < var_375_22 then
					arg_372_1.talkMaxDuration = var_375_22

					if var_375_22 + var_375_15 > arg_372_1.duration_ then
						arg_372_1.duration_ = var_375_22 + var_375_15
					end
				end

				arg_372_1.text_.text = var_375_19
				arg_372_1.typewritter.percent = 0

				arg_372_1.typewritter:SetDirty()
				arg_372_1:ShowNextGo(false)
				arg_372_1:RecordContent(arg_372_1.text_.text)
			end

			local var_375_23 = math.max(var_375_16, arg_372_1.talkMaxDuration)

			if var_375_15 <= arg_372_1.time_ and arg_372_1.time_ < var_375_15 + var_375_23 then
				arg_372_1.typewritter.percent = (arg_372_1.time_ - var_375_15) / var_375_23

				arg_372_1.typewritter:SetDirty()
			end

			if arg_372_1.time_ >= var_375_15 + var_375_23 and arg_372_1.time_ < var_375_15 + var_375_23 + arg_375_0 then
				arg_372_1.typewritter.percent = 1

				arg_372_1.typewritter:SetDirty()
				arg_372_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105091 = function(arg_376_0, arg_376_1)
		arg_376_1.time_ = 0
		arg_376_1.frameCnt_ = 0
		arg_376_1.state_ = "playing"
		arg_376_1.curTalkId_ = 1108105091
		arg_376_1.duration_ = 8.77

		SetActive(arg_376_1.tipsGo_, false)

		function arg_376_1.onSingleLineFinish_()
			arg_376_1.onSingleLineUpdate_ = nil
			arg_376_1.onSingleLineFinish_ = nil
			arg_376_1.state_ = "waiting"
		end

		function arg_376_1.playNext_(arg_378_0)
			if arg_378_0 == 1 then
				arg_376_0:Play1108105092(arg_376_1)
			end
		end

		function arg_376_1.onSingleLineUpdate_(arg_379_0)
			local var_379_0 = 2.00066666851441

			if var_379_0 < arg_376_1.time_ and arg_376_1.time_ <= var_379_0 + arg_379_0 then
				local var_379_1 = manager.ui.mainCamera.transform.localPosition
				local var_379_2 = Vector3.New(0, 0, 10) + Vector3.New(var_379_1.x, var_379_1.y, 0)
				local var_379_3 = arg_376_1.bgs_.ST0403a

				var_379_3.transform.localPosition = var_379_2
				var_379_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_379_4 = var_379_3:GetComponent("SpriteRenderer")

				if var_379_4 and var_379_4.sprite then
					local var_379_5 = (var_379_3.transform.localPosition - var_379_1).z
					local var_379_6 = manager.ui.mainCameraCom_
					local var_379_7 = 2 * var_379_5 * Mathf.Tan(var_379_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_379_8 = var_379_7 * var_379_6.aspect
					local var_379_9 = var_379_4.sprite.bounds.size.x
					local var_379_10 = var_379_4.sprite.bounds.size.y
					local var_379_11 = var_379_8 / var_379_9
					local var_379_12 = var_379_7 / var_379_10
					local var_379_13 = var_379_12 < var_379_11 and var_379_11 or var_379_12

					var_379_3.transform.localScale = Vector3.New(var_379_13, var_379_13, 0)
				end

				for iter_379_0, iter_379_1 in pairs(arg_376_1.bgs_) do
					if iter_379_0 ~= "ST0403a" then
						iter_379_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_379_14 = 3.9

			if var_379_14 < arg_376_1.time_ and arg_376_1.time_ <= var_379_14 + arg_379_0 then
				arg_376_1.allBtn_.enabled = false
			end

			local var_379_15 = 0.3

			if arg_376_1.time_ >= var_379_14 + var_379_15 and arg_376_1.time_ < var_379_14 + var_379_15 + arg_379_0 then
				arg_376_1.allBtn_.enabled = true
			end

			local var_379_16 = 0

			if var_379_16 < arg_376_1.time_ and arg_376_1.time_ <= var_379_16 + arg_379_0 then
				arg_376_1.mask_.enabled = true
				arg_376_1.mask_.raycastTarget = true

				arg_376_1:SetGaussion(false)
			end

			local var_379_17 = 2.00066666851441

			if var_379_16 <= arg_376_1.time_ and arg_376_1.time_ < var_379_16 + var_379_17 then
				local var_379_18 = (arg_376_1.time_ - var_379_16) / var_379_17
				local var_379_19 = Color.New(0, 0, 0)

				var_379_19.a = Mathf.Lerp(0, 1, var_379_18)
				arg_376_1.mask_.color = var_379_19
			end

			if arg_376_1.time_ >= var_379_16 + var_379_17 and arg_376_1.time_ < var_379_16 + var_379_17 + arg_379_0 then
				local var_379_20 = Color.New(0, 0, 0)

				var_379_20.a = 1
				arg_376_1.mask_.color = var_379_20
			end

			local var_379_21 = 2.00066666851441

			if var_379_21 < arg_376_1.time_ and arg_376_1.time_ <= var_379_21 + arg_379_0 then
				arg_376_1.mask_.enabled = true
				arg_376_1.mask_.raycastTarget = true

				arg_376_1:SetGaussion(false)
			end

			local var_379_22 = 1.89933333148559

			if var_379_21 <= arg_376_1.time_ and arg_376_1.time_ < var_379_21 + var_379_22 then
				local var_379_23 = (arg_376_1.time_ - var_379_21) / var_379_22
				local var_379_24 = Color.New(0, 0, 0)

				var_379_24.a = Mathf.Lerp(1, 0, var_379_23)
				arg_376_1.mask_.color = var_379_24
			end

			if arg_376_1.time_ >= var_379_21 + var_379_22 and arg_376_1.time_ < var_379_21 + var_379_22 + arg_379_0 then
				local var_379_25 = Color.New(0, 0, 0)
				local var_379_26 = 0

				arg_376_1.mask_.enabled = false
				var_379_25.a = var_379_26
				arg_376_1.mask_.color = var_379_25
			end

			local var_379_27 = arg_376_1.actors_["1081ui_story"]
			local var_379_28 = 1.98400000184774

			if var_379_28 < arg_376_1.time_ and arg_376_1.time_ <= var_379_28 + arg_379_0 and arg_376_1.var_.characterEffect1081ui_story == nil then
				arg_376_1.var_.characterEffect1081ui_story = var_379_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_379_29 = 0.0166666666666666

			if var_379_28 <= arg_376_1.time_ and arg_376_1.time_ < var_379_28 + var_379_29 then
				local var_379_30 = (arg_376_1.time_ - var_379_28) / var_379_29

				if arg_376_1.var_.characterEffect1081ui_story then
					local var_379_31 = Mathf.Lerp(0, 0.5, var_379_30)

					arg_376_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_376_1.var_.characterEffect1081ui_story.fillRatio = var_379_31
				end
			end

			if arg_376_1.time_ >= var_379_28 + var_379_29 and arg_376_1.time_ < var_379_28 + var_379_29 + arg_379_0 and arg_376_1.var_.characterEffect1081ui_story then
				local var_379_32 = 0.5

				arg_376_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_376_1.var_.characterEffect1081ui_story.fillRatio = var_379_32
			end

			local var_379_33 = arg_376_1.actors_["1080ui_story"].transform
			local var_379_34 = 2.00066666851441

			if var_379_34 < arg_376_1.time_ and arg_376_1.time_ <= var_379_34 + arg_379_0 then
				arg_376_1.var_.moveOldPos1080ui_story = var_379_33.localPosition
			end

			local var_379_35 = 0.001

			if var_379_34 <= arg_376_1.time_ and arg_376_1.time_ < var_379_34 + var_379_35 then
				local var_379_36 = (arg_376_1.time_ - var_379_34) / var_379_35
				local var_379_37 = Vector3.New(0, 100, 0)

				var_379_33.localPosition = Vector3.Lerp(arg_376_1.var_.moveOldPos1080ui_story, var_379_37, var_379_36)

				local var_379_38 = manager.ui.mainCamera.transform.position - var_379_33.position

				var_379_33.forward = Vector3.New(var_379_38.x, var_379_38.y, var_379_38.z)

				local var_379_39 = var_379_33.localEulerAngles

				var_379_39.z = 0
				var_379_39.x = 0
				var_379_33.localEulerAngles = var_379_39
			end

			if arg_376_1.time_ >= var_379_34 + var_379_35 and arg_376_1.time_ < var_379_34 + var_379_35 + arg_379_0 then
				var_379_33.localPosition = Vector3.New(0, 100, 0)

				local var_379_40 = manager.ui.mainCamera.transform.position - var_379_33.position

				var_379_33.forward = Vector3.New(var_379_40.x, var_379_40.y, var_379_40.z)

				local var_379_41 = var_379_33.localEulerAngles

				var_379_41.z = 0
				var_379_41.x = 0
				var_379_33.localEulerAngles = var_379_41
			end

			local var_379_42 = arg_376_1.actors_["1081ui_story"].transform
			local var_379_43 = 2.00066666851441

			if var_379_43 < arg_376_1.time_ and arg_376_1.time_ <= var_379_43 + arg_379_0 then
				arg_376_1.var_.moveOldPos1081ui_story = var_379_42.localPosition
			end

			local var_379_44 = 0.001

			if var_379_43 <= arg_376_1.time_ and arg_376_1.time_ < var_379_43 + var_379_44 then
				local var_379_45 = (arg_376_1.time_ - var_379_43) / var_379_44
				local var_379_46 = Vector3.New(0, 100, 0)

				var_379_42.localPosition = Vector3.Lerp(arg_376_1.var_.moveOldPos1081ui_story, var_379_46, var_379_45)

				local var_379_47 = manager.ui.mainCamera.transform.position - var_379_42.position

				var_379_42.forward = Vector3.New(var_379_47.x, var_379_47.y, var_379_47.z)

				local var_379_48 = var_379_42.localEulerAngles

				var_379_48.z = 0
				var_379_48.x = 0
				var_379_42.localEulerAngles = var_379_48
			end

			if arg_376_1.time_ >= var_379_43 + var_379_44 and arg_376_1.time_ < var_379_43 + var_379_44 + arg_379_0 then
				var_379_42.localPosition = Vector3.New(0, 100, 0)

				local var_379_49 = manager.ui.mainCamera.transform.position - var_379_42.position

				var_379_42.forward = Vector3.New(var_379_49.x, var_379_49.y, var_379_49.z)

				local var_379_50 = var_379_42.localEulerAngles

				var_379_50.z = 0
				var_379_50.x = 0
				var_379_42.localEulerAngles = var_379_50
			end

			if arg_376_1.frameCnt_ <= 1 then
				arg_376_1.dialog_:SetActive(false)
			end

			local var_379_51 = 3.76666666666667
			local var_379_52 = 0.725

			if var_379_51 < arg_376_1.time_ and arg_376_1.time_ <= var_379_51 + arg_379_0 then
				arg_376_1.talkMaxDuration = 0

				arg_376_1.dialog_:SetActive(true)

				local var_379_53 = LeanTween.value(arg_376_1.dialog_, 0, 1, 0.3)

				var_379_53:setOnUpdate(LuaHelper.FloatAction(function(arg_380_0)
					arg_376_1.dialogCg_.alpha = arg_380_0
				end))
				var_379_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_376_1.dialog_)
					var_379_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_376_1.duration_ = arg_376_1.duration_ + 0.3

				SetActive(arg_376_1.leftNameGo_, false)

				arg_376_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_376_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_376_1:RecordName(arg_376_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_376_1.iconTrs_.gameObject, false)
				arg_376_1.callingController_:SetSelectedState("normal")

				local var_379_54 = arg_376_1:GetWordFromCfg(1108105091)
				local var_379_55 = arg_376_1:FormatText(var_379_54.content)

				arg_376_1.text_.text = var_379_55

				LuaForUtil.ClearLinePrefixSymbol(arg_376_1.text_)

				local var_379_56 = 29
				local var_379_57 = utf8.len(var_379_55)
				local var_379_58 = var_379_56 <= 0 and var_379_52 or var_379_52 * (var_379_57 / var_379_56)

				if var_379_58 > 0 and var_379_52 < var_379_58 then
					arg_376_1.talkMaxDuration = var_379_58
					var_379_51 = var_379_51 + 0.3

					if var_379_58 + var_379_51 > arg_376_1.duration_ then
						arg_376_1.duration_ = var_379_58 + var_379_51
					end
				end

				arg_376_1.text_.text = var_379_55
				arg_376_1.typewritter.percent = 0

				arg_376_1.typewritter:SetDirty()
				arg_376_1:ShowNextGo(false)
				arg_376_1:RecordContent(arg_376_1.text_.text)
			end

			local var_379_59 = var_379_51 + 0.3
			local var_379_60 = math.max(var_379_52, arg_376_1.talkMaxDuration)

			if var_379_59 <= arg_376_1.time_ and arg_376_1.time_ < var_379_59 + var_379_60 then
				arg_376_1.typewritter.percent = (arg_376_1.time_ - var_379_59) / var_379_60

				arg_376_1.typewritter:SetDirty()
			end

			if arg_376_1.time_ >= var_379_59 + var_379_60 and arg_376_1.time_ < var_379_59 + var_379_60 + arg_379_0 then
				arg_376_1.typewritter.percent = 1

				arg_376_1.typewritter:SetDirty()
				arg_376_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105092 = function(arg_382_0, arg_382_1)
		arg_382_1.time_ = 0
		arg_382_1.frameCnt_ = 0
		arg_382_1.state_ = "playing"
		arg_382_1.curTalkId_ = 1108105092
		arg_382_1.duration_ = 5

		SetActive(arg_382_1.tipsGo_, false)

		function arg_382_1.onSingleLineFinish_()
			arg_382_1.onSingleLineUpdate_ = nil
			arg_382_1.onSingleLineFinish_ = nil
			arg_382_1.state_ = "waiting"
		end

		function arg_382_1.playNext_(arg_384_0)
			if arg_384_0 == 1 then
				arg_382_0:Play1108105093(arg_382_1)
			end
		end

		function arg_382_1.onSingleLineUpdate_(arg_385_0)
			local var_385_0 = 0
			local var_385_1 = 1.275

			if var_385_0 < arg_382_1.time_ and arg_382_1.time_ <= var_385_0 + arg_385_0 then
				arg_382_1.talkMaxDuration = 0
				arg_382_1.dialogCg_.alpha = 1

				arg_382_1.dialog_:SetActive(true)
				SetActive(arg_382_1.leftNameGo_, false)

				arg_382_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_382_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_382_1:RecordName(arg_382_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_382_1.iconTrs_.gameObject, false)
				arg_382_1.callingController_:SetSelectedState("normal")

				local var_385_2 = arg_382_1:GetWordFromCfg(1108105092)
				local var_385_3 = arg_382_1:FormatText(var_385_2.content)

				arg_382_1.text_.text = var_385_3

				LuaForUtil.ClearLinePrefixSymbol(arg_382_1.text_)

				local var_385_4 = 51
				local var_385_5 = utf8.len(var_385_3)
				local var_385_6 = var_385_4 <= 0 and var_385_1 or var_385_1 * (var_385_5 / var_385_4)

				if var_385_6 > 0 and var_385_1 < var_385_6 then
					arg_382_1.talkMaxDuration = var_385_6

					if var_385_6 + var_385_0 > arg_382_1.duration_ then
						arg_382_1.duration_ = var_385_6 + var_385_0
					end
				end

				arg_382_1.text_.text = var_385_3
				arg_382_1.typewritter.percent = 0

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(false)
				arg_382_1:RecordContent(arg_382_1.text_.text)
			end

			local var_385_7 = math.max(var_385_1, arg_382_1.talkMaxDuration)

			if var_385_0 <= arg_382_1.time_ and arg_382_1.time_ < var_385_0 + var_385_7 then
				arg_382_1.typewritter.percent = (arg_382_1.time_ - var_385_0) / var_385_7

				arg_382_1.typewritter:SetDirty()
			end

			if arg_382_1.time_ >= var_385_0 + var_385_7 and arg_382_1.time_ < var_385_0 + var_385_7 + arg_385_0 then
				arg_382_1.typewritter.percent = 1

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105093 = function(arg_386_0, arg_386_1)
		arg_386_1.time_ = 0
		arg_386_1.frameCnt_ = 0
		arg_386_1.state_ = "playing"
		arg_386_1.curTalkId_ = 1108105093
		arg_386_1.duration_ = 5

		SetActive(arg_386_1.tipsGo_, false)

		function arg_386_1.onSingleLineFinish_()
			arg_386_1.onSingleLineUpdate_ = nil
			arg_386_1.onSingleLineFinish_ = nil
			arg_386_1.state_ = "waiting"
		end

		function arg_386_1.playNext_(arg_388_0)
			if arg_388_0 == 1 then
				arg_386_0:Play1108105094(arg_386_1)
			end
		end

		function arg_386_1.onSingleLineUpdate_(arg_389_0)
			local var_389_0 = arg_386_1.actors_["1081ui_story"].transform
			local var_389_1 = 0

			if var_389_1 < arg_386_1.time_ and arg_386_1.time_ <= var_389_1 + arg_389_0 then
				arg_386_1.var_.moveOldPos1081ui_story = var_389_0.localPosition
			end

			local var_389_2 = 0.001

			if var_389_1 <= arg_386_1.time_ and arg_386_1.time_ < var_389_1 + var_389_2 then
				local var_389_3 = (arg_386_1.time_ - var_389_1) / var_389_2
				local var_389_4 = Vector3.New(0, -0.92, -5.8)

				var_389_0.localPosition = Vector3.Lerp(arg_386_1.var_.moveOldPos1081ui_story, var_389_4, var_389_3)

				local var_389_5 = manager.ui.mainCamera.transform.position - var_389_0.position

				var_389_0.forward = Vector3.New(var_389_5.x, var_389_5.y, var_389_5.z)

				local var_389_6 = var_389_0.localEulerAngles

				var_389_6.z = 0
				var_389_6.x = 0
				var_389_0.localEulerAngles = var_389_6
			end

			if arg_386_1.time_ >= var_389_1 + var_389_2 and arg_386_1.time_ < var_389_1 + var_389_2 + arg_389_0 then
				var_389_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_389_7 = manager.ui.mainCamera.transform.position - var_389_0.position

				var_389_0.forward = Vector3.New(var_389_7.x, var_389_7.y, var_389_7.z)

				local var_389_8 = var_389_0.localEulerAngles

				var_389_8.z = 0
				var_389_8.x = 0
				var_389_0.localEulerAngles = var_389_8
			end

			local var_389_9 = arg_386_1.actors_["1081ui_story"]
			local var_389_10 = 0

			if var_389_10 < arg_386_1.time_ and arg_386_1.time_ <= var_389_10 + arg_389_0 and arg_386_1.var_.characterEffect1081ui_story == nil then
				arg_386_1.var_.characterEffect1081ui_story = var_389_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_389_11 = 0.200000002980232

			if var_389_10 <= arg_386_1.time_ and arg_386_1.time_ < var_389_10 + var_389_11 then
				local var_389_12 = (arg_386_1.time_ - var_389_10) / var_389_11

				if arg_386_1.var_.characterEffect1081ui_story then
					arg_386_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_386_1.time_ >= var_389_10 + var_389_11 and arg_386_1.time_ < var_389_10 + var_389_11 + arg_389_0 and arg_386_1.var_.characterEffect1081ui_story then
				arg_386_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_389_13 = 0

			if var_389_13 < arg_386_1.time_ and arg_386_1.time_ <= var_389_13 + arg_389_0 then
				arg_386_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action9_2")
			end

			local var_389_14 = 0

			if var_389_14 < arg_386_1.time_ and arg_386_1.time_ <= var_389_14 + arg_389_0 then
				arg_386_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_389_15 = 0
			local var_389_16 = 0.45

			if var_389_15 < arg_386_1.time_ and arg_386_1.time_ <= var_389_15 + arg_389_0 then
				arg_386_1.talkMaxDuration = 0
				arg_386_1.dialogCg_.alpha = 1

				arg_386_1.dialog_:SetActive(true)
				SetActive(arg_386_1.leftNameGo_, true)

				local var_389_17 = arg_386_1:FormatText(StoryNameCfg[202].name)

				arg_386_1.leftNameTxt_.text = var_389_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_386_1.leftNameTxt_.transform)

				arg_386_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_386_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_386_1:RecordName(arg_386_1.leftNameTxt_.text)
				SetActive(arg_386_1.iconTrs_.gameObject, false)
				arg_386_1.callingController_:SetSelectedState("normal")

				local var_389_18 = arg_386_1:GetWordFromCfg(1108105093)
				local var_389_19 = arg_386_1:FormatText(var_389_18.content)

				arg_386_1.text_.text = var_389_19

				LuaForUtil.ClearLinePrefixSymbol(arg_386_1.text_)

				local var_389_20 = 18
				local var_389_21 = utf8.len(var_389_19)
				local var_389_22 = var_389_20 <= 0 and var_389_16 or var_389_16 * (var_389_21 / var_389_20)

				if var_389_22 > 0 and var_389_16 < var_389_22 then
					arg_386_1.talkMaxDuration = var_389_22

					if var_389_22 + var_389_15 > arg_386_1.duration_ then
						arg_386_1.duration_ = var_389_22 + var_389_15
					end
				end

				arg_386_1.text_.text = var_389_19
				arg_386_1.typewritter.percent = 0

				arg_386_1.typewritter:SetDirty()
				arg_386_1:ShowNextGo(false)
				arg_386_1:RecordContent(arg_386_1.text_.text)
			end

			local var_389_23 = math.max(var_389_16, arg_386_1.talkMaxDuration)

			if var_389_15 <= arg_386_1.time_ and arg_386_1.time_ < var_389_15 + var_389_23 then
				arg_386_1.typewritter.percent = (arg_386_1.time_ - var_389_15) / var_389_23

				arg_386_1.typewritter:SetDirty()
			end

			if arg_386_1.time_ >= var_389_15 + var_389_23 and arg_386_1.time_ < var_389_15 + var_389_23 + arg_389_0 then
				arg_386_1.typewritter.percent = 1

				arg_386_1.typewritter:SetDirty()
				arg_386_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105094 = function(arg_390_0, arg_390_1)
		arg_390_1.time_ = 0
		arg_390_1.frameCnt_ = 0
		arg_390_1.state_ = "playing"
		arg_390_1.curTalkId_ = 1108105094
		arg_390_1.duration_ = 5

		SetActive(arg_390_1.tipsGo_, false)

		function arg_390_1.onSingleLineFinish_()
			arg_390_1.onSingleLineUpdate_ = nil
			arg_390_1.onSingleLineFinish_ = nil
			arg_390_1.state_ = "waiting"
		end

		function arg_390_1.playNext_(arg_392_0)
			if arg_392_0 == 1 then
				arg_390_0:Play1108105095(arg_390_1)
			end
		end

		function arg_390_1.onSingleLineUpdate_(arg_393_0)
			local var_393_0 = arg_390_1.actors_["1081ui_story"]
			local var_393_1 = 0

			if var_393_1 < arg_390_1.time_ and arg_390_1.time_ <= var_393_1 + arg_393_0 and arg_390_1.var_.characterEffect1081ui_story == nil then
				arg_390_1.var_.characterEffect1081ui_story = var_393_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_393_2 = 0.200000002980232

			if var_393_1 <= arg_390_1.time_ and arg_390_1.time_ < var_393_1 + var_393_2 then
				local var_393_3 = (arg_390_1.time_ - var_393_1) / var_393_2

				if arg_390_1.var_.characterEffect1081ui_story then
					local var_393_4 = Mathf.Lerp(0, 0.5, var_393_3)

					arg_390_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_390_1.var_.characterEffect1081ui_story.fillRatio = var_393_4
				end
			end

			if arg_390_1.time_ >= var_393_1 + var_393_2 and arg_390_1.time_ < var_393_1 + var_393_2 + arg_393_0 and arg_390_1.var_.characterEffect1081ui_story then
				local var_393_5 = 0.5

				arg_390_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_390_1.var_.characterEffect1081ui_story.fillRatio = var_393_5
			end

			local var_393_6 = 0
			local var_393_7 = 0.475

			if var_393_6 < arg_390_1.time_ and arg_390_1.time_ <= var_393_6 + arg_393_0 then
				arg_390_1.talkMaxDuration = 0
				arg_390_1.dialogCg_.alpha = 1

				arg_390_1.dialog_:SetActive(true)
				SetActive(arg_390_1.leftNameGo_, true)

				local var_393_8 = arg_390_1:FormatText(StoryNameCfg[7].name)

				arg_390_1.leftNameTxt_.text = var_393_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_390_1.leftNameTxt_.transform)

				arg_390_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_390_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_390_1:RecordName(arg_390_1.leftNameTxt_.text)
				SetActive(arg_390_1.iconTrs_.gameObject, false)
				arg_390_1.callingController_:SetSelectedState("normal")

				local var_393_9 = arg_390_1:GetWordFromCfg(1108105094)
				local var_393_10 = arg_390_1:FormatText(var_393_9.content)

				arg_390_1.text_.text = var_393_10

				LuaForUtil.ClearLinePrefixSymbol(arg_390_1.text_)

				local var_393_11 = 19
				local var_393_12 = utf8.len(var_393_10)
				local var_393_13 = var_393_11 <= 0 and var_393_7 or var_393_7 * (var_393_12 / var_393_11)

				if var_393_13 > 0 and var_393_7 < var_393_13 then
					arg_390_1.talkMaxDuration = var_393_13

					if var_393_13 + var_393_6 > arg_390_1.duration_ then
						arg_390_1.duration_ = var_393_13 + var_393_6
					end
				end

				arg_390_1.text_.text = var_393_10
				arg_390_1.typewritter.percent = 0

				arg_390_1.typewritter:SetDirty()
				arg_390_1:ShowNextGo(false)
				arg_390_1:RecordContent(arg_390_1.text_.text)
			end

			local var_393_14 = math.max(var_393_7, arg_390_1.talkMaxDuration)

			if var_393_6 <= arg_390_1.time_ and arg_390_1.time_ < var_393_6 + var_393_14 then
				arg_390_1.typewritter.percent = (arg_390_1.time_ - var_393_6) / var_393_14

				arg_390_1.typewritter:SetDirty()
			end

			if arg_390_1.time_ >= var_393_6 + var_393_14 and arg_390_1.time_ < var_393_6 + var_393_14 + arg_393_0 then
				arg_390_1.typewritter.percent = 1

				arg_390_1.typewritter:SetDirty()
				arg_390_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105095 = function(arg_394_0, arg_394_1)
		arg_394_1.time_ = 0
		arg_394_1.frameCnt_ = 0
		arg_394_1.state_ = "playing"
		arg_394_1.curTalkId_ = 1108105095
		arg_394_1.duration_ = 5

		SetActive(arg_394_1.tipsGo_, false)

		function arg_394_1.onSingleLineFinish_()
			arg_394_1.onSingleLineUpdate_ = nil
			arg_394_1.onSingleLineFinish_ = nil
			arg_394_1.state_ = "waiting"
		end

		function arg_394_1.playNext_(arg_396_0)
			if arg_396_0 == 1 then
				arg_394_0:Play1108105096(arg_394_1)
			end
		end

		function arg_394_1.onSingleLineUpdate_(arg_397_0)
			local var_397_0 = arg_394_1.actors_["1080ui_story"].transform
			local var_397_1 = 0

			if var_397_1 < arg_394_1.time_ and arg_394_1.time_ <= var_397_1 + arg_397_0 then
				arg_394_1.var_.moveOldPos1080ui_story = var_397_0.localPosition

				local var_397_2 = "1080ui_story"

				arg_394_1:ShowWeapon(arg_394_1.var_[var_397_2 .. "Animator"].transform, false)
			end

			local var_397_3 = 0.001

			if var_397_1 <= arg_394_1.time_ and arg_394_1.time_ < var_397_1 + var_397_3 then
				local var_397_4 = (arg_394_1.time_ - var_397_1) / var_397_3
				local var_397_5 = Vector3.New(0, -1.01, -6.05)

				var_397_0.localPosition = Vector3.Lerp(arg_394_1.var_.moveOldPos1080ui_story, var_397_5, var_397_4)

				local var_397_6 = manager.ui.mainCamera.transform.position - var_397_0.position

				var_397_0.forward = Vector3.New(var_397_6.x, var_397_6.y, var_397_6.z)

				local var_397_7 = var_397_0.localEulerAngles

				var_397_7.z = 0
				var_397_7.x = 0
				var_397_0.localEulerAngles = var_397_7
			end

			if arg_394_1.time_ >= var_397_1 + var_397_3 and arg_394_1.time_ < var_397_1 + var_397_3 + arg_397_0 then
				var_397_0.localPosition = Vector3.New(0, -1.01, -6.05)

				local var_397_8 = manager.ui.mainCamera.transform.position - var_397_0.position

				var_397_0.forward = Vector3.New(var_397_8.x, var_397_8.y, var_397_8.z)

				local var_397_9 = var_397_0.localEulerAngles

				var_397_9.z = 0
				var_397_9.x = 0
				var_397_0.localEulerAngles = var_397_9
			end

			local var_397_10 = arg_394_1.actors_["1081ui_story"].transform
			local var_397_11 = 0

			if var_397_11 < arg_394_1.time_ and arg_394_1.time_ <= var_397_11 + arg_397_0 then
				arg_394_1.var_.moveOldPos1081ui_story = var_397_10.localPosition
			end

			local var_397_12 = 0.001

			if var_397_11 <= arg_394_1.time_ and arg_394_1.time_ < var_397_11 + var_397_12 then
				local var_397_13 = (arg_394_1.time_ - var_397_11) / var_397_12
				local var_397_14 = Vector3.New(0, 100, 0)

				var_397_10.localPosition = Vector3.Lerp(arg_394_1.var_.moveOldPos1081ui_story, var_397_14, var_397_13)

				local var_397_15 = manager.ui.mainCamera.transform.position - var_397_10.position

				var_397_10.forward = Vector3.New(var_397_15.x, var_397_15.y, var_397_15.z)

				local var_397_16 = var_397_10.localEulerAngles

				var_397_16.z = 0
				var_397_16.x = 0
				var_397_10.localEulerAngles = var_397_16
			end

			if arg_394_1.time_ >= var_397_11 + var_397_12 and arg_394_1.time_ < var_397_11 + var_397_12 + arg_397_0 then
				var_397_10.localPosition = Vector3.New(0, 100, 0)

				local var_397_17 = manager.ui.mainCamera.transform.position - var_397_10.position

				var_397_10.forward = Vector3.New(var_397_17.x, var_397_17.y, var_397_17.z)

				local var_397_18 = var_397_10.localEulerAngles

				var_397_18.z = 0
				var_397_18.x = 0
				var_397_10.localEulerAngles = var_397_18
			end

			local var_397_19 = arg_394_1.actors_["1080ui_story"]
			local var_397_20 = 0

			if var_397_20 < arg_394_1.time_ and arg_394_1.time_ <= var_397_20 + arg_397_0 and arg_394_1.var_.characterEffect1080ui_story == nil then
				arg_394_1.var_.characterEffect1080ui_story = var_397_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_397_21 = 0.200000002980232

			if var_397_20 <= arg_394_1.time_ and arg_394_1.time_ < var_397_20 + var_397_21 then
				local var_397_22 = (arg_394_1.time_ - var_397_20) / var_397_21

				if arg_394_1.var_.characterEffect1080ui_story then
					arg_394_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_394_1.time_ >= var_397_20 + var_397_21 and arg_394_1.time_ < var_397_20 + var_397_21 + arg_397_0 and arg_394_1.var_.characterEffect1080ui_story then
				arg_394_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_397_23 = 0

			if var_397_23 < arg_394_1.time_ and arg_394_1.time_ <= var_397_23 + arg_397_0 then
				arg_394_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_397_24 = 0

			if var_397_24 < arg_394_1.time_ and arg_394_1.time_ <= var_397_24 + arg_397_0 then
				arg_394_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_397_25 = 0
			local var_397_26 = 0.25

			if var_397_25 < arg_394_1.time_ and arg_394_1.time_ <= var_397_25 + arg_397_0 then
				arg_394_1.talkMaxDuration = 0
				arg_394_1.dialogCg_.alpha = 1

				arg_394_1.dialog_:SetActive(true)
				SetActive(arg_394_1.leftNameGo_, true)

				local var_397_27 = arg_394_1:FormatText(StoryNameCfg[55].name)

				arg_394_1.leftNameTxt_.text = var_397_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_394_1.leftNameTxt_.transform)

				arg_394_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_394_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_394_1:RecordName(arg_394_1.leftNameTxt_.text)
				SetActive(arg_394_1.iconTrs_.gameObject, false)
				arg_394_1.callingController_:SetSelectedState("normal")

				local var_397_28 = arg_394_1:GetWordFromCfg(1108105095)
				local var_397_29 = arg_394_1:FormatText(var_397_28.content)

				arg_394_1.text_.text = var_397_29

				LuaForUtil.ClearLinePrefixSymbol(arg_394_1.text_)

				local var_397_30 = 10
				local var_397_31 = utf8.len(var_397_29)
				local var_397_32 = var_397_30 <= 0 and var_397_26 or var_397_26 * (var_397_31 / var_397_30)

				if var_397_32 > 0 and var_397_26 < var_397_32 then
					arg_394_1.talkMaxDuration = var_397_32

					if var_397_32 + var_397_25 > arg_394_1.duration_ then
						arg_394_1.duration_ = var_397_32 + var_397_25
					end
				end

				arg_394_1.text_.text = var_397_29
				arg_394_1.typewritter.percent = 0

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(false)
				arg_394_1:RecordContent(arg_394_1.text_.text)
			end

			local var_397_33 = math.max(var_397_26, arg_394_1.talkMaxDuration)

			if var_397_25 <= arg_394_1.time_ and arg_394_1.time_ < var_397_25 + var_397_33 then
				arg_394_1.typewritter.percent = (arg_394_1.time_ - var_397_25) / var_397_33

				arg_394_1.typewritter:SetDirty()
			end

			if arg_394_1.time_ >= var_397_25 + var_397_33 and arg_394_1.time_ < var_397_25 + var_397_33 + arg_397_0 then
				arg_394_1.typewritter.percent = 1

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105096 = function(arg_398_0, arg_398_1)
		arg_398_1.time_ = 0
		arg_398_1.frameCnt_ = 0
		arg_398_1.state_ = "playing"
		arg_398_1.curTalkId_ = 1108105096
		arg_398_1.duration_ = 5

		SetActive(arg_398_1.tipsGo_, false)

		function arg_398_1.onSingleLineFinish_()
			arg_398_1.onSingleLineUpdate_ = nil
			arg_398_1.onSingleLineFinish_ = nil
			arg_398_1.state_ = "waiting"
		end

		function arg_398_1.playNext_(arg_400_0)
			if arg_400_0 == 1 then
				arg_398_0:Play1108105097(arg_398_1)
			end
		end

		function arg_398_1.onSingleLineUpdate_(arg_401_0)
			local var_401_0 = arg_398_1.actors_["1081ui_story"].transform
			local var_401_1 = 0

			if var_401_1 < arg_398_1.time_ and arg_398_1.time_ <= var_401_1 + arg_401_0 then
				arg_398_1.var_.moveOldPos1081ui_story = var_401_0.localPosition
			end

			local var_401_2 = 0.001

			if var_401_1 <= arg_398_1.time_ and arg_398_1.time_ < var_401_1 + var_401_2 then
				local var_401_3 = (arg_398_1.time_ - var_401_1) / var_401_2
				local var_401_4 = Vector3.New(0, -0.92, -5.8)

				var_401_0.localPosition = Vector3.Lerp(arg_398_1.var_.moveOldPos1081ui_story, var_401_4, var_401_3)

				local var_401_5 = manager.ui.mainCamera.transform.position - var_401_0.position

				var_401_0.forward = Vector3.New(var_401_5.x, var_401_5.y, var_401_5.z)

				local var_401_6 = var_401_0.localEulerAngles

				var_401_6.z = 0
				var_401_6.x = 0
				var_401_0.localEulerAngles = var_401_6
			end

			if arg_398_1.time_ >= var_401_1 + var_401_2 and arg_398_1.time_ < var_401_1 + var_401_2 + arg_401_0 then
				var_401_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_401_7 = manager.ui.mainCamera.transform.position - var_401_0.position

				var_401_0.forward = Vector3.New(var_401_7.x, var_401_7.y, var_401_7.z)

				local var_401_8 = var_401_0.localEulerAngles

				var_401_8.z = 0
				var_401_8.x = 0
				var_401_0.localEulerAngles = var_401_8
			end

			local var_401_9 = arg_398_1.actors_["1081ui_story"]
			local var_401_10 = 0

			if var_401_10 < arg_398_1.time_ and arg_398_1.time_ <= var_401_10 + arg_401_0 and arg_398_1.var_.characterEffect1081ui_story == nil then
				arg_398_1.var_.characterEffect1081ui_story = var_401_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_401_11 = 0.200000002980232

			if var_401_10 <= arg_398_1.time_ and arg_398_1.time_ < var_401_10 + var_401_11 then
				local var_401_12 = (arg_398_1.time_ - var_401_10) / var_401_11

				if arg_398_1.var_.characterEffect1081ui_story then
					arg_398_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_398_1.time_ >= var_401_10 + var_401_11 and arg_398_1.time_ < var_401_10 + var_401_11 + arg_401_0 and arg_398_1.var_.characterEffect1081ui_story then
				arg_398_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_401_13 = 0

			if var_401_13 < arg_398_1.time_ and arg_398_1.time_ <= var_401_13 + arg_401_0 then
				arg_398_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_1")
			end

			local var_401_14 = 0

			if var_401_14 < arg_398_1.time_ and arg_398_1.time_ <= var_401_14 + arg_401_0 then
				arg_398_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_401_15 = arg_398_1.actors_["1080ui_story"].transform
			local var_401_16 = 0

			if var_401_16 < arg_398_1.time_ and arg_398_1.time_ <= var_401_16 + arg_401_0 then
				arg_398_1.var_.moveOldPos1080ui_story = var_401_15.localPosition
			end

			local var_401_17 = 0.001

			if var_401_16 <= arg_398_1.time_ and arg_398_1.time_ < var_401_16 + var_401_17 then
				local var_401_18 = (arg_398_1.time_ - var_401_16) / var_401_17
				local var_401_19 = Vector3.New(0, 100, 0)

				var_401_15.localPosition = Vector3.Lerp(arg_398_1.var_.moveOldPos1080ui_story, var_401_19, var_401_18)

				local var_401_20 = manager.ui.mainCamera.transform.position - var_401_15.position

				var_401_15.forward = Vector3.New(var_401_20.x, var_401_20.y, var_401_20.z)

				local var_401_21 = var_401_15.localEulerAngles

				var_401_21.z = 0
				var_401_21.x = 0
				var_401_15.localEulerAngles = var_401_21
			end

			if arg_398_1.time_ >= var_401_16 + var_401_17 and arg_398_1.time_ < var_401_16 + var_401_17 + arg_401_0 then
				var_401_15.localPosition = Vector3.New(0, 100, 0)

				local var_401_22 = manager.ui.mainCamera.transform.position - var_401_15.position

				var_401_15.forward = Vector3.New(var_401_22.x, var_401_22.y, var_401_22.z)

				local var_401_23 = var_401_15.localEulerAngles

				var_401_23.z = 0
				var_401_23.x = 0
				var_401_15.localEulerAngles = var_401_23
			end

			local var_401_24 = 0
			local var_401_25 = 0.475

			if var_401_24 < arg_398_1.time_ and arg_398_1.time_ <= var_401_24 + arg_401_0 then
				arg_398_1.talkMaxDuration = 0
				arg_398_1.dialogCg_.alpha = 1

				arg_398_1.dialog_:SetActive(true)
				SetActive(arg_398_1.leftNameGo_, true)

				local var_401_26 = arg_398_1:FormatText(StoryNameCfg[202].name)

				arg_398_1.leftNameTxt_.text = var_401_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_398_1.leftNameTxt_.transform)

				arg_398_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_398_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_398_1:RecordName(arg_398_1.leftNameTxt_.text)
				SetActive(arg_398_1.iconTrs_.gameObject, false)
				arg_398_1.callingController_:SetSelectedState("normal")

				local var_401_27 = arg_398_1:GetWordFromCfg(1108105096)
				local var_401_28 = arg_398_1:FormatText(var_401_27.content)

				arg_398_1.text_.text = var_401_28

				LuaForUtil.ClearLinePrefixSymbol(arg_398_1.text_)

				local var_401_29 = 19
				local var_401_30 = utf8.len(var_401_28)
				local var_401_31 = var_401_29 <= 0 and var_401_25 or var_401_25 * (var_401_30 / var_401_29)

				if var_401_31 > 0 and var_401_25 < var_401_31 then
					arg_398_1.talkMaxDuration = var_401_31

					if var_401_31 + var_401_24 > arg_398_1.duration_ then
						arg_398_1.duration_ = var_401_31 + var_401_24
					end
				end

				arg_398_1.text_.text = var_401_28
				arg_398_1.typewritter.percent = 0

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(false)
				arg_398_1:RecordContent(arg_398_1.text_.text)
			end

			local var_401_32 = math.max(var_401_25, arg_398_1.talkMaxDuration)

			if var_401_24 <= arg_398_1.time_ and arg_398_1.time_ < var_401_24 + var_401_32 then
				arg_398_1.typewritter.percent = (arg_398_1.time_ - var_401_24) / var_401_32

				arg_398_1.typewritter:SetDirty()
			end

			if arg_398_1.time_ >= var_401_24 + var_401_32 and arg_398_1.time_ < var_401_24 + var_401_32 + arg_401_0 then
				arg_398_1.typewritter.percent = 1

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105097 = function(arg_402_0, arg_402_1)
		arg_402_1.time_ = 0
		arg_402_1.frameCnt_ = 0
		arg_402_1.state_ = "playing"
		arg_402_1.curTalkId_ = 1108105097
		arg_402_1.duration_ = 8.7

		SetActive(arg_402_1.tipsGo_, false)

		function arg_402_1.onSingleLineFinish_()
			arg_402_1.onSingleLineUpdate_ = nil
			arg_402_1.onSingleLineFinish_ = nil
			arg_402_1.state_ = "waiting"
		end

		function arg_402_1.playNext_(arg_404_0)
			if arg_404_0 == 1 then
				arg_402_0:Play1108105098(arg_402_1)
			end
		end

		function arg_402_1.onSingleLineUpdate_(arg_405_0)
			local var_405_0 = "ST0402a"

			if arg_402_1.bgs_[var_405_0] == nil then
				local var_405_1 = Object.Instantiate(arg_402_1.paintGo_)

				var_405_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_405_0)
				var_405_1.name = var_405_0
				var_405_1.transform.parent = arg_402_1.stage_.transform
				var_405_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_402_1.bgs_[var_405_0] = var_405_1
			end

			local var_405_2 = 2.06733333518108

			if var_405_2 < arg_402_1.time_ and arg_402_1.time_ <= var_405_2 + arg_405_0 then
				local var_405_3 = manager.ui.mainCamera.transform.localPosition
				local var_405_4 = Vector3.New(0, 0, 10) + Vector3.New(var_405_3.x, var_405_3.y, 0)
				local var_405_5 = arg_402_1.bgs_.ST0402a

				var_405_5.transform.localPosition = var_405_4
				var_405_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_405_6 = var_405_5:GetComponent("SpriteRenderer")

				if var_405_6 and var_405_6.sprite then
					local var_405_7 = (var_405_5.transform.localPosition - var_405_3).z
					local var_405_8 = manager.ui.mainCameraCom_
					local var_405_9 = 2 * var_405_7 * Mathf.Tan(var_405_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_405_10 = var_405_9 * var_405_8.aspect
					local var_405_11 = var_405_6.sprite.bounds.size.x
					local var_405_12 = var_405_6.sprite.bounds.size.y
					local var_405_13 = var_405_10 / var_405_11
					local var_405_14 = var_405_9 / var_405_12
					local var_405_15 = var_405_14 < var_405_13 and var_405_13 or var_405_14

					var_405_5.transform.localScale = Vector3.New(var_405_15, var_405_15, 0)
				end

				for iter_405_0, iter_405_1 in pairs(arg_402_1.bgs_) do
					if iter_405_0 ~= "ST0402a" then
						iter_405_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_405_16 = 0

			if var_405_16 < arg_402_1.time_ and arg_402_1.time_ <= var_405_16 + arg_405_0 then
				arg_402_1.mask_.enabled = true
				arg_402_1.mask_.raycastTarget = true

				arg_402_1:SetGaussion(false)
			end

			local var_405_17 = 2.06733333518108

			if var_405_16 <= arg_402_1.time_ and arg_402_1.time_ < var_405_16 + var_405_17 then
				local var_405_18 = (arg_402_1.time_ - var_405_16) / var_405_17
				local var_405_19 = Color.New(0, 0, 0)

				var_405_19.a = Mathf.Lerp(0, 1, var_405_18)
				arg_402_1.mask_.color = var_405_19
			end

			if arg_402_1.time_ >= var_405_16 + var_405_17 and arg_402_1.time_ < var_405_16 + var_405_17 + arg_405_0 then
				local var_405_20 = Color.New(0, 0, 0)

				var_405_20.a = 1
				arg_402_1.mask_.color = var_405_20
			end

			local var_405_21 = 2.06733333518108

			if var_405_21 < arg_402_1.time_ and arg_402_1.time_ <= var_405_21 + arg_405_0 then
				arg_402_1.mask_.enabled = true
				arg_402_1.mask_.raycastTarget = true

				arg_402_1:SetGaussion(false)
			end

			local var_405_22 = 2.03266666481892

			if var_405_21 <= arg_402_1.time_ and arg_402_1.time_ < var_405_21 + var_405_22 then
				local var_405_23 = (arg_402_1.time_ - var_405_21) / var_405_22
				local var_405_24 = Color.New(0, 0, 0)

				var_405_24.a = Mathf.Lerp(1, 0, var_405_23)
				arg_402_1.mask_.color = var_405_24
			end

			if arg_402_1.time_ >= var_405_21 + var_405_22 and arg_402_1.time_ < var_405_21 + var_405_22 + arg_405_0 then
				local var_405_25 = Color.New(0, 0, 0)
				local var_405_26 = 0

				arg_402_1.mask_.enabled = false
				var_405_25.a = var_405_26
				arg_402_1.mask_.color = var_405_25
			end

			local var_405_27 = arg_402_1.actors_["1080ui_story"].transform
			local var_405_28 = 2.03333333333333

			if var_405_28 < arg_402_1.time_ and arg_402_1.time_ <= var_405_28 + arg_405_0 then
				arg_402_1.var_.moveOldPos1080ui_story = var_405_27.localPosition
			end

			local var_405_29 = 0.001

			if var_405_28 <= arg_402_1.time_ and arg_402_1.time_ < var_405_28 + var_405_29 then
				local var_405_30 = (arg_402_1.time_ - var_405_28) / var_405_29
				local var_405_31 = Vector3.New(0, 100, 0)

				var_405_27.localPosition = Vector3.Lerp(arg_402_1.var_.moveOldPos1080ui_story, var_405_31, var_405_30)

				local var_405_32 = manager.ui.mainCamera.transform.position - var_405_27.position

				var_405_27.forward = Vector3.New(var_405_32.x, var_405_32.y, var_405_32.z)

				local var_405_33 = var_405_27.localEulerAngles

				var_405_33.z = 0
				var_405_33.x = 0
				var_405_27.localEulerAngles = var_405_33
			end

			if arg_402_1.time_ >= var_405_28 + var_405_29 and arg_402_1.time_ < var_405_28 + var_405_29 + arg_405_0 then
				var_405_27.localPosition = Vector3.New(0, 100, 0)

				local var_405_34 = manager.ui.mainCamera.transform.position - var_405_27.position

				var_405_27.forward = Vector3.New(var_405_34.x, var_405_34.y, var_405_34.z)

				local var_405_35 = var_405_27.localEulerAngles

				var_405_35.z = 0
				var_405_35.x = 0
				var_405_27.localEulerAngles = var_405_35
			end

			local var_405_36 = arg_402_1.actors_["1081ui_story"].transform
			local var_405_37 = 2.03333333333333

			if var_405_37 < arg_402_1.time_ and arg_402_1.time_ <= var_405_37 + arg_405_0 then
				arg_402_1.var_.moveOldPos1081ui_story = var_405_36.localPosition
			end

			local var_405_38 = 0.001

			if var_405_37 <= arg_402_1.time_ and arg_402_1.time_ < var_405_37 + var_405_38 then
				local var_405_39 = (arg_402_1.time_ - var_405_37) / var_405_38
				local var_405_40 = Vector3.New(0, 100, 0)

				var_405_36.localPosition = Vector3.Lerp(arg_402_1.var_.moveOldPos1081ui_story, var_405_40, var_405_39)

				local var_405_41 = manager.ui.mainCamera.transform.position - var_405_36.position

				var_405_36.forward = Vector3.New(var_405_41.x, var_405_41.y, var_405_41.z)

				local var_405_42 = var_405_36.localEulerAngles

				var_405_42.z = 0
				var_405_42.x = 0
				var_405_36.localEulerAngles = var_405_42
			end

			if arg_402_1.time_ >= var_405_37 + var_405_38 and arg_402_1.time_ < var_405_37 + var_405_38 + arg_405_0 then
				var_405_36.localPosition = Vector3.New(0, 100, 0)

				local var_405_43 = manager.ui.mainCamera.transform.position - var_405_36.position

				var_405_36.forward = Vector3.New(var_405_43.x, var_405_43.y, var_405_43.z)

				local var_405_44 = var_405_36.localEulerAngles

				var_405_44.z = 0
				var_405_44.x = 0
				var_405_36.localEulerAngles = var_405_44
			end

			if arg_402_1.frameCnt_ <= 1 then
				arg_402_1.dialog_:SetActive(false)
			end

			local var_405_45 = 3.7
			local var_405_46 = 1.475

			if var_405_45 < arg_402_1.time_ and arg_402_1.time_ <= var_405_45 + arg_405_0 then
				arg_402_1.talkMaxDuration = 0

				arg_402_1.dialog_:SetActive(true)

				local var_405_47 = LeanTween.value(arg_402_1.dialog_, 0, 1, 0.3)

				var_405_47:setOnUpdate(LuaHelper.FloatAction(function(arg_406_0)
					arg_402_1.dialogCg_.alpha = arg_406_0
				end))
				var_405_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_402_1.dialog_)
					var_405_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_402_1.duration_ = arg_402_1.duration_ + 0.3

				SetActive(arg_402_1.leftNameGo_, false)

				arg_402_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_402_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_402_1:RecordName(arg_402_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_402_1.iconTrs_.gameObject, false)
				arg_402_1.callingController_:SetSelectedState("normal")

				local var_405_48 = arg_402_1:GetWordFromCfg(1108105097)
				local var_405_49 = arg_402_1:FormatText(var_405_48.content)

				arg_402_1.text_.text = var_405_49

				LuaForUtil.ClearLinePrefixSymbol(arg_402_1.text_)

				local var_405_50 = 59
				local var_405_51 = utf8.len(var_405_49)
				local var_405_52 = var_405_50 <= 0 and var_405_46 or var_405_46 * (var_405_51 / var_405_50)

				if var_405_52 > 0 and var_405_46 < var_405_52 then
					arg_402_1.talkMaxDuration = var_405_52
					var_405_45 = var_405_45 + 0.3

					if var_405_52 + var_405_45 > arg_402_1.duration_ then
						arg_402_1.duration_ = var_405_52 + var_405_45
					end
				end

				arg_402_1.text_.text = var_405_49
				arg_402_1.typewritter.percent = 0

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(false)
				arg_402_1:RecordContent(arg_402_1.text_.text)
			end

			local var_405_53 = var_405_45 + 0.3
			local var_405_54 = math.max(var_405_46, arg_402_1.talkMaxDuration)

			if var_405_53 <= arg_402_1.time_ and arg_402_1.time_ < var_405_53 + var_405_54 then
				arg_402_1.typewritter.percent = (arg_402_1.time_ - var_405_53) / var_405_54

				arg_402_1.typewritter:SetDirty()
			end

			if arg_402_1.time_ >= var_405_53 + var_405_54 and arg_402_1.time_ < var_405_53 + var_405_54 + arg_405_0 then
				arg_402_1.typewritter.percent = 1

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105098 = function(arg_408_0, arg_408_1)
		arg_408_1.time_ = 0
		arg_408_1.frameCnt_ = 0
		arg_408_1.state_ = "playing"
		arg_408_1.curTalkId_ = 1108105098
		arg_408_1.duration_ = 5

		SetActive(arg_408_1.tipsGo_, false)

		function arg_408_1.onSingleLineFinish_()
			arg_408_1.onSingleLineUpdate_ = nil
			arg_408_1.onSingleLineFinish_ = nil
			arg_408_1.state_ = "waiting"
		end

		function arg_408_1.playNext_(arg_410_0)
			if arg_410_0 == 1 then
				arg_408_0:Play1108105099(arg_408_1)
			end
		end

		function arg_408_1.onSingleLineUpdate_(arg_411_0)
			local var_411_0 = arg_408_1.actors_["1081ui_story"].transform
			local var_411_1 = 0

			if var_411_1 < arg_408_1.time_ and arg_408_1.time_ <= var_411_1 + arg_411_0 then
				arg_408_1.var_.moveOldPos1081ui_story = var_411_0.localPosition
			end

			local var_411_2 = 0.001

			if var_411_1 <= arg_408_1.time_ and arg_408_1.time_ < var_411_1 + var_411_2 then
				local var_411_3 = (arg_408_1.time_ - var_411_1) / var_411_2
				local var_411_4 = Vector3.New(0, -0.92, -5.8)

				var_411_0.localPosition = Vector3.Lerp(arg_408_1.var_.moveOldPos1081ui_story, var_411_4, var_411_3)

				local var_411_5 = manager.ui.mainCamera.transform.position - var_411_0.position

				var_411_0.forward = Vector3.New(var_411_5.x, var_411_5.y, var_411_5.z)

				local var_411_6 = var_411_0.localEulerAngles

				var_411_6.z = 0
				var_411_6.x = 0
				var_411_0.localEulerAngles = var_411_6
			end

			if arg_408_1.time_ >= var_411_1 + var_411_2 and arg_408_1.time_ < var_411_1 + var_411_2 + arg_411_0 then
				var_411_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_411_7 = manager.ui.mainCamera.transform.position - var_411_0.position

				var_411_0.forward = Vector3.New(var_411_7.x, var_411_7.y, var_411_7.z)

				local var_411_8 = var_411_0.localEulerAngles

				var_411_8.z = 0
				var_411_8.x = 0
				var_411_0.localEulerAngles = var_411_8
			end

			local var_411_9 = arg_408_1.actors_["1081ui_story"]
			local var_411_10 = 0

			if var_411_10 < arg_408_1.time_ and arg_408_1.time_ <= var_411_10 + arg_411_0 and arg_408_1.var_.characterEffect1081ui_story == nil then
				arg_408_1.var_.characterEffect1081ui_story = var_411_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_411_11 = 0.200000002980232

			if var_411_10 <= arg_408_1.time_ and arg_408_1.time_ < var_411_10 + var_411_11 then
				local var_411_12 = (arg_408_1.time_ - var_411_10) / var_411_11

				if arg_408_1.var_.characterEffect1081ui_story then
					arg_408_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_408_1.time_ >= var_411_10 + var_411_11 and arg_408_1.time_ < var_411_10 + var_411_11 + arg_411_0 and arg_408_1.var_.characterEffect1081ui_story then
				arg_408_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_411_13 = 0

			if var_411_13 < arg_408_1.time_ and arg_408_1.time_ <= var_411_13 + arg_411_0 then
				arg_408_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_411_14 = 0

			if var_411_14 < arg_408_1.time_ and arg_408_1.time_ <= var_411_14 + arg_411_0 then
				arg_408_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_411_15 = 0
			local var_411_16 = 0.525

			if var_411_15 < arg_408_1.time_ and arg_408_1.time_ <= var_411_15 + arg_411_0 then
				arg_408_1.talkMaxDuration = 0
				arg_408_1.dialogCg_.alpha = 1

				arg_408_1.dialog_:SetActive(true)
				SetActive(arg_408_1.leftNameGo_, true)

				local var_411_17 = arg_408_1:FormatText(StoryNameCfg[202].name)

				arg_408_1.leftNameTxt_.text = var_411_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_408_1.leftNameTxt_.transform)

				arg_408_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_408_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_408_1:RecordName(arg_408_1.leftNameTxt_.text)
				SetActive(arg_408_1.iconTrs_.gameObject, false)
				arg_408_1.callingController_:SetSelectedState("normal")

				local var_411_18 = arg_408_1:GetWordFromCfg(1108105098)
				local var_411_19 = arg_408_1:FormatText(var_411_18.content)

				arg_408_1.text_.text = var_411_19

				LuaForUtil.ClearLinePrefixSymbol(arg_408_1.text_)

				local var_411_20 = 21
				local var_411_21 = utf8.len(var_411_19)
				local var_411_22 = var_411_20 <= 0 and var_411_16 or var_411_16 * (var_411_21 / var_411_20)

				if var_411_22 > 0 and var_411_16 < var_411_22 then
					arg_408_1.talkMaxDuration = var_411_22

					if var_411_22 + var_411_15 > arg_408_1.duration_ then
						arg_408_1.duration_ = var_411_22 + var_411_15
					end
				end

				arg_408_1.text_.text = var_411_19
				arg_408_1.typewritter.percent = 0

				arg_408_1.typewritter:SetDirty()
				arg_408_1:ShowNextGo(false)
				arg_408_1:RecordContent(arg_408_1.text_.text)
			end

			local var_411_23 = math.max(var_411_16, arg_408_1.talkMaxDuration)

			if var_411_15 <= arg_408_1.time_ and arg_408_1.time_ < var_411_15 + var_411_23 then
				arg_408_1.typewritter.percent = (arg_408_1.time_ - var_411_15) / var_411_23

				arg_408_1.typewritter:SetDirty()
			end

			if arg_408_1.time_ >= var_411_15 + var_411_23 and arg_408_1.time_ < var_411_15 + var_411_23 + arg_411_0 then
				arg_408_1.typewritter.percent = 1

				arg_408_1.typewritter:SetDirty()
				arg_408_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105099 = function(arg_412_0, arg_412_1)
		arg_412_1.time_ = 0
		arg_412_1.frameCnt_ = 0
		arg_412_1.state_ = "playing"
		arg_412_1.curTalkId_ = 1108105099
		arg_412_1.duration_ = 5

		SetActive(arg_412_1.tipsGo_, false)

		function arg_412_1.onSingleLineFinish_()
			arg_412_1.onSingleLineUpdate_ = nil
			arg_412_1.onSingleLineFinish_ = nil
			arg_412_1.state_ = "waiting"
		end

		function arg_412_1.playNext_(arg_414_0)
			if arg_414_0 == 1 then
				arg_412_0:Play1108105100(arg_412_1)
			end
		end

		function arg_412_1.onSingleLineUpdate_(arg_415_0)
			local var_415_0 = arg_412_1.actors_["1081ui_story"]
			local var_415_1 = 0

			if var_415_1 < arg_412_1.time_ and arg_412_1.time_ <= var_415_1 + arg_415_0 and arg_412_1.var_.characterEffect1081ui_story == nil then
				arg_412_1.var_.characterEffect1081ui_story = var_415_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_415_2 = 0.200000002980232

			if var_415_1 <= arg_412_1.time_ and arg_412_1.time_ < var_415_1 + var_415_2 then
				local var_415_3 = (arg_412_1.time_ - var_415_1) / var_415_2

				if arg_412_1.var_.characterEffect1081ui_story then
					local var_415_4 = Mathf.Lerp(0, 0.5, var_415_3)

					arg_412_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_412_1.var_.characterEffect1081ui_story.fillRatio = var_415_4
				end
			end

			if arg_412_1.time_ >= var_415_1 + var_415_2 and arg_412_1.time_ < var_415_1 + var_415_2 + arg_415_0 and arg_412_1.var_.characterEffect1081ui_story then
				local var_415_5 = 0.5

				arg_412_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_412_1.var_.characterEffect1081ui_story.fillRatio = var_415_5
			end

			local var_415_6 = 0
			local var_415_7 = 0.4

			if var_415_6 < arg_412_1.time_ and arg_412_1.time_ <= var_415_6 + arg_415_0 then
				arg_412_1.talkMaxDuration = 0
				arg_412_1.dialogCg_.alpha = 1

				arg_412_1.dialog_:SetActive(true)
				SetActive(arg_412_1.leftNameGo_, true)

				local var_415_8 = arg_412_1:FormatText(StoryNameCfg[7].name)

				arg_412_1.leftNameTxt_.text = var_415_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_412_1.leftNameTxt_.transform)

				arg_412_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_412_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_412_1:RecordName(arg_412_1.leftNameTxt_.text)
				SetActive(arg_412_1.iconTrs_.gameObject, false)
				arg_412_1.callingController_:SetSelectedState("normal")

				local var_415_9 = arg_412_1:GetWordFromCfg(1108105099)
				local var_415_10 = arg_412_1:FormatText(var_415_9.content)

				arg_412_1.text_.text = var_415_10

				LuaForUtil.ClearLinePrefixSymbol(arg_412_1.text_)

				local var_415_11 = 16
				local var_415_12 = utf8.len(var_415_10)
				local var_415_13 = var_415_11 <= 0 and var_415_7 or var_415_7 * (var_415_12 / var_415_11)

				if var_415_13 > 0 and var_415_7 < var_415_13 then
					arg_412_1.talkMaxDuration = var_415_13

					if var_415_13 + var_415_6 > arg_412_1.duration_ then
						arg_412_1.duration_ = var_415_13 + var_415_6
					end
				end

				arg_412_1.text_.text = var_415_10
				arg_412_1.typewritter.percent = 0

				arg_412_1.typewritter:SetDirty()
				arg_412_1:ShowNextGo(false)
				arg_412_1:RecordContent(arg_412_1.text_.text)
			end

			local var_415_14 = math.max(var_415_7, arg_412_1.talkMaxDuration)

			if var_415_6 <= arg_412_1.time_ and arg_412_1.time_ < var_415_6 + var_415_14 then
				arg_412_1.typewritter.percent = (arg_412_1.time_ - var_415_6) / var_415_14

				arg_412_1.typewritter:SetDirty()
			end

			if arg_412_1.time_ >= var_415_6 + var_415_14 and arg_412_1.time_ < var_415_6 + var_415_14 + arg_415_0 then
				arg_412_1.typewritter.percent = 1

				arg_412_1.typewritter:SetDirty()
				arg_412_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105100 = function(arg_416_0, arg_416_1)
		arg_416_1.time_ = 0
		arg_416_1.frameCnt_ = 0
		arg_416_1.state_ = "playing"
		arg_416_1.curTalkId_ = 1108105100
		arg_416_1.duration_ = 5

		SetActive(arg_416_1.tipsGo_, false)

		function arg_416_1.onSingleLineFinish_()
			arg_416_1.onSingleLineUpdate_ = nil
			arg_416_1.onSingleLineFinish_ = nil
			arg_416_1.state_ = "waiting"
		end

		function arg_416_1.playNext_(arg_418_0)
			if arg_418_0 == 1 then
				arg_416_0:Play1108105101(arg_416_1)
			end
		end

		function arg_416_1.onSingleLineUpdate_(arg_419_0)
			local var_419_0 = 0
			local var_419_1 = 0.6

			if var_419_0 < arg_416_1.time_ and arg_416_1.time_ <= var_419_0 + arg_419_0 then
				arg_416_1.talkMaxDuration = 0
				arg_416_1.dialogCg_.alpha = 1

				arg_416_1.dialog_:SetActive(true)
				SetActive(arg_416_1.leftNameGo_, true)

				local var_419_2 = arg_416_1:FormatText(StoryNameCfg[7].name)

				arg_416_1.leftNameTxt_.text = var_419_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_416_1.leftNameTxt_.transform)

				arg_416_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_416_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_416_1:RecordName(arg_416_1.leftNameTxt_.text)
				SetActive(arg_416_1.iconTrs_.gameObject, false)
				arg_416_1.callingController_:SetSelectedState("normal")

				local var_419_3 = arg_416_1:GetWordFromCfg(1108105100)
				local var_419_4 = arg_416_1:FormatText(var_419_3.content)

				arg_416_1.text_.text = var_419_4

				LuaForUtil.ClearLinePrefixSymbol(arg_416_1.text_)

				local var_419_5 = 24
				local var_419_6 = utf8.len(var_419_4)
				local var_419_7 = var_419_5 <= 0 and var_419_1 or var_419_1 * (var_419_6 / var_419_5)

				if var_419_7 > 0 and var_419_1 < var_419_7 then
					arg_416_1.talkMaxDuration = var_419_7

					if var_419_7 + var_419_0 > arg_416_1.duration_ then
						arg_416_1.duration_ = var_419_7 + var_419_0
					end
				end

				arg_416_1.text_.text = var_419_4
				arg_416_1.typewritter.percent = 0

				arg_416_1.typewritter:SetDirty()
				arg_416_1:ShowNextGo(false)
				arg_416_1:RecordContent(arg_416_1.text_.text)
			end

			local var_419_8 = math.max(var_419_1, arg_416_1.talkMaxDuration)

			if var_419_0 <= arg_416_1.time_ and arg_416_1.time_ < var_419_0 + var_419_8 then
				arg_416_1.typewritter.percent = (arg_416_1.time_ - var_419_0) / var_419_8

				arg_416_1.typewritter:SetDirty()
			end

			if arg_416_1.time_ >= var_419_0 + var_419_8 and arg_416_1.time_ < var_419_0 + var_419_8 + arg_419_0 then
				arg_416_1.typewritter.percent = 1

				arg_416_1.typewritter:SetDirty()
				arg_416_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105101 = function(arg_420_0, arg_420_1)
		arg_420_1.time_ = 0
		arg_420_1.frameCnt_ = 0
		arg_420_1.state_ = "playing"
		arg_420_1.curTalkId_ = 1108105101
		arg_420_1.duration_ = 5

		SetActive(arg_420_1.tipsGo_, false)

		function arg_420_1.onSingleLineFinish_()
			arg_420_1.onSingleLineUpdate_ = nil
			arg_420_1.onSingleLineFinish_ = nil
			arg_420_1.state_ = "waiting"
		end

		function arg_420_1.playNext_(arg_422_0)
			if arg_422_0 == 1 then
				arg_420_0:Play1108105102(arg_420_1)
			end
		end

		function arg_420_1.onSingleLineUpdate_(arg_423_0)
			local var_423_0 = arg_420_1.actors_["1081ui_story"].transform
			local var_423_1 = 0

			if var_423_1 < arg_420_1.time_ and arg_420_1.time_ <= var_423_1 + arg_423_0 then
				arg_420_1.var_.moveOldPos1081ui_story = var_423_0.localPosition
			end

			local var_423_2 = 0.001

			if var_423_1 <= arg_420_1.time_ and arg_420_1.time_ < var_423_1 + var_423_2 then
				local var_423_3 = (arg_420_1.time_ - var_423_1) / var_423_2
				local var_423_4 = Vector3.New(0, -0.92, -5.8)

				var_423_0.localPosition = Vector3.Lerp(arg_420_1.var_.moveOldPos1081ui_story, var_423_4, var_423_3)

				local var_423_5 = manager.ui.mainCamera.transform.position - var_423_0.position

				var_423_0.forward = Vector3.New(var_423_5.x, var_423_5.y, var_423_5.z)

				local var_423_6 = var_423_0.localEulerAngles

				var_423_6.z = 0
				var_423_6.x = 0
				var_423_0.localEulerAngles = var_423_6
			end

			if arg_420_1.time_ >= var_423_1 + var_423_2 and arg_420_1.time_ < var_423_1 + var_423_2 + arg_423_0 then
				var_423_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_423_7 = manager.ui.mainCamera.transform.position - var_423_0.position

				var_423_0.forward = Vector3.New(var_423_7.x, var_423_7.y, var_423_7.z)

				local var_423_8 = var_423_0.localEulerAngles

				var_423_8.z = 0
				var_423_8.x = 0
				var_423_0.localEulerAngles = var_423_8
			end

			local var_423_9 = arg_420_1.actors_["1081ui_story"]
			local var_423_10 = 0

			if var_423_10 < arg_420_1.time_ and arg_420_1.time_ <= var_423_10 + arg_423_0 and arg_420_1.var_.characterEffect1081ui_story == nil then
				arg_420_1.var_.characterEffect1081ui_story = var_423_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_423_11 = 0.200000002980232

			if var_423_10 <= arg_420_1.time_ and arg_420_1.time_ < var_423_10 + var_423_11 then
				local var_423_12 = (arg_420_1.time_ - var_423_10) / var_423_11

				if arg_420_1.var_.characterEffect1081ui_story then
					arg_420_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_420_1.time_ >= var_423_10 + var_423_11 and arg_420_1.time_ < var_423_10 + var_423_11 + arg_423_0 and arg_420_1.var_.characterEffect1081ui_story then
				arg_420_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_423_13 = 0
			local var_423_14 = 0.7

			if var_423_13 < arg_420_1.time_ and arg_420_1.time_ <= var_423_13 + arg_423_0 then
				arg_420_1.talkMaxDuration = 0
				arg_420_1.dialogCg_.alpha = 1

				arg_420_1.dialog_:SetActive(true)
				SetActive(arg_420_1.leftNameGo_, true)

				local var_423_15 = arg_420_1:FormatText(StoryNameCfg[202].name)

				arg_420_1.leftNameTxt_.text = var_423_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_420_1.leftNameTxt_.transform)

				arg_420_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_420_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_420_1:RecordName(arg_420_1.leftNameTxt_.text)
				SetActive(arg_420_1.iconTrs_.gameObject, false)
				arg_420_1.callingController_:SetSelectedState("normal")

				local var_423_16 = arg_420_1:GetWordFromCfg(1108105101)
				local var_423_17 = arg_420_1:FormatText(var_423_16.content)

				arg_420_1.text_.text = var_423_17

				LuaForUtil.ClearLinePrefixSymbol(arg_420_1.text_)

				local var_423_18 = 28
				local var_423_19 = utf8.len(var_423_17)
				local var_423_20 = var_423_18 <= 0 and var_423_14 or var_423_14 * (var_423_19 / var_423_18)

				if var_423_20 > 0 and var_423_14 < var_423_20 then
					arg_420_1.talkMaxDuration = var_423_20

					if var_423_20 + var_423_13 > arg_420_1.duration_ then
						arg_420_1.duration_ = var_423_20 + var_423_13
					end
				end

				arg_420_1.text_.text = var_423_17
				arg_420_1.typewritter.percent = 0

				arg_420_1.typewritter:SetDirty()
				arg_420_1:ShowNextGo(false)
				arg_420_1:RecordContent(arg_420_1.text_.text)
			end

			local var_423_21 = math.max(var_423_14, arg_420_1.talkMaxDuration)

			if var_423_13 <= arg_420_1.time_ and arg_420_1.time_ < var_423_13 + var_423_21 then
				arg_420_1.typewritter.percent = (arg_420_1.time_ - var_423_13) / var_423_21

				arg_420_1.typewritter:SetDirty()
			end

			if arg_420_1.time_ >= var_423_13 + var_423_21 and arg_420_1.time_ < var_423_13 + var_423_21 + arg_423_0 then
				arg_420_1.typewritter.percent = 1

				arg_420_1.typewritter:SetDirty()
				arg_420_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105102 = function(arg_424_0, arg_424_1)
		arg_424_1.time_ = 0
		arg_424_1.frameCnt_ = 0
		arg_424_1.state_ = "playing"
		arg_424_1.curTalkId_ = 1108105102
		arg_424_1.duration_ = 5

		SetActive(arg_424_1.tipsGo_, false)

		function arg_424_1.onSingleLineFinish_()
			arg_424_1.onSingleLineUpdate_ = nil
			arg_424_1.onSingleLineFinish_ = nil
			arg_424_1.state_ = "waiting"
		end

		function arg_424_1.playNext_(arg_426_0)
			if arg_426_0 == 1 then
				arg_424_0:Play1108105103(arg_424_1)
			end
		end

		function arg_424_1.onSingleLineUpdate_(arg_427_0)
			local var_427_0 = arg_424_1.actors_["1081ui_story"].transform
			local var_427_1 = 0

			if var_427_1 < arg_424_1.time_ and arg_424_1.time_ <= var_427_1 + arg_427_0 then
				arg_424_1.var_.moveOldPos1081ui_story = var_427_0.localPosition
			end

			local var_427_2 = 0.001

			if var_427_1 <= arg_424_1.time_ and arg_424_1.time_ < var_427_1 + var_427_2 then
				local var_427_3 = (arg_424_1.time_ - var_427_1) / var_427_2
				local var_427_4 = Vector3.New(0, -0.92, -5.8)

				var_427_0.localPosition = Vector3.Lerp(arg_424_1.var_.moveOldPos1081ui_story, var_427_4, var_427_3)

				local var_427_5 = manager.ui.mainCamera.transform.position - var_427_0.position

				var_427_0.forward = Vector3.New(var_427_5.x, var_427_5.y, var_427_5.z)

				local var_427_6 = var_427_0.localEulerAngles

				var_427_6.z = 0
				var_427_6.x = 0
				var_427_0.localEulerAngles = var_427_6
			end

			if arg_424_1.time_ >= var_427_1 + var_427_2 and arg_424_1.time_ < var_427_1 + var_427_2 + arg_427_0 then
				var_427_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_427_7 = manager.ui.mainCamera.transform.position - var_427_0.position

				var_427_0.forward = Vector3.New(var_427_7.x, var_427_7.y, var_427_7.z)

				local var_427_8 = var_427_0.localEulerAngles

				var_427_8.z = 0
				var_427_8.x = 0
				var_427_0.localEulerAngles = var_427_8
			end

			local var_427_9 = arg_424_1.actors_["1081ui_story"]
			local var_427_10 = 0

			if var_427_10 < arg_424_1.time_ and arg_424_1.time_ <= var_427_10 + arg_427_0 and arg_424_1.var_.characterEffect1081ui_story == nil then
				arg_424_1.var_.characterEffect1081ui_story = var_427_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_427_11 = 0.200000002980232

			if var_427_10 <= arg_424_1.time_ and arg_424_1.time_ < var_427_10 + var_427_11 then
				local var_427_12 = (arg_424_1.time_ - var_427_10) / var_427_11

				if arg_424_1.var_.characterEffect1081ui_story then
					arg_424_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_424_1.time_ >= var_427_10 + var_427_11 and arg_424_1.time_ < var_427_10 + var_427_11 + arg_427_0 and arg_424_1.var_.characterEffect1081ui_story then
				arg_424_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_427_13 = 0

			if var_427_13 < arg_424_1.time_ and arg_424_1.time_ <= var_427_13 + arg_427_0 then
				arg_424_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_427_14 = 0
			local var_427_15 = 0.433333333333333

			if var_427_14 < arg_424_1.time_ and arg_424_1.time_ <= var_427_14 + arg_427_0 then
				arg_424_1.talkMaxDuration = 0
				arg_424_1.dialogCg_.alpha = 1

				arg_424_1.dialog_:SetActive(true)
				SetActive(arg_424_1.leftNameGo_, true)

				local var_427_16 = arg_424_1:FormatText(StoryNameCfg[202].name)

				arg_424_1.leftNameTxt_.text = var_427_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_424_1.leftNameTxt_.transform)

				arg_424_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_424_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_424_1:RecordName(arg_424_1.leftNameTxt_.text)
				SetActive(arg_424_1.iconTrs_.gameObject, false)
				arg_424_1.callingController_:SetSelectedState("normal")

				local var_427_17 = arg_424_1:GetWordFromCfg(1108105102)
				local var_427_18 = arg_424_1:FormatText(var_427_17.content)

				arg_424_1.text_.text = var_427_18

				LuaForUtil.ClearLinePrefixSymbol(arg_424_1.text_)

				local var_427_19 = 16
				local var_427_20 = utf8.len(var_427_18)
				local var_427_21 = var_427_19 <= 0 and var_427_15 or var_427_15 * (var_427_20 / var_427_19)

				if var_427_21 > 0 and var_427_15 < var_427_21 then
					arg_424_1.talkMaxDuration = var_427_21

					if var_427_21 + var_427_14 > arg_424_1.duration_ then
						arg_424_1.duration_ = var_427_21 + var_427_14
					end
				end

				arg_424_1.text_.text = var_427_18
				arg_424_1.typewritter.percent = 0

				arg_424_1.typewritter:SetDirty()
				arg_424_1:ShowNextGo(false)
				arg_424_1:RecordContent(arg_424_1.text_.text)
			end

			local var_427_22 = math.max(var_427_15, arg_424_1.talkMaxDuration)

			if var_427_14 <= arg_424_1.time_ and arg_424_1.time_ < var_427_14 + var_427_22 then
				arg_424_1.typewritter.percent = (arg_424_1.time_ - var_427_14) / var_427_22

				arg_424_1.typewritter:SetDirty()
			end

			if arg_424_1.time_ >= var_427_14 + var_427_22 and arg_424_1.time_ < var_427_14 + var_427_22 + arg_427_0 then
				arg_424_1.typewritter.percent = 1

				arg_424_1.typewritter:SetDirty()
				arg_424_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105103 = function(arg_428_0, arg_428_1)
		arg_428_1.time_ = 0
		arg_428_1.frameCnt_ = 0
		arg_428_1.state_ = "playing"
		arg_428_1.curTalkId_ = 1108105103
		arg_428_1.duration_ = 5

		SetActive(arg_428_1.tipsGo_, false)

		function arg_428_1.onSingleLineFinish_()
			arg_428_1.onSingleLineUpdate_ = nil
			arg_428_1.onSingleLineFinish_ = nil
			arg_428_1.state_ = "waiting"
		end

		function arg_428_1.playNext_(arg_430_0)
			if arg_430_0 == 1 then
				arg_428_0:Play1108105104(arg_428_1)
			end
		end

		function arg_428_1.onSingleLineUpdate_(arg_431_0)
			local var_431_0 = arg_428_1.actors_["1081ui_story"]
			local var_431_1 = 0

			if var_431_1 < arg_428_1.time_ and arg_428_1.time_ <= var_431_1 + arg_431_0 and arg_428_1.var_.characterEffect1081ui_story == nil then
				arg_428_1.var_.characterEffect1081ui_story = var_431_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_431_2 = 0.200000002980232

			if var_431_1 <= arg_428_1.time_ and arg_428_1.time_ < var_431_1 + var_431_2 then
				local var_431_3 = (arg_428_1.time_ - var_431_1) / var_431_2

				if arg_428_1.var_.characterEffect1081ui_story then
					local var_431_4 = Mathf.Lerp(0, 0.5, var_431_3)

					arg_428_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_428_1.var_.characterEffect1081ui_story.fillRatio = var_431_4
				end
			end

			if arg_428_1.time_ >= var_431_1 + var_431_2 and arg_428_1.time_ < var_431_1 + var_431_2 + arg_431_0 and arg_428_1.var_.characterEffect1081ui_story then
				local var_431_5 = 0.5

				arg_428_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_428_1.var_.characterEffect1081ui_story.fillRatio = var_431_5
			end

			local var_431_6 = 0
			local var_431_7 = 0.972271398175508

			if var_431_6 < arg_428_1.time_ and arg_428_1.time_ <= var_431_6 + arg_431_0 then
				arg_428_1.talkMaxDuration = 0
				arg_428_1.dialogCg_.alpha = 1

				arg_428_1.dialog_:SetActive(true)
				SetActive(arg_428_1.leftNameGo_, true)

				local var_431_8 = arg_428_1:FormatText(StoryNameCfg[7].name)

				arg_428_1.leftNameTxt_.text = var_431_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_428_1.leftNameTxt_.transform)

				arg_428_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_428_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_428_1:RecordName(arg_428_1.leftNameTxt_.text)
				SetActive(arg_428_1.iconTrs_.gameObject, false)
				arg_428_1.callingController_:SetSelectedState("normal")

				local var_431_9 = arg_428_1:GetWordFromCfg(1108105103)
				local var_431_10 = arg_428_1:FormatText(var_431_9.content)

				arg_428_1.text_.text = var_431_10

				LuaForUtil.ClearLinePrefixSymbol(arg_428_1.text_)

				local var_431_11 = 2
				local var_431_12 = utf8.len(var_431_10)
				local var_431_13 = var_431_11 <= 0 and var_431_7 or var_431_7 * (var_431_12 / var_431_11)

				if var_431_13 > 0 and var_431_7 < var_431_13 then
					arg_428_1.talkMaxDuration = var_431_13

					if var_431_13 + var_431_6 > arg_428_1.duration_ then
						arg_428_1.duration_ = var_431_13 + var_431_6
					end
				end

				arg_428_1.text_.text = var_431_10
				arg_428_1.typewritter.percent = 0

				arg_428_1.typewritter:SetDirty()
				arg_428_1:ShowNextGo(false)
				arg_428_1:RecordContent(arg_428_1.text_.text)
			end

			local var_431_14 = math.max(var_431_7, arg_428_1.talkMaxDuration)

			if var_431_6 <= arg_428_1.time_ and arg_428_1.time_ < var_431_6 + var_431_14 then
				arg_428_1.typewritter.percent = (arg_428_1.time_ - var_431_6) / var_431_14

				arg_428_1.typewritter:SetDirty()
			end

			if arg_428_1.time_ >= var_431_6 + var_431_14 and arg_428_1.time_ < var_431_6 + var_431_14 + arg_431_0 then
				arg_428_1.typewritter.percent = 1

				arg_428_1.typewritter:SetDirty()
				arg_428_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105104 = function(arg_432_0, arg_432_1)
		arg_432_1.time_ = 0
		arg_432_1.frameCnt_ = 0
		arg_432_1.state_ = "playing"
		arg_432_1.curTalkId_ = 1108105104
		arg_432_1.duration_ = 8.03

		SetActive(arg_432_1.tipsGo_, false)

		function arg_432_1.onSingleLineFinish_()
			arg_432_1.onSingleLineUpdate_ = nil
			arg_432_1.onSingleLineFinish_ = nil
			arg_432_1.state_ = "waiting"
		end

		function arg_432_1.playNext_(arg_434_0)
			if arg_434_0 == 1 then
				arg_432_0:Play1108105105(arg_432_1)
			end
		end

		function arg_432_1.onSingleLineUpdate_(arg_435_0)
			local var_435_0 = 2.03400000184774

			if var_435_0 < arg_432_1.time_ and arg_432_1.time_ <= var_435_0 + arg_435_0 then
				local var_435_1 = manager.ui.mainCamera.transform.localPosition
				local var_435_2 = Vector3.New(0, 0, 10) + Vector3.New(var_435_1.x, var_435_1.y, 0)
				local var_435_3 = arg_432_1.bgs_.ST0402a

				var_435_3.transform.localPosition = var_435_2
				var_435_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_435_4 = var_435_3:GetComponent("SpriteRenderer")

				if var_435_4 and var_435_4.sprite then
					local var_435_5 = (var_435_3.transform.localPosition - var_435_1).z
					local var_435_6 = manager.ui.mainCameraCom_
					local var_435_7 = 2 * var_435_5 * Mathf.Tan(var_435_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_435_8 = var_435_7 * var_435_6.aspect
					local var_435_9 = var_435_4.sprite.bounds.size.x
					local var_435_10 = var_435_4.sprite.bounds.size.y
					local var_435_11 = var_435_8 / var_435_9
					local var_435_12 = var_435_7 / var_435_10
					local var_435_13 = var_435_12 < var_435_11 and var_435_11 or var_435_12

					var_435_3.transform.localScale = Vector3.New(var_435_13, var_435_13, 0)
				end

				for iter_435_0, iter_435_1 in pairs(arg_432_1.bgs_) do
					if iter_435_0 ~= "ST0402a" then
						iter_435_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_435_14 = 0

			if var_435_14 < arg_432_1.time_ and arg_432_1.time_ <= var_435_14 + arg_435_0 then
				arg_432_1.mask_.enabled = true
				arg_432_1.mask_.raycastTarget = true

				arg_432_1:SetGaussion(false)
			end

			local var_435_15 = 2

			if var_435_14 <= arg_432_1.time_ and arg_432_1.time_ < var_435_14 + var_435_15 then
				local var_435_16 = (arg_432_1.time_ - var_435_14) / var_435_15
				local var_435_17 = Color.New(0, 0, 0)

				var_435_17.a = Mathf.Lerp(0, 1, var_435_16)
				arg_432_1.mask_.color = var_435_17
			end

			if arg_432_1.time_ >= var_435_14 + var_435_15 and arg_432_1.time_ < var_435_14 + var_435_15 + arg_435_0 then
				local var_435_18 = Color.New(0, 0, 0)

				var_435_18.a = 1
				arg_432_1.mask_.color = var_435_18
			end

			local var_435_19 = 2

			if var_435_19 < arg_432_1.time_ and arg_432_1.time_ <= var_435_19 + arg_435_0 then
				arg_432_1.mask_.enabled = true
				arg_432_1.mask_.raycastTarget = true

				arg_432_1:SetGaussion(false)
			end

			local var_435_20 = 1.6

			if var_435_19 <= arg_432_1.time_ and arg_432_1.time_ < var_435_19 + var_435_20 then
				local var_435_21 = (arg_432_1.time_ - var_435_19) / var_435_20
				local var_435_22 = Color.New(0, 0, 0)

				var_435_22.a = Mathf.Lerp(1, 0, var_435_21)
				arg_432_1.mask_.color = var_435_22
			end

			if arg_432_1.time_ >= var_435_19 + var_435_20 and arg_432_1.time_ < var_435_19 + var_435_20 + arg_435_0 then
				local var_435_23 = Color.New(0, 0, 0)
				local var_435_24 = 0

				arg_432_1.mask_.enabled = false
				var_435_23.a = var_435_24
				arg_432_1.mask_.color = var_435_23
			end

			local var_435_25 = arg_432_1.actors_["1081ui_story"].transform
			local var_435_26 = 2

			if var_435_26 < arg_432_1.time_ and arg_432_1.time_ <= var_435_26 + arg_435_0 then
				arg_432_1.var_.moveOldPos1081ui_story = var_435_25.localPosition
			end

			local var_435_27 = 0.001

			if var_435_26 <= arg_432_1.time_ and arg_432_1.time_ < var_435_26 + var_435_27 then
				local var_435_28 = (arg_432_1.time_ - var_435_26) / var_435_27
				local var_435_29 = Vector3.New(0, 100, 0)

				var_435_25.localPosition = Vector3.Lerp(arg_432_1.var_.moveOldPos1081ui_story, var_435_29, var_435_28)

				local var_435_30 = manager.ui.mainCamera.transform.position - var_435_25.position

				var_435_25.forward = Vector3.New(var_435_30.x, var_435_30.y, var_435_30.z)

				local var_435_31 = var_435_25.localEulerAngles

				var_435_31.z = 0
				var_435_31.x = 0
				var_435_25.localEulerAngles = var_435_31
			end

			if arg_432_1.time_ >= var_435_26 + var_435_27 and arg_432_1.time_ < var_435_26 + var_435_27 + arg_435_0 then
				var_435_25.localPosition = Vector3.New(0, 100, 0)

				local var_435_32 = manager.ui.mainCamera.transform.position - var_435_25.position

				var_435_25.forward = Vector3.New(var_435_32.x, var_435_32.y, var_435_32.z)

				local var_435_33 = var_435_25.localEulerAngles

				var_435_33.z = 0
				var_435_33.x = 0
				var_435_25.localEulerAngles = var_435_33
			end

			local var_435_34 = arg_432_1.actors_["1080ui_story"].transform
			local var_435_35 = 2

			if var_435_35 < arg_432_1.time_ and arg_432_1.time_ <= var_435_35 + arg_435_0 then
				arg_432_1.var_.moveOldPos1080ui_story = var_435_34.localPosition
			end

			local var_435_36 = 0.001

			if var_435_35 <= arg_432_1.time_ and arg_432_1.time_ < var_435_35 + var_435_36 then
				local var_435_37 = (arg_432_1.time_ - var_435_35) / var_435_36
				local var_435_38 = Vector3.New(0, 100, 0)

				var_435_34.localPosition = Vector3.Lerp(arg_432_1.var_.moveOldPos1080ui_story, var_435_38, var_435_37)

				local var_435_39 = manager.ui.mainCamera.transform.position - var_435_34.position

				var_435_34.forward = Vector3.New(var_435_39.x, var_435_39.y, var_435_39.z)

				local var_435_40 = var_435_34.localEulerAngles

				var_435_40.z = 0
				var_435_40.x = 0
				var_435_34.localEulerAngles = var_435_40
			end

			if arg_432_1.time_ >= var_435_35 + var_435_36 and arg_432_1.time_ < var_435_35 + var_435_36 + arg_435_0 then
				var_435_34.localPosition = Vector3.New(0, 100, 0)

				local var_435_41 = manager.ui.mainCamera.transform.position - var_435_34.position

				var_435_34.forward = Vector3.New(var_435_41.x, var_435_41.y, var_435_41.z)

				local var_435_42 = var_435_34.localEulerAngles

				var_435_42.z = 0
				var_435_42.x = 0
				var_435_34.localEulerAngles = var_435_42
			end

			if arg_432_1.frameCnt_ <= 1 then
				arg_432_1.dialog_:SetActive(false)
			end

			local var_435_43 = 3.03400000184774
			local var_435_44 = 1

			if var_435_43 < arg_432_1.time_ and arg_432_1.time_ <= var_435_43 + arg_435_0 then
				arg_432_1.talkMaxDuration = 0

				arg_432_1.dialog_:SetActive(true)

				local var_435_45 = LeanTween.value(arg_432_1.dialog_, 0, 1, 0.3)

				var_435_45:setOnUpdate(LuaHelper.FloatAction(function(arg_436_0)
					arg_432_1.dialogCg_.alpha = arg_436_0
				end))
				var_435_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_432_1.dialog_)
					var_435_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_432_1.duration_ = arg_432_1.duration_ + 0.3

				SetActive(arg_432_1.leftNameGo_, false)

				arg_432_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_432_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_432_1:RecordName(arg_432_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_432_1.iconTrs_.gameObject, false)
				arg_432_1.callingController_:SetSelectedState("normal")

				local var_435_46 = arg_432_1:GetWordFromCfg(1108105104)
				local var_435_47 = arg_432_1:FormatText(var_435_46.content)

				arg_432_1.text_.text = var_435_47

				LuaForUtil.ClearLinePrefixSymbol(arg_432_1.text_)

				local var_435_48 = 54
				local var_435_49 = utf8.len(var_435_47)
				local var_435_50 = var_435_48 <= 0 and var_435_44 or var_435_44 * (var_435_49 / var_435_48)

				if var_435_50 > 0 and var_435_44 < var_435_50 then
					arg_432_1.talkMaxDuration = var_435_50
					var_435_43 = var_435_43 + 0.3

					if var_435_50 + var_435_43 > arg_432_1.duration_ then
						arg_432_1.duration_ = var_435_50 + var_435_43
					end
				end

				arg_432_1.text_.text = var_435_47
				arg_432_1.typewritter.percent = 0

				arg_432_1.typewritter:SetDirty()
				arg_432_1:ShowNextGo(false)
				arg_432_1:RecordContent(arg_432_1.text_.text)
			end

			local var_435_51 = var_435_43 + 0.3
			local var_435_52 = math.max(var_435_44, arg_432_1.talkMaxDuration)

			if var_435_51 <= arg_432_1.time_ and arg_432_1.time_ < var_435_51 + var_435_52 then
				arg_432_1.typewritter.percent = (arg_432_1.time_ - var_435_51) / var_435_52

				arg_432_1.typewritter:SetDirty()
			end

			if arg_432_1.time_ >= var_435_51 + var_435_52 and arg_432_1.time_ < var_435_51 + var_435_52 + arg_435_0 then
				arg_432_1.typewritter.percent = 1

				arg_432_1.typewritter:SetDirty()
				arg_432_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105105 = function(arg_438_0, arg_438_1)
		arg_438_1.time_ = 0
		arg_438_1.frameCnt_ = 0
		arg_438_1.state_ = "playing"
		arg_438_1.curTalkId_ = 1108105105
		arg_438_1.duration_ = 5

		SetActive(arg_438_1.tipsGo_, false)

		function arg_438_1.onSingleLineFinish_()
			arg_438_1.onSingleLineUpdate_ = nil
			arg_438_1.onSingleLineFinish_ = nil
			arg_438_1.state_ = "waiting"
		end

		function arg_438_1.playNext_(arg_440_0)
			if arg_440_0 == 1 then
				arg_438_0:Play1108105106(arg_438_1)
			end
		end

		function arg_438_1.onSingleLineUpdate_(arg_441_0)
			local var_441_0 = 0
			local var_441_1 = 1.2

			if var_441_0 < arg_438_1.time_ and arg_438_1.time_ <= var_441_0 + arg_441_0 then
				arg_438_1.talkMaxDuration = 0
				arg_438_1.dialogCg_.alpha = 1

				arg_438_1.dialog_:SetActive(true)
				SetActive(arg_438_1.leftNameGo_, false)

				arg_438_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_438_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_438_1:RecordName(arg_438_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_438_1.iconTrs_.gameObject, false)
				arg_438_1.callingController_:SetSelectedState("normal")

				local var_441_2 = arg_438_1:GetWordFromCfg(1108105105)
				local var_441_3 = arg_438_1:FormatText(var_441_2.content)

				arg_438_1.text_.text = var_441_3

				LuaForUtil.ClearLinePrefixSymbol(arg_438_1.text_)

				local var_441_4 = 48
				local var_441_5 = utf8.len(var_441_3)
				local var_441_6 = var_441_4 <= 0 and var_441_1 or var_441_1 * (var_441_5 / var_441_4)

				if var_441_6 > 0 and var_441_1 < var_441_6 then
					arg_438_1.talkMaxDuration = var_441_6

					if var_441_6 + var_441_0 > arg_438_1.duration_ then
						arg_438_1.duration_ = var_441_6 + var_441_0
					end
				end

				arg_438_1.text_.text = var_441_3
				arg_438_1.typewritter.percent = 0

				arg_438_1.typewritter:SetDirty()
				arg_438_1:ShowNextGo(false)
				arg_438_1:RecordContent(arg_438_1.text_.text)
			end

			local var_441_7 = math.max(var_441_1, arg_438_1.talkMaxDuration)

			if var_441_0 <= arg_438_1.time_ and arg_438_1.time_ < var_441_0 + var_441_7 then
				arg_438_1.typewritter.percent = (arg_438_1.time_ - var_441_0) / var_441_7

				arg_438_1.typewritter:SetDirty()
			end

			if arg_438_1.time_ >= var_441_0 + var_441_7 and arg_438_1.time_ < var_441_0 + var_441_7 + arg_441_0 then
				arg_438_1.typewritter.percent = 1

				arg_438_1.typewritter:SetDirty()
				arg_438_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105106 = function(arg_442_0, arg_442_1)
		arg_442_1.time_ = 0
		arg_442_1.frameCnt_ = 0
		arg_442_1.state_ = "playing"
		arg_442_1.curTalkId_ = 1108105106
		arg_442_1.duration_ = 5

		SetActive(arg_442_1.tipsGo_, false)

		function arg_442_1.onSingleLineFinish_()
			arg_442_1.onSingleLineUpdate_ = nil
			arg_442_1.onSingleLineFinish_ = nil
			arg_442_1.state_ = "waiting"
		end

		function arg_442_1.playNext_(arg_444_0)
			if arg_444_0 == 1 then
				arg_442_0:Play1108105107(arg_442_1)
			end
		end

		function arg_442_1.onSingleLineUpdate_(arg_445_0)
			local var_445_0 = 0
			local var_445_1 = 0.15

			if var_445_0 < arg_442_1.time_ and arg_442_1.time_ <= var_445_0 + arg_445_0 then
				arg_442_1.talkMaxDuration = 0
				arg_442_1.dialogCg_.alpha = 1

				arg_442_1.dialog_:SetActive(true)
				SetActive(arg_442_1.leftNameGo_, true)

				local var_445_2 = arg_442_1:FormatText(StoryNameCfg[7].name)

				arg_442_1.leftNameTxt_.text = var_445_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_442_1.leftNameTxt_.transform)

				arg_442_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_442_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_442_1:RecordName(arg_442_1.leftNameTxt_.text)
				SetActive(arg_442_1.iconTrs_.gameObject, false)
				arg_442_1.callingController_:SetSelectedState("normal")

				local var_445_3 = arg_442_1:GetWordFromCfg(1108105106)
				local var_445_4 = arg_442_1:FormatText(var_445_3.content)

				arg_442_1.text_.text = var_445_4

				LuaForUtil.ClearLinePrefixSymbol(arg_442_1.text_)

				local var_445_5 = 6
				local var_445_6 = utf8.len(var_445_4)
				local var_445_7 = var_445_5 <= 0 and var_445_1 or var_445_1 * (var_445_6 / var_445_5)

				if var_445_7 > 0 and var_445_1 < var_445_7 then
					arg_442_1.talkMaxDuration = var_445_7

					if var_445_7 + var_445_0 > arg_442_1.duration_ then
						arg_442_1.duration_ = var_445_7 + var_445_0
					end
				end

				arg_442_1.text_.text = var_445_4
				arg_442_1.typewritter.percent = 0

				arg_442_1.typewritter:SetDirty()
				arg_442_1:ShowNextGo(false)
				arg_442_1:RecordContent(arg_442_1.text_.text)
			end

			local var_445_8 = math.max(var_445_1, arg_442_1.talkMaxDuration)

			if var_445_0 <= arg_442_1.time_ and arg_442_1.time_ < var_445_0 + var_445_8 then
				arg_442_1.typewritter.percent = (arg_442_1.time_ - var_445_0) / var_445_8

				arg_442_1.typewritter:SetDirty()
			end

			if arg_442_1.time_ >= var_445_0 + var_445_8 and arg_442_1.time_ < var_445_0 + var_445_8 + arg_445_0 then
				arg_442_1.typewritter.percent = 1

				arg_442_1.typewritter:SetDirty()
				arg_442_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105107 = function(arg_446_0, arg_446_1)
		arg_446_1.time_ = 0
		arg_446_1.frameCnt_ = 0
		arg_446_1.state_ = "playing"
		arg_446_1.curTalkId_ = 1108105107
		arg_446_1.duration_ = 5

		SetActive(arg_446_1.tipsGo_, false)

		function arg_446_1.onSingleLineFinish_()
			arg_446_1.onSingleLineUpdate_ = nil
			arg_446_1.onSingleLineFinish_ = nil
			arg_446_1.state_ = "waiting"
		end

		function arg_446_1.playNext_(arg_448_0)
			if arg_448_0 == 1 then
				arg_446_0:Play1108105108(arg_446_1)
			end
		end

		function arg_446_1.onSingleLineUpdate_(arg_449_0)
			local var_449_0 = 0
			local var_449_1 = 0.55

			if var_449_0 < arg_446_1.time_ and arg_446_1.time_ <= var_449_0 + arg_449_0 then
				arg_446_1.talkMaxDuration = 0
				arg_446_1.dialogCg_.alpha = 1

				arg_446_1.dialog_:SetActive(true)
				SetActive(arg_446_1.leftNameGo_, true)

				local var_449_2 = arg_446_1:FormatText(StoryNameCfg[7].name)

				arg_446_1.leftNameTxt_.text = var_449_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_446_1.leftNameTxt_.transform)

				arg_446_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_446_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_446_1:RecordName(arg_446_1.leftNameTxt_.text)
				SetActive(arg_446_1.iconTrs_.gameObject, false)
				arg_446_1.callingController_:SetSelectedState("normal")

				local var_449_3 = arg_446_1:GetWordFromCfg(1108105107)
				local var_449_4 = arg_446_1:FormatText(var_449_3.content)

				arg_446_1.text_.text = var_449_4

				LuaForUtil.ClearLinePrefixSymbol(arg_446_1.text_)

				local var_449_5 = 22
				local var_449_6 = utf8.len(var_449_4)
				local var_449_7 = var_449_5 <= 0 and var_449_1 or var_449_1 * (var_449_6 / var_449_5)

				if var_449_7 > 0 and var_449_1 < var_449_7 then
					arg_446_1.talkMaxDuration = var_449_7

					if var_449_7 + var_449_0 > arg_446_1.duration_ then
						arg_446_1.duration_ = var_449_7 + var_449_0
					end
				end

				arg_446_1.text_.text = var_449_4
				arg_446_1.typewritter.percent = 0

				arg_446_1.typewritter:SetDirty()
				arg_446_1:ShowNextGo(false)
				arg_446_1:RecordContent(arg_446_1.text_.text)
			end

			local var_449_8 = math.max(var_449_1, arg_446_1.talkMaxDuration)

			if var_449_0 <= arg_446_1.time_ and arg_446_1.time_ < var_449_0 + var_449_8 then
				arg_446_1.typewritter.percent = (arg_446_1.time_ - var_449_0) / var_449_8

				arg_446_1.typewritter:SetDirty()
			end

			if arg_446_1.time_ >= var_449_0 + var_449_8 and arg_446_1.time_ < var_449_0 + var_449_8 + arg_449_0 then
				arg_446_1.typewritter.percent = 1

				arg_446_1.typewritter:SetDirty()
				arg_446_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105108 = function(arg_450_0, arg_450_1)
		arg_450_1.time_ = 0
		arg_450_1.frameCnt_ = 0
		arg_450_1.state_ = "playing"
		arg_450_1.curTalkId_ = 1108105108
		arg_450_1.duration_ = 5

		SetActive(arg_450_1.tipsGo_, false)

		function arg_450_1.onSingleLineFinish_()
			arg_450_1.onSingleLineUpdate_ = nil
			arg_450_1.onSingleLineFinish_ = nil
			arg_450_1.state_ = "waiting"
		end

		function arg_450_1.playNext_(arg_452_0)
			if arg_452_0 == 1 then
				arg_450_0:Play1108105109(arg_450_1)
			end
		end

		function arg_450_1.onSingleLineUpdate_(arg_453_0)
			local var_453_0 = arg_450_1.actors_["1081ui_story"].transform
			local var_453_1 = 0

			if var_453_1 < arg_450_1.time_ and arg_450_1.time_ <= var_453_1 + arg_453_0 then
				arg_450_1.var_.moveOldPos1081ui_story = var_453_0.localPosition
			end

			local var_453_2 = 0.001

			if var_453_1 <= arg_450_1.time_ and arg_450_1.time_ < var_453_1 + var_453_2 then
				local var_453_3 = (arg_450_1.time_ - var_453_1) / var_453_2
				local var_453_4 = Vector3.New(0, -0.92, -5.8)

				var_453_0.localPosition = Vector3.Lerp(arg_450_1.var_.moveOldPos1081ui_story, var_453_4, var_453_3)

				local var_453_5 = manager.ui.mainCamera.transform.position - var_453_0.position

				var_453_0.forward = Vector3.New(var_453_5.x, var_453_5.y, var_453_5.z)

				local var_453_6 = var_453_0.localEulerAngles

				var_453_6.z = 0
				var_453_6.x = 0
				var_453_0.localEulerAngles = var_453_6
			end

			if arg_450_1.time_ >= var_453_1 + var_453_2 and arg_450_1.time_ < var_453_1 + var_453_2 + arg_453_0 then
				var_453_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_453_7 = manager.ui.mainCamera.transform.position - var_453_0.position

				var_453_0.forward = Vector3.New(var_453_7.x, var_453_7.y, var_453_7.z)

				local var_453_8 = var_453_0.localEulerAngles

				var_453_8.z = 0
				var_453_8.x = 0
				var_453_0.localEulerAngles = var_453_8
			end

			local var_453_9 = arg_450_1.actors_["1081ui_story"]
			local var_453_10 = 0

			if var_453_10 < arg_450_1.time_ and arg_450_1.time_ <= var_453_10 + arg_453_0 and arg_450_1.var_.characterEffect1081ui_story == nil then
				arg_450_1.var_.characterEffect1081ui_story = var_453_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_453_11 = 0.200000002980232

			if var_453_10 <= arg_450_1.time_ and arg_450_1.time_ < var_453_10 + var_453_11 then
				local var_453_12 = (arg_450_1.time_ - var_453_10) / var_453_11

				if arg_450_1.var_.characterEffect1081ui_story then
					arg_450_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_450_1.time_ >= var_453_10 + var_453_11 and arg_450_1.time_ < var_453_10 + var_453_11 + arg_453_0 and arg_450_1.var_.characterEffect1081ui_story then
				arg_450_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_453_13 = 0

			if var_453_13 < arg_450_1.time_ and arg_450_1.time_ <= var_453_13 + arg_453_0 then
				arg_450_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_453_14 = 0

			if var_453_14 < arg_450_1.time_ and arg_450_1.time_ <= var_453_14 + arg_453_0 then
				arg_450_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_453_15 = 0
			local var_453_16 = 0.425

			if var_453_15 < arg_450_1.time_ and arg_450_1.time_ <= var_453_15 + arg_453_0 then
				arg_450_1.talkMaxDuration = 0
				arg_450_1.dialogCg_.alpha = 1

				arg_450_1.dialog_:SetActive(true)
				SetActive(arg_450_1.leftNameGo_, true)

				local var_453_17 = arg_450_1:FormatText(StoryNameCfg[202].name)

				arg_450_1.leftNameTxt_.text = var_453_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_450_1.leftNameTxt_.transform)

				arg_450_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_450_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_450_1:RecordName(arg_450_1.leftNameTxt_.text)
				SetActive(arg_450_1.iconTrs_.gameObject, false)
				arg_450_1.callingController_:SetSelectedState("normal")

				local var_453_18 = arg_450_1:GetWordFromCfg(1108105108)
				local var_453_19 = arg_450_1:FormatText(var_453_18.content)

				arg_450_1.text_.text = var_453_19

				LuaForUtil.ClearLinePrefixSymbol(arg_450_1.text_)

				local var_453_20 = 17
				local var_453_21 = utf8.len(var_453_19)
				local var_453_22 = var_453_20 <= 0 and var_453_16 or var_453_16 * (var_453_21 / var_453_20)

				if var_453_22 > 0 and var_453_16 < var_453_22 then
					arg_450_1.talkMaxDuration = var_453_22

					if var_453_22 + var_453_15 > arg_450_1.duration_ then
						arg_450_1.duration_ = var_453_22 + var_453_15
					end
				end

				arg_450_1.text_.text = var_453_19
				arg_450_1.typewritter.percent = 0

				arg_450_1.typewritter:SetDirty()
				arg_450_1:ShowNextGo(false)
				arg_450_1:RecordContent(arg_450_1.text_.text)
			end

			local var_453_23 = math.max(var_453_16, arg_450_1.talkMaxDuration)

			if var_453_15 <= arg_450_1.time_ and arg_450_1.time_ < var_453_15 + var_453_23 then
				arg_450_1.typewritter.percent = (arg_450_1.time_ - var_453_15) / var_453_23

				arg_450_1.typewritter:SetDirty()
			end

			if arg_450_1.time_ >= var_453_15 + var_453_23 and arg_450_1.time_ < var_453_15 + var_453_23 + arg_453_0 then
				arg_450_1.typewritter.percent = 1

				arg_450_1.typewritter:SetDirty()
				arg_450_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105109 = function(arg_454_0, arg_454_1)
		arg_454_1.time_ = 0
		arg_454_1.frameCnt_ = 0
		arg_454_1.state_ = "playing"
		arg_454_1.curTalkId_ = 1108105109
		arg_454_1.duration_ = 1

		SetActive(arg_454_1.tipsGo_, false)

		function arg_454_1.onSingleLineFinish_()
			arg_454_1.onSingleLineUpdate_ = nil
			arg_454_1.onSingleLineFinish_ = nil
			arg_454_1.state_ = "waiting"

			SetActive(arg_454_1.choicesGo_, true)

			for iter_455_0, iter_455_1 in ipairs(arg_454_1.choices_) do
				local var_455_0 = iter_455_0 <= 2

				SetActive(iter_455_1.go, var_455_0)
			end

			arg_454_1.choices_[1].txt.text = arg_454_1:FormatText(StoryChoiceCfg[975].name)
			arg_454_1.choices_[2].txt.text = arg_454_1:FormatText(StoryChoiceCfg[976].name)
		end

		function arg_454_1.playNext_(arg_456_0)
			if arg_456_0 == 1 then
				arg_454_0:Play1108105110(arg_454_1)
			end

			if arg_456_0 == 2 then
				arg_454_0:Play1108105110(arg_454_1)
			end
		end

		function arg_454_1.onSingleLineUpdate_(arg_457_0)
			local var_457_0 = arg_454_1.actors_["1081ui_story"]
			local var_457_1 = 0

			if var_457_1 < arg_454_1.time_ and arg_454_1.time_ <= var_457_1 + arg_457_0 and arg_454_1.var_.characterEffect1081ui_story == nil then
				arg_454_1.var_.characterEffect1081ui_story = var_457_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_457_2 = 0.200000002980232

			if var_457_1 <= arg_454_1.time_ and arg_454_1.time_ < var_457_1 + var_457_2 then
				local var_457_3 = (arg_454_1.time_ - var_457_1) / var_457_2

				if arg_454_1.var_.characterEffect1081ui_story then
					local var_457_4 = Mathf.Lerp(0, 0.5, var_457_3)

					arg_454_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_454_1.var_.characterEffect1081ui_story.fillRatio = var_457_4
				end
			end

			if arg_454_1.time_ >= var_457_1 + var_457_2 and arg_454_1.time_ < var_457_1 + var_457_2 + arg_457_0 and arg_454_1.var_.characterEffect1081ui_story then
				local var_457_5 = 0.5

				arg_454_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_454_1.var_.characterEffect1081ui_story.fillRatio = var_457_5
			end
		end
	end,
	Play1108105110 = function(arg_458_0, arg_458_1)
		arg_458_1.time_ = 0
		arg_458_1.frameCnt_ = 0
		arg_458_1.state_ = "playing"
		arg_458_1.curTalkId_ = 1108105110
		arg_458_1.duration_ = 5

		SetActive(arg_458_1.tipsGo_, false)

		function arg_458_1.onSingleLineFinish_()
			arg_458_1.onSingleLineUpdate_ = nil
			arg_458_1.onSingleLineFinish_ = nil
			arg_458_1.state_ = "waiting"
		end

		function arg_458_1.playNext_(arg_460_0)
			if arg_460_0 == 1 then
				arg_458_0:Play1108105111(arg_458_1)
			end
		end

		function arg_458_1.onSingleLineUpdate_(arg_461_0)
			local var_461_0 = arg_458_1.actors_["1081ui_story"]
			local var_461_1 = 0

			if var_461_1 < arg_458_1.time_ and arg_458_1.time_ <= var_461_1 + arg_461_0 and arg_458_1.var_.characterEffect1081ui_story == nil then
				arg_458_1.var_.characterEffect1081ui_story = var_461_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_461_2 = 0.200000002980232

			if var_461_1 <= arg_458_1.time_ and arg_458_1.time_ < var_461_1 + var_461_2 then
				local var_461_3 = (arg_458_1.time_ - var_461_1) / var_461_2

				if arg_458_1.var_.characterEffect1081ui_story then
					arg_458_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_458_1.time_ >= var_461_1 + var_461_2 and arg_458_1.time_ < var_461_1 + var_461_2 + arg_461_0 and arg_458_1.var_.characterEffect1081ui_story then
				arg_458_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_461_4 = "1081ui_story"

			if arg_458_1.actors_[var_461_4] == nil then
				local var_461_5 = Object.Instantiate(Asset.Load("Char/" .. var_461_4), arg_458_1.stage_.transform)

				var_461_5.name = var_461_4
				var_461_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_458_1.actors_[var_461_4] = var_461_5

				local var_461_6 = var_461_5:GetComponentInChildren(typeof(CharacterEffect))

				var_461_6.enabled = true

				local var_461_7 = GameObjectTools.GetOrAddComponent(var_461_5, typeof(DynamicBoneHelper))

				if var_461_7 then
					var_461_7:EnableDynamicBone(false)
				end

				arg_458_1:ShowWeapon(var_461_6.transform, false)

				arg_458_1.var_[var_461_4 .. "Animator"] = var_461_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_458_1.var_[var_461_4 .. "Animator"].applyRootMotion = true
				arg_458_1.var_[var_461_4 .. "LipSync"] = var_461_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_461_8 = 0

			if var_461_8 < arg_458_1.time_ and arg_458_1.time_ <= var_461_8 + arg_461_0 then
				arg_458_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_461_9 = "1081ui_story"

			if arg_458_1.actors_[var_461_9] == nil then
				local var_461_10 = Object.Instantiate(Asset.Load("Char/" .. var_461_9), arg_458_1.stage_.transform)

				var_461_10.name = var_461_9
				var_461_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_458_1.actors_[var_461_9] = var_461_10

				local var_461_11 = var_461_10:GetComponentInChildren(typeof(CharacterEffect))

				var_461_11.enabled = true

				local var_461_12 = GameObjectTools.GetOrAddComponent(var_461_10, typeof(DynamicBoneHelper))

				if var_461_12 then
					var_461_12:EnableDynamicBone(false)
				end

				arg_458_1:ShowWeapon(var_461_11.transform, false)

				arg_458_1.var_[var_461_9 .. "Animator"] = var_461_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_458_1.var_[var_461_9 .. "Animator"].applyRootMotion = true
				arg_458_1.var_[var_461_9 .. "LipSync"] = var_461_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_461_13 = 0

			if var_461_13 < arg_458_1.time_ and arg_458_1.time_ <= var_461_13 + arg_461_0 then
				arg_458_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_461_14 = 0
			local var_461_15 = 0.55

			if var_461_14 < arg_458_1.time_ and arg_458_1.time_ <= var_461_14 + arg_461_0 then
				arg_458_1.talkMaxDuration = 0
				arg_458_1.dialogCg_.alpha = 1

				arg_458_1.dialog_:SetActive(true)
				SetActive(arg_458_1.leftNameGo_, true)

				local var_461_16 = arg_458_1:FormatText(StoryNameCfg[202].name)

				arg_458_1.leftNameTxt_.text = var_461_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_458_1.leftNameTxt_.transform)

				arg_458_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_458_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_458_1:RecordName(arg_458_1.leftNameTxt_.text)
				SetActive(arg_458_1.iconTrs_.gameObject, false)
				arg_458_1.callingController_:SetSelectedState("normal")

				local var_461_17 = arg_458_1:GetWordFromCfg(1108105110)
				local var_461_18 = arg_458_1:FormatText(var_461_17.content)

				arg_458_1.text_.text = var_461_18

				LuaForUtil.ClearLinePrefixSymbol(arg_458_1.text_)

				local var_461_19 = 22
				local var_461_20 = utf8.len(var_461_18)
				local var_461_21 = var_461_19 <= 0 and var_461_15 or var_461_15 * (var_461_20 / var_461_19)

				if var_461_21 > 0 and var_461_15 < var_461_21 then
					arg_458_1.talkMaxDuration = var_461_21

					if var_461_21 + var_461_14 > arg_458_1.duration_ then
						arg_458_1.duration_ = var_461_21 + var_461_14
					end
				end

				arg_458_1.text_.text = var_461_18
				arg_458_1.typewritter.percent = 0

				arg_458_1.typewritter:SetDirty()
				arg_458_1:ShowNextGo(false)
				arg_458_1:RecordContent(arg_458_1.text_.text)
			end

			local var_461_22 = math.max(var_461_15, arg_458_1.talkMaxDuration)

			if var_461_14 <= arg_458_1.time_ and arg_458_1.time_ < var_461_14 + var_461_22 then
				arg_458_1.typewritter.percent = (arg_458_1.time_ - var_461_14) / var_461_22

				arg_458_1.typewritter:SetDirty()
			end

			if arg_458_1.time_ >= var_461_14 + var_461_22 and arg_458_1.time_ < var_461_14 + var_461_22 + arg_461_0 then
				arg_458_1.typewritter.percent = 1

				arg_458_1.typewritter:SetDirty()
				arg_458_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105111 = function(arg_462_0, arg_462_1)
		arg_462_1.time_ = 0
		arg_462_1.frameCnt_ = 0
		arg_462_1.state_ = "playing"
		arg_462_1.curTalkId_ = 1108105111
		arg_462_1.duration_ = 5

		SetActive(arg_462_1.tipsGo_, false)

		function arg_462_1.onSingleLineFinish_()
			arg_462_1.onSingleLineUpdate_ = nil
			arg_462_1.onSingleLineFinish_ = nil
			arg_462_1.state_ = "waiting"
		end

		function arg_462_1.playNext_(arg_464_0)
			if arg_464_0 == 1 then
				arg_462_0:Play1108105112(arg_462_1)
			end
		end

		function arg_462_1.onSingleLineUpdate_(arg_465_0)
			local var_465_0 = arg_462_1.actors_["1081ui_story"].transform
			local var_465_1 = 0

			if var_465_1 < arg_462_1.time_ and arg_462_1.time_ <= var_465_1 + arg_465_0 then
				arg_462_1.var_.moveOldPos1081ui_story = var_465_0.localPosition
			end

			local var_465_2 = 0.001

			if var_465_1 <= arg_462_1.time_ and arg_462_1.time_ < var_465_1 + var_465_2 then
				local var_465_3 = (arg_462_1.time_ - var_465_1) / var_465_2
				local var_465_4 = Vector3.New(0, 100, 0)

				var_465_0.localPosition = Vector3.Lerp(arg_462_1.var_.moveOldPos1081ui_story, var_465_4, var_465_3)

				local var_465_5 = manager.ui.mainCamera.transform.position - var_465_0.position

				var_465_0.forward = Vector3.New(var_465_5.x, var_465_5.y, var_465_5.z)

				local var_465_6 = var_465_0.localEulerAngles

				var_465_6.z = 0
				var_465_6.x = 0
				var_465_0.localEulerAngles = var_465_6
			end

			if arg_462_1.time_ >= var_465_1 + var_465_2 and arg_462_1.time_ < var_465_1 + var_465_2 + arg_465_0 then
				var_465_0.localPosition = Vector3.New(0, 100, 0)

				local var_465_7 = manager.ui.mainCamera.transform.position - var_465_0.position

				var_465_0.forward = Vector3.New(var_465_7.x, var_465_7.y, var_465_7.z)

				local var_465_8 = var_465_0.localEulerAngles

				var_465_8.z = 0
				var_465_8.x = 0
				var_465_0.localEulerAngles = var_465_8
			end

			local var_465_9 = 0
			local var_465_10 = 1.425

			if var_465_9 < arg_462_1.time_ and arg_462_1.time_ <= var_465_9 + arg_465_0 then
				arg_462_1.talkMaxDuration = 0
				arg_462_1.dialogCg_.alpha = 1

				arg_462_1.dialog_:SetActive(true)
				SetActive(arg_462_1.leftNameGo_, false)

				arg_462_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_462_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_462_1:RecordName(arg_462_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_462_1.iconTrs_.gameObject, false)
				arg_462_1.callingController_:SetSelectedState("normal")

				local var_465_11 = arg_462_1:GetWordFromCfg(1108105111)
				local var_465_12 = arg_462_1:FormatText(var_465_11.content)

				arg_462_1.text_.text = var_465_12

				LuaForUtil.ClearLinePrefixSymbol(arg_462_1.text_)

				local var_465_13 = 57
				local var_465_14 = utf8.len(var_465_12)
				local var_465_15 = var_465_13 <= 0 and var_465_10 or var_465_10 * (var_465_14 / var_465_13)

				if var_465_15 > 0 and var_465_10 < var_465_15 then
					arg_462_1.talkMaxDuration = var_465_15

					if var_465_15 + var_465_9 > arg_462_1.duration_ then
						arg_462_1.duration_ = var_465_15 + var_465_9
					end
				end

				arg_462_1.text_.text = var_465_12
				arg_462_1.typewritter.percent = 0

				arg_462_1.typewritter:SetDirty()
				arg_462_1:ShowNextGo(false)
				arg_462_1:RecordContent(arg_462_1.text_.text)
			end

			local var_465_16 = math.max(var_465_10, arg_462_1.talkMaxDuration)

			if var_465_9 <= arg_462_1.time_ and arg_462_1.time_ < var_465_9 + var_465_16 then
				arg_462_1.typewritter.percent = (arg_462_1.time_ - var_465_9) / var_465_16

				arg_462_1.typewritter:SetDirty()
			end

			if arg_462_1.time_ >= var_465_9 + var_465_16 and arg_462_1.time_ < var_465_9 + var_465_16 + arg_465_0 then
				arg_462_1.typewritter.percent = 1

				arg_462_1.typewritter:SetDirty()
				arg_462_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105112 = function(arg_466_0, arg_466_1)
		arg_466_1.time_ = 0
		arg_466_1.frameCnt_ = 0
		arg_466_1.state_ = "playing"
		arg_466_1.curTalkId_ = 1108105112
		arg_466_1.duration_ = 5

		SetActive(arg_466_1.tipsGo_, false)

		function arg_466_1.onSingleLineFinish_()
			arg_466_1.onSingleLineUpdate_ = nil
			arg_466_1.onSingleLineFinish_ = nil
			arg_466_1.state_ = "waiting"
		end

		function arg_466_1.playNext_(arg_468_0)
			if arg_468_0 == 1 then
				arg_466_0:Play1108105113(arg_466_1)
			end
		end

		function arg_466_1.onSingleLineUpdate_(arg_469_0)
			local var_469_0 = 0
			local var_469_1 = 0.2

			if var_469_0 < arg_466_1.time_ and arg_466_1.time_ <= var_469_0 + arg_469_0 then
				arg_466_1.talkMaxDuration = 0
				arg_466_1.dialogCg_.alpha = 1

				arg_466_1.dialog_:SetActive(true)
				SetActive(arg_466_1.leftNameGo_, true)

				local var_469_2 = arg_466_1:FormatText(StoryNameCfg[7].name)

				arg_466_1.leftNameTxt_.text = var_469_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_466_1.leftNameTxt_.transform)

				arg_466_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_466_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_466_1:RecordName(arg_466_1.leftNameTxt_.text)
				SetActive(arg_466_1.iconTrs_.gameObject, false)
				arg_466_1.callingController_:SetSelectedState("normal")

				local var_469_3 = arg_466_1:GetWordFromCfg(1108105112)
				local var_469_4 = arg_466_1:FormatText(var_469_3.content)

				arg_466_1.text_.text = var_469_4

				LuaForUtil.ClearLinePrefixSymbol(arg_466_1.text_)

				local var_469_5 = 8
				local var_469_6 = utf8.len(var_469_4)
				local var_469_7 = var_469_5 <= 0 and var_469_1 or var_469_1 * (var_469_6 / var_469_5)

				if var_469_7 > 0 and var_469_1 < var_469_7 then
					arg_466_1.talkMaxDuration = var_469_7

					if var_469_7 + var_469_0 > arg_466_1.duration_ then
						arg_466_1.duration_ = var_469_7 + var_469_0
					end
				end

				arg_466_1.text_.text = var_469_4
				arg_466_1.typewritter.percent = 0

				arg_466_1.typewritter:SetDirty()
				arg_466_1:ShowNextGo(false)
				arg_466_1:RecordContent(arg_466_1.text_.text)
			end

			local var_469_8 = math.max(var_469_1, arg_466_1.talkMaxDuration)

			if var_469_0 <= arg_466_1.time_ and arg_466_1.time_ < var_469_0 + var_469_8 then
				arg_466_1.typewritter.percent = (arg_466_1.time_ - var_469_0) / var_469_8

				arg_466_1.typewritter:SetDirty()
			end

			if arg_466_1.time_ >= var_469_0 + var_469_8 and arg_466_1.time_ < var_469_0 + var_469_8 + arg_469_0 then
				arg_466_1.typewritter.percent = 1

				arg_466_1.typewritter:SetDirty()
				arg_466_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105113 = function(arg_470_0, arg_470_1)
		arg_470_1.time_ = 0
		arg_470_1.frameCnt_ = 0
		arg_470_1.state_ = "playing"
		arg_470_1.curTalkId_ = 1108105113
		arg_470_1.duration_ = 5

		SetActive(arg_470_1.tipsGo_, false)

		function arg_470_1.onSingleLineFinish_()
			arg_470_1.onSingleLineUpdate_ = nil
			arg_470_1.onSingleLineFinish_ = nil
			arg_470_1.state_ = "waiting"
		end

		function arg_470_1.playNext_(arg_472_0)
			if arg_472_0 == 1 then
				arg_470_0:Play1108105114(arg_470_1)
			end
		end

		function arg_470_1.onSingleLineUpdate_(arg_473_0)
			local var_473_0 = 0
			local var_473_1 = 0.275

			if var_473_0 < arg_470_1.time_ and arg_470_1.time_ <= var_473_0 + arg_473_0 then
				arg_470_1.talkMaxDuration = 0
				arg_470_1.dialogCg_.alpha = 1

				arg_470_1.dialog_:SetActive(true)
				SetActive(arg_470_1.leftNameGo_, true)

				local var_473_2 = arg_470_1:FormatText(StoryNameCfg[7].name)

				arg_470_1.leftNameTxt_.text = var_473_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_470_1.leftNameTxt_.transform)

				arg_470_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_470_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_470_1:RecordName(arg_470_1.leftNameTxt_.text)
				SetActive(arg_470_1.iconTrs_.gameObject, false)
				arg_470_1.callingController_:SetSelectedState("normal")

				local var_473_3 = arg_470_1:GetWordFromCfg(1108105113)
				local var_473_4 = arg_470_1:FormatText(var_473_3.content)

				arg_470_1.text_.text = var_473_4

				LuaForUtil.ClearLinePrefixSymbol(arg_470_1.text_)

				local var_473_5 = 11
				local var_473_6 = utf8.len(var_473_4)
				local var_473_7 = var_473_5 <= 0 and var_473_1 or var_473_1 * (var_473_6 / var_473_5)

				if var_473_7 > 0 and var_473_1 < var_473_7 then
					arg_470_1.talkMaxDuration = var_473_7

					if var_473_7 + var_473_0 > arg_470_1.duration_ then
						arg_470_1.duration_ = var_473_7 + var_473_0
					end
				end

				arg_470_1.text_.text = var_473_4
				arg_470_1.typewritter.percent = 0

				arg_470_1.typewritter:SetDirty()
				arg_470_1:ShowNextGo(false)
				arg_470_1:RecordContent(arg_470_1.text_.text)
			end

			local var_473_8 = math.max(var_473_1, arg_470_1.talkMaxDuration)

			if var_473_0 <= arg_470_1.time_ and arg_470_1.time_ < var_473_0 + var_473_8 then
				arg_470_1.typewritter.percent = (arg_470_1.time_ - var_473_0) / var_473_8

				arg_470_1.typewritter:SetDirty()
			end

			if arg_470_1.time_ >= var_473_0 + var_473_8 and arg_470_1.time_ < var_473_0 + var_473_8 + arg_473_0 then
				arg_470_1.typewritter.percent = 1

				arg_470_1.typewritter:SetDirty()
				arg_470_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105114 = function(arg_474_0, arg_474_1)
		arg_474_1.time_ = 0
		arg_474_1.frameCnt_ = 0
		arg_474_1.state_ = "playing"
		arg_474_1.curTalkId_ = 1108105114
		arg_474_1.duration_ = 5

		SetActive(arg_474_1.tipsGo_, false)

		function arg_474_1.onSingleLineFinish_()
			arg_474_1.onSingleLineUpdate_ = nil
			arg_474_1.onSingleLineFinish_ = nil
			arg_474_1.state_ = "waiting"
		end

		function arg_474_1.playNext_(arg_476_0)
			if arg_476_0 == 1 then
				arg_474_0:Play1108105115(arg_474_1)
			end
		end

		function arg_474_1.onSingleLineUpdate_(arg_477_0)
			local var_477_0 = arg_474_1.actors_["1081ui_story"].transform
			local var_477_1 = 0

			if var_477_1 < arg_474_1.time_ and arg_474_1.time_ <= var_477_1 + arg_477_0 then
				arg_474_1.var_.moveOldPos1081ui_story = var_477_0.localPosition
			end

			local var_477_2 = 0.001

			if var_477_1 <= arg_474_1.time_ and arg_474_1.time_ < var_477_1 + var_477_2 then
				local var_477_3 = (arg_474_1.time_ - var_477_1) / var_477_2
				local var_477_4 = Vector3.New(0, -0.92, -5.8)

				var_477_0.localPosition = Vector3.Lerp(arg_474_1.var_.moveOldPos1081ui_story, var_477_4, var_477_3)

				local var_477_5 = manager.ui.mainCamera.transform.position - var_477_0.position

				var_477_0.forward = Vector3.New(var_477_5.x, var_477_5.y, var_477_5.z)

				local var_477_6 = var_477_0.localEulerAngles

				var_477_6.z = 0
				var_477_6.x = 0
				var_477_0.localEulerAngles = var_477_6
			end

			if arg_474_1.time_ >= var_477_1 + var_477_2 and arg_474_1.time_ < var_477_1 + var_477_2 + arg_477_0 then
				var_477_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_477_7 = manager.ui.mainCamera.transform.position - var_477_0.position

				var_477_0.forward = Vector3.New(var_477_7.x, var_477_7.y, var_477_7.z)

				local var_477_8 = var_477_0.localEulerAngles

				var_477_8.z = 0
				var_477_8.x = 0
				var_477_0.localEulerAngles = var_477_8
			end

			local var_477_9 = arg_474_1.actors_["1081ui_story"]
			local var_477_10 = 0

			if var_477_10 < arg_474_1.time_ and arg_474_1.time_ <= var_477_10 + arg_477_0 and arg_474_1.var_.characterEffect1081ui_story == nil then
				arg_474_1.var_.characterEffect1081ui_story = var_477_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_477_11 = 0.200000002980232

			if var_477_10 <= arg_474_1.time_ and arg_474_1.time_ < var_477_10 + var_477_11 then
				local var_477_12 = (arg_474_1.time_ - var_477_10) / var_477_11

				if arg_474_1.var_.characterEffect1081ui_story then
					arg_474_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_474_1.time_ >= var_477_10 + var_477_11 and arg_474_1.time_ < var_477_10 + var_477_11 + arg_477_0 and arg_474_1.var_.characterEffect1081ui_story then
				arg_474_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_477_13 = 0

			if var_477_13 < arg_474_1.time_ and arg_474_1.time_ <= var_477_13 + arg_477_0 then
				arg_474_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_477_14 = 0

			if var_477_14 < arg_474_1.time_ and arg_474_1.time_ <= var_477_14 + arg_477_0 then
				arg_474_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_477_15 = 0
			local var_477_16 = 0.65

			if var_477_15 < arg_474_1.time_ and arg_474_1.time_ <= var_477_15 + arg_477_0 then
				arg_474_1.talkMaxDuration = 0
				arg_474_1.dialogCg_.alpha = 1

				arg_474_1.dialog_:SetActive(true)
				SetActive(arg_474_1.leftNameGo_, true)

				local var_477_17 = arg_474_1:FormatText(StoryNameCfg[202].name)

				arg_474_1.leftNameTxt_.text = var_477_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_474_1.leftNameTxt_.transform)

				arg_474_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_474_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_474_1:RecordName(arg_474_1.leftNameTxt_.text)
				SetActive(arg_474_1.iconTrs_.gameObject, false)
				arg_474_1.callingController_:SetSelectedState("normal")

				local var_477_18 = arg_474_1:GetWordFromCfg(1108105114)
				local var_477_19 = arg_474_1:FormatText(var_477_18.content)

				arg_474_1.text_.text = var_477_19

				LuaForUtil.ClearLinePrefixSymbol(arg_474_1.text_)

				local var_477_20 = 26
				local var_477_21 = utf8.len(var_477_19)
				local var_477_22 = var_477_20 <= 0 and var_477_16 or var_477_16 * (var_477_21 / var_477_20)

				if var_477_22 > 0 and var_477_16 < var_477_22 then
					arg_474_1.talkMaxDuration = var_477_22

					if var_477_22 + var_477_15 > arg_474_1.duration_ then
						arg_474_1.duration_ = var_477_22 + var_477_15
					end
				end

				arg_474_1.text_.text = var_477_19
				arg_474_1.typewritter.percent = 0

				arg_474_1.typewritter:SetDirty()
				arg_474_1:ShowNextGo(false)
				arg_474_1:RecordContent(arg_474_1.text_.text)
			end

			local var_477_23 = math.max(var_477_16, arg_474_1.talkMaxDuration)

			if var_477_15 <= arg_474_1.time_ and arg_474_1.time_ < var_477_15 + var_477_23 then
				arg_474_1.typewritter.percent = (arg_474_1.time_ - var_477_15) / var_477_23

				arg_474_1.typewritter:SetDirty()
			end

			if arg_474_1.time_ >= var_477_15 + var_477_23 and arg_474_1.time_ < var_477_15 + var_477_23 + arg_477_0 then
				arg_474_1.typewritter.percent = 1

				arg_474_1.typewritter:SetDirty()
				arg_474_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105115 = function(arg_478_0, arg_478_1)
		arg_478_1.time_ = 0
		arg_478_1.frameCnt_ = 0
		arg_478_1.state_ = "playing"
		arg_478_1.curTalkId_ = 1108105115
		arg_478_1.duration_ = 5

		SetActive(arg_478_1.tipsGo_, false)

		function arg_478_1.onSingleLineFinish_()
			arg_478_1.onSingleLineUpdate_ = nil
			arg_478_1.onSingleLineFinish_ = nil
			arg_478_1.state_ = "waiting"
		end

		function arg_478_1.playNext_(arg_480_0)
			if arg_480_0 == 1 then
				arg_478_0:Play1108105116(arg_478_1)
			end
		end

		function arg_478_1.onSingleLineUpdate_(arg_481_0)
			local var_481_0 = arg_478_1.actors_["1081ui_story"].transform
			local var_481_1 = 0

			if var_481_1 < arg_478_1.time_ and arg_478_1.time_ <= var_481_1 + arg_481_0 then
				arg_478_1.var_.moveOldPos1081ui_story = var_481_0.localPosition
			end

			local var_481_2 = 0.001

			if var_481_1 <= arg_478_1.time_ and arg_478_1.time_ < var_481_1 + var_481_2 then
				local var_481_3 = (arg_478_1.time_ - var_481_1) / var_481_2
				local var_481_4 = Vector3.New(0, -0.92, -5.8)

				var_481_0.localPosition = Vector3.Lerp(arg_478_1.var_.moveOldPos1081ui_story, var_481_4, var_481_3)

				local var_481_5 = manager.ui.mainCamera.transform.position - var_481_0.position

				var_481_0.forward = Vector3.New(var_481_5.x, var_481_5.y, var_481_5.z)

				local var_481_6 = var_481_0.localEulerAngles

				var_481_6.z = 0
				var_481_6.x = 0
				var_481_0.localEulerAngles = var_481_6
			end

			if arg_478_1.time_ >= var_481_1 + var_481_2 and arg_478_1.time_ < var_481_1 + var_481_2 + arg_481_0 then
				var_481_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_481_7 = manager.ui.mainCamera.transform.position - var_481_0.position

				var_481_0.forward = Vector3.New(var_481_7.x, var_481_7.y, var_481_7.z)

				local var_481_8 = var_481_0.localEulerAngles

				var_481_8.z = 0
				var_481_8.x = 0
				var_481_0.localEulerAngles = var_481_8
			end

			local var_481_9 = 0
			local var_481_10 = 0.45

			if var_481_9 < arg_478_1.time_ and arg_478_1.time_ <= var_481_9 + arg_481_0 then
				arg_478_1.talkMaxDuration = 0
				arg_478_1.dialogCg_.alpha = 1

				arg_478_1.dialog_:SetActive(true)
				SetActive(arg_478_1.leftNameGo_, true)

				local var_481_11 = arg_478_1:FormatText(StoryNameCfg[202].name)

				arg_478_1.leftNameTxt_.text = var_481_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_478_1.leftNameTxt_.transform)

				arg_478_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_478_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_478_1:RecordName(arg_478_1.leftNameTxt_.text)
				SetActive(arg_478_1.iconTrs_.gameObject, false)
				arg_478_1.callingController_:SetSelectedState("normal")

				local var_481_12 = arg_478_1:GetWordFromCfg(1108105115)
				local var_481_13 = arg_478_1:FormatText(var_481_12.content)

				arg_478_1.text_.text = var_481_13

				LuaForUtil.ClearLinePrefixSymbol(arg_478_1.text_)

				local var_481_14 = 18
				local var_481_15 = utf8.len(var_481_13)
				local var_481_16 = var_481_14 <= 0 and var_481_10 or var_481_10 * (var_481_15 / var_481_14)

				if var_481_16 > 0 and var_481_10 < var_481_16 then
					arg_478_1.talkMaxDuration = var_481_16

					if var_481_16 + var_481_9 > arg_478_1.duration_ then
						arg_478_1.duration_ = var_481_16 + var_481_9
					end
				end

				arg_478_1.text_.text = var_481_13
				arg_478_1.typewritter.percent = 0

				arg_478_1.typewritter:SetDirty()
				arg_478_1:ShowNextGo(false)
				arg_478_1:RecordContent(arg_478_1.text_.text)
			end

			local var_481_17 = math.max(var_481_10, arg_478_1.talkMaxDuration)

			if var_481_9 <= arg_478_1.time_ and arg_478_1.time_ < var_481_9 + var_481_17 then
				arg_478_1.typewritter.percent = (arg_478_1.time_ - var_481_9) / var_481_17

				arg_478_1.typewritter:SetDirty()
			end

			if arg_478_1.time_ >= var_481_9 + var_481_17 and arg_478_1.time_ < var_481_9 + var_481_17 + arg_481_0 then
				arg_478_1.typewritter.percent = 1

				arg_478_1.typewritter:SetDirty()
				arg_478_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105116 = function(arg_482_0, arg_482_1)
		arg_482_1.time_ = 0
		arg_482_1.frameCnt_ = 0
		arg_482_1.state_ = "playing"
		arg_482_1.curTalkId_ = 1108105116
		arg_482_1.duration_ = 5

		SetActive(arg_482_1.tipsGo_, false)

		function arg_482_1.onSingleLineFinish_()
			arg_482_1.onSingleLineUpdate_ = nil
			arg_482_1.onSingleLineFinish_ = nil
			arg_482_1.state_ = "waiting"
		end

		function arg_482_1.playNext_(arg_484_0)
			if arg_484_0 == 1 then
				arg_482_0:Play1108105117(arg_482_1)
			end
		end

		function arg_482_1.onSingleLineUpdate_(arg_485_0)
			local var_485_0 = arg_482_1.actors_["1081ui_story"]
			local var_485_1 = 0

			if var_485_1 < arg_482_1.time_ and arg_482_1.time_ <= var_485_1 + arg_485_0 and arg_482_1.var_.characterEffect1081ui_story == nil then
				arg_482_1.var_.characterEffect1081ui_story = var_485_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_485_2 = 0.200000002980232

			if var_485_1 <= arg_482_1.time_ and arg_482_1.time_ < var_485_1 + var_485_2 then
				local var_485_3 = (arg_482_1.time_ - var_485_1) / var_485_2

				if arg_482_1.var_.characterEffect1081ui_story then
					local var_485_4 = Mathf.Lerp(0, 0.5, var_485_3)

					arg_482_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_482_1.var_.characterEffect1081ui_story.fillRatio = var_485_4
				end
			end

			if arg_482_1.time_ >= var_485_1 + var_485_2 and arg_482_1.time_ < var_485_1 + var_485_2 + arg_485_0 and arg_482_1.var_.characterEffect1081ui_story then
				local var_485_5 = 0.5

				arg_482_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_482_1.var_.characterEffect1081ui_story.fillRatio = var_485_5
			end

			local var_485_6 = 0
			local var_485_7 = 0.725

			if var_485_6 < arg_482_1.time_ and arg_482_1.time_ <= var_485_6 + arg_485_0 then
				arg_482_1.talkMaxDuration = 0
				arg_482_1.dialogCg_.alpha = 1

				arg_482_1.dialog_:SetActive(true)
				SetActive(arg_482_1.leftNameGo_, true)

				local var_485_8 = arg_482_1:FormatText(StoryNameCfg[7].name)

				arg_482_1.leftNameTxt_.text = var_485_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_482_1.leftNameTxt_.transform)

				arg_482_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_482_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_482_1:RecordName(arg_482_1.leftNameTxt_.text)
				SetActive(arg_482_1.iconTrs_.gameObject, false)
				arg_482_1.callingController_:SetSelectedState("normal")

				local var_485_9 = arg_482_1:GetWordFromCfg(1108105116)
				local var_485_10 = arg_482_1:FormatText(var_485_9.content)

				arg_482_1.text_.text = var_485_10

				LuaForUtil.ClearLinePrefixSymbol(arg_482_1.text_)

				local var_485_11 = 29
				local var_485_12 = utf8.len(var_485_10)
				local var_485_13 = var_485_11 <= 0 and var_485_7 or var_485_7 * (var_485_12 / var_485_11)

				if var_485_13 > 0 and var_485_7 < var_485_13 then
					arg_482_1.talkMaxDuration = var_485_13

					if var_485_13 + var_485_6 > arg_482_1.duration_ then
						arg_482_1.duration_ = var_485_13 + var_485_6
					end
				end

				arg_482_1.text_.text = var_485_10
				arg_482_1.typewritter.percent = 0

				arg_482_1.typewritter:SetDirty()
				arg_482_1:ShowNextGo(false)
				arg_482_1:RecordContent(arg_482_1.text_.text)
			end

			local var_485_14 = math.max(var_485_7, arg_482_1.talkMaxDuration)

			if var_485_6 <= arg_482_1.time_ and arg_482_1.time_ < var_485_6 + var_485_14 then
				arg_482_1.typewritter.percent = (arg_482_1.time_ - var_485_6) / var_485_14

				arg_482_1.typewritter:SetDirty()
			end

			if arg_482_1.time_ >= var_485_6 + var_485_14 and arg_482_1.time_ < var_485_6 + var_485_14 + arg_485_0 then
				arg_482_1.typewritter.percent = 1

				arg_482_1.typewritter:SetDirty()
				arg_482_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105117 = function(arg_486_0, arg_486_1)
		arg_486_1.time_ = 0
		arg_486_1.frameCnt_ = 0
		arg_486_1.state_ = "playing"
		arg_486_1.curTalkId_ = 1108105117
		arg_486_1.duration_ = 5

		SetActive(arg_486_1.tipsGo_, false)

		function arg_486_1.onSingleLineFinish_()
			arg_486_1.onSingleLineUpdate_ = nil
			arg_486_1.onSingleLineFinish_ = nil
			arg_486_1.state_ = "waiting"
		end

		function arg_486_1.playNext_(arg_488_0)
			if arg_488_0 == 1 then
				arg_486_0:Play1108105118(arg_486_1)
			end
		end

		function arg_486_1.onSingleLineUpdate_(arg_489_0)
			local var_489_0 = 0

			if var_489_0 < arg_486_1.time_ and arg_486_1.time_ <= var_489_0 + arg_489_0 then
				arg_486_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_489_1 = arg_486_1.actors_["1081ui_story"]
			local var_489_2 = 0

			if var_489_2 < arg_486_1.time_ and arg_486_1.time_ <= var_489_2 + arg_489_0 and arg_486_1.var_.characterEffect1081ui_story == nil then
				arg_486_1.var_.characterEffect1081ui_story = var_489_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_489_3 = 0.200000002980232

			if var_489_2 <= arg_486_1.time_ and arg_486_1.time_ < var_489_2 + var_489_3 then
				local var_489_4 = (arg_486_1.time_ - var_489_2) / var_489_3

				if arg_486_1.var_.characterEffect1081ui_story then
					arg_486_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_486_1.time_ >= var_489_2 + var_489_3 and arg_486_1.time_ < var_489_2 + var_489_3 + arg_489_0 and arg_486_1.var_.characterEffect1081ui_story then
				arg_486_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_489_5 = 0
			local var_489_6 = 0.45

			if var_489_5 < arg_486_1.time_ and arg_486_1.time_ <= var_489_5 + arg_489_0 then
				arg_486_1.talkMaxDuration = 0
				arg_486_1.dialogCg_.alpha = 1

				arg_486_1.dialog_:SetActive(true)
				SetActive(arg_486_1.leftNameGo_, true)

				local var_489_7 = arg_486_1:FormatText(StoryNameCfg[202].name)

				arg_486_1.leftNameTxt_.text = var_489_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_486_1.leftNameTxt_.transform)

				arg_486_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_486_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_486_1:RecordName(arg_486_1.leftNameTxt_.text)
				SetActive(arg_486_1.iconTrs_.gameObject, false)
				arg_486_1.callingController_:SetSelectedState("normal")

				local var_489_8 = arg_486_1:GetWordFromCfg(1108105117)
				local var_489_9 = arg_486_1:FormatText(var_489_8.content)

				arg_486_1.text_.text = var_489_9

				LuaForUtil.ClearLinePrefixSymbol(arg_486_1.text_)

				local var_489_10 = 18
				local var_489_11 = utf8.len(var_489_9)
				local var_489_12 = var_489_10 <= 0 and var_489_6 or var_489_6 * (var_489_11 / var_489_10)

				if var_489_12 > 0 and var_489_6 < var_489_12 then
					arg_486_1.talkMaxDuration = var_489_12

					if var_489_12 + var_489_5 > arg_486_1.duration_ then
						arg_486_1.duration_ = var_489_12 + var_489_5
					end
				end

				arg_486_1.text_.text = var_489_9
				arg_486_1.typewritter.percent = 0

				arg_486_1.typewritter:SetDirty()
				arg_486_1:ShowNextGo(false)
				arg_486_1:RecordContent(arg_486_1.text_.text)
			end

			local var_489_13 = math.max(var_489_6, arg_486_1.talkMaxDuration)

			if var_489_5 <= arg_486_1.time_ and arg_486_1.time_ < var_489_5 + var_489_13 then
				arg_486_1.typewritter.percent = (arg_486_1.time_ - var_489_5) / var_489_13

				arg_486_1.typewritter:SetDirty()
			end

			if arg_486_1.time_ >= var_489_5 + var_489_13 and arg_486_1.time_ < var_489_5 + var_489_13 + arg_489_0 then
				arg_486_1.typewritter.percent = 1

				arg_486_1.typewritter:SetDirty()
				arg_486_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105118 = function(arg_490_0, arg_490_1)
		arg_490_1.time_ = 0
		arg_490_1.frameCnt_ = 0
		arg_490_1.state_ = "playing"
		arg_490_1.curTalkId_ = 1108105118
		arg_490_1.duration_ = 7

		SetActive(arg_490_1.tipsGo_, false)

		function arg_490_1.onSingleLineFinish_()
			arg_490_1.onSingleLineUpdate_ = nil
			arg_490_1.onSingleLineFinish_ = nil
			arg_490_1.state_ = "waiting"
		end

		function arg_490_1.playNext_(arg_492_0)
			if arg_492_0 == 1 then
				arg_490_0:Play1108105119(arg_490_1)
			end
		end

		function arg_490_1.onSingleLineUpdate_(arg_493_0)
			local var_493_0 = arg_490_1.actors_["1081ui_story"].transform
			local var_493_1 = 0

			if var_493_1 < arg_490_1.time_ and arg_490_1.time_ <= var_493_1 + arg_493_0 then
				arg_490_1.var_.moveOldPos1081ui_story = var_493_0.localPosition
			end

			local var_493_2 = 0.001

			if var_493_1 <= arg_490_1.time_ and arg_490_1.time_ < var_493_1 + var_493_2 then
				local var_493_3 = (arg_490_1.time_ - var_493_1) / var_493_2
				local var_493_4 = Vector3.New(0, 100, 0)

				var_493_0.localPosition = Vector3.Lerp(arg_490_1.var_.moveOldPos1081ui_story, var_493_4, var_493_3)

				local var_493_5 = manager.ui.mainCamera.transform.position - var_493_0.position

				var_493_0.forward = Vector3.New(var_493_5.x, var_493_5.y, var_493_5.z)

				local var_493_6 = var_493_0.localEulerAngles

				var_493_6.z = 0
				var_493_6.x = 0
				var_493_0.localEulerAngles = var_493_6
			end

			if arg_490_1.time_ >= var_493_1 + var_493_2 and arg_490_1.time_ < var_493_1 + var_493_2 + arg_493_0 then
				var_493_0.localPosition = Vector3.New(0, 100, 0)

				local var_493_7 = manager.ui.mainCamera.transform.position - var_493_0.position

				var_493_0.forward = Vector3.New(var_493_7.x, var_493_7.y, var_493_7.z)

				local var_493_8 = var_493_0.localEulerAngles

				var_493_8.z = 0
				var_493_8.x = 0
				var_493_0.localEulerAngles = var_493_8
			end

			local var_493_9 = 0

			if var_493_9 < arg_490_1.time_ and arg_490_1.time_ <= var_493_9 + arg_493_0 then
				arg_490_1.allBtn_.enabled = false
			end

			local var_493_10 = 1.23333333333333

			if arg_490_1.time_ >= var_493_9 + var_493_10 and arg_490_1.time_ < var_493_9 + var_493_10 + arg_493_0 then
				arg_490_1.allBtn_.enabled = true
			end

			local var_493_11 = arg_490_1.actors_.ST0402a
			local var_493_12 = 0

			if var_493_12 < arg_490_1.time_ and arg_490_1.time_ <= var_493_12 + arg_493_0 then
				local var_493_13 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_493_13 then
					var_493_13.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_493_13.radialBlurScale = 0
					var_493_13.radialBlurGradient = 1
					var_493_13.radialBlurIntensity = 1

					if var_493_11 then
						var_493_13.radialBlurTarget = var_493_11.transform
					end
				end
			end

			local var_493_14 = 1.23333333333333

			if var_493_12 <= arg_490_1.time_ and arg_490_1.time_ < var_493_12 + var_493_14 then
				local var_493_15 = (arg_490_1.time_ - var_493_12) / var_493_14
				local var_493_16 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_493_16 then
					var_493_16.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_493_16.radialBlurScale = Mathf.Lerp(0, 0, var_493_15)
					var_493_16.radialBlurGradient = Mathf.Lerp(1, 1, var_493_15)
					var_493_16.radialBlurIntensity = Mathf.Lerp(1, 1, var_493_15)
				end
			end

			if arg_490_1.time_ >= var_493_12 + var_493_14 and arg_490_1.time_ < var_493_12 + var_493_14 + arg_493_0 then
				local var_493_17 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_493_17 then
					var_493_17.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_493_17.radialBlurScale = 0
					var_493_17.radialBlurGradient = 1
					var_493_17.radialBlurIntensity = 1
				end
			end

			local var_493_18 = 0

			if var_493_18 < arg_490_1.time_ and arg_490_1.time_ <= var_493_18 + arg_493_0 then
				arg_490_1.mask_.enabled = true
				arg_490_1.mask_.raycastTarget = true

				arg_490_1:SetGaussion(false)
			end

			local var_493_19 = 2

			if var_493_18 <= arg_490_1.time_ and arg_490_1.time_ < var_493_18 + var_493_19 then
				local var_493_20 = (arg_490_1.time_ - var_493_18) / var_493_19
				local var_493_21 = Color.New(1, 1, 1)

				var_493_21.a = Mathf.Lerp(1, 0, var_493_20)
				arg_490_1.mask_.color = var_493_21
			end

			if arg_490_1.time_ >= var_493_18 + var_493_19 and arg_490_1.time_ < var_493_18 + var_493_19 + arg_493_0 then
				local var_493_22 = Color.New(1, 1, 1)
				local var_493_23 = 0

				arg_490_1.mask_.enabled = false
				var_493_22.a = var_493_23
				arg_490_1.mask_.color = var_493_22
			end

			if arg_490_1.frameCnt_ <= 1 then
				arg_490_1.dialog_:SetActive(false)
			end

			local var_493_24 = 2
			local var_493_25 = 1.175

			if var_493_24 < arg_490_1.time_ and arg_490_1.time_ <= var_493_24 + arg_493_0 then
				arg_490_1.talkMaxDuration = 0

				arg_490_1.dialog_:SetActive(true)

				local var_493_26 = LeanTween.value(arg_490_1.dialog_, 0, 1, 0.3)

				var_493_26:setOnUpdate(LuaHelper.FloatAction(function(arg_494_0)
					arg_490_1.dialogCg_.alpha = arg_494_0
				end))
				var_493_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_490_1.dialog_)
					var_493_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_490_1.duration_ = arg_490_1.duration_ + 0.3

				SetActive(arg_490_1.leftNameGo_, false)

				arg_490_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_490_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_490_1:RecordName(arg_490_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_490_1.iconTrs_.gameObject, false)
				arg_490_1.callingController_:SetSelectedState("normal")

				local var_493_27 = arg_490_1:GetWordFromCfg(1108105118)
				local var_493_28 = arg_490_1:FormatText(var_493_27.content)

				arg_490_1.text_.text = var_493_28

				LuaForUtil.ClearLinePrefixSymbol(arg_490_1.text_)

				local var_493_29 = 47
				local var_493_30 = utf8.len(var_493_28)
				local var_493_31 = var_493_29 <= 0 and var_493_25 or var_493_25 * (var_493_30 / var_493_29)

				if var_493_31 > 0 and var_493_25 < var_493_31 then
					arg_490_1.talkMaxDuration = var_493_31
					var_493_24 = var_493_24 + 0.3

					if var_493_31 + var_493_24 > arg_490_1.duration_ then
						arg_490_1.duration_ = var_493_31 + var_493_24
					end
				end

				arg_490_1.text_.text = var_493_28
				arg_490_1.typewritter.percent = 0

				arg_490_1.typewritter:SetDirty()
				arg_490_1:ShowNextGo(false)
				arg_490_1:RecordContent(arg_490_1.text_.text)
			end

			local var_493_32 = var_493_24 + 0.3
			local var_493_33 = math.max(var_493_25, arg_490_1.talkMaxDuration)

			if var_493_32 <= arg_490_1.time_ and arg_490_1.time_ < var_493_32 + var_493_33 then
				arg_490_1.typewritter.percent = (arg_490_1.time_ - var_493_32) / var_493_33

				arg_490_1.typewritter:SetDirty()
			end

			if arg_490_1.time_ >= var_493_32 + var_493_33 and arg_490_1.time_ < var_493_32 + var_493_33 + arg_493_0 then
				arg_490_1.typewritter.percent = 1

				arg_490_1.typewritter:SetDirty()
				arg_490_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105119 = function(arg_496_0, arg_496_1)
		arg_496_1.time_ = 0
		arg_496_1.frameCnt_ = 0
		arg_496_1.state_ = "playing"
		arg_496_1.curTalkId_ = 1108105119
		arg_496_1.duration_ = 5

		SetActive(arg_496_1.tipsGo_, false)

		function arg_496_1.onSingleLineFinish_()
			arg_496_1.onSingleLineUpdate_ = nil
			arg_496_1.onSingleLineFinish_ = nil
			arg_496_1.state_ = "waiting"
		end

		function arg_496_1.playNext_(arg_498_0)
			if arg_498_0 == 1 then
				arg_496_0:Play1108105120(arg_496_1)
			end
		end

		function arg_496_1.onSingleLineUpdate_(arg_499_0)
			local var_499_0 = 0
			local var_499_1 = 0.55

			if var_499_0 < arg_496_1.time_ and arg_496_1.time_ <= var_499_0 + arg_499_0 then
				arg_496_1.talkMaxDuration = 0
				arg_496_1.dialogCg_.alpha = 1

				arg_496_1.dialog_:SetActive(true)
				SetActive(arg_496_1.leftNameGo_, true)

				local var_499_2 = arg_496_1:FormatText(StoryNameCfg[202].name)

				arg_496_1.leftNameTxt_.text = var_499_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_496_1.leftNameTxt_.transform)

				arg_496_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_496_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_496_1:RecordName(arg_496_1.leftNameTxt_.text)
				SetActive(arg_496_1.iconTrs_.gameObject, true)
				arg_496_1.iconController_:SetSelectedState("hero")

				arg_496_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_496_1.callingController_:SetSelectedState("normal")

				arg_496_1.keyicon_.color = Color.New(1, 1, 1)
				arg_496_1.icon_.color = Color.New(1, 1, 1)

				local var_499_3 = arg_496_1:GetWordFromCfg(1108105119)
				local var_499_4 = arg_496_1:FormatText(var_499_3.content)

				arg_496_1.text_.text = var_499_4

				LuaForUtil.ClearLinePrefixSymbol(arg_496_1.text_)

				local var_499_5 = 22
				local var_499_6 = utf8.len(var_499_4)
				local var_499_7 = var_499_5 <= 0 and var_499_1 or var_499_1 * (var_499_6 / var_499_5)

				if var_499_7 > 0 and var_499_1 < var_499_7 then
					arg_496_1.talkMaxDuration = var_499_7

					if var_499_7 + var_499_0 > arg_496_1.duration_ then
						arg_496_1.duration_ = var_499_7 + var_499_0
					end
				end

				arg_496_1.text_.text = var_499_4
				arg_496_1.typewritter.percent = 0

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(false)
				arg_496_1:RecordContent(arg_496_1.text_.text)
			end

			local var_499_8 = math.max(var_499_1, arg_496_1.talkMaxDuration)

			if var_499_0 <= arg_496_1.time_ and arg_496_1.time_ < var_499_0 + var_499_8 then
				arg_496_1.typewritter.percent = (arg_496_1.time_ - var_499_0) / var_499_8

				arg_496_1.typewritter:SetDirty()
			end

			if arg_496_1.time_ >= var_499_0 + var_499_8 and arg_496_1.time_ < var_499_0 + var_499_8 + arg_499_0 then
				arg_496_1.typewritter.percent = 1

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105120 = function(arg_500_0, arg_500_1)
		arg_500_1.time_ = 0
		arg_500_1.frameCnt_ = 0
		arg_500_1.state_ = "playing"
		arg_500_1.curTalkId_ = 1108105120
		arg_500_1.duration_ = 5.63

		SetActive(arg_500_1.tipsGo_, false)

		function arg_500_1.onSingleLineFinish_()
			arg_500_1.onSingleLineUpdate_ = nil
			arg_500_1.onSingleLineFinish_ = nil
			arg_500_1.state_ = "waiting"
		end

		function arg_500_1.playNext_(arg_502_0)
			if arg_502_0 == 1 then
				arg_500_0:Play1108105121(arg_500_1)
			end
		end

		function arg_500_1.onSingleLineUpdate_(arg_503_0)
			local var_503_0 = arg_500_1.actors_["1081ui_story"].transform
			local var_503_1 = 0

			if var_503_1 < arg_500_1.time_ and arg_500_1.time_ <= var_503_1 + arg_503_0 then
				arg_500_1.var_.moveOldPos1081ui_story = var_503_0.localPosition
			end

			local var_503_2 = 0.001

			if var_503_1 <= arg_500_1.time_ and arg_500_1.time_ < var_503_1 + var_503_2 then
				local var_503_3 = (arg_500_1.time_ - var_503_1) / var_503_2
				local var_503_4 = Vector3.New(0, 100, 0)

				var_503_0.localPosition = Vector3.Lerp(arg_500_1.var_.moveOldPos1081ui_story, var_503_4, var_503_3)

				local var_503_5 = manager.ui.mainCamera.transform.position - var_503_0.position

				var_503_0.forward = Vector3.New(var_503_5.x, var_503_5.y, var_503_5.z)

				local var_503_6 = var_503_0.localEulerAngles

				var_503_6.z = 0
				var_503_6.x = 0
				var_503_0.localEulerAngles = var_503_6
			end

			if arg_500_1.time_ >= var_503_1 + var_503_2 and arg_500_1.time_ < var_503_1 + var_503_2 + arg_503_0 then
				var_503_0.localPosition = Vector3.New(0, 100, 0)

				local var_503_7 = manager.ui.mainCamera.transform.position - var_503_0.position

				var_503_0.forward = Vector3.New(var_503_7.x, var_503_7.y, var_503_7.z)

				local var_503_8 = var_503_0.localEulerAngles

				var_503_8.z = 0
				var_503_8.x = 0
				var_503_0.localEulerAngles = var_503_8
			end

			if arg_500_1.frameCnt_ <= 1 then
				arg_500_1.dialog_:SetActive(false)
			end

			local var_503_9 = 0.633333333333333
			local var_503_10 = 0.7

			if var_503_9 < arg_500_1.time_ and arg_500_1.time_ <= var_503_9 + arg_503_0 then
				arg_500_1.talkMaxDuration = 0

				arg_500_1.dialog_:SetActive(true)

				local var_503_11 = LeanTween.value(arg_500_1.dialog_, 0, 1, 0.3)

				var_503_11:setOnUpdate(LuaHelper.FloatAction(function(arg_504_0)
					arg_500_1.dialogCg_.alpha = arg_504_0
				end))
				var_503_11:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_500_1.dialog_)
					var_503_11:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_500_1.duration_ = arg_500_1.duration_ + 0.3

				SetActive(arg_500_1.leftNameGo_, true)

				local var_503_12 = arg_500_1:FormatText(StoryNameCfg[202].name)

				arg_500_1.leftNameTxt_.text = var_503_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_500_1.leftNameTxt_.transform)

				arg_500_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_500_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_500_1:RecordName(arg_500_1.leftNameTxt_.text)
				SetActive(arg_500_1.iconTrs_.gameObject, true)
				arg_500_1.iconController_:SetSelectedState("hero")

				arg_500_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_500_1.callingController_:SetSelectedState("normal")

				arg_500_1.keyicon_.color = Color.New(1, 1, 1)
				arg_500_1.icon_.color = Color.New(1, 1, 1)

				local var_503_13 = arg_500_1:GetWordFromCfg(1108105120)
				local var_503_14 = arg_500_1:FormatText(var_503_13.content)

				arg_500_1.text_.text = var_503_14

				LuaForUtil.ClearLinePrefixSymbol(arg_500_1.text_)

				local var_503_15 = 28
				local var_503_16 = utf8.len(var_503_14)
				local var_503_17 = var_503_15 <= 0 and var_503_10 or var_503_10 * (var_503_16 / var_503_15)

				if var_503_17 > 0 and var_503_10 < var_503_17 then
					arg_500_1.talkMaxDuration = var_503_17
					var_503_9 = var_503_9 + 0.3

					if var_503_17 + var_503_9 > arg_500_1.duration_ then
						arg_500_1.duration_ = var_503_17 + var_503_9
					end
				end

				arg_500_1.text_.text = var_503_14
				arg_500_1.typewritter.percent = 0

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(false)
				arg_500_1:RecordContent(arg_500_1.text_.text)
			end

			local var_503_18 = var_503_9 + 0.3
			local var_503_19 = math.max(var_503_10, arg_500_1.talkMaxDuration)

			if var_503_18 <= arg_500_1.time_ and arg_500_1.time_ < var_503_18 + var_503_19 then
				arg_500_1.typewritter.percent = (arg_500_1.time_ - var_503_18) / var_503_19

				arg_500_1.typewritter:SetDirty()
			end

			if arg_500_1.time_ >= var_503_18 + var_503_19 and arg_500_1.time_ < var_503_18 + var_503_19 + arg_503_0 then
				arg_500_1.typewritter.percent = 1

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105121 = function(arg_506_0, arg_506_1)
		arg_506_1.time_ = 0
		arg_506_1.frameCnt_ = 0
		arg_506_1.state_ = "playing"
		arg_506_1.curTalkId_ = 1108105121
		arg_506_1.duration_ = 7.73

		SetActive(arg_506_1.tipsGo_, false)

		function arg_506_1.onSingleLineFinish_()
			arg_506_1.onSingleLineUpdate_ = nil
			arg_506_1.onSingleLineFinish_ = nil
			arg_506_1.state_ = "waiting"
		end

		function arg_506_1.playNext_(arg_508_0)
			if arg_508_0 == 1 then
				arg_506_0:Play1108105122(arg_506_1)
			end
		end

		function arg_506_1.onSingleLineUpdate_(arg_509_0)
			local var_509_0 = 1.05

			if var_509_0 < arg_506_1.time_ and arg_506_1.time_ <= var_509_0 + arg_509_0 then
				local var_509_1 = manager.ui.mainCamera.transform.localPosition
				local var_509_2 = Vector3.New(0, 0, 10) + Vector3.New(var_509_1.x, var_509_1.y, 0)
				local var_509_3 = arg_506_1.bgs_.ST0402a

				var_509_3.transform.localPosition = var_509_2
				var_509_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_509_4 = var_509_3:GetComponent("SpriteRenderer")

				if var_509_4 and var_509_4.sprite then
					local var_509_5 = (var_509_3.transform.localPosition - var_509_1).z
					local var_509_6 = manager.ui.mainCameraCom_
					local var_509_7 = 2 * var_509_5 * Mathf.Tan(var_509_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_509_8 = var_509_7 * var_509_6.aspect
					local var_509_9 = var_509_4.sprite.bounds.size.x
					local var_509_10 = var_509_4.sprite.bounds.size.y
					local var_509_11 = var_509_8 / var_509_9
					local var_509_12 = var_509_7 / var_509_10
					local var_509_13 = var_509_12 < var_509_11 and var_509_11 or var_509_12

					var_509_3.transform.localScale = Vector3.New(var_509_13, var_509_13, 0)
				end

				for iter_509_0, iter_509_1 in pairs(arg_506_1.bgs_) do
					if iter_509_0 ~= "ST0402a" then
						iter_509_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_509_14 = 0

			if var_509_14 < arg_506_1.time_ and arg_506_1.time_ <= var_509_14 + arg_509_0 then
				arg_506_1.allBtn_.enabled = false
			end

			local var_509_15 = 0.3

			if arg_506_1.time_ >= var_509_14 + var_509_15 and arg_506_1.time_ < var_509_14 + var_509_15 + arg_509_0 then
				arg_506_1.allBtn_.enabled = true
			end

			local var_509_16 = 0

			if var_509_16 < arg_506_1.time_ and arg_506_1.time_ <= var_509_16 + arg_509_0 then
				arg_506_1.mask_.enabled = true
				arg_506_1.mask_.raycastTarget = true

				arg_506_1:SetGaussion(false)
			end

			local var_509_17 = 1.05

			if var_509_16 <= arg_506_1.time_ and arg_506_1.time_ < var_509_16 + var_509_17 then
				local var_509_18 = (arg_506_1.time_ - var_509_16) / var_509_17
				local var_509_19 = Color.New(1, 1, 1)

				var_509_19.a = Mathf.Lerp(0, 1, var_509_18)
				arg_506_1.mask_.color = var_509_19
			end

			if arg_506_1.time_ >= var_509_16 + var_509_17 and arg_506_1.time_ < var_509_16 + var_509_17 + arg_509_0 then
				local var_509_20 = Color.New(1, 1, 1)

				var_509_20.a = 1
				arg_506_1.mask_.color = var_509_20
			end

			local var_509_21 = 1.05

			if var_509_21 < arg_506_1.time_ and arg_506_1.time_ <= var_509_21 + arg_509_0 then
				arg_506_1.mask_.enabled = true
				arg_506_1.mask_.raycastTarget = true

				arg_506_1:SetGaussion(false)
			end

			local var_509_22 = 2.01666666666667

			if var_509_21 <= arg_506_1.time_ and arg_506_1.time_ < var_509_21 + var_509_22 then
				local var_509_23 = (arg_506_1.time_ - var_509_21) / var_509_22
				local var_509_24 = Color.New(1, 1, 1)

				var_509_24.a = Mathf.Lerp(1, 0, var_509_23)
				arg_506_1.mask_.color = var_509_24
			end

			if arg_506_1.time_ >= var_509_21 + var_509_22 and arg_506_1.time_ < var_509_21 + var_509_22 + arg_509_0 then
				local var_509_25 = Color.New(1, 1, 1)
				local var_509_26 = 0

				arg_506_1.mask_.enabled = false
				var_509_25.a = var_509_26
				arg_506_1.mask_.color = var_509_25
			end

			local var_509_27 = arg_506_1.actors_["1081ui_story"].transform
			local var_509_28 = 1.01599999815226

			if var_509_28 < arg_506_1.time_ and arg_506_1.time_ <= var_509_28 + arg_509_0 then
				arg_506_1.var_.moveOldPos1081ui_story = var_509_27.localPosition
			end

			local var_509_29 = 0.001

			if var_509_28 <= arg_506_1.time_ and arg_506_1.time_ < var_509_28 + var_509_29 then
				local var_509_30 = (arg_506_1.time_ - var_509_28) / var_509_29
				local var_509_31 = Vector3.New(0, 100, 0)

				var_509_27.localPosition = Vector3.Lerp(arg_506_1.var_.moveOldPos1081ui_story, var_509_31, var_509_30)

				local var_509_32 = manager.ui.mainCamera.transform.position - var_509_27.position

				var_509_27.forward = Vector3.New(var_509_32.x, var_509_32.y, var_509_32.z)

				local var_509_33 = var_509_27.localEulerAngles

				var_509_33.z = 0
				var_509_33.x = 0
				var_509_27.localEulerAngles = var_509_33
			end

			if arg_506_1.time_ >= var_509_28 + var_509_29 and arg_506_1.time_ < var_509_28 + var_509_29 + arg_509_0 then
				var_509_27.localPosition = Vector3.New(0, 100, 0)

				local var_509_34 = manager.ui.mainCamera.transform.position - var_509_27.position

				var_509_27.forward = Vector3.New(var_509_34.x, var_509_34.y, var_509_34.z)

				local var_509_35 = var_509_27.localEulerAngles

				var_509_35.z = 0
				var_509_35.x = 0
				var_509_27.localEulerAngles = var_509_35
			end

			local var_509_36 = 1.01599999815226

			if var_509_36 < arg_506_1.time_ and arg_506_1.time_ <= var_509_36 + arg_509_0 then
				arg_506_1.allBtn_.enabled = false
			end

			local var_509_37 = 1.23333333333333

			if arg_506_1.time_ >= var_509_36 + var_509_37 and arg_506_1.time_ < var_509_36 + var_509_37 + arg_509_0 then
				arg_506_1.allBtn_.enabled = true
			end

			local var_509_38 = arg_506_1.actors_.ST0402a
			local var_509_39 = 1.01599999815226

			if var_509_39 < arg_506_1.time_ and arg_506_1.time_ <= var_509_39 + arg_509_0 then
				local var_509_40 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_509_40 then
					var_509_40.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_509_40.radialBlurScale = 0
					var_509_40.radialBlurGradient = 0
					var_509_40.radialBlurIntensity = 0

					if var_509_38 then
						var_509_40.radialBlurTarget = var_509_38.transform
					end
				end
			end

			local var_509_41 = 1.23333333333333

			if var_509_39 <= arg_506_1.time_ and arg_506_1.time_ < var_509_39 + var_509_41 then
				local var_509_42 = (arg_506_1.time_ - var_509_39) / var_509_41
				local var_509_43 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_509_43 then
					var_509_43.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_509_43.radialBlurScale = Mathf.Lerp(0, 0, var_509_42)
					var_509_43.radialBlurGradient = Mathf.Lerp(0, 0, var_509_42)
					var_509_43.radialBlurIntensity = Mathf.Lerp(0, 0, var_509_42)
				end
			end

			if arg_506_1.time_ >= var_509_39 + var_509_41 and arg_506_1.time_ < var_509_39 + var_509_41 + arg_509_0 then
				local var_509_44 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_509_44 then
					var_509_44.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_509_44.radialBlurScale = 0
					var_509_44.radialBlurGradient = 0
					var_509_44.radialBlurIntensity = 0
				end
			end

			if arg_506_1.frameCnt_ <= 1 then
				arg_506_1.dialog_:SetActive(false)
			end

			local var_509_45 = 2.73333333333333
			local var_509_46 = 1.05

			if var_509_45 < arg_506_1.time_ and arg_506_1.time_ <= var_509_45 + arg_509_0 then
				arg_506_1.talkMaxDuration = 0

				arg_506_1.dialog_:SetActive(true)

				local var_509_47 = LeanTween.value(arg_506_1.dialog_, 0, 1, 0.3)

				var_509_47:setOnUpdate(LuaHelper.FloatAction(function(arg_510_0)
					arg_506_1.dialogCg_.alpha = arg_510_0
				end))
				var_509_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_506_1.dialog_)
					var_509_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_506_1.duration_ = arg_506_1.duration_ + 0.3

				SetActive(arg_506_1.leftNameGo_, false)

				arg_506_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_506_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_506_1:RecordName(arg_506_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_506_1.iconTrs_.gameObject, false)
				arg_506_1.callingController_:SetSelectedState("normal")

				local var_509_48 = arg_506_1:GetWordFromCfg(1108105121)
				local var_509_49 = arg_506_1:FormatText(var_509_48.content)

				arg_506_1.text_.text = var_509_49

				LuaForUtil.ClearLinePrefixSymbol(arg_506_1.text_)

				local var_509_50 = 42
				local var_509_51 = utf8.len(var_509_49)
				local var_509_52 = var_509_50 <= 0 and var_509_46 or var_509_46 * (var_509_51 / var_509_50)

				if var_509_52 > 0 and var_509_46 < var_509_52 then
					arg_506_1.talkMaxDuration = var_509_52
					var_509_45 = var_509_45 + 0.3

					if var_509_52 + var_509_45 > arg_506_1.duration_ then
						arg_506_1.duration_ = var_509_52 + var_509_45
					end
				end

				arg_506_1.text_.text = var_509_49
				arg_506_1.typewritter.percent = 0

				arg_506_1.typewritter:SetDirty()
				arg_506_1:ShowNextGo(false)
				arg_506_1:RecordContent(arg_506_1.text_.text)
			end

			local var_509_53 = var_509_45 + 0.3
			local var_509_54 = math.max(var_509_46, arg_506_1.talkMaxDuration)

			if var_509_53 <= arg_506_1.time_ and arg_506_1.time_ < var_509_53 + var_509_54 then
				arg_506_1.typewritter.percent = (arg_506_1.time_ - var_509_53) / var_509_54

				arg_506_1.typewritter:SetDirty()
			end

			if arg_506_1.time_ >= var_509_53 + var_509_54 and arg_506_1.time_ < var_509_53 + var_509_54 + arg_509_0 then
				arg_506_1.typewritter.percent = 1

				arg_506_1.typewritter:SetDirty()
				arg_506_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105122 = function(arg_512_0, arg_512_1)
		arg_512_1.time_ = 0
		arg_512_1.frameCnt_ = 0
		arg_512_1.state_ = "playing"
		arg_512_1.curTalkId_ = 1108105122
		arg_512_1.duration_ = 5

		SetActive(arg_512_1.tipsGo_, false)

		function arg_512_1.onSingleLineFinish_()
			arg_512_1.onSingleLineUpdate_ = nil
			arg_512_1.onSingleLineFinish_ = nil
			arg_512_1.state_ = "waiting"
		end

		function arg_512_1.playNext_(arg_514_0)
			if arg_514_0 == 1 then
				arg_512_0:Play1108105123(arg_512_1)
			end
		end

		function arg_512_1.onSingleLineUpdate_(arg_515_0)
			local var_515_0 = 0
			local var_515_1 = 0.25

			if var_515_0 < arg_512_1.time_ and arg_512_1.time_ <= var_515_0 + arg_515_0 then
				arg_512_1.talkMaxDuration = 0
				arg_512_1.dialogCg_.alpha = 1

				arg_512_1.dialog_:SetActive(true)
				SetActive(arg_512_1.leftNameGo_, true)

				local var_515_2 = arg_512_1:FormatText(StoryNameCfg[7].name)

				arg_512_1.leftNameTxt_.text = var_515_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_512_1.leftNameTxt_.transform)

				arg_512_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_512_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_512_1:RecordName(arg_512_1.leftNameTxt_.text)
				SetActive(arg_512_1.iconTrs_.gameObject, false)
				arg_512_1.callingController_:SetSelectedState("normal")

				local var_515_3 = arg_512_1:GetWordFromCfg(1108105122)
				local var_515_4 = arg_512_1:FormatText(var_515_3.content)

				arg_512_1.text_.text = var_515_4

				LuaForUtil.ClearLinePrefixSymbol(arg_512_1.text_)

				local var_515_5 = 10
				local var_515_6 = utf8.len(var_515_4)
				local var_515_7 = var_515_5 <= 0 and var_515_1 or var_515_1 * (var_515_6 / var_515_5)

				if var_515_7 > 0 and var_515_1 < var_515_7 then
					arg_512_1.talkMaxDuration = var_515_7

					if var_515_7 + var_515_0 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_7 + var_515_0
					end
				end

				arg_512_1.text_.text = var_515_4
				arg_512_1.typewritter.percent = 0

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(false)
				arg_512_1:RecordContent(arg_512_1.text_.text)
			end

			local var_515_8 = math.max(var_515_1, arg_512_1.talkMaxDuration)

			if var_515_0 <= arg_512_1.time_ and arg_512_1.time_ < var_515_0 + var_515_8 then
				arg_512_1.typewritter.percent = (arg_512_1.time_ - var_515_0) / var_515_8

				arg_512_1.typewritter:SetDirty()
			end

			if arg_512_1.time_ >= var_515_0 + var_515_8 and arg_512_1.time_ < var_515_0 + var_515_8 + arg_515_0 then
				arg_512_1.typewritter.percent = 1

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105123 = function(arg_516_0, arg_516_1)
		arg_516_1.time_ = 0
		arg_516_1.frameCnt_ = 0
		arg_516_1.state_ = "playing"
		arg_516_1.curTalkId_ = 1108105123
		arg_516_1.duration_ = 5

		SetActive(arg_516_1.tipsGo_, false)

		function arg_516_1.onSingleLineFinish_()
			arg_516_1.onSingleLineUpdate_ = nil
			arg_516_1.onSingleLineFinish_ = nil
			arg_516_1.state_ = "waiting"
		end

		function arg_516_1.playNext_(arg_518_0)
			if arg_518_0 == 1 then
				arg_516_0:Play1108105124(arg_516_1)
			end
		end

		function arg_516_1.onSingleLineUpdate_(arg_519_0)
			local var_519_0 = arg_516_1.actors_["1081ui_story"].transform
			local var_519_1 = 0

			if var_519_1 < arg_516_1.time_ and arg_516_1.time_ <= var_519_1 + arg_519_0 then
				arg_516_1.var_.moveOldPos1081ui_story = var_519_0.localPosition
			end

			local var_519_2 = 0.001

			if var_519_1 <= arg_516_1.time_ and arg_516_1.time_ < var_519_1 + var_519_2 then
				local var_519_3 = (arg_516_1.time_ - var_519_1) / var_519_2
				local var_519_4 = Vector3.New(0, -0.92, -5.8)

				var_519_0.localPosition = Vector3.Lerp(arg_516_1.var_.moveOldPos1081ui_story, var_519_4, var_519_3)

				local var_519_5 = manager.ui.mainCamera.transform.position - var_519_0.position

				var_519_0.forward = Vector3.New(var_519_5.x, var_519_5.y, var_519_5.z)

				local var_519_6 = var_519_0.localEulerAngles

				var_519_6.z = 0
				var_519_6.x = 0
				var_519_0.localEulerAngles = var_519_6
			end

			if arg_516_1.time_ >= var_519_1 + var_519_2 and arg_516_1.time_ < var_519_1 + var_519_2 + arg_519_0 then
				var_519_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_519_7 = manager.ui.mainCamera.transform.position - var_519_0.position

				var_519_0.forward = Vector3.New(var_519_7.x, var_519_7.y, var_519_7.z)

				local var_519_8 = var_519_0.localEulerAngles

				var_519_8.z = 0
				var_519_8.x = 0
				var_519_0.localEulerAngles = var_519_8
			end

			local var_519_9 = arg_516_1.actors_["1081ui_story"]
			local var_519_10 = 0

			if var_519_10 < arg_516_1.time_ and arg_516_1.time_ <= var_519_10 + arg_519_0 and arg_516_1.var_.characterEffect1081ui_story == nil then
				arg_516_1.var_.characterEffect1081ui_story = var_519_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_519_11 = 0.200000002980232

			if var_519_10 <= arg_516_1.time_ and arg_516_1.time_ < var_519_10 + var_519_11 then
				local var_519_12 = (arg_516_1.time_ - var_519_10) / var_519_11

				if arg_516_1.var_.characterEffect1081ui_story then
					arg_516_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_516_1.time_ >= var_519_10 + var_519_11 and arg_516_1.time_ < var_519_10 + var_519_11 + arg_519_0 and arg_516_1.var_.characterEffect1081ui_story then
				arg_516_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_519_13 = 0

			if var_519_13 < arg_516_1.time_ and arg_516_1.time_ <= var_519_13 + arg_519_0 then
				arg_516_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_519_14 = 0

			if var_519_14 < arg_516_1.time_ and arg_516_1.time_ <= var_519_14 + arg_519_0 then
				arg_516_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_519_15 = 0
			local var_519_16 = 0.7

			if var_519_15 < arg_516_1.time_ and arg_516_1.time_ <= var_519_15 + arg_519_0 then
				arg_516_1.talkMaxDuration = 0
				arg_516_1.dialogCg_.alpha = 1

				arg_516_1.dialog_:SetActive(true)
				SetActive(arg_516_1.leftNameGo_, true)

				local var_519_17 = arg_516_1:FormatText(StoryNameCfg[202].name)

				arg_516_1.leftNameTxt_.text = var_519_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_516_1.leftNameTxt_.transform)

				arg_516_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_516_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_516_1:RecordName(arg_516_1.leftNameTxt_.text)
				SetActive(arg_516_1.iconTrs_.gameObject, false)
				arg_516_1.callingController_:SetSelectedState("normal")

				local var_519_18 = arg_516_1:GetWordFromCfg(1108105123)
				local var_519_19 = arg_516_1:FormatText(var_519_18.content)

				arg_516_1.text_.text = var_519_19

				LuaForUtil.ClearLinePrefixSymbol(arg_516_1.text_)

				local var_519_20 = 28
				local var_519_21 = utf8.len(var_519_19)
				local var_519_22 = var_519_20 <= 0 and var_519_16 or var_519_16 * (var_519_21 / var_519_20)

				if var_519_22 > 0 and var_519_16 < var_519_22 then
					arg_516_1.talkMaxDuration = var_519_22

					if var_519_22 + var_519_15 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_22 + var_519_15
					end
				end

				arg_516_1.text_.text = var_519_19
				arg_516_1.typewritter.percent = 0

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(false)
				arg_516_1:RecordContent(arg_516_1.text_.text)
			end

			local var_519_23 = math.max(var_519_16, arg_516_1.talkMaxDuration)

			if var_519_15 <= arg_516_1.time_ and arg_516_1.time_ < var_519_15 + var_519_23 then
				arg_516_1.typewritter.percent = (arg_516_1.time_ - var_519_15) / var_519_23

				arg_516_1.typewritter:SetDirty()
			end

			if arg_516_1.time_ >= var_519_15 + var_519_23 and arg_516_1.time_ < var_519_15 + var_519_23 + arg_519_0 then
				arg_516_1.typewritter.percent = 1

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105124 = function(arg_520_0, arg_520_1)
		arg_520_1.time_ = 0
		arg_520_1.frameCnt_ = 0
		arg_520_1.state_ = "playing"
		arg_520_1.curTalkId_ = 1108105124
		arg_520_1.duration_ = 5

		SetActive(arg_520_1.tipsGo_, false)

		function arg_520_1.onSingleLineFinish_()
			arg_520_1.onSingleLineUpdate_ = nil
			arg_520_1.onSingleLineFinish_ = nil
			arg_520_1.state_ = "waiting"
		end

		function arg_520_1.playNext_(arg_522_0)
			if arg_522_0 == 1 then
				arg_520_0:Play1108105125(arg_520_1)
			end
		end

		function arg_520_1.onSingleLineUpdate_(arg_523_0)
			local var_523_0 = arg_520_1.actors_["1081ui_story"]
			local var_523_1 = 0

			if var_523_1 < arg_520_1.time_ and arg_520_1.time_ <= var_523_1 + arg_523_0 and arg_520_1.var_.characterEffect1081ui_story == nil then
				arg_520_1.var_.characterEffect1081ui_story = var_523_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_523_2 = 0.200000002980232

			if var_523_1 <= arg_520_1.time_ and arg_520_1.time_ < var_523_1 + var_523_2 then
				local var_523_3 = (arg_520_1.time_ - var_523_1) / var_523_2

				if arg_520_1.var_.characterEffect1081ui_story then
					local var_523_4 = Mathf.Lerp(0, 0.5, var_523_3)

					arg_520_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_520_1.var_.characterEffect1081ui_story.fillRatio = var_523_4
				end
			end

			if arg_520_1.time_ >= var_523_1 + var_523_2 and arg_520_1.time_ < var_523_1 + var_523_2 + arg_523_0 and arg_520_1.var_.characterEffect1081ui_story then
				local var_523_5 = 0.5

				arg_520_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_520_1.var_.characterEffect1081ui_story.fillRatio = var_523_5
			end

			local var_523_6 = 0
			local var_523_7 = 0.85

			if var_523_6 < arg_520_1.time_ and arg_520_1.time_ <= var_523_6 + arg_523_0 then
				arg_520_1.talkMaxDuration = 0
				arg_520_1.dialogCg_.alpha = 1

				arg_520_1.dialog_:SetActive(true)
				SetActive(arg_520_1.leftNameGo_, true)

				local var_523_8 = arg_520_1:FormatText(StoryNameCfg[7].name)

				arg_520_1.leftNameTxt_.text = var_523_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_520_1.leftNameTxt_.transform)

				arg_520_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_520_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_520_1:RecordName(arg_520_1.leftNameTxt_.text)
				SetActive(arg_520_1.iconTrs_.gameObject, false)
				arg_520_1.callingController_:SetSelectedState("normal")

				local var_523_9 = arg_520_1:GetWordFromCfg(1108105124)
				local var_523_10 = arg_520_1:FormatText(var_523_9.content)

				arg_520_1.text_.text = var_523_10

				LuaForUtil.ClearLinePrefixSymbol(arg_520_1.text_)

				local var_523_11 = 34
				local var_523_12 = utf8.len(var_523_10)
				local var_523_13 = var_523_11 <= 0 and var_523_7 or var_523_7 * (var_523_12 / var_523_11)

				if var_523_13 > 0 and var_523_7 < var_523_13 then
					arg_520_1.talkMaxDuration = var_523_13

					if var_523_13 + var_523_6 > arg_520_1.duration_ then
						arg_520_1.duration_ = var_523_13 + var_523_6
					end
				end

				arg_520_1.text_.text = var_523_10
				arg_520_1.typewritter.percent = 0

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(false)
				arg_520_1:RecordContent(arg_520_1.text_.text)
			end

			local var_523_14 = math.max(var_523_7, arg_520_1.talkMaxDuration)

			if var_523_6 <= arg_520_1.time_ and arg_520_1.time_ < var_523_6 + var_523_14 then
				arg_520_1.typewritter.percent = (arg_520_1.time_ - var_523_6) / var_523_14

				arg_520_1.typewritter:SetDirty()
			end

			if arg_520_1.time_ >= var_523_6 + var_523_14 and arg_520_1.time_ < var_523_6 + var_523_14 + arg_523_0 then
				arg_520_1.typewritter.percent = 1

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105125 = function(arg_524_0, arg_524_1)
		arg_524_1.time_ = 0
		arg_524_1.frameCnt_ = 0
		arg_524_1.state_ = "playing"
		arg_524_1.curTalkId_ = 1108105125
		arg_524_1.duration_ = 5

		SetActive(arg_524_1.tipsGo_, false)

		function arg_524_1.onSingleLineFinish_()
			arg_524_1.onSingleLineUpdate_ = nil
			arg_524_1.onSingleLineFinish_ = nil
			arg_524_1.state_ = "waiting"
		end

		function arg_524_1.playNext_(arg_526_0)
			if arg_526_0 == 1 then
				arg_524_0:Play1108105126(arg_524_1)
			end
		end

		function arg_524_1.onSingleLineUpdate_(arg_527_0)
			local var_527_0 = arg_524_1.actors_["1081ui_story"].transform
			local var_527_1 = 0

			if var_527_1 < arg_524_1.time_ and arg_524_1.time_ <= var_527_1 + arg_527_0 then
				arg_524_1.var_.moveOldPos1081ui_story = var_527_0.localPosition
			end

			local var_527_2 = 0.001

			if var_527_1 <= arg_524_1.time_ and arg_524_1.time_ < var_527_1 + var_527_2 then
				local var_527_3 = (arg_524_1.time_ - var_527_1) / var_527_2
				local var_527_4 = Vector3.New(0, -0.92, -5.8)

				var_527_0.localPosition = Vector3.Lerp(arg_524_1.var_.moveOldPos1081ui_story, var_527_4, var_527_3)

				local var_527_5 = manager.ui.mainCamera.transform.position - var_527_0.position

				var_527_0.forward = Vector3.New(var_527_5.x, var_527_5.y, var_527_5.z)

				local var_527_6 = var_527_0.localEulerAngles

				var_527_6.z = 0
				var_527_6.x = 0
				var_527_0.localEulerAngles = var_527_6
			end

			if arg_524_1.time_ >= var_527_1 + var_527_2 and arg_524_1.time_ < var_527_1 + var_527_2 + arg_527_0 then
				var_527_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_527_7 = manager.ui.mainCamera.transform.position - var_527_0.position

				var_527_0.forward = Vector3.New(var_527_7.x, var_527_7.y, var_527_7.z)

				local var_527_8 = var_527_0.localEulerAngles

				var_527_8.z = 0
				var_527_8.x = 0
				var_527_0.localEulerAngles = var_527_8
			end

			local var_527_9 = arg_524_1.actors_["1081ui_story"]
			local var_527_10 = 0

			if var_527_10 < arg_524_1.time_ and arg_524_1.time_ <= var_527_10 + arg_527_0 and arg_524_1.var_.characterEffect1081ui_story == nil then
				arg_524_1.var_.characterEffect1081ui_story = var_527_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_527_11 = 0.200000002980232

			if var_527_10 <= arg_524_1.time_ and arg_524_1.time_ < var_527_10 + var_527_11 then
				local var_527_12 = (arg_524_1.time_ - var_527_10) / var_527_11

				if arg_524_1.var_.characterEffect1081ui_story then
					arg_524_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_524_1.time_ >= var_527_10 + var_527_11 and arg_524_1.time_ < var_527_10 + var_527_11 + arg_527_0 and arg_524_1.var_.characterEffect1081ui_story then
				arg_524_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_527_13 = 0

			if var_527_13 < arg_524_1.time_ and arg_524_1.time_ <= var_527_13 + arg_527_0 then
				arg_524_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_527_14 = 0

			if var_527_14 < arg_524_1.time_ and arg_524_1.time_ <= var_527_14 + arg_527_0 then
				arg_524_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_527_15 = 0
			local var_527_16 = 0.775

			if var_527_15 < arg_524_1.time_ and arg_524_1.time_ <= var_527_15 + arg_527_0 then
				arg_524_1.talkMaxDuration = 0
				arg_524_1.dialogCg_.alpha = 1

				arg_524_1.dialog_:SetActive(true)
				SetActive(arg_524_1.leftNameGo_, true)

				local var_527_17 = arg_524_1:FormatText(StoryNameCfg[202].name)

				arg_524_1.leftNameTxt_.text = var_527_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_524_1.leftNameTxt_.transform)

				arg_524_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_524_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_524_1:RecordName(arg_524_1.leftNameTxt_.text)
				SetActive(arg_524_1.iconTrs_.gameObject, false)
				arg_524_1.callingController_:SetSelectedState("normal")

				local var_527_18 = arg_524_1:GetWordFromCfg(1108105125)
				local var_527_19 = arg_524_1:FormatText(var_527_18.content)

				arg_524_1.text_.text = var_527_19

				LuaForUtil.ClearLinePrefixSymbol(arg_524_1.text_)

				local var_527_20 = 31
				local var_527_21 = utf8.len(var_527_19)
				local var_527_22 = var_527_20 <= 0 and var_527_16 or var_527_16 * (var_527_21 / var_527_20)

				if var_527_22 > 0 and var_527_16 < var_527_22 then
					arg_524_1.talkMaxDuration = var_527_22

					if var_527_22 + var_527_15 > arg_524_1.duration_ then
						arg_524_1.duration_ = var_527_22 + var_527_15
					end
				end

				arg_524_1.text_.text = var_527_19
				arg_524_1.typewritter.percent = 0

				arg_524_1.typewritter:SetDirty()
				arg_524_1:ShowNextGo(false)
				arg_524_1:RecordContent(arg_524_1.text_.text)
			end

			local var_527_23 = math.max(var_527_16, arg_524_1.talkMaxDuration)

			if var_527_15 <= arg_524_1.time_ and arg_524_1.time_ < var_527_15 + var_527_23 then
				arg_524_1.typewritter.percent = (arg_524_1.time_ - var_527_15) / var_527_23

				arg_524_1.typewritter:SetDirty()
			end

			if arg_524_1.time_ >= var_527_15 + var_527_23 and arg_524_1.time_ < var_527_15 + var_527_23 + arg_527_0 then
				arg_524_1.typewritter.percent = 1

				arg_524_1.typewritter:SetDirty()
				arg_524_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105126 = function(arg_528_0, arg_528_1)
		arg_528_1.time_ = 0
		arg_528_1.frameCnt_ = 0
		arg_528_1.state_ = "playing"
		arg_528_1.curTalkId_ = 1108105126
		arg_528_1.duration_ = 5

		SetActive(arg_528_1.tipsGo_, false)

		function arg_528_1.onSingleLineFinish_()
			arg_528_1.onSingleLineUpdate_ = nil
			arg_528_1.onSingleLineFinish_ = nil
			arg_528_1.state_ = "waiting"
		end

		function arg_528_1.playNext_(arg_530_0)
			if arg_530_0 == 1 then
				arg_528_0:Play1108105127(arg_528_1)
			end
		end

		function arg_528_1.onSingleLineUpdate_(arg_531_0)
			local var_531_0 = 0

			if var_531_0 < arg_528_1.time_ and arg_528_1.time_ <= var_531_0 + arg_531_0 then
				arg_528_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_531_1 = 0

			if var_531_1 < arg_528_1.time_ and arg_528_1.time_ <= var_531_1 + arg_531_0 then
				arg_528_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_531_2 = 0
			local var_531_3 = 0.8

			if var_531_2 < arg_528_1.time_ and arg_528_1.time_ <= var_531_2 + arg_531_0 then
				arg_528_1.talkMaxDuration = 0
				arg_528_1.dialogCg_.alpha = 1

				arg_528_1.dialog_:SetActive(true)
				SetActive(arg_528_1.leftNameGo_, true)

				local var_531_4 = arg_528_1:FormatText(StoryNameCfg[202].name)

				arg_528_1.leftNameTxt_.text = var_531_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_528_1.leftNameTxt_.transform)

				arg_528_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_528_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_528_1:RecordName(arg_528_1.leftNameTxt_.text)
				SetActive(arg_528_1.iconTrs_.gameObject, false)
				arg_528_1.callingController_:SetSelectedState("normal")

				local var_531_5 = arg_528_1:GetWordFromCfg(1108105126)
				local var_531_6 = arg_528_1:FormatText(var_531_5.content)

				arg_528_1.text_.text = var_531_6

				LuaForUtil.ClearLinePrefixSymbol(arg_528_1.text_)

				local var_531_7 = 32
				local var_531_8 = utf8.len(var_531_6)
				local var_531_9 = var_531_7 <= 0 and var_531_3 or var_531_3 * (var_531_8 / var_531_7)

				if var_531_9 > 0 and var_531_3 < var_531_9 then
					arg_528_1.talkMaxDuration = var_531_9

					if var_531_9 + var_531_2 > arg_528_1.duration_ then
						arg_528_1.duration_ = var_531_9 + var_531_2
					end
				end

				arg_528_1.text_.text = var_531_6
				arg_528_1.typewritter.percent = 0

				arg_528_1.typewritter:SetDirty()
				arg_528_1:ShowNextGo(false)
				arg_528_1:RecordContent(arg_528_1.text_.text)
			end

			local var_531_10 = math.max(var_531_3, arg_528_1.talkMaxDuration)

			if var_531_2 <= arg_528_1.time_ and arg_528_1.time_ < var_531_2 + var_531_10 then
				arg_528_1.typewritter.percent = (arg_528_1.time_ - var_531_2) / var_531_10

				arg_528_1.typewritter:SetDirty()
			end

			if arg_528_1.time_ >= var_531_2 + var_531_10 and arg_528_1.time_ < var_531_2 + var_531_10 + arg_531_0 then
				arg_528_1.typewritter.percent = 1

				arg_528_1.typewritter:SetDirty()
				arg_528_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105127 = function(arg_532_0, arg_532_1)
		arg_532_1.time_ = 0
		arg_532_1.frameCnt_ = 0
		arg_532_1.state_ = "playing"
		arg_532_1.curTalkId_ = 1108105127
		arg_532_1.duration_ = 5

		SetActive(arg_532_1.tipsGo_, false)

		function arg_532_1.onSingleLineFinish_()
			arg_532_1.onSingleLineUpdate_ = nil
			arg_532_1.onSingleLineFinish_ = nil
			arg_532_1.state_ = "waiting"
		end

		function arg_532_1.playNext_(arg_534_0)
			if arg_534_0 == 1 then
				arg_532_0:Play1108105128(arg_532_1)
			end
		end

		function arg_532_1.onSingleLineUpdate_(arg_535_0)
			local var_535_0 = arg_532_1.actors_["1081ui_story"].transform
			local var_535_1 = 0

			if var_535_1 < arg_532_1.time_ and arg_532_1.time_ <= var_535_1 + arg_535_0 then
				arg_532_1.var_.moveOldPos1081ui_story = var_535_0.localPosition
			end

			local var_535_2 = 0.001

			if var_535_1 <= arg_532_1.time_ and arg_532_1.time_ < var_535_1 + var_535_2 then
				local var_535_3 = (arg_532_1.time_ - var_535_1) / var_535_2
				local var_535_4 = Vector3.New(0, 100, 0)

				var_535_0.localPosition = Vector3.Lerp(arg_532_1.var_.moveOldPos1081ui_story, var_535_4, var_535_3)

				local var_535_5 = manager.ui.mainCamera.transform.position - var_535_0.position

				var_535_0.forward = Vector3.New(var_535_5.x, var_535_5.y, var_535_5.z)

				local var_535_6 = var_535_0.localEulerAngles

				var_535_6.z = 0
				var_535_6.x = 0
				var_535_0.localEulerAngles = var_535_6
			end

			if arg_532_1.time_ >= var_535_1 + var_535_2 and arg_532_1.time_ < var_535_1 + var_535_2 + arg_535_0 then
				var_535_0.localPosition = Vector3.New(0, 100, 0)

				local var_535_7 = manager.ui.mainCamera.transform.position - var_535_0.position

				var_535_0.forward = Vector3.New(var_535_7.x, var_535_7.y, var_535_7.z)

				local var_535_8 = var_535_0.localEulerAngles

				var_535_8.z = 0
				var_535_8.x = 0
				var_535_0.localEulerAngles = var_535_8
			end

			local var_535_9 = 0
			local var_535_10 = 1.1

			if var_535_9 < arg_532_1.time_ and arg_532_1.time_ <= var_535_9 + arg_535_0 then
				arg_532_1.talkMaxDuration = 0
				arg_532_1.dialogCg_.alpha = 1

				arg_532_1.dialog_:SetActive(true)
				SetActive(arg_532_1.leftNameGo_, false)

				arg_532_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_532_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_532_1:RecordName(arg_532_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_532_1.iconTrs_.gameObject, false)
				arg_532_1.callingController_:SetSelectedState("normal")

				local var_535_11 = arg_532_1:GetWordFromCfg(1108105127)
				local var_535_12 = arg_532_1:FormatText(var_535_11.content)

				arg_532_1.text_.text = var_535_12

				LuaForUtil.ClearLinePrefixSymbol(arg_532_1.text_)

				local var_535_13 = 44
				local var_535_14 = utf8.len(var_535_12)
				local var_535_15 = var_535_13 <= 0 and var_535_10 or var_535_10 * (var_535_14 / var_535_13)

				if var_535_15 > 0 and var_535_10 < var_535_15 then
					arg_532_1.talkMaxDuration = var_535_15

					if var_535_15 + var_535_9 > arg_532_1.duration_ then
						arg_532_1.duration_ = var_535_15 + var_535_9
					end
				end

				arg_532_1.text_.text = var_535_12
				arg_532_1.typewritter.percent = 0

				arg_532_1.typewritter:SetDirty()
				arg_532_1:ShowNextGo(false)
				arg_532_1:RecordContent(arg_532_1.text_.text)
			end

			local var_535_16 = math.max(var_535_10, arg_532_1.talkMaxDuration)

			if var_535_9 <= arg_532_1.time_ and arg_532_1.time_ < var_535_9 + var_535_16 then
				arg_532_1.typewritter.percent = (arg_532_1.time_ - var_535_9) / var_535_16

				arg_532_1.typewritter:SetDirty()
			end

			if arg_532_1.time_ >= var_535_9 + var_535_16 and arg_532_1.time_ < var_535_9 + var_535_16 + arg_535_0 then
				arg_532_1.typewritter.percent = 1

				arg_532_1.typewritter:SetDirty()
				arg_532_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105128 = function(arg_536_0, arg_536_1)
		arg_536_1.time_ = 0
		arg_536_1.frameCnt_ = 0
		arg_536_1.state_ = "playing"
		arg_536_1.curTalkId_ = 1108105128
		arg_536_1.duration_ = 5

		SetActive(arg_536_1.tipsGo_, false)

		function arg_536_1.onSingleLineFinish_()
			arg_536_1.onSingleLineUpdate_ = nil
			arg_536_1.onSingleLineFinish_ = nil
			arg_536_1.state_ = "waiting"
		end

		function arg_536_1.playNext_(arg_538_0)
			if arg_538_0 == 1 then
				arg_536_0:Play1108105129(arg_536_1)
			end
		end

		function arg_536_1.onSingleLineUpdate_(arg_539_0)
			local var_539_0 = 0
			local var_539_1 = 0.3

			if var_539_0 < arg_536_1.time_ and arg_536_1.time_ <= var_539_0 + arg_539_0 then
				arg_536_1.talkMaxDuration = 0
				arg_536_1.dialogCg_.alpha = 1

				arg_536_1.dialog_:SetActive(true)
				SetActive(arg_536_1.leftNameGo_, true)

				local var_539_2 = arg_536_1:FormatText(StoryNameCfg[7].name)

				arg_536_1.leftNameTxt_.text = var_539_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_536_1.leftNameTxt_.transform)

				arg_536_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_536_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_536_1:RecordName(arg_536_1.leftNameTxt_.text)
				SetActive(arg_536_1.iconTrs_.gameObject, false)
				arg_536_1.callingController_:SetSelectedState("normal")

				local var_539_3 = arg_536_1:GetWordFromCfg(1108105128)
				local var_539_4 = arg_536_1:FormatText(var_539_3.content)

				arg_536_1.text_.text = var_539_4

				LuaForUtil.ClearLinePrefixSymbol(arg_536_1.text_)

				local var_539_5 = 12
				local var_539_6 = utf8.len(var_539_4)
				local var_539_7 = var_539_5 <= 0 and var_539_1 or var_539_1 * (var_539_6 / var_539_5)

				if var_539_7 > 0 and var_539_1 < var_539_7 then
					arg_536_1.talkMaxDuration = var_539_7

					if var_539_7 + var_539_0 > arg_536_1.duration_ then
						arg_536_1.duration_ = var_539_7 + var_539_0
					end
				end

				arg_536_1.text_.text = var_539_4
				arg_536_1.typewritter.percent = 0

				arg_536_1.typewritter:SetDirty()
				arg_536_1:ShowNextGo(false)
				arg_536_1:RecordContent(arg_536_1.text_.text)
			end

			local var_539_8 = math.max(var_539_1, arg_536_1.talkMaxDuration)

			if var_539_0 <= arg_536_1.time_ and arg_536_1.time_ < var_539_0 + var_539_8 then
				arg_536_1.typewritter.percent = (arg_536_1.time_ - var_539_0) / var_539_8

				arg_536_1.typewritter:SetDirty()
			end

			if arg_536_1.time_ >= var_539_0 + var_539_8 and arg_536_1.time_ < var_539_0 + var_539_8 + arg_539_0 then
				arg_536_1.typewritter.percent = 1

				arg_536_1.typewritter:SetDirty()
				arg_536_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105129 = function(arg_540_0, arg_540_1)
		arg_540_1.time_ = 0
		arg_540_1.frameCnt_ = 0
		arg_540_1.state_ = "playing"
		arg_540_1.curTalkId_ = 1108105129
		arg_540_1.duration_ = 5

		SetActive(arg_540_1.tipsGo_, false)

		function arg_540_1.onSingleLineFinish_()
			arg_540_1.onSingleLineUpdate_ = nil
			arg_540_1.onSingleLineFinish_ = nil
			arg_540_1.state_ = "waiting"
		end

		function arg_540_1.playNext_(arg_542_0)
			if arg_542_0 == 1 then
				arg_540_0:Play1108105130(arg_540_1)
			end
		end

		function arg_540_1.onSingleLineUpdate_(arg_543_0)
			local var_543_0 = arg_540_1.actors_["1081ui_story"]
			local var_543_1 = 0

			if var_543_1 < arg_540_1.time_ and arg_540_1.time_ <= var_543_1 + arg_543_0 and arg_540_1.var_.characterEffect1081ui_story == nil then
				arg_540_1.var_.characterEffect1081ui_story = var_543_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_543_2 = 0.0166666666666667

			if var_543_1 <= arg_540_1.time_ and arg_540_1.time_ < var_543_1 + var_543_2 then
				local var_543_3 = (arg_540_1.time_ - var_543_1) / var_543_2

				if arg_540_1.var_.characterEffect1081ui_story then
					local var_543_4 = Mathf.Lerp(0, 0.5, var_543_3)

					arg_540_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_540_1.var_.characterEffect1081ui_story.fillRatio = var_543_4
				end
			end

			if arg_540_1.time_ >= var_543_1 + var_543_2 and arg_540_1.time_ < var_543_1 + var_543_2 + arg_543_0 and arg_540_1.var_.characterEffect1081ui_story then
				local var_543_5 = 0.5

				arg_540_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_540_1.var_.characterEffect1081ui_story.fillRatio = var_543_5
			end

			local var_543_6 = 0
			local var_543_7 = 0.8

			if var_543_6 < arg_540_1.time_ and arg_540_1.time_ <= var_543_6 + arg_543_0 then
				arg_540_1.talkMaxDuration = 0
				arg_540_1.dialogCg_.alpha = 1

				arg_540_1.dialog_:SetActive(true)
				SetActive(arg_540_1.leftNameGo_, true)

				local var_543_8 = arg_540_1:FormatText(StoryNameCfg[7].name)

				arg_540_1.leftNameTxt_.text = var_543_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_540_1.leftNameTxt_.transform)

				arg_540_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_540_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_540_1:RecordName(arg_540_1.leftNameTxt_.text)
				SetActive(arg_540_1.iconTrs_.gameObject, false)
				arg_540_1.callingController_:SetSelectedState("normal")

				local var_543_9 = arg_540_1:GetWordFromCfg(1108105129)
				local var_543_10 = arg_540_1:FormatText(var_543_9.content)

				arg_540_1.text_.text = var_543_10

				LuaForUtil.ClearLinePrefixSymbol(arg_540_1.text_)

				local var_543_11 = 32
				local var_543_12 = utf8.len(var_543_10)
				local var_543_13 = var_543_11 <= 0 and var_543_7 or var_543_7 * (var_543_12 / var_543_11)

				if var_543_13 > 0 and var_543_7 < var_543_13 then
					arg_540_1.talkMaxDuration = var_543_13

					if var_543_13 + var_543_6 > arg_540_1.duration_ then
						arg_540_1.duration_ = var_543_13 + var_543_6
					end
				end

				arg_540_1.text_.text = var_543_10
				arg_540_1.typewritter.percent = 0

				arg_540_1.typewritter:SetDirty()
				arg_540_1:ShowNextGo(false)
				arg_540_1:RecordContent(arg_540_1.text_.text)
			end

			local var_543_14 = math.max(var_543_7, arg_540_1.talkMaxDuration)

			if var_543_6 <= arg_540_1.time_ and arg_540_1.time_ < var_543_6 + var_543_14 then
				arg_540_1.typewritter.percent = (arg_540_1.time_ - var_543_6) / var_543_14

				arg_540_1.typewritter:SetDirty()
			end

			if arg_540_1.time_ >= var_543_6 + var_543_14 and arg_540_1.time_ < var_543_6 + var_543_14 + arg_543_0 then
				arg_540_1.typewritter.percent = 1

				arg_540_1.typewritter:SetDirty()
				arg_540_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105130 = function(arg_544_0, arg_544_1)
		arg_544_1.time_ = 0
		arg_544_1.frameCnt_ = 0
		arg_544_1.state_ = "playing"
		arg_544_1.curTalkId_ = 1108105130
		arg_544_1.duration_ = 5

		SetActive(arg_544_1.tipsGo_, false)

		function arg_544_1.onSingleLineFinish_()
			arg_544_1.onSingleLineUpdate_ = nil
			arg_544_1.onSingleLineFinish_ = nil
			arg_544_1.state_ = "waiting"
		end

		function arg_544_1.playNext_(arg_546_0)
			if arg_546_0 == 1 then
				arg_544_0:Play1108105131(arg_544_1)
			end
		end

		function arg_544_1.onSingleLineUpdate_(arg_547_0)
			local var_547_0 = arg_544_1.actors_["1081ui_story"].transform
			local var_547_1 = 0

			if var_547_1 < arg_544_1.time_ and arg_544_1.time_ <= var_547_1 + arg_547_0 then
				arg_544_1.var_.moveOldPos1081ui_story = var_547_0.localPosition
			end

			local var_547_2 = 0.001

			if var_547_1 <= arg_544_1.time_ and arg_544_1.time_ < var_547_1 + var_547_2 then
				local var_547_3 = (arg_544_1.time_ - var_547_1) / var_547_2
				local var_547_4 = Vector3.New(0, -0.92, -5.8)

				var_547_0.localPosition = Vector3.Lerp(arg_544_1.var_.moveOldPos1081ui_story, var_547_4, var_547_3)

				local var_547_5 = manager.ui.mainCamera.transform.position - var_547_0.position

				var_547_0.forward = Vector3.New(var_547_5.x, var_547_5.y, var_547_5.z)

				local var_547_6 = var_547_0.localEulerAngles

				var_547_6.z = 0
				var_547_6.x = 0
				var_547_0.localEulerAngles = var_547_6
			end

			if arg_544_1.time_ >= var_547_1 + var_547_2 and arg_544_1.time_ < var_547_1 + var_547_2 + arg_547_0 then
				var_547_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_547_7 = manager.ui.mainCamera.transform.position - var_547_0.position

				var_547_0.forward = Vector3.New(var_547_7.x, var_547_7.y, var_547_7.z)

				local var_547_8 = var_547_0.localEulerAngles

				var_547_8.z = 0
				var_547_8.x = 0
				var_547_0.localEulerAngles = var_547_8
			end

			local var_547_9 = arg_544_1.actors_["1081ui_story"]
			local var_547_10 = 0

			if var_547_10 < arg_544_1.time_ and arg_544_1.time_ <= var_547_10 + arg_547_0 and arg_544_1.var_.characterEffect1081ui_story == nil then
				arg_544_1.var_.characterEffect1081ui_story = var_547_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_547_11 = 0.200000002980232

			if var_547_10 <= arg_544_1.time_ and arg_544_1.time_ < var_547_10 + var_547_11 then
				local var_547_12 = (arg_544_1.time_ - var_547_10) / var_547_11

				if arg_544_1.var_.characterEffect1081ui_story then
					arg_544_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_544_1.time_ >= var_547_10 + var_547_11 and arg_544_1.time_ < var_547_10 + var_547_11 + arg_547_0 and arg_544_1.var_.characterEffect1081ui_story then
				arg_544_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_547_13 = 0

			if var_547_13 < arg_544_1.time_ and arg_544_1.time_ <= var_547_13 + arg_547_0 then
				arg_544_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_547_14 = 0
			local var_547_15 = 0.625

			if var_547_14 < arg_544_1.time_ and arg_544_1.time_ <= var_547_14 + arg_547_0 then
				arg_544_1.talkMaxDuration = 0
				arg_544_1.dialogCg_.alpha = 1

				arg_544_1.dialog_:SetActive(true)
				SetActive(arg_544_1.leftNameGo_, true)

				local var_547_16 = arg_544_1:FormatText(StoryNameCfg[202].name)

				arg_544_1.leftNameTxt_.text = var_547_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_544_1.leftNameTxt_.transform)

				arg_544_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_544_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_544_1:RecordName(arg_544_1.leftNameTxt_.text)
				SetActive(arg_544_1.iconTrs_.gameObject, false)
				arg_544_1.callingController_:SetSelectedState("normal")

				local var_547_17 = arg_544_1:GetWordFromCfg(1108105130)
				local var_547_18 = arg_544_1:FormatText(var_547_17.content)

				arg_544_1.text_.text = var_547_18

				LuaForUtil.ClearLinePrefixSymbol(arg_544_1.text_)

				local var_547_19 = 25
				local var_547_20 = utf8.len(var_547_18)
				local var_547_21 = var_547_19 <= 0 and var_547_15 or var_547_15 * (var_547_20 / var_547_19)

				if var_547_21 > 0 and var_547_15 < var_547_21 then
					arg_544_1.talkMaxDuration = var_547_21

					if var_547_21 + var_547_14 > arg_544_1.duration_ then
						arg_544_1.duration_ = var_547_21 + var_547_14
					end
				end

				arg_544_1.text_.text = var_547_18
				arg_544_1.typewritter.percent = 0

				arg_544_1.typewritter:SetDirty()
				arg_544_1:ShowNextGo(false)
				arg_544_1:RecordContent(arg_544_1.text_.text)
			end

			local var_547_22 = math.max(var_547_15, arg_544_1.talkMaxDuration)

			if var_547_14 <= arg_544_1.time_ and arg_544_1.time_ < var_547_14 + var_547_22 then
				arg_544_1.typewritter.percent = (arg_544_1.time_ - var_547_14) / var_547_22

				arg_544_1.typewritter:SetDirty()
			end

			if arg_544_1.time_ >= var_547_14 + var_547_22 and arg_544_1.time_ < var_547_14 + var_547_22 + arg_547_0 then
				arg_544_1.typewritter.percent = 1

				arg_544_1.typewritter:SetDirty()
				arg_544_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105131 = function(arg_548_0, arg_548_1)
		arg_548_1.time_ = 0
		arg_548_1.frameCnt_ = 0
		arg_548_1.state_ = "playing"
		arg_548_1.curTalkId_ = 1108105131
		arg_548_1.duration_ = 5

		SetActive(arg_548_1.tipsGo_, false)

		function arg_548_1.onSingleLineFinish_()
			arg_548_1.onSingleLineUpdate_ = nil
			arg_548_1.onSingleLineFinish_ = nil
			arg_548_1.state_ = "waiting"
		end

		function arg_548_1.playNext_(arg_550_0)
			if arg_550_0 == 1 then
				arg_548_0:Play1108105132(arg_548_1)
			end
		end

		function arg_548_1.onSingleLineUpdate_(arg_551_0)
			local var_551_0 = arg_548_1.actors_["1081ui_story"]
			local var_551_1 = 0

			if var_551_1 < arg_548_1.time_ and arg_548_1.time_ <= var_551_1 + arg_551_0 and arg_548_1.var_.characterEffect1081ui_story == nil then
				arg_548_1.var_.characterEffect1081ui_story = var_551_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_551_2 = 0.200000002980232

			if var_551_1 <= arg_548_1.time_ and arg_548_1.time_ < var_551_1 + var_551_2 then
				local var_551_3 = (arg_548_1.time_ - var_551_1) / var_551_2

				if arg_548_1.var_.characterEffect1081ui_story then
					local var_551_4 = Mathf.Lerp(0, 0.5, var_551_3)

					arg_548_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_548_1.var_.characterEffect1081ui_story.fillRatio = var_551_4
				end
			end

			if arg_548_1.time_ >= var_551_1 + var_551_2 and arg_548_1.time_ < var_551_1 + var_551_2 + arg_551_0 and arg_548_1.var_.characterEffect1081ui_story then
				local var_551_5 = 0.5

				arg_548_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_548_1.var_.characterEffect1081ui_story.fillRatio = var_551_5
			end

			local var_551_6 = arg_548_1.actors_["1081ui_story"].transform
			local var_551_7 = 0

			if var_551_7 < arg_548_1.time_ and arg_548_1.time_ <= var_551_7 + arg_551_0 then
				arg_548_1.var_.moveOldPos1081ui_story = var_551_6.localPosition
			end

			local var_551_8 = 0.001

			if var_551_7 <= arg_548_1.time_ and arg_548_1.time_ < var_551_7 + var_551_8 then
				local var_551_9 = (arg_548_1.time_ - var_551_7) / var_551_8
				local var_551_10 = Vector3.New(0, 100, 0)

				var_551_6.localPosition = Vector3.Lerp(arg_548_1.var_.moveOldPos1081ui_story, var_551_10, var_551_9)

				local var_551_11 = manager.ui.mainCamera.transform.position - var_551_6.position

				var_551_6.forward = Vector3.New(var_551_11.x, var_551_11.y, var_551_11.z)

				local var_551_12 = var_551_6.localEulerAngles

				var_551_12.z = 0
				var_551_12.x = 0
				var_551_6.localEulerAngles = var_551_12
			end

			if arg_548_1.time_ >= var_551_7 + var_551_8 and arg_548_1.time_ < var_551_7 + var_551_8 + arg_551_0 then
				var_551_6.localPosition = Vector3.New(0, 100, 0)

				local var_551_13 = manager.ui.mainCamera.transform.position - var_551_6.position

				var_551_6.forward = Vector3.New(var_551_13.x, var_551_13.y, var_551_13.z)

				local var_551_14 = var_551_6.localEulerAngles

				var_551_14.z = 0
				var_551_14.x = 0
				var_551_6.localEulerAngles = var_551_14
			end

			local var_551_15 = 0
			local var_551_16 = 0.7

			if var_551_15 < arg_548_1.time_ and arg_548_1.time_ <= var_551_15 + arg_551_0 then
				arg_548_1.talkMaxDuration = 0
				arg_548_1.dialogCg_.alpha = 1

				arg_548_1.dialog_:SetActive(true)
				SetActive(arg_548_1.leftNameGo_, true)

				local var_551_17 = arg_548_1:FormatText(StoryNameCfg[7].name)

				arg_548_1.leftNameTxt_.text = var_551_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_548_1.leftNameTxt_.transform)

				arg_548_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_548_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_548_1:RecordName(arg_548_1.leftNameTxt_.text)
				SetActive(arg_548_1.iconTrs_.gameObject, false)
				arg_548_1.callingController_:SetSelectedState("normal")

				local var_551_18 = arg_548_1:GetWordFromCfg(1108105131)
				local var_551_19 = arg_548_1:FormatText(var_551_18.content)

				arg_548_1.text_.text = var_551_19

				LuaForUtil.ClearLinePrefixSymbol(arg_548_1.text_)

				local var_551_20 = 28
				local var_551_21 = utf8.len(var_551_19)
				local var_551_22 = var_551_20 <= 0 and var_551_16 or var_551_16 * (var_551_21 / var_551_20)

				if var_551_22 > 0 and var_551_16 < var_551_22 then
					arg_548_1.talkMaxDuration = var_551_22

					if var_551_22 + var_551_15 > arg_548_1.duration_ then
						arg_548_1.duration_ = var_551_22 + var_551_15
					end
				end

				arg_548_1.text_.text = var_551_19
				arg_548_1.typewritter.percent = 0

				arg_548_1.typewritter:SetDirty()
				arg_548_1:ShowNextGo(false)
				arg_548_1:RecordContent(arg_548_1.text_.text)
			end

			local var_551_23 = math.max(var_551_16, arg_548_1.talkMaxDuration)

			if var_551_15 <= arg_548_1.time_ and arg_548_1.time_ < var_551_15 + var_551_23 then
				arg_548_1.typewritter.percent = (arg_548_1.time_ - var_551_15) / var_551_23

				arg_548_1.typewritter:SetDirty()
			end

			if arg_548_1.time_ >= var_551_15 + var_551_23 and arg_548_1.time_ < var_551_15 + var_551_23 + arg_551_0 then
				arg_548_1.typewritter.percent = 1

				arg_548_1.typewritter:SetDirty()
				arg_548_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105132 = function(arg_552_0, arg_552_1)
		arg_552_1.time_ = 0
		arg_552_1.frameCnt_ = 0
		arg_552_1.state_ = "playing"
		arg_552_1.curTalkId_ = 1108105132
		arg_552_1.duration_ = 5

		SetActive(arg_552_1.tipsGo_, false)

		function arg_552_1.onSingleLineFinish_()
			arg_552_1.onSingleLineUpdate_ = nil
			arg_552_1.onSingleLineFinish_ = nil
			arg_552_1.state_ = "waiting"
		end

		function arg_552_1.playNext_(arg_554_0)
			if arg_554_0 == 1 then
				arg_552_0:Play1108105133(arg_552_1)
			end
		end

		function arg_552_1.onSingleLineUpdate_(arg_555_0)
			local var_555_0 = 0
			local var_555_1 = 1.25

			if var_555_0 < arg_552_1.time_ and arg_552_1.time_ <= var_555_0 + arg_555_0 then
				arg_552_1.talkMaxDuration = 0
				arg_552_1.dialogCg_.alpha = 1

				arg_552_1.dialog_:SetActive(true)
				SetActive(arg_552_1.leftNameGo_, false)

				arg_552_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_552_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_552_1:RecordName(arg_552_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_552_1.iconTrs_.gameObject, false)
				arg_552_1.callingController_:SetSelectedState("normal")

				local var_555_2 = arg_552_1:GetWordFromCfg(1108105132)
				local var_555_3 = arg_552_1:FormatText(var_555_2.content)

				arg_552_1.text_.text = var_555_3

				LuaForUtil.ClearLinePrefixSymbol(arg_552_1.text_)

				local var_555_4 = 50
				local var_555_5 = utf8.len(var_555_3)
				local var_555_6 = var_555_4 <= 0 and var_555_1 or var_555_1 * (var_555_5 / var_555_4)

				if var_555_6 > 0 and var_555_1 < var_555_6 then
					arg_552_1.talkMaxDuration = var_555_6

					if var_555_6 + var_555_0 > arg_552_1.duration_ then
						arg_552_1.duration_ = var_555_6 + var_555_0
					end
				end

				arg_552_1.text_.text = var_555_3
				arg_552_1.typewritter.percent = 0

				arg_552_1.typewritter:SetDirty()
				arg_552_1:ShowNextGo(false)
				arg_552_1:RecordContent(arg_552_1.text_.text)
			end

			local var_555_7 = math.max(var_555_1, arg_552_1.talkMaxDuration)

			if var_555_0 <= arg_552_1.time_ and arg_552_1.time_ < var_555_0 + var_555_7 then
				arg_552_1.typewritter.percent = (arg_552_1.time_ - var_555_0) / var_555_7

				arg_552_1.typewritter:SetDirty()
			end

			if arg_552_1.time_ >= var_555_0 + var_555_7 and arg_552_1.time_ < var_555_0 + var_555_7 + arg_555_0 then
				arg_552_1.typewritter.percent = 1

				arg_552_1.typewritter:SetDirty()
				arg_552_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105133 = function(arg_556_0, arg_556_1)
		arg_556_1.time_ = 0
		arg_556_1.frameCnt_ = 0
		arg_556_1.state_ = "playing"
		arg_556_1.curTalkId_ = 1108105133
		arg_556_1.duration_ = 5

		SetActive(arg_556_1.tipsGo_, false)

		function arg_556_1.onSingleLineFinish_()
			arg_556_1.onSingleLineUpdate_ = nil
			arg_556_1.onSingleLineFinish_ = nil
			arg_556_1.state_ = "waiting"
		end

		function arg_556_1.playNext_(arg_558_0)
			if arg_558_0 == 1 then
				arg_556_0:Play1108105134(arg_556_1)
			end
		end

		function arg_556_1.onSingleLineUpdate_(arg_559_0)
			local var_559_0 = 0
			local var_559_1 = 0.725

			if var_559_0 < arg_556_1.time_ and arg_556_1.time_ <= var_559_0 + arg_559_0 then
				arg_556_1.talkMaxDuration = 0
				arg_556_1.dialogCg_.alpha = 1

				arg_556_1.dialog_:SetActive(true)
				SetActive(arg_556_1.leftNameGo_, true)

				local var_559_2 = arg_556_1:FormatText(StoryNameCfg[7].name)

				arg_556_1.leftNameTxt_.text = var_559_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_556_1.leftNameTxt_.transform)

				arg_556_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_556_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_556_1:RecordName(arg_556_1.leftNameTxt_.text)
				SetActive(arg_556_1.iconTrs_.gameObject, false)
				arg_556_1.callingController_:SetSelectedState("normal")

				local var_559_3 = arg_556_1:GetWordFromCfg(1108105133)
				local var_559_4 = arg_556_1:FormatText(var_559_3.content)

				arg_556_1.text_.text = var_559_4

				LuaForUtil.ClearLinePrefixSymbol(arg_556_1.text_)

				local var_559_5 = 29
				local var_559_6 = utf8.len(var_559_4)
				local var_559_7 = var_559_5 <= 0 and var_559_1 or var_559_1 * (var_559_6 / var_559_5)

				if var_559_7 > 0 and var_559_1 < var_559_7 then
					arg_556_1.talkMaxDuration = var_559_7

					if var_559_7 + var_559_0 > arg_556_1.duration_ then
						arg_556_1.duration_ = var_559_7 + var_559_0
					end
				end

				arg_556_1.text_.text = var_559_4
				arg_556_1.typewritter.percent = 0

				arg_556_1.typewritter:SetDirty()
				arg_556_1:ShowNextGo(false)
				arg_556_1:RecordContent(arg_556_1.text_.text)
			end

			local var_559_8 = math.max(var_559_1, arg_556_1.talkMaxDuration)

			if var_559_0 <= arg_556_1.time_ and arg_556_1.time_ < var_559_0 + var_559_8 then
				arg_556_1.typewritter.percent = (arg_556_1.time_ - var_559_0) / var_559_8

				arg_556_1.typewritter:SetDirty()
			end

			if arg_556_1.time_ >= var_559_0 + var_559_8 and arg_556_1.time_ < var_559_0 + var_559_8 + arg_559_0 then
				arg_556_1.typewritter.percent = 1

				arg_556_1.typewritter:SetDirty()
				arg_556_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105134 = function(arg_560_0, arg_560_1)
		arg_560_1.time_ = 0
		arg_560_1.frameCnt_ = 0
		arg_560_1.state_ = "playing"
		arg_560_1.curTalkId_ = 1108105134
		arg_560_1.duration_ = 5

		SetActive(arg_560_1.tipsGo_, false)

		function arg_560_1.onSingleLineFinish_()
			arg_560_1.onSingleLineUpdate_ = nil
			arg_560_1.onSingleLineFinish_ = nil
			arg_560_1.state_ = "waiting"
		end

		function arg_560_1.playNext_(arg_562_0)
			if arg_562_0 == 1 then
				arg_560_0:Play1108105135(arg_560_1)
			end
		end

		function arg_560_1.onSingleLineUpdate_(arg_563_0)
			local var_563_0 = arg_560_1.actors_["1081ui_story"].transform
			local var_563_1 = 0

			if var_563_1 < arg_560_1.time_ and arg_560_1.time_ <= var_563_1 + arg_563_0 then
				arg_560_1.var_.moveOldPos1081ui_story = var_563_0.localPosition
			end

			local var_563_2 = 0.001

			if var_563_1 <= arg_560_1.time_ and arg_560_1.time_ < var_563_1 + var_563_2 then
				local var_563_3 = (arg_560_1.time_ - var_563_1) / var_563_2
				local var_563_4 = Vector3.New(0, -0.92, -5.8)

				var_563_0.localPosition = Vector3.Lerp(arg_560_1.var_.moveOldPos1081ui_story, var_563_4, var_563_3)

				local var_563_5 = manager.ui.mainCamera.transform.position - var_563_0.position

				var_563_0.forward = Vector3.New(var_563_5.x, var_563_5.y, var_563_5.z)

				local var_563_6 = var_563_0.localEulerAngles

				var_563_6.z = 0
				var_563_6.x = 0
				var_563_0.localEulerAngles = var_563_6
			end

			if arg_560_1.time_ >= var_563_1 + var_563_2 and arg_560_1.time_ < var_563_1 + var_563_2 + arg_563_0 then
				var_563_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_563_7 = manager.ui.mainCamera.transform.position - var_563_0.position

				var_563_0.forward = Vector3.New(var_563_7.x, var_563_7.y, var_563_7.z)

				local var_563_8 = var_563_0.localEulerAngles

				var_563_8.z = 0
				var_563_8.x = 0
				var_563_0.localEulerAngles = var_563_8
			end

			local var_563_9 = arg_560_1.actors_["1081ui_story"]
			local var_563_10 = 0

			if var_563_10 < arg_560_1.time_ and arg_560_1.time_ <= var_563_10 + arg_563_0 and arg_560_1.var_.characterEffect1081ui_story == nil then
				arg_560_1.var_.characterEffect1081ui_story = var_563_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_563_11 = 0.200000002980232

			if var_563_10 <= arg_560_1.time_ and arg_560_1.time_ < var_563_10 + var_563_11 then
				local var_563_12 = (arg_560_1.time_ - var_563_10) / var_563_11

				if arg_560_1.var_.characterEffect1081ui_story then
					arg_560_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_560_1.time_ >= var_563_10 + var_563_11 and arg_560_1.time_ < var_563_10 + var_563_11 + arg_563_0 and arg_560_1.var_.characterEffect1081ui_story then
				arg_560_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_563_13 = 0

			if var_563_13 < arg_560_1.time_ and arg_560_1.time_ <= var_563_13 + arg_563_0 then
				arg_560_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_563_14 = 0
			local var_563_15 = 0.725

			if var_563_14 < arg_560_1.time_ and arg_560_1.time_ <= var_563_14 + arg_563_0 then
				arg_560_1.talkMaxDuration = 0
				arg_560_1.dialogCg_.alpha = 1

				arg_560_1.dialog_:SetActive(true)
				SetActive(arg_560_1.leftNameGo_, true)

				local var_563_16 = arg_560_1:FormatText(StoryNameCfg[202].name)

				arg_560_1.leftNameTxt_.text = var_563_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_560_1.leftNameTxt_.transform)

				arg_560_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_560_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_560_1:RecordName(arg_560_1.leftNameTxt_.text)
				SetActive(arg_560_1.iconTrs_.gameObject, false)
				arg_560_1.callingController_:SetSelectedState("normal")

				local var_563_17 = arg_560_1:GetWordFromCfg(1108105134)
				local var_563_18 = arg_560_1:FormatText(var_563_17.content)

				arg_560_1.text_.text = var_563_18

				LuaForUtil.ClearLinePrefixSymbol(arg_560_1.text_)

				local var_563_19 = 29
				local var_563_20 = utf8.len(var_563_18)
				local var_563_21 = var_563_19 <= 0 and var_563_15 or var_563_15 * (var_563_20 / var_563_19)

				if var_563_21 > 0 and var_563_15 < var_563_21 then
					arg_560_1.talkMaxDuration = var_563_21

					if var_563_21 + var_563_14 > arg_560_1.duration_ then
						arg_560_1.duration_ = var_563_21 + var_563_14
					end
				end

				arg_560_1.text_.text = var_563_18
				arg_560_1.typewritter.percent = 0

				arg_560_1.typewritter:SetDirty()
				arg_560_1:ShowNextGo(false)
				arg_560_1:RecordContent(arg_560_1.text_.text)
			end

			local var_563_22 = math.max(var_563_15, arg_560_1.talkMaxDuration)

			if var_563_14 <= arg_560_1.time_ and arg_560_1.time_ < var_563_14 + var_563_22 then
				arg_560_1.typewritter.percent = (arg_560_1.time_ - var_563_14) / var_563_22

				arg_560_1.typewritter:SetDirty()
			end

			if arg_560_1.time_ >= var_563_14 + var_563_22 and arg_560_1.time_ < var_563_14 + var_563_22 + arg_563_0 then
				arg_560_1.typewritter.percent = 1

				arg_560_1.typewritter:SetDirty()
				arg_560_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105135 = function(arg_564_0, arg_564_1)
		arg_564_1.time_ = 0
		arg_564_1.frameCnt_ = 0
		arg_564_1.state_ = "playing"
		arg_564_1.curTalkId_ = 1108105135
		arg_564_1.duration_ = 5

		SetActive(arg_564_1.tipsGo_, false)

		function arg_564_1.onSingleLineFinish_()
			arg_564_1.onSingleLineUpdate_ = nil
			arg_564_1.onSingleLineFinish_ = nil
			arg_564_1.state_ = "waiting"
		end

		function arg_564_1.playNext_(arg_566_0)
			if arg_566_0 == 1 then
				arg_564_0:Play1108105136(arg_564_1)
			end
		end

		function arg_564_1.onSingleLineUpdate_(arg_567_0)
			local var_567_0 = arg_564_1.actors_["1081ui_story"]
			local var_567_1 = 0

			if var_567_1 < arg_564_1.time_ and arg_564_1.time_ <= var_567_1 + arg_567_0 and arg_564_1.var_.characterEffect1081ui_story == nil then
				arg_564_1.var_.characterEffect1081ui_story = var_567_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_567_2 = 0.200000002980232

			if var_567_1 <= arg_564_1.time_ and arg_564_1.time_ < var_567_1 + var_567_2 then
				local var_567_3 = (arg_564_1.time_ - var_567_1) / var_567_2

				if arg_564_1.var_.characterEffect1081ui_story then
					local var_567_4 = Mathf.Lerp(0, 0.5, var_567_3)

					arg_564_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_564_1.var_.characterEffect1081ui_story.fillRatio = var_567_4
				end
			end

			if arg_564_1.time_ >= var_567_1 + var_567_2 and arg_564_1.time_ < var_567_1 + var_567_2 + arg_567_0 and arg_564_1.var_.characterEffect1081ui_story then
				local var_567_5 = 0.5

				arg_564_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_564_1.var_.characterEffect1081ui_story.fillRatio = var_567_5
			end

			local var_567_6 = 0
			local var_567_7 = 0.5

			if var_567_6 < arg_564_1.time_ and arg_564_1.time_ <= var_567_6 + arg_567_0 then
				arg_564_1.talkMaxDuration = 0
				arg_564_1.dialogCg_.alpha = 1

				arg_564_1.dialog_:SetActive(true)
				SetActive(arg_564_1.leftNameGo_, true)

				local var_567_8 = arg_564_1:FormatText(StoryNameCfg[7].name)

				arg_564_1.leftNameTxt_.text = var_567_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_564_1.leftNameTxt_.transform)

				arg_564_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_564_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_564_1:RecordName(arg_564_1.leftNameTxt_.text)
				SetActive(arg_564_1.iconTrs_.gameObject, false)
				arg_564_1.callingController_:SetSelectedState("normal")

				local var_567_9 = arg_564_1:GetWordFromCfg(1108105135)
				local var_567_10 = arg_564_1:FormatText(var_567_9.content)

				arg_564_1.text_.text = var_567_10

				LuaForUtil.ClearLinePrefixSymbol(arg_564_1.text_)

				local var_567_11 = 20
				local var_567_12 = utf8.len(var_567_10)
				local var_567_13 = var_567_11 <= 0 and var_567_7 or var_567_7 * (var_567_12 / var_567_11)

				if var_567_13 > 0 and var_567_7 < var_567_13 then
					arg_564_1.talkMaxDuration = var_567_13

					if var_567_13 + var_567_6 > arg_564_1.duration_ then
						arg_564_1.duration_ = var_567_13 + var_567_6
					end
				end

				arg_564_1.text_.text = var_567_10
				arg_564_1.typewritter.percent = 0

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(false)
				arg_564_1:RecordContent(arg_564_1.text_.text)
			end

			local var_567_14 = math.max(var_567_7, arg_564_1.talkMaxDuration)

			if var_567_6 <= arg_564_1.time_ and arg_564_1.time_ < var_567_6 + var_567_14 then
				arg_564_1.typewritter.percent = (arg_564_1.time_ - var_567_6) / var_567_14

				arg_564_1.typewritter:SetDirty()
			end

			if arg_564_1.time_ >= var_567_6 + var_567_14 and arg_564_1.time_ < var_567_6 + var_567_14 + arg_567_0 then
				arg_564_1.typewritter.percent = 1

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105136 = function(arg_568_0, arg_568_1)
		arg_568_1.time_ = 0
		arg_568_1.frameCnt_ = 0
		arg_568_1.state_ = "playing"
		arg_568_1.curTalkId_ = 1108105136
		arg_568_1.duration_ = 5

		SetActive(arg_568_1.tipsGo_, false)

		function arg_568_1.onSingleLineFinish_()
			arg_568_1.onSingleLineUpdate_ = nil
			arg_568_1.onSingleLineFinish_ = nil
			arg_568_1.state_ = "waiting"
		end

		function arg_568_1.playNext_(arg_570_0)
			if arg_570_0 == 1 then
				arg_568_0:Play1108105137(arg_568_1)
			end
		end

		function arg_568_1.onSingleLineUpdate_(arg_571_0)
			local var_571_0 = arg_568_1.actors_["1081ui_story"].transform
			local var_571_1 = 0

			if var_571_1 < arg_568_1.time_ and arg_568_1.time_ <= var_571_1 + arg_571_0 then
				arg_568_1.var_.moveOldPos1081ui_story = var_571_0.localPosition
			end

			local var_571_2 = 0.001

			if var_571_1 <= arg_568_1.time_ and arg_568_1.time_ < var_571_1 + var_571_2 then
				local var_571_3 = (arg_568_1.time_ - var_571_1) / var_571_2
				local var_571_4 = Vector3.New(0, -0.92, -5.8)

				var_571_0.localPosition = Vector3.Lerp(arg_568_1.var_.moveOldPos1081ui_story, var_571_4, var_571_3)

				local var_571_5 = manager.ui.mainCamera.transform.position - var_571_0.position

				var_571_0.forward = Vector3.New(var_571_5.x, var_571_5.y, var_571_5.z)

				local var_571_6 = var_571_0.localEulerAngles

				var_571_6.z = 0
				var_571_6.x = 0
				var_571_0.localEulerAngles = var_571_6
			end

			if arg_568_1.time_ >= var_571_1 + var_571_2 and arg_568_1.time_ < var_571_1 + var_571_2 + arg_571_0 then
				var_571_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_571_7 = manager.ui.mainCamera.transform.position - var_571_0.position

				var_571_0.forward = Vector3.New(var_571_7.x, var_571_7.y, var_571_7.z)

				local var_571_8 = var_571_0.localEulerAngles

				var_571_8.z = 0
				var_571_8.x = 0
				var_571_0.localEulerAngles = var_571_8
			end

			local var_571_9 = arg_568_1.actors_["1081ui_story"]
			local var_571_10 = 0

			if var_571_10 < arg_568_1.time_ and arg_568_1.time_ <= var_571_10 + arg_571_0 and arg_568_1.var_.characterEffect1081ui_story == nil then
				arg_568_1.var_.characterEffect1081ui_story = var_571_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_571_11 = 0.200000002980232

			if var_571_10 <= arg_568_1.time_ and arg_568_1.time_ < var_571_10 + var_571_11 then
				local var_571_12 = (arg_568_1.time_ - var_571_10) / var_571_11

				if arg_568_1.var_.characterEffect1081ui_story then
					arg_568_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_568_1.time_ >= var_571_10 + var_571_11 and arg_568_1.time_ < var_571_10 + var_571_11 + arg_571_0 and arg_568_1.var_.characterEffect1081ui_story then
				arg_568_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_571_13 = 0

			if var_571_13 < arg_568_1.time_ and arg_568_1.time_ <= var_571_13 + arg_571_0 then
				arg_568_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action9_1")
			end

			local var_571_14 = 0

			if var_571_14 < arg_568_1.time_ and arg_568_1.time_ <= var_571_14 + arg_571_0 then
				arg_568_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_571_15 = 0
			local var_571_16 = 0.325

			if var_571_15 < arg_568_1.time_ and arg_568_1.time_ <= var_571_15 + arg_571_0 then
				arg_568_1.talkMaxDuration = 0
				arg_568_1.dialogCg_.alpha = 1

				arg_568_1.dialog_:SetActive(true)
				SetActive(arg_568_1.leftNameGo_, true)

				local var_571_17 = arg_568_1:FormatText(StoryNameCfg[202].name)

				arg_568_1.leftNameTxt_.text = var_571_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_568_1.leftNameTxt_.transform)

				arg_568_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_568_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_568_1:RecordName(arg_568_1.leftNameTxt_.text)
				SetActive(arg_568_1.iconTrs_.gameObject, false)
				arg_568_1.callingController_:SetSelectedState("normal")

				local var_571_18 = arg_568_1:GetWordFromCfg(1108105136)
				local var_571_19 = arg_568_1:FormatText(var_571_18.content)

				arg_568_1.text_.text = var_571_19

				LuaForUtil.ClearLinePrefixSymbol(arg_568_1.text_)

				local var_571_20 = 13
				local var_571_21 = utf8.len(var_571_19)
				local var_571_22 = var_571_20 <= 0 and var_571_16 or var_571_16 * (var_571_21 / var_571_20)

				if var_571_22 > 0 and var_571_16 < var_571_22 then
					arg_568_1.talkMaxDuration = var_571_22

					if var_571_22 + var_571_15 > arg_568_1.duration_ then
						arg_568_1.duration_ = var_571_22 + var_571_15
					end
				end

				arg_568_1.text_.text = var_571_19
				arg_568_1.typewritter.percent = 0

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(false)
				arg_568_1:RecordContent(arg_568_1.text_.text)
			end

			local var_571_23 = math.max(var_571_16, arg_568_1.talkMaxDuration)

			if var_571_15 <= arg_568_1.time_ and arg_568_1.time_ < var_571_15 + var_571_23 then
				arg_568_1.typewritter.percent = (arg_568_1.time_ - var_571_15) / var_571_23

				arg_568_1.typewritter:SetDirty()
			end

			if arg_568_1.time_ >= var_571_15 + var_571_23 and arg_568_1.time_ < var_571_15 + var_571_23 + arg_571_0 then
				arg_568_1.typewritter.percent = 1

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105137 = function(arg_572_0, arg_572_1)
		arg_572_1.time_ = 0
		arg_572_1.frameCnt_ = 0
		arg_572_1.state_ = "playing"
		arg_572_1.curTalkId_ = 1108105137
		arg_572_1.duration_ = 5

		SetActive(arg_572_1.tipsGo_, false)

		function arg_572_1.onSingleLineFinish_()
			arg_572_1.onSingleLineUpdate_ = nil
			arg_572_1.onSingleLineFinish_ = nil
			arg_572_1.state_ = "waiting"
		end

		function arg_572_1.playNext_(arg_574_0)
			if arg_574_0 == 1 then
				arg_572_0:Play1108105138(arg_572_1)
			end
		end

		function arg_572_1.onSingleLineUpdate_(arg_575_0)
			local var_575_0 = arg_572_1.actors_["1081ui_story"]
			local var_575_1 = 0

			if var_575_1 < arg_572_1.time_ and arg_572_1.time_ <= var_575_1 + arg_575_0 and arg_572_1.var_.characterEffect1081ui_story == nil then
				arg_572_1.var_.characterEffect1081ui_story = var_575_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_575_2 = 0.034000001847744

			if var_575_1 <= arg_572_1.time_ and arg_572_1.time_ < var_575_1 + var_575_2 then
				local var_575_3 = (arg_572_1.time_ - var_575_1) / var_575_2

				if arg_572_1.var_.characterEffect1081ui_story then
					local var_575_4 = Mathf.Lerp(0, 0.5, var_575_3)

					arg_572_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_572_1.var_.characterEffect1081ui_story.fillRatio = var_575_4
				end
			end

			if arg_572_1.time_ >= var_575_1 + var_575_2 and arg_572_1.time_ < var_575_1 + var_575_2 + arg_575_0 and arg_572_1.var_.characterEffect1081ui_story then
				local var_575_5 = 0.5

				arg_572_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_572_1.var_.characterEffect1081ui_story.fillRatio = var_575_5
			end

			local var_575_6 = arg_572_1.actors_["1081ui_story"].transform
			local var_575_7 = 0

			if var_575_7 < arg_572_1.time_ and arg_572_1.time_ <= var_575_7 + arg_575_0 then
				arg_572_1.var_.moveOldPos1081ui_story = var_575_6.localPosition
			end

			local var_575_8 = 0.001

			if var_575_7 <= arg_572_1.time_ and arg_572_1.time_ < var_575_7 + var_575_8 then
				local var_575_9 = (arg_572_1.time_ - var_575_7) / var_575_8
				local var_575_10 = Vector3.New(0, 100, 0)

				var_575_6.localPosition = Vector3.Lerp(arg_572_1.var_.moveOldPos1081ui_story, var_575_10, var_575_9)

				local var_575_11 = manager.ui.mainCamera.transform.position - var_575_6.position

				var_575_6.forward = Vector3.New(var_575_11.x, var_575_11.y, var_575_11.z)

				local var_575_12 = var_575_6.localEulerAngles

				var_575_12.z = 0
				var_575_12.x = 0
				var_575_6.localEulerAngles = var_575_12
			end

			if arg_572_1.time_ >= var_575_7 + var_575_8 and arg_572_1.time_ < var_575_7 + var_575_8 + arg_575_0 then
				var_575_6.localPosition = Vector3.New(0, 100, 0)

				local var_575_13 = manager.ui.mainCamera.transform.position - var_575_6.position

				var_575_6.forward = Vector3.New(var_575_13.x, var_575_13.y, var_575_13.z)

				local var_575_14 = var_575_6.localEulerAngles

				var_575_14.z = 0
				var_575_14.x = 0
				var_575_6.localEulerAngles = var_575_14
			end

			local var_575_15 = 0
			local var_575_16 = 1.3

			if var_575_15 < arg_572_1.time_ and arg_572_1.time_ <= var_575_15 + arg_575_0 then
				arg_572_1.talkMaxDuration = 0
				arg_572_1.dialogCg_.alpha = 1

				arg_572_1.dialog_:SetActive(true)
				SetActive(arg_572_1.leftNameGo_, false)

				arg_572_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_572_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_572_1:RecordName(arg_572_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_572_1.iconTrs_.gameObject, false)
				arg_572_1.callingController_:SetSelectedState("normal")

				local var_575_17 = arg_572_1:GetWordFromCfg(1108105137)
				local var_575_18 = arg_572_1:FormatText(var_575_17.content)

				arg_572_1.text_.text = var_575_18

				LuaForUtil.ClearLinePrefixSymbol(arg_572_1.text_)

				local var_575_19 = 52
				local var_575_20 = utf8.len(var_575_18)
				local var_575_21 = var_575_19 <= 0 and var_575_16 or var_575_16 * (var_575_20 / var_575_19)

				if var_575_21 > 0 and var_575_16 < var_575_21 then
					arg_572_1.talkMaxDuration = var_575_21

					if var_575_21 + var_575_15 > arg_572_1.duration_ then
						arg_572_1.duration_ = var_575_21 + var_575_15
					end
				end

				arg_572_1.text_.text = var_575_18
				arg_572_1.typewritter.percent = 0

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(false)
				arg_572_1:RecordContent(arg_572_1.text_.text)
			end

			local var_575_22 = math.max(var_575_16, arg_572_1.talkMaxDuration)

			if var_575_15 <= arg_572_1.time_ and arg_572_1.time_ < var_575_15 + var_575_22 then
				arg_572_1.typewritter.percent = (arg_572_1.time_ - var_575_15) / var_575_22

				arg_572_1.typewritter:SetDirty()
			end

			if arg_572_1.time_ >= var_575_15 + var_575_22 and arg_572_1.time_ < var_575_15 + var_575_22 + arg_575_0 then
				arg_572_1.typewritter.percent = 1

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105138 = function(arg_576_0, arg_576_1)
		arg_576_1.time_ = 0
		arg_576_1.frameCnt_ = 0
		arg_576_1.state_ = "playing"
		arg_576_1.curTalkId_ = 1108105138
		arg_576_1.duration_ = 5

		SetActive(arg_576_1.tipsGo_, false)

		function arg_576_1.onSingleLineFinish_()
			arg_576_1.onSingleLineUpdate_ = nil
			arg_576_1.onSingleLineFinish_ = nil
			arg_576_1.state_ = "waiting"
		end

		function arg_576_1.playNext_(arg_578_0)
			if arg_578_0 == 1 then
				arg_576_0:Play1108105139(arg_576_1)
			end
		end

		function arg_576_1.onSingleLineUpdate_(arg_579_0)
			local var_579_0 = 0
			local var_579_1 = 0.625

			if var_579_0 < arg_576_1.time_ and arg_576_1.time_ <= var_579_0 + arg_579_0 then
				arg_576_1.talkMaxDuration = 0
				arg_576_1.dialogCg_.alpha = 1

				arg_576_1.dialog_:SetActive(true)
				SetActive(arg_576_1.leftNameGo_, true)

				local var_579_2 = arg_576_1:FormatText(StoryNameCfg[7].name)

				arg_576_1.leftNameTxt_.text = var_579_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_576_1.leftNameTxt_.transform)

				arg_576_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_576_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_576_1:RecordName(arg_576_1.leftNameTxt_.text)
				SetActive(arg_576_1.iconTrs_.gameObject, false)
				arg_576_1.callingController_:SetSelectedState("normal")

				local var_579_3 = arg_576_1:GetWordFromCfg(1108105138)
				local var_579_4 = arg_576_1:FormatText(var_579_3.content)

				arg_576_1.text_.text = var_579_4

				LuaForUtil.ClearLinePrefixSymbol(arg_576_1.text_)

				local var_579_5 = 25
				local var_579_6 = utf8.len(var_579_4)
				local var_579_7 = var_579_5 <= 0 and var_579_1 or var_579_1 * (var_579_6 / var_579_5)

				if var_579_7 > 0 and var_579_1 < var_579_7 then
					arg_576_1.talkMaxDuration = var_579_7

					if var_579_7 + var_579_0 > arg_576_1.duration_ then
						arg_576_1.duration_ = var_579_7 + var_579_0
					end
				end

				arg_576_1.text_.text = var_579_4
				arg_576_1.typewritter.percent = 0

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(false)
				arg_576_1:RecordContent(arg_576_1.text_.text)
			end

			local var_579_8 = math.max(var_579_1, arg_576_1.talkMaxDuration)

			if var_579_0 <= arg_576_1.time_ and arg_576_1.time_ < var_579_0 + var_579_8 then
				arg_576_1.typewritter.percent = (arg_576_1.time_ - var_579_0) / var_579_8

				arg_576_1.typewritter:SetDirty()
			end

			if arg_576_1.time_ >= var_579_0 + var_579_8 and arg_576_1.time_ < var_579_0 + var_579_8 + arg_579_0 then
				arg_576_1.typewritter.percent = 1

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105139 = function(arg_580_0, arg_580_1)
		arg_580_1.time_ = 0
		arg_580_1.frameCnt_ = 0
		arg_580_1.state_ = "playing"
		arg_580_1.curTalkId_ = 1108105139
		arg_580_1.duration_ = 5

		SetActive(arg_580_1.tipsGo_, false)

		function arg_580_1.onSingleLineFinish_()
			arg_580_1.onSingleLineUpdate_ = nil
			arg_580_1.onSingleLineFinish_ = nil
			arg_580_1.state_ = "waiting"
		end

		function arg_580_1.playNext_(arg_582_0)
			if arg_582_0 == 1 then
				arg_580_0:Play1108105140(arg_580_1)
			end
		end

		function arg_580_1.onSingleLineUpdate_(arg_583_0)
			local var_583_0 = arg_580_1.actors_["1081ui_story"].transform
			local var_583_1 = 0

			if var_583_1 < arg_580_1.time_ and arg_580_1.time_ <= var_583_1 + arg_583_0 then
				arg_580_1.var_.moveOldPos1081ui_story = var_583_0.localPosition
			end

			local var_583_2 = 0.001

			if var_583_1 <= arg_580_1.time_ and arg_580_1.time_ < var_583_1 + var_583_2 then
				local var_583_3 = (arg_580_1.time_ - var_583_1) / var_583_2
				local var_583_4 = Vector3.New(0, -0.92, -5.8)

				var_583_0.localPosition = Vector3.Lerp(arg_580_1.var_.moveOldPos1081ui_story, var_583_4, var_583_3)

				local var_583_5 = manager.ui.mainCamera.transform.position - var_583_0.position

				var_583_0.forward = Vector3.New(var_583_5.x, var_583_5.y, var_583_5.z)

				local var_583_6 = var_583_0.localEulerAngles

				var_583_6.z = 0
				var_583_6.x = 0
				var_583_0.localEulerAngles = var_583_6
			end

			if arg_580_1.time_ >= var_583_1 + var_583_2 and arg_580_1.time_ < var_583_1 + var_583_2 + arg_583_0 then
				var_583_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_583_7 = manager.ui.mainCamera.transform.position - var_583_0.position

				var_583_0.forward = Vector3.New(var_583_7.x, var_583_7.y, var_583_7.z)

				local var_583_8 = var_583_0.localEulerAngles

				var_583_8.z = 0
				var_583_8.x = 0
				var_583_0.localEulerAngles = var_583_8
			end

			local var_583_9 = arg_580_1.actors_["1081ui_story"]
			local var_583_10 = 0

			if var_583_10 < arg_580_1.time_ and arg_580_1.time_ <= var_583_10 + arg_583_0 and arg_580_1.var_.characterEffect1081ui_story == nil then
				arg_580_1.var_.characterEffect1081ui_story = var_583_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_583_11 = 0.200000002980232

			if var_583_10 <= arg_580_1.time_ and arg_580_1.time_ < var_583_10 + var_583_11 then
				local var_583_12 = (arg_580_1.time_ - var_583_10) / var_583_11

				if arg_580_1.var_.characterEffect1081ui_story then
					arg_580_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_580_1.time_ >= var_583_10 + var_583_11 and arg_580_1.time_ < var_583_10 + var_583_11 + arg_583_0 and arg_580_1.var_.characterEffect1081ui_story then
				arg_580_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_583_13 = 0

			if var_583_13 < arg_580_1.time_ and arg_580_1.time_ <= var_583_13 + arg_583_0 then
				arg_580_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_583_14 = 0

			if var_583_14 < arg_580_1.time_ and arg_580_1.time_ <= var_583_14 + arg_583_0 then
				arg_580_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_583_15 = 0
			local var_583_16 = 0.45

			if var_583_15 < arg_580_1.time_ and arg_580_1.time_ <= var_583_15 + arg_583_0 then
				arg_580_1.talkMaxDuration = 0
				arg_580_1.dialogCg_.alpha = 1

				arg_580_1.dialog_:SetActive(true)
				SetActive(arg_580_1.leftNameGo_, true)

				local var_583_17 = arg_580_1:FormatText(StoryNameCfg[202].name)

				arg_580_1.leftNameTxt_.text = var_583_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_580_1.leftNameTxt_.transform)

				arg_580_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_580_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_580_1:RecordName(arg_580_1.leftNameTxt_.text)
				SetActive(arg_580_1.iconTrs_.gameObject, false)
				arg_580_1.callingController_:SetSelectedState("normal")

				local var_583_18 = arg_580_1:GetWordFromCfg(1108105139)
				local var_583_19 = arg_580_1:FormatText(var_583_18.content)

				arg_580_1.text_.text = var_583_19

				LuaForUtil.ClearLinePrefixSymbol(arg_580_1.text_)

				local var_583_20 = 18
				local var_583_21 = utf8.len(var_583_19)
				local var_583_22 = var_583_20 <= 0 and var_583_16 or var_583_16 * (var_583_21 / var_583_20)

				if var_583_22 > 0 and var_583_16 < var_583_22 then
					arg_580_1.talkMaxDuration = var_583_22

					if var_583_22 + var_583_15 > arg_580_1.duration_ then
						arg_580_1.duration_ = var_583_22 + var_583_15
					end
				end

				arg_580_1.text_.text = var_583_19
				arg_580_1.typewritter.percent = 0

				arg_580_1.typewritter:SetDirty()
				arg_580_1:ShowNextGo(false)
				arg_580_1:RecordContent(arg_580_1.text_.text)
			end

			local var_583_23 = math.max(var_583_16, arg_580_1.talkMaxDuration)

			if var_583_15 <= arg_580_1.time_ and arg_580_1.time_ < var_583_15 + var_583_23 then
				arg_580_1.typewritter.percent = (arg_580_1.time_ - var_583_15) / var_583_23

				arg_580_1.typewritter:SetDirty()
			end

			if arg_580_1.time_ >= var_583_15 + var_583_23 and arg_580_1.time_ < var_583_15 + var_583_23 + arg_583_0 then
				arg_580_1.typewritter.percent = 1

				arg_580_1.typewritter:SetDirty()
				arg_580_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105140 = function(arg_584_0, arg_584_1)
		arg_584_1.time_ = 0
		arg_584_1.frameCnt_ = 0
		arg_584_1.state_ = "playing"
		arg_584_1.curTalkId_ = 1108105140
		arg_584_1.duration_ = 5

		SetActive(arg_584_1.tipsGo_, false)

		function arg_584_1.onSingleLineFinish_()
			arg_584_1.onSingleLineUpdate_ = nil
			arg_584_1.onSingleLineFinish_ = nil
			arg_584_1.state_ = "waiting"
		end

		function arg_584_1.playNext_(arg_586_0)
			if arg_586_0 == 1 then
				arg_584_0:Play1108105141(arg_584_1)
			end
		end

		function arg_584_1.onSingleLineUpdate_(arg_587_0)
			local var_587_0 = arg_584_1.actors_["1081ui_story"]
			local var_587_1 = 0

			if var_587_1 < arg_584_1.time_ and arg_584_1.time_ <= var_587_1 + arg_587_0 and arg_584_1.var_.characterEffect1081ui_story == nil then
				arg_584_1.var_.characterEffect1081ui_story = var_587_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_587_2 = 0.200000002980232

			if var_587_1 <= arg_584_1.time_ and arg_584_1.time_ < var_587_1 + var_587_2 then
				local var_587_3 = (arg_584_1.time_ - var_587_1) / var_587_2

				if arg_584_1.var_.characterEffect1081ui_story then
					local var_587_4 = Mathf.Lerp(0, 0.5, var_587_3)

					arg_584_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_584_1.var_.characterEffect1081ui_story.fillRatio = var_587_4
				end
			end

			if arg_584_1.time_ >= var_587_1 + var_587_2 and arg_584_1.time_ < var_587_1 + var_587_2 + arg_587_0 and arg_584_1.var_.characterEffect1081ui_story then
				local var_587_5 = 0.5

				arg_584_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_584_1.var_.characterEffect1081ui_story.fillRatio = var_587_5
			end

			local var_587_6 = arg_584_1.actors_["1081ui_story"].transform
			local var_587_7 = 0

			if var_587_7 < arg_584_1.time_ and arg_584_1.time_ <= var_587_7 + arg_587_0 then
				arg_584_1.var_.moveOldPos1081ui_story = var_587_6.localPosition
			end

			local var_587_8 = 0.001

			if var_587_7 <= arg_584_1.time_ and arg_584_1.time_ < var_587_7 + var_587_8 then
				local var_587_9 = (arg_584_1.time_ - var_587_7) / var_587_8
				local var_587_10 = Vector3.New(0, 100, 0)

				var_587_6.localPosition = Vector3.Lerp(arg_584_1.var_.moveOldPos1081ui_story, var_587_10, var_587_9)

				local var_587_11 = manager.ui.mainCamera.transform.position - var_587_6.position

				var_587_6.forward = Vector3.New(var_587_11.x, var_587_11.y, var_587_11.z)

				local var_587_12 = var_587_6.localEulerAngles

				var_587_12.z = 0
				var_587_12.x = 0
				var_587_6.localEulerAngles = var_587_12
			end

			if arg_584_1.time_ >= var_587_7 + var_587_8 and arg_584_1.time_ < var_587_7 + var_587_8 + arg_587_0 then
				var_587_6.localPosition = Vector3.New(0, 100, 0)

				local var_587_13 = manager.ui.mainCamera.transform.position - var_587_6.position

				var_587_6.forward = Vector3.New(var_587_13.x, var_587_13.y, var_587_13.z)

				local var_587_14 = var_587_6.localEulerAngles

				var_587_14.z = 0
				var_587_14.x = 0
				var_587_6.localEulerAngles = var_587_14
			end

			local var_587_15 = 0
			local var_587_16 = 1.05

			if var_587_15 < arg_584_1.time_ and arg_584_1.time_ <= var_587_15 + arg_587_0 then
				arg_584_1.talkMaxDuration = 0
				arg_584_1.dialogCg_.alpha = 1

				arg_584_1.dialog_:SetActive(true)
				SetActive(arg_584_1.leftNameGo_, false)

				arg_584_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_584_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_584_1:RecordName(arg_584_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_584_1.iconTrs_.gameObject, false)
				arg_584_1.callingController_:SetSelectedState("normal")

				local var_587_17 = arg_584_1:GetWordFromCfg(1108105140)
				local var_587_18 = arg_584_1:FormatText(var_587_17.content)

				arg_584_1.text_.text = var_587_18

				LuaForUtil.ClearLinePrefixSymbol(arg_584_1.text_)

				local var_587_19 = 42
				local var_587_20 = utf8.len(var_587_18)
				local var_587_21 = var_587_19 <= 0 and var_587_16 or var_587_16 * (var_587_20 / var_587_19)

				if var_587_21 > 0 and var_587_16 < var_587_21 then
					arg_584_1.talkMaxDuration = var_587_21

					if var_587_21 + var_587_15 > arg_584_1.duration_ then
						arg_584_1.duration_ = var_587_21 + var_587_15
					end
				end

				arg_584_1.text_.text = var_587_18
				arg_584_1.typewritter.percent = 0

				arg_584_1.typewritter:SetDirty()
				arg_584_1:ShowNextGo(false)
				arg_584_1:RecordContent(arg_584_1.text_.text)
			end

			local var_587_22 = math.max(var_587_16, arg_584_1.talkMaxDuration)

			if var_587_15 <= arg_584_1.time_ and arg_584_1.time_ < var_587_15 + var_587_22 then
				arg_584_1.typewritter.percent = (arg_584_1.time_ - var_587_15) / var_587_22

				arg_584_1.typewritter:SetDirty()
			end

			if arg_584_1.time_ >= var_587_15 + var_587_22 and arg_584_1.time_ < var_587_15 + var_587_22 + arg_587_0 then
				arg_584_1.typewritter.percent = 1

				arg_584_1.typewritter:SetDirty()
				arg_584_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105141 = function(arg_588_0, arg_588_1)
		arg_588_1.time_ = 0
		arg_588_1.frameCnt_ = 0
		arg_588_1.state_ = "playing"
		arg_588_1.curTalkId_ = 1108105141
		arg_588_1.duration_ = 5

		SetActive(arg_588_1.tipsGo_, false)

		function arg_588_1.onSingleLineFinish_()
			arg_588_1.onSingleLineUpdate_ = nil
			arg_588_1.onSingleLineFinish_ = nil
			arg_588_1.state_ = "waiting"
		end

		function arg_588_1.playNext_(arg_590_0)
			if arg_590_0 == 1 then
				arg_588_0:Play1108105142(arg_588_1)
			end
		end

		function arg_588_1.onSingleLineUpdate_(arg_591_0)
			local var_591_0 = arg_588_1.actors_["1081ui_story"].transform
			local var_591_1 = 0

			if var_591_1 < arg_588_1.time_ and arg_588_1.time_ <= var_591_1 + arg_591_0 then
				arg_588_1.var_.moveOldPos1081ui_story = var_591_0.localPosition
			end

			local var_591_2 = 0.001

			if var_591_1 <= arg_588_1.time_ and arg_588_1.time_ < var_591_1 + var_591_2 then
				local var_591_3 = (arg_588_1.time_ - var_591_1) / var_591_2
				local var_591_4 = Vector3.New(0, -0.92, -5.8)

				var_591_0.localPosition = Vector3.Lerp(arg_588_1.var_.moveOldPos1081ui_story, var_591_4, var_591_3)

				local var_591_5 = manager.ui.mainCamera.transform.position - var_591_0.position

				var_591_0.forward = Vector3.New(var_591_5.x, var_591_5.y, var_591_5.z)

				local var_591_6 = var_591_0.localEulerAngles

				var_591_6.z = 0
				var_591_6.x = 0
				var_591_0.localEulerAngles = var_591_6
			end

			if arg_588_1.time_ >= var_591_1 + var_591_2 and arg_588_1.time_ < var_591_1 + var_591_2 + arg_591_0 then
				var_591_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_591_7 = manager.ui.mainCamera.transform.position - var_591_0.position

				var_591_0.forward = Vector3.New(var_591_7.x, var_591_7.y, var_591_7.z)

				local var_591_8 = var_591_0.localEulerAngles

				var_591_8.z = 0
				var_591_8.x = 0
				var_591_0.localEulerAngles = var_591_8
			end

			local var_591_9 = arg_588_1.actors_["1081ui_story"]
			local var_591_10 = 0

			if var_591_10 < arg_588_1.time_ and arg_588_1.time_ <= var_591_10 + arg_591_0 and arg_588_1.var_.characterEffect1081ui_story == nil then
				arg_588_1.var_.characterEffect1081ui_story = var_591_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_591_11 = 0.200000002980232

			if var_591_10 <= arg_588_1.time_ and arg_588_1.time_ < var_591_10 + var_591_11 then
				local var_591_12 = (arg_588_1.time_ - var_591_10) / var_591_11

				if arg_588_1.var_.characterEffect1081ui_story then
					arg_588_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_588_1.time_ >= var_591_10 + var_591_11 and arg_588_1.time_ < var_591_10 + var_591_11 + arg_591_0 and arg_588_1.var_.characterEffect1081ui_story then
				arg_588_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_591_13 = 0

			if var_591_13 < arg_588_1.time_ and arg_588_1.time_ <= var_591_13 + arg_591_0 then
				arg_588_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_591_14 = 0

			if var_591_14 < arg_588_1.time_ and arg_588_1.time_ <= var_591_14 + arg_591_0 then
				arg_588_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_591_15 = 0
			local var_591_16 = 0.7

			if var_591_15 < arg_588_1.time_ and arg_588_1.time_ <= var_591_15 + arg_591_0 then
				arg_588_1.talkMaxDuration = 0
				arg_588_1.dialogCg_.alpha = 1

				arg_588_1.dialog_:SetActive(true)
				SetActive(arg_588_1.leftNameGo_, true)

				local var_591_17 = arg_588_1:FormatText(StoryNameCfg[202].name)

				arg_588_1.leftNameTxt_.text = var_591_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_588_1.leftNameTxt_.transform)

				arg_588_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_588_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_588_1:RecordName(arg_588_1.leftNameTxt_.text)
				SetActive(arg_588_1.iconTrs_.gameObject, false)
				arg_588_1.callingController_:SetSelectedState("normal")

				local var_591_18 = arg_588_1:GetWordFromCfg(1108105141)
				local var_591_19 = arg_588_1:FormatText(var_591_18.content)

				arg_588_1.text_.text = var_591_19

				LuaForUtil.ClearLinePrefixSymbol(arg_588_1.text_)

				local var_591_20 = 28
				local var_591_21 = utf8.len(var_591_19)
				local var_591_22 = var_591_20 <= 0 and var_591_16 or var_591_16 * (var_591_21 / var_591_20)

				if var_591_22 > 0 and var_591_16 < var_591_22 then
					arg_588_1.talkMaxDuration = var_591_22

					if var_591_22 + var_591_15 > arg_588_1.duration_ then
						arg_588_1.duration_ = var_591_22 + var_591_15
					end
				end

				arg_588_1.text_.text = var_591_19
				arg_588_1.typewritter.percent = 0

				arg_588_1.typewritter:SetDirty()
				arg_588_1:ShowNextGo(false)
				arg_588_1:RecordContent(arg_588_1.text_.text)
			end

			local var_591_23 = math.max(var_591_16, arg_588_1.talkMaxDuration)

			if var_591_15 <= arg_588_1.time_ and arg_588_1.time_ < var_591_15 + var_591_23 then
				arg_588_1.typewritter.percent = (arg_588_1.time_ - var_591_15) / var_591_23

				arg_588_1.typewritter:SetDirty()
			end

			if arg_588_1.time_ >= var_591_15 + var_591_23 and arg_588_1.time_ < var_591_15 + var_591_23 + arg_591_0 then
				arg_588_1.typewritter.percent = 1

				arg_588_1.typewritter:SetDirty()
				arg_588_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105142 = function(arg_592_0, arg_592_1)
		arg_592_1.time_ = 0
		arg_592_1.frameCnt_ = 0
		arg_592_1.state_ = "playing"
		arg_592_1.curTalkId_ = 1108105142
		arg_592_1.duration_ = 5

		SetActive(arg_592_1.tipsGo_, false)

		function arg_592_1.onSingleLineFinish_()
			arg_592_1.onSingleLineUpdate_ = nil
			arg_592_1.onSingleLineFinish_ = nil
			arg_592_1.state_ = "waiting"
		end

		function arg_592_1.playNext_(arg_594_0)
			if arg_594_0 == 1 then
				arg_592_0:Play1108105143(arg_592_1)
			end
		end

		function arg_592_1.onSingleLineUpdate_(arg_595_0)
			local var_595_0 = arg_592_1.actors_["1081ui_story"]
			local var_595_1 = 0

			if var_595_1 < arg_592_1.time_ and arg_592_1.time_ <= var_595_1 + arg_595_0 and arg_592_1.var_.characterEffect1081ui_story == nil then
				arg_592_1.var_.characterEffect1081ui_story = var_595_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_595_2 = 0.16781410574913

			if var_595_1 <= arg_592_1.time_ and arg_592_1.time_ < var_595_1 + var_595_2 then
				local var_595_3 = (arg_592_1.time_ - var_595_1) / var_595_2

				if arg_592_1.var_.characterEffect1081ui_story then
					local var_595_4 = Mathf.Lerp(0, 0.5, var_595_3)

					arg_592_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_592_1.var_.characterEffect1081ui_story.fillRatio = var_595_4
				end
			end

			if arg_592_1.time_ >= var_595_1 + var_595_2 and arg_592_1.time_ < var_595_1 + var_595_2 + arg_595_0 and arg_592_1.var_.characterEffect1081ui_story then
				local var_595_5 = 0.5

				arg_592_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_592_1.var_.characterEffect1081ui_story.fillRatio = var_595_5
			end

			local var_595_6 = 0
			local var_595_7 = 0.225

			if var_595_6 < arg_592_1.time_ and arg_592_1.time_ <= var_595_6 + arg_595_0 then
				arg_592_1.talkMaxDuration = 0
				arg_592_1.dialogCg_.alpha = 1

				arg_592_1.dialog_:SetActive(true)
				SetActive(arg_592_1.leftNameGo_, true)

				local var_595_8 = arg_592_1:FormatText(StoryNameCfg[7].name)

				arg_592_1.leftNameTxt_.text = var_595_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_592_1.leftNameTxt_.transform)

				arg_592_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_592_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_592_1:RecordName(arg_592_1.leftNameTxt_.text)
				SetActive(arg_592_1.iconTrs_.gameObject, false)
				arg_592_1.callingController_:SetSelectedState("normal")

				local var_595_9 = arg_592_1:GetWordFromCfg(1108105142)
				local var_595_10 = arg_592_1:FormatText(var_595_9.content)

				arg_592_1.text_.text = var_595_10

				LuaForUtil.ClearLinePrefixSymbol(arg_592_1.text_)

				local var_595_11 = 9
				local var_595_12 = utf8.len(var_595_10)
				local var_595_13 = var_595_11 <= 0 and var_595_7 or var_595_7 * (var_595_12 / var_595_11)

				if var_595_13 > 0 and var_595_7 < var_595_13 then
					arg_592_1.talkMaxDuration = var_595_13

					if var_595_13 + var_595_6 > arg_592_1.duration_ then
						arg_592_1.duration_ = var_595_13 + var_595_6
					end
				end

				arg_592_1.text_.text = var_595_10
				arg_592_1.typewritter.percent = 0

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(false)
				arg_592_1:RecordContent(arg_592_1.text_.text)
			end

			local var_595_14 = math.max(var_595_7, arg_592_1.talkMaxDuration)

			if var_595_6 <= arg_592_1.time_ and arg_592_1.time_ < var_595_6 + var_595_14 then
				arg_592_1.typewritter.percent = (arg_592_1.time_ - var_595_6) / var_595_14

				arg_592_1.typewritter:SetDirty()
			end

			if arg_592_1.time_ >= var_595_6 + var_595_14 and arg_592_1.time_ < var_595_6 + var_595_14 + arg_595_0 then
				arg_592_1.typewritter.percent = 1

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105143 = function(arg_596_0, arg_596_1)
		arg_596_1.time_ = 0
		arg_596_1.frameCnt_ = 0
		arg_596_1.state_ = "playing"
		arg_596_1.curTalkId_ = 1108105143
		arg_596_1.duration_ = 5

		SetActive(arg_596_1.tipsGo_, false)

		function arg_596_1.onSingleLineFinish_()
			arg_596_1.onSingleLineUpdate_ = nil
			arg_596_1.onSingleLineFinish_ = nil
			arg_596_1.state_ = "waiting"
		end

		function arg_596_1.playNext_(arg_598_0)
			if arg_598_0 == 1 then
				arg_596_0:Play1108105144(arg_596_1)
			end
		end

		function arg_596_1.onSingleLineUpdate_(arg_599_0)
			local var_599_0 = arg_596_1.actors_["1081ui_story"].transform
			local var_599_1 = 0

			if var_599_1 < arg_596_1.time_ and arg_596_1.time_ <= var_599_1 + arg_599_0 then
				arg_596_1.var_.moveOldPos1081ui_story = var_599_0.localPosition
			end

			local var_599_2 = 0.001

			if var_599_1 <= arg_596_1.time_ and arg_596_1.time_ < var_599_1 + var_599_2 then
				local var_599_3 = (arg_596_1.time_ - var_599_1) / var_599_2
				local var_599_4 = Vector3.New(0, -0.92, -5.8)

				var_599_0.localPosition = Vector3.Lerp(arg_596_1.var_.moveOldPos1081ui_story, var_599_4, var_599_3)

				local var_599_5 = manager.ui.mainCamera.transform.position - var_599_0.position

				var_599_0.forward = Vector3.New(var_599_5.x, var_599_5.y, var_599_5.z)

				local var_599_6 = var_599_0.localEulerAngles

				var_599_6.z = 0
				var_599_6.x = 0
				var_599_0.localEulerAngles = var_599_6
			end

			if arg_596_1.time_ >= var_599_1 + var_599_2 and arg_596_1.time_ < var_599_1 + var_599_2 + arg_599_0 then
				var_599_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_599_7 = manager.ui.mainCamera.transform.position - var_599_0.position

				var_599_0.forward = Vector3.New(var_599_7.x, var_599_7.y, var_599_7.z)

				local var_599_8 = var_599_0.localEulerAngles

				var_599_8.z = 0
				var_599_8.x = 0
				var_599_0.localEulerAngles = var_599_8
			end

			local var_599_9 = arg_596_1.actors_["1081ui_story"]
			local var_599_10 = 0

			if var_599_10 < arg_596_1.time_ and arg_596_1.time_ <= var_599_10 + arg_599_0 and arg_596_1.var_.characterEffect1081ui_story == nil then
				arg_596_1.var_.characterEffect1081ui_story = var_599_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_599_11 = 0.200000002980232

			if var_599_10 <= arg_596_1.time_ and arg_596_1.time_ < var_599_10 + var_599_11 then
				local var_599_12 = (arg_596_1.time_ - var_599_10) / var_599_11

				if arg_596_1.var_.characterEffect1081ui_story then
					arg_596_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_596_1.time_ >= var_599_10 + var_599_11 and arg_596_1.time_ < var_599_10 + var_599_11 + arg_599_0 and arg_596_1.var_.characterEffect1081ui_story then
				arg_596_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_599_13 = 0

			if var_599_13 < arg_596_1.time_ and arg_596_1.time_ <= var_599_13 + arg_599_0 then
				arg_596_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_599_14 = 0

			if var_599_14 < arg_596_1.time_ and arg_596_1.time_ <= var_599_14 + arg_599_0 then
				arg_596_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_599_15 = 0
			local var_599_16 = 0.65

			if var_599_15 < arg_596_1.time_ and arg_596_1.time_ <= var_599_15 + arg_599_0 then
				arg_596_1.talkMaxDuration = 0
				arg_596_1.dialogCg_.alpha = 1

				arg_596_1.dialog_:SetActive(true)
				SetActive(arg_596_1.leftNameGo_, true)

				local var_599_17 = arg_596_1:FormatText(StoryNameCfg[202].name)

				arg_596_1.leftNameTxt_.text = var_599_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_596_1.leftNameTxt_.transform)

				arg_596_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_596_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_596_1:RecordName(arg_596_1.leftNameTxt_.text)
				SetActive(arg_596_1.iconTrs_.gameObject, false)
				arg_596_1.callingController_:SetSelectedState("normal")

				local var_599_18 = arg_596_1:GetWordFromCfg(1108105143)
				local var_599_19 = arg_596_1:FormatText(var_599_18.content)

				arg_596_1.text_.text = var_599_19

				LuaForUtil.ClearLinePrefixSymbol(arg_596_1.text_)

				local var_599_20 = 26
				local var_599_21 = utf8.len(var_599_19)
				local var_599_22 = var_599_20 <= 0 and var_599_16 or var_599_16 * (var_599_21 / var_599_20)

				if var_599_22 > 0 and var_599_16 < var_599_22 then
					arg_596_1.talkMaxDuration = var_599_22

					if var_599_22 + var_599_15 > arg_596_1.duration_ then
						arg_596_1.duration_ = var_599_22 + var_599_15
					end
				end

				arg_596_1.text_.text = var_599_19
				arg_596_1.typewritter.percent = 0

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(false)
				arg_596_1:RecordContent(arg_596_1.text_.text)
			end

			local var_599_23 = math.max(var_599_16, arg_596_1.talkMaxDuration)

			if var_599_15 <= arg_596_1.time_ and arg_596_1.time_ < var_599_15 + var_599_23 then
				arg_596_1.typewritter.percent = (arg_596_1.time_ - var_599_15) / var_599_23

				arg_596_1.typewritter:SetDirty()
			end

			if arg_596_1.time_ >= var_599_15 + var_599_23 and arg_596_1.time_ < var_599_15 + var_599_23 + arg_599_0 then
				arg_596_1.typewritter.percent = 1

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105144 = function(arg_600_0, arg_600_1)
		arg_600_1.time_ = 0
		arg_600_1.frameCnt_ = 0
		arg_600_1.state_ = "playing"
		arg_600_1.curTalkId_ = 1108105144
		arg_600_1.duration_ = 5

		SetActive(arg_600_1.tipsGo_, false)

		function arg_600_1.onSingleLineFinish_()
			arg_600_1.onSingleLineUpdate_ = nil
			arg_600_1.onSingleLineFinish_ = nil
			arg_600_1.state_ = "waiting"
		end

		function arg_600_1.playNext_(arg_602_0)
			if arg_602_0 == 1 then
				arg_600_0:Play1108105145(arg_600_1)
			end
		end

		function arg_600_1.onSingleLineUpdate_(arg_603_0)
			local var_603_0 = arg_600_1.actors_["1081ui_story"]
			local var_603_1 = 0

			if var_603_1 < arg_600_1.time_ and arg_600_1.time_ <= var_603_1 + arg_603_0 and arg_600_1.var_.characterEffect1081ui_story == nil then
				arg_600_1.var_.characterEffect1081ui_story = var_603_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_603_2 = 0.200000002980232

			if var_603_1 <= arg_600_1.time_ and arg_600_1.time_ < var_603_1 + var_603_2 then
				local var_603_3 = (arg_600_1.time_ - var_603_1) / var_603_2

				if arg_600_1.var_.characterEffect1081ui_story then
					local var_603_4 = Mathf.Lerp(0, 0.5, var_603_3)

					arg_600_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_600_1.var_.characterEffect1081ui_story.fillRatio = var_603_4
				end
			end

			if arg_600_1.time_ >= var_603_1 + var_603_2 and arg_600_1.time_ < var_603_1 + var_603_2 + arg_603_0 and arg_600_1.var_.characterEffect1081ui_story then
				local var_603_5 = 0.5

				arg_600_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_600_1.var_.characterEffect1081ui_story.fillRatio = var_603_5
			end

			local var_603_6 = 0
			local var_603_7 = 0.6

			if var_603_6 < arg_600_1.time_ and arg_600_1.time_ <= var_603_6 + arg_603_0 then
				arg_600_1.talkMaxDuration = 0
				arg_600_1.dialogCg_.alpha = 1

				arg_600_1.dialog_:SetActive(true)
				SetActive(arg_600_1.leftNameGo_, false)

				arg_600_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_600_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_600_1:RecordName(arg_600_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_600_1.iconTrs_.gameObject, false)
				arg_600_1.callingController_:SetSelectedState("normal")

				local var_603_8 = arg_600_1:GetWordFromCfg(1108105144)
				local var_603_9 = arg_600_1:FormatText(var_603_8.content)

				arg_600_1.text_.text = var_603_9

				LuaForUtil.ClearLinePrefixSymbol(arg_600_1.text_)

				local var_603_10 = 24
				local var_603_11 = utf8.len(var_603_9)
				local var_603_12 = var_603_10 <= 0 and var_603_7 or var_603_7 * (var_603_11 / var_603_10)

				if var_603_12 > 0 and var_603_7 < var_603_12 then
					arg_600_1.talkMaxDuration = var_603_12

					if var_603_12 + var_603_6 > arg_600_1.duration_ then
						arg_600_1.duration_ = var_603_12 + var_603_6
					end
				end

				arg_600_1.text_.text = var_603_9
				arg_600_1.typewritter.percent = 0

				arg_600_1.typewritter:SetDirty()
				arg_600_1:ShowNextGo(false)
				arg_600_1:RecordContent(arg_600_1.text_.text)
			end

			local var_603_13 = math.max(var_603_7, arg_600_1.talkMaxDuration)

			if var_603_6 <= arg_600_1.time_ and arg_600_1.time_ < var_603_6 + var_603_13 then
				arg_600_1.typewritter.percent = (arg_600_1.time_ - var_603_6) / var_603_13

				arg_600_1.typewritter:SetDirty()
			end

			if arg_600_1.time_ >= var_603_6 + var_603_13 and arg_600_1.time_ < var_603_6 + var_603_13 + arg_603_0 then
				arg_600_1.typewritter.percent = 1

				arg_600_1.typewritter:SetDirty()
				arg_600_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105145 = function(arg_604_0, arg_604_1)
		arg_604_1.time_ = 0
		arg_604_1.frameCnt_ = 0
		arg_604_1.state_ = "playing"
		arg_604_1.curTalkId_ = 1108105145
		arg_604_1.duration_ = 5

		SetActive(arg_604_1.tipsGo_, false)

		function arg_604_1.onSingleLineFinish_()
			arg_604_1.onSingleLineUpdate_ = nil
			arg_604_1.onSingleLineFinish_ = nil
			arg_604_1.state_ = "waiting"
		end

		function arg_604_1.playNext_(arg_606_0)
			if arg_606_0 == 1 then
				arg_604_0:Play1108105146(arg_604_1)
			end
		end

		function arg_604_1.onSingleLineUpdate_(arg_607_0)
			local var_607_0 = arg_604_1.actors_["1081ui_story"].transform
			local var_607_1 = 0

			if var_607_1 < arg_604_1.time_ and arg_604_1.time_ <= var_607_1 + arg_607_0 then
				arg_604_1.var_.moveOldPos1081ui_story = var_607_0.localPosition
			end

			local var_607_2 = 0.001

			if var_607_1 <= arg_604_1.time_ and arg_604_1.time_ < var_607_1 + var_607_2 then
				local var_607_3 = (arg_604_1.time_ - var_607_1) / var_607_2
				local var_607_4 = Vector3.New(0, -0.92, -5.8)

				var_607_0.localPosition = Vector3.Lerp(arg_604_1.var_.moveOldPos1081ui_story, var_607_4, var_607_3)

				local var_607_5 = manager.ui.mainCamera.transform.position - var_607_0.position

				var_607_0.forward = Vector3.New(var_607_5.x, var_607_5.y, var_607_5.z)

				local var_607_6 = var_607_0.localEulerAngles

				var_607_6.z = 0
				var_607_6.x = 0
				var_607_0.localEulerAngles = var_607_6
			end

			if arg_604_1.time_ >= var_607_1 + var_607_2 and arg_604_1.time_ < var_607_1 + var_607_2 + arg_607_0 then
				var_607_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_607_7 = manager.ui.mainCamera.transform.position - var_607_0.position

				var_607_0.forward = Vector3.New(var_607_7.x, var_607_7.y, var_607_7.z)

				local var_607_8 = var_607_0.localEulerAngles

				var_607_8.z = 0
				var_607_8.x = 0
				var_607_0.localEulerAngles = var_607_8
			end

			local var_607_9 = arg_604_1.actors_["1081ui_story"]
			local var_607_10 = 0

			if var_607_10 < arg_604_1.time_ and arg_604_1.time_ <= var_607_10 + arg_607_0 and arg_604_1.var_.characterEffect1081ui_story == nil then
				arg_604_1.var_.characterEffect1081ui_story = var_607_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_607_11 = 0.200000002980232

			if var_607_10 <= arg_604_1.time_ and arg_604_1.time_ < var_607_10 + var_607_11 then
				local var_607_12 = (arg_604_1.time_ - var_607_10) / var_607_11

				if arg_604_1.var_.characterEffect1081ui_story then
					arg_604_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_604_1.time_ >= var_607_10 + var_607_11 and arg_604_1.time_ < var_607_10 + var_607_11 + arg_607_0 and arg_604_1.var_.characterEffect1081ui_story then
				arg_604_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_607_13 = 0

			if var_607_13 < arg_604_1.time_ and arg_604_1.time_ <= var_607_13 + arg_607_0 then
				arg_604_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_1")
			end

			local var_607_14 = 0

			if var_607_14 < arg_604_1.time_ and arg_604_1.time_ <= var_607_14 + arg_607_0 then
				arg_604_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_607_15 = 0
			local var_607_16 = 0.75

			if var_607_15 < arg_604_1.time_ and arg_604_1.time_ <= var_607_15 + arg_607_0 then
				arg_604_1.talkMaxDuration = 0
				arg_604_1.dialogCg_.alpha = 1

				arg_604_1.dialog_:SetActive(true)
				SetActive(arg_604_1.leftNameGo_, true)

				local var_607_17 = arg_604_1:FormatText(StoryNameCfg[202].name)

				arg_604_1.leftNameTxt_.text = var_607_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_604_1.leftNameTxt_.transform)

				arg_604_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_604_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_604_1:RecordName(arg_604_1.leftNameTxt_.text)
				SetActive(arg_604_1.iconTrs_.gameObject, false)
				arg_604_1.callingController_:SetSelectedState("normal")

				local var_607_18 = arg_604_1:GetWordFromCfg(1108105145)
				local var_607_19 = arg_604_1:FormatText(var_607_18.content)

				arg_604_1.text_.text = var_607_19

				LuaForUtil.ClearLinePrefixSymbol(arg_604_1.text_)

				local var_607_20 = 30
				local var_607_21 = utf8.len(var_607_19)
				local var_607_22 = var_607_20 <= 0 and var_607_16 or var_607_16 * (var_607_21 / var_607_20)

				if var_607_22 > 0 and var_607_16 < var_607_22 then
					arg_604_1.talkMaxDuration = var_607_22

					if var_607_22 + var_607_15 > arg_604_1.duration_ then
						arg_604_1.duration_ = var_607_22 + var_607_15
					end
				end

				arg_604_1.text_.text = var_607_19
				arg_604_1.typewritter.percent = 0

				arg_604_1.typewritter:SetDirty()
				arg_604_1:ShowNextGo(false)
				arg_604_1:RecordContent(arg_604_1.text_.text)
			end

			local var_607_23 = math.max(var_607_16, arg_604_1.talkMaxDuration)

			if var_607_15 <= arg_604_1.time_ and arg_604_1.time_ < var_607_15 + var_607_23 then
				arg_604_1.typewritter.percent = (arg_604_1.time_ - var_607_15) / var_607_23

				arg_604_1.typewritter:SetDirty()
			end

			if arg_604_1.time_ >= var_607_15 + var_607_23 and arg_604_1.time_ < var_607_15 + var_607_23 + arg_607_0 then
				arg_604_1.typewritter.percent = 1

				arg_604_1.typewritter:SetDirty()
				arg_604_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105146 = function(arg_608_0, arg_608_1)
		arg_608_1.time_ = 0
		arg_608_1.frameCnt_ = 0
		arg_608_1.state_ = "playing"
		arg_608_1.curTalkId_ = 1108105146
		arg_608_1.duration_ = 5

		SetActive(arg_608_1.tipsGo_, false)

		function arg_608_1.onSingleLineFinish_()
			arg_608_1.onSingleLineUpdate_ = nil
			arg_608_1.onSingleLineFinish_ = nil
			arg_608_1.state_ = "waiting"
		end

		function arg_608_1.playNext_(arg_610_0)
			if arg_610_0 == 1 then
				arg_608_0:Play1108105147(arg_608_1)
			end
		end

		function arg_608_1.onSingleLineUpdate_(arg_611_0)
			local var_611_0 = 0

			if var_611_0 < arg_608_1.time_ and arg_608_1.time_ <= var_611_0 + arg_611_0 then
				arg_608_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_611_1 = 0
			local var_611_2 = 0.55

			if var_611_1 < arg_608_1.time_ and arg_608_1.time_ <= var_611_1 + arg_611_0 then
				arg_608_1.talkMaxDuration = 0
				arg_608_1.dialogCg_.alpha = 1

				arg_608_1.dialog_:SetActive(true)
				SetActive(arg_608_1.leftNameGo_, true)

				local var_611_3 = arg_608_1:FormatText(StoryNameCfg[202].name)

				arg_608_1.leftNameTxt_.text = var_611_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_608_1.leftNameTxt_.transform)

				arg_608_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_608_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_608_1:RecordName(arg_608_1.leftNameTxt_.text)
				SetActive(arg_608_1.iconTrs_.gameObject, false)
				arg_608_1.callingController_:SetSelectedState("normal")

				local var_611_4 = arg_608_1:GetWordFromCfg(1108105146)
				local var_611_5 = arg_608_1:FormatText(var_611_4.content)

				arg_608_1.text_.text = var_611_5

				LuaForUtil.ClearLinePrefixSymbol(arg_608_1.text_)

				local var_611_6 = 22
				local var_611_7 = utf8.len(var_611_5)
				local var_611_8 = var_611_6 <= 0 and var_611_2 or var_611_2 * (var_611_7 / var_611_6)

				if var_611_8 > 0 and var_611_2 < var_611_8 then
					arg_608_1.talkMaxDuration = var_611_8

					if var_611_8 + var_611_1 > arg_608_1.duration_ then
						arg_608_1.duration_ = var_611_8 + var_611_1
					end
				end

				arg_608_1.text_.text = var_611_5
				arg_608_1.typewritter.percent = 0

				arg_608_1.typewritter:SetDirty()
				arg_608_1:ShowNextGo(false)
				arg_608_1:RecordContent(arg_608_1.text_.text)
			end

			local var_611_9 = math.max(var_611_2, arg_608_1.talkMaxDuration)

			if var_611_1 <= arg_608_1.time_ and arg_608_1.time_ < var_611_1 + var_611_9 then
				arg_608_1.typewritter.percent = (arg_608_1.time_ - var_611_1) / var_611_9

				arg_608_1.typewritter:SetDirty()
			end

			if arg_608_1.time_ >= var_611_1 + var_611_9 and arg_608_1.time_ < var_611_1 + var_611_9 + arg_611_0 then
				arg_608_1.typewritter.percent = 1

				arg_608_1.typewritter:SetDirty()
				arg_608_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105147 = function(arg_612_0, arg_612_1)
		arg_612_1.time_ = 0
		arg_612_1.frameCnt_ = 0
		arg_612_1.state_ = "playing"
		arg_612_1.curTalkId_ = 1108105147
		arg_612_1.duration_ = 1

		SetActive(arg_612_1.tipsGo_, true)

		arg_612_1.tipsText_.text = StoryTipsCfg[108101].name

		function arg_612_1.onSingleLineFinish_()
			arg_612_1.onSingleLineUpdate_ = nil
			arg_612_1.onSingleLineFinish_ = nil
			arg_612_1.state_ = "waiting"

			SetActive(arg_612_1.choicesGo_, true)

			for iter_613_0, iter_613_1 in ipairs(arg_612_1.choices_) do
				local var_613_0 = iter_613_0 <= 2

				SetActive(iter_613_1.go, var_613_0)
			end

			arg_612_1.choices_[1].txt.text = arg_612_1:FormatText(StoryChoiceCfg[977].name)
			arg_612_1.choices_[2].txt.text = arg_612_1:FormatText(StoryChoiceCfg[978].name)
		end

		function arg_612_1.playNext_(arg_614_0)
			if arg_614_0 == 1 then
				arg_612_0:Play1108105148(arg_612_1)
			end

			if arg_614_0 == 2 then
				PlayerAction.UseStoryTrigger(1081011, 210810105, 1108105147, 2)
				arg_612_0:Play1108105149(arg_612_1)
			end
		end

		function arg_612_1.onSingleLineUpdate_(arg_615_0)
			local var_615_0 = arg_612_1.actors_["1081ui_story"]
			local var_615_1 = 0

			if var_615_1 < arg_612_1.time_ and arg_612_1.time_ <= var_615_1 + arg_615_0 and arg_612_1.var_.characterEffect1081ui_story == nil then
				arg_612_1.var_.characterEffect1081ui_story = var_615_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_615_2 = 0.200000002980232

			if var_615_1 <= arg_612_1.time_ and arg_612_1.time_ < var_615_1 + var_615_2 then
				local var_615_3 = (arg_612_1.time_ - var_615_1) / var_615_2

				if arg_612_1.var_.characterEffect1081ui_story then
					local var_615_4 = Mathf.Lerp(0, 0.5, var_615_3)

					arg_612_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_612_1.var_.characterEffect1081ui_story.fillRatio = var_615_4
				end
			end

			if arg_612_1.time_ >= var_615_1 + var_615_2 and arg_612_1.time_ < var_615_1 + var_615_2 + arg_615_0 and arg_612_1.var_.characterEffect1081ui_story then
				local var_615_5 = 0.5

				arg_612_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_612_1.var_.characterEffect1081ui_story.fillRatio = var_615_5
			end
		end
	end,
	Play1108105148 = function(arg_616_0, arg_616_1)
		arg_616_1.time_ = 0
		arg_616_1.frameCnt_ = 0
		arg_616_1.state_ = "playing"
		arg_616_1.curTalkId_ = 1108105148
		arg_616_1.duration_ = 5

		SetActive(arg_616_1.tipsGo_, false)

		function arg_616_1.onSingleLineFinish_()
			arg_616_1.onSingleLineUpdate_ = nil
			arg_616_1.onSingleLineFinish_ = nil
			arg_616_1.state_ = "waiting"
		end

		function arg_616_1.playNext_(arg_618_0)
			if arg_618_0 == 1 then
				arg_616_0:Play1108105150(arg_616_1)
			end
		end

		function arg_616_1.onSingleLineUpdate_(arg_619_0)
			local var_619_0 = 0

			if var_619_0 < arg_616_1.time_ and arg_616_1.time_ <= var_619_0 + arg_619_0 then
				arg_616_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_2")
			end

			local var_619_1 = 0

			if var_619_1 < arg_616_1.time_ and arg_616_1.time_ <= var_619_1 + arg_619_0 then
				arg_616_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_619_2 = arg_616_1.actors_["1081ui_story"]
			local var_619_3 = 0

			if var_619_3 < arg_616_1.time_ and arg_616_1.time_ <= var_619_3 + arg_619_0 and arg_616_1.var_.characterEffect1081ui_story == nil then
				arg_616_1.var_.characterEffect1081ui_story = var_619_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_619_4 = 0.200000002980232

			if var_619_3 <= arg_616_1.time_ and arg_616_1.time_ < var_619_3 + var_619_4 then
				local var_619_5 = (arg_616_1.time_ - var_619_3) / var_619_4

				if arg_616_1.var_.characterEffect1081ui_story then
					arg_616_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_616_1.time_ >= var_619_3 + var_619_4 and arg_616_1.time_ < var_619_3 + var_619_4 + arg_619_0 and arg_616_1.var_.characterEffect1081ui_story then
				arg_616_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_619_6 = 0
			local var_619_7 = 0.375

			if var_619_6 < arg_616_1.time_ and arg_616_1.time_ <= var_619_6 + arg_619_0 then
				arg_616_1.talkMaxDuration = 0
				arg_616_1.dialogCg_.alpha = 1

				arg_616_1.dialog_:SetActive(true)
				SetActive(arg_616_1.leftNameGo_, true)

				local var_619_8 = arg_616_1:FormatText(StoryNameCfg[202].name)

				arg_616_1.leftNameTxt_.text = var_619_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_616_1.leftNameTxt_.transform)

				arg_616_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_616_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_616_1:RecordName(arg_616_1.leftNameTxt_.text)
				SetActive(arg_616_1.iconTrs_.gameObject, false)
				arg_616_1.callingController_:SetSelectedState("normal")

				local var_619_9 = arg_616_1:GetWordFromCfg(1108105148)
				local var_619_10 = arg_616_1:FormatText(var_619_9.content)

				arg_616_1.text_.text = var_619_10

				LuaForUtil.ClearLinePrefixSymbol(arg_616_1.text_)

				local var_619_11 = 15
				local var_619_12 = utf8.len(var_619_10)
				local var_619_13 = var_619_11 <= 0 and var_619_7 or var_619_7 * (var_619_12 / var_619_11)

				if var_619_13 > 0 and var_619_7 < var_619_13 then
					arg_616_1.talkMaxDuration = var_619_13

					if var_619_13 + var_619_6 > arg_616_1.duration_ then
						arg_616_1.duration_ = var_619_13 + var_619_6
					end
				end

				arg_616_1.text_.text = var_619_10
				arg_616_1.typewritter.percent = 0

				arg_616_1.typewritter:SetDirty()
				arg_616_1:ShowNextGo(false)
				arg_616_1:RecordContent(arg_616_1.text_.text)
			end

			local var_619_14 = math.max(var_619_7, arg_616_1.talkMaxDuration)

			if var_619_6 <= arg_616_1.time_ and arg_616_1.time_ < var_619_6 + var_619_14 then
				arg_616_1.typewritter.percent = (arg_616_1.time_ - var_619_6) / var_619_14

				arg_616_1.typewritter:SetDirty()
			end

			if arg_616_1.time_ >= var_619_6 + var_619_14 and arg_616_1.time_ < var_619_6 + var_619_14 + arg_619_0 then
				arg_616_1.typewritter.percent = 1

				arg_616_1.typewritter:SetDirty()
				arg_616_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105150 = function(arg_620_0, arg_620_1)
		arg_620_1.time_ = 0
		arg_620_1.frameCnt_ = 0
		arg_620_1.state_ = "playing"
		arg_620_1.curTalkId_ = 1108105150
		arg_620_1.duration_ = 7

		SetActive(arg_620_1.tipsGo_, false)

		function arg_620_1.onSingleLineFinish_()
			arg_620_1.onSingleLineUpdate_ = nil
			arg_620_1.onSingleLineFinish_ = nil
			arg_620_1.state_ = "waiting"
		end

		function arg_620_1.playNext_(arg_622_0)
			if arg_622_0 == 1 then
				arg_620_0:Play1108105151(arg_620_1)
			end
		end

		function arg_620_1.onSingleLineUpdate_(arg_623_0)
			local var_623_0 = 1

			if var_623_0 < arg_620_1.time_ and arg_620_1.time_ <= var_623_0 + arg_623_0 then
				local var_623_1 = manager.ui.mainCamera.transform.localPosition
				local var_623_2 = Vector3.New(0, 0, 10) + Vector3.New(var_623_1.x, var_623_1.y, 0)
				local var_623_3 = arg_620_1.bgs_.ST0402a

				var_623_3.transform.localPosition = var_623_2
				var_623_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_623_4 = var_623_3:GetComponent("SpriteRenderer")

				if var_623_4 and var_623_4.sprite then
					local var_623_5 = (var_623_3.transform.localPosition - var_623_1).z
					local var_623_6 = manager.ui.mainCameraCom_
					local var_623_7 = 2 * var_623_5 * Mathf.Tan(var_623_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_623_8 = var_623_7 * var_623_6.aspect
					local var_623_9 = var_623_4.sprite.bounds.size.x
					local var_623_10 = var_623_4.sprite.bounds.size.y
					local var_623_11 = var_623_8 / var_623_9
					local var_623_12 = var_623_7 / var_623_10
					local var_623_13 = var_623_12 < var_623_11 and var_623_11 or var_623_12

					var_623_3.transform.localScale = Vector3.New(var_623_13, var_623_13, 0)
				end

				for iter_623_0, iter_623_1 in pairs(arg_620_1.bgs_) do
					if iter_623_0 ~= "ST0402a" then
						iter_623_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_623_14 = 2

			if var_623_14 < arg_620_1.time_ and arg_620_1.time_ <= var_623_14 + arg_623_0 then
				arg_620_1.allBtn_.enabled = false
			end

			local var_623_15 = 0.3

			if arg_620_1.time_ >= var_623_14 + var_623_15 and arg_620_1.time_ < var_623_14 + var_623_15 + arg_623_0 then
				arg_620_1.allBtn_.enabled = true
			end

			local var_623_16 = 0

			if var_623_16 < arg_620_1.time_ and arg_620_1.time_ <= var_623_16 + arg_623_0 then
				arg_620_1.mask_.enabled = true
				arg_620_1.mask_.raycastTarget = true

				arg_620_1:SetGaussion(false)
			end

			local var_623_17 = 1

			if var_623_16 <= arg_620_1.time_ and arg_620_1.time_ < var_623_16 + var_623_17 then
				local var_623_18 = (arg_620_1.time_ - var_623_16) / var_623_17
				local var_623_19 = Color.New(0, 0, 0)

				var_623_19.a = Mathf.Lerp(0, 1, var_623_18)
				arg_620_1.mask_.color = var_623_19
			end

			if arg_620_1.time_ >= var_623_16 + var_623_17 and arg_620_1.time_ < var_623_16 + var_623_17 + arg_623_0 then
				local var_623_20 = Color.New(0, 0, 0)

				var_623_20.a = 1
				arg_620_1.mask_.color = var_623_20
			end

			local var_623_21 = 1

			if var_623_21 < arg_620_1.time_ and arg_620_1.time_ <= var_623_21 + arg_623_0 then
				arg_620_1.mask_.enabled = true
				arg_620_1.mask_.raycastTarget = true

				arg_620_1:SetGaussion(false)
			end

			local var_623_22 = 1

			if var_623_21 <= arg_620_1.time_ and arg_620_1.time_ < var_623_21 + var_623_22 then
				local var_623_23 = (arg_620_1.time_ - var_623_21) / var_623_22
				local var_623_24 = Color.New(0, 0, 0)

				var_623_24.a = Mathf.Lerp(1, 0, var_623_23)
				arg_620_1.mask_.color = var_623_24
			end

			if arg_620_1.time_ >= var_623_21 + var_623_22 and arg_620_1.time_ < var_623_21 + var_623_22 + arg_623_0 then
				local var_623_25 = Color.New(0, 0, 0)
				local var_623_26 = 0

				arg_620_1.mask_.enabled = false
				var_623_25.a = var_623_26
				arg_620_1.mask_.color = var_623_25
			end

			local var_623_27 = arg_620_1.actors_["1081ui_story"].transform
			local var_623_28 = 1

			if var_623_28 < arg_620_1.time_ and arg_620_1.time_ <= var_623_28 + arg_623_0 then
				arg_620_1.var_.moveOldPos1081ui_story = var_623_27.localPosition
			end

			local var_623_29 = 0.001

			if var_623_28 <= arg_620_1.time_ and arg_620_1.time_ < var_623_28 + var_623_29 then
				local var_623_30 = (arg_620_1.time_ - var_623_28) / var_623_29
				local var_623_31 = Vector3.New(0, 100, 0)

				var_623_27.localPosition = Vector3.Lerp(arg_620_1.var_.moveOldPos1081ui_story, var_623_31, var_623_30)

				local var_623_32 = manager.ui.mainCamera.transform.position - var_623_27.position

				var_623_27.forward = Vector3.New(var_623_32.x, var_623_32.y, var_623_32.z)

				local var_623_33 = var_623_27.localEulerAngles

				var_623_33.z = 0
				var_623_33.x = 0
				var_623_27.localEulerAngles = var_623_33
			end

			if arg_620_1.time_ >= var_623_28 + var_623_29 and arg_620_1.time_ < var_623_28 + var_623_29 + arg_623_0 then
				var_623_27.localPosition = Vector3.New(0, 100, 0)

				local var_623_34 = manager.ui.mainCamera.transform.position - var_623_27.position

				var_623_27.forward = Vector3.New(var_623_34.x, var_623_34.y, var_623_34.z)

				local var_623_35 = var_623_27.localEulerAngles

				var_623_35.z = 0
				var_623_35.x = 0
				var_623_27.localEulerAngles = var_623_35
			end

			if arg_620_1.frameCnt_ <= 1 then
				arg_620_1.dialog_:SetActive(false)
			end

			local var_623_36 = 2
			local var_623_37 = 0.725

			if var_623_36 < arg_620_1.time_ and arg_620_1.time_ <= var_623_36 + arg_623_0 then
				arg_620_1.talkMaxDuration = 0

				arg_620_1.dialog_:SetActive(true)

				local var_623_38 = LeanTween.value(arg_620_1.dialog_, 0, 1, 0.3)

				var_623_38:setOnUpdate(LuaHelper.FloatAction(function(arg_624_0)
					arg_620_1.dialogCg_.alpha = arg_624_0
				end))
				var_623_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_620_1.dialog_)
					var_623_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_620_1.duration_ = arg_620_1.duration_ + 0.3

				SetActive(arg_620_1.leftNameGo_, false)

				arg_620_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_620_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_620_1:RecordName(arg_620_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_620_1.iconTrs_.gameObject, false)
				arg_620_1.callingController_:SetSelectedState("normal")

				local var_623_39 = arg_620_1:GetWordFromCfg(1108105150)
				local var_623_40 = arg_620_1:FormatText(var_623_39.content)

				arg_620_1.text_.text = var_623_40

				LuaForUtil.ClearLinePrefixSymbol(arg_620_1.text_)

				local var_623_41 = 29
				local var_623_42 = utf8.len(var_623_40)
				local var_623_43 = var_623_41 <= 0 and var_623_37 or var_623_37 * (var_623_42 / var_623_41)

				if var_623_43 > 0 and var_623_37 < var_623_43 then
					arg_620_1.talkMaxDuration = var_623_43
					var_623_36 = var_623_36 + 0.3

					if var_623_43 + var_623_36 > arg_620_1.duration_ then
						arg_620_1.duration_ = var_623_43 + var_623_36
					end
				end

				arg_620_1.text_.text = var_623_40
				arg_620_1.typewritter.percent = 0

				arg_620_1.typewritter:SetDirty()
				arg_620_1:ShowNextGo(false)
				arg_620_1:RecordContent(arg_620_1.text_.text)
			end

			local var_623_44 = var_623_36 + 0.3
			local var_623_45 = math.max(var_623_37, arg_620_1.talkMaxDuration)

			if var_623_44 <= arg_620_1.time_ and arg_620_1.time_ < var_623_44 + var_623_45 then
				arg_620_1.typewritter.percent = (arg_620_1.time_ - var_623_44) / var_623_45

				arg_620_1.typewritter:SetDirty()
			end

			if arg_620_1.time_ >= var_623_44 + var_623_45 and arg_620_1.time_ < var_623_44 + var_623_45 + arg_623_0 then
				arg_620_1.typewritter.percent = 1

				arg_620_1.typewritter:SetDirty()
				arg_620_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105151 = function(arg_626_0, arg_626_1)
		arg_626_1.time_ = 0
		arg_626_1.frameCnt_ = 0
		arg_626_1.state_ = "playing"
		arg_626_1.curTalkId_ = 1108105151
		arg_626_1.duration_ = 5

		SetActive(arg_626_1.tipsGo_, false)

		function arg_626_1.onSingleLineFinish_()
			arg_626_1.onSingleLineUpdate_ = nil
			arg_626_1.onSingleLineFinish_ = nil
			arg_626_1.state_ = "waiting"
		end

		function arg_626_1.playNext_(arg_628_0)
			if arg_628_0 == 1 then
				arg_626_0:Play1108105152(arg_626_1)
			end
		end

		function arg_626_1.onSingleLineUpdate_(arg_629_0)
			local var_629_0 = 0
			local var_629_1 = 1.425

			if var_629_0 < arg_626_1.time_ and arg_626_1.time_ <= var_629_0 + arg_629_0 then
				arg_626_1.talkMaxDuration = 0
				arg_626_1.dialogCg_.alpha = 1

				arg_626_1.dialog_:SetActive(true)
				SetActive(arg_626_1.leftNameGo_, false)

				arg_626_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_626_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_626_1:RecordName(arg_626_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_626_1.iconTrs_.gameObject, false)
				arg_626_1.callingController_:SetSelectedState("normal")

				local var_629_2 = arg_626_1:GetWordFromCfg(1108105151)
				local var_629_3 = arg_626_1:FormatText(var_629_2.content)

				arg_626_1.text_.text = var_629_3

				LuaForUtil.ClearLinePrefixSymbol(arg_626_1.text_)

				local var_629_4 = 57
				local var_629_5 = utf8.len(var_629_3)
				local var_629_6 = var_629_4 <= 0 and var_629_1 or var_629_1 * (var_629_5 / var_629_4)

				if var_629_6 > 0 and var_629_1 < var_629_6 then
					arg_626_1.talkMaxDuration = var_629_6

					if var_629_6 + var_629_0 > arg_626_1.duration_ then
						arg_626_1.duration_ = var_629_6 + var_629_0
					end
				end

				arg_626_1.text_.text = var_629_3
				arg_626_1.typewritter.percent = 0

				arg_626_1.typewritter:SetDirty()
				arg_626_1:ShowNextGo(false)
				arg_626_1:RecordContent(arg_626_1.text_.text)
			end

			local var_629_7 = math.max(var_629_1, arg_626_1.talkMaxDuration)

			if var_629_0 <= arg_626_1.time_ and arg_626_1.time_ < var_629_0 + var_629_7 then
				arg_626_1.typewritter.percent = (arg_626_1.time_ - var_629_0) / var_629_7

				arg_626_1.typewritter:SetDirty()
			end

			if arg_626_1.time_ >= var_629_0 + var_629_7 and arg_626_1.time_ < var_629_0 + var_629_7 + arg_629_0 then
				arg_626_1.typewritter.percent = 1

				arg_626_1.typewritter:SetDirty()
				arg_626_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105152 = function(arg_630_0, arg_630_1)
		arg_630_1.time_ = 0
		arg_630_1.frameCnt_ = 0
		arg_630_1.state_ = "playing"
		arg_630_1.curTalkId_ = 1108105152
		arg_630_1.duration_ = 5

		SetActive(arg_630_1.tipsGo_, false)

		function arg_630_1.onSingleLineFinish_()
			arg_630_1.onSingleLineUpdate_ = nil
			arg_630_1.onSingleLineFinish_ = nil
			arg_630_1.state_ = "waiting"
		end

		function arg_630_1.playNext_(arg_632_0)
			if arg_632_0 == 1 then
				arg_630_0:Play1108105153(arg_630_1)
			end
		end

		function arg_630_1.onSingleLineUpdate_(arg_633_0)
			local var_633_0 = arg_630_1.actors_["1081ui_story"].transform
			local var_633_1 = 0

			if var_633_1 < arg_630_1.time_ and arg_630_1.time_ <= var_633_1 + arg_633_0 then
				arg_630_1.var_.moveOldPos1081ui_story = var_633_0.localPosition
			end

			local var_633_2 = 0.001

			if var_633_1 <= arg_630_1.time_ and arg_630_1.time_ < var_633_1 + var_633_2 then
				local var_633_3 = (arg_630_1.time_ - var_633_1) / var_633_2
				local var_633_4 = Vector3.New(0, -0.92, -5.8)

				var_633_0.localPosition = Vector3.Lerp(arg_630_1.var_.moveOldPos1081ui_story, var_633_4, var_633_3)

				local var_633_5 = manager.ui.mainCamera.transform.position - var_633_0.position

				var_633_0.forward = Vector3.New(var_633_5.x, var_633_5.y, var_633_5.z)

				local var_633_6 = var_633_0.localEulerAngles

				var_633_6.z = 0
				var_633_6.x = 0
				var_633_0.localEulerAngles = var_633_6
			end

			if arg_630_1.time_ >= var_633_1 + var_633_2 and arg_630_1.time_ < var_633_1 + var_633_2 + arg_633_0 then
				var_633_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_633_7 = manager.ui.mainCamera.transform.position - var_633_0.position

				var_633_0.forward = Vector3.New(var_633_7.x, var_633_7.y, var_633_7.z)

				local var_633_8 = var_633_0.localEulerAngles

				var_633_8.z = 0
				var_633_8.x = 0
				var_633_0.localEulerAngles = var_633_8
			end

			local var_633_9 = arg_630_1.actors_["1081ui_story"]
			local var_633_10 = 0

			if var_633_10 < arg_630_1.time_ and arg_630_1.time_ <= var_633_10 + arg_633_0 and arg_630_1.var_.characterEffect1081ui_story == nil then
				arg_630_1.var_.characterEffect1081ui_story = var_633_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_633_11 = 0.200000002980232

			if var_633_10 <= arg_630_1.time_ and arg_630_1.time_ < var_633_10 + var_633_11 then
				local var_633_12 = (arg_630_1.time_ - var_633_10) / var_633_11

				if arg_630_1.var_.characterEffect1081ui_story then
					arg_630_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_630_1.time_ >= var_633_10 + var_633_11 and arg_630_1.time_ < var_633_10 + var_633_11 + arg_633_0 and arg_630_1.var_.characterEffect1081ui_story then
				arg_630_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_633_13 = 0

			if var_633_13 < arg_630_1.time_ and arg_630_1.time_ <= var_633_13 + arg_633_0 then
				arg_630_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_633_14 = 0

			if var_633_14 < arg_630_1.time_ and arg_630_1.time_ <= var_633_14 + arg_633_0 then
				arg_630_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_633_15 = 0
			local var_633_16 = 0.75

			if var_633_15 < arg_630_1.time_ and arg_630_1.time_ <= var_633_15 + arg_633_0 then
				arg_630_1.talkMaxDuration = 0
				arg_630_1.dialogCg_.alpha = 1

				arg_630_1.dialog_:SetActive(true)
				SetActive(arg_630_1.leftNameGo_, true)

				local var_633_17 = arg_630_1:FormatText(StoryNameCfg[202].name)

				arg_630_1.leftNameTxt_.text = var_633_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_630_1.leftNameTxt_.transform)

				arg_630_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_630_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_630_1:RecordName(arg_630_1.leftNameTxt_.text)
				SetActive(arg_630_1.iconTrs_.gameObject, false)
				arg_630_1.callingController_:SetSelectedState("normal")

				local var_633_18 = arg_630_1:GetWordFromCfg(1108105152)
				local var_633_19 = arg_630_1:FormatText(var_633_18.content)

				arg_630_1.text_.text = var_633_19

				LuaForUtil.ClearLinePrefixSymbol(arg_630_1.text_)

				local var_633_20 = 30
				local var_633_21 = utf8.len(var_633_19)
				local var_633_22 = var_633_20 <= 0 and var_633_16 or var_633_16 * (var_633_21 / var_633_20)

				if var_633_22 > 0 and var_633_16 < var_633_22 then
					arg_630_1.talkMaxDuration = var_633_22

					if var_633_22 + var_633_15 > arg_630_1.duration_ then
						arg_630_1.duration_ = var_633_22 + var_633_15
					end
				end

				arg_630_1.text_.text = var_633_19
				arg_630_1.typewritter.percent = 0

				arg_630_1.typewritter:SetDirty()
				arg_630_1:ShowNextGo(false)
				arg_630_1:RecordContent(arg_630_1.text_.text)
			end

			local var_633_23 = math.max(var_633_16, arg_630_1.talkMaxDuration)

			if var_633_15 <= arg_630_1.time_ and arg_630_1.time_ < var_633_15 + var_633_23 then
				arg_630_1.typewritter.percent = (arg_630_1.time_ - var_633_15) / var_633_23

				arg_630_1.typewritter:SetDirty()
			end

			if arg_630_1.time_ >= var_633_15 + var_633_23 and arg_630_1.time_ < var_633_15 + var_633_23 + arg_633_0 then
				arg_630_1.typewritter.percent = 1

				arg_630_1.typewritter:SetDirty()
				arg_630_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105153 = function(arg_634_0, arg_634_1)
		arg_634_1.time_ = 0
		arg_634_1.frameCnt_ = 0
		arg_634_1.state_ = "playing"
		arg_634_1.curTalkId_ = 1108105153
		arg_634_1.duration_ = 5

		SetActive(arg_634_1.tipsGo_, false)

		function arg_634_1.onSingleLineFinish_()
			arg_634_1.onSingleLineUpdate_ = nil
			arg_634_1.onSingleLineFinish_ = nil
			arg_634_1.state_ = "waiting"
		end

		function arg_634_1.playNext_(arg_636_0)
			if arg_636_0 == 1 then
				arg_634_0:Play1108105154(arg_634_1)
			end
		end

		function arg_634_1.onSingleLineUpdate_(arg_637_0)
			local var_637_0 = arg_634_1.actors_["1081ui_story"].transform
			local var_637_1 = 0

			if var_637_1 < arg_634_1.time_ and arg_634_1.time_ <= var_637_1 + arg_637_0 then
				arg_634_1.var_.moveOldPos1081ui_story = var_637_0.localPosition
			end

			local var_637_2 = 0.001

			if var_637_1 <= arg_634_1.time_ and arg_634_1.time_ < var_637_1 + var_637_2 then
				local var_637_3 = (arg_634_1.time_ - var_637_1) / var_637_2
				local var_637_4 = Vector3.New(0, -0.92, -5.8)

				var_637_0.localPosition = Vector3.Lerp(arg_634_1.var_.moveOldPos1081ui_story, var_637_4, var_637_3)

				local var_637_5 = manager.ui.mainCamera.transform.position - var_637_0.position

				var_637_0.forward = Vector3.New(var_637_5.x, var_637_5.y, var_637_5.z)

				local var_637_6 = var_637_0.localEulerAngles

				var_637_6.z = 0
				var_637_6.x = 0
				var_637_0.localEulerAngles = var_637_6
			end

			if arg_634_1.time_ >= var_637_1 + var_637_2 and arg_634_1.time_ < var_637_1 + var_637_2 + arg_637_0 then
				var_637_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_637_7 = manager.ui.mainCamera.transform.position - var_637_0.position

				var_637_0.forward = Vector3.New(var_637_7.x, var_637_7.y, var_637_7.z)

				local var_637_8 = var_637_0.localEulerAngles

				var_637_8.z = 0
				var_637_8.x = 0
				var_637_0.localEulerAngles = var_637_8
			end

			local var_637_9 = arg_634_1.actors_["1081ui_story"]
			local var_637_10 = 0

			if var_637_10 < arg_634_1.time_ and arg_634_1.time_ <= var_637_10 + arg_637_0 and arg_634_1.var_.characterEffect1081ui_story == nil then
				arg_634_1.var_.characterEffect1081ui_story = var_637_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_637_11 = 0.200000002980232

			if var_637_10 <= arg_634_1.time_ and arg_634_1.time_ < var_637_10 + var_637_11 then
				local var_637_12 = (arg_634_1.time_ - var_637_10) / var_637_11

				if arg_634_1.var_.characterEffect1081ui_story then
					arg_634_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_634_1.time_ >= var_637_10 + var_637_11 and arg_634_1.time_ < var_637_10 + var_637_11 + arg_637_0 and arg_634_1.var_.characterEffect1081ui_story then
				arg_634_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_637_13 = 0

			if var_637_13 < arg_634_1.time_ and arg_634_1.time_ <= var_637_13 + arg_637_0 then
				arg_634_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_637_14 = 0

			if var_637_14 < arg_634_1.time_ and arg_634_1.time_ <= var_637_14 + arg_637_0 then
				arg_634_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_637_15 = 0
			local var_637_16 = 0.675

			if var_637_15 < arg_634_1.time_ and arg_634_1.time_ <= var_637_15 + arg_637_0 then
				arg_634_1.talkMaxDuration = 0
				arg_634_1.dialogCg_.alpha = 1

				arg_634_1.dialog_:SetActive(true)
				SetActive(arg_634_1.leftNameGo_, true)

				local var_637_17 = arg_634_1:FormatText(StoryNameCfg[202].name)

				arg_634_1.leftNameTxt_.text = var_637_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_634_1.leftNameTxt_.transform)

				arg_634_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_634_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_634_1:RecordName(arg_634_1.leftNameTxt_.text)
				SetActive(arg_634_1.iconTrs_.gameObject, false)
				arg_634_1.callingController_:SetSelectedState("normal")

				local var_637_18 = arg_634_1:GetWordFromCfg(1108105153)
				local var_637_19 = arg_634_1:FormatText(var_637_18.content)

				arg_634_1.text_.text = var_637_19

				LuaForUtil.ClearLinePrefixSymbol(arg_634_1.text_)

				local var_637_20 = 27
				local var_637_21 = utf8.len(var_637_19)
				local var_637_22 = var_637_20 <= 0 and var_637_16 or var_637_16 * (var_637_21 / var_637_20)

				if var_637_22 > 0 and var_637_16 < var_637_22 then
					arg_634_1.talkMaxDuration = var_637_22

					if var_637_22 + var_637_15 > arg_634_1.duration_ then
						arg_634_1.duration_ = var_637_22 + var_637_15
					end
				end

				arg_634_1.text_.text = var_637_19
				arg_634_1.typewritter.percent = 0

				arg_634_1.typewritter:SetDirty()
				arg_634_1:ShowNextGo(false)
				arg_634_1:RecordContent(arg_634_1.text_.text)
			end

			local var_637_23 = math.max(var_637_16, arg_634_1.talkMaxDuration)

			if var_637_15 <= arg_634_1.time_ and arg_634_1.time_ < var_637_15 + var_637_23 then
				arg_634_1.typewritter.percent = (arg_634_1.time_ - var_637_15) / var_637_23

				arg_634_1.typewritter:SetDirty()
			end

			if arg_634_1.time_ >= var_637_15 + var_637_23 and arg_634_1.time_ < var_637_15 + var_637_23 + arg_637_0 then
				arg_634_1.typewritter.percent = 1

				arg_634_1.typewritter:SetDirty()
				arg_634_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105154 = function(arg_638_0, arg_638_1)
		arg_638_1.time_ = 0
		arg_638_1.frameCnt_ = 0
		arg_638_1.state_ = "playing"
		arg_638_1.curTalkId_ = 1108105154
		arg_638_1.duration_ = 5

		SetActive(arg_638_1.tipsGo_, false)

		function arg_638_1.onSingleLineFinish_()
			arg_638_1.onSingleLineUpdate_ = nil
			arg_638_1.onSingleLineFinish_ = nil
			arg_638_1.state_ = "waiting"
		end

		function arg_638_1.playNext_(arg_640_0)
			if arg_640_0 == 1 then
				arg_638_0:Play1108105155(arg_638_1)
			end
		end

		function arg_638_1.onSingleLineUpdate_(arg_641_0)
			local var_641_0 = arg_638_1.actors_["1081ui_story"]
			local var_641_1 = 0

			if var_641_1 < arg_638_1.time_ and arg_638_1.time_ <= var_641_1 + arg_641_0 and arg_638_1.var_.characterEffect1081ui_story == nil then
				arg_638_1.var_.characterEffect1081ui_story = var_641_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_641_2 = 0.200000002980232

			if var_641_1 <= arg_638_1.time_ and arg_638_1.time_ < var_641_1 + var_641_2 then
				local var_641_3 = (arg_638_1.time_ - var_641_1) / var_641_2

				if arg_638_1.var_.characterEffect1081ui_story then
					local var_641_4 = Mathf.Lerp(0, 0.5, var_641_3)

					arg_638_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_638_1.var_.characterEffect1081ui_story.fillRatio = var_641_4
				end
			end

			if arg_638_1.time_ >= var_641_1 + var_641_2 and arg_638_1.time_ < var_641_1 + var_641_2 + arg_641_0 and arg_638_1.var_.characterEffect1081ui_story then
				local var_641_5 = 0.5

				arg_638_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_638_1.var_.characterEffect1081ui_story.fillRatio = var_641_5
			end

			local var_641_6 = 0
			local var_641_7 = 0.3

			if var_641_6 < arg_638_1.time_ and arg_638_1.time_ <= var_641_6 + arg_641_0 then
				arg_638_1.talkMaxDuration = 0
				arg_638_1.dialogCg_.alpha = 1

				arg_638_1.dialog_:SetActive(true)
				SetActive(arg_638_1.leftNameGo_, true)

				local var_641_8 = arg_638_1:FormatText(StoryNameCfg[7].name)

				arg_638_1.leftNameTxt_.text = var_641_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_638_1.leftNameTxt_.transform)

				arg_638_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_638_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_638_1:RecordName(arg_638_1.leftNameTxt_.text)
				SetActive(arg_638_1.iconTrs_.gameObject, false)
				arg_638_1.callingController_:SetSelectedState("normal")

				local var_641_9 = arg_638_1:GetWordFromCfg(1108105154)
				local var_641_10 = arg_638_1:FormatText(var_641_9.content)

				arg_638_1.text_.text = var_641_10

				LuaForUtil.ClearLinePrefixSymbol(arg_638_1.text_)

				local var_641_11 = 12
				local var_641_12 = utf8.len(var_641_10)
				local var_641_13 = var_641_11 <= 0 and var_641_7 or var_641_7 * (var_641_12 / var_641_11)

				if var_641_13 > 0 and var_641_7 < var_641_13 then
					arg_638_1.talkMaxDuration = var_641_13

					if var_641_13 + var_641_6 > arg_638_1.duration_ then
						arg_638_1.duration_ = var_641_13 + var_641_6
					end
				end

				arg_638_1.text_.text = var_641_10
				arg_638_1.typewritter.percent = 0

				arg_638_1.typewritter:SetDirty()
				arg_638_1:ShowNextGo(false)
				arg_638_1:RecordContent(arg_638_1.text_.text)
			end

			local var_641_14 = math.max(var_641_7, arg_638_1.talkMaxDuration)

			if var_641_6 <= arg_638_1.time_ and arg_638_1.time_ < var_641_6 + var_641_14 then
				arg_638_1.typewritter.percent = (arg_638_1.time_ - var_641_6) / var_641_14

				arg_638_1.typewritter:SetDirty()
			end

			if arg_638_1.time_ >= var_641_6 + var_641_14 and arg_638_1.time_ < var_641_6 + var_641_14 + arg_641_0 then
				arg_638_1.typewritter.percent = 1

				arg_638_1.typewritter:SetDirty()
				arg_638_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105155 = function(arg_642_0, arg_642_1)
		arg_642_1.time_ = 0
		arg_642_1.frameCnt_ = 0
		arg_642_1.state_ = "playing"
		arg_642_1.curTalkId_ = 1108105155
		arg_642_1.duration_ = 5

		SetActive(arg_642_1.tipsGo_, false)

		function arg_642_1.onSingleLineFinish_()
			arg_642_1.onSingleLineUpdate_ = nil
			arg_642_1.onSingleLineFinish_ = nil
			arg_642_1.state_ = "waiting"
		end

		function arg_642_1.playNext_(arg_644_0)
			if arg_644_0 == 1 then
				arg_642_0:Play1108105156(arg_642_1)
			end
		end

		function arg_642_1.onSingleLineUpdate_(arg_645_0)
			local var_645_0 = arg_642_1.actors_["1081ui_story"].transform
			local var_645_1 = 0

			if var_645_1 < arg_642_1.time_ and arg_642_1.time_ <= var_645_1 + arg_645_0 then
				arg_642_1.var_.moveOldPos1081ui_story = var_645_0.localPosition
			end

			local var_645_2 = 0.001

			if var_645_1 <= arg_642_1.time_ and arg_642_1.time_ < var_645_1 + var_645_2 then
				local var_645_3 = (arg_642_1.time_ - var_645_1) / var_645_2
				local var_645_4 = Vector3.New(0, -0.92, -5.8)

				var_645_0.localPosition = Vector3.Lerp(arg_642_1.var_.moveOldPos1081ui_story, var_645_4, var_645_3)

				local var_645_5 = manager.ui.mainCamera.transform.position - var_645_0.position

				var_645_0.forward = Vector3.New(var_645_5.x, var_645_5.y, var_645_5.z)

				local var_645_6 = var_645_0.localEulerAngles

				var_645_6.z = 0
				var_645_6.x = 0
				var_645_0.localEulerAngles = var_645_6
			end

			if arg_642_1.time_ >= var_645_1 + var_645_2 and arg_642_1.time_ < var_645_1 + var_645_2 + arg_645_0 then
				var_645_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_645_7 = manager.ui.mainCamera.transform.position - var_645_0.position

				var_645_0.forward = Vector3.New(var_645_7.x, var_645_7.y, var_645_7.z)

				local var_645_8 = var_645_0.localEulerAngles

				var_645_8.z = 0
				var_645_8.x = 0
				var_645_0.localEulerAngles = var_645_8
			end

			local var_645_9 = arg_642_1.actors_["1081ui_story"]
			local var_645_10 = 0

			if var_645_10 < arg_642_1.time_ and arg_642_1.time_ <= var_645_10 + arg_645_0 and arg_642_1.var_.characterEffect1081ui_story == nil then
				arg_642_1.var_.characterEffect1081ui_story = var_645_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_645_11 = 0.200000002980232

			if var_645_10 <= arg_642_1.time_ and arg_642_1.time_ < var_645_10 + var_645_11 then
				local var_645_12 = (arg_642_1.time_ - var_645_10) / var_645_11

				if arg_642_1.var_.characterEffect1081ui_story then
					arg_642_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_642_1.time_ >= var_645_10 + var_645_11 and arg_642_1.time_ < var_645_10 + var_645_11 + arg_645_0 and arg_642_1.var_.characterEffect1081ui_story then
				arg_642_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_645_13 = 0

			if var_645_13 < arg_642_1.time_ and arg_642_1.time_ <= var_645_13 + arg_645_0 then
				arg_642_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_645_14 = 0

			if var_645_14 < arg_642_1.time_ and arg_642_1.time_ <= var_645_14 + arg_645_0 then
				arg_642_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_645_15 = 0
			local var_645_16 = 0.45

			if var_645_15 < arg_642_1.time_ and arg_642_1.time_ <= var_645_15 + arg_645_0 then
				arg_642_1.talkMaxDuration = 0
				arg_642_1.dialogCg_.alpha = 1

				arg_642_1.dialog_:SetActive(true)
				SetActive(arg_642_1.leftNameGo_, true)

				local var_645_17 = arg_642_1:FormatText(StoryNameCfg[202].name)

				arg_642_1.leftNameTxt_.text = var_645_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_642_1.leftNameTxt_.transform)

				arg_642_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_642_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_642_1:RecordName(arg_642_1.leftNameTxt_.text)
				SetActive(arg_642_1.iconTrs_.gameObject, false)
				arg_642_1.callingController_:SetSelectedState("normal")

				local var_645_18 = arg_642_1:GetWordFromCfg(1108105155)
				local var_645_19 = arg_642_1:FormatText(var_645_18.content)

				arg_642_1.text_.text = var_645_19

				LuaForUtil.ClearLinePrefixSymbol(arg_642_1.text_)

				local var_645_20 = 18
				local var_645_21 = utf8.len(var_645_19)
				local var_645_22 = var_645_20 <= 0 and var_645_16 or var_645_16 * (var_645_21 / var_645_20)

				if var_645_22 > 0 and var_645_16 < var_645_22 then
					arg_642_1.talkMaxDuration = var_645_22

					if var_645_22 + var_645_15 > arg_642_1.duration_ then
						arg_642_1.duration_ = var_645_22 + var_645_15
					end
				end

				arg_642_1.text_.text = var_645_19
				arg_642_1.typewritter.percent = 0

				arg_642_1.typewritter:SetDirty()
				arg_642_1:ShowNextGo(false)
				arg_642_1:RecordContent(arg_642_1.text_.text)
			end

			local var_645_23 = math.max(var_645_16, arg_642_1.talkMaxDuration)

			if var_645_15 <= arg_642_1.time_ and arg_642_1.time_ < var_645_15 + var_645_23 then
				arg_642_1.typewritter.percent = (arg_642_1.time_ - var_645_15) / var_645_23

				arg_642_1.typewritter:SetDirty()
			end

			if arg_642_1.time_ >= var_645_15 + var_645_23 and arg_642_1.time_ < var_645_15 + var_645_23 + arg_645_0 then
				arg_642_1.typewritter.percent = 1

				arg_642_1.typewritter:SetDirty()
				arg_642_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105156 = function(arg_646_0, arg_646_1)
		arg_646_1.time_ = 0
		arg_646_1.frameCnt_ = 0
		arg_646_1.state_ = "playing"
		arg_646_1.curTalkId_ = 1108105156
		arg_646_1.duration_ = 5

		SetActive(arg_646_1.tipsGo_, false)

		function arg_646_1.onSingleLineFinish_()
			arg_646_1.onSingleLineUpdate_ = nil
			arg_646_1.onSingleLineFinish_ = nil
			arg_646_1.state_ = "waiting"
		end

		function arg_646_1.playNext_(arg_648_0)
			if arg_648_0 == 1 then
				arg_646_0:Play1108105157(arg_646_1)
			end
		end

		function arg_646_1.onSingleLineUpdate_(arg_649_0)
			local var_649_0 = arg_646_1.actors_["1081ui_story"]
			local var_649_1 = 0

			if var_649_1 < arg_646_1.time_ and arg_646_1.time_ <= var_649_1 + arg_649_0 and arg_646_1.var_.characterEffect1081ui_story == nil then
				arg_646_1.var_.characterEffect1081ui_story = var_649_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_649_2 = 0.200000002980232

			if var_649_1 <= arg_646_1.time_ and arg_646_1.time_ < var_649_1 + var_649_2 then
				local var_649_3 = (arg_646_1.time_ - var_649_1) / var_649_2

				if arg_646_1.var_.characterEffect1081ui_story then
					local var_649_4 = Mathf.Lerp(0, 0.5, var_649_3)

					arg_646_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_646_1.var_.characterEffect1081ui_story.fillRatio = var_649_4
				end
			end

			if arg_646_1.time_ >= var_649_1 + var_649_2 and arg_646_1.time_ < var_649_1 + var_649_2 + arg_649_0 and arg_646_1.var_.characterEffect1081ui_story then
				local var_649_5 = 0.5

				arg_646_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_646_1.var_.characterEffect1081ui_story.fillRatio = var_649_5
			end

			local var_649_6 = 0
			local var_649_7 = 0.425

			if var_649_6 < arg_646_1.time_ and arg_646_1.time_ <= var_649_6 + arg_649_0 then
				arg_646_1.talkMaxDuration = 0
				arg_646_1.dialogCg_.alpha = 1

				arg_646_1.dialog_:SetActive(true)
				SetActive(arg_646_1.leftNameGo_, true)

				local var_649_8 = arg_646_1:FormatText(StoryNameCfg[7].name)

				arg_646_1.leftNameTxt_.text = var_649_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_646_1.leftNameTxt_.transform)

				arg_646_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_646_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_646_1:RecordName(arg_646_1.leftNameTxt_.text)
				SetActive(arg_646_1.iconTrs_.gameObject, false)
				arg_646_1.callingController_:SetSelectedState("normal")

				local var_649_9 = arg_646_1:GetWordFromCfg(1108105156)
				local var_649_10 = arg_646_1:FormatText(var_649_9.content)

				arg_646_1.text_.text = var_649_10

				LuaForUtil.ClearLinePrefixSymbol(arg_646_1.text_)

				local var_649_11 = 17
				local var_649_12 = utf8.len(var_649_10)
				local var_649_13 = var_649_11 <= 0 and var_649_7 or var_649_7 * (var_649_12 / var_649_11)

				if var_649_13 > 0 and var_649_7 < var_649_13 then
					arg_646_1.talkMaxDuration = var_649_13

					if var_649_13 + var_649_6 > arg_646_1.duration_ then
						arg_646_1.duration_ = var_649_13 + var_649_6
					end
				end

				arg_646_1.text_.text = var_649_10
				arg_646_1.typewritter.percent = 0

				arg_646_1.typewritter:SetDirty()
				arg_646_1:ShowNextGo(false)
				arg_646_1:RecordContent(arg_646_1.text_.text)
			end

			local var_649_14 = math.max(var_649_7, arg_646_1.talkMaxDuration)

			if var_649_6 <= arg_646_1.time_ and arg_646_1.time_ < var_649_6 + var_649_14 then
				arg_646_1.typewritter.percent = (arg_646_1.time_ - var_649_6) / var_649_14

				arg_646_1.typewritter:SetDirty()
			end

			if arg_646_1.time_ >= var_649_6 + var_649_14 and arg_646_1.time_ < var_649_6 + var_649_14 + arg_649_0 then
				arg_646_1.typewritter.percent = 1

				arg_646_1.typewritter:SetDirty()
				arg_646_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105157 = function(arg_650_0, arg_650_1)
		arg_650_1.time_ = 0
		arg_650_1.frameCnt_ = 0
		arg_650_1.state_ = "playing"
		arg_650_1.curTalkId_ = 1108105157
		arg_650_1.duration_ = 5

		SetActive(arg_650_1.tipsGo_, false)

		function arg_650_1.onSingleLineFinish_()
			arg_650_1.onSingleLineUpdate_ = nil
			arg_650_1.onSingleLineFinish_ = nil
			arg_650_1.state_ = "waiting"
		end

		function arg_650_1.playNext_(arg_652_0)
			if arg_652_0 == 1 then
				arg_650_0:Play1108105158(arg_650_1)
			end
		end

		function arg_650_1.onSingleLineUpdate_(arg_653_0)
			local var_653_0 = 0
			local var_653_1 = 0.35

			if var_653_0 < arg_650_1.time_ and arg_650_1.time_ <= var_653_0 + arg_653_0 then
				arg_650_1.talkMaxDuration = 0
				arg_650_1.dialogCg_.alpha = 1

				arg_650_1.dialog_:SetActive(true)
				SetActive(arg_650_1.leftNameGo_, true)

				local var_653_2 = arg_650_1:FormatText(StoryNameCfg[7].name)

				arg_650_1.leftNameTxt_.text = var_653_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_650_1.leftNameTxt_.transform)

				arg_650_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_650_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_650_1:RecordName(arg_650_1.leftNameTxt_.text)
				SetActive(arg_650_1.iconTrs_.gameObject, false)
				arg_650_1.callingController_:SetSelectedState("normal")

				local var_653_3 = arg_650_1:GetWordFromCfg(1108105157)
				local var_653_4 = arg_650_1:FormatText(var_653_3.content)

				arg_650_1.text_.text = var_653_4

				LuaForUtil.ClearLinePrefixSymbol(arg_650_1.text_)

				local var_653_5 = 14
				local var_653_6 = utf8.len(var_653_4)
				local var_653_7 = var_653_5 <= 0 and var_653_1 or var_653_1 * (var_653_6 / var_653_5)

				if var_653_7 > 0 and var_653_1 < var_653_7 then
					arg_650_1.talkMaxDuration = var_653_7

					if var_653_7 + var_653_0 > arg_650_1.duration_ then
						arg_650_1.duration_ = var_653_7 + var_653_0
					end
				end

				arg_650_1.text_.text = var_653_4
				arg_650_1.typewritter.percent = 0

				arg_650_1.typewritter:SetDirty()
				arg_650_1:ShowNextGo(false)
				arg_650_1:RecordContent(arg_650_1.text_.text)
			end

			local var_653_8 = math.max(var_653_1, arg_650_1.talkMaxDuration)

			if var_653_0 <= arg_650_1.time_ and arg_650_1.time_ < var_653_0 + var_653_8 then
				arg_650_1.typewritter.percent = (arg_650_1.time_ - var_653_0) / var_653_8

				arg_650_1.typewritter:SetDirty()
			end

			if arg_650_1.time_ >= var_653_0 + var_653_8 and arg_650_1.time_ < var_653_0 + var_653_8 + arg_653_0 then
				arg_650_1.typewritter.percent = 1

				arg_650_1.typewritter:SetDirty()
				arg_650_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105158 = function(arg_654_0, arg_654_1)
		arg_654_1.time_ = 0
		arg_654_1.frameCnt_ = 0
		arg_654_1.state_ = "playing"
		arg_654_1.curTalkId_ = 1108105158
		arg_654_1.duration_ = 5

		SetActive(arg_654_1.tipsGo_, false)

		function arg_654_1.onSingleLineFinish_()
			arg_654_1.onSingleLineUpdate_ = nil
			arg_654_1.onSingleLineFinish_ = nil
			arg_654_1.state_ = "waiting"
		end

		function arg_654_1.playNext_(arg_656_0)
			if arg_656_0 == 1 then
				arg_654_0:Play1108105159(arg_654_1)
			end
		end

		function arg_654_1.onSingleLineUpdate_(arg_657_0)
			local var_657_0 = arg_654_1.actors_["1081ui_story"]
			local var_657_1 = 0

			if var_657_1 < arg_654_1.time_ and arg_654_1.time_ <= var_657_1 + arg_657_0 and arg_654_1.var_.characterEffect1081ui_story == nil then
				arg_654_1.var_.characterEffect1081ui_story = var_657_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_657_2 = 0.200000002980232

			if var_657_1 <= arg_654_1.time_ and arg_654_1.time_ < var_657_1 + var_657_2 then
				local var_657_3 = (arg_654_1.time_ - var_657_1) / var_657_2

				if arg_654_1.var_.characterEffect1081ui_story then
					arg_654_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_654_1.time_ >= var_657_1 + var_657_2 and arg_654_1.time_ < var_657_1 + var_657_2 + arg_657_0 and arg_654_1.var_.characterEffect1081ui_story then
				arg_654_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_657_4 = 0

			if var_657_4 < arg_654_1.time_ and arg_654_1.time_ <= var_657_4 + arg_657_0 then
				arg_654_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_657_5 = 0
			local var_657_6 = 0.65

			if var_657_5 < arg_654_1.time_ and arg_654_1.time_ <= var_657_5 + arg_657_0 then
				arg_654_1.talkMaxDuration = 0
				arg_654_1.dialogCg_.alpha = 1

				arg_654_1.dialog_:SetActive(true)
				SetActive(arg_654_1.leftNameGo_, true)

				local var_657_7 = arg_654_1:FormatText(StoryNameCfg[202].name)

				arg_654_1.leftNameTxt_.text = var_657_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_654_1.leftNameTxt_.transform)

				arg_654_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_654_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_654_1:RecordName(arg_654_1.leftNameTxt_.text)
				SetActive(arg_654_1.iconTrs_.gameObject, false)
				arg_654_1.callingController_:SetSelectedState("normal")

				local var_657_8 = arg_654_1:GetWordFromCfg(1108105158)
				local var_657_9 = arg_654_1:FormatText(var_657_8.content)

				arg_654_1.text_.text = var_657_9

				LuaForUtil.ClearLinePrefixSymbol(arg_654_1.text_)

				local var_657_10 = 26
				local var_657_11 = utf8.len(var_657_9)
				local var_657_12 = var_657_10 <= 0 and var_657_6 or var_657_6 * (var_657_11 / var_657_10)

				if var_657_12 > 0 and var_657_6 < var_657_12 then
					arg_654_1.talkMaxDuration = var_657_12

					if var_657_12 + var_657_5 > arg_654_1.duration_ then
						arg_654_1.duration_ = var_657_12 + var_657_5
					end
				end

				arg_654_1.text_.text = var_657_9
				arg_654_1.typewritter.percent = 0

				arg_654_1.typewritter:SetDirty()
				arg_654_1:ShowNextGo(false)
				arg_654_1:RecordContent(arg_654_1.text_.text)
			end

			local var_657_13 = math.max(var_657_6, arg_654_1.talkMaxDuration)

			if var_657_5 <= arg_654_1.time_ and arg_654_1.time_ < var_657_5 + var_657_13 then
				arg_654_1.typewritter.percent = (arg_654_1.time_ - var_657_5) / var_657_13

				arg_654_1.typewritter:SetDirty()
			end

			if arg_654_1.time_ >= var_657_5 + var_657_13 and arg_654_1.time_ < var_657_5 + var_657_13 + arg_657_0 then
				arg_654_1.typewritter.percent = 1

				arg_654_1.typewritter:SetDirty()
				arg_654_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105159 = function(arg_658_0, arg_658_1)
		arg_658_1.time_ = 0
		arg_658_1.frameCnt_ = 0
		arg_658_1.state_ = "playing"
		arg_658_1.curTalkId_ = 1108105159
		arg_658_1.duration_ = 5

		SetActive(arg_658_1.tipsGo_, false)

		function arg_658_1.onSingleLineFinish_()
			arg_658_1.onSingleLineUpdate_ = nil
			arg_658_1.onSingleLineFinish_ = nil
			arg_658_1.state_ = "waiting"
		end

		function arg_658_1.playNext_(arg_660_0)
			if arg_660_0 == 1 then
				arg_658_0:Play1108105160(arg_658_1)
			end
		end

		function arg_658_1.onSingleLineUpdate_(arg_661_0)
			local var_661_0 = 0

			if var_661_0 < arg_658_1.time_ and arg_658_1.time_ <= var_661_0 + arg_661_0 then
				arg_658_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_661_1 = 0
			local var_661_2 = 1.125

			if var_661_1 < arg_658_1.time_ and arg_658_1.time_ <= var_661_1 + arg_661_0 then
				arg_658_1.talkMaxDuration = 0
				arg_658_1.dialogCg_.alpha = 1

				arg_658_1.dialog_:SetActive(true)
				SetActive(arg_658_1.leftNameGo_, true)

				local var_661_3 = arg_658_1:FormatText(StoryNameCfg[202].name)

				arg_658_1.leftNameTxt_.text = var_661_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_658_1.leftNameTxt_.transform)

				arg_658_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_658_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_658_1:RecordName(arg_658_1.leftNameTxt_.text)
				SetActive(arg_658_1.iconTrs_.gameObject, false)
				arg_658_1.callingController_:SetSelectedState("normal")

				local var_661_4 = arg_658_1:GetWordFromCfg(1108105159)
				local var_661_5 = arg_658_1:FormatText(var_661_4.content)

				arg_658_1.text_.text = var_661_5

				LuaForUtil.ClearLinePrefixSymbol(arg_658_1.text_)

				local var_661_6 = 45
				local var_661_7 = utf8.len(var_661_5)
				local var_661_8 = var_661_6 <= 0 and var_661_2 or var_661_2 * (var_661_7 / var_661_6)

				if var_661_8 > 0 and var_661_2 < var_661_8 then
					arg_658_1.talkMaxDuration = var_661_8

					if var_661_8 + var_661_1 > arg_658_1.duration_ then
						arg_658_1.duration_ = var_661_8 + var_661_1
					end
				end

				arg_658_1.text_.text = var_661_5
				arg_658_1.typewritter.percent = 0

				arg_658_1.typewritter:SetDirty()
				arg_658_1:ShowNextGo(false)
				arg_658_1:RecordContent(arg_658_1.text_.text)
			end

			local var_661_9 = math.max(var_661_2, arg_658_1.talkMaxDuration)

			if var_661_1 <= arg_658_1.time_ and arg_658_1.time_ < var_661_1 + var_661_9 then
				arg_658_1.typewritter.percent = (arg_658_1.time_ - var_661_1) / var_661_9

				arg_658_1.typewritter:SetDirty()
			end

			if arg_658_1.time_ >= var_661_1 + var_661_9 and arg_658_1.time_ < var_661_1 + var_661_9 + arg_661_0 then
				arg_658_1.typewritter.percent = 1

				arg_658_1.typewritter:SetDirty()
				arg_658_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105160 = function(arg_662_0, arg_662_1)
		arg_662_1.time_ = 0
		arg_662_1.frameCnt_ = 0
		arg_662_1.state_ = "playing"
		arg_662_1.curTalkId_ = 1108105160
		arg_662_1.duration_ = 5

		SetActive(arg_662_1.tipsGo_, false)

		function arg_662_1.onSingleLineFinish_()
			arg_662_1.onSingleLineUpdate_ = nil
			arg_662_1.onSingleLineFinish_ = nil
			arg_662_1.state_ = "waiting"
		end

		function arg_662_1.playNext_(arg_664_0)
			if arg_664_0 == 1 then
				arg_662_0:Play1108105161(arg_662_1)
			end
		end

		function arg_662_1.onSingleLineUpdate_(arg_665_0)
			local var_665_0 = 0
			local var_665_1 = 0.5

			if var_665_0 < arg_662_1.time_ and arg_662_1.time_ <= var_665_0 + arg_665_0 then
				arg_662_1.talkMaxDuration = 0
				arg_662_1.dialogCg_.alpha = 1

				arg_662_1.dialog_:SetActive(true)
				SetActive(arg_662_1.leftNameGo_, true)

				local var_665_2 = arg_662_1:FormatText(StoryNameCfg[202].name)

				arg_662_1.leftNameTxt_.text = var_665_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_662_1.leftNameTxt_.transform)

				arg_662_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_662_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_662_1:RecordName(arg_662_1.leftNameTxt_.text)
				SetActive(arg_662_1.iconTrs_.gameObject, false)
				arg_662_1.callingController_:SetSelectedState("normal")

				local var_665_3 = arg_662_1:GetWordFromCfg(1108105160)
				local var_665_4 = arg_662_1:FormatText(var_665_3.content)

				arg_662_1.text_.text = var_665_4

				LuaForUtil.ClearLinePrefixSymbol(arg_662_1.text_)

				local var_665_5 = 20
				local var_665_6 = utf8.len(var_665_4)
				local var_665_7 = var_665_5 <= 0 and var_665_1 or var_665_1 * (var_665_6 / var_665_5)

				if var_665_7 > 0 and var_665_1 < var_665_7 then
					arg_662_1.talkMaxDuration = var_665_7

					if var_665_7 + var_665_0 > arg_662_1.duration_ then
						arg_662_1.duration_ = var_665_7 + var_665_0
					end
				end

				arg_662_1.text_.text = var_665_4
				arg_662_1.typewritter.percent = 0

				arg_662_1.typewritter:SetDirty()
				arg_662_1:ShowNextGo(false)
				arg_662_1:RecordContent(arg_662_1.text_.text)
			end

			local var_665_8 = math.max(var_665_1, arg_662_1.talkMaxDuration)

			if var_665_0 <= arg_662_1.time_ and arg_662_1.time_ < var_665_0 + var_665_8 then
				arg_662_1.typewritter.percent = (arg_662_1.time_ - var_665_0) / var_665_8

				arg_662_1.typewritter:SetDirty()
			end

			if arg_662_1.time_ >= var_665_0 + var_665_8 and arg_662_1.time_ < var_665_0 + var_665_8 + arg_665_0 then
				arg_662_1.typewritter.percent = 1

				arg_662_1.typewritter:SetDirty()
				arg_662_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105161 = function(arg_666_0, arg_666_1)
		arg_666_1.time_ = 0
		arg_666_1.frameCnt_ = 0
		arg_666_1.state_ = "playing"
		arg_666_1.curTalkId_ = 1108105161
		arg_666_1.duration_ = 5.03

		SetActive(arg_666_1.tipsGo_, false)

		function arg_666_1.onSingleLineFinish_()
			arg_666_1.onSingleLineUpdate_ = nil
			arg_666_1.onSingleLineFinish_ = nil
			arg_666_1.state_ = "waiting"
		end

		function arg_666_1.playNext_(arg_668_0)
			if arg_668_0 == 1 then
				arg_666_0:Play1108105162(arg_666_1)
			end
		end

		function arg_666_1.onSingleLineUpdate_(arg_669_0)
			local var_669_0 = 0

			if var_669_0 < arg_666_1.time_ and arg_666_1.time_ <= var_669_0 + arg_669_0 then
				arg_666_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_669_1
			local var_669_2 = 0.0333333333333333

			if var_669_2 < arg_666_1.time_ and arg_666_1.time_ <= var_669_2 + arg_669_0 then
				local var_669_3 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_669_3 then
					var_669_3.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_669_3.radialBlurScale = 0
					var_669_3.radialBlurGradient = 0
					var_669_3.radialBlurIntensity = 0

					if var_669_1 then
						var_669_3.radialBlurTarget = var_669_1.transform
					end
				end
			end

			local var_669_4 = 5

			if var_669_2 <= arg_666_1.time_ and arg_666_1.time_ < var_669_2 + var_669_4 then
				local var_669_5 = (arg_666_1.time_ - var_669_2) / var_669_4
				local var_669_6 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_669_6 then
					var_669_6.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_669_6.radialBlurScale = Mathf.Lerp(0, 0, var_669_5)
					var_669_6.radialBlurGradient = Mathf.Lerp(0, 0, var_669_5)
					var_669_6.radialBlurIntensity = Mathf.Lerp(0, 0, var_669_5)
				end
			end

			if arg_666_1.time_ >= var_669_2 + var_669_4 and arg_666_1.time_ < var_669_2 + var_669_4 + arg_669_0 then
				local var_669_7 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_669_7 then
					var_669_7.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_669_7.radialBlurScale = 0
					var_669_7.radialBlurGradient = 0
					var_669_7.radialBlurIntensity = 0
				end
			end

			local var_669_8 = 0
			local var_669_9 = 1.025

			if var_669_8 < arg_666_1.time_ and arg_666_1.time_ <= var_669_8 + arg_669_0 then
				arg_666_1.talkMaxDuration = 0
				arg_666_1.dialogCg_.alpha = 1

				arg_666_1.dialog_:SetActive(true)
				SetActive(arg_666_1.leftNameGo_, true)

				local var_669_10 = arg_666_1:FormatText(StoryNameCfg[202].name)

				arg_666_1.leftNameTxt_.text = var_669_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_666_1.leftNameTxt_.transform)

				arg_666_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_666_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_666_1:RecordName(arg_666_1.leftNameTxt_.text)
				SetActive(arg_666_1.iconTrs_.gameObject, false)
				arg_666_1.callingController_:SetSelectedState("normal")

				local var_669_11 = arg_666_1:GetWordFromCfg(1108105161)
				local var_669_12 = arg_666_1:FormatText(var_669_11.content)

				arg_666_1.text_.text = var_669_12

				LuaForUtil.ClearLinePrefixSymbol(arg_666_1.text_)

				local var_669_13 = 41
				local var_669_14 = utf8.len(var_669_12)
				local var_669_15 = var_669_13 <= 0 and var_669_9 or var_669_9 * (var_669_14 / var_669_13)

				if var_669_15 > 0 and var_669_9 < var_669_15 then
					arg_666_1.talkMaxDuration = var_669_15

					if var_669_15 + var_669_8 > arg_666_1.duration_ then
						arg_666_1.duration_ = var_669_15 + var_669_8
					end
				end

				arg_666_1.text_.text = var_669_12
				arg_666_1.typewritter.percent = 0

				arg_666_1.typewritter:SetDirty()
				arg_666_1:ShowNextGo(false)
				arg_666_1:RecordContent(arg_666_1.text_.text)
			end

			local var_669_16 = math.max(var_669_9, arg_666_1.talkMaxDuration)

			if var_669_8 <= arg_666_1.time_ and arg_666_1.time_ < var_669_8 + var_669_16 then
				arg_666_1.typewritter.percent = (arg_666_1.time_ - var_669_8) / var_669_16

				arg_666_1.typewritter:SetDirty()
			end

			if arg_666_1.time_ >= var_669_8 + var_669_16 and arg_666_1.time_ < var_669_8 + var_669_16 + arg_669_0 then
				arg_666_1.typewritter.percent = 1

				arg_666_1.typewritter:SetDirty()
				arg_666_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105162 = function(arg_670_0, arg_670_1)
		arg_670_1.time_ = 0
		arg_670_1.frameCnt_ = 0
		arg_670_1.state_ = "playing"
		arg_670_1.curTalkId_ = 1108105162
		arg_670_1.duration_ = 7.2

		SetActive(arg_670_1.tipsGo_, false)

		function arg_670_1.onSingleLineFinish_()
			arg_670_1.onSingleLineUpdate_ = nil
			arg_670_1.onSingleLineFinish_ = nil
			arg_670_1.state_ = "waiting"
		end

		function arg_670_1.playNext_(arg_672_0)
			if arg_672_0 == 1 then
				arg_670_0:Play1108105163(arg_670_1)
			end
		end

		function arg_670_1.onSingleLineUpdate_(arg_673_0)
			local var_673_0 = arg_670_1.actors_["1081ui_story"]
			local var_673_1 = 0

			if var_673_1 < arg_670_1.time_ and arg_670_1.time_ <= var_673_1 + arg_673_0 and arg_670_1.var_.characterEffect1081ui_story == nil then
				arg_670_1.var_.characterEffect1081ui_story = var_673_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_673_2 = 0.200000002980232

			if var_673_1 <= arg_670_1.time_ and arg_670_1.time_ < var_673_1 + var_673_2 then
				local var_673_3 = (arg_670_1.time_ - var_673_1) / var_673_2

				if arg_670_1.var_.characterEffect1081ui_story then
					local var_673_4 = Mathf.Lerp(0, 0.5, var_673_3)

					arg_670_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_670_1.var_.characterEffect1081ui_story.fillRatio = var_673_4
				end
			end

			if arg_670_1.time_ >= var_673_1 + var_673_2 and arg_670_1.time_ < var_673_1 + var_673_2 + arg_673_0 and arg_670_1.var_.characterEffect1081ui_story then
				local var_673_5 = 0.5

				arg_670_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_670_1.var_.characterEffect1081ui_story.fillRatio = var_673_5
			end

			local var_673_6 = arg_670_1.actors_["1081ui_story"].transform
			local var_673_7 = 0

			if var_673_7 < arg_670_1.time_ and arg_670_1.time_ <= var_673_7 + arg_673_0 then
				arg_670_1.var_.moveOldPos1081ui_story = var_673_6.localPosition
			end

			local var_673_8 = 0.001

			if var_673_7 <= arg_670_1.time_ and arg_670_1.time_ < var_673_7 + var_673_8 then
				local var_673_9 = (arg_670_1.time_ - var_673_7) / var_673_8
				local var_673_10 = Vector3.New(0, 100, 0)

				var_673_6.localPosition = Vector3.Lerp(arg_670_1.var_.moveOldPos1081ui_story, var_673_10, var_673_9)

				local var_673_11 = manager.ui.mainCamera.transform.position - var_673_6.position

				var_673_6.forward = Vector3.New(var_673_11.x, var_673_11.y, var_673_11.z)

				local var_673_12 = var_673_6.localEulerAngles

				var_673_12.z = 0
				var_673_12.x = 0
				var_673_6.localEulerAngles = var_673_12
			end

			if arg_670_1.time_ >= var_673_7 + var_673_8 and arg_670_1.time_ < var_673_7 + var_673_8 + arg_673_0 then
				var_673_6.localPosition = Vector3.New(0, 100, 0)

				local var_673_13 = manager.ui.mainCamera.transform.position - var_673_6.position

				var_673_6.forward = Vector3.New(var_673_13.x, var_673_13.y, var_673_13.z)

				local var_673_14 = var_673_6.localEulerAngles

				var_673_14.z = 0
				var_673_14.x = 0
				var_673_6.localEulerAngles = var_673_14
			end

			local var_673_15 = 0.966666666666667

			if var_673_15 < arg_670_1.time_ and arg_670_1.time_ <= var_673_15 + arg_673_0 then
				arg_670_1.allBtn_.enabled = false
			end

			local var_673_16 = 1.23333333333333

			if arg_670_1.time_ >= var_673_15 + var_673_16 and arg_670_1.time_ < var_673_15 + var_673_16 + arg_673_0 then
				arg_670_1.allBtn_.enabled = true
			end

			local var_673_17 = arg_670_1.actors_.ST0402a
			local var_673_18 = 0.966666666666667

			if var_673_18 < arg_670_1.time_ and arg_670_1.time_ <= var_673_18 + arg_673_0 then
				local var_673_19 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_673_19 then
					var_673_19.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_673_19.radialBlurScale = 0
					var_673_19.radialBlurGradient = 1
					var_673_19.radialBlurIntensity = 1

					if var_673_17 then
						var_673_19.radialBlurTarget = var_673_17.transform
					end
				end
			end

			local var_673_20 = 1.23333333333333

			if var_673_18 <= arg_670_1.time_ and arg_670_1.time_ < var_673_18 + var_673_20 then
				local var_673_21 = (arg_670_1.time_ - var_673_18) / var_673_20
				local var_673_22 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_673_22 then
					var_673_22.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_673_22.radialBlurScale = Mathf.Lerp(0, 0, var_673_21)
					var_673_22.radialBlurGradient = Mathf.Lerp(1, 1, var_673_21)
					var_673_22.radialBlurIntensity = Mathf.Lerp(1, 1, var_673_21)
				end
			end

			if arg_670_1.time_ >= var_673_18 + var_673_20 and arg_670_1.time_ < var_673_18 + var_673_20 + arg_673_0 then
				local var_673_23 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_673_23 then
					var_673_23.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_673_23.radialBlurScale = 0
					var_673_23.radialBlurGradient = 1
					var_673_23.radialBlurIntensity = 1
				end
			end

			local var_673_24 = 0

			if var_673_24 < arg_670_1.time_ and arg_670_1.time_ <= var_673_24 + arg_673_0 then
				arg_670_1.mask_.enabled = true
				arg_670_1.mask_.raycastTarget = true

				arg_670_1:SetGaussion(false)
			end

			local var_673_25 = 1

			if var_673_24 <= arg_670_1.time_ and arg_670_1.time_ < var_673_24 + var_673_25 then
				local var_673_26 = (arg_670_1.time_ - var_673_24) / var_673_25
				local var_673_27 = Color.New(0, 0, 0)

				var_673_27.a = Mathf.Lerp(0, 1, var_673_26)
				arg_670_1.mask_.color = var_673_27
			end

			if arg_670_1.time_ >= var_673_24 + var_673_25 and arg_670_1.time_ < var_673_24 + var_673_25 + arg_673_0 then
				local var_673_28 = Color.New(0, 0, 0)

				var_673_28.a = 1
				arg_670_1.mask_.color = var_673_28
			end

			local var_673_29 = 1

			if var_673_29 < arg_670_1.time_ and arg_670_1.time_ <= var_673_29 + arg_673_0 then
				arg_670_1.mask_.enabled = true
				arg_670_1.mask_.raycastTarget = true

				arg_670_1:SetGaussion(false)
			end

			local var_673_30 = 1.2

			if var_673_29 <= arg_670_1.time_ and arg_670_1.time_ < var_673_29 + var_673_30 then
				local var_673_31 = (arg_670_1.time_ - var_673_29) / var_673_30
				local var_673_32 = Color.New(0, 0, 0)

				var_673_32.a = Mathf.Lerp(1, 0, var_673_31)
				arg_670_1.mask_.color = var_673_32
			end

			if arg_670_1.time_ >= var_673_29 + var_673_30 and arg_670_1.time_ < var_673_29 + var_673_30 + arg_673_0 then
				local var_673_33 = Color.New(0, 0, 0)
				local var_673_34 = 0

				arg_670_1.mask_.enabled = false
				var_673_33.a = var_673_34
				arg_670_1.mask_.color = var_673_33
			end

			if arg_670_1.frameCnt_ <= 1 then
				arg_670_1.dialog_:SetActive(false)
			end

			local var_673_35 = 2.2
			local var_673_36 = 1.25

			if var_673_35 < arg_670_1.time_ and arg_670_1.time_ <= var_673_35 + arg_673_0 then
				arg_670_1.talkMaxDuration = 0

				arg_670_1.dialog_:SetActive(true)

				local var_673_37 = LeanTween.value(arg_670_1.dialog_, 0, 1, 0.3)

				var_673_37:setOnUpdate(LuaHelper.FloatAction(function(arg_674_0)
					arg_670_1.dialogCg_.alpha = arg_674_0
				end))
				var_673_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_670_1.dialog_)
					var_673_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_670_1.duration_ = arg_670_1.duration_ + 0.3

				SetActive(arg_670_1.leftNameGo_, false)

				arg_670_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_670_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_670_1:RecordName(arg_670_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_670_1.iconTrs_.gameObject, false)
				arg_670_1.callingController_:SetSelectedState("normal")

				local var_673_38 = arg_670_1:GetWordFromCfg(1108105162)
				local var_673_39 = arg_670_1:FormatText(var_673_38.content)

				arg_670_1.text_.text = var_673_39

				LuaForUtil.ClearLinePrefixSymbol(arg_670_1.text_)

				local var_673_40 = 50
				local var_673_41 = utf8.len(var_673_39)
				local var_673_42 = var_673_40 <= 0 and var_673_36 or var_673_36 * (var_673_41 / var_673_40)

				if var_673_42 > 0 and var_673_36 < var_673_42 then
					arg_670_1.talkMaxDuration = var_673_42
					var_673_35 = var_673_35 + 0.3

					if var_673_42 + var_673_35 > arg_670_1.duration_ then
						arg_670_1.duration_ = var_673_42 + var_673_35
					end
				end

				arg_670_1.text_.text = var_673_39
				arg_670_1.typewritter.percent = 0

				arg_670_1.typewritter:SetDirty()
				arg_670_1:ShowNextGo(false)
				arg_670_1:RecordContent(arg_670_1.text_.text)
			end

			local var_673_43 = var_673_35 + 0.3
			local var_673_44 = math.max(var_673_36, arg_670_1.talkMaxDuration)

			if var_673_43 <= arg_670_1.time_ and arg_670_1.time_ < var_673_43 + var_673_44 then
				arg_670_1.typewritter.percent = (arg_670_1.time_ - var_673_43) / var_673_44

				arg_670_1.typewritter:SetDirty()
			end

			if arg_670_1.time_ >= var_673_43 + var_673_44 and arg_670_1.time_ < var_673_43 + var_673_44 + arg_673_0 then
				arg_670_1.typewritter.percent = 1

				arg_670_1.typewritter:SetDirty()
				arg_670_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105163 = function(arg_676_0, arg_676_1)
		arg_676_1.time_ = 0
		arg_676_1.frameCnt_ = 0
		arg_676_1.state_ = "playing"
		arg_676_1.curTalkId_ = 1108105163
		arg_676_1.duration_ = 5

		SetActive(arg_676_1.tipsGo_, false)

		function arg_676_1.onSingleLineFinish_()
			arg_676_1.onSingleLineUpdate_ = nil
			arg_676_1.onSingleLineFinish_ = nil
			arg_676_1.state_ = "waiting"
		end

		function arg_676_1.playNext_(arg_678_0)
			if arg_678_0 == 1 then
				arg_676_0:Play1108105164(arg_676_1)
			end
		end

		function arg_676_1.onSingleLineUpdate_(arg_679_0)
			local var_679_0 = 0
			local var_679_1 = 1.325

			if var_679_0 < arg_676_1.time_ and arg_676_1.time_ <= var_679_0 + arg_679_0 then
				arg_676_1.talkMaxDuration = 0
				arg_676_1.dialogCg_.alpha = 1

				arg_676_1.dialog_:SetActive(true)
				SetActive(arg_676_1.leftNameGo_, false)

				arg_676_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_676_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_676_1:RecordName(arg_676_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_676_1.iconTrs_.gameObject, false)
				arg_676_1.callingController_:SetSelectedState("normal")

				local var_679_2 = arg_676_1:GetWordFromCfg(1108105163)
				local var_679_3 = arg_676_1:FormatText(var_679_2.content)

				arg_676_1.text_.text = var_679_3

				LuaForUtil.ClearLinePrefixSymbol(arg_676_1.text_)

				local var_679_4 = 53
				local var_679_5 = utf8.len(var_679_3)
				local var_679_6 = var_679_4 <= 0 and var_679_1 or var_679_1 * (var_679_5 / var_679_4)

				if var_679_6 > 0 and var_679_1 < var_679_6 then
					arg_676_1.talkMaxDuration = var_679_6

					if var_679_6 + var_679_0 > arg_676_1.duration_ then
						arg_676_1.duration_ = var_679_6 + var_679_0
					end
				end

				arg_676_1.text_.text = var_679_3
				arg_676_1.typewritter.percent = 0

				arg_676_1.typewritter:SetDirty()
				arg_676_1:ShowNextGo(false)
				arg_676_1:RecordContent(arg_676_1.text_.text)
			end

			local var_679_7 = math.max(var_679_1, arg_676_1.talkMaxDuration)

			if var_679_0 <= arg_676_1.time_ and arg_676_1.time_ < var_679_0 + var_679_7 then
				arg_676_1.typewritter.percent = (arg_676_1.time_ - var_679_0) / var_679_7

				arg_676_1.typewritter:SetDirty()
			end

			if arg_676_1.time_ >= var_679_0 + var_679_7 and arg_676_1.time_ < var_679_0 + var_679_7 + arg_679_0 then
				arg_676_1.typewritter.percent = 1

				arg_676_1.typewritter:SetDirty()
				arg_676_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105164 = function(arg_680_0, arg_680_1)
		arg_680_1.time_ = 0
		arg_680_1.frameCnt_ = 0
		arg_680_1.state_ = "playing"
		arg_680_1.curTalkId_ = 1108105164
		arg_680_1.duration_ = 5

		SetActive(arg_680_1.tipsGo_, false)

		function arg_680_1.onSingleLineFinish_()
			arg_680_1.onSingleLineUpdate_ = nil
			arg_680_1.onSingleLineFinish_ = nil
			arg_680_1.state_ = "waiting"
		end

		function arg_680_1.playNext_(arg_682_0)
			if arg_682_0 == 1 then
				arg_680_0:Play1108105165(arg_680_1)
			end
		end

		function arg_680_1.onSingleLineUpdate_(arg_683_0)
			local var_683_0 = 0
			local var_683_1 = 0.35

			if var_683_0 < arg_680_1.time_ and arg_680_1.time_ <= var_683_0 + arg_683_0 then
				arg_680_1.talkMaxDuration = 0
				arg_680_1.dialogCg_.alpha = 1

				arg_680_1.dialog_:SetActive(true)
				SetActive(arg_680_1.leftNameGo_, true)

				local var_683_2 = arg_680_1:FormatText(StoryNameCfg[202].name)

				arg_680_1.leftNameTxt_.text = var_683_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_680_1.leftNameTxt_.transform)

				arg_680_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_680_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_680_1:RecordName(arg_680_1.leftNameTxt_.text)
				SetActive(arg_680_1.iconTrs_.gameObject, true)
				arg_680_1.iconController_:SetSelectedState("hero")

				arg_680_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_680_1.callingController_:SetSelectedState("normal")

				arg_680_1.keyicon_.color = Color.New(1, 1, 1)
				arg_680_1.icon_.color = Color.New(1, 1, 1)

				local var_683_3 = arg_680_1:GetWordFromCfg(1108105164)
				local var_683_4 = arg_680_1:FormatText(var_683_3.content)

				arg_680_1.text_.text = var_683_4

				LuaForUtil.ClearLinePrefixSymbol(arg_680_1.text_)

				local var_683_5 = 14
				local var_683_6 = utf8.len(var_683_4)
				local var_683_7 = var_683_5 <= 0 and var_683_1 or var_683_1 * (var_683_6 / var_683_5)

				if var_683_7 > 0 and var_683_1 < var_683_7 then
					arg_680_1.talkMaxDuration = var_683_7

					if var_683_7 + var_683_0 > arg_680_1.duration_ then
						arg_680_1.duration_ = var_683_7 + var_683_0
					end
				end

				arg_680_1.text_.text = var_683_4
				arg_680_1.typewritter.percent = 0

				arg_680_1.typewritter:SetDirty()
				arg_680_1:ShowNextGo(false)
				arg_680_1:RecordContent(arg_680_1.text_.text)
			end

			local var_683_8 = math.max(var_683_1, arg_680_1.talkMaxDuration)

			if var_683_0 <= arg_680_1.time_ and arg_680_1.time_ < var_683_0 + var_683_8 then
				arg_680_1.typewritter.percent = (arg_680_1.time_ - var_683_0) / var_683_8

				arg_680_1.typewritter:SetDirty()
			end

			if arg_680_1.time_ >= var_683_0 + var_683_8 and arg_680_1.time_ < var_683_0 + var_683_8 + arg_683_0 then
				arg_680_1.typewritter.percent = 1

				arg_680_1.typewritter:SetDirty()
				arg_680_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105165 = function(arg_684_0, arg_684_1)
		arg_684_1.time_ = 0
		arg_684_1.frameCnt_ = 0
		arg_684_1.state_ = "playing"
		arg_684_1.curTalkId_ = 1108105165
		arg_684_1.duration_ = 7

		SetActive(arg_684_1.tipsGo_, false)

		function arg_684_1.onSingleLineFinish_()
			arg_684_1.onSingleLineUpdate_ = nil
			arg_684_1.onSingleLineFinish_ = nil
			arg_684_1.state_ = "waiting"
		end

		function arg_684_1.playNext_(arg_686_0)
			if arg_686_0 == 1 then
				arg_684_0:Play1108105166(arg_684_1)
			end
		end

		function arg_684_1.onSingleLineUpdate_(arg_687_0)
			local var_687_0 = arg_684_1.actors_["1081ui_story"]
			local var_687_1 = 0

			if var_687_1 < arg_684_1.time_ and arg_684_1.time_ <= var_687_1 + arg_687_0 and arg_684_1.var_.characterEffect1081ui_story == nil then
				arg_684_1.var_.characterEffect1081ui_story = var_687_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_687_2 = 0.200000002980232

			if var_687_1 <= arg_684_1.time_ and arg_684_1.time_ < var_687_1 + var_687_2 then
				local var_687_3 = (arg_684_1.time_ - var_687_1) / var_687_2

				if arg_684_1.var_.characterEffect1081ui_story then
					local var_687_4 = Mathf.Lerp(0, 0.5, var_687_3)

					arg_684_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_684_1.var_.characterEffect1081ui_story.fillRatio = var_687_4
				end
			end

			if arg_684_1.time_ >= var_687_1 + var_687_2 and arg_684_1.time_ < var_687_1 + var_687_2 + arg_687_0 and arg_684_1.var_.characterEffect1081ui_story then
				local var_687_5 = 0.5

				arg_684_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_684_1.var_.characterEffect1081ui_story.fillRatio = var_687_5
			end

			local var_687_6 = arg_684_1.actors_["1081ui_story"].transform
			local var_687_7 = 0

			if var_687_7 < arg_684_1.time_ and arg_684_1.time_ <= var_687_7 + arg_687_0 then
				arg_684_1.var_.moveOldPos1081ui_story = var_687_6.localPosition
			end

			local var_687_8 = 0.001

			if var_687_7 <= arg_684_1.time_ and arg_684_1.time_ < var_687_7 + var_687_8 then
				local var_687_9 = (arg_684_1.time_ - var_687_7) / var_687_8
				local var_687_10 = Vector3.New(0, 100, 0)

				var_687_6.localPosition = Vector3.Lerp(arg_684_1.var_.moveOldPos1081ui_story, var_687_10, var_687_9)

				local var_687_11 = manager.ui.mainCamera.transform.position - var_687_6.position

				var_687_6.forward = Vector3.New(var_687_11.x, var_687_11.y, var_687_11.z)

				local var_687_12 = var_687_6.localEulerAngles

				var_687_12.z = 0
				var_687_12.x = 0
				var_687_6.localEulerAngles = var_687_12
			end

			if arg_684_1.time_ >= var_687_7 + var_687_8 and arg_684_1.time_ < var_687_7 + var_687_8 + arg_687_0 then
				var_687_6.localPosition = Vector3.New(0, 100, 0)

				local var_687_13 = manager.ui.mainCamera.transform.position - var_687_6.position

				var_687_6.forward = Vector3.New(var_687_13.x, var_687_13.y, var_687_13.z)

				local var_687_14 = var_687_6.localEulerAngles

				var_687_14.z = 0
				var_687_14.x = 0
				var_687_6.localEulerAngles = var_687_14
			end

			local var_687_15 = 0

			if var_687_15 < arg_684_1.time_ and arg_684_1.time_ <= var_687_15 + arg_687_0 then
				arg_684_1.allBtn_.enabled = false
			end

			local var_687_16 = 1.23333333333333

			if arg_684_1.time_ >= var_687_15 + var_687_16 and arg_684_1.time_ < var_687_15 + var_687_16 + arg_687_0 then
				arg_684_1.allBtn_.enabled = true
			end

			local var_687_17 = arg_684_1.actors_.ST0402a
			local var_687_18 = 0

			if var_687_18 < arg_684_1.time_ and arg_684_1.time_ <= var_687_18 + arg_687_0 then
				local var_687_19 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_687_19 then
					var_687_19.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_687_19.radialBlurScale = 0
					var_687_19.radialBlurGradient = 0
					var_687_19.radialBlurIntensity = 0

					if var_687_17 then
						var_687_19.radialBlurTarget = var_687_17.transform
					end
				end
			end

			local var_687_20 = 1.23333333333333

			if var_687_18 <= arg_684_1.time_ and arg_684_1.time_ < var_687_18 + var_687_20 then
				local var_687_21 = (arg_684_1.time_ - var_687_18) / var_687_20
				local var_687_22 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_687_22 then
					var_687_22.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_687_22.radialBlurScale = Mathf.Lerp(0, 0, var_687_21)
					var_687_22.radialBlurGradient = Mathf.Lerp(0, 0, var_687_21)
					var_687_22.radialBlurIntensity = Mathf.Lerp(0, 0, var_687_21)
				end
			end

			if arg_684_1.time_ >= var_687_18 + var_687_20 and arg_684_1.time_ < var_687_18 + var_687_20 + arg_687_0 then
				local var_687_23 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_687_23 then
					var_687_23.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_687_23.radialBlurScale = 0
					var_687_23.radialBlurGradient = 0
					var_687_23.radialBlurIntensity = 0
				end
			end

			local var_687_24 = 0

			if var_687_24 < arg_684_1.time_ and arg_684_1.time_ <= var_687_24 + arg_687_0 then
				arg_684_1.mask_.enabled = true
				arg_684_1.mask_.raycastTarget = true

				arg_684_1:SetGaussion(false)
			end

			local var_687_25 = 1.7

			if var_687_24 <= arg_684_1.time_ and arg_684_1.time_ < var_687_24 + var_687_25 then
				local var_687_26 = (arg_684_1.time_ - var_687_24) / var_687_25
				local var_687_27 = Color.New(1, 1, 1)

				var_687_27.a = Mathf.Lerp(1, 0, var_687_26)
				arg_684_1.mask_.color = var_687_27
			end

			if arg_684_1.time_ >= var_687_24 + var_687_25 and arg_684_1.time_ < var_687_24 + var_687_25 + arg_687_0 then
				local var_687_28 = Color.New(1, 1, 1)
				local var_687_29 = 0

				arg_684_1.mask_.enabled = false
				var_687_28.a = var_687_29
				arg_684_1.mask_.color = var_687_28
			end

			if arg_684_1.frameCnt_ <= 1 then
				arg_684_1.dialog_:SetActive(false)
			end

			local var_687_30 = 2
			local var_687_31 = 1.65

			if var_687_30 < arg_684_1.time_ and arg_684_1.time_ <= var_687_30 + arg_687_0 then
				arg_684_1.talkMaxDuration = 0

				arg_684_1.dialog_:SetActive(true)

				local var_687_32 = LeanTween.value(arg_684_1.dialog_, 0, 1, 0.3)

				var_687_32:setOnUpdate(LuaHelper.FloatAction(function(arg_688_0)
					arg_684_1.dialogCg_.alpha = arg_688_0
				end))
				var_687_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_684_1.dialog_)
					var_687_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_684_1.duration_ = arg_684_1.duration_ + 0.3

				SetActive(arg_684_1.leftNameGo_, false)

				arg_684_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_684_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_684_1:RecordName(arg_684_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_684_1.iconTrs_.gameObject, false)
				arg_684_1.callingController_:SetSelectedState("normal")

				local var_687_33 = arg_684_1:GetWordFromCfg(1108105165)
				local var_687_34 = arg_684_1:FormatText(var_687_33.content)

				arg_684_1.text_.text = var_687_34

				LuaForUtil.ClearLinePrefixSymbol(arg_684_1.text_)

				local var_687_35 = 66
				local var_687_36 = utf8.len(var_687_34)
				local var_687_37 = var_687_35 <= 0 and var_687_31 or var_687_31 * (var_687_36 / var_687_35)

				if var_687_37 > 0 and var_687_31 < var_687_37 then
					arg_684_1.talkMaxDuration = var_687_37
					var_687_30 = var_687_30 + 0.3

					if var_687_37 + var_687_30 > arg_684_1.duration_ then
						arg_684_1.duration_ = var_687_37 + var_687_30
					end
				end

				arg_684_1.text_.text = var_687_34
				arg_684_1.typewritter.percent = 0

				arg_684_1.typewritter:SetDirty()
				arg_684_1:ShowNextGo(false)
				arg_684_1:RecordContent(arg_684_1.text_.text)
			end

			local var_687_38 = var_687_30 + 0.3
			local var_687_39 = math.max(var_687_31, arg_684_1.talkMaxDuration)

			if var_687_38 <= arg_684_1.time_ and arg_684_1.time_ < var_687_38 + var_687_39 then
				arg_684_1.typewritter.percent = (arg_684_1.time_ - var_687_38) / var_687_39

				arg_684_1.typewritter:SetDirty()
			end

			if arg_684_1.time_ >= var_687_38 + var_687_39 and arg_684_1.time_ < var_687_38 + var_687_39 + arg_687_0 then
				arg_684_1.typewritter.percent = 1

				arg_684_1.typewritter:SetDirty()
				arg_684_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105166 = function(arg_690_0, arg_690_1)
		arg_690_1.time_ = 0
		arg_690_1.frameCnt_ = 0
		arg_690_1.state_ = "playing"
		arg_690_1.curTalkId_ = 1108105166
		arg_690_1.duration_ = 5

		SetActive(arg_690_1.tipsGo_, false)

		function arg_690_1.onSingleLineFinish_()
			arg_690_1.onSingleLineUpdate_ = nil
			arg_690_1.onSingleLineFinish_ = nil
			arg_690_1.state_ = "waiting"
		end

		function arg_690_1.playNext_(arg_692_0)
			if arg_692_0 == 1 then
				arg_690_0:Play1108105167(arg_690_1)
			end
		end

		function arg_690_1.onSingleLineUpdate_(arg_693_0)
			local var_693_0 = 0
			local var_693_1 = 0.25

			if var_693_0 < arg_690_1.time_ and arg_690_1.time_ <= var_693_0 + arg_693_0 then
				arg_690_1.talkMaxDuration = 0
				arg_690_1.dialogCg_.alpha = 1

				arg_690_1.dialog_:SetActive(true)
				SetActive(arg_690_1.leftNameGo_, true)

				local var_693_2 = arg_690_1:FormatText(StoryNameCfg[7].name)

				arg_690_1.leftNameTxt_.text = var_693_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_690_1.leftNameTxt_.transform)

				arg_690_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_690_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_690_1:RecordName(arg_690_1.leftNameTxt_.text)
				SetActive(arg_690_1.iconTrs_.gameObject, false)
				arg_690_1.callingController_:SetSelectedState("normal")

				local var_693_3 = arg_690_1:GetWordFromCfg(1108105166)
				local var_693_4 = arg_690_1:FormatText(var_693_3.content)

				arg_690_1.text_.text = var_693_4

				LuaForUtil.ClearLinePrefixSymbol(arg_690_1.text_)

				local var_693_5 = 10
				local var_693_6 = utf8.len(var_693_4)
				local var_693_7 = var_693_5 <= 0 and var_693_1 or var_693_1 * (var_693_6 / var_693_5)

				if var_693_7 > 0 and var_693_1 < var_693_7 then
					arg_690_1.talkMaxDuration = var_693_7

					if var_693_7 + var_693_0 > arg_690_1.duration_ then
						arg_690_1.duration_ = var_693_7 + var_693_0
					end
				end

				arg_690_1.text_.text = var_693_4
				arg_690_1.typewritter.percent = 0

				arg_690_1.typewritter:SetDirty()
				arg_690_1:ShowNextGo(false)
				arg_690_1:RecordContent(arg_690_1.text_.text)
			end

			local var_693_8 = math.max(var_693_1, arg_690_1.talkMaxDuration)

			if var_693_0 <= arg_690_1.time_ and arg_690_1.time_ < var_693_0 + var_693_8 then
				arg_690_1.typewritter.percent = (arg_690_1.time_ - var_693_0) / var_693_8

				arg_690_1.typewritter:SetDirty()
			end

			if arg_690_1.time_ >= var_693_0 + var_693_8 and arg_690_1.time_ < var_693_0 + var_693_8 + arg_693_0 then
				arg_690_1.typewritter.percent = 1

				arg_690_1.typewritter:SetDirty()
				arg_690_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105167 = function(arg_694_0, arg_694_1)
		arg_694_1.time_ = 0
		arg_694_1.frameCnt_ = 0
		arg_694_1.state_ = "playing"
		arg_694_1.curTalkId_ = 1108105167
		arg_694_1.duration_ = 5

		SetActive(arg_694_1.tipsGo_, false)

		function arg_694_1.onSingleLineFinish_()
			arg_694_1.onSingleLineUpdate_ = nil
			arg_694_1.onSingleLineFinish_ = nil
			arg_694_1.state_ = "waiting"
		end

		function arg_694_1.playNext_(arg_696_0)
			if arg_696_0 == 1 then
				arg_694_0:Play1108105168(arg_694_1)
			end
		end

		function arg_694_1.onSingleLineUpdate_(arg_697_0)
			local var_697_0 = 0
			local var_697_1 = 0.575

			if var_697_0 < arg_694_1.time_ and arg_694_1.time_ <= var_697_0 + arg_697_0 then
				arg_694_1.talkMaxDuration = 0
				arg_694_1.dialogCg_.alpha = 1

				arg_694_1.dialog_:SetActive(true)
				SetActive(arg_694_1.leftNameGo_, true)

				local var_697_2 = arg_694_1:FormatText(StoryNameCfg[7].name)

				arg_694_1.leftNameTxt_.text = var_697_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_694_1.leftNameTxt_.transform)

				arg_694_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_694_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_694_1:RecordName(arg_694_1.leftNameTxt_.text)
				SetActive(arg_694_1.iconTrs_.gameObject, false)
				arg_694_1.callingController_:SetSelectedState("normal")

				local var_697_3 = arg_694_1:GetWordFromCfg(1108105167)
				local var_697_4 = arg_694_1:FormatText(var_697_3.content)

				arg_694_1.text_.text = var_697_4

				LuaForUtil.ClearLinePrefixSymbol(arg_694_1.text_)

				local var_697_5 = 23
				local var_697_6 = utf8.len(var_697_4)
				local var_697_7 = var_697_5 <= 0 and var_697_1 or var_697_1 * (var_697_6 / var_697_5)

				if var_697_7 > 0 and var_697_1 < var_697_7 then
					arg_694_1.talkMaxDuration = var_697_7

					if var_697_7 + var_697_0 > arg_694_1.duration_ then
						arg_694_1.duration_ = var_697_7 + var_697_0
					end
				end

				arg_694_1.text_.text = var_697_4
				arg_694_1.typewritter.percent = 0

				arg_694_1.typewritter:SetDirty()
				arg_694_1:ShowNextGo(false)
				arg_694_1:RecordContent(arg_694_1.text_.text)
			end

			local var_697_8 = math.max(var_697_1, arg_694_1.talkMaxDuration)

			if var_697_0 <= arg_694_1.time_ and arg_694_1.time_ < var_697_0 + var_697_8 then
				arg_694_1.typewritter.percent = (arg_694_1.time_ - var_697_0) / var_697_8

				arg_694_1.typewritter:SetDirty()
			end

			if arg_694_1.time_ >= var_697_0 + var_697_8 and arg_694_1.time_ < var_697_0 + var_697_8 + arg_697_0 then
				arg_694_1.typewritter.percent = 1

				arg_694_1.typewritter:SetDirty()
				arg_694_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105168 = function(arg_698_0, arg_698_1)
		arg_698_1.time_ = 0
		arg_698_1.frameCnt_ = 0
		arg_698_1.state_ = "playing"
		arg_698_1.curTalkId_ = 1108105168
		arg_698_1.duration_ = 5

		SetActive(arg_698_1.tipsGo_, false)

		function arg_698_1.onSingleLineFinish_()
			arg_698_1.onSingleLineUpdate_ = nil
			arg_698_1.onSingleLineFinish_ = nil
			arg_698_1.state_ = "waiting"
		end

		function arg_698_1.playNext_(arg_700_0)
			if arg_700_0 == 1 then
				arg_698_0:Play1108105169(arg_698_1)
			end
		end

		function arg_698_1.onSingleLineUpdate_(arg_701_0)
			local var_701_0 = arg_698_1.actors_["1081ui_story"].transform
			local var_701_1 = 0

			if var_701_1 < arg_698_1.time_ and arg_698_1.time_ <= var_701_1 + arg_701_0 then
				arg_698_1.var_.moveOldPos1081ui_story = var_701_0.localPosition
			end

			local var_701_2 = 0.001

			if var_701_1 <= arg_698_1.time_ and arg_698_1.time_ < var_701_1 + var_701_2 then
				local var_701_3 = (arg_698_1.time_ - var_701_1) / var_701_2
				local var_701_4 = Vector3.New(0, -0.92, -5.8)

				var_701_0.localPosition = Vector3.Lerp(arg_698_1.var_.moveOldPos1081ui_story, var_701_4, var_701_3)

				local var_701_5 = manager.ui.mainCamera.transform.position - var_701_0.position

				var_701_0.forward = Vector3.New(var_701_5.x, var_701_5.y, var_701_5.z)

				local var_701_6 = var_701_0.localEulerAngles

				var_701_6.z = 0
				var_701_6.x = 0
				var_701_0.localEulerAngles = var_701_6
			end

			if arg_698_1.time_ >= var_701_1 + var_701_2 and arg_698_1.time_ < var_701_1 + var_701_2 + arg_701_0 then
				var_701_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_701_7 = manager.ui.mainCamera.transform.position - var_701_0.position

				var_701_0.forward = Vector3.New(var_701_7.x, var_701_7.y, var_701_7.z)

				local var_701_8 = var_701_0.localEulerAngles

				var_701_8.z = 0
				var_701_8.x = 0
				var_701_0.localEulerAngles = var_701_8
			end

			local var_701_9 = arg_698_1.actors_["1081ui_story"]
			local var_701_10 = 0

			if var_701_10 < arg_698_1.time_ and arg_698_1.time_ <= var_701_10 + arg_701_0 and arg_698_1.var_.characterEffect1081ui_story == nil then
				arg_698_1.var_.characterEffect1081ui_story = var_701_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_701_11 = 0.200000002980232

			if var_701_10 <= arg_698_1.time_ and arg_698_1.time_ < var_701_10 + var_701_11 then
				local var_701_12 = (arg_698_1.time_ - var_701_10) / var_701_11

				if arg_698_1.var_.characterEffect1081ui_story then
					arg_698_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_698_1.time_ >= var_701_10 + var_701_11 and arg_698_1.time_ < var_701_10 + var_701_11 + arg_701_0 and arg_698_1.var_.characterEffect1081ui_story then
				arg_698_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_701_13 = 0

			if var_701_13 < arg_698_1.time_ and arg_698_1.time_ <= var_701_13 + arg_701_0 then
				arg_698_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_701_14 = 0

			if var_701_14 < arg_698_1.time_ and arg_698_1.time_ <= var_701_14 + arg_701_0 then
				arg_698_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_701_15 = 0
			local var_701_16 = 0.95

			if var_701_15 < arg_698_1.time_ and arg_698_1.time_ <= var_701_15 + arg_701_0 then
				arg_698_1.talkMaxDuration = 0
				arg_698_1.dialogCg_.alpha = 1

				arg_698_1.dialog_:SetActive(true)
				SetActive(arg_698_1.leftNameGo_, true)

				local var_701_17 = arg_698_1:FormatText(StoryNameCfg[202].name)

				arg_698_1.leftNameTxt_.text = var_701_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_698_1.leftNameTxt_.transform)

				arg_698_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_698_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_698_1:RecordName(arg_698_1.leftNameTxt_.text)
				SetActive(arg_698_1.iconTrs_.gameObject, false)
				arg_698_1.callingController_:SetSelectedState("normal")

				local var_701_18 = arg_698_1:GetWordFromCfg(1108105168)
				local var_701_19 = arg_698_1:FormatText(var_701_18.content)

				arg_698_1.text_.text = var_701_19

				LuaForUtil.ClearLinePrefixSymbol(arg_698_1.text_)

				local var_701_20 = 38
				local var_701_21 = utf8.len(var_701_19)
				local var_701_22 = var_701_20 <= 0 and var_701_16 or var_701_16 * (var_701_21 / var_701_20)

				if var_701_22 > 0 and var_701_16 < var_701_22 then
					arg_698_1.talkMaxDuration = var_701_22

					if var_701_22 + var_701_15 > arg_698_1.duration_ then
						arg_698_1.duration_ = var_701_22 + var_701_15
					end
				end

				arg_698_1.text_.text = var_701_19
				arg_698_1.typewritter.percent = 0

				arg_698_1.typewritter:SetDirty()
				arg_698_1:ShowNextGo(false)
				arg_698_1:RecordContent(arg_698_1.text_.text)
			end

			local var_701_23 = math.max(var_701_16, arg_698_1.talkMaxDuration)

			if var_701_15 <= arg_698_1.time_ and arg_698_1.time_ < var_701_15 + var_701_23 then
				arg_698_1.typewritter.percent = (arg_698_1.time_ - var_701_15) / var_701_23

				arg_698_1.typewritter:SetDirty()
			end

			if arg_698_1.time_ >= var_701_15 + var_701_23 and arg_698_1.time_ < var_701_15 + var_701_23 + arg_701_0 then
				arg_698_1.typewritter.percent = 1

				arg_698_1.typewritter:SetDirty()
				arg_698_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105169 = function(arg_702_0, arg_702_1)
		arg_702_1.time_ = 0
		arg_702_1.frameCnt_ = 0
		arg_702_1.state_ = "playing"
		arg_702_1.curTalkId_ = 1108105169
		arg_702_1.duration_ = 5

		SetActive(arg_702_1.tipsGo_, false)

		function arg_702_1.onSingleLineFinish_()
			arg_702_1.onSingleLineUpdate_ = nil
			arg_702_1.onSingleLineFinish_ = nil
			arg_702_1.state_ = "waiting"
		end

		function arg_702_1.playNext_(arg_704_0)
			if arg_704_0 == 1 then
				arg_702_0:Play1108105170(arg_702_1)
			end
		end

		function arg_702_1.onSingleLineUpdate_(arg_705_0)
			local var_705_0 = 0
			local var_705_1 = 0.775

			if var_705_0 < arg_702_1.time_ and arg_702_1.time_ <= var_705_0 + arg_705_0 then
				arg_702_1.talkMaxDuration = 0
				arg_702_1.dialogCg_.alpha = 1

				arg_702_1.dialog_:SetActive(true)
				SetActive(arg_702_1.leftNameGo_, true)

				local var_705_2 = arg_702_1:FormatText(StoryNameCfg[202].name)

				arg_702_1.leftNameTxt_.text = var_705_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_702_1.leftNameTxt_.transform)

				arg_702_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_702_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_702_1:RecordName(arg_702_1.leftNameTxt_.text)
				SetActive(arg_702_1.iconTrs_.gameObject, false)
				arg_702_1.callingController_:SetSelectedState("normal")

				local var_705_3 = arg_702_1:GetWordFromCfg(1108105169)
				local var_705_4 = arg_702_1:FormatText(var_705_3.content)

				arg_702_1.text_.text = var_705_4

				LuaForUtil.ClearLinePrefixSymbol(arg_702_1.text_)

				local var_705_5 = 31
				local var_705_6 = utf8.len(var_705_4)
				local var_705_7 = var_705_5 <= 0 and var_705_1 or var_705_1 * (var_705_6 / var_705_5)

				if var_705_7 > 0 and var_705_1 < var_705_7 then
					arg_702_1.talkMaxDuration = var_705_7

					if var_705_7 + var_705_0 > arg_702_1.duration_ then
						arg_702_1.duration_ = var_705_7 + var_705_0
					end
				end

				arg_702_1.text_.text = var_705_4
				arg_702_1.typewritter.percent = 0

				arg_702_1.typewritter:SetDirty()
				arg_702_1:ShowNextGo(false)
				arg_702_1:RecordContent(arg_702_1.text_.text)
			end

			local var_705_8 = math.max(var_705_1, arg_702_1.talkMaxDuration)

			if var_705_0 <= arg_702_1.time_ and arg_702_1.time_ < var_705_0 + var_705_8 then
				arg_702_1.typewritter.percent = (arg_702_1.time_ - var_705_0) / var_705_8

				arg_702_1.typewritter:SetDirty()
			end

			if arg_702_1.time_ >= var_705_0 + var_705_8 and arg_702_1.time_ < var_705_0 + var_705_8 + arg_705_0 then
				arg_702_1.typewritter.percent = 1

				arg_702_1.typewritter:SetDirty()
				arg_702_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105170 = function(arg_706_0, arg_706_1)
		arg_706_1.time_ = 0
		arg_706_1.frameCnt_ = 0
		arg_706_1.state_ = "playing"
		arg_706_1.curTalkId_ = 1108105170
		arg_706_1.duration_ = 5

		SetActive(arg_706_1.tipsGo_, false)

		function arg_706_1.onSingleLineFinish_()
			arg_706_1.onSingleLineUpdate_ = nil
			arg_706_1.onSingleLineFinish_ = nil
			arg_706_1.state_ = "waiting"
		end

		function arg_706_1.playNext_(arg_708_0)
			if arg_708_0 == 1 then
				arg_706_0:Play1108105171(arg_706_1)
			end
		end

		function arg_706_1.onSingleLineUpdate_(arg_709_0)
			local var_709_0 = arg_706_1.actors_["1081ui_story"].transform
			local var_709_1 = 0

			if var_709_1 < arg_706_1.time_ and arg_706_1.time_ <= var_709_1 + arg_709_0 then
				arg_706_1.var_.moveOldPos1081ui_story = var_709_0.localPosition
			end

			local var_709_2 = 0.001

			if var_709_1 <= arg_706_1.time_ and arg_706_1.time_ < var_709_1 + var_709_2 then
				local var_709_3 = (arg_706_1.time_ - var_709_1) / var_709_2
				local var_709_4 = Vector3.New(0, 100, 0)

				var_709_0.localPosition = Vector3.Lerp(arg_706_1.var_.moveOldPos1081ui_story, var_709_4, var_709_3)

				local var_709_5 = manager.ui.mainCamera.transform.position - var_709_0.position

				var_709_0.forward = Vector3.New(var_709_5.x, var_709_5.y, var_709_5.z)

				local var_709_6 = var_709_0.localEulerAngles

				var_709_6.z = 0
				var_709_6.x = 0
				var_709_0.localEulerAngles = var_709_6
			end

			if arg_706_1.time_ >= var_709_1 + var_709_2 and arg_706_1.time_ < var_709_1 + var_709_2 + arg_709_0 then
				var_709_0.localPosition = Vector3.New(0, 100, 0)

				local var_709_7 = manager.ui.mainCamera.transform.position - var_709_0.position

				var_709_0.forward = Vector3.New(var_709_7.x, var_709_7.y, var_709_7.z)

				local var_709_8 = var_709_0.localEulerAngles

				var_709_8.z = 0
				var_709_8.x = 0
				var_709_0.localEulerAngles = var_709_8
			end

			local var_709_9 = 0
			local var_709_10 = 1.275

			if var_709_9 < arg_706_1.time_ and arg_706_1.time_ <= var_709_9 + arg_709_0 then
				arg_706_1.talkMaxDuration = 0
				arg_706_1.dialogCg_.alpha = 1

				arg_706_1.dialog_:SetActive(true)
				SetActive(arg_706_1.leftNameGo_, false)

				arg_706_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_706_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_706_1:RecordName(arg_706_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_706_1.iconTrs_.gameObject, false)
				arg_706_1.callingController_:SetSelectedState("normal")

				local var_709_11 = arg_706_1:GetWordFromCfg(1108105170)
				local var_709_12 = arg_706_1:FormatText(var_709_11.content)

				arg_706_1.text_.text = var_709_12

				LuaForUtil.ClearLinePrefixSymbol(arg_706_1.text_)

				local var_709_13 = 51
				local var_709_14 = utf8.len(var_709_12)
				local var_709_15 = var_709_13 <= 0 and var_709_10 or var_709_10 * (var_709_14 / var_709_13)

				if var_709_15 > 0 and var_709_10 < var_709_15 then
					arg_706_1.talkMaxDuration = var_709_15

					if var_709_15 + var_709_9 > arg_706_1.duration_ then
						arg_706_1.duration_ = var_709_15 + var_709_9
					end
				end

				arg_706_1.text_.text = var_709_12
				arg_706_1.typewritter.percent = 0

				arg_706_1.typewritter:SetDirty()
				arg_706_1:ShowNextGo(false)
				arg_706_1:RecordContent(arg_706_1.text_.text)
			end

			local var_709_16 = math.max(var_709_10, arg_706_1.talkMaxDuration)

			if var_709_9 <= arg_706_1.time_ and arg_706_1.time_ < var_709_9 + var_709_16 then
				arg_706_1.typewritter.percent = (arg_706_1.time_ - var_709_9) / var_709_16

				arg_706_1.typewritter:SetDirty()
			end

			if arg_706_1.time_ >= var_709_9 + var_709_16 and arg_706_1.time_ < var_709_9 + var_709_16 + arg_709_0 then
				arg_706_1.typewritter.percent = 1

				arg_706_1.typewritter:SetDirty()
				arg_706_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105171 = function(arg_710_0, arg_710_1)
		arg_710_1.time_ = 0
		arg_710_1.frameCnt_ = 0
		arg_710_1.state_ = "playing"
		arg_710_1.curTalkId_ = 1108105171
		arg_710_1.duration_ = 5

		SetActive(arg_710_1.tipsGo_, false)

		function arg_710_1.onSingleLineFinish_()
			arg_710_1.onSingleLineUpdate_ = nil
			arg_710_1.onSingleLineFinish_ = nil
			arg_710_1.state_ = "waiting"
		end

		function arg_710_1.playNext_(arg_712_0)
			if arg_712_0 == 1 then
				arg_710_0:Play1108105172(arg_710_1)
			end
		end

		function arg_710_1.onSingleLineUpdate_(arg_713_0)
			local var_713_0 = 0
			local var_713_1 = 0.45

			if var_713_0 < arg_710_1.time_ and arg_710_1.time_ <= var_713_0 + arg_713_0 then
				arg_710_1.talkMaxDuration = 0
				arg_710_1.dialogCg_.alpha = 1

				arg_710_1.dialog_:SetActive(true)
				SetActive(arg_710_1.leftNameGo_, true)

				local var_713_2 = arg_710_1:FormatText(StoryNameCfg[7].name)

				arg_710_1.leftNameTxt_.text = var_713_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_710_1.leftNameTxt_.transform)

				arg_710_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_710_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_710_1:RecordName(arg_710_1.leftNameTxt_.text)
				SetActive(arg_710_1.iconTrs_.gameObject, false)
				arg_710_1.callingController_:SetSelectedState("normal")

				local var_713_3 = arg_710_1:GetWordFromCfg(1108105171)
				local var_713_4 = arg_710_1:FormatText(var_713_3.content)

				arg_710_1.text_.text = var_713_4

				LuaForUtil.ClearLinePrefixSymbol(arg_710_1.text_)

				local var_713_5 = 18
				local var_713_6 = utf8.len(var_713_4)
				local var_713_7 = var_713_5 <= 0 and var_713_1 or var_713_1 * (var_713_6 / var_713_5)

				if var_713_7 > 0 and var_713_1 < var_713_7 then
					arg_710_1.talkMaxDuration = var_713_7

					if var_713_7 + var_713_0 > arg_710_1.duration_ then
						arg_710_1.duration_ = var_713_7 + var_713_0
					end
				end

				arg_710_1.text_.text = var_713_4
				arg_710_1.typewritter.percent = 0

				arg_710_1.typewritter:SetDirty()
				arg_710_1:ShowNextGo(false)
				arg_710_1:RecordContent(arg_710_1.text_.text)
			end

			local var_713_8 = math.max(var_713_1, arg_710_1.talkMaxDuration)

			if var_713_0 <= arg_710_1.time_ and arg_710_1.time_ < var_713_0 + var_713_8 then
				arg_710_1.typewritter.percent = (arg_710_1.time_ - var_713_0) / var_713_8

				arg_710_1.typewritter:SetDirty()
			end

			if arg_710_1.time_ >= var_713_0 + var_713_8 and arg_710_1.time_ < var_713_0 + var_713_8 + arg_713_0 then
				arg_710_1.typewritter.percent = 1

				arg_710_1.typewritter:SetDirty()
				arg_710_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105172 = function(arg_714_0, arg_714_1)
		arg_714_1.time_ = 0
		arg_714_1.frameCnt_ = 0
		arg_714_1.state_ = "playing"
		arg_714_1.curTalkId_ = 1108105172
		arg_714_1.duration_ = 5

		SetActive(arg_714_1.tipsGo_, false)

		function arg_714_1.onSingleLineFinish_()
			arg_714_1.onSingleLineUpdate_ = nil
			arg_714_1.onSingleLineFinish_ = nil
			arg_714_1.state_ = "waiting"
		end

		function arg_714_1.playNext_(arg_716_0)
			if arg_716_0 == 1 then
				arg_714_0:Play1108105173(arg_714_1)
			end
		end

		function arg_714_1.onSingleLineUpdate_(arg_717_0)
			local var_717_0 = arg_714_1.actors_["1081ui_story"].transform
			local var_717_1 = 0

			if var_717_1 < arg_714_1.time_ and arg_714_1.time_ <= var_717_1 + arg_717_0 then
				arg_714_1.var_.moveOldPos1081ui_story = var_717_0.localPosition
			end

			local var_717_2 = 0.001

			if var_717_1 <= arg_714_1.time_ and arg_714_1.time_ < var_717_1 + var_717_2 then
				local var_717_3 = (arg_714_1.time_ - var_717_1) / var_717_2
				local var_717_4 = Vector3.New(0, -0.92, -5.8)

				var_717_0.localPosition = Vector3.Lerp(arg_714_1.var_.moveOldPos1081ui_story, var_717_4, var_717_3)

				local var_717_5 = manager.ui.mainCamera.transform.position - var_717_0.position

				var_717_0.forward = Vector3.New(var_717_5.x, var_717_5.y, var_717_5.z)

				local var_717_6 = var_717_0.localEulerAngles

				var_717_6.z = 0
				var_717_6.x = 0
				var_717_0.localEulerAngles = var_717_6
			end

			if arg_714_1.time_ >= var_717_1 + var_717_2 and arg_714_1.time_ < var_717_1 + var_717_2 + arg_717_0 then
				var_717_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_717_7 = manager.ui.mainCamera.transform.position - var_717_0.position

				var_717_0.forward = Vector3.New(var_717_7.x, var_717_7.y, var_717_7.z)

				local var_717_8 = var_717_0.localEulerAngles

				var_717_8.z = 0
				var_717_8.x = 0
				var_717_0.localEulerAngles = var_717_8
			end

			local var_717_9 = arg_714_1.actors_["1081ui_story"]
			local var_717_10 = 0

			if var_717_10 < arg_714_1.time_ and arg_714_1.time_ <= var_717_10 + arg_717_0 and arg_714_1.var_.characterEffect1081ui_story == nil then
				arg_714_1.var_.characterEffect1081ui_story = var_717_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_717_11 = 0.200000002980232

			if var_717_10 <= arg_714_1.time_ and arg_714_1.time_ < var_717_10 + var_717_11 then
				local var_717_12 = (arg_714_1.time_ - var_717_10) / var_717_11

				if arg_714_1.var_.characterEffect1081ui_story then
					arg_714_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_714_1.time_ >= var_717_10 + var_717_11 and arg_714_1.time_ < var_717_10 + var_717_11 + arg_717_0 and arg_714_1.var_.characterEffect1081ui_story then
				arg_714_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_717_13 = 0

			if var_717_13 < arg_714_1.time_ and arg_714_1.time_ <= var_717_13 + arg_717_0 then
				arg_714_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_717_14 = 0
			local var_717_15 = 0.4

			if var_717_14 < arg_714_1.time_ and arg_714_1.time_ <= var_717_14 + arg_717_0 then
				arg_714_1.talkMaxDuration = 0
				arg_714_1.dialogCg_.alpha = 1

				arg_714_1.dialog_:SetActive(true)
				SetActive(arg_714_1.leftNameGo_, true)

				local var_717_16 = arg_714_1:FormatText(StoryNameCfg[202].name)

				arg_714_1.leftNameTxt_.text = var_717_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_714_1.leftNameTxt_.transform)

				arg_714_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_714_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_714_1:RecordName(arg_714_1.leftNameTxt_.text)
				SetActive(arg_714_1.iconTrs_.gameObject, false)
				arg_714_1.callingController_:SetSelectedState("normal")

				local var_717_17 = arg_714_1:GetWordFromCfg(1108105172)
				local var_717_18 = arg_714_1:FormatText(var_717_17.content)

				arg_714_1.text_.text = var_717_18

				LuaForUtil.ClearLinePrefixSymbol(arg_714_1.text_)

				local var_717_19 = 16
				local var_717_20 = utf8.len(var_717_18)
				local var_717_21 = var_717_19 <= 0 and var_717_15 or var_717_15 * (var_717_20 / var_717_19)

				if var_717_21 > 0 and var_717_15 < var_717_21 then
					arg_714_1.talkMaxDuration = var_717_21

					if var_717_21 + var_717_14 > arg_714_1.duration_ then
						arg_714_1.duration_ = var_717_21 + var_717_14
					end
				end

				arg_714_1.text_.text = var_717_18
				arg_714_1.typewritter.percent = 0

				arg_714_1.typewritter:SetDirty()
				arg_714_1:ShowNextGo(false)
				arg_714_1:RecordContent(arg_714_1.text_.text)
			end

			local var_717_22 = math.max(var_717_15, arg_714_1.talkMaxDuration)

			if var_717_14 <= arg_714_1.time_ and arg_714_1.time_ < var_717_14 + var_717_22 then
				arg_714_1.typewritter.percent = (arg_714_1.time_ - var_717_14) / var_717_22

				arg_714_1.typewritter:SetDirty()
			end

			if arg_714_1.time_ >= var_717_14 + var_717_22 and arg_714_1.time_ < var_717_14 + var_717_22 + arg_717_0 then
				arg_714_1.typewritter.percent = 1

				arg_714_1.typewritter:SetDirty()
				arg_714_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105173 = function(arg_718_0, arg_718_1)
		arg_718_1.time_ = 0
		arg_718_1.frameCnt_ = 0
		arg_718_1.state_ = "playing"
		arg_718_1.curTalkId_ = 1108105173
		arg_718_1.duration_ = 5

		SetActive(arg_718_1.tipsGo_, false)

		function arg_718_1.onSingleLineFinish_()
			arg_718_1.onSingleLineUpdate_ = nil
			arg_718_1.onSingleLineFinish_ = nil
			arg_718_1.state_ = "waiting"
		end

		function arg_718_1.playNext_(arg_720_0)
			if arg_720_0 == 1 then
				arg_718_0:Play1108105174(arg_718_1)
			end
		end

		function arg_718_1.onSingleLineUpdate_(arg_721_0)
			local var_721_0 = arg_718_1.actors_["1081ui_story"]
			local var_721_1 = 0

			if var_721_1 < arg_718_1.time_ and arg_718_1.time_ <= var_721_1 + arg_721_0 and arg_718_1.var_.characterEffect1081ui_story == nil then
				arg_718_1.var_.characterEffect1081ui_story = var_721_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_721_2 = 0.0666666666666667

			if var_721_1 <= arg_718_1.time_ and arg_718_1.time_ < var_721_1 + var_721_2 then
				local var_721_3 = (arg_718_1.time_ - var_721_1) / var_721_2

				if arg_718_1.var_.characterEffect1081ui_story then
					local var_721_4 = Mathf.Lerp(0, 0.5, var_721_3)

					arg_718_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_718_1.var_.characterEffect1081ui_story.fillRatio = var_721_4
				end
			end

			if arg_718_1.time_ >= var_721_1 + var_721_2 and arg_718_1.time_ < var_721_1 + var_721_2 + arg_721_0 and arg_718_1.var_.characterEffect1081ui_story then
				local var_721_5 = 0.5

				arg_718_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_718_1.var_.characterEffect1081ui_story.fillRatio = var_721_5
			end

			local var_721_6 = 0
			local var_721_7 = 0.275

			if var_721_6 < arg_718_1.time_ and arg_718_1.time_ <= var_721_6 + arg_721_0 then
				arg_718_1.talkMaxDuration = 0
				arg_718_1.dialogCg_.alpha = 1

				arg_718_1.dialog_:SetActive(true)
				SetActive(arg_718_1.leftNameGo_, true)

				local var_721_8 = arg_718_1:FormatText(StoryNameCfg[7].name)

				arg_718_1.leftNameTxt_.text = var_721_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_718_1.leftNameTxt_.transform)

				arg_718_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_718_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_718_1:RecordName(arg_718_1.leftNameTxt_.text)
				SetActive(arg_718_1.iconTrs_.gameObject, false)
				arg_718_1.callingController_:SetSelectedState("normal")

				local var_721_9 = arg_718_1:GetWordFromCfg(1108105173)
				local var_721_10 = arg_718_1:FormatText(var_721_9.content)

				arg_718_1.text_.text = var_721_10

				LuaForUtil.ClearLinePrefixSymbol(arg_718_1.text_)

				local var_721_11 = 11
				local var_721_12 = utf8.len(var_721_10)
				local var_721_13 = var_721_11 <= 0 and var_721_7 or var_721_7 * (var_721_12 / var_721_11)

				if var_721_13 > 0 and var_721_7 < var_721_13 then
					arg_718_1.talkMaxDuration = var_721_13

					if var_721_13 + var_721_6 > arg_718_1.duration_ then
						arg_718_1.duration_ = var_721_13 + var_721_6
					end
				end

				arg_718_1.text_.text = var_721_10
				arg_718_1.typewritter.percent = 0

				arg_718_1.typewritter:SetDirty()
				arg_718_1:ShowNextGo(false)
				arg_718_1:RecordContent(arg_718_1.text_.text)
			end

			local var_721_14 = math.max(var_721_7, arg_718_1.talkMaxDuration)

			if var_721_6 <= arg_718_1.time_ and arg_718_1.time_ < var_721_6 + var_721_14 then
				arg_718_1.typewritter.percent = (arg_718_1.time_ - var_721_6) / var_721_14

				arg_718_1.typewritter:SetDirty()
			end

			if arg_718_1.time_ >= var_721_6 + var_721_14 and arg_718_1.time_ < var_721_6 + var_721_14 + arg_721_0 then
				arg_718_1.typewritter.percent = 1

				arg_718_1.typewritter:SetDirty()
				arg_718_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105174 = function(arg_722_0, arg_722_1)
		arg_722_1.time_ = 0
		arg_722_1.frameCnt_ = 0
		arg_722_1.state_ = "playing"
		arg_722_1.curTalkId_ = 1108105174
		arg_722_1.duration_ = 6.23

		SetActive(arg_722_1.tipsGo_, false)

		function arg_722_1.onSingleLineFinish_()
			arg_722_1.onSingleLineUpdate_ = nil
			arg_722_1.onSingleLineFinish_ = nil
			arg_722_1.state_ = "waiting"
		end

		function arg_722_1.playNext_(arg_724_0)
			if arg_724_0 == 1 then
				arg_722_0:Play1108105175(arg_722_1)
			end
		end

		function arg_722_1.onSingleLineUpdate_(arg_725_0)
			local var_725_0 = arg_722_1.actors_["1081ui_story"].transform
			local var_725_1 = 0

			if var_725_1 < arg_722_1.time_ and arg_722_1.time_ <= var_725_1 + arg_725_0 then
				arg_722_1.var_.moveOldPos1081ui_story = var_725_0.localPosition
			end

			local var_725_2 = 0.001

			if var_725_1 <= arg_722_1.time_ and arg_722_1.time_ < var_725_1 + var_725_2 then
				local var_725_3 = (arg_722_1.time_ - var_725_1) / var_725_2
				local var_725_4 = Vector3.New(0, 100, 0)

				var_725_0.localPosition = Vector3.Lerp(arg_722_1.var_.moveOldPos1081ui_story, var_725_4, var_725_3)

				local var_725_5 = manager.ui.mainCamera.transform.position - var_725_0.position

				var_725_0.forward = Vector3.New(var_725_5.x, var_725_5.y, var_725_5.z)

				local var_725_6 = var_725_0.localEulerAngles

				var_725_6.z = 0
				var_725_6.x = 0
				var_725_0.localEulerAngles = var_725_6
			end

			if arg_722_1.time_ >= var_725_1 + var_725_2 and arg_722_1.time_ < var_725_1 + var_725_2 + arg_725_0 then
				var_725_0.localPosition = Vector3.New(0, 100, 0)

				local var_725_7 = manager.ui.mainCamera.transform.position - var_725_0.position

				var_725_0.forward = Vector3.New(var_725_7.x, var_725_7.y, var_725_7.z)

				local var_725_8 = var_725_0.localEulerAngles

				var_725_8.z = 0
				var_725_8.x = 0
				var_725_0.localEulerAngles = var_725_8
			end

			local var_725_9 = manager.ui.mainCamera.transform
			local var_725_10 = 0.275

			if var_725_10 < arg_722_1.time_ and arg_722_1.time_ <= var_725_10 + arg_725_0 then
				arg_722_1.var_.shakeOldPos = var_725_9.localPosition
			end

			local var_725_11 = 0.8

			if var_725_10 <= arg_722_1.time_ and arg_722_1.time_ < var_725_10 + var_725_11 then
				local var_725_12 = (arg_722_1.time_ - var_725_10) / 0.066
				local var_725_13, var_725_14 = math.modf(var_725_12)

				var_725_9.localPosition = Vector3.New(var_725_14 * 0.13, var_725_14 * 0.13, var_725_14 * 0.13) + arg_722_1.var_.shakeOldPos
			end

			if arg_722_1.time_ >= var_725_10 + var_725_11 and arg_722_1.time_ < var_725_10 + var_725_11 + arg_725_0 then
				var_725_9.localPosition = arg_722_1.var_.shakeOldPos
			end

			local var_725_15 = 0

			if var_725_15 < arg_722_1.time_ and arg_722_1.time_ <= var_725_15 + arg_725_0 then
				arg_722_1.mask_.enabled = true
				arg_722_1.mask_.raycastTarget = true

				arg_722_1:SetGaussion(false)
			end

			local var_725_16 = 0.275

			if var_725_15 <= arg_722_1.time_ and arg_722_1.time_ < var_725_15 + var_725_16 then
				local var_725_17 = (arg_722_1.time_ - var_725_15) / var_725_16
				local var_725_18 = Color.New(1, 1, 1)

				var_725_18.a = Mathf.Lerp(1, 0, var_725_17)
				arg_722_1.mask_.color = var_725_18
			end

			if arg_722_1.time_ >= var_725_15 + var_725_16 and arg_722_1.time_ < var_725_15 + var_725_16 + arg_725_0 then
				local var_725_19 = Color.New(1, 1, 1)
				local var_725_20 = 0

				arg_722_1.mask_.enabled = false
				var_725_19.a = var_725_20
				arg_722_1.mask_.color = var_725_19
			end

			if arg_722_1.frameCnt_ <= 1 then
				arg_722_1.dialog_:SetActive(false)
			end

			local var_725_21 = 1.23333333333333
			local var_725_22 = 0.075

			if var_725_21 < arg_722_1.time_ and arg_722_1.time_ <= var_725_21 + arg_725_0 then
				arg_722_1.talkMaxDuration = 0

				arg_722_1.dialog_:SetActive(true)

				local var_725_23 = LeanTween.value(arg_722_1.dialog_, 0, 1, 0.3)

				var_725_23:setOnUpdate(LuaHelper.FloatAction(function(arg_726_0)
					arg_722_1.dialogCg_.alpha = arg_726_0
				end))
				var_725_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_722_1.dialog_)
					var_725_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_722_1.duration_ = arg_722_1.duration_ + 0.3

				SetActive(arg_722_1.leftNameGo_, true)

				local var_725_24 = arg_722_1:FormatText(StoryNameCfg[202].name)

				arg_722_1.leftNameTxt_.text = var_725_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_722_1.leftNameTxt_.transform)

				arg_722_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_722_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_722_1:RecordName(arg_722_1.leftNameTxt_.text)
				SetActive(arg_722_1.iconTrs_.gameObject, true)
				arg_722_1.iconController_:SetSelectedState("hero")

				arg_722_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_722_1.callingController_:SetSelectedState("normal")

				arg_722_1.keyicon_.color = Color.New(1, 1, 1)
				arg_722_1.icon_.color = Color.New(1, 1, 1)

				local var_725_25 = arg_722_1:GetWordFromCfg(1108105174)
				local var_725_26 = arg_722_1:FormatText(var_725_25.content)

				arg_722_1.text_.text = var_725_26

				LuaForUtil.ClearLinePrefixSymbol(arg_722_1.text_)

				local var_725_27 = 3
				local var_725_28 = utf8.len(var_725_26)
				local var_725_29 = var_725_27 <= 0 and var_725_22 or var_725_22 * (var_725_28 / var_725_27)

				if var_725_29 > 0 and var_725_22 < var_725_29 then
					arg_722_1.talkMaxDuration = var_725_29
					var_725_21 = var_725_21 + 0.3

					if var_725_29 + var_725_21 > arg_722_1.duration_ then
						arg_722_1.duration_ = var_725_29 + var_725_21
					end
				end

				arg_722_1.text_.text = var_725_26
				arg_722_1.typewritter.percent = 0

				arg_722_1.typewritter:SetDirty()
				arg_722_1:ShowNextGo(false)
				arg_722_1:RecordContent(arg_722_1.text_.text)
			end

			local var_725_30 = var_725_21 + 0.3
			local var_725_31 = math.max(var_725_22, arg_722_1.talkMaxDuration)

			if var_725_30 <= arg_722_1.time_ and arg_722_1.time_ < var_725_30 + var_725_31 then
				arg_722_1.typewritter.percent = (arg_722_1.time_ - var_725_30) / var_725_31

				arg_722_1.typewritter:SetDirty()
			end

			if arg_722_1.time_ >= var_725_30 + var_725_31 and arg_722_1.time_ < var_725_30 + var_725_31 + arg_725_0 then
				arg_722_1.typewritter.percent = 1

				arg_722_1.typewritter:SetDirty()
				arg_722_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105175 = function(arg_728_0, arg_728_1)
		arg_728_1.time_ = 0
		arg_728_1.frameCnt_ = 0
		arg_728_1.state_ = "playing"
		arg_728_1.curTalkId_ = 1108105175
		arg_728_1.duration_ = 7.93

		SetActive(arg_728_1.tipsGo_, false)

		function arg_728_1.onSingleLineFinish_()
			arg_728_1.onSingleLineUpdate_ = nil
			arg_728_1.onSingleLineFinish_ = nil
			arg_728_1.state_ = "waiting"
		end

		function arg_728_1.playNext_(arg_730_0)
			if arg_730_0 == 1 then
				arg_728_0:Play1108105176(arg_728_1)
			end
		end

		function arg_728_1.onSingleLineUpdate_(arg_731_0)
			local var_731_0 = "STwhite"

			if arg_728_1.bgs_[var_731_0] == nil then
				local var_731_1 = Object.Instantiate(arg_728_1.paintGo_)

				var_731_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_731_0)
				var_731_1.name = var_731_0
				var_731_1.transform.parent = arg_728_1.stage_.transform
				var_731_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_728_1.bgs_[var_731_0] = var_731_1
			end

			local var_731_2 = 1.00066666851441

			if var_731_2 < arg_728_1.time_ and arg_728_1.time_ <= var_731_2 + arg_731_0 then
				local var_731_3 = manager.ui.mainCamera.transform.localPosition
				local var_731_4 = Vector3.New(0, 0, 10) + Vector3.New(var_731_3.x, var_731_3.y, 0)
				local var_731_5 = arg_728_1.bgs_.STwhite

				var_731_5.transform.localPosition = var_731_4
				var_731_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_731_6 = var_731_5:GetComponent("SpriteRenderer")

				if var_731_6 and var_731_6.sprite then
					local var_731_7 = (var_731_5.transform.localPosition - var_731_3).z
					local var_731_8 = manager.ui.mainCameraCom_
					local var_731_9 = 2 * var_731_7 * Mathf.Tan(var_731_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_731_10 = var_731_9 * var_731_8.aspect
					local var_731_11 = var_731_6.sprite.bounds.size.x
					local var_731_12 = var_731_6.sprite.bounds.size.y
					local var_731_13 = var_731_10 / var_731_11
					local var_731_14 = var_731_9 / var_731_12
					local var_731_15 = var_731_14 < var_731_13 and var_731_13 or var_731_14

					var_731_5.transform.localScale = Vector3.New(var_731_15, var_731_15, 0)
				end

				for iter_731_0, iter_731_1 in pairs(arg_728_1.bgs_) do
					if iter_731_0 ~= "STwhite" then
						iter_731_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_731_16 = 0

			if var_731_16 < arg_728_1.time_ and arg_728_1.time_ <= var_731_16 + arg_731_0 then
				arg_728_1.mask_.enabled = true
				arg_728_1.mask_.raycastTarget = true

				arg_728_1:SetGaussion(false)
			end

			local var_731_17 = 1

			if var_731_16 <= arg_728_1.time_ and arg_728_1.time_ < var_731_16 + var_731_17 then
				local var_731_18 = (arg_728_1.time_ - var_731_16) / var_731_17
				local var_731_19 = Color.New(1, 1, 1)

				var_731_19.a = Mathf.Lerp(0, 1, var_731_18)
				arg_728_1.mask_.color = var_731_19
			end

			if arg_728_1.time_ >= var_731_16 + var_731_17 and arg_728_1.time_ < var_731_16 + var_731_17 + arg_731_0 then
				local var_731_20 = Color.New(1, 1, 1)

				var_731_20.a = 1
				arg_728_1.mask_.color = var_731_20
			end

			local var_731_21 = 1.00066666851441

			if var_731_21 < arg_728_1.time_ and arg_728_1.time_ <= var_731_21 + arg_731_0 then
				arg_728_1.mask_.enabled = true
				arg_728_1.mask_.raycastTarget = true

				arg_728_1:SetGaussion(false)
			end

			local var_731_22 = 1.93266666481892

			if var_731_21 <= arg_728_1.time_ and arg_728_1.time_ < var_731_21 + var_731_22 then
				local var_731_23 = (arg_728_1.time_ - var_731_21) / var_731_22
				local var_731_24 = Color.New(1, 1, 1)

				var_731_24.a = Mathf.Lerp(1, 0, var_731_23)
				arg_728_1.mask_.color = var_731_24
			end

			if arg_728_1.time_ >= var_731_21 + var_731_22 and arg_728_1.time_ < var_731_21 + var_731_22 + arg_731_0 then
				local var_731_25 = Color.New(1, 1, 1)
				local var_731_26 = 0

				arg_728_1.mask_.enabled = false
				var_731_25.a = var_731_26
				arg_728_1.mask_.color = var_731_25
			end

			local var_731_27 = 0

			if var_731_27 < arg_728_1.time_ and arg_728_1.time_ <= var_731_27 + arg_731_0 then
				arg_728_1.allBtn_.enabled = false
			end

			local var_731_28 = 0.3

			if arg_728_1.time_ >= var_731_27 + var_731_28 and arg_728_1.time_ < var_731_27 + var_731_28 + arg_731_0 then
				arg_728_1.allBtn_.enabled = true
			end

			if arg_728_1.frameCnt_ <= 1 then
				arg_728_1.dialog_:SetActive(false)
			end

			local var_731_29 = 2.93333333333333
			local var_731_30 = 1.35

			if var_731_29 < arg_728_1.time_ and arg_728_1.time_ <= var_731_29 + arg_731_0 then
				arg_728_1.talkMaxDuration = 0

				arg_728_1.dialog_:SetActive(true)

				local var_731_31 = LeanTween.value(arg_728_1.dialog_, 0, 1, 0.3)

				var_731_31:setOnUpdate(LuaHelper.FloatAction(function(arg_732_0)
					arg_728_1.dialogCg_.alpha = arg_732_0
				end))
				var_731_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_728_1.dialog_)
					var_731_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_728_1.duration_ = arg_728_1.duration_ + 0.3

				SetActive(arg_728_1.leftNameGo_, false)

				arg_728_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_728_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_728_1:RecordName(arg_728_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_728_1.iconTrs_.gameObject, false)
				arg_728_1.callingController_:SetSelectedState("normal")

				local var_731_32 = arg_728_1:GetWordFromCfg(1108105175)
				local var_731_33 = arg_728_1:FormatText(var_731_32.content)

				arg_728_1.text_.text = var_731_33

				LuaForUtil.ClearLinePrefixSymbol(arg_728_1.text_)

				local var_731_34 = 54
				local var_731_35 = utf8.len(var_731_33)
				local var_731_36 = var_731_34 <= 0 and var_731_30 or var_731_30 * (var_731_35 / var_731_34)

				if var_731_36 > 0 and var_731_30 < var_731_36 then
					arg_728_1.talkMaxDuration = var_731_36
					var_731_29 = var_731_29 + 0.3

					if var_731_36 + var_731_29 > arg_728_1.duration_ then
						arg_728_1.duration_ = var_731_36 + var_731_29
					end
				end

				arg_728_1.text_.text = var_731_33
				arg_728_1.typewritter.percent = 0

				arg_728_1.typewritter:SetDirty()
				arg_728_1:ShowNextGo(false)
				arg_728_1:RecordContent(arg_728_1.text_.text)
			end

			local var_731_37 = var_731_29 + 0.3
			local var_731_38 = math.max(var_731_30, arg_728_1.talkMaxDuration)

			if var_731_37 <= arg_728_1.time_ and arg_728_1.time_ < var_731_37 + var_731_38 then
				arg_728_1.typewritter.percent = (arg_728_1.time_ - var_731_37) / var_731_38

				arg_728_1.typewritter:SetDirty()
			end

			if arg_728_1.time_ >= var_731_37 + var_731_38 and arg_728_1.time_ < var_731_37 + var_731_38 + arg_731_0 then
				arg_728_1.typewritter.percent = 1

				arg_728_1.typewritter:SetDirty()
				arg_728_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105176 = function(arg_734_0, arg_734_1)
		arg_734_1.time_ = 0
		arg_734_1.frameCnt_ = 0
		arg_734_1.state_ = "playing"
		arg_734_1.curTalkId_ = 1108105176
		arg_734_1.duration_ = 5

		SetActive(arg_734_1.tipsGo_, false)

		function arg_734_1.onSingleLineFinish_()
			arg_734_1.onSingleLineUpdate_ = nil
			arg_734_1.onSingleLineFinish_ = nil
			arg_734_1.state_ = "waiting"
		end

		function arg_734_1.playNext_(arg_736_0)
			if arg_736_0 == 1 then
				arg_734_0:Play1108105177(arg_734_1)
			end
		end

		function arg_734_1.onSingleLineUpdate_(arg_737_0)
			local var_737_0 = 0
			local var_737_1 = 0.95

			if var_737_0 < arg_734_1.time_ and arg_734_1.time_ <= var_737_0 + arg_737_0 then
				arg_734_1.talkMaxDuration = 0
				arg_734_1.dialogCg_.alpha = 1

				arg_734_1.dialog_:SetActive(true)
				SetActive(arg_734_1.leftNameGo_, false)

				arg_734_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_734_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_734_1:RecordName(arg_734_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_734_1.iconTrs_.gameObject, false)
				arg_734_1.callingController_:SetSelectedState("normal")

				local var_737_2 = arg_734_1:GetWordFromCfg(1108105176)
				local var_737_3 = arg_734_1:FormatText(var_737_2.content)

				arg_734_1.text_.text = var_737_3

				LuaForUtil.ClearLinePrefixSymbol(arg_734_1.text_)

				local var_737_4 = 38
				local var_737_5 = utf8.len(var_737_3)
				local var_737_6 = var_737_4 <= 0 and var_737_1 or var_737_1 * (var_737_5 / var_737_4)

				if var_737_6 > 0 and var_737_1 < var_737_6 then
					arg_734_1.talkMaxDuration = var_737_6

					if var_737_6 + var_737_0 > arg_734_1.duration_ then
						arg_734_1.duration_ = var_737_6 + var_737_0
					end
				end

				arg_734_1.text_.text = var_737_3
				arg_734_1.typewritter.percent = 0

				arg_734_1.typewritter:SetDirty()
				arg_734_1:ShowNextGo(false)
				arg_734_1:RecordContent(arg_734_1.text_.text)
			end

			local var_737_7 = math.max(var_737_1, arg_734_1.talkMaxDuration)

			if var_737_0 <= arg_734_1.time_ and arg_734_1.time_ < var_737_0 + var_737_7 then
				arg_734_1.typewritter.percent = (arg_734_1.time_ - var_737_0) / var_737_7

				arg_734_1.typewritter:SetDirty()
			end

			if arg_734_1.time_ >= var_737_0 + var_737_7 and arg_734_1.time_ < var_737_0 + var_737_7 + arg_737_0 then
				arg_734_1.typewritter.percent = 1

				arg_734_1.typewritter:SetDirty()
				arg_734_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105177 = function(arg_738_0, arg_738_1)
		arg_738_1.time_ = 0
		arg_738_1.frameCnt_ = 0
		arg_738_1.state_ = "playing"
		arg_738_1.curTalkId_ = 1108105177
		arg_738_1.duration_ = 5

		SetActive(arg_738_1.tipsGo_, false)

		function arg_738_1.onSingleLineFinish_()
			arg_738_1.onSingleLineUpdate_ = nil
			arg_738_1.onSingleLineFinish_ = nil
			arg_738_1.state_ = "waiting"
		end

		function arg_738_1.playNext_(arg_740_0)
			if arg_740_0 == 1 then
				arg_738_0:Play1108105178(arg_738_1)
			end
		end

		function arg_738_1.onSingleLineUpdate_(arg_741_0)
			local var_741_0 = 0
			local var_741_1 = 0.1

			if var_741_0 < arg_738_1.time_ and arg_738_1.time_ <= var_741_0 + arg_741_0 then
				arg_738_1.talkMaxDuration = 0
				arg_738_1.dialogCg_.alpha = 1

				arg_738_1.dialog_:SetActive(true)
				SetActive(arg_738_1.leftNameGo_, true)

				local var_741_2 = arg_738_1:FormatText(StoryNameCfg[202].name)

				arg_738_1.leftNameTxt_.text = var_741_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_738_1.leftNameTxt_.transform)

				arg_738_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_738_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_738_1:RecordName(arg_738_1.leftNameTxt_.text)
				SetActive(arg_738_1.iconTrs_.gameObject, true)
				arg_738_1.iconController_:SetSelectedState("hero")

				arg_738_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_738_1.callingController_:SetSelectedState("normal")

				arg_738_1.keyicon_.color = Color.New(1, 1, 1)
				arg_738_1.icon_.color = Color.New(1, 1, 1)

				local var_741_3 = arg_738_1:GetWordFromCfg(1108105177)
				local var_741_4 = arg_738_1:FormatText(var_741_3.content)

				arg_738_1.text_.text = var_741_4

				LuaForUtil.ClearLinePrefixSymbol(arg_738_1.text_)

				local var_741_5 = 4
				local var_741_6 = utf8.len(var_741_4)
				local var_741_7 = var_741_5 <= 0 and var_741_1 or var_741_1 * (var_741_6 / var_741_5)

				if var_741_7 > 0 and var_741_1 < var_741_7 then
					arg_738_1.talkMaxDuration = var_741_7

					if var_741_7 + var_741_0 > arg_738_1.duration_ then
						arg_738_1.duration_ = var_741_7 + var_741_0
					end
				end

				arg_738_1.text_.text = var_741_4
				arg_738_1.typewritter.percent = 0

				arg_738_1.typewritter:SetDirty()
				arg_738_1:ShowNextGo(false)
				arg_738_1:RecordContent(arg_738_1.text_.text)
			end

			local var_741_8 = math.max(var_741_1, arg_738_1.talkMaxDuration)

			if var_741_0 <= arg_738_1.time_ and arg_738_1.time_ < var_741_0 + var_741_8 then
				arg_738_1.typewritter.percent = (arg_738_1.time_ - var_741_0) / var_741_8

				arg_738_1.typewritter:SetDirty()
			end

			if arg_738_1.time_ >= var_741_0 + var_741_8 and arg_738_1.time_ < var_741_0 + var_741_8 + arg_741_0 then
				arg_738_1.typewritter.percent = 1

				arg_738_1.typewritter:SetDirty()
				arg_738_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105178 = function(arg_742_0, arg_742_1)
		arg_742_1.time_ = 0
		arg_742_1.frameCnt_ = 0
		arg_742_1.state_ = "playing"
		arg_742_1.curTalkId_ = 1108105178
		arg_742_1.duration_ = 7.79

		SetActive(arg_742_1.tipsGo_, false)

		function arg_742_1.onSingleLineFinish_()
			arg_742_1.onSingleLineUpdate_ = nil
			arg_742_1.onSingleLineFinish_ = nil
			arg_742_1.state_ = "waiting"
		end

		function arg_742_1.playNext_(arg_744_0)
			if arg_744_0 == 1 then
				arg_742_0:Play1108105180(arg_742_1)
			end
		end

		function arg_742_1.onSingleLineUpdate_(arg_745_0)
			local var_745_0 = 1

			if var_745_0 < arg_742_1.time_ and arg_742_1.time_ <= var_745_0 + arg_745_0 then
				local var_745_1 = manager.ui.mainCamera.transform.localPosition
				local var_745_2 = Vector3.New(0, 0, 10) + Vector3.New(var_745_1.x, var_745_1.y, 0)
				local var_745_3 = arg_742_1.bgs_.ST0402a

				var_745_3.transform.localPosition = var_745_2
				var_745_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_745_4 = var_745_3:GetComponent("SpriteRenderer")

				if var_745_4 and var_745_4.sprite then
					local var_745_5 = (var_745_3.transform.localPosition - var_745_1).z
					local var_745_6 = manager.ui.mainCameraCom_
					local var_745_7 = 2 * var_745_5 * Mathf.Tan(var_745_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_745_8 = var_745_7 * var_745_6.aspect
					local var_745_9 = var_745_4.sprite.bounds.size.x
					local var_745_10 = var_745_4.sprite.bounds.size.y
					local var_745_11 = var_745_8 / var_745_9
					local var_745_12 = var_745_7 / var_745_10
					local var_745_13 = var_745_12 < var_745_11 and var_745_11 or var_745_12

					var_745_3.transform.localScale = Vector3.New(var_745_13, var_745_13, 0)
				end

				for iter_745_0, iter_745_1 in pairs(arg_742_1.bgs_) do
					if iter_745_0 ~= "ST0402a" then
						iter_745_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_745_14 = 0

			if var_745_14 < arg_742_1.time_ and arg_742_1.time_ <= var_745_14 + arg_745_0 then
				arg_742_1.allBtn_.enabled = false
			end

			local var_745_15 = 0.3

			if arg_742_1.time_ >= var_745_14 + var_745_15 and arg_742_1.time_ < var_745_14 + var_745_15 + arg_745_0 then
				arg_742_1.allBtn_.enabled = true
			end

			local var_745_16 = 0

			if var_745_16 < arg_742_1.time_ and arg_742_1.time_ <= var_745_16 + arg_745_0 then
				arg_742_1.mask_.enabled = true
				arg_742_1.mask_.raycastTarget = true

				arg_742_1:SetGaussion(false)
			end

			local var_745_17 = 1

			if var_745_16 <= arg_742_1.time_ and arg_742_1.time_ < var_745_16 + var_745_17 then
				local var_745_18 = (arg_742_1.time_ - var_745_16) / var_745_17
				local var_745_19 = Color.New(1, 1, 1)

				var_745_19.a = Mathf.Lerp(0, 1, var_745_18)
				arg_742_1.mask_.color = var_745_19
			end

			if arg_742_1.time_ >= var_745_16 + var_745_17 and arg_742_1.time_ < var_745_16 + var_745_17 + arg_745_0 then
				local var_745_20 = Color.New(1, 1, 1)

				var_745_20.a = 1
				arg_742_1.mask_.color = var_745_20
			end

			local var_745_21 = 1

			if var_745_21 < arg_742_1.time_ and arg_742_1.time_ <= var_745_21 + arg_745_0 then
				arg_742_1.mask_.enabled = true
				arg_742_1.mask_.raycastTarget = true

				arg_742_1:SetGaussion(false)
			end

			local var_745_22 = 1.79446879844181

			if var_745_21 <= arg_742_1.time_ and arg_742_1.time_ < var_745_21 + var_745_22 then
				local var_745_23 = (arg_742_1.time_ - var_745_21) / var_745_22
				local var_745_24 = Color.New(1, 1, 1)

				var_745_24.a = Mathf.Lerp(1, 0, var_745_23)
				arg_742_1.mask_.color = var_745_24
			end

			if arg_742_1.time_ >= var_745_21 + var_745_22 and arg_742_1.time_ < var_745_21 + var_745_22 + arg_745_0 then
				local var_745_25 = Color.New(1, 1, 1)
				local var_745_26 = 0

				arg_742_1.mask_.enabled = false
				var_745_25.a = var_745_26
				arg_742_1.mask_.color = var_745_25
			end

			if arg_742_1.frameCnt_ <= 1 then
				arg_742_1.dialog_:SetActive(false)
			end

			local var_745_27 = 2.79446879844181
			local var_745_28 = 0.9

			if var_745_27 < arg_742_1.time_ and arg_742_1.time_ <= var_745_27 + arg_745_0 then
				arg_742_1.talkMaxDuration = 0

				arg_742_1.dialog_:SetActive(true)

				local var_745_29 = LeanTween.value(arg_742_1.dialog_, 0, 1, 0.3)

				var_745_29:setOnUpdate(LuaHelper.FloatAction(function(arg_746_0)
					arg_742_1.dialogCg_.alpha = arg_746_0
				end))
				var_745_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_742_1.dialog_)
					var_745_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_742_1.duration_ = arg_742_1.duration_ + 0.3

				SetActive(arg_742_1.leftNameGo_, false)

				arg_742_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_742_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_742_1:RecordName(arg_742_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_742_1.iconTrs_.gameObject, false)
				arg_742_1.callingController_:SetSelectedState("normal")

				local var_745_30 = arg_742_1:GetWordFromCfg(1108105178)
				local var_745_31 = arg_742_1:FormatText(var_745_30.content)

				arg_742_1.text_.text = var_745_31

				LuaForUtil.ClearLinePrefixSymbol(arg_742_1.text_)

				local var_745_32 = 36
				local var_745_33 = utf8.len(var_745_31)
				local var_745_34 = var_745_32 <= 0 and var_745_28 or var_745_28 * (var_745_33 / var_745_32)

				if var_745_34 > 0 and var_745_28 < var_745_34 then
					arg_742_1.talkMaxDuration = var_745_34
					var_745_27 = var_745_27 + 0.3

					if var_745_34 + var_745_27 > arg_742_1.duration_ then
						arg_742_1.duration_ = var_745_34 + var_745_27
					end
				end

				arg_742_1.text_.text = var_745_31
				arg_742_1.typewritter.percent = 0

				arg_742_1.typewritter:SetDirty()
				arg_742_1:ShowNextGo(false)
				arg_742_1:RecordContent(arg_742_1.text_.text)
			end

			local var_745_35 = var_745_27 + 0.3
			local var_745_36 = math.max(var_745_28, arg_742_1.talkMaxDuration)

			if var_745_35 <= arg_742_1.time_ and arg_742_1.time_ < var_745_35 + var_745_36 then
				arg_742_1.typewritter.percent = (arg_742_1.time_ - var_745_35) / var_745_36

				arg_742_1.typewritter:SetDirty()
			end

			if arg_742_1.time_ >= var_745_35 + var_745_36 and arg_742_1.time_ < var_745_35 + var_745_36 + arg_745_0 then
				arg_742_1.typewritter.percent = 1

				arg_742_1.typewritter:SetDirty()
				arg_742_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105180 = function(arg_748_0, arg_748_1)
		arg_748_1.time_ = 0
		arg_748_1.frameCnt_ = 0
		arg_748_1.state_ = "playing"
		arg_748_1.curTalkId_ = 1108105180
		arg_748_1.duration_ = 5

		SetActive(arg_748_1.tipsGo_, false)

		function arg_748_1.onSingleLineFinish_()
			arg_748_1.onSingleLineUpdate_ = nil
			arg_748_1.onSingleLineFinish_ = nil
			arg_748_1.state_ = "waiting"
		end

		function arg_748_1.playNext_(arg_750_0)
			if arg_750_0 == 1 then
				arg_748_0:Play1108105181(arg_748_1)
			end
		end

		function arg_748_1.onSingleLineUpdate_(arg_751_0)
			local var_751_0 = arg_748_1.actors_["1081ui_story"]
			local var_751_1 = 0

			if var_751_1 < arg_748_1.time_ and arg_748_1.time_ <= var_751_1 + arg_751_0 and arg_748_1.var_.characterEffect1081ui_story == nil then
				arg_748_1.var_.characterEffect1081ui_story = var_751_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_751_2 = 0.200000002980232

			if var_751_1 <= arg_748_1.time_ and arg_748_1.time_ < var_751_1 + var_751_2 then
				local var_751_3 = (arg_748_1.time_ - var_751_1) / var_751_2

				if arg_748_1.var_.characterEffect1081ui_story then
					local var_751_4 = Mathf.Lerp(0, 0.5, var_751_3)

					arg_748_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_748_1.var_.characterEffect1081ui_story.fillRatio = var_751_4
				end
			end

			if arg_748_1.time_ >= var_751_1 + var_751_2 and arg_748_1.time_ < var_751_1 + var_751_2 + arg_751_0 and arg_748_1.var_.characterEffect1081ui_story then
				local var_751_5 = 0.5

				arg_748_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_748_1.var_.characterEffect1081ui_story.fillRatio = var_751_5
			end

			local var_751_6 = 0
			local var_751_7 = 0.3

			if var_751_6 < arg_748_1.time_ and arg_748_1.time_ <= var_751_6 + arg_751_0 then
				arg_748_1.talkMaxDuration = 0
				arg_748_1.dialogCg_.alpha = 1

				arg_748_1.dialog_:SetActive(true)
				SetActive(arg_748_1.leftNameGo_, true)

				local var_751_8 = arg_748_1:FormatText(StoryNameCfg[7].name)

				arg_748_1.leftNameTxt_.text = var_751_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_748_1.leftNameTxt_.transform)

				arg_748_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_748_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_748_1:RecordName(arg_748_1.leftNameTxt_.text)
				SetActive(arg_748_1.iconTrs_.gameObject, false)
				arg_748_1.callingController_:SetSelectedState("normal")

				local var_751_9 = arg_748_1:GetWordFromCfg(1108105180)
				local var_751_10 = arg_748_1:FormatText(var_751_9.content)

				arg_748_1.text_.text = var_751_10

				LuaForUtil.ClearLinePrefixSymbol(arg_748_1.text_)

				local var_751_11 = 12
				local var_751_12 = utf8.len(var_751_10)
				local var_751_13 = var_751_11 <= 0 and var_751_7 or var_751_7 * (var_751_12 / var_751_11)

				if var_751_13 > 0 and var_751_7 < var_751_13 then
					arg_748_1.talkMaxDuration = var_751_13

					if var_751_13 + var_751_6 > arg_748_1.duration_ then
						arg_748_1.duration_ = var_751_13 + var_751_6
					end
				end

				arg_748_1.text_.text = var_751_10
				arg_748_1.typewritter.percent = 0

				arg_748_1.typewritter:SetDirty()
				arg_748_1:ShowNextGo(false)
				arg_748_1:RecordContent(arg_748_1.text_.text)
			end

			local var_751_14 = math.max(var_751_7, arg_748_1.talkMaxDuration)

			if var_751_6 <= arg_748_1.time_ and arg_748_1.time_ < var_751_6 + var_751_14 then
				arg_748_1.typewritter.percent = (arg_748_1.time_ - var_751_6) / var_751_14

				arg_748_1.typewritter:SetDirty()
			end

			if arg_748_1.time_ >= var_751_6 + var_751_14 and arg_748_1.time_ < var_751_6 + var_751_14 + arg_751_0 then
				arg_748_1.typewritter.percent = 1

				arg_748_1.typewritter:SetDirty()
				arg_748_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105181 = function(arg_752_0, arg_752_1)
		arg_752_1.time_ = 0
		arg_752_1.frameCnt_ = 0
		arg_752_1.state_ = "playing"
		arg_752_1.curTalkId_ = 1108105181
		arg_752_1.duration_ = 5

		SetActive(arg_752_1.tipsGo_, false)

		function arg_752_1.onSingleLineFinish_()
			arg_752_1.onSingleLineUpdate_ = nil
			arg_752_1.onSingleLineFinish_ = nil
			arg_752_1.state_ = "waiting"
		end

		function arg_752_1.playNext_(arg_754_0)
			if arg_754_0 == 1 then
				arg_752_0:Play1108105182(arg_752_1)
			end
		end

		function arg_752_1.onSingleLineUpdate_(arg_755_0)
			local var_755_0 = arg_752_1.actors_["1081ui_story"].transform
			local var_755_1 = 0

			if var_755_1 < arg_752_1.time_ and arg_752_1.time_ <= var_755_1 + arg_755_0 then
				arg_752_1.var_.moveOldPos1081ui_story = var_755_0.localPosition
			end

			local var_755_2 = 0.001

			if var_755_1 <= arg_752_1.time_ and arg_752_1.time_ < var_755_1 + var_755_2 then
				local var_755_3 = (arg_752_1.time_ - var_755_1) / var_755_2
				local var_755_4 = Vector3.New(0, -0.92, -5.8)

				var_755_0.localPosition = Vector3.Lerp(arg_752_1.var_.moveOldPos1081ui_story, var_755_4, var_755_3)

				local var_755_5 = manager.ui.mainCamera.transform.position - var_755_0.position

				var_755_0.forward = Vector3.New(var_755_5.x, var_755_5.y, var_755_5.z)

				local var_755_6 = var_755_0.localEulerAngles

				var_755_6.z = 0
				var_755_6.x = 0
				var_755_0.localEulerAngles = var_755_6
			end

			if arg_752_1.time_ >= var_755_1 + var_755_2 and arg_752_1.time_ < var_755_1 + var_755_2 + arg_755_0 then
				var_755_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_755_7 = manager.ui.mainCamera.transform.position - var_755_0.position

				var_755_0.forward = Vector3.New(var_755_7.x, var_755_7.y, var_755_7.z)

				local var_755_8 = var_755_0.localEulerAngles

				var_755_8.z = 0
				var_755_8.x = 0
				var_755_0.localEulerAngles = var_755_8
			end

			local var_755_9 = arg_752_1.actors_["1081ui_story"]
			local var_755_10 = 0

			if var_755_10 < arg_752_1.time_ and arg_752_1.time_ <= var_755_10 + arg_755_0 and arg_752_1.var_.characterEffect1081ui_story == nil then
				arg_752_1.var_.characterEffect1081ui_story = var_755_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_755_11 = 0.200000002980232

			if var_755_10 <= arg_752_1.time_ and arg_752_1.time_ < var_755_10 + var_755_11 then
				local var_755_12 = (arg_752_1.time_ - var_755_10) / var_755_11

				if arg_752_1.var_.characterEffect1081ui_story then
					arg_752_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_752_1.time_ >= var_755_10 + var_755_11 and arg_752_1.time_ < var_755_10 + var_755_11 + arg_755_0 and arg_752_1.var_.characterEffect1081ui_story then
				arg_752_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_755_13 = 0

			if var_755_13 < arg_752_1.time_ and arg_752_1.time_ <= var_755_13 + arg_755_0 then
				arg_752_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_755_14 = 0

			if var_755_14 < arg_752_1.time_ and arg_752_1.time_ <= var_755_14 + arg_755_0 then
				arg_752_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_755_15 = 0
			local var_755_16 = 0.275

			if var_755_15 < arg_752_1.time_ and arg_752_1.time_ <= var_755_15 + arg_755_0 then
				arg_752_1.talkMaxDuration = 0
				arg_752_1.dialogCg_.alpha = 1

				arg_752_1.dialog_:SetActive(true)
				SetActive(arg_752_1.leftNameGo_, true)

				local var_755_17 = arg_752_1:FormatText(StoryNameCfg[202].name)

				arg_752_1.leftNameTxt_.text = var_755_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_752_1.leftNameTxt_.transform)

				arg_752_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_752_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_752_1:RecordName(arg_752_1.leftNameTxt_.text)
				SetActive(arg_752_1.iconTrs_.gameObject, false)
				arg_752_1.callingController_:SetSelectedState("normal")

				local var_755_18 = arg_752_1:GetWordFromCfg(1108105181)
				local var_755_19 = arg_752_1:FormatText(var_755_18.content)

				arg_752_1.text_.text = var_755_19

				LuaForUtil.ClearLinePrefixSymbol(arg_752_1.text_)

				local var_755_20 = 11
				local var_755_21 = utf8.len(var_755_19)
				local var_755_22 = var_755_20 <= 0 and var_755_16 or var_755_16 * (var_755_21 / var_755_20)

				if var_755_22 > 0 and var_755_16 < var_755_22 then
					arg_752_1.talkMaxDuration = var_755_22

					if var_755_22 + var_755_15 > arg_752_1.duration_ then
						arg_752_1.duration_ = var_755_22 + var_755_15
					end
				end

				arg_752_1.text_.text = var_755_19
				arg_752_1.typewritter.percent = 0

				arg_752_1.typewritter:SetDirty()
				arg_752_1:ShowNextGo(false)
				arg_752_1:RecordContent(arg_752_1.text_.text)
			end

			local var_755_23 = math.max(var_755_16, arg_752_1.talkMaxDuration)

			if var_755_15 <= arg_752_1.time_ and arg_752_1.time_ < var_755_15 + var_755_23 then
				arg_752_1.typewritter.percent = (arg_752_1.time_ - var_755_15) / var_755_23

				arg_752_1.typewritter:SetDirty()
			end

			if arg_752_1.time_ >= var_755_15 + var_755_23 and arg_752_1.time_ < var_755_15 + var_755_23 + arg_755_0 then
				arg_752_1.typewritter.percent = 1

				arg_752_1.typewritter:SetDirty()
				arg_752_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105182 = function(arg_756_0, arg_756_1)
		arg_756_1.time_ = 0
		arg_756_1.frameCnt_ = 0
		arg_756_1.state_ = "playing"
		arg_756_1.curTalkId_ = 1108105182
		arg_756_1.duration_ = 5

		SetActive(arg_756_1.tipsGo_, false)

		function arg_756_1.onSingleLineFinish_()
			arg_756_1.onSingleLineUpdate_ = nil
			arg_756_1.onSingleLineFinish_ = nil
			arg_756_1.state_ = "waiting"
		end

		function arg_756_1.playNext_(arg_758_0)
			if arg_758_0 == 1 then
				arg_756_0:Play1108105183(arg_756_1)
			end
		end

		function arg_756_1.onSingleLineUpdate_(arg_759_0)
			local var_759_0 = arg_756_1.actors_["1081ui_story"].transform
			local var_759_1 = 0

			if var_759_1 < arg_756_1.time_ and arg_756_1.time_ <= var_759_1 + arg_759_0 then
				arg_756_1.var_.moveOldPos1081ui_story = var_759_0.localPosition
			end

			local var_759_2 = 0.001

			if var_759_1 <= arg_756_1.time_ and arg_756_1.time_ < var_759_1 + var_759_2 then
				local var_759_3 = (arg_756_1.time_ - var_759_1) / var_759_2
				local var_759_4 = Vector3.New(0, 100, 0)

				var_759_0.localPosition = Vector3.Lerp(arg_756_1.var_.moveOldPos1081ui_story, var_759_4, var_759_3)

				local var_759_5 = manager.ui.mainCamera.transform.position - var_759_0.position

				var_759_0.forward = Vector3.New(var_759_5.x, var_759_5.y, var_759_5.z)

				local var_759_6 = var_759_0.localEulerAngles

				var_759_6.z = 0
				var_759_6.x = 0
				var_759_0.localEulerAngles = var_759_6
			end

			if arg_756_1.time_ >= var_759_1 + var_759_2 and arg_756_1.time_ < var_759_1 + var_759_2 + arg_759_0 then
				var_759_0.localPosition = Vector3.New(0, 100, 0)

				local var_759_7 = manager.ui.mainCamera.transform.position - var_759_0.position

				var_759_0.forward = Vector3.New(var_759_7.x, var_759_7.y, var_759_7.z)

				local var_759_8 = var_759_0.localEulerAngles

				var_759_8.z = 0
				var_759_8.x = 0
				var_759_0.localEulerAngles = var_759_8
			end

			local var_759_9 = 0
			local var_759_10 = 1.125

			if var_759_9 < arg_756_1.time_ and arg_756_1.time_ <= var_759_9 + arg_759_0 then
				arg_756_1.talkMaxDuration = 0
				arg_756_1.dialogCg_.alpha = 1

				arg_756_1.dialog_:SetActive(true)
				SetActive(arg_756_1.leftNameGo_, false)

				arg_756_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_756_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_756_1:RecordName(arg_756_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_756_1.iconTrs_.gameObject, false)
				arg_756_1.callingController_:SetSelectedState("normal")

				local var_759_11 = arg_756_1:GetWordFromCfg(1108105182)
				local var_759_12 = arg_756_1:FormatText(var_759_11.content)

				arg_756_1.text_.text = var_759_12

				LuaForUtil.ClearLinePrefixSymbol(arg_756_1.text_)

				local var_759_13 = 45
				local var_759_14 = utf8.len(var_759_12)
				local var_759_15 = var_759_13 <= 0 and var_759_10 or var_759_10 * (var_759_14 / var_759_13)

				if var_759_15 > 0 and var_759_10 < var_759_15 then
					arg_756_1.talkMaxDuration = var_759_15

					if var_759_15 + var_759_9 > arg_756_1.duration_ then
						arg_756_1.duration_ = var_759_15 + var_759_9
					end
				end

				arg_756_1.text_.text = var_759_12
				arg_756_1.typewritter.percent = 0

				arg_756_1.typewritter:SetDirty()
				arg_756_1:ShowNextGo(false)
				arg_756_1:RecordContent(arg_756_1.text_.text)
			end

			local var_759_16 = math.max(var_759_10, arg_756_1.talkMaxDuration)

			if var_759_9 <= arg_756_1.time_ and arg_756_1.time_ < var_759_9 + var_759_16 then
				arg_756_1.typewritter.percent = (arg_756_1.time_ - var_759_9) / var_759_16

				arg_756_1.typewritter:SetDirty()
			end

			if arg_756_1.time_ >= var_759_9 + var_759_16 and arg_756_1.time_ < var_759_9 + var_759_16 + arg_759_0 then
				arg_756_1.typewritter.percent = 1

				arg_756_1.typewritter:SetDirty()
				arg_756_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105183 = function(arg_760_0, arg_760_1)
		arg_760_1.time_ = 0
		arg_760_1.frameCnt_ = 0
		arg_760_1.state_ = "playing"
		arg_760_1.curTalkId_ = 1108105183
		arg_760_1.duration_ = 5

		SetActive(arg_760_1.tipsGo_, false)

		function arg_760_1.onSingleLineFinish_()
			arg_760_1.onSingleLineUpdate_ = nil
			arg_760_1.onSingleLineFinish_ = nil
			arg_760_1.state_ = "waiting"
		end

		function arg_760_1.playNext_(arg_762_0)
			if arg_762_0 == 1 then
				arg_760_0:Play1108105184(arg_760_1)
			end
		end

		function arg_760_1.onSingleLineUpdate_(arg_763_0)
			local var_763_0 = 0
			local var_763_1 = 0.325

			if var_763_0 < arg_760_1.time_ and arg_760_1.time_ <= var_763_0 + arg_763_0 then
				arg_760_1.talkMaxDuration = 0
				arg_760_1.dialogCg_.alpha = 1

				arg_760_1.dialog_:SetActive(true)
				SetActive(arg_760_1.leftNameGo_, true)

				local var_763_2 = arg_760_1:FormatText(StoryNameCfg[7].name)

				arg_760_1.leftNameTxt_.text = var_763_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_760_1.leftNameTxt_.transform)

				arg_760_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_760_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_760_1:RecordName(arg_760_1.leftNameTxt_.text)
				SetActive(arg_760_1.iconTrs_.gameObject, false)
				arg_760_1.callingController_:SetSelectedState("normal")

				local var_763_3 = arg_760_1:GetWordFromCfg(1108105183)
				local var_763_4 = arg_760_1:FormatText(var_763_3.content)

				arg_760_1.text_.text = var_763_4

				LuaForUtil.ClearLinePrefixSymbol(arg_760_1.text_)

				local var_763_5 = 13
				local var_763_6 = utf8.len(var_763_4)
				local var_763_7 = var_763_5 <= 0 and var_763_1 or var_763_1 * (var_763_6 / var_763_5)

				if var_763_7 > 0 and var_763_1 < var_763_7 then
					arg_760_1.talkMaxDuration = var_763_7

					if var_763_7 + var_763_0 > arg_760_1.duration_ then
						arg_760_1.duration_ = var_763_7 + var_763_0
					end
				end

				arg_760_1.text_.text = var_763_4
				arg_760_1.typewritter.percent = 0

				arg_760_1.typewritter:SetDirty()
				arg_760_1:ShowNextGo(false)
				arg_760_1:RecordContent(arg_760_1.text_.text)
			end

			local var_763_8 = math.max(var_763_1, arg_760_1.talkMaxDuration)

			if var_763_0 <= arg_760_1.time_ and arg_760_1.time_ < var_763_0 + var_763_8 then
				arg_760_1.typewritter.percent = (arg_760_1.time_ - var_763_0) / var_763_8

				arg_760_1.typewritter:SetDirty()
			end

			if arg_760_1.time_ >= var_763_0 + var_763_8 and arg_760_1.time_ < var_763_0 + var_763_8 + arg_763_0 then
				arg_760_1.typewritter.percent = 1

				arg_760_1.typewritter:SetDirty()
				arg_760_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105184 = function(arg_764_0, arg_764_1)
		arg_764_1.time_ = 0
		arg_764_1.frameCnt_ = 0
		arg_764_1.state_ = "playing"
		arg_764_1.curTalkId_ = 1108105184
		arg_764_1.duration_ = 5

		SetActive(arg_764_1.tipsGo_, false)

		function arg_764_1.onSingleLineFinish_()
			arg_764_1.onSingleLineUpdate_ = nil
			arg_764_1.onSingleLineFinish_ = nil
			arg_764_1.state_ = "waiting"
		end

		function arg_764_1.playNext_(arg_766_0)
			if arg_766_0 == 1 then
				arg_764_0:Play1108105185(arg_764_1)
			end
		end

		function arg_764_1.onSingleLineUpdate_(arg_767_0)
			local var_767_0 = 0
			local var_767_1 = 0.125

			if var_767_0 < arg_764_1.time_ and arg_764_1.time_ <= var_767_0 + arg_767_0 then
				arg_764_1.talkMaxDuration = 0
				arg_764_1.dialogCg_.alpha = 1

				arg_764_1.dialog_:SetActive(true)
				SetActive(arg_764_1.leftNameGo_, true)

				local var_767_2 = arg_764_1:FormatText(StoryNameCfg[7].name)

				arg_764_1.leftNameTxt_.text = var_767_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_764_1.leftNameTxt_.transform)

				arg_764_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_764_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_764_1:RecordName(arg_764_1.leftNameTxt_.text)
				SetActive(arg_764_1.iconTrs_.gameObject, false)
				arg_764_1.callingController_:SetSelectedState("normal")

				local var_767_3 = arg_764_1:GetWordFromCfg(1108105184)
				local var_767_4 = arg_764_1:FormatText(var_767_3.content)

				arg_764_1.text_.text = var_767_4

				LuaForUtil.ClearLinePrefixSymbol(arg_764_1.text_)

				local var_767_5 = 5
				local var_767_6 = utf8.len(var_767_4)
				local var_767_7 = var_767_5 <= 0 and var_767_1 or var_767_1 * (var_767_6 / var_767_5)

				if var_767_7 > 0 and var_767_1 < var_767_7 then
					arg_764_1.talkMaxDuration = var_767_7

					if var_767_7 + var_767_0 > arg_764_1.duration_ then
						arg_764_1.duration_ = var_767_7 + var_767_0
					end
				end

				arg_764_1.text_.text = var_767_4
				arg_764_1.typewritter.percent = 0

				arg_764_1.typewritter:SetDirty()
				arg_764_1:ShowNextGo(false)
				arg_764_1:RecordContent(arg_764_1.text_.text)
			end

			local var_767_8 = math.max(var_767_1, arg_764_1.talkMaxDuration)

			if var_767_0 <= arg_764_1.time_ and arg_764_1.time_ < var_767_0 + var_767_8 then
				arg_764_1.typewritter.percent = (arg_764_1.time_ - var_767_0) / var_767_8

				arg_764_1.typewritter:SetDirty()
			end

			if arg_764_1.time_ >= var_767_0 + var_767_8 and arg_764_1.time_ < var_767_0 + var_767_8 + arg_767_0 then
				arg_764_1.typewritter.percent = 1

				arg_764_1.typewritter:SetDirty()
				arg_764_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105185 = function(arg_768_0, arg_768_1)
		arg_768_1.time_ = 0
		arg_768_1.frameCnt_ = 0
		arg_768_1.state_ = "playing"
		arg_768_1.curTalkId_ = 1108105185
		arg_768_1.duration_ = 5

		SetActive(arg_768_1.tipsGo_, false)

		function arg_768_1.onSingleLineFinish_()
			arg_768_1.onSingleLineUpdate_ = nil
			arg_768_1.onSingleLineFinish_ = nil
			arg_768_1.state_ = "waiting"
		end

		function arg_768_1.playNext_(arg_770_0)
			if arg_770_0 == 1 then
				arg_768_0:Play1108105186(arg_768_1)
			end
		end

		function arg_768_1.onSingleLineUpdate_(arg_771_0)
			local var_771_0 = arg_768_1.actors_["1081ui_story"].transform
			local var_771_1 = 0

			if var_771_1 < arg_768_1.time_ and arg_768_1.time_ <= var_771_1 + arg_771_0 then
				arg_768_1.var_.moveOldPos1081ui_story = var_771_0.localPosition
			end

			local var_771_2 = 0.001

			if var_771_1 <= arg_768_1.time_ and arg_768_1.time_ < var_771_1 + var_771_2 then
				local var_771_3 = (arg_768_1.time_ - var_771_1) / var_771_2
				local var_771_4 = Vector3.New(0, 100, 0)

				var_771_0.localPosition = Vector3.Lerp(arg_768_1.var_.moveOldPos1081ui_story, var_771_4, var_771_3)

				local var_771_5 = manager.ui.mainCamera.transform.position - var_771_0.position

				var_771_0.forward = Vector3.New(var_771_5.x, var_771_5.y, var_771_5.z)

				local var_771_6 = var_771_0.localEulerAngles

				var_771_6.z = 0
				var_771_6.x = 0
				var_771_0.localEulerAngles = var_771_6
			end

			if arg_768_1.time_ >= var_771_1 + var_771_2 and arg_768_1.time_ < var_771_1 + var_771_2 + arg_771_0 then
				var_771_0.localPosition = Vector3.New(0, 100, 0)

				local var_771_7 = manager.ui.mainCamera.transform.position - var_771_0.position

				var_771_0.forward = Vector3.New(var_771_7.x, var_771_7.y, var_771_7.z)

				local var_771_8 = var_771_0.localEulerAngles

				var_771_8.z = 0
				var_771_8.x = 0
				var_771_0.localEulerAngles = var_771_8
			end

			local var_771_9 = 0
			local var_771_10 = 1.45

			if var_771_9 < arg_768_1.time_ and arg_768_1.time_ <= var_771_9 + arg_771_0 then
				arg_768_1.talkMaxDuration = 0
				arg_768_1.dialogCg_.alpha = 1

				arg_768_1.dialog_:SetActive(true)
				SetActive(arg_768_1.leftNameGo_, false)

				arg_768_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_768_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_768_1:RecordName(arg_768_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_768_1.iconTrs_.gameObject, false)
				arg_768_1.callingController_:SetSelectedState("normal")

				local var_771_11 = arg_768_1:GetWordFromCfg(1108105185)
				local var_771_12 = arg_768_1:FormatText(var_771_11.content)

				arg_768_1.text_.text = var_771_12

				LuaForUtil.ClearLinePrefixSymbol(arg_768_1.text_)

				local var_771_13 = 58
				local var_771_14 = utf8.len(var_771_12)
				local var_771_15 = var_771_13 <= 0 and var_771_10 or var_771_10 * (var_771_14 / var_771_13)

				if var_771_15 > 0 and var_771_10 < var_771_15 then
					arg_768_1.talkMaxDuration = var_771_15

					if var_771_15 + var_771_9 > arg_768_1.duration_ then
						arg_768_1.duration_ = var_771_15 + var_771_9
					end
				end

				arg_768_1.text_.text = var_771_12
				arg_768_1.typewritter.percent = 0

				arg_768_1.typewritter:SetDirty()
				arg_768_1:ShowNextGo(false)
				arg_768_1:RecordContent(arg_768_1.text_.text)
			end

			local var_771_16 = math.max(var_771_10, arg_768_1.talkMaxDuration)

			if var_771_9 <= arg_768_1.time_ and arg_768_1.time_ < var_771_9 + var_771_16 then
				arg_768_1.typewritter.percent = (arg_768_1.time_ - var_771_9) / var_771_16

				arg_768_1.typewritter:SetDirty()
			end

			if arg_768_1.time_ >= var_771_9 + var_771_16 and arg_768_1.time_ < var_771_9 + var_771_16 + arg_771_0 then
				arg_768_1.typewritter.percent = 1

				arg_768_1.typewritter:SetDirty()
				arg_768_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105186 = function(arg_772_0, arg_772_1)
		arg_772_1.time_ = 0
		arg_772_1.frameCnt_ = 0
		arg_772_1.state_ = "playing"
		arg_772_1.curTalkId_ = 1108105186
		arg_772_1.duration_ = 5

		SetActive(arg_772_1.tipsGo_, false)

		function arg_772_1.onSingleLineFinish_()
			arg_772_1.onSingleLineUpdate_ = nil
			arg_772_1.onSingleLineFinish_ = nil
			arg_772_1.state_ = "waiting"
		end

		function arg_772_1.playNext_(arg_774_0)
			if arg_774_0 == 1 then
				arg_772_0:Play1108105187(arg_772_1)
			end
		end

		function arg_772_1.onSingleLineUpdate_(arg_775_0)
			local var_775_0 = arg_772_1.actors_["1081ui_story"].transform
			local var_775_1 = 0

			if var_775_1 < arg_772_1.time_ and arg_772_1.time_ <= var_775_1 + arg_775_0 then
				arg_772_1.var_.moveOldPos1081ui_story = var_775_0.localPosition
			end

			local var_775_2 = 0.001

			if var_775_1 <= arg_772_1.time_ and arg_772_1.time_ < var_775_1 + var_775_2 then
				local var_775_3 = (arg_772_1.time_ - var_775_1) / var_775_2
				local var_775_4 = Vector3.New(0, -0.92, -5.8)

				var_775_0.localPosition = Vector3.Lerp(arg_772_1.var_.moveOldPos1081ui_story, var_775_4, var_775_3)

				local var_775_5 = manager.ui.mainCamera.transform.position - var_775_0.position

				var_775_0.forward = Vector3.New(var_775_5.x, var_775_5.y, var_775_5.z)

				local var_775_6 = var_775_0.localEulerAngles

				var_775_6.z = 0
				var_775_6.x = 0
				var_775_0.localEulerAngles = var_775_6
			end

			if arg_772_1.time_ >= var_775_1 + var_775_2 and arg_772_1.time_ < var_775_1 + var_775_2 + arg_775_0 then
				var_775_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_775_7 = manager.ui.mainCamera.transform.position - var_775_0.position

				var_775_0.forward = Vector3.New(var_775_7.x, var_775_7.y, var_775_7.z)

				local var_775_8 = var_775_0.localEulerAngles

				var_775_8.z = 0
				var_775_8.x = 0
				var_775_0.localEulerAngles = var_775_8
			end

			local var_775_9 = arg_772_1.actors_["1081ui_story"]
			local var_775_10 = 0

			if var_775_10 < arg_772_1.time_ and arg_772_1.time_ <= var_775_10 + arg_775_0 and arg_772_1.var_.characterEffect1081ui_story == nil then
				arg_772_1.var_.characterEffect1081ui_story = var_775_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_775_11 = 0.200000002980232

			if var_775_10 <= arg_772_1.time_ and arg_772_1.time_ < var_775_10 + var_775_11 then
				local var_775_12 = (arg_772_1.time_ - var_775_10) / var_775_11

				if arg_772_1.var_.characterEffect1081ui_story then
					arg_772_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_772_1.time_ >= var_775_10 + var_775_11 and arg_772_1.time_ < var_775_10 + var_775_11 + arg_775_0 and arg_772_1.var_.characterEffect1081ui_story then
				arg_772_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_775_13 = 0

			if var_775_13 < arg_772_1.time_ and arg_772_1.time_ <= var_775_13 + arg_775_0 then
				arg_772_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081actionlink/1081action437")
			end

			local var_775_14 = 0

			if var_775_14 < arg_772_1.time_ and arg_772_1.time_ <= var_775_14 + arg_775_0 then
				arg_772_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_775_15 = 0
			local var_775_16 = 0.8

			if var_775_15 < arg_772_1.time_ and arg_772_1.time_ <= var_775_15 + arg_775_0 then
				arg_772_1.talkMaxDuration = 0
				arg_772_1.dialogCg_.alpha = 1

				arg_772_1.dialog_:SetActive(true)
				SetActive(arg_772_1.leftNameGo_, true)

				local var_775_17 = arg_772_1:FormatText(StoryNameCfg[202].name)

				arg_772_1.leftNameTxt_.text = var_775_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_772_1.leftNameTxt_.transform)

				arg_772_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_772_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_772_1:RecordName(arg_772_1.leftNameTxt_.text)
				SetActive(arg_772_1.iconTrs_.gameObject, false)
				arg_772_1.callingController_:SetSelectedState("normal")

				local var_775_18 = arg_772_1:GetWordFromCfg(1108105186)
				local var_775_19 = arg_772_1:FormatText(var_775_18.content)

				arg_772_1.text_.text = var_775_19

				LuaForUtil.ClearLinePrefixSymbol(arg_772_1.text_)

				local var_775_20 = 32
				local var_775_21 = utf8.len(var_775_19)
				local var_775_22 = var_775_20 <= 0 and var_775_16 or var_775_16 * (var_775_21 / var_775_20)

				if var_775_22 > 0 and var_775_16 < var_775_22 then
					arg_772_1.talkMaxDuration = var_775_22

					if var_775_22 + var_775_15 > arg_772_1.duration_ then
						arg_772_1.duration_ = var_775_22 + var_775_15
					end
				end

				arg_772_1.text_.text = var_775_19
				arg_772_1.typewritter.percent = 0

				arg_772_1.typewritter:SetDirty()
				arg_772_1:ShowNextGo(false)
				arg_772_1:RecordContent(arg_772_1.text_.text)
			end

			local var_775_23 = math.max(var_775_16, arg_772_1.talkMaxDuration)

			if var_775_15 <= arg_772_1.time_ and arg_772_1.time_ < var_775_15 + var_775_23 then
				arg_772_1.typewritter.percent = (arg_772_1.time_ - var_775_15) / var_775_23

				arg_772_1.typewritter:SetDirty()
			end

			if arg_772_1.time_ >= var_775_15 + var_775_23 and arg_772_1.time_ < var_775_15 + var_775_23 + arg_775_0 then
				arg_772_1.typewritter.percent = 1

				arg_772_1.typewritter:SetDirty()
				arg_772_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105187 = function(arg_776_0, arg_776_1)
		arg_776_1.time_ = 0
		arg_776_1.frameCnt_ = 0
		arg_776_1.state_ = "playing"
		arg_776_1.curTalkId_ = 1108105187
		arg_776_1.duration_ = 5

		SetActive(arg_776_1.tipsGo_, false)

		function arg_776_1.onSingleLineFinish_()
			arg_776_1.onSingleLineUpdate_ = nil
			arg_776_1.onSingleLineFinish_ = nil
			arg_776_1.state_ = "waiting"
		end

		function arg_776_1.playNext_(arg_778_0)
			if arg_778_0 == 1 then
				arg_776_0:Play1108105188(arg_776_1)
			end
		end

		function arg_776_1.onSingleLineUpdate_(arg_779_0)
			local var_779_0 = arg_776_1.actors_["1081ui_story"].transform
			local var_779_1 = 0

			if var_779_1 < arg_776_1.time_ and arg_776_1.time_ <= var_779_1 + arg_779_0 then
				arg_776_1.var_.moveOldPos1081ui_story = var_779_0.localPosition
			end

			local var_779_2 = 0.001

			if var_779_1 <= arg_776_1.time_ and arg_776_1.time_ < var_779_1 + var_779_2 then
				local var_779_3 = (arg_776_1.time_ - var_779_1) / var_779_2
				local var_779_4 = Vector3.New(0, 100, 0)

				var_779_0.localPosition = Vector3.Lerp(arg_776_1.var_.moveOldPos1081ui_story, var_779_4, var_779_3)

				local var_779_5 = manager.ui.mainCamera.transform.position - var_779_0.position

				var_779_0.forward = Vector3.New(var_779_5.x, var_779_5.y, var_779_5.z)

				local var_779_6 = var_779_0.localEulerAngles

				var_779_6.z = 0
				var_779_6.x = 0
				var_779_0.localEulerAngles = var_779_6
			end

			if arg_776_1.time_ >= var_779_1 + var_779_2 and arg_776_1.time_ < var_779_1 + var_779_2 + arg_779_0 then
				var_779_0.localPosition = Vector3.New(0, 100, 0)

				local var_779_7 = manager.ui.mainCamera.transform.position - var_779_0.position

				var_779_0.forward = Vector3.New(var_779_7.x, var_779_7.y, var_779_7.z)

				local var_779_8 = var_779_0.localEulerAngles

				var_779_8.z = 0
				var_779_8.x = 0
				var_779_0.localEulerAngles = var_779_8
			end

			local var_779_9 = 0
			local var_779_10 = 0.8

			if var_779_9 < arg_776_1.time_ and arg_776_1.time_ <= var_779_9 + arg_779_0 then
				arg_776_1.talkMaxDuration = 0
				arg_776_1.dialogCg_.alpha = 1

				arg_776_1.dialog_:SetActive(true)
				SetActive(arg_776_1.leftNameGo_, false)

				arg_776_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_776_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_776_1:RecordName(arg_776_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_776_1.iconTrs_.gameObject, false)
				arg_776_1.callingController_:SetSelectedState("normal")

				local var_779_11 = arg_776_1:GetWordFromCfg(1108105187)
				local var_779_12 = arg_776_1:FormatText(var_779_11.content)

				arg_776_1.text_.text = var_779_12

				LuaForUtil.ClearLinePrefixSymbol(arg_776_1.text_)

				local var_779_13 = 32
				local var_779_14 = utf8.len(var_779_12)
				local var_779_15 = var_779_13 <= 0 and var_779_10 or var_779_10 * (var_779_14 / var_779_13)

				if var_779_15 > 0 and var_779_10 < var_779_15 then
					arg_776_1.talkMaxDuration = var_779_15

					if var_779_15 + var_779_9 > arg_776_1.duration_ then
						arg_776_1.duration_ = var_779_15 + var_779_9
					end
				end

				arg_776_1.text_.text = var_779_12
				arg_776_1.typewritter.percent = 0

				arg_776_1.typewritter:SetDirty()
				arg_776_1:ShowNextGo(false)
				arg_776_1:RecordContent(arg_776_1.text_.text)
			end

			local var_779_16 = math.max(var_779_10, arg_776_1.talkMaxDuration)

			if var_779_9 <= arg_776_1.time_ and arg_776_1.time_ < var_779_9 + var_779_16 then
				arg_776_1.typewritter.percent = (arg_776_1.time_ - var_779_9) / var_779_16

				arg_776_1.typewritter:SetDirty()
			end

			if arg_776_1.time_ >= var_779_9 + var_779_16 and arg_776_1.time_ < var_779_9 + var_779_16 + arg_779_0 then
				arg_776_1.typewritter.percent = 1

				arg_776_1.typewritter:SetDirty()
				arg_776_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105188 = function(arg_780_0, arg_780_1)
		arg_780_1.time_ = 0
		arg_780_1.frameCnt_ = 0
		arg_780_1.state_ = "playing"
		arg_780_1.curTalkId_ = 1108105188
		arg_780_1.duration_ = 6

		SetActive(arg_780_1.tipsGo_, false)

		function arg_780_1.onSingleLineFinish_()
			arg_780_1.onSingleLineUpdate_ = nil
			arg_780_1.onSingleLineFinish_ = nil
			arg_780_1.state_ = "waiting"
		end

		function arg_780_1.playNext_(arg_782_0)
			if arg_782_0 == 1 then
				arg_780_0:Play1108105189(arg_780_1)
			end
		end

		function arg_780_1.onSingleLineUpdate_(arg_783_0)
			local var_783_0 = arg_780_1.actors_["1081ui_story"].transform
			local var_783_1 = 0

			if var_783_1 < arg_780_1.time_ and arg_780_1.time_ <= var_783_1 + arg_783_0 then
				arg_780_1.var_.moveOldPos1081ui_story = var_783_0.localPosition
			end

			local var_783_2 = 0.001

			if var_783_1 <= arg_780_1.time_ and arg_780_1.time_ < var_783_1 + var_783_2 then
				local var_783_3 = (arg_780_1.time_ - var_783_1) / var_783_2
				local var_783_4 = Vector3.New(0, 100, 0)

				var_783_0.localPosition = Vector3.Lerp(arg_780_1.var_.moveOldPos1081ui_story, var_783_4, var_783_3)

				local var_783_5 = manager.ui.mainCamera.transform.position - var_783_0.position

				var_783_0.forward = Vector3.New(var_783_5.x, var_783_5.y, var_783_5.z)

				local var_783_6 = var_783_0.localEulerAngles

				var_783_6.z = 0
				var_783_6.x = 0
				var_783_0.localEulerAngles = var_783_6
			end

			if arg_780_1.time_ >= var_783_1 + var_783_2 and arg_780_1.time_ < var_783_1 + var_783_2 + arg_783_0 then
				var_783_0.localPosition = Vector3.New(0, 100, 0)

				local var_783_7 = manager.ui.mainCamera.transform.position - var_783_0.position

				var_783_0.forward = Vector3.New(var_783_7.x, var_783_7.y, var_783_7.z)

				local var_783_8 = var_783_0.localEulerAngles

				var_783_8.z = 0
				var_783_8.x = 0
				var_783_0.localEulerAngles = var_783_8
			end

			local var_783_9 = 0

			if var_783_9 < arg_780_1.time_ and arg_780_1.time_ <= var_783_9 + arg_783_0 then
				arg_780_1.allBtn_.enabled = false
			end

			local var_783_10 = 1

			if arg_780_1.time_ >= var_783_9 + var_783_10 and arg_780_1.time_ < var_783_9 + var_783_10 + arg_783_0 then
				arg_780_1.allBtn_.enabled = true
			end

			if arg_780_1.frameCnt_ <= 1 then
				arg_780_1.dialog_:SetActive(false)
			end

			local var_783_11 = 1
			local var_783_12 = 0.775

			if var_783_11 < arg_780_1.time_ and arg_780_1.time_ <= var_783_11 + arg_783_0 then
				arg_780_1.talkMaxDuration = 0

				arg_780_1.dialog_:SetActive(true)

				local var_783_13 = LeanTween.value(arg_780_1.dialog_, 0, 1, 0.3)

				var_783_13:setOnUpdate(LuaHelper.FloatAction(function(arg_784_0)
					arg_780_1.dialogCg_.alpha = arg_784_0
				end))
				var_783_13:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_780_1.dialog_)
					var_783_13:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_780_1.duration_ = arg_780_1.duration_ + 0.3

				SetActive(arg_780_1.leftNameGo_, false)

				arg_780_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_780_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_780_1:RecordName(arg_780_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_780_1.iconTrs_.gameObject, false)
				arg_780_1.callingController_:SetSelectedState("normal")

				local var_783_14 = arg_780_1:GetWordFromCfg(1108105188)
				local var_783_15 = arg_780_1:FormatText(var_783_14.content)

				arg_780_1.text_.text = var_783_15

				LuaForUtil.ClearLinePrefixSymbol(arg_780_1.text_)

				local var_783_16 = 31
				local var_783_17 = utf8.len(var_783_15)
				local var_783_18 = var_783_16 <= 0 and var_783_12 or var_783_12 * (var_783_17 / var_783_16)

				if var_783_18 > 0 and var_783_12 < var_783_18 then
					arg_780_1.talkMaxDuration = var_783_18
					var_783_11 = var_783_11 + 0.3

					if var_783_18 + var_783_11 > arg_780_1.duration_ then
						arg_780_1.duration_ = var_783_18 + var_783_11
					end
				end

				arg_780_1.text_.text = var_783_15
				arg_780_1.typewritter.percent = 0

				arg_780_1.typewritter:SetDirty()
				arg_780_1:ShowNextGo(false)
				arg_780_1:RecordContent(arg_780_1.text_.text)
			end

			local var_783_19 = var_783_11 + 0.3
			local var_783_20 = math.max(var_783_12, arg_780_1.talkMaxDuration)

			if var_783_19 <= arg_780_1.time_ and arg_780_1.time_ < var_783_19 + var_783_20 then
				arg_780_1.typewritter.percent = (arg_780_1.time_ - var_783_19) / var_783_20

				arg_780_1.typewritter:SetDirty()
			end

			if arg_780_1.time_ >= var_783_19 + var_783_20 and arg_780_1.time_ < var_783_19 + var_783_20 + arg_783_0 then
				arg_780_1.typewritter.percent = 1

				arg_780_1.typewritter:SetDirty()
				arg_780_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105189 = function(arg_786_0, arg_786_1)
		arg_786_1.time_ = 0
		arg_786_1.frameCnt_ = 0
		arg_786_1.state_ = "playing"
		arg_786_1.curTalkId_ = 1108105189
		arg_786_1.duration_ = 5

		SetActive(arg_786_1.tipsGo_, false)

		function arg_786_1.onSingleLineFinish_()
			arg_786_1.onSingleLineUpdate_ = nil
			arg_786_1.onSingleLineFinish_ = nil
			arg_786_1.state_ = "waiting"
		end

		function arg_786_1.playNext_(arg_788_0)
			if arg_788_0 == 1 then
				arg_786_0:Play1108105190(arg_786_1)
			end
		end

		function arg_786_1.onSingleLineUpdate_(arg_789_0)
			local var_789_0 = arg_786_1.actors_["1081ui_story"].transform
			local var_789_1 = 0

			if var_789_1 < arg_786_1.time_ and arg_786_1.time_ <= var_789_1 + arg_789_0 then
				arg_786_1.var_.moveOldPos1081ui_story = var_789_0.localPosition
			end

			local var_789_2 = 0.001

			if var_789_1 <= arg_786_1.time_ and arg_786_1.time_ < var_789_1 + var_789_2 then
				local var_789_3 = (arg_786_1.time_ - var_789_1) / var_789_2
				local var_789_4 = Vector3.New(0, -0.92, -5.8)

				var_789_0.localPosition = Vector3.Lerp(arg_786_1.var_.moveOldPos1081ui_story, var_789_4, var_789_3)

				local var_789_5 = manager.ui.mainCamera.transform.position - var_789_0.position

				var_789_0.forward = Vector3.New(var_789_5.x, var_789_5.y, var_789_5.z)

				local var_789_6 = var_789_0.localEulerAngles

				var_789_6.z = 0
				var_789_6.x = 0
				var_789_0.localEulerAngles = var_789_6
			end

			if arg_786_1.time_ >= var_789_1 + var_789_2 and arg_786_1.time_ < var_789_1 + var_789_2 + arg_789_0 then
				var_789_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_789_7 = manager.ui.mainCamera.transform.position - var_789_0.position

				var_789_0.forward = Vector3.New(var_789_7.x, var_789_7.y, var_789_7.z)

				local var_789_8 = var_789_0.localEulerAngles

				var_789_8.z = 0
				var_789_8.x = 0
				var_789_0.localEulerAngles = var_789_8
			end

			local var_789_9 = arg_786_1.actors_["1081ui_story"]
			local var_789_10 = 0

			if var_789_10 < arg_786_1.time_ and arg_786_1.time_ <= var_789_10 + arg_789_0 and arg_786_1.var_.characterEffect1081ui_story == nil then
				arg_786_1.var_.characterEffect1081ui_story = var_789_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_789_11 = 0.200000002980232

			if var_789_10 <= arg_786_1.time_ and arg_786_1.time_ < var_789_10 + var_789_11 then
				local var_789_12 = (arg_786_1.time_ - var_789_10) / var_789_11

				if arg_786_1.var_.characterEffect1081ui_story then
					arg_786_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_786_1.time_ >= var_789_10 + var_789_11 and arg_786_1.time_ < var_789_10 + var_789_11 + arg_789_0 and arg_786_1.var_.characterEffect1081ui_story then
				arg_786_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_789_13 = 0

			if var_789_13 < arg_786_1.time_ and arg_786_1.time_ <= var_789_13 + arg_789_0 then
				arg_786_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081actionlink/1081action473")
			end

			local var_789_14 = 0

			if var_789_14 < arg_786_1.time_ and arg_786_1.time_ <= var_789_14 + arg_789_0 then
				arg_786_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_789_15 = 0
			local var_789_16 = 0.35

			if var_789_15 < arg_786_1.time_ and arg_786_1.time_ <= var_789_15 + arg_789_0 then
				arg_786_1.talkMaxDuration = 0
				arg_786_1.dialogCg_.alpha = 1

				arg_786_1.dialog_:SetActive(true)
				SetActive(arg_786_1.leftNameGo_, true)

				local var_789_17 = arg_786_1:FormatText(StoryNameCfg[202].name)

				arg_786_1.leftNameTxt_.text = var_789_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_786_1.leftNameTxt_.transform)

				arg_786_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_786_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_786_1:RecordName(arg_786_1.leftNameTxt_.text)
				SetActive(arg_786_1.iconTrs_.gameObject, false)
				arg_786_1.callingController_:SetSelectedState("normal")

				local var_789_18 = arg_786_1:GetWordFromCfg(1108105189)
				local var_789_19 = arg_786_1:FormatText(var_789_18.content)

				arg_786_1.text_.text = var_789_19

				LuaForUtil.ClearLinePrefixSymbol(arg_786_1.text_)

				local var_789_20 = 14
				local var_789_21 = utf8.len(var_789_19)
				local var_789_22 = var_789_20 <= 0 and var_789_16 or var_789_16 * (var_789_21 / var_789_20)

				if var_789_22 > 0 and var_789_16 < var_789_22 then
					arg_786_1.talkMaxDuration = var_789_22

					if var_789_22 + var_789_15 > arg_786_1.duration_ then
						arg_786_1.duration_ = var_789_22 + var_789_15
					end
				end

				arg_786_1.text_.text = var_789_19
				arg_786_1.typewritter.percent = 0

				arg_786_1.typewritter:SetDirty()
				arg_786_1:ShowNextGo(false)
				arg_786_1:RecordContent(arg_786_1.text_.text)
			end

			local var_789_23 = math.max(var_789_16, arg_786_1.talkMaxDuration)

			if var_789_15 <= arg_786_1.time_ and arg_786_1.time_ < var_789_15 + var_789_23 then
				arg_786_1.typewritter.percent = (arg_786_1.time_ - var_789_15) / var_789_23

				arg_786_1.typewritter:SetDirty()
			end

			if arg_786_1.time_ >= var_789_15 + var_789_23 and arg_786_1.time_ < var_789_15 + var_789_23 + arg_789_0 then
				arg_786_1.typewritter.percent = 1

				arg_786_1.typewritter:SetDirty()
				arg_786_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105190 = function(arg_790_0, arg_790_1)
		arg_790_1.time_ = 0
		arg_790_1.frameCnt_ = 0
		arg_790_1.state_ = "playing"
		arg_790_1.curTalkId_ = 1108105190
		arg_790_1.duration_ = 5

		SetActive(arg_790_1.tipsGo_, false)

		function arg_790_1.onSingleLineFinish_()
			arg_790_1.onSingleLineUpdate_ = nil
			arg_790_1.onSingleLineFinish_ = nil
			arg_790_1.state_ = "waiting"
		end

		function arg_790_1.playNext_(arg_792_0)
			if arg_792_0 == 1 then
				arg_790_0:Play1108105191(arg_790_1)
			end
		end

		function arg_790_1.onSingleLineUpdate_(arg_793_0)
			local var_793_0 = arg_790_1.actors_["1081ui_story"]
			local var_793_1 = 0

			if var_793_1 < arg_790_1.time_ and arg_790_1.time_ <= var_793_1 + arg_793_0 and arg_790_1.var_.characterEffect1081ui_story == nil then
				arg_790_1.var_.characterEffect1081ui_story = var_793_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_793_2 = 0.0333333333333333

			if var_793_1 <= arg_790_1.time_ and arg_790_1.time_ < var_793_1 + var_793_2 then
				local var_793_3 = (arg_790_1.time_ - var_793_1) / var_793_2

				if arg_790_1.var_.characterEffect1081ui_story then
					local var_793_4 = Mathf.Lerp(0, 0.5, var_793_3)

					arg_790_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_790_1.var_.characterEffect1081ui_story.fillRatio = var_793_4
				end
			end

			if arg_790_1.time_ >= var_793_1 + var_793_2 and arg_790_1.time_ < var_793_1 + var_793_2 + arg_793_0 and arg_790_1.var_.characterEffect1081ui_story then
				local var_793_5 = 0.5

				arg_790_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_790_1.var_.characterEffect1081ui_story.fillRatio = var_793_5
			end

			local var_793_6 = 0
			local var_793_7 = 0.15

			if var_793_6 < arg_790_1.time_ and arg_790_1.time_ <= var_793_6 + arg_793_0 then
				arg_790_1.talkMaxDuration = 0
				arg_790_1.dialogCg_.alpha = 1

				arg_790_1.dialog_:SetActive(true)
				SetActive(arg_790_1.leftNameGo_, true)

				local var_793_8 = arg_790_1:FormatText(StoryNameCfg[7].name)

				arg_790_1.leftNameTxt_.text = var_793_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_790_1.leftNameTxt_.transform)

				arg_790_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_790_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_790_1:RecordName(arg_790_1.leftNameTxt_.text)
				SetActive(arg_790_1.iconTrs_.gameObject, false)
				arg_790_1.callingController_:SetSelectedState("normal")

				local var_793_9 = arg_790_1:GetWordFromCfg(1108105190)
				local var_793_10 = arg_790_1:FormatText(var_793_9.content)

				arg_790_1.text_.text = var_793_10

				LuaForUtil.ClearLinePrefixSymbol(arg_790_1.text_)

				local var_793_11 = 6
				local var_793_12 = utf8.len(var_793_10)
				local var_793_13 = var_793_11 <= 0 and var_793_7 or var_793_7 * (var_793_12 / var_793_11)

				if var_793_13 > 0 and var_793_7 < var_793_13 then
					arg_790_1.talkMaxDuration = var_793_13

					if var_793_13 + var_793_6 > arg_790_1.duration_ then
						arg_790_1.duration_ = var_793_13 + var_793_6
					end
				end

				arg_790_1.text_.text = var_793_10
				arg_790_1.typewritter.percent = 0

				arg_790_1.typewritter:SetDirty()
				arg_790_1:ShowNextGo(false)
				arg_790_1:RecordContent(arg_790_1.text_.text)
			end

			local var_793_14 = math.max(var_793_7, arg_790_1.talkMaxDuration)

			if var_793_6 <= arg_790_1.time_ and arg_790_1.time_ < var_793_6 + var_793_14 then
				arg_790_1.typewritter.percent = (arg_790_1.time_ - var_793_6) / var_793_14

				arg_790_1.typewritter:SetDirty()
			end

			if arg_790_1.time_ >= var_793_6 + var_793_14 and arg_790_1.time_ < var_793_6 + var_793_14 + arg_793_0 then
				arg_790_1.typewritter.percent = 1

				arg_790_1.typewritter:SetDirty()
				arg_790_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105191 = function(arg_794_0, arg_794_1)
		arg_794_1.time_ = 0
		arg_794_1.frameCnt_ = 0
		arg_794_1.state_ = "playing"
		arg_794_1.curTalkId_ = 1108105191
		arg_794_1.duration_ = 5

		SetActive(arg_794_1.tipsGo_, false)

		function arg_794_1.onSingleLineFinish_()
			arg_794_1.onSingleLineUpdate_ = nil
			arg_794_1.onSingleLineFinish_ = nil
			arg_794_1.state_ = "waiting"
		end

		function arg_794_1.playNext_(arg_796_0)
			if arg_796_0 == 1 then
				arg_794_0:Play1108105192(arg_794_1)
			end
		end

		function arg_794_1.onSingleLineUpdate_(arg_797_0)
			local var_797_0 = 0
			local var_797_1 = 0.4

			if var_797_0 < arg_794_1.time_ and arg_794_1.time_ <= var_797_0 + arg_797_0 then
				arg_794_1.talkMaxDuration = 0
				arg_794_1.dialogCg_.alpha = 1

				arg_794_1.dialog_:SetActive(true)
				SetActive(arg_794_1.leftNameGo_, true)

				local var_797_2 = arg_794_1:FormatText(StoryNameCfg[7].name)

				arg_794_1.leftNameTxt_.text = var_797_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_794_1.leftNameTxt_.transform)

				arg_794_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_794_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_794_1:RecordName(arg_794_1.leftNameTxt_.text)
				SetActive(arg_794_1.iconTrs_.gameObject, false)
				arg_794_1.callingController_:SetSelectedState("normal")

				local var_797_3 = arg_794_1:GetWordFromCfg(1108105191)
				local var_797_4 = arg_794_1:FormatText(var_797_3.content)

				arg_794_1.text_.text = var_797_4

				LuaForUtil.ClearLinePrefixSymbol(arg_794_1.text_)

				local var_797_5 = 16
				local var_797_6 = utf8.len(var_797_4)
				local var_797_7 = var_797_5 <= 0 and var_797_1 or var_797_1 * (var_797_6 / var_797_5)

				if var_797_7 > 0 and var_797_1 < var_797_7 then
					arg_794_1.talkMaxDuration = var_797_7

					if var_797_7 + var_797_0 > arg_794_1.duration_ then
						arg_794_1.duration_ = var_797_7 + var_797_0
					end
				end

				arg_794_1.text_.text = var_797_4
				arg_794_1.typewritter.percent = 0

				arg_794_1.typewritter:SetDirty()
				arg_794_1:ShowNextGo(false)
				arg_794_1:RecordContent(arg_794_1.text_.text)
			end

			local var_797_8 = math.max(var_797_1, arg_794_1.talkMaxDuration)

			if var_797_0 <= arg_794_1.time_ and arg_794_1.time_ < var_797_0 + var_797_8 then
				arg_794_1.typewritter.percent = (arg_794_1.time_ - var_797_0) / var_797_8

				arg_794_1.typewritter:SetDirty()
			end

			if arg_794_1.time_ >= var_797_0 + var_797_8 and arg_794_1.time_ < var_797_0 + var_797_8 + arg_797_0 then
				arg_794_1.typewritter.percent = 1

				arg_794_1.typewritter:SetDirty()
				arg_794_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105192 = function(arg_798_0, arg_798_1)
		arg_798_1.time_ = 0
		arg_798_1.frameCnt_ = 0
		arg_798_1.state_ = "playing"
		arg_798_1.curTalkId_ = 1108105192
		arg_798_1.duration_ = 5

		SetActive(arg_798_1.tipsGo_, false)

		function arg_798_1.onSingleLineFinish_()
			arg_798_1.onSingleLineUpdate_ = nil
			arg_798_1.onSingleLineFinish_ = nil
			arg_798_1.state_ = "waiting"
		end

		function arg_798_1.playNext_(arg_800_0)
			if arg_800_0 == 1 then
				arg_798_0:Play1108105193(arg_798_1)
			end
		end

		function arg_798_1.onSingleLineUpdate_(arg_801_0)
			local var_801_0 = arg_798_1.actors_["1081ui_story"].transform
			local var_801_1 = 0

			if var_801_1 < arg_798_1.time_ and arg_798_1.time_ <= var_801_1 + arg_801_0 then
				arg_798_1.var_.moveOldPos1081ui_story = var_801_0.localPosition
			end

			local var_801_2 = 0.001

			if var_801_1 <= arg_798_1.time_ and arg_798_1.time_ < var_801_1 + var_801_2 then
				local var_801_3 = (arg_798_1.time_ - var_801_1) / var_801_2
				local var_801_4 = Vector3.New(0, -0.92, -5.8)

				var_801_0.localPosition = Vector3.Lerp(arg_798_1.var_.moveOldPos1081ui_story, var_801_4, var_801_3)

				local var_801_5 = manager.ui.mainCamera.transform.position - var_801_0.position

				var_801_0.forward = Vector3.New(var_801_5.x, var_801_5.y, var_801_5.z)

				local var_801_6 = var_801_0.localEulerAngles

				var_801_6.z = 0
				var_801_6.x = 0
				var_801_0.localEulerAngles = var_801_6
			end

			if arg_798_1.time_ >= var_801_1 + var_801_2 and arg_798_1.time_ < var_801_1 + var_801_2 + arg_801_0 then
				var_801_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_801_7 = manager.ui.mainCamera.transform.position - var_801_0.position

				var_801_0.forward = Vector3.New(var_801_7.x, var_801_7.y, var_801_7.z)

				local var_801_8 = var_801_0.localEulerAngles

				var_801_8.z = 0
				var_801_8.x = 0
				var_801_0.localEulerAngles = var_801_8
			end

			local var_801_9 = arg_798_1.actors_["1081ui_story"]
			local var_801_10 = 0

			if var_801_10 < arg_798_1.time_ and arg_798_1.time_ <= var_801_10 + arg_801_0 and arg_798_1.var_.characterEffect1081ui_story == nil then
				arg_798_1.var_.characterEffect1081ui_story = var_801_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_801_11 = 0.200000002980232

			if var_801_10 <= arg_798_1.time_ and arg_798_1.time_ < var_801_10 + var_801_11 then
				local var_801_12 = (arg_798_1.time_ - var_801_10) / var_801_11

				if arg_798_1.var_.characterEffect1081ui_story then
					arg_798_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_798_1.time_ >= var_801_10 + var_801_11 and arg_798_1.time_ < var_801_10 + var_801_11 + arg_801_0 and arg_798_1.var_.characterEffect1081ui_story then
				arg_798_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_801_13 = 0

			if var_801_13 < arg_798_1.time_ and arg_798_1.time_ <= var_801_13 + arg_801_0 then
				arg_798_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_801_14 = 0

			if var_801_14 < arg_798_1.time_ and arg_798_1.time_ <= var_801_14 + arg_801_0 then
				arg_798_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_801_15 = 0
			local var_801_16 = 0.575

			if var_801_15 < arg_798_1.time_ and arg_798_1.time_ <= var_801_15 + arg_801_0 then
				arg_798_1.talkMaxDuration = 0
				arg_798_1.dialogCg_.alpha = 1

				arg_798_1.dialog_:SetActive(true)
				SetActive(arg_798_1.leftNameGo_, true)

				local var_801_17 = arg_798_1:FormatText(StoryNameCfg[202].name)

				arg_798_1.leftNameTxt_.text = var_801_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_798_1.leftNameTxt_.transform)

				arg_798_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_798_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_798_1:RecordName(arg_798_1.leftNameTxt_.text)
				SetActive(arg_798_1.iconTrs_.gameObject, false)
				arg_798_1.callingController_:SetSelectedState("normal")

				local var_801_18 = arg_798_1:GetWordFromCfg(1108105192)
				local var_801_19 = arg_798_1:FormatText(var_801_18.content)

				arg_798_1.text_.text = var_801_19

				LuaForUtil.ClearLinePrefixSymbol(arg_798_1.text_)

				local var_801_20 = 23
				local var_801_21 = utf8.len(var_801_19)
				local var_801_22 = var_801_20 <= 0 and var_801_16 or var_801_16 * (var_801_21 / var_801_20)

				if var_801_22 > 0 and var_801_16 < var_801_22 then
					arg_798_1.talkMaxDuration = var_801_22

					if var_801_22 + var_801_15 > arg_798_1.duration_ then
						arg_798_1.duration_ = var_801_22 + var_801_15
					end
				end

				arg_798_1.text_.text = var_801_19
				arg_798_1.typewritter.percent = 0

				arg_798_1.typewritter:SetDirty()
				arg_798_1:ShowNextGo(false)
				arg_798_1:RecordContent(arg_798_1.text_.text)
			end

			local var_801_23 = math.max(var_801_16, arg_798_1.talkMaxDuration)

			if var_801_15 <= arg_798_1.time_ and arg_798_1.time_ < var_801_15 + var_801_23 then
				arg_798_1.typewritter.percent = (arg_798_1.time_ - var_801_15) / var_801_23

				arg_798_1.typewritter:SetDirty()
			end

			if arg_798_1.time_ >= var_801_15 + var_801_23 and arg_798_1.time_ < var_801_15 + var_801_23 + arg_801_0 then
				arg_798_1.typewritter.percent = 1

				arg_798_1.typewritter:SetDirty()
				arg_798_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105193 = function(arg_802_0, arg_802_1)
		arg_802_1.time_ = 0
		arg_802_1.frameCnt_ = 0
		arg_802_1.state_ = "playing"
		arg_802_1.curTalkId_ = 1108105193
		arg_802_1.duration_ = 5

		SetActive(arg_802_1.tipsGo_, false)

		function arg_802_1.onSingleLineFinish_()
			arg_802_1.onSingleLineUpdate_ = nil
			arg_802_1.onSingleLineFinish_ = nil
			arg_802_1.state_ = "waiting"
		end

		function arg_802_1.playNext_(arg_804_0)
			if arg_804_0 == 1 then
				arg_802_0:Play1108105194(arg_802_1)
			end
		end

		function arg_802_1.onSingleLineUpdate_(arg_805_0)
			local var_805_0 = arg_802_1.actors_["1081ui_story"]
			local var_805_1 = 0

			if var_805_1 < arg_802_1.time_ and arg_802_1.time_ <= var_805_1 + arg_805_0 and arg_802_1.var_.characterEffect1081ui_story == nil then
				arg_802_1.var_.characterEffect1081ui_story = var_805_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_805_2 = 0.0166666666666667

			if var_805_1 <= arg_802_1.time_ and arg_802_1.time_ < var_805_1 + var_805_2 then
				local var_805_3 = (arg_802_1.time_ - var_805_1) / var_805_2

				if arg_802_1.var_.characterEffect1081ui_story then
					local var_805_4 = Mathf.Lerp(0, 0.5, var_805_3)

					arg_802_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_802_1.var_.characterEffect1081ui_story.fillRatio = var_805_4
				end
			end

			if arg_802_1.time_ >= var_805_1 + var_805_2 and arg_802_1.time_ < var_805_1 + var_805_2 + arg_805_0 and arg_802_1.var_.characterEffect1081ui_story then
				local var_805_5 = 0.5

				arg_802_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_802_1.var_.characterEffect1081ui_story.fillRatio = var_805_5
			end

			local var_805_6 = arg_802_1.actors_["1081ui_story"].transform
			local var_805_7 = 0

			if var_805_7 < arg_802_1.time_ and arg_802_1.time_ <= var_805_7 + arg_805_0 then
				arg_802_1.var_.moveOldPos1081ui_story = var_805_6.localPosition
			end

			local var_805_8 = 0.001

			if var_805_7 <= arg_802_1.time_ and arg_802_1.time_ < var_805_7 + var_805_8 then
				local var_805_9 = (arg_802_1.time_ - var_805_7) / var_805_8
				local var_805_10 = Vector3.New(0, 100, 0)

				var_805_6.localPosition = Vector3.Lerp(arg_802_1.var_.moveOldPos1081ui_story, var_805_10, var_805_9)

				local var_805_11 = manager.ui.mainCamera.transform.position - var_805_6.position

				var_805_6.forward = Vector3.New(var_805_11.x, var_805_11.y, var_805_11.z)

				local var_805_12 = var_805_6.localEulerAngles

				var_805_12.z = 0
				var_805_12.x = 0
				var_805_6.localEulerAngles = var_805_12
			end

			if arg_802_1.time_ >= var_805_7 + var_805_8 and arg_802_1.time_ < var_805_7 + var_805_8 + arg_805_0 then
				var_805_6.localPosition = Vector3.New(0, 100, 0)

				local var_805_13 = manager.ui.mainCamera.transform.position - var_805_6.position

				var_805_6.forward = Vector3.New(var_805_13.x, var_805_13.y, var_805_13.z)

				local var_805_14 = var_805_6.localEulerAngles

				var_805_14.z = 0
				var_805_14.x = 0
				var_805_6.localEulerAngles = var_805_14
			end

			local var_805_15 = 0
			local var_805_16 = 1.1

			if var_805_15 < arg_802_1.time_ and arg_802_1.time_ <= var_805_15 + arg_805_0 then
				arg_802_1.talkMaxDuration = 0
				arg_802_1.dialogCg_.alpha = 1

				arg_802_1.dialog_:SetActive(true)
				SetActive(arg_802_1.leftNameGo_, false)

				arg_802_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_802_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_802_1:RecordName(arg_802_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_802_1.iconTrs_.gameObject, false)
				arg_802_1.callingController_:SetSelectedState("normal")

				local var_805_17 = arg_802_1:GetWordFromCfg(1108105193)
				local var_805_18 = arg_802_1:FormatText(var_805_17.content)

				arg_802_1.text_.text = var_805_18

				LuaForUtil.ClearLinePrefixSymbol(arg_802_1.text_)

				local var_805_19 = 44
				local var_805_20 = utf8.len(var_805_18)
				local var_805_21 = var_805_19 <= 0 and var_805_16 or var_805_16 * (var_805_20 / var_805_19)

				if var_805_21 > 0 and var_805_16 < var_805_21 then
					arg_802_1.talkMaxDuration = var_805_21

					if var_805_21 + var_805_15 > arg_802_1.duration_ then
						arg_802_1.duration_ = var_805_21 + var_805_15
					end
				end

				arg_802_1.text_.text = var_805_18
				arg_802_1.typewritter.percent = 0

				arg_802_1.typewritter:SetDirty()
				arg_802_1:ShowNextGo(false)
				arg_802_1:RecordContent(arg_802_1.text_.text)
			end

			local var_805_22 = math.max(var_805_16, arg_802_1.talkMaxDuration)

			if var_805_15 <= arg_802_1.time_ and arg_802_1.time_ < var_805_15 + var_805_22 then
				arg_802_1.typewritter.percent = (arg_802_1.time_ - var_805_15) / var_805_22

				arg_802_1.typewritter:SetDirty()
			end

			if arg_802_1.time_ >= var_805_15 + var_805_22 and arg_802_1.time_ < var_805_15 + var_805_22 + arg_805_0 then
				arg_802_1.typewritter.percent = 1

				arg_802_1.typewritter:SetDirty()
				arg_802_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105194 = function(arg_806_0, arg_806_1)
		arg_806_1.time_ = 0
		arg_806_1.frameCnt_ = 0
		arg_806_1.state_ = "playing"
		arg_806_1.curTalkId_ = 1108105194
		arg_806_1.duration_ = 5

		SetActive(arg_806_1.tipsGo_, false)

		function arg_806_1.onSingleLineFinish_()
			arg_806_1.onSingleLineUpdate_ = nil
			arg_806_1.onSingleLineFinish_ = nil
			arg_806_1.state_ = "waiting"
		end

		function arg_806_1.playNext_(arg_808_0)
			if arg_808_0 == 1 then
				arg_806_0:Play1108105195(arg_806_1)
			end
		end

		function arg_806_1.onSingleLineUpdate_(arg_809_0)
			local var_809_0 = arg_806_1.actors_["1081ui_story"].transform
			local var_809_1 = 0

			if var_809_1 < arg_806_1.time_ and arg_806_1.time_ <= var_809_1 + arg_809_0 then
				arg_806_1.var_.moveOldPos1081ui_story = var_809_0.localPosition
			end

			local var_809_2 = 0.001

			if var_809_1 <= arg_806_1.time_ and arg_806_1.time_ < var_809_1 + var_809_2 then
				local var_809_3 = (arg_806_1.time_ - var_809_1) / var_809_2
				local var_809_4 = Vector3.New(0, 100, 0)

				var_809_0.localPosition = Vector3.Lerp(arg_806_1.var_.moveOldPos1081ui_story, var_809_4, var_809_3)

				local var_809_5 = manager.ui.mainCamera.transform.position - var_809_0.position

				var_809_0.forward = Vector3.New(var_809_5.x, var_809_5.y, var_809_5.z)

				local var_809_6 = var_809_0.localEulerAngles

				var_809_6.z = 0
				var_809_6.x = 0
				var_809_0.localEulerAngles = var_809_6
			end

			if arg_806_1.time_ >= var_809_1 + var_809_2 and arg_806_1.time_ < var_809_1 + var_809_2 + arg_809_0 then
				var_809_0.localPosition = Vector3.New(0, 100, 0)

				local var_809_7 = manager.ui.mainCamera.transform.position - var_809_0.position

				var_809_0.forward = Vector3.New(var_809_7.x, var_809_7.y, var_809_7.z)

				local var_809_8 = var_809_0.localEulerAngles

				var_809_8.z = 0
				var_809_8.x = 0
				var_809_0.localEulerAngles = var_809_8
			end

			local var_809_9 = 0
			local var_809_10 = 1.425

			if var_809_9 < arg_806_1.time_ and arg_806_1.time_ <= var_809_9 + arg_809_0 then
				arg_806_1.talkMaxDuration = 0
				arg_806_1.dialogCg_.alpha = 1

				arg_806_1.dialog_:SetActive(true)
				SetActive(arg_806_1.leftNameGo_, false)

				arg_806_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_806_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_806_1:RecordName(arg_806_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_806_1.iconTrs_.gameObject, false)
				arg_806_1.callingController_:SetSelectedState("normal")

				local var_809_11 = arg_806_1:GetWordFromCfg(1108105194)
				local var_809_12 = arg_806_1:FormatText(var_809_11.content)

				arg_806_1.text_.text = var_809_12

				LuaForUtil.ClearLinePrefixSymbol(arg_806_1.text_)

				local var_809_13 = 57
				local var_809_14 = utf8.len(var_809_12)
				local var_809_15 = var_809_13 <= 0 and var_809_10 or var_809_10 * (var_809_14 / var_809_13)

				if var_809_15 > 0 and var_809_10 < var_809_15 then
					arg_806_1.talkMaxDuration = var_809_15

					if var_809_15 + var_809_9 > arg_806_1.duration_ then
						arg_806_1.duration_ = var_809_15 + var_809_9
					end
				end

				arg_806_1.text_.text = var_809_12
				arg_806_1.typewritter.percent = 0

				arg_806_1.typewritter:SetDirty()
				arg_806_1:ShowNextGo(false)
				arg_806_1:RecordContent(arg_806_1.text_.text)
			end

			local var_809_16 = math.max(var_809_10, arg_806_1.talkMaxDuration)

			if var_809_9 <= arg_806_1.time_ and arg_806_1.time_ < var_809_9 + var_809_16 then
				arg_806_1.typewritter.percent = (arg_806_1.time_ - var_809_9) / var_809_16

				arg_806_1.typewritter:SetDirty()
			end

			if arg_806_1.time_ >= var_809_9 + var_809_16 and arg_806_1.time_ < var_809_9 + var_809_16 + arg_809_0 then
				arg_806_1.typewritter.percent = 1

				arg_806_1.typewritter:SetDirty()
				arg_806_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105195 = function(arg_810_0, arg_810_1)
		arg_810_1.time_ = 0
		arg_810_1.frameCnt_ = 0
		arg_810_1.state_ = "playing"
		arg_810_1.curTalkId_ = 1108105195
		arg_810_1.duration_ = 5

		SetActive(arg_810_1.tipsGo_, false)

		function arg_810_1.onSingleLineFinish_()
			arg_810_1.onSingleLineUpdate_ = nil
			arg_810_1.onSingleLineFinish_ = nil
			arg_810_1.state_ = "waiting"
		end

		function arg_810_1.playNext_(arg_812_0)
			if arg_812_0 == 1 then
				arg_810_0:Play1108105196(arg_810_1)
			end
		end

		function arg_810_1.onSingleLineUpdate_(arg_813_0)
			local var_813_0 = 0
			local var_813_1 = 0.6

			if var_813_0 < arg_810_1.time_ and arg_810_1.time_ <= var_813_0 + arg_813_0 then
				arg_810_1.talkMaxDuration = 0
				arg_810_1.dialogCg_.alpha = 1

				arg_810_1.dialog_:SetActive(true)
				SetActive(arg_810_1.leftNameGo_, true)

				local var_813_2 = arg_810_1:FormatText(StoryNameCfg[7].name)

				arg_810_1.leftNameTxt_.text = var_813_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_810_1.leftNameTxt_.transform)

				arg_810_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_810_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_810_1:RecordName(arg_810_1.leftNameTxt_.text)
				SetActive(arg_810_1.iconTrs_.gameObject, false)
				arg_810_1.callingController_:SetSelectedState("normal")

				local var_813_3 = arg_810_1:GetWordFromCfg(1108105195)
				local var_813_4 = arg_810_1:FormatText(var_813_3.content)

				arg_810_1.text_.text = var_813_4

				LuaForUtil.ClearLinePrefixSymbol(arg_810_1.text_)

				local var_813_5 = 24
				local var_813_6 = utf8.len(var_813_4)
				local var_813_7 = var_813_5 <= 0 and var_813_1 or var_813_1 * (var_813_6 / var_813_5)

				if var_813_7 > 0 and var_813_1 < var_813_7 then
					arg_810_1.talkMaxDuration = var_813_7

					if var_813_7 + var_813_0 > arg_810_1.duration_ then
						arg_810_1.duration_ = var_813_7 + var_813_0
					end
				end

				arg_810_1.text_.text = var_813_4
				arg_810_1.typewritter.percent = 0

				arg_810_1.typewritter:SetDirty()
				arg_810_1:ShowNextGo(false)
				arg_810_1:RecordContent(arg_810_1.text_.text)
			end

			local var_813_8 = math.max(var_813_1, arg_810_1.talkMaxDuration)

			if var_813_0 <= arg_810_1.time_ and arg_810_1.time_ < var_813_0 + var_813_8 then
				arg_810_1.typewritter.percent = (arg_810_1.time_ - var_813_0) / var_813_8

				arg_810_1.typewritter:SetDirty()
			end

			if arg_810_1.time_ >= var_813_0 + var_813_8 and arg_810_1.time_ < var_813_0 + var_813_8 + arg_813_0 then
				arg_810_1.typewritter.percent = 1

				arg_810_1.typewritter:SetDirty()
				arg_810_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105196 = function(arg_814_0, arg_814_1)
		arg_814_1.time_ = 0
		arg_814_1.frameCnt_ = 0
		arg_814_1.state_ = "playing"
		arg_814_1.curTalkId_ = 1108105196
		arg_814_1.duration_ = 5

		SetActive(arg_814_1.tipsGo_, false)

		function arg_814_1.onSingleLineFinish_()
			arg_814_1.onSingleLineUpdate_ = nil
			arg_814_1.onSingleLineFinish_ = nil
			arg_814_1.state_ = "waiting"
		end

		function arg_814_1.playNext_(arg_816_0)
			if arg_816_0 == 1 then
				arg_814_0:Play1108105197(arg_814_1)
			end
		end

		function arg_814_1.onSingleLineUpdate_(arg_817_0)
			local var_817_0 = arg_814_1.actors_["1081ui_story"].transform
			local var_817_1 = 0

			if var_817_1 < arg_814_1.time_ and arg_814_1.time_ <= var_817_1 + arg_817_0 then
				arg_814_1.var_.moveOldPos1081ui_story = var_817_0.localPosition
			end

			local var_817_2 = 0.001

			if var_817_1 <= arg_814_1.time_ and arg_814_1.time_ < var_817_1 + var_817_2 then
				local var_817_3 = (arg_814_1.time_ - var_817_1) / var_817_2
				local var_817_4 = Vector3.New(0, -0.92, -5.8)

				var_817_0.localPosition = Vector3.Lerp(arg_814_1.var_.moveOldPos1081ui_story, var_817_4, var_817_3)

				local var_817_5 = manager.ui.mainCamera.transform.position - var_817_0.position

				var_817_0.forward = Vector3.New(var_817_5.x, var_817_5.y, var_817_5.z)

				local var_817_6 = var_817_0.localEulerAngles

				var_817_6.z = 0
				var_817_6.x = 0
				var_817_0.localEulerAngles = var_817_6
			end

			if arg_814_1.time_ >= var_817_1 + var_817_2 and arg_814_1.time_ < var_817_1 + var_817_2 + arg_817_0 then
				var_817_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_817_7 = manager.ui.mainCamera.transform.position - var_817_0.position

				var_817_0.forward = Vector3.New(var_817_7.x, var_817_7.y, var_817_7.z)

				local var_817_8 = var_817_0.localEulerAngles

				var_817_8.z = 0
				var_817_8.x = 0
				var_817_0.localEulerAngles = var_817_8
			end

			local var_817_9 = arg_814_1.actors_["1081ui_story"]
			local var_817_10 = 0

			if var_817_10 < arg_814_1.time_ and arg_814_1.time_ <= var_817_10 + arg_817_0 and arg_814_1.var_.characterEffect1081ui_story == nil then
				arg_814_1.var_.characterEffect1081ui_story = var_817_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_817_11 = 0.200000002980232

			if var_817_10 <= arg_814_1.time_ and arg_814_1.time_ < var_817_10 + var_817_11 then
				local var_817_12 = (arg_814_1.time_ - var_817_10) / var_817_11

				if arg_814_1.var_.characterEffect1081ui_story then
					arg_814_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_814_1.time_ >= var_817_10 + var_817_11 and arg_814_1.time_ < var_817_10 + var_817_11 + arg_817_0 and arg_814_1.var_.characterEffect1081ui_story then
				arg_814_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_817_13 = 0

			if var_817_13 < arg_814_1.time_ and arg_814_1.time_ <= var_817_13 + arg_817_0 then
				arg_814_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_817_14 = 0

			if var_817_14 < arg_814_1.time_ and arg_814_1.time_ <= var_817_14 + arg_817_0 then
				arg_814_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_817_15 = 0
			local var_817_16 = 0.4

			if var_817_15 < arg_814_1.time_ and arg_814_1.time_ <= var_817_15 + arg_817_0 then
				arg_814_1.talkMaxDuration = 0
				arg_814_1.dialogCg_.alpha = 1

				arg_814_1.dialog_:SetActive(true)
				SetActive(arg_814_1.leftNameGo_, true)

				local var_817_17 = arg_814_1:FormatText(StoryNameCfg[202].name)

				arg_814_1.leftNameTxt_.text = var_817_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_814_1.leftNameTxt_.transform)

				arg_814_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_814_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_814_1:RecordName(arg_814_1.leftNameTxt_.text)
				SetActive(arg_814_1.iconTrs_.gameObject, false)
				arg_814_1.callingController_:SetSelectedState("normal")

				local var_817_18 = arg_814_1:GetWordFromCfg(1108105196)
				local var_817_19 = arg_814_1:FormatText(var_817_18.content)

				arg_814_1.text_.text = var_817_19

				LuaForUtil.ClearLinePrefixSymbol(arg_814_1.text_)

				local var_817_20 = 16
				local var_817_21 = utf8.len(var_817_19)
				local var_817_22 = var_817_20 <= 0 and var_817_16 or var_817_16 * (var_817_21 / var_817_20)

				if var_817_22 > 0 and var_817_16 < var_817_22 then
					arg_814_1.talkMaxDuration = var_817_22

					if var_817_22 + var_817_15 > arg_814_1.duration_ then
						arg_814_1.duration_ = var_817_22 + var_817_15
					end
				end

				arg_814_1.text_.text = var_817_19
				arg_814_1.typewritter.percent = 0

				arg_814_1.typewritter:SetDirty()
				arg_814_1:ShowNextGo(false)
				arg_814_1:RecordContent(arg_814_1.text_.text)
			end

			local var_817_23 = math.max(var_817_16, arg_814_1.talkMaxDuration)

			if var_817_15 <= arg_814_1.time_ and arg_814_1.time_ < var_817_15 + var_817_23 then
				arg_814_1.typewritter.percent = (arg_814_1.time_ - var_817_15) / var_817_23

				arg_814_1.typewritter:SetDirty()
			end

			if arg_814_1.time_ >= var_817_15 + var_817_23 and arg_814_1.time_ < var_817_15 + var_817_23 + arg_817_0 then
				arg_814_1.typewritter.percent = 1

				arg_814_1.typewritter:SetDirty()
				arg_814_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105197 = function(arg_818_0, arg_818_1)
		arg_818_1.time_ = 0
		arg_818_1.frameCnt_ = 0
		arg_818_1.state_ = "playing"
		arg_818_1.curTalkId_ = 1108105197
		arg_818_1.duration_ = 5

		SetActive(arg_818_1.tipsGo_, false)

		function arg_818_1.onSingleLineFinish_()
			arg_818_1.onSingleLineUpdate_ = nil
			arg_818_1.onSingleLineFinish_ = nil
			arg_818_1.state_ = "waiting"
		end

		function arg_818_1.playNext_(arg_820_0)
			if arg_820_0 == 1 then
				arg_818_0:Play1108105198(arg_818_1)
			end
		end

		function arg_818_1.onSingleLineUpdate_(arg_821_0)
			local var_821_0 = arg_818_1.actors_["1081ui_story"]
			local var_821_1 = 0

			if var_821_1 < arg_818_1.time_ and arg_818_1.time_ <= var_821_1 + arg_821_0 and arg_818_1.var_.characterEffect1081ui_story == nil then
				arg_818_1.var_.characterEffect1081ui_story = var_821_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_821_2 = 0.200000002980232

			if var_821_1 <= arg_818_1.time_ and arg_818_1.time_ < var_821_1 + var_821_2 then
				local var_821_3 = (arg_818_1.time_ - var_821_1) / var_821_2

				if arg_818_1.var_.characterEffect1081ui_story then
					local var_821_4 = Mathf.Lerp(0, 0.5, var_821_3)

					arg_818_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_818_1.var_.characterEffect1081ui_story.fillRatio = var_821_4
				end
			end

			if arg_818_1.time_ >= var_821_1 + var_821_2 and arg_818_1.time_ < var_821_1 + var_821_2 + arg_821_0 and arg_818_1.var_.characterEffect1081ui_story then
				local var_821_5 = 0.5

				arg_818_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_818_1.var_.characterEffect1081ui_story.fillRatio = var_821_5
			end

			local var_821_6 = 0
			local var_821_7 = 0.175

			if var_821_6 < arg_818_1.time_ and arg_818_1.time_ <= var_821_6 + arg_821_0 then
				arg_818_1.talkMaxDuration = 0
				arg_818_1.dialogCg_.alpha = 1

				arg_818_1.dialog_:SetActive(true)
				SetActive(arg_818_1.leftNameGo_, true)

				local var_821_8 = arg_818_1:FormatText(StoryNameCfg[7].name)

				arg_818_1.leftNameTxt_.text = var_821_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_818_1.leftNameTxt_.transform)

				arg_818_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_818_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_818_1:RecordName(arg_818_1.leftNameTxt_.text)
				SetActive(arg_818_1.iconTrs_.gameObject, false)
				arg_818_1.callingController_:SetSelectedState("normal")

				local var_821_9 = arg_818_1:GetWordFromCfg(1108105197)
				local var_821_10 = arg_818_1:FormatText(var_821_9.content)

				arg_818_1.text_.text = var_821_10

				LuaForUtil.ClearLinePrefixSymbol(arg_818_1.text_)

				local var_821_11 = 7
				local var_821_12 = utf8.len(var_821_10)
				local var_821_13 = var_821_11 <= 0 and var_821_7 or var_821_7 * (var_821_12 / var_821_11)

				if var_821_13 > 0 and var_821_7 < var_821_13 then
					arg_818_1.talkMaxDuration = var_821_13

					if var_821_13 + var_821_6 > arg_818_1.duration_ then
						arg_818_1.duration_ = var_821_13 + var_821_6
					end
				end

				arg_818_1.text_.text = var_821_10
				arg_818_1.typewritter.percent = 0

				arg_818_1.typewritter:SetDirty()
				arg_818_1:ShowNextGo(false)
				arg_818_1:RecordContent(arg_818_1.text_.text)
			end

			local var_821_14 = math.max(var_821_7, arg_818_1.talkMaxDuration)

			if var_821_6 <= arg_818_1.time_ and arg_818_1.time_ < var_821_6 + var_821_14 then
				arg_818_1.typewritter.percent = (arg_818_1.time_ - var_821_6) / var_821_14

				arg_818_1.typewritter:SetDirty()
			end

			if arg_818_1.time_ >= var_821_6 + var_821_14 and arg_818_1.time_ < var_821_6 + var_821_14 + arg_821_0 then
				arg_818_1.typewritter.percent = 1

				arg_818_1.typewritter:SetDirty()
				arg_818_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105198 = function(arg_822_0, arg_822_1)
		arg_822_1.time_ = 0
		arg_822_1.frameCnt_ = 0
		arg_822_1.state_ = "playing"
		arg_822_1.curTalkId_ = 1108105198
		arg_822_1.duration_ = 5

		SetActive(arg_822_1.tipsGo_, false)

		function arg_822_1.onSingleLineFinish_()
			arg_822_1.onSingleLineUpdate_ = nil
			arg_822_1.onSingleLineFinish_ = nil
			arg_822_1.state_ = "waiting"
		end

		function arg_822_1.playNext_(arg_824_0)
			if arg_824_0 == 1 then
				arg_822_0:Play1108105199(arg_822_1)
			end
		end

		function arg_822_1.onSingleLineUpdate_(arg_825_0)
			local var_825_0 = arg_822_1.actors_["1081ui_story"].transform
			local var_825_1 = 0

			if var_825_1 < arg_822_1.time_ and arg_822_1.time_ <= var_825_1 + arg_825_0 then
				arg_822_1.var_.moveOldPos1081ui_story = var_825_0.localPosition
			end

			local var_825_2 = 0.001

			if var_825_1 <= arg_822_1.time_ and arg_822_1.time_ < var_825_1 + var_825_2 then
				local var_825_3 = (arg_822_1.time_ - var_825_1) / var_825_2
				local var_825_4 = Vector3.New(0, 100, 0)

				var_825_0.localPosition = Vector3.Lerp(arg_822_1.var_.moveOldPos1081ui_story, var_825_4, var_825_3)

				local var_825_5 = manager.ui.mainCamera.transform.position - var_825_0.position

				var_825_0.forward = Vector3.New(var_825_5.x, var_825_5.y, var_825_5.z)

				local var_825_6 = var_825_0.localEulerAngles

				var_825_6.z = 0
				var_825_6.x = 0
				var_825_0.localEulerAngles = var_825_6
			end

			if arg_822_1.time_ >= var_825_1 + var_825_2 and arg_822_1.time_ < var_825_1 + var_825_2 + arg_825_0 then
				var_825_0.localPosition = Vector3.New(0, 100, 0)

				local var_825_7 = manager.ui.mainCamera.transform.position - var_825_0.position

				var_825_0.forward = Vector3.New(var_825_7.x, var_825_7.y, var_825_7.z)

				local var_825_8 = var_825_0.localEulerAngles

				var_825_8.z = 0
				var_825_8.x = 0
				var_825_0.localEulerAngles = var_825_8
			end

			local var_825_9 = 0
			local var_825_10 = 0.725

			if var_825_9 < arg_822_1.time_ and arg_822_1.time_ <= var_825_9 + arg_825_0 then
				arg_822_1.talkMaxDuration = 0
				arg_822_1.dialogCg_.alpha = 1

				arg_822_1.dialog_:SetActive(true)
				SetActive(arg_822_1.leftNameGo_, false)

				arg_822_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_822_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_822_1:RecordName(arg_822_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_822_1.iconTrs_.gameObject, false)
				arg_822_1.callingController_:SetSelectedState("normal")

				local var_825_11 = arg_822_1:GetWordFromCfg(1108105198)
				local var_825_12 = arg_822_1:FormatText(var_825_11.content)

				arg_822_1.text_.text = var_825_12

				LuaForUtil.ClearLinePrefixSymbol(arg_822_1.text_)

				local var_825_13 = 29
				local var_825_14 = utf8.len(var_825_12)
				local var_825_15 = var_825_13 <= 0 and var_825_10 or var_825_10 * (var_825_14 / var_825_13)

				if var_825_15 > 0 and var_825_10 < var_825_15 then
					arg_822_1.talkMaxDuration = var_825_15

					if var_825_15 + var_825_9 > arg_822_1.duration_ then
						arg_822_1.duration_ = var_825_15 + var_825_9
					end
				end

				arg_822_1.text_.text = var_825_12
				arg_822_1.typewritter.percent = 0

				arg_822_1.typewritter:SetDirty()
				arg_822_1:ShowNextGo(false)
				arg_822_1:RecordContent(arg_822_1.text_.text)
			end

			local var_825_16 = math.max(var_825_10, arg_822_1.talkMaxDuration)

			if var_825_9 <= arg_822_1.time_ and arg_822_1.time_ < var_825_9 + var_825_16 then
				arg_822_1.typewritter.percent = (arg_822_1.time_ - var_825_9) / var_825_16

				arg_822_1.typewritter:SetDirty()
			end

			if arg_822_1.time_ >= var_825_9 + var_825_16 and arg_822_1.time_ < var_825_9 + var_825_16 + arg_825_0 then
				arg_822_1.typewritter.percent = 1

				arg_822_1.typewritter:SetDirty()
				arg_822_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105199 = function(arg_826_0, arg_826_1)
		arg_826_1.time_ = 0
		arg_826_1.frameCnt_ = 0
		arg_826_1.state_ = "playing"
		arg_826_1.curTalkId_ = 1108105199
		arg_826_1.duration_ = 5

		SetActive(arg_826_1.tipsGo_, false)

		function arg_826_1.onSingleLineFinish_()
			arg_826_1.onSingleLineUpdate_ = nil
			arg_826_1.onSingleLineFinish_ = nil
			arg_826_1.state_ = "waiting"
		end

		function arg_826_1.playNext_(arg_828_0)
			if arg_828_0 == 1 then
				arg_826_0:Play1108105200(arg_826_1)
			end
		end

		function arg_826_1.onSingleLineUpdate_(arg_829_0)
			local var_829_0 = arg_826_1.actors_["1081ui_story"].transform
			local var_829_1 = 0

			if var_829_1 < arg_826_1.time_ and arg_826_1.time_ <= var_829_1 + arg_829_0 then
				arg_826_1.var_.moveOldPos1081ui_story = var_829_0.localPosition
			end

			local var_829_2 = 0.001

			if var_829_1 <= arg_826_1.time_ and arg_826_1.time_ < var_829_1 + var_829_2 then
				local var_829_3 = (arg_826_1.time_ - var_829_1) / var_829_2
				local var_829_4 = Vector3.New(0, 100, 0)

				var_829_0.localPosition = Vector3.Lerp(arg_826_1.var_.moveOldPos1081ui_story, var_829_4, var_829_3)

				local var_829_5 = manager.ui.mainCamera.transform.position - var_829_0.position

				var_829_0.forward = Vector3.New(var_829_5.x, var_829_5.y, var_829_5.z)

				local var_829_6 = var_829_0.localEulerAngles

				var_829_6.z = 0
				var_829_6.x = 0
				var_829_0.localEulerAngles = var_829_6
			end

			if arg_826_1.time_ >= var_829_1 + var_829_2 and arg_826_1.time_ < var_829_1 + var_829_2 + arg_829_0 then
				var_829_0.localPosition = Vector3.New(0, 100, 0)

				local var_829_7 = manager.ui.mainCamera.transform.position - var_829_0.position

				var_829_0.forward = Vector3.New(var_829_7.x, var_829_7.y, var_829_7.z)

				local var_829_8 = var_829_0.localEulerAngles

				var_829_8.z = 0
				var_829_8.x = 0
				var_829_0.localEulerAngles = var_829_8
			end

			local var_829_9 = 0
			local var_829_10 = 0.5

			if var_829_9 < arg_826_1.time_ and arg_826_1.time_ <= var_829_9 + arg_829_0 then
				arg_826_1.talkMaxDuration = 0
				arg_826_1.dialogCg_.alpha = 1

				arg_826_1.dialog_:SetActive(true)
				SetActive(arg_826_1.leftNameGo_, true)

				local var_829_11 = arg_826_1:FormatText(StoryNameCfg[7].name)

				arg_826_1.leftNameTxt_.text = var_829_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_826_1.leftNameTxt_.transform)

				arg_826_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_826_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_826_1:RecordName(arg_826_1.leftNameTxt_.text)
				SetActive(arg_826_1.iconTrs_.gameObject, false)
				arg_826_1.callingController_:SetSelectedState("normal")

				local var_829_12 = arg_826_1:GetWordFromCfg(1108105199)
				local var_829_13 = arg_826_1:FormatText(var_829_12.content)

				arg_826_1.text_.text = var_829_13

				LuaForUtil.ClearLinePrefixSymbol(arg_826_1.text_)

				local var_829_14 = 20
				local var_829_15 = utf8.len(var_829_13)
				local var_829_16 = var_829_14 <= 0 and var_829_10 or var_829_10 * (var_829_15 / var_829_14)

				if var_829_16 > 0 and var_829_10 < var_829_16 then
					arg_826_1.talkMaxDuration = var_829_16

					if var_829_16 + var_829_9 > arg_826_1.duration_ then
						arg_826_1.duration_ = var_829_16 + var_829_9
					end
				end

				arg_826_1.text_.text = var_829_13
				arg_826_1.typewritter.percent = 0

				arg_826_1.typewritter:SetDirty()
				arg_826_1:ShowNextGo(false)
				arg_826_1:RecordContent(arg_826_1.text_.text)
			end

			local var_829_17 = math.max(var_829_10, arg_826_1.talkMaxDuration)

			if var_829_9 <= arg_826_1.time_ and arg_826_1.time_ < var_829_9 + var_829_17 then
				arg_826_1.typewritter.percent = (arg_826_1.time_ - var_829_9) / var_829_17

				arg_826_1.typewritter:SetDirty()
			end

			if arg_826_1.time_ >= var_829_9 + var_829_17 and arg_826_1.time_ < var_829_9 + var_829_17 + arg_829_0 then
				arg_826_1.typewritter.percent = 1

				arg_826_1.typewritter:SetDirty()
				arg_826_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105200 = function(arg_830_0, arg_830_1)
		arg_830_1.time_ = 0
		arg_830_1.frameCnt_ = 0
		arg_830_1.state_ = "playing"
		arg_830_1.curTalkId_ = 1108105200
		arg_830_1.duration_ = 5

		SetActive(arg_830_1.tipsGo_, false)

		function arg_830_1.onSingleLineFinish_()
			arg_830_1.onSingleLineUpdate_ = nil
			arg_830_1.onSingleLineFinish_ = nil
			arg_830_1.state_ = "waiting"
		end

		function arg_830_1.playNext_(arg_832_0)
			if arg_832_0 == 1 then
				arg_830_0:Play1108105201(arg_830_1)
			end
		end

		function arg_830_1.onSingleLineUpdate_(arg_833_0)
			local var_833_0 = 0
			local var_833_1 = 0.4

			if var_833_0 < arg_830_1.time_ and arg_830_1.time_ <= var_833_0 + arg_833_0 then
				arg_830_1.talkMaxDuration = 0
				arg_830_1.dialogCg_.alpha = 1

				arg_830_1.dialog_:SetActive(true)
				SetActive(arg_830_1.leftNameGo_, true)

				local var_833_2 = arg_830_1:FormatText(StoryNameCfg[7].name)

				arg_830_1.leftNameTxt_.text = var_833_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_830_1.leftNameTxt_.transform)

				arg_830_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_830_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_830_1:RecordName(arg_830_1.leftNameTxt_.text)
				SetActive(arg_830_1.iconTrs_.gameObject, false)
				arg_830_1.callingController_:SetSelectedState("normal")

				local var_833_3 = arg_830_1:GetWordFromCfg(1108105200)
				local var_833_4 = arg_830_1:FormatText(var_833_3.content)

				arg_830_1.text_.text = var_833_4

				LuaForUtil.ClearLinePrefixSymbol(arg_830_1.text_)

				local var_833_5 = 16
				local var_833_6 = utf8.len(var_833_4)
				local var_833_7 = var_833_5 <= 0 and var_833_1 or var_833_1 * (var_833_6 / var_833_5)

				if var_833_7 > 0 and var_833_1 < var_833_7 then
					arg_830_1.talkMaxDuration = var_833_7

					if var_833_7 + var_833_0 > arg_830_1.duration_ then
						arg_830_1.duration_ = var_833_7 + var_833_0
					end
				end

				arg_830_1.text_.text = var_833_4
				arg_830_1.typewritter.percent = 0

				arg_830_1.typewritter:SetDirty()
				arg_830_1:ShowNextGo(false)
				arg_830_1:RecordContent(arg_830_1.text_.text)
			end

			local var_833_8 = math.max(var_833_1, arg_830_1.talkMaxDuration)

			if var_833_0 <= arg_830_1.time_ and arg_830_1.time_ < var_833_0 + var_833_8 then
				arg_830_1.typewritter.percent = (arg_830_1.time_ - var_833_0) / var_833_8

				arg_830_1.typewritter:SetDirty()
			end

			if arg_830_1.time_ >= var_833_0 + var_833_8 and arg_830_1.time_ < var_833_0 + var_833_8 + arg_833_0 then
				arg_830_1.typewritter.percent = 1

				arg_830_1.typewritter:SetDirty()
				arg_830_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105201 = function(arg_834_0, arg_834_1)
		arg_834_1.time_ = 0
		arg_834_1.frameCnt_ = 0
		arg_834_1.state_ = "playing"
		arg_834_1.curTalkId_ = 1108105201
		arg_834_1.duration_ = 5

		SetActive(arg_834_1.tipsGo_, false)

		function arg_834_1.onSingleLineFinish_()
			arg_834_1.onSingleLineUpdate_ = nil
			arg_834_1.onSingleLineFinish_ = nil
			arg_834_1.state_ = "waiting"
		end

		function arg_834_1.playNext_(arg_836_0)
			if arg_836_0 == 1 then
				arg_834_0:Play1108105202(arg_834_1)
			end
		end

		function arg_834_1.onSingleLineUpdate_(arg_837_0)
			local var_837_0 = arg_834_1.actors_["1081ui_story"].transform
			local var_837_1 = 0

			if var_837_1 < arg_834_1.time_ and arg_834_1.time_ <= var_837_1 + arg_837_0 then
				arg_834_1.var_.moveOldPos1081ui_story = var_837_0.localPosition
			end

			local var_837_2 = 0.001

			if var_837_1 <= arg_834_1.time_ and arg_834_1.time_ < var_837_1 + var_837_2 then
				local var_837_3 = (arg_834_1.time_ - var_837_1) / var_837_2
				local var_837_4 = Vector3.New(0, -0.92, -5.8)

				var_837_0.localPosition = Vector3.Lerp(arg_834_1.var_.moveOldPos1081ui_story, var_837_4, var_837_3)

				local var_837_5 = manager.ui.mainCamera.transform.position - var_837_0.position

				var_837_0.forward = Vector3.New(var_837_5.x, var_837_5.y, var_837_5.z)

				local var_837_6 = var_837_0.localEulerAngles

				var_837_6.z = 0
				var_837_6.x = 0
				var_837_0.localEulerAngles = var_837_6
			end

			if arg_834_1.time_ >= var_837_1 + var_837_2 and arg_834_1.time_ < var_837_1 + var_837_2 + arg_837_0 then
				var_837_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_837_7 = manager.ui.mainCamera.transform.position - var_837_0.position

				var_837_0.forward = Vector3.New(var_837_7.x, var_837_7.y, var_837_7.z)

				local var_837_8 = var_837_0.localEulerAngles

				var_837_8.z = 0
				var_837_8.x = 0
				var_837_0.localEulerAngles = var_837_8
			end

			local var_837_9 = arg_834_1.actors_["1081ui_story"]
			local var_837_10 = 0

			if var_837_10 < arg_834_1.time_ and arg_834_1.time_ <= var_837_10 + arg_837_0 and arg_834_1.var_.characterEffect1081ui_story == nil then
				arg_834_1.var_.characterEffect1081ui_story = var_837_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_837_11 = 0.200000002980232

			if var_837_10 <= arg_834_1.time_ and arg_834_1.time_ < var_837_10 + var_837_11 then
				local var_837_12 = (arg_834_1.time_ - var_837_10) / var_837_11

				if arg_834_1.var_.characterEffect1081ui_story then
					arg_834_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_834_1.time_ >= var_837_10 + var_837_11 and arg_834_1.time_ < var_837_10 + var_837_11 + arg_837_0 and arg_834_1.var_.characterEffect1081ui_story then
				arg_834_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_837_13 = 0

			if var_837_13 < arg_834_1.time_ and arg_834_1.time_ <= var_837_13 + arg_837_0 then
				arg_834_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_2")
			end

			local var_837_14 = 0

			if var_837_14 < arg_834_1.time_ and arg_834_1.time_ <= var_837_14 + arg_837_0 then
				arg_834_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_837_15 = 0
			local var_837_16 = 0.3

			if var_837_15 < arg_834_1.time_ and arg_834_1.time_ <= var_837_15 + arg_837_0 then
				arg_834_1.talkMaxDuration = 0
				arg_834_1.dialogCg_.alpha = 1

				arg_834_1.dialog_:SetActive(true)
				SetActive(arg_834_1.leftNameGo_, true)

				local var_837_17 = arg_834_1:FormatText(StoryNameCfg[202].name)

				arg_834_1.leftNameTxt_.text = var_837_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_834_1.leftNameTxt_.transform)

				arg_834_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_834_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_834_1:RecordName(arg_834_1.leftNameTxt_.text)
				SetActive(arg_834_1.iconTrs_.gameObject, false)
				arg_834_1.callingController_:SetSelectedState("normal")

				local var_837_18 = arg_834_1:GetWordFromCfg(1108105201)
				local var_837_19 = arg_834_1:FormatText(var_837_18.content)

				arg_834_1.text_.text = var_837_19

				LuaForUtil.ClearLinePrefixSymbol(arg_834_1.text_)

				local var_837_20 = 12
				local var_837_21 = utf8.len(var_837_19)
				local var_837_22 = var_837_20 <= 0 and var_837_16 or var_837_16 * (var_837_21 / var_837_20)

				if var_837_22 > 0 and var_837_16 < var_837_22 then
					arg_834_1.talkMaxDuration = var_837_22

					if var_837_22 + var_837_15 > arg_834_1.duration_ then
						arg_834_1.duration_ = var_837_22 + var_837_15
					end
				end

				arg_834_1.text_.text = var_837_19
				arg_834_1.typewritter.percent = 0

				arg_834_1.typewritter:SetDirty()
				arg_834_1:ShowNextGo(false)
				arg_834_1:RecordContent(arg_834_1.text_.text)
			end

			local var_837_23 = math.max(var_837_16, arg_834_1.talkMaxDuration)

			if var_837_15 <= arg_834_1.time_ and arg_834_1.time_ < var_837_15 + var_837_23 then
				arg_834_1.typewritter.percent = (arg_834_1.time_ - var_837_15) / var_837_23

				arg_834_1.typewritter:SetDirty()
			end

			if arg_834_1.time_ >= var_837_15 + var_837_23 and arg_834_1.time_ < var_837_15 + var_837_23 + arg_837_0 then
				arg_834_1.typewritter.percent = 1

				arg_834_1.typewritter:SetDirty()
				arg_834_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105202 = function(arg_838_0, arg_838_1)
		arg_838_1.time_ = 0
		arg_838_1.frameCnt_ = 0
		arg_838_1.state_ = "playing"
		arg_838_1.curTalkId_ = 1108105202
		arg_838_1.duration_ = 5

		SetActive(arg_838_1.tipsGo_, false)

		function arg_838_1.onSingleLineFinish_()
			arg_838_1.onSingleLineUpdate_ = nil
			arg_838_1.onSingleLineFinish_ = nil
			arg_838_1.state_ = "waiting"
		end

		function arg_838_1.playNext_(arg_840_0)
			if arg_840_0 == 1 then
				arg_838_0:Play1108105203(arg_838_1)
			end
		end

		function arg_838_1.onSingleLineUpdate_(arg_841_0)
			local var_841_0 = arg_838_1.actors_["1081ui_story"].transform
			local var_841_1 = 0

			if var_841_1 < arg_838_1.time_ and arg_838_1.time_ <= var_841_1 + arg_841_0 then
				arg_838_1.var_.moveOldPos1081ui_story = var_841_0.localPosition
			end

			local var_841_2 = 0.001

			if var_841_1 <= arg_838_1.time_ and arg_838_1.time_ < var_841_1 + var_841_2 then
				local var_841_3 = (arg_838_1.time_ - var_841_1) / var_841_2
				local var_841_4 = Vector3.New(0, 100, 0)

				var_841_0.localPosition = Vector3.Lerp(arg_838_1.var_.moveOldPos1081ui_story, var_841_4, var_841_3)

				local var_841_5 = manager.ui.mainCamera.transform.position - var_841_0.position

				var_841_0.forward = Vector3.New(var_841_5.x, var_841_5.y, var_841_5.z)

				local var_841_6 = var_841_0.localEulerAngles

				var_841_6.z = 0
				var_841_6.x = 0
				var_841_0.localEulerAngles = var_841_6
			end

			if arg_838_1.time_ >= var_841_1 + var_841_2 and arg_838_1.time_ < var_841_1 + var_841_2 + arg_841_0 then
				var_841_0.localPosition = Vector3.New(0, 100, 0)

				local var_841_7 = manager.ui.mainCamera.transform.position - var_841_0.position

				var_841_0.forward = Vector3.New(var_841_7.x, var_841_7.y, var_841_7.z)

				local var_841_8 = var_841_0.localEulerAngles

				var_841_8.z = 0
				var_841_8.x = 0
				var_841_0.localEulerAngles = var_841_8
			end

			local var_841_9 = 0
			local var_841_10 = 0.75

			if var_841_9 < arg_838_1.time_ and arg_838_1.time_ <= var_841_9 + arg_841_0 then
				arg_838_1.talkMaxDuration = 0
				arg_838_1.dialogCg_.alpha = 1

				arg_838_1.dialog_:SetActive(true)
				SetActive(arg_838_1.leftNameGo_, false)

				arg_838_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_838_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_838_1:RecordName(arg_838_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_838_1.iconTrs_.gameObject, false)
				arg_838_1.callingController_:SetSelectedState("normal")

				local var_841_11 = arg_838_1:GetWordFromCfg(1108105202)
				local var_841_12 = arg_838_1:FormatText(var_841_11.content)

				arg_838_1.text_.text = var_841_12

				LuaForUtil.ClearLinePrefixSymbol(arg_838_1.text_)

				local var_841_13 = 30
				local var_841_14 = utf8.len(var_841_12)
				local var_841_15 = var_841_13 <= 0 and var_841_10 or var_841_10 * (var_841_14 / var_841_13)

				if var_841_15 > 0 and var_841_10 < var_841_15 then
					arg_838_1.talkMaxDuration = var_841_15

					if var_841_15 + var_841_9 > arg_838_1.duration_ then
						arg_838_1.duration_ = var_841_15 + var_841_9
					end
				end

				arg_838_1.text_.text = var_841_12
				arg_838_1.typewritter.percent = 0

				arg_838_1.typewritter:SetDirty()
				arg_838_1:ShowNextGo(false)
				arg_838_1:RecordContent(arg_838_1.text_.text)
			end

			local var_841_16 = math.max(var_841_10, arg_838_1.talkMaxDuration)

			if var_841_9 <= arg_838_1.time_ and arg_838_1.time_ < var_841_9 + var_841_16 then
				arg_838_1.typewritter.percent = (arg_838_1.time_ - var_841_9) / var_841_16

				arg_838_1.typewritter:SetDirty()
			end

			if arg_838_1.time_ >= var_841_9 + var_841_16 and arg_838_1.time_ < var_841_9 + var_841_16 + arg_841_0 then
				arg_838_1.typewritter.percent = 1

				arg_838_1.typewritter:SetDirty()
				arg_838_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105203 = function(arg_842_0, arg_842_1)
		arg_842_1.time_ = 0
		arg_842_1.frameCnt_ = 0
		arg_842_1.state_ = "playing"
		arg_842_1.curTalkId_ = 1108105203
		arg_842_1.duration_ = 5

		SetActive(arg_842_1.tipsGo_, false)

		function arg_842_1.onSingleLineFinish_()
			arg_842_1.onSingleLineUpdate_ = nil
			arg_842_1.onSingleLineFinish_ = nil
			arg_842_1.state_ = "waiting"
		end

		function arg_842_1.playNext_(arg_844_0)
			if arg_844_0 == 1 then
				arg_842_0:Play1108105204(arg_842_1)
			end
		end

		function arg_842_1.onSingleLineUpdate_(arg_845_0)
			local var_845_0 = arg_842_1.actors_["1081ui_story"].transform
			local var_845_1 = 0

			if var_845_1 < arg_842_1.time_ and arg_842_1.time_ <= var_845_1 + arg_845_0 then
				arg_842_1.var_.moveOldPos1081ui_story = var_845_0.localPosition
			end

			local var_845_2 = 0.001

			if var_845_1 <= arg_842_1.time_ and arg_842_1.time_ < var_845_1 + var_845_2 then
				local var_845_3 = (arg_842_1.time_ - var_845_1) / var_845_2
				local var_845_4 = Vector3.New(0, -0.92, -5.8)

				var_845_0.localPosition = Vector3.Lerp(arg_842_1.var_.moveOldPos1081ui_story, var_845_4, var_845_3)

				local var_845_5 = manager.ui.mainCamera.transform.position - var_845_0.position

				var_845_0.forward = Vector3.New(var_845_5.x, var_845_5.y, var_845_5.z)

				local var_845_6 = var_845_0.localEulerAngles

				var_845_6.z = 0
				var_845_6.x = 0
				var_845_0.localEulerAngles = var_845_6
			end

			if arg_842_1.time_ >= var_845_1 + var_845_2 and arg_842_1.time_ < var_845_1 + var_845_2 + arg_845_0 then
				var_845_0.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_845_7 = manager.ui.mainCamera.transform.position - var_845_0.position

				var_845_0.forward = Vector3.New(var_845_7.x, var_845_7.y, var_845_7.z)

				local var_845_8 = var_845_0.localEulerAngles

				var_845_8.z = 0
				var_845_8.x = 0
				var_845_0.localEulerAngles = var_845_8
			end

			local var_845_9 = arg_842_1.actors_["1081ui_story"]
			local var_845_10 = 0

			if var_845_10 < arg_842_1.time_ and arg_842_1.time_ <= var_845_10 + arg_845_0 and arg_842_1.var_.characterEffect1081ui_story == nil then
				arg_842_1.var_.characterEffect1081ui_story = var_845_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_845_11 = 0.200000002980232

			if var_845_10 <= arg_842_1.time_ and arg_842_1.time_ < var_845_10 + var_845_11 then
				local var_845_12 = (arg_842_1.time_ - var_845_10) / var_845_11

				if arg_842_1.var_.characterEffect1081ui_story then
					arg_842_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_842_1.time_ >= var_845_10 + var_845_11 and arg_842_1.time_ < var_845_10 + var_845_11 + arg_845_0 and arg_842_1.var_.characterEffect1081ui_story then
				arg_842_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_845_13 = 0

			if var_845_13 < arg_842_1.time_ and arg_842_1.time_ <= var_845_13 + arg_845_0 then
				arg_842_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_1")
			end

			local var_845_14 = 0
			local var_845_15 = 0.45

			if var_845_14 < arg_842_1.time_ and arg_842_1.time_ <= var_845_14 + arg_845_0 then
				arg_842_1.talkMaxDuration = 0
				arg_842_1.dialogCg_.alpha = 1

				arg_842_1.dialog_:SetActive(true)
				SetActive(arg_842_1.leftNameGo_, true)

				local var_845_16 = arg_842_1:FormatText(StoryNameCfg[202].name)

				arg_842_1.leftNameTxt_.text = var_845_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_842_1.leftNameTxt_.transform)

				arg_842_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_842_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_842_1:RecordName(arg_842_1.leftNameTxt_.text)
				SetActive(arg_842_1.iconTrs_.gameObject, false)
				arg_842_1.callingController_:SetSelectedState("normal")

				local var_845_17 = arg_842_1:GetWordFromCfg(1108105203)
				local var_845_18 = arg_842_1:FormatText(var_845_17.content)

				arg_842_1.text_.text = var_845_18

				LuaForUtil.ClearLinePrefixSymbol(arg_842_1.text_)

				local var_845_19 = 18
				local var_845_20 = utf8.len(var_845_18)
				local var_845_21 = var_845_19 <= 0 and var_845_15 or var_845_15 * (var_845_20 / var_845_19)

				if var_845_21 > 0 and var_845_15 < var_845_21 then
					arg_842_1.talkMaxDuration = var_845_21

					if var_845_21 + var_845_14 > arg_842_1.duration_ then
						arg_842_1.duration_ = var_845_21 + var_845_14
					end
				end

				arg_842_1.text_.text = var_845_18
				arg_842_1.typewritter.percent = 0

				arg_842_1.typewritter:SetDirty()
				arg_842_1:ShowNextGo(false)
				arg_842_1:RecordContent(arg_842_1.text_.text)
			end

			local var_845_22 = math.max(var_845_15, arg_842_1.talkMaxDuration)

			if var_845_14 <= arg_842_1.time_ and arg_842_1.time_ < var_845_14 + var_845_22 then
				arg_842_1.typewritter.percent = (arg_842_1.time_ - var_845_14) / var_845_22

				arg_842_1.typewritter:SetDirty()
			end

			if arg_842_1.time_ >= var_845_14 + var_845_22 and arg_842_1.time_ < var_845_14 + var_845_22 + arg_845_0 then
				arg_842_1.typewritter.percent = 1

				arg_842_1.typewritter:SetDirty()
				arg_842_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105204 = function(arg_846_0, arg_846_1)
		arg_846_1.time_ = 0
		arg_846_1.frameCnt_ = 0
		arg_846_1.state_ = "playing"
		arg_846_1.curTalkId_ = 1108105204
		arg_846_1.duration_ = 5

		SetActive(arg_846_1.tipsGo_, false)

		function arg_846_1.onSingleLineFinish_()
			arg_846_1.onSingleLineUpdate_ = nil
			arg_846_1.onSingleLineFinish_ = nil
			arg_846_1.state_ = "waiting"
		end

		function arg_846_1.playNext_(arg_848_0)
			if arg_848_0 == 1 then
				arg_846_0:Play1108105205(arg_846_1)
			end
		end

		function arg_846_1.onSingleLineUpdate_(arg_849_0)
			local var_849_0 = 0

			if var_849_0 < arg_846_1.time_ and arg_846_1.time_ <= var_849_0 + arg_849_0 then
				arg_846_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_849_1 = 0

			if var_849_1 < arg_846_1.time_ and arg_846_1.time_ <= var_849_1 + arg_849_0 then
				arg_846_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_849_2 = arg_846_1.actors_["1081ui_story"].transform
			local var_849_3 = 0

			if var_849_3 < arg_846_1.time_ and arg_846_1.time_ <= var_849_3 + arg_849_0 then
				arg_846_1.var_.moveOldPos1081ui_story = var_849_2.localPosition
			end

			local var_849_4 = 0.001

			if var_849_3 <= arg_846_1.time_ and arg_846_1.time_ < var_849_3 + var_849_4 then
				local var_849_5 = (arg_846_1.time_ - var_849_3) / var_849_4
				local var_849_6 = Vector3.New(0, -0.92, -5.8)

				var_849_2.localPosition = Vector3.Lerp(arg_846_1.var_.moveOldPos1081ui_story, var_849_6, var_849_5)

				local var_849_7 = manager.ui.mainCamera.transform.position - var_849_2.position

				var_849_2.forward = Vector3.New(var_849_7.x, var_849_7.y, var_849_7.z)

				local var_849_8 = var_849_2.localEulerAngles

				var_849_8.z = 0
				var_849_8.x = 0
				var_849_2.localEulerAngles = var_849_8
			end

			if arg_846_1.time_ >= var_849_3 + var_849_4 and arg_846_1.time_ < var_849_3 + var_849_4 + arg_849_0 then
				var_849_2.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_849_9 = manager.ui.mainCamera.transform.position - var_849_2.position

				var_849_2.forward = Vector3.New(var_849_9.x, var_849_9.y, var_849_9.z)

				local var_849_10 = var_849_2.localEulerAngles

				var_849_10.z = 0
				var_849_10.x = 0
				var_849_2.localEulerAngles = var_849_10
			end

			local var_849_11 = 0
			local var_849_12 = 0.225

			if var_849_11 < arg_846_1.time_ and arg_846_1.time_ <= var_849_11 + arg_849_0 then
				arg_846_1.talkMaxDuration = 0
				arg_846_1.dialogCg_.alpha = 1

				arg_846_1.dialog_:SetActive(true)
				SetActive(arg_846_1.leftNameGo_, true)

				local var_849_13 = arg_846_1:FormatText(StoryNameCfg[202].name)

				arg_846_1.leftNameTxt_.text = var_849_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_846_1.leftNameTxt_.transform)

				arg_846_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_846_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_846_1:RecordName(arg_846_1.leftNameTxt_.text)
				SetActive(arg_846_1.iconTrs_.gameObject, false)
				arg_846_1.callingController_:SetSelectedState("normal")

				local var_849_14 = arg_846_1:GetWordFromCfg(1108105204)
				local var_849_15 = arg_846_1:FormatText(var_849_14.content)

				arg_846_1.text_.text = var_849_15

				LuaForUtil.ClearLinePrefixSymbol(arg_846_1.text_)

				local var_849_16 = 9
				local var_849_17 = utf8.len(var_849_15)
				local var_849_18 = var_849_16 <= 0 and var_849_12 or var_849_12 * (var_849_17 / var_849_16)

				if var_849_18 > 0 and var_849_12 < var_849_18 then
					arg_846_1.talkMaxDuration = var_849_18

					if var_849_18 + var_849_11 > arg_846_1.duration_ then
						arg_846_1.duration_ = var_849_18 + var_849_11
					end
				end

				arg_846_1.text_.text = var_849_15
				arg_846_1.typewritter.percent = 0

				arg_846_1.typewritter:SetDirty()
				arg_846_1:ShowNextGo(false)
				arg_846_1:RecordContent(arg_846_1.text_.text)
			end

			local var_849_19 = math.max(var_849_12, arg_846_1.talkMaxDuration)

			if var_849_11 <= arg_846_1.time_ and arg_846_1.time_ < var_849_11 + var_849_19 then
				arg_846_1.typewritter.percent = (arg_846_1.time_ - var_849_11) / var_849_19

				arg_846_1.typewritter:SetDirty()
			end

			if arg_846_1.time_ >= var_849_11 + var_849_19 and arg_846_1.time_ < var_849_11 + var_849_19 + arg_849_0 then
				arg_846_1.typewritter.percent = 1

				arg_846_1.typewritter:SetDirty()
				arg_846_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105205 = function(arg_850_0, arg_850_1)
		arg_850_1.time_ = 0
		arg_850_1.frameCnt_ = 0
		arg_850_1.state_ = "playing"
		arg_850_1.curTalkId_ = 1108105205
		arg_850_1.duration_ = 5

		SetActive(arg_850_1.tipsGo_, false)

		function arg_850_1.onSingleLineFinish_()
			arg_850_1.onSingleLineUpdate_ = nil
			arg_850_1.onSingleLineFinish_ = nil
			arg_850_1.state_ = "waiting"
		end

		function arg_850_1.playNext_(arg_852_0)
			if arg_852_0 == 1 then
				arg_850_0:Play1108105206(arg_850_1)
			end
		end

		function arg_850_1.onSingleLineUpdate_(arg_853_0)
			local var_853_0 = 0

			if var_853_0 < arg_850_1.time_ and arg_850_1.time_ <= var_853_0 + arg_853_0 then
				arg_850_1.allBtn_.enabled = false
			end

			local var_853_1 = 0.3

			if arg_850_1.time_ >= var_853_0 + var_853_1 and arg_850_1.time_ < var_853_0 + var_853_1 + arg_853_0 then
				arg_850_1.allBtn_.enabled = true
			end

			local var_853_2 = arg_850_1.actors_["1081ui_story"].transform
			local var_853_3 = 0

			if var_853_3 < arg_850_1.time_ and arg_850_1.time_ <= var_853_3 + arg_853_0 then
				arg_850_1.var_.moveOldPos1081ui_story = var_853_2.localPosition
			end

			local var_853_4 = 0.001

			if var_853_3 <= arg_850_1.time_ and arg_850_1.time_ < var_853_3 + var_853_4 then
				local var_853_5 = (arg_850_1.time_ - var_853_3) / var_853_4
				local var_853_6 = Vector3.New(0, 100, 0)

				var_853_2.localPosition = Vector3.Lerp(arg_850_1.var_.moveOldPos1081ui_story, var_853_6, var_853_5)

				local var_853_7 = manager.ui.mainCamera.transform.position - var_853_2.position

				var_853_2.forward = Vector3.New(var_853_7.x, var_853_7.y, var_853_7.z)

				local var_853_8 = var_853_2.localEulerAngles

				var_853_8.z = 0
				var_853_8.x = 0
				var_853_2.localEulerAngles = var_853_8
			end

			if arg_850_1.time_ >= var_853_3 + var_853_4 and arg_850_1.time_ < var_853_3 + var_853_4 + arg_853_0 then
				var_853_2.localPosition = Vector3.New(0, 100, 0)

				local var_853_9 = manager.ui.mainCamera.transform.position - var_853_2.position

				var_853_2.forward = Vector3.New(var_853_9.x, var_853_9.y, var_853_9.z)

				local var_853_10 = var_853_2.localEulerAngles

				var_853_10.z = 0
				var_853_10.x = 0
				var_853_2.localEulerAngles = var_853_10
			end

			local var_853_11 = 0
			local var_853_12 = 1.05

			if var_853_11 < arg_850_1.time_ and arg_850_1.time_ <= var_853_11 + arg_853_0 then
				arg_850_1.talkMaxDuration = 0
				arg_850_1.dialogCg_.alpha = 1

				arg_850_1.dialog_:SetActive(true)
				SetActive(arg_850_1.leftNameGo_, false)

				arg_850_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_850_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_850_1:RecordName(arg_850_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_850_1.iconTrs_.gameObject, false)
				arg_850_1.callingController_:SetSelectedState("normal")

				local var_853_13 = arg_850_1:GetWordFromCfg(1108105205)
				local var_853_14 = arg_850_1:FormatText(var_853_13.content)

				arg_850_1.text_.text = var_853_14

				LuaForUtil.ClearLinePrefixSymbol(arg_850_1.text_)

				local var_853_15 = 42
				local var_853_16 = utf8.len(var_853_14)
				local var_853_17 = var_853_15 <= 0 and var_853_12 or var_853_12 * (var_853_16 / var_853_15)

				if var_853_17 > 0 and var_853_12 < var_853_17 then
					arg_850_1.talkMaxDuration = var_853_17

					if var_853_17 + var_853_11 > arg_850_1.duration_ then
						arg_850_1.duration_ = var_853_17 + var_853_11
					end
				end

				arg_850_1.text_.text = var_853_14
				arg_850_1.typewritter.percent = 0

				arg_850_1.typewritter:SetDirty()
				arg_850_1:ShowNextGo(false)
				arg_850_1:RecordContent(arg_850_1.text_.text)
			end

			local var_853_18 = math.max(var_853_12, arg_850_1.talkMaxDuration)

			if var_853_11 <= arg_850_1.time_ and arg_850_1.time_ < var_853_11 + var_853_18 then
				arg_850_1.typewritter.percent = (arg_850_1.time_ - var_853_11) / var_853_18

				arg_850_1.typewritter:SetDirty()
			end

			if arg_850_1.time_ >= var_853_11 + var_853_18 and arg_850_1.time_ < var_853_11 + var_853_18 + arg_853_0 then
				arg_850_1.typewritter.percent = 1

				arg_850_1.typewritter:SetDirty()
				arg_850_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105206 = function(arg_854_0, arg_854_1)
		arg_854_1.time_ = 0
		arg_854_1.frameCnt_ = 0
		arg_854_1.state_ = "playing"
		arg_854_1.curTalkId_ = 1108105206
		arg_854_1.duration_ = 5

		SetActive(arg_854_1.tipsGo_, false)

		function arg_854_1.onSingleLineFinish_()
			arg_854_1.onSingleLineUpdate_ = nil
			arg_854_1.onSingleLineFinish_ = nil
			arg_854_1.state_ = "waiting"
			arg_854_1.auto_ = false
		end

		function arg_854_1.playNext_(arg_856_0)
			arg_854_1.onStoryFinished_()
		end

		function arg_854_1.onSingleLineUpdate_(arg_857_0)
			local var_857_0 = 0
			local var_857_1 = 1.05

			if var_857_0 < arg_854_1.time_ and arg_854_1.time_ <= var_857_0 + arg_857_0 then
				arg_854_1.talkMaxDuration = 0
				arg_854_1.dialogCg_.alpha = 1

				arg_854_1.dialog_:SetActive(true)
				SetActive(arg_854_1.leftNameGo_, false)

				arg_854_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_854_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_854_1:RecordName(arg_854_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_854_1.iconTrs_.gameObject, false)
				arg_854_1.callingController_:SetSelectedState("normal")

				local var_857_2 = arg_854_1:GetWordFromCfg(1108105206)
				local var_857_3 = arg_854_1:FormatText(var_857_2.content)

				arg_854_1.text_.text = var_857_3

				LuaForUtil.ClearLinePrefixSymbol(arg_854_1.text_)

				local var_857_4 = 42
				local var_857_5 = utf8.len(var_857_3)
				local var_857_6 = var_857_4 <= 0 and var_857_1 or var_857_1 * (var_857_5 / var_857_4)

				if var_857_6 > 0 and var_857_1 < var_857_6 then
					arg_854_1.talkMaxDuration = var_857_6

					if var_857_6 + var_857_0 > arg_854_1.duration_ then
						arg_854_1.duration_ = var_857_6 + var_857_0
					end
				end

				arg_854_1.text_.text = var_857_3
				arg_854_1.typewritter.percent = 0

				arg_854_1.typewritter:SetDirty()
				arg_854_1:ShowNextGo(false)
				arg_854_1:RecordContent(arg_854_1.text_.text)
			end

			local var_857_7 = math.max(var_857_1, arg_854_1.talkMaxDuration)

			if var_857_0 <= arg_854_1.time_ and arg_854_1.time_ < var_857_0 + var_857_7 then
				arg_854_1.typewritter.percent = (arg_854_1.time_ - var_857_0) / var_857_7

				arg_854_1.typewritter:SetDirty()
			end

			if arg_854_1.time_ >= var_857_0 + var_857_7 and arg_854_1.time_ < var_857_0 + var_857_7 + arg_857_0 then
				arg_854_1.typewritter.percent = 1

				arg_854_1.typewritter:SetDirty()
				arg_854_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105149 = function(arg_858_0, arg_858_1)
		arg_858_1.time_ = 0
		arg_858_1.frameCnt_ = 0
		arg_858_1.state_ = "playing"
		arg_858_1.curTalkId_ = 1108105149
		arg_858_1.duration_ = 5

		SetActive(arg_858_1.tipsGo_, false)

		function arg_858_1.onSingleLineFinish_()
			arg_858_1.onSingleLineUpdate_ = nil
			arg_858_1.onSingleLineFinish_ = nil
			arg_858_1.state_ = "waiting"
		end

		function arg_858_1.playNext_(arg_860_0)
			if arg_860_0 == 1 then
				arg_858_0:Play1108105150(arg_858_1)
			end
		end

		function arg_858_1.onSingleLineUpdate_(arg_861_0)
			local var_861_0 = arg_858_1.actors_["1081ui_story"]
			local var_861_1 = 0

			if var_861_1 < arg_858_1.time_ and arg_858_1.time_ <= var_861_1 + arg_861_0 and arg_858_1.var_.characterEffect1081ui_story == nil then
				arg_858_1.var_.characterEffect1081ui_story = var_861_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_861_2 = 0.200000002980232

			if var_861_1 <= arg_858_1.time_ and arg_858_1.time_ < var_861_1 + var_861_2 then
				local var_861_3 = (arg_858_1.time_ - var_861_1) / var_861_2

				if arg_858_1.var_.characterEffect1081ui_story then
					arg_858_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_858_1.time_ >= var_861_1 + var_861_2 and arg_858_1.time_ < var_861_1 + var_861_2 + arg_861_0 and arg_858_1.var_.characterEffect1081ui_story then
				arg_858_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_861_4 = 0
			local var_861_5 = 0.2

			if var_861_4 < arg_858_1.time_ and arg_858_1.time_ <= var_861_4 + arg_861_0 then
				arg_858_1.talkMaxDuration = 0
				arg_858_1.dialogCg_.alpha = 1

				arg_858_1.dialog_:SetActive(true)
				SetActive(arg_858_1.leftNameGo_, true)

				local var_861_6 = arg_858_1:FormatText(StoryNameCfg[202].name)

				arg_858_1.leftNameTxt_.text = var_861_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_858_1.leftNameTxt_.transform)

				arg_858_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_858_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_858_1:RecordName(arg_858_1.leftNameTxt_.text)
				SetActive(arg_858_1.iconTrs_.gameObject, false)
				arg_858_1.callingController_:SetSelectedState("normal")

				local var_861_7 = arg_858_1:GetWordFromCfg(1108105149)
				local var_861_8 = arg_858_1:FormatText(var_861_7.content)

				arg_858_1.text_.text = var_861_8

				LuaForUtil.ClearLinePrefixSymbol(arg_858_1.text_)

				local var_861_9 = 8
				local var_861_10 = utf8.len(var_861_8)
				local var_861_11 = var_861_9 <= 0 and var_861_5 or var_861_5 * (var_861_10 / var_861_9)

				if var_861_11 > 0 and var_861_5 < var_861_11 then
					arg_858_1.talkMaxDuration = var_861_11

					if var_861_11 + var_861_4 > arg_858_1.duration_ then
						arg_858_1.duration_ = var_861_11 + var_861_4
					end
				end

				arg_858_1.text_.text = var_861_8
				arg_858_1.typewritter.percent = 0

				arg_858_1.typewritter:SetDirty()
				arg_858_1:ShowNextGo(false)
				arg_858_1:RecordContent(arg_858_1.text_.text)
			end

			local var_861_12 = math.max(var_861_5, arg_858_1.talkMaxDuration)

			if var_861_4 <= arg_858_1.time_ and arg_858_1.time_ < var_861_4 + var_861_12 then
				arg_858_1.typewritter.percent = (arg_858_1.time_ - var_861_4) / var_861_12

				arg_858_1.typewritter:SetDirty()
			end

			if arg_858_1.time_ >= var_861_4 + var_861_12 and arg_858_1.time_ < var_861_4 + var_861_12 + arg_861_0 then
				arg_858_1.typewritter.percent = 1

				arg_858_1.typewritter:SetDirty()
				arg_858_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105065 = function(arg_862_0, arg_862_1)
		arg_862_1.time_ = 0
		arg_862_1.frameCnt_ = 0
		arg_862_1.state_ = "playing"
		arg_862_1.curTalkId_ = 1108105065
		arg_862_1.duration_ = 5

		SetActive(arg_862_1.tipsGo_, false)

		function arg_862_1.onSingleLineFinish_()
			arg_862_1.onSingleLineUpdate_ = nil
			arg_862_1.onSingleLineFinish_ = nil
			arg_862_1.state_ = "waiting"
		end

		function arg_862_1.playNext_(arg_864_0)
			if arg_864_0 == 1 then
				arg_862_0:Play1108105066(arg_862_1)
			end
		end

		function arg_862_1.onSingleLineUpdate_(arg_865_0)
			local var_865_0 = "1081ui_story"

			if arg_862_1.actors_[var_865_0] == nil then
				local var_865_1 = Object.Instantiate(Asset.Load("Char/" .. var_865_0), arg_862_1.stage_.transform)

				var_865_1.name = var_865_0
				var_865_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_862_1.actors_[var_865_0] = var_865_1

				local var_865_2 = var_865_1:GetComponentInChildren(typeof(CharacterEffect))

				var_865_2.enabled = true

				local var_865_3 = GameObjectTools.GetOrAddComponent(var_865_1, typeof(DynamicBoneHelper))

				if var_865_3 then
					var_865_3:EnableDynamicBone(false)
				end

				arg_862_1:ShowWeapon(var_865_2.transform, false)

				arg_862_1.var_[var_865_0 .. "Animator"] = var_865_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_862_1.var_[var_865_0 .. "Animator"].applyRootMotion = true
				arg_862_1.var_[var_865_0 .. "LipSync"] = var_865_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_865_4 = 0

			if var_865_4 < arg_862_1.time_ and arg_862_1.time_ <= var_865_4 + arg_865_0 then
				arg_862_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_2")
			end

			local var_865_5 = "1081ui_story"

			if arg_862_1.actors_[var_865_5] == nil then
				local var_865_6 = Object.Instantiate(Asset.Load("Char/" .. var_865_5), arg_862_1.stage_.transform)

				var_865_6.name = var_865_5
				var_865_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_862_1.actors_[var_865_5] = var_865_6

				local var_865_7 = var_865_6:GetComponentInChildren(typeof(CharacterEffect))

				var_865_7.enabled = true

				local var_865_8 = GameObjectTools.GetOrAddComponent(var_865_6, typeof(DynamicBoneHelper))

				if var_865_8 then
					var_865_8:EnableDynamicBone(false)
				end

				arg_862_1:ShowWeapon(var_865_7.transform, false)

				arg_862_1.var_[var_865_5 .. "Animator"] = var_865_7.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_862_1.var_[var_865_5 .. "Animator"].applyRootMotion = true
				arg_862_1.var_[var_865_5 .. "LipSync"] = var_865_7.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_865_9 = 0

			if var_865_9 < arg_862_1.time_ and arg_862_1.time_ <= var_865_9 + arg_865_0 then
				arg_862_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_865_10 = 0
			local var_865_11 = 0.575

			if var_865_10 < arg_862_1.time_ and arg_862_1.time_ <= var_865_10 + arg_865_0 then
				arg_862_1.talkMaxDuration = 0
				arg_862_1.dialogCg_.alpha = 1

				arg_862_1.dialog_:SetActive(true)
				SetActive(arg_862_1.leftNameGo_, true)

				local var_865_12 = arg_862_1:FormatText(StoryNameCfg[202].name)

				arg_862_1.leftNameTxt_.text = var_865_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_862_1.leftNameTxt_.transform)

				arg_862_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_862_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_862_1:RecordName(arg_862_1.leftNameTxt_.text)
				SetActive(arg_862_1.iconTrs_.gameObject, false)
				arg_862_1.callingController_:SetSelectedState("normal")

				local var_865_13 = arg_862_1:GetWordFromCfg(1108105065)
				local var_865_14 = arg_862_1:FormatText(var_865_13.content)

				arg_862_1.text_.text = var_865_14

				LuaForUtil.ClearLinePrefixSymbol(arg_862_1.text_)

				local var_865_15 = 23
				local var_865_16 = utf8.len(var_865_14)
				local var_865_17 = var_865_15 <= 0 and var_865_11 or var_865_11 * (var_865_16 / var_865_15)

				if var_865_17 > 0 and var_865_11 < var_865_17 then
					arg_862_1.talkMaxDuration = var_865_17

					if var_865_17 + var_865_10 > arg_862_1.duration_ then
						arg_862_1.duration_ = var_865_17 + var_865_10
					end
				end

				arg_862_1.text_.text = var_865_14
				arg_862_1.typewritter.percent = 0

				arg_862_1.typewritter:SetDirty()
				arg_862_1:ShowNextGo(false)
				arg_862_1:RecordContent(arg_862_1.text_.text)
			end

			local var_865_18 = math.max(var_865_11, arg_862_1.talkMaxDuration)

			if var_865_10 <= arg_862_1.time_ and arg_862_1.time_ < var_865_10 + var_865_18 then
				arg_862_1.typewritter.percent = (arg_862_1.time_ - var_865_10) / var_865_18

				arg_862_1.typewritter:SetDirty()
			end

			if arg_862_1.time_ >= var_865_10 + var_865_18 and arg_862_1.time_ < var_865_10 + var_865_18 + arg_865_0 then
				arg_862_1.typewritter.percent = 1

				arg_862_1.typewritter:SetDirty()
				arg_862_1:ShowNextGo(true)
			end
		end
	end,
	Play1108105006 = function(arg_866_0, arg_866_1)
		arg_866_1.time_ = 0
		arg_866_1.frameCnt_ = 0
		arg_866_1.state_ = "playing"
		arg_866_1.curTalkId_ = 1108105006
		arg_866_1.duration_ = 5

		SetActive(arg_866_1.tipsGo_, false)

		function arg_866_1.onSingleLineFinish_()
			arg_866_1.onSingleLineUpdate_ = nil
			arg_866_1.onSingleLineFinish_ = nil
			arg_866_1.state_ = "waiting"
		end

		function arg_866_1.playNext_(arg_868_0)
			if arg_868_0 == 1 then
				arg_866_0:Play1108105007(arg_866_1)
			end
		end

		function arg_866_1.onSingleLineUpdate_(arg_869_0)
			local var_869_0 = "1081ui_story"

			if arg_866_1.actors_[var_869_0] == nil then
				local var_869_1 = Object.Instantiate(Asset.Load("Char/" .. var_869_0), arg_866_1.stage_.transform)

				var_869_1.name = var_869_0
				var_869_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_866_1.actors_[var_869_0] = var_869_1

				local var_869_2 = var_869_1:GetComponentInChildren(typeof(CharacterEffect))

				var_869_2.enabled = true

				local var_869_3 = GameObjectTools.GetOrAddComponent(var_869_1, typeof(DynamicBoneHelper))

				if var_869_3 then
					var_869_3:EnableDynamicBone(false)
				end

				arg_866_1:ShowWeapon(var_869_2.transform, false)

				arg_866_1.var_[var_869_0 .. "Animator"] = var_869_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_866_1.var_[var_869_0 .. "Animator"].applyRootMotion = true
				arg_866_1.var_[var_869_0 .. "LipSync"] = var_869_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_869_4 = 0

			if var_869_4 < arg_866_1.time_ and arg_866_1.time_ <= var_869_4 + arg_869_0 then
				arg_866_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action3_2 ")
			end

			local var_869_5 = "1081ui_story"

			if arg_866_1.actors_[var_869_5] == nil then
				local var_869_6 = Object.Instantiate(Asset.Load("Char/" .. var_869_5), arg_866_1.stage_.transform)

				var_869_6.name = var_869_5
				var_869_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_866_1.actors_[var_869_5] = var_869_6

				local var_869_7 = var_869_6:GetComponentInChildren(typeof(CharacterEffect))

				var_869_7.enabled = true

				local var_869_8 = GameObjectTools.GetOrAddComponent(var_869_6, typeof(DynamicBoneHelper))

				if var_869_8 then
					var_869_8:EnableDynamicBone(false)
				end

				arg_866_1:ShowWeapon(var_869_7.transform, false)

				arg_866_1.var_[var_869_5 .. "Animator"] = var_869_7.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_866_1.var_[var_869_5 .. "Animator"].applyRootMotion = true
				arg_866_1.var_[var_869_5 .. "LipSync"] = var_869_7.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_869_9 = 0

			if var_869_9 < arg_866_1.time_ and arg_866_1.time_ <= var_869_9 + arg_869_0 then
				arg_866_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_869_10 = arg_866_1.actors_["1081ui_story"]
			local var_869_11 = 0

			if var_869_11 < arg_866_1.time_ and arg_866_1.time_ <= var_869_11 + arg_869_0 and arg_866_1.var_.characterEffect1081ui_story == nil then
				arg_866_1.var_.characterEffect1081ui_story = var_869_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_869_12 = 0.200000002980232

			if var_869_11 <= arg_866_1.time_ and arg_866_1.time_ < var_869_11 + var_869_12 then
				local var_869_13 = (arg_866_1.time_ - var_869_11) / var_869_12

				if arg_866_1.var_.characterEffect1081ui_story then
					arg_866_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_866_1.time_ >= var_869_11 + var_869_12 and arg_866_1.time_ < var_869_11 + var_869_12 + arg_869_0 and arg_866_1.var_.characterEffect1081ui_story then
				arg_866_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_869_14 = 0
			local var_869_15 = 0.2

			if var_869_14 < arg_866_1.time_ and arg_866_1.time_ <= var_869_14 + arg_869_0 then
				arg_866_1.talkMaxDuration = 0
				arg_866_1.dialogCg_.alpha = 1

				arg_866_1.dialog_:SetActive(true)
				SetActive(arg_866_1.leftNameGo_, true)

				local var_869_16 = arg_866_1:FormatText(StoryNameCfg[202].name)

				arg_866_1.leftNameTxt_.text = var_869_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_866_1.leftNameTxt_.transform)

				arg_866_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_866_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_866_1:RecordName(arg_866_1.leftNameTxt_.text)
				SetActive(arg_866_1.iconTrs_.gameObject, false)
				arg_866_1.callingController_:SetSelectedState("normal")

				local var_869_17 = arg_866_1:GetWordFromCfg(1108105006)
				local var_869_18 = arg_866_1:FormatText(var_869_17.content)

				arg_866_1.text_.text = var_869_18

				LuaForUtil.ClearLinePrefixSymbol(arg_866_1.text_)

				local var_869_19 = 8
				local var_869_20 = utf8.len(var_869_18)
				local var_869_21 = var_869_19 <= 0 and var_869_15 or var_869_15 * (var_869_20 / var_869_19)

				if var_869_21 > 0 and var_869_15 < var_869_21 then
					arg_866_1.talkMaxDuration = var_869_21

					if var_869_21 + var_869_14 > arg_866_1.duration_ then
						arg_866_1.duration_ = var_869_21 + var_869_14
					end
				end

				arg_866_1.text_.text = var_869_18
				arg_866_1.typewritter.percent = 0

				arg_866_1.typewritter:SetDirty()
				arg_866_1:ShowNextGo(false)
				arg_866_1:RecordContent(arg_866_1.text_.text)
			end

			local var_869_22 = math.max(var_869_15, arg_866_1.talkMaxDuration)

			if var_869_14 <= arg_866_1.time_ and arg_866_1.time_ < var_869_14 + var_869_22 then
				arg_866_1.typewritter.percent = (arg_866_1.time_ - var_869_14) / var_869_22

				arg_866_1.typewritter:SetDirty()
			end

			if arg_866_1.time_ >= var_869_14 + var_869_22 and arg_866_1.time_ < var_869_14 + var_869_22 + arg_869_0 then
				arg_866_1.typewritter.percent = 1

				arg_866_1.typewritter:SetDirty()
				arg_866_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST0403",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST0403a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST0402a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite"
	},
	voices = {}
}
