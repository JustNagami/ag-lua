return {
	Play419012001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 419012001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play419012002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I18g"

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
				local var_4_5 = arg_1_1.bgs_.I18g

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
					if iter_4_0 ~= "I18g" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 2

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

				local var_4_28 = ""
				local var_4_29 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_29 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_29 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_29

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_29
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

			local var_4_30 = 2.2
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_142", "se_story_142_monster01", "")
			end

			local var_4_34 = 0.05
			local var_4_35 = 1

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "effect"

				arg_1_1:AudioAction(var_4_36, var_4_37, "se_story_142", "se_story_142_amb_wild", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 1.2

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(419012001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 48
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play419012002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 419012002
		arg_8_1.duration_ = 5

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play419012003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = 0
			local var_11_1 = 1.125

			if var_11_0 < arg_8_1.time_ and arg_8_1.time_ <= var_11_0 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, false)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_2 = arg_8_1:GetWordFromCfg(419012002)
				local var_11_3 = arg_8_1:FormatText(var_11_2.content)

				arg_8_1.text_.text = var_11_3

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_4 = 45
				local var_11_5 = utf8.len(var_11_3)
				local var_11_6 = var_11_4 <= 0 and var_11_1 or var_11_1 * (var_11_5 / var_11_4)

				if var_11_6 > 0 and var_11_1 < var_11_6 then
					arg_8_1.talkMaxDuration = var_11_6

					if var_11_6 + var_11_0 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_6 + var_11_0
					end
				end

				arg_8_1.text_.text = var_11_3
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)
				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_7 = math.max(var_11_1, arg_8_1.talkMaxDuration)

			if var_11_0 <= arg_8_1.time_ and arg_8_1.time_ < var_11_0 + var_11_7 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_0) / var_11_7

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_0 + var_11_7 and arg_8_1.time_ < var_11_0 + var_11_7 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play419012003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 419012003
		arg_12_1.duration_ = 5

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play419012004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = "1045ui_story"

			if arg_12_1.actors_[var_15_0] == nil then
				local var_15_1 = Asset.Load("Char/" .. "1045ui_story")

				if not isNil(var_15_1) then
					local var_15_2 = Object.Instantiate(Asset.Load("Char/" .. "1045ui_story"), arg_12_1.stage_.transform)

					var_15_2.name = var_15_0
					var_15_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_12_1.actors_[var_15_0] = var_15_2

					local var_15_3 = var_15_2:GetComponentInChildren(typeof(CharacterEffect))

					var_15_3.enabled = true

					local var_15_4 = GameObjectTools.GetOrAddComponent(var_15_2, typeof(DynamicBoneHelper))

					if var_15_4 then
						var_15_4:EnableDynamicBone(false)
					end

					arg_12_1:ShowWeapon(var_15_3.transform, false)

					arg_12_1.var_[var_15_0 .. "Animator"] = var_15_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_12_1.var_[var_15_0 .. "Animator"].applyRootMotion = true
					arg_12_1.var_[var_15_0 .. "LipSync"] = var_15_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_15_5 = arg_12_1.actors_["1045ui_story"].transform
			local var_15_6 = 0

			if var_15_6 < arg_12_1.time_ and arg_12_1.time_ <= var_15_6 + arg_15_0 then
				arg_12_1.var_.moveOldPos1045ui_story = var_15_5.localPosition
			end

			local var_15_7 = 0.001

			if var_15_6 <= arg_12_1.time_ and arg_12_1.time_ < var_15_6 + var_15_7 then
				local var_15_8 = (arg_12_1.time_ - var_15_6) / var_15_7
				local var_15_9 = Vector3.New(0, -1, -6.05)

				var_15_5.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1045ui_story, var_15_9, var_15_8)

				local var_15_10 = manager.ui.mainCamera.transform.position - var_15_5.position

				var_15_5.forward = Vector3.New(var_15_10.x, var_15_10.y, var_15_10.z)

				local var_15_11 = var_15_5.localEulerAngles

				var_15_11.z = 0
				var_15_11.x = 0
				var_15_5.localEulerAngles = var_15_11
			end

			if arg_12_1.time_ >= var_15_6 + var_15_7 and arg_12_1.time_ < var_15_6 + var_15_7 + arg_15_0 then
				var_15_5.localPosition = Vector3.New(0, -1, -6.05)

				local var_15_12 = manager.ui.mainCamera.transform.position - var_15_5.position

				var_15_5.forward = Vector3.New(var_15_12.x, var_15_12.y, var_15_12.z)

				local var_15_13 = var_15_5.localEulerAngles

				var_15_13.z = 0
				var_15_13.x = 0
				var_15_5.localEulerAngles = var_15_13
			end

			local var_15_14 = arg_12_1.actors_["1045ui_story"]
			local var_15_15 = 0

			if var_15_15 < arg_12_1.time_ and arg_12_1.time_ <= var_15_15 + arg_15_0 and not isNil(var_15_14) and arg_12_1.var_.characterEffect1045ui_story == nil then
				arg_12_1.var_.characterEffect1045ui_story = var_15_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_16 = 0.200000002980232

			if var_15_15 <= arg_12_1.time_ and arg_12_1.time_ < var_15_15 + var_15_16 and not isNil(var_15_14) then
				local var_15_17 = (arg_12_1.time_ - var_15_15) / var_15_16

				if arg_12_1.var_.characterEffect1045ui_story and not isNil(var_15_14) then
					arg_12_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_15 + var_15_16 and arg_12_1.time_ < var_15_15 + var_15_16 + arg_15_0 and not isNil(var_15_14) and arg_12_1.var_.characterEffect1045ui_story then
				arg_12_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_15_18 = 0

			if var_15_18 < arg_12_1.time_ and arg_12_1.time_ <= var_15_18 + arg_15_0 then
				arg_12_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action1_1")
			end

			local var_15_19 = 0

			if var_15_19 < arg_12_1.time_ and arg_12_1.time_ <= var_15_19 + arg_15_0 then
				arg_12_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_renzhen", "EmotionTimelineAnimator")
			end

			local var_15_20 = 0
			local var_15_21 = 0.2

			if var_15_20 < arg_12_1.time_ and arg_12_1.time_ <= var_15_20 + arg_15_0 then
				local var_15_22 = "play"
				local var_15_23 = "music"

				arg_12_1:AudioAction(var_15_22, var_15_23, "ui_battle", "ui_battle_stopbgm", "")

				local var_15_24 = ""
				local var_15_25 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_15_25 ~= "" then
					if arg_12_1.bgmTxt_.text ~= var_15_25 and arg_12_1.bgmTxt_.text ~= "" then
						if arg_12_1.bgmTxt2_.text ~= "" then
							arg_12_1.bgmTxt_.text = arg_12_1.bgmTxt2_.text
						end

						arg_12_1.bgmTxt2_.text = var_15_25

						arg_12_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_12_1.bgmTxt_.text = var_15_25
					end

					if arg_12_1.bgmTimer then
						arg_12_1.bgmTimer:Stop()

						arg_12_1.bgmTimer = nil
					end

					if arg_12_1.settingData.show_music_name == 1 then
						arg_12_1.musicController:SetSelectedState("show")
						arg_12_1.musicAnimator_:Play("open", 0, 0)

						if arg_12_1.settingData.music_time ~= 0 then
							arg_12_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_12_1.settingData.music_time), function()
								if arg_12_1 == nil or isNil(arg_12_1.bgmTxt_) then
									return
								end

								arg_12_1.musicController:SetSelectedState("hide")
								arg_12_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_15_26 = 0.333333333333333
			local var_15_27 = 1

			if var_15_26 < arg_12_1.time_ and arg_12_1.time_ <= var_15_26 + arg_15_0 then
				local var_15_28 = "play"
				local var_15_29 = "music"

				arg_12_1:AudioAction(var_15_28, var_15_29, "bgm_activity_4_2_story_daily", "bgm_activity_4_2_story_daily", "bgm_activity_4_2_story_daily.awb")

				local var_15_30 = ""
				local var_15_31 = manager.audio:GetAudioName("bgm_activity_4_2_story_daily", "bgm_activity_4_2_story_daily")

				if var_15_31 ~= "" then
					if arg_12_1.bgmTxt_.text ~= var_15_31 and arg_12_1.bgmTxt_.text ~= "" then
						if arg_12_1.bgmTxt2_.text ~= "" then
							arg_12_1.bgmTxt_.text = arg_12_1.bgmTxt2_.text
						end

						arg_12_1.bgmTxt2_.text = var_15_31

						arg_12_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_12_1.bgmTxt_.text = var_15_31
					end

					if arg_12_1.bgmTimer then
						arg_12_1.bgmTimer:Stop()

						arg_12_1.bgmTimer = nil
					end

					if arg_12_1.settingData.show_music_name == 1 then
						arg_12_1.musicController:SetSelectedState("show")
						arg_12_1.musicAnimator_:Play("open", 0, 0)

						if arg_12_1.settingData.music_time ~= 0 then
							arg_12_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_12_1.settingData.music_time), function()
								if arg_12_1 == nil or isNil(arg_12_1.bgmTxt_) then
									return
								end

								arg_12_1.musicController:SetSelectedState("hide")
								arg_12_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_15_32 = 0
			local var_15_33 = 0.85

			if var_15_32 < arg_12_1.time_ and arg_12_1.time_ <= var_15_32 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_34 = arg_12_1:FormatText(StoryNameCfg[1202].name)

				arg_12_1.leftNameTxt_.text = var_15_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_35 = arg_12_1:GetWordFromCfg(419012003)
				local var_15_36 = arg_12_1:FormatText(var_15_35.content)

				arg_12_1.text_.text = var_15_36

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_37 = 34
				local var_15_38 = utf8.len(var_15_36)
				local var_15_39 = var_15_37 <= 0 and var_15_33 or var_15_33 * (var_15_38 / var_15_37)

				if var_15_39 > 0 and var_15_33 < var_15_39 then
					arg_12_1.talkMaxDuration = var_15_39

					if var_15_39 + var_15_32 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_39 + var_15_32
					end
				end

				arg_12_1.text_.text = var_15_36
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)
				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_40 = math.max(var_15_33, arg_12_1.talkMaxDuration)

			if var_15_32 <= arg_12_1.time_ and arg_12_1.time_ < var_15_32 + var_15_40 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_32) / var_15_40

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_32 + var_15_40 and arg_12_1.time_ < var_15_32 + var_15_40 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play419012004 = function(arg_18_0, arg_18_1)
		arg_18_1.time_ = 0
		arg_18_1.frameCnt_ = 0
		arg_18_1.state_ = "playing"
		arg_18_1.curTalkId_ = 419012004
		arg_18_1.duration_ = 5

		SetActive(arg_18_1.tipsGo_, false)

		function arg_18_1.onSingleLineFinish_()
			arg_18_1.onSingleLineUpdate_ = nil
			arg_18_1.onSingleLineFinish_ = nil
			arg_18_1.state_ = "waiting"
		end

		function arg_18_1.playNext_(arg_20_0)
			if arg_20_0 == 1 then
				arg_18_0:Play419012005(arg_18_1)
			end
		end

		function arg_18_1.onSingleLineUpdate_(arg_21_0)
			local var_21_0 = arg_18_1.actors_["1045ui_story"].transform
			local var_21_1 = 0

			if var_21_1 < arg_18_1.time_ and arg_18_1.time_ <= var_21_1 + arg_21_0 then
				arg_18_1.var_.moveOldPos1045ui_story = var_21_0.localPosition
			end

			local var_21_2 = 0.001

			if var_21_1 <= arg_18_1.time_ and arg_18_1.time_ < var_21_1 + var_21_2 then
				local var_21_3 = (arg_18_1.time_ - var_21_1) / var_21_2
				local var_21_4 = Vector3.New(0, -1, -6.05)

				var_21_0.localPosition = Vector3.Lerp(arg_18_1.var_.moveOldPos1045ui_story, var_21_4, var_21_3)

				local var_21_5 = manager.ui.mainCamera.transform.position - var_21_0.position

				var_21_0.forward = Vector3.New(var_21_5.x, var_21_5.y, var_21_5.z)

				local var_21_6 = var_21_0.localEulerAngles

				var_21_6.z = 0
				var_21_6.x = 0
				var_21_0.localEulerAngles = var_21_6
			end

			if arg_18_1.time_ >= var_21_1 + var_21_2 and arg_18_1.time_ < var_21_1 + var_21_2 + arg_21_0 then
				var_21_0.localPosition = Vector3.New(0, -1, -6.05)

				local var_21_7 = manager.ui.mainCamera.transform.position - var_21_0.position

				var_21_0.forward = Vector3.New(var_21_7.x, var_21_7.y, var_21_7.z)

				local var_21_8 = var_21_0.localEulerAngles

				var_21_8.z = 0
				var_21_8.x = 0
				var_21_0.localEulerAngles = var_21_8
			end

			local var_21_9 = 0

			if var_21_9 < arg_18_1.time_ and arg_18_1.time_ <= var_21_9 + arg_21_0 then
				arg_18_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action2_1")
			end

			local var_21_10 = 0
			local var_21_11 = 0.85

			if var_21_10 < arg_18_1.time_ and arg_18_1.time_ <= var_21_10 + arg_21_0 then
				arg_18_1.talkMaxDuration = 0
				arg_18_1.dialogCg_.alpha = 1

				arg_18_1.dialog_:SetActive(true)
				SetActive(arg_18_1.leftNameGo_, true)

				local var_21_12 = arg_18_1:FormatText(StoryNameCfg[1202].name)

				arg_18_1.leftNameTxt_.text = var_21_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_1.leftNameTxt_.transform)

				arg_18_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_18_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_18_1:RecordName(arg_18_1.leftNameTxt_.text)
				SetActive(arg_18_1.iconTrs_.gameObject, false)
				arg_18_1.callingController_:SetSelectedState("normal")

				local var_21_13 = arg_18_1:GetWordFromCfg(419012004)
				local var_21_14 = arg_18_1:FormatText(var_21_13.content)

				arg_18_1.text_.text = var_21_14

				LuaForUtil.ClearLinePrefixSymbol(arg_18_1.text_)

				local var_21_15 = 24
				local var_21_16 = utf8.len(var_21_14)
				local var_21_17 = var_21_15 <= 0 and var_21_11 or var_21_11 * (var_21_16 / var_21_15)

				if var_21_17 > 0 and var_21_11 < var_21_17 then
					arg_18_1.talkMaxDuration = var_21_17

					if var_21_17 + var_21_10 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_17 + var_21_10
					end
				end

				arg_18_1.text_.text = var_21_14
				arg_18_1.typewritter.percent = 0

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(false)
				arg_18_1:RecordContent(arg_18_1.text_.text)
			end

			local var_21_18 = math.max(var_21_11, arg_18_1.talkMaxDuration)

			if var_21_10 <= arg_18_1.time_ and arg_18_1.time_ < var_21_10 + var_21_18 then
				arg_18_1.typewritter.percent = (arg_18_1.time_ - var_21_10) / var_21_18

				arg_18_1.typewritter:SetDirty()
			end

			if arg_18_1.time_ >= var_21_10 + var_21_18 and arg_18_1.time_ < var_21_10 + var_21_18 + arg_21_0 then
				arg_18_1.typewritter.percent = 1

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(true)
			end
		end
	end,
	Play419012005 = function(arg_22_0, arg_22_1)
		arg_22_1.time_ = 0
		arg_22_1.frameCnt_ = 0
		arg_22_1.state_ = "playing"
		arg_22_1.curTalkId_ = 419012005
		arg_22_1.duration_ = 5

		SetActive(arg_22_1.tipsGo_, false)

		function arg_22_1.onSingleLineFinish_()
			arg_22_1.onSingleLineUpdate_ = nil
			arg_22_1.onSingleLineFinish_ = nil
			arg_22_1.state_ = "waiting"
		end

		function arg_22_1.playNext_(arg_24_0)
			if arg_24_0 == 1 then
				arg_22_0:Play419012006(arg_22_1)
			end
		end

		function arg_22_1.onSingleLineUpdate_(arg_25_0)
			local var_25_0 = arg_22_1.actors_["1045ui_story"].transform
			local var_25_1 = 0

			if var_25_1 < arg_22_1.time_ and arg_22_1.time_ <= var_25_1 + arg_25_0 then
				arg_22_1.var_.moveOldPos1045ui_story = var_25_0.localPosition
			end

			local var_25_2 = 0.001

			if var_25_1 <= arg_22_1.time_ and arg_22_1.time_ < var_25_1 + var_25_2 then
				local var_25_3 = (arg_22_1.time_ - var_25_1) / var_25_2
				local var_25_4 = Vector3.New(0, 100, 0)

				var_25_0.localPosition = Vector3.Lerp(arg_22_1.var_.moveOldPos1045ui_story, var_25_4, var_25_3)

				local var_25_5 = manager.ui.mainCamera.transform.position - var_25_0.position

				var_25_0.forward = Vector3.New(var_25_5.x, var_25_5.y, var_25_5.z)

				local var_25_6 = var_25_0.localEulerAngles

				var_25_6.z = 0
				var_25_6.x = 0
				var_25_0.localEulerAngles = var_25_6
			end

			if arg_22_1.time_ >= var_25_1 + var_25_2 and arg_22_1.time_ < var_25_1 + var_25_2 + arg_25_0 then
				var_25_0.localPosition = Vector3.New(0, 100, 0)

				local var_25_7 = manager.ui.mainCamera.transform.position - var_25_0.position

				var_25_0.forward = Vector3.New(var_25_7.x, var_25_7.y, var_25_7.z)

				local var_25_8 = var_25_0.localEulerAngles

				var_25_8.z = 0
				var_25_8.x = 0
				var_25_0.localEulerAngles = var_25_8
			end

			local var_25_9 = arg_22_1.actors_["1045ui_story"]
			local var_25_10 = 0

			if var_25_10 < arg_22_1.time_ and arg_22_1.time_ <= var_25_10 + arg_25_0 and not isNil(var_25_9) and arg_22_1.var_.characterEffect1045ui_story == nil then
				arg_22_1.var_.characterEffect1045ui_story = var_25_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_25_11 = 0.200000002980232

			if var_25_10 <= arg_22_1.time_ and arg_22_1.time_ < var_25_10 + var_25_11 and not isNil(var_25_9) then
				local var_25_12 = (arg_22_1.time_ - var_25_10) / var_25_11

				if arg_22_1.var_.characterEffect1045ui_story and not isNil(var_25_9) then
					local var_25_13 = Mathf.Lerp(0, 0.5, var_25_12)

					arg_22_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_22_1.var_.characterEffect1045ui_story.fillRatio = var_25_13
				end
			end

			if arg_22_1.time_ >= var_25_10 + var_25_11 and arg_22_1.time_ < var_25_10 + var_25_11 + arg_25_0 and not isNil(var_25_9) and arg_22_1.var_.characterEffect1045ui_story then
				local var_25_14 = 0.5

				arg_22_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_22_1.var_.characterEffect1045ui_story.fillRatio = var_25_14
			end

			local var_25_15 = 0.05
			local var_25_16 = 1

			if var_25_15 < arg_22_1.time_ and arg_22_1.time_ <= var_25_15 + arg_25_0 then
				local var_25_17 = "play"
				local var_25_18 = "effect"

				arg_22_1:AudioAction(var_25_17, var_25_18, "se_story_140", "se_story_140_camera_ui02", "")
			end

			local var_25_19 = 0
			local var_25_20 = 1.35

			if var_25_19 < arg_22_1.time_ and arg_22_1.time_ <= var_25_19 + arg_25_0 then
				arg_22_1.talkMaxDuration = 0
				arg_22_1.dialogCg_.alpha = 1

				arg_22_1.dialog_:SetActive(true)
				SetActive(arg_22_1.leftNameGo_, false)

				arg_22_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_22_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_22_1:RecordName(arg_22_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_22_1.iconTrs_.gameObject, false)
				arg_22_1.callingController_:SetSelectedState("normal")

				local var_25_21 = arg_22_1:GetWordFromCfg(419012005)
				local var_25_22 = arg_22_1:FormatText(var_25_21.content)

				arg_22_1.text_.text = var_25_22

				LuaForUtil.ClearLinePrefixSymbol(arg_22_1.text_)

				local var_25_23 = 54
				local var_25_24 = utf8.len(var_25_22)
				local var_25_25 = var_25_23 <= 0 and var_25_20 or var_25_20 * (var_25_24 / var_25_23)

				if var_25_25 > 0 and var_25_20 < var_25_25 then
					arg_22_1.talkMaxDuration = var_25_25

					if var_25_25 + var_25_19 > arg_22_1.duration_ then
						arg_22_1.duration_ = var_25_25 + var_25_19
					end
				end

				arg_22_1.text_.text = var_25_22
				arg_22_1.typewritter.percent = 0

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(false)
				arg_22_1:RecordContent(arg_22_1.text_.text)
			end

			local var_25_26 = math.max(var_25_20, arg_22_1.talkMaxDuration)

			if var_25_19 <= arg_22_1.time_ and arg_22_1.time_ < var_25_19 + var_25_26 then
				arg_22_1.typewritter.percent = (arg_22_1.time_ - var_25_19) / var_25_26

				arg_22_1.typewritter:SetDirty()
			end

			if arg_22_1.time_ >= var_25_19 + var_25_26 and arg_22_1.time_ < var_25_19 + var_25_26 + arg_25_0 then
				arg_22_1.typewritter.percent = 1

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(true)
			end
		end
	end,
	Play419012006 = function(arg_26_0, arg_26_1)
		arg_26_1.time_ = 0
		arg_26_1.frameCnt_ = 0
		arg_26_1.state_ = "playing"
		arg_26_1.curTalkId_ = 419012006
		arg_26_1.duration_ = 5

		SetActive(arg_26_1.tipsGo_, false)

		function arg_26_1.onSingleLineFinish_()
			arg_26_1.onSingleLineUpdate_ = nil
			arg_26_1.onSingleLineFinish_ = nil
			arg_26_1.state_ = "waiting"
		end

		function arg_26_1.playNext_(arg_28_0)
			if arg_28_0 == 1 then
				arg_26_0:Play419012007(arg_26_1)
			end
		end

		function arg_26_1.onSingleLineUpdate_(arg_29_0)
			local var_29_0 = "1095ui_story"

			if arg_26_1.actors_[var_29_0] == nil then
				local var_29_1 = Asset.Load("Char/" .. "1095ui_story")

				if not isNil(var_29_1) then
					local var_29_2 = Object.Instantiate(Asset.Load("Char/" .. "1095ui_story"), arg_26_1.stage_.transform)

					var_29_2.name = var_29_0
					var_29_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_26_1.actors_[var_29_0] = var_29_2

					local var_29_3 = var_29_2:GetComponentInChildren(typeof(CharacterEffect))

					var_29_3.enabled = true

					local var_29_4 = GameObjectTools.GetOrAddComponent(var_29_2, typeof(DynamicBoneHelper))

					if var_29_4 then
						var_29_4:EnableDynamicBone(false)
					end

					arg_26_1:ShowWeapon(var_29_3.transform, false)

					arg_26_1.var_[var_29_0 .. "Animator"] = var_29_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_26_1.var_[var_29_0 .. "Animator"].applyRootMotion = true
					arg_26_1.var_[var_29_0 .. "LipSync"] = var_29_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_29_5 = arg_26_1.actors_["1095ui_story"].transform
			local var_29_6 = 0

			if var_29_6 < arg_26_1.time_ and arg_26_1.time_ <= var_29_6 + arg_29_0 then
				arg_26_1.var_.moveOldPos1095ui_story = var_29_5.localPosition
			end

			local var_29_7 = 0.001

			if var_29_6 <= arg_26_1.time_ and arg_26_1.time_ < var_29_6 + var_29_7 then
				local var_29_8 = (arg_26_1.time_ - var_29_6) / var_29_7
				local var_29_9 = Vector3.New(-0.7, -0.98, -6.1)

				var_29_5.localPosition = Vector3.Lerp(arg_26_1.var_.moveOldPos1095ui_story, var_29_9, var_29_8)

				local var_29_10 = manager.ui.mainCamera.transform.position - var_29_5.position

				var_29_5.forward = Vector3.New(var_29_10.x, var_29_10.y, var_29_10.z)

				local var_29_11 = var_29_5.localEulerAngles

				var_29_11.z = 0
				var_29_11.x = 0
				var_29_5.localEulerAngles = var_29_11
			end

			if arg_26_1.time_ >= var_29_6 + var_29_7 and arg_26_1.time_ < var_29_6 + var_29_7 + arg_29_0 then
				var_29_5.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_29_12 = manager.ui.mainCamera.transform.position - var_29_5.position

				var_29_5.forward = Vector3.New(var_29_12.x, var_29_12.y, var_29_12.z)

				local var_29_13 = var_29_5.localEulerAngles

				var_29_13.z = 0
				var_29_13.x = 0
				var_29_5.localEulerAngles = var_29_13
			end

			local var_29_14 = arg_26_1.actors_["1095ui_story"]
			local var_29_15 = 0

			if var_29_15 < arg_26_1.time_ and arg_26_1.time_ <= var_29_15 + arg_29_0 and not isNil(var_29_14) and arg_26_1.var_.characterEffect1095ui_story == nil then
				arg_26_1.var_.characterEffect1095ui_story = var_29_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_29_16 = 0.200000002980232

			if var_29_15 <= arg_26_1.time_ and arg_26_1.time_ < var_29_15 + var_29_16 and not isNil(var_29_14) then
				local var_29_17 = (arg_26_1.time_ - var_29_15) / var_29_16

				if arg_26_1.var_.characterEffect1095ui_story and not isNil(var_29_14) then
					arg_26_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_26_1.time_ >= var_29_15 + var_29_16 and arg_26_1.time_ < var_29_15 + var_29_16 + arg_29_0 and not isNil(var_29_14) and arg_26_1.var_.characterEffect1095ui_story then
				arg_26_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_29_18 = 0

			if var_29_18 < arg_26_1.time_ and arg_26_1.time_ <= var_29_18 + arg_29_0 then
				arg_26_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_29_19 = 0

			if var_29_19 < arg_26_1.time_ and arg_26_1.time_ <= var_29_19 + arg_29_0 then
				arg_26_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_29_20 = 0
			local var_29_21 = 0.675

			if var_29_20 < arg_26_1.time_ and arg_26_1.time_ <= var_29_20 + arg_29_0 then
				arg_26_1.talkMaxDuration = 0
				arg_26_1.dialogCg_.alpha = 1

				arg_26_1.dialog_:SetActive(true)
				SetActive(arg_26_1.leftNameGo_, true)

				local var_29_22 = arg_26_1:FormatText(StoryNameCfg[471].name)

				arg_26_1.leftNameTxt_.text = var_29_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_1.leftNameTxt_.transform)

				arg_26_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_26_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_26_1:RecordName(arg_26_1.leftNameTxt_.text)
				SetActive(arg_26_1.iconTrs_.gameObject, false)
				arg_26_1.callingController_:SetSelectedState("normal")

				local var_29_23 = arg_26_1:GetWordFromCfg(419012006)
				local var_29_24 = arg_26_1:FormatText(var_29_23.content)

				arg_26_1.text_.text = var_29_24

				LuaForUtil.ClearLinePrefixSymbol(arg_26_1.text_)

				local var_29_25 = 27
				local var_29_26 = utf8.len(var_29_24)
				local var_29_27 = var_29_25 <= 0 and var_29_21 or var_29_21 * (var_29_26 / var_29_25)

				if var_29_27 > 0 and var_29_21 < var_29_27 then
					arg_26_1.talkMaxDuration = var_29_27

					if var_29_27 + var_29_20 > arg_26_1.duration_ then
						arg_26_1.duration_ = var_29_27 + var_29_20
					end
				end

				arg_26_1.text_.text = var_29_24
				arg_26_1.typewritter.percent = 0

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(false)
				arg_26_1:RecordContent(arg_26_1.text_.text)
			end

			local var_29_28 = math.max(var_29_21, arg_26_1.talkMaxDuration)

			if var_29_20 <= arg_26_1.time_ and arg_26_1.time_ < var_29_20 + var_29_28 then
				arg_26_1.typewritter.percent = (arg_26_1.time_ - var_29_20) / var_29_28

				arg_26_1.typewritter:SetDirty()
			end

			if arg_26_1.time_ >= var_29_20 + var_29_28 and arg_26_1.time_ < var_29_20 + var_29_28 + arg_29_0 then
				arg_26_1.typewritter.percent = 1

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(true)
			end
		end
	end,
	Play419012007 = function(arg_30_0, arg_30_1)
		arg_30_1.time_ = 0
		arg_30_1.frameCnt_ = 0
		arg_30_1.state_ = "playing"
		arg_30_1.curTalkId_ = 419012007
		arg_30_1.duration_ = 5

		SetActive(arg_30_1.tipsGo_, false)

		function arg_30_1.onSingleLineFinish_()
			arg_30_1.onSingleLineUpdate_ = nil
			arg_30_1.onSingleLineFinish_ = nil
			arg_30_1.state_ = "waiting"
		end

		function arg_30_1.playNext_(arg_32_0)
			if arg_32_0 == 1 then
				arg_30_0:Play419012008(arg_30_1)
			end
		end

		function arg_30_1.onSingleLineUpdate_(arg_33_0)
			local var_33_0 = arg_30_1.actors_["1045ui_story"].transform
			local var_33_1 = 0

			if var_33_1 < arg_30_1.time_ and arg_30_1.time_ <= var_33_1 + arg_33_0 then
				arg_30_1.var_.moveOldPos1045ui_story = var_33_0.localPosition
			end

			local var_33_2 = 0.001

			if var_33_1 <= arg_30_1.time_ and arg_30_1.time_ < var_33_1 + var_33_2 then
				local var_33_3 = (arg_30_1.time_ - var_33_1) / var_33_2
				local var_33_4 = Vector3.New(0.7, -1, -6.05)

				var_33_0.localPosition = Vector3.Lerp(arg_30_1.var_.moveOldPos1045ui_story, var_33_4, var_33_3)

				local var_33_5 = manager.ui.mainCamera.transform.position - var_33_0.position

				var_33_0.forward = Vector3.New(var_33_5.x, var_33_5.y, var_33_5.z)

				local var_33_6 = var_33_0.localEulerAngles

				var_33_6.z = 0
				var_33_6.x = 0
				var_33_0.localEulerAngles = var_33_6
			end

			if arg_30_1.time_ >= var_33_1 + var_33_2 and arg_30_1.time_ < var_33_1 + var_33_2 + arg_33_0 then
				var_33_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_33_7 = manager.ui.mainCamera.transform.position - var_33_0.position

				var_33_0.forward = Vector3.New(var_33_7.x, var_33_7.y, var_33_7.z)

				local var_33_8 = var_33_0.localEulerAngles

				var_33_8.z = 0
				var_33_8.x = 0
				var_33_0.localEulerAngles = var_33_8
			end

			local var_33_9 = arg_30_1.actors_["1045ui_story"]
			local var_33_10 = 0

			if var_33_10 < arg_30_1.time_ and arg_30_1.time_ <= var_33_10 + arg_33_0 and not isNil(var_33_9) and arg_30_1.var_.characterEffect1045ui_story == nil then
				arg_30_1.var_.characterEffect1045ui_story = var_33_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_33_11 = 0.200000002980232

			if var_33_10 <= arg_30_1.time_ and arg_30_1.time_ < var_33_10 + var_33_11 and not isNil(var_33_9) then
				local var_33_12 = (arg_30_1.time_ - var_33_10) / var_33_11

				if arg_30_1.var_.characterEffect1045ui_story and not isNil(var_33_9) then
					arg_30_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_30_1.time_ >= var_33_10 + var_33_11 and arg_30_1.time_ < var_33_10 + var_33_11 + arg_33_0 and not isNil(var_33_9) and arg_30_1.var_.characterEffect1045ui_story then
				arg_30_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_33_13 = arg_30_1.actors_["1095ui_story"]
			local var_33_14 = 0

			if var_33_14 < arg_30_1.time_ and arg_30_1.time_ <= var_33_14 + arg_33_0 and not isNil(var_33_13) and arg_30_1.var_.characterEffect1095ui_story == nil then
				arg_30_1.var_.characterEffect1095ui_story = var_33_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_33_15 = 0.200000002980232

			if var_33_14 <= arg_30_1.time_ and arg_30_1.time_ < var_33_14 + var_33_15 and not isNil(var_33_13) then
				local var_33_16 = (arg_30_1.time_ - var_33_14) / var_33_15

				if arg_30_1.var_.characterEffect1095ui_story and not isNil(var_33_13) then
					local var_33_17 = Mathf.Lerp(0, 0.5, var_33_16)

					arg_30_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_30_1.var_.characterEffect1095ui_story.fillRatio = var_33_17
				end
			end

			if arg_30_1.time_ >= var_33_14 + var_33_15 and arg_30_1.time_ < var_33_14 + var_33_15 + arg_33_0 and not isNil(var_33_13) and arg_30_1.var_.characterEffect1095ui_story then
				local var_33_18 = 0.5

				arg_30_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_30_1.var_.characterEffect1095ui_story.fillRatio = var_33_18
			end

			local var_33_19 = 0

			if var_33_19 < arg_30_1.time_ and arg_30_1.time_ <= var_33_19 + arg_33_0 then
				arg_30_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action2_2")
			end

			local var_33_20 = 0

			if var_33_20 < arg_30_1.time_ and arg_30_1.time_ <= var_33_20 + arg_33_0 then
				arg_30_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_shengqiA", "EmotionTimelineAnimator")
			end

			local var_33_21 = 0
			local var_33_22 = 0.6

			if var_33_21 < arg_30_1.time_ and arg_30_1.time_ <= var_33_21 + arg_33_0 then
				arg_30_1.talkMaxDuration = 0
				arg_30_1.dialogCg_.alpha = 1

				arg_30_1.dialog_:SetActive(true)
				SetActive(arg_30_1.leftNameGo_, true)

				local var_33_23 = arg_30_1:FormatText(StoryNameCfg[1202].name)

				arg_30_1.leftNameTxt_.text = var_33_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_30_1.leftNameTxt_.transform)

				arg_30_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_30_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_30_1:RecordName(arg_30_1.leftNameTxt_.text)
				SetActive(arg_30_1.iconTrs_.gameObject, false)
				arg_30_1.callingController_:SetSelectedState("normal")

				local var_33_24 = arg_30_1:GetWordFromCfg(419012007)
				local var_33_25 = arg_30_1:FormatText(var_33_24.content)

				arg_30_1.text_.text = var_33_25

				LuaForUtil.ClearLinePrefixSymbol(arg_30_1.text_)

				local var_33_26 = 19
				local var_33_27 = utf8.len(var_33_25)
				local var_33_28 = var_33_26 <= 0 and var_33_22 or var_33_22 * (var_33_27 / var_33_26)

				if var_33_28 > 0 and var_33_22 < var_33_28 then
					arg_30_1.talkMaxDuration = var_33_28

					if var_33_28 + var_33_21 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_28 + var_33_21
					end
				end

				arg_30_1.text_.text = var_33_25
				arg_30_1.typewritter.percent = 0

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(false)
				arg_30_1:RecordContent(arg_30_1.text_.text)
			end

			local var_33_29 = math.max(var_33_22, arg_30_1.talkMaxDuration)

			if var_33_21 <= arg_30_1.time_ and arg_30_1.time_ < var_33_21 + var_33_29 then
				arg_30_1.typewritter.percent = (arg_30_1.time_ - var_33_21) / var_33_29

				arg_30_1.typewritter:SetDirty()
			end

			if arg_30_1.time_ >= var_33_21 + var_33_29 and arg_30_1.time_ < var_33_21 + var_33_29 + arg_33_0 then
				arg_30_1.typewritter.percent = 1

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(true)
			end
		end
	end,
	Play419012008 = function(arg_34_0, arg_34_1)
		arg_34_1.time_ = 0
		arg_34_1.frameCnt_ = 0
		arg_34_1.state_ = "playing"
		arg_34_1.curTalkId_ = 419012008
		arg_34_1.duration_ = 5

		SetActive(arg_34_1.tipsGo_, false)

		function arg_34_1.onSingleLineFinish_()
			arg_34_1.onSingleLineUpdate_ = nil
			arg_34_1.onSingleLineFinish_ = nil
			arg_34_1.state_ = "waiting"
		end

		function arg_34_1.playNext_(arg_36_0)
			if arg_36_0 == 1 then
				arg_34_0:Play419012009(arg_34_1)
			end
		end

		function arg_34_1.onSingleLineUpdate_(arg_37_0)
			local var_37_0 = arg_34_1.actors_["1095ui_story"]
			local var_37_1 = 0

			if var_37_1 < arg_34_1.time_ and arg_34_1.time_ <= var_37_1 + arg_37_0 and not isNil(var_37_0) and arg_34_1.var_.characterEffect1095ui_story == nil then
				arg_34_1.var_.characterEffect1095ui_story = var_37_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_37_2 = 0.200000002980232

			if var_37_1 <= arg_34_1.time_ and arg_34_1.time_ < var_37_1 + var_37_2 and not isNil(var_37_0) then
				local var_37_3 = (arg_34_1.time_ - var_37_1) / var_37_2

				if arg_34_1.var_.characterEffect1095ui_story and not isNil(var_37_0) then
					arg_34_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_34_1.time_ >= var_37_1 + var_37_2 and arg_34_1.time_ < var_37_1 + var_37_2 + arg_37_0 and not isNil(var_37_0) and arg_34_1.var_.characterEffect1095ui_story then
				arg_34_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_37_4 = arg_34_1.actors_["1045ui_story"]
			local var_37_5 = 0

			if var_37_5 < arg_34_1.time_ and arg_34_1.time_ <= var_37_5 + arg_37_0 and not isNil(var_37_4) and arg_34_1.var_.characterEffect1045ui_story == nil then
				arg_34_1.var_.characterEffect1045ui_story = var_37_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_37_6 = 0.200000002980232

			if var_37_5 <= arg_34_1.time_ and arg_34_1.time_ < var_37_5 + var_37_6 and not isNil(var_37_4) then
				local var_37_7 = (arg_34_1.time_ - var_37_5) / var_37_6

				if arg_34_1.var_.characterEffect1045ui_story and not isNil(var_37_4) then
					local var_37_8 = Mathf.Lerp(0, 0.5, var_37_7)

					arg_34_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_34_1.var_.characterEffect1045ui_story.fillRatio = var_37_8
				end
			end

			if arg_34_1.time_ >= var_37_5 + var_37_6 and arg_34_1.time_ < var_37_5 + var_37_6 + arg_37_0 and not isNil(var_37_4) and arg_34_1.var_.characterEffect1045ui_story then
				local var_37_9 = 0.5

				arg_34_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_34_1.var_.characterEffect1045ui_story.fillRatio = var_37_9
			end

			local var_37_10 = 0

			if var_37_10 < arg_34_1.time_ and arg_34_1.time_ <= var_37_10 + arg_37_0 then
				arg_34_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_37_11 = 0
			local var_37_12 = 0.425

			if var_37_11 < arg_34_1.time_ and arg_34_1.time_ <= var_37_11 + arg_37_0 then
				arg_34_1.talkMaxDuration = 0
				arg_34_1.dialogCg_.alpha = 1

				arg_34_1.dialog_:SetActive(true)
				SetActive(arg_34_1.leftNameGo_, true)

				local var_37_13 = arg_34_1:FormatText(StoryNameCfg[471].name)

				arg_34_1.leftNameTxt_.text = var_37_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_34_1.leftNameTxt_.transform)

				arg_34_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_34_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_34_1:RecordName(arg_34_1.leftNameTxt_.text)
				SetActive(arg_34_1.iconTrs_.gameObject, false)
				arg_34_1.callingController_:SetSelectedState("normal")

				local var_37_14 = arg_34_1:GetWordFromCfg(419012008)
				local var_37_15 = arg_34_1:FormatText(var_37_14.content)

				arg_34_1.text_.text = var_37_15

				LuaForUtil.ClearLinePrefixSymbol(arg_34_1.text_)

				local var_37_16 = 17
				local var_37_17 = utf8.len(var_37_15)
				local var_37_18 = var_37_16 <= 0 and var_37_12 or var_37_12 * (var_37_17 / var_37_16)

				if var_37_18 > 0 and var_37_12 < var_37_18 then
					arg_34_1.talkMaxDuration = var_37_18

					if var_37_18 + var_37_11 > arg_34_1.duration_ then
						arg_34_1.duration_ = var_37_18 + var_37_11
					end
				end

				arg_34_1.text_.text = var_37_15
				arg_34_1.typewritter.percent = 0

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(false)
				arg_34_1:RecordContent(arg_34_1.text_.text)
			end

			local var_37_19 = math.max(var_37_12, arg_34_1.talkMaxDuration)

			if var_37_11 <= arg_34_1.time_ and arg_34_1.time_ < var_37_11 + var_37_19 then
				arg_34_1.typewritter.percent = (arg_34_1.time_ - var_37_11) / var_37_19

				arg_34_1.typewritter:SetDirty()
			end

			if arg_34_1.time_ >= var_37_11 + var_37_19 and arg_34_1.time_ < var_37_11 + var_37_19 + arg_37_0 then
				arg_34_1.typewritter.percent = 1

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(true)
			end
		end
	end,
	Play419012009 = function(arg_38_0, arg_38_1)
		arg_38_1.time_ = 0
		arg_38_1.frameCnt_ = 0
		arg_38_1.state_ = "playing"
		arg_38_1.curTalkId_ = 419012009
		arg_38_1.duration_ = 5

		SetActive(arg_38_1.tipsGo_, false)

		function arg_38_1.onSingleLineFinish_()
			arg_38_1.onSingleLineUpdate_ = nil
			arg_38_1.onSingleLineFinish_ = nil
			arg_38_1.state_ = "waiting"
		end

		function arg_38_1.playNext_(arg_40_0)
			if arg_40_0 == 1 then
				arg_38_0:Play419012010(arg_38_1)
			end
		end

		function arg_38_1.onSingleLineUpdate_(arg_41_0)
			local var_41_0 = 0
			local var_41_1 = 0.725

			if var_41_0 < arg_38_1.time_ and arg_38_1.time_ <= var_41_0 + arg_41_0 then
				arg_38_1.talkMaxDuration = 0
				arg_38_1.dialogCg_.alpha = 1

				arg_38_1.dialog_:SetActive(true)
				SetActive(arg_38_1.leftNameGo_, true)

				local var_41_2 = arg_38_1:FormatText(StoryNameCfg[471].name)

				arg_38_1.leftNameTxt_.text = var_41_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_1.leftNameTxt_.transform)

				arg_38_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_38_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_38_1:RecordName(arg_38_1.leftNameTxt_.text)
				SetActive(arg_38_1.iconTrs_.gameObject, false)
				arg_38_1.callingController_:SetSelectedState("normal")

				local var_41_3 = arg_38_1:GetWordFromCfg(419012009)
				local var_41_4 = arg_38_1:FormatText(var_41_3.content)

				arg_38_1.text_.text = var_41_4

				LuaForUtil.ClearLinePrefixSymbol(arg_38_1.text_)

				local var_41_5 = 29
				local var_41_6 = utf8.len(var_41_4)
				local var_41_7 = var_41_5 <= 0 and var_41_1 or var_41_1 * (var_41_6 / var_41_5)

				if var_41_7 > 0 and var_41_1 < var_41_7 then
					arg_38_1.talkMaxDuration = var_41_7

					if var_41_7 + var_41_0 > arg_38_1.duration_ then
						arg_38_1.duration_ = var_41_7 + var_41_0
					end
				end

				arg_38_1.text_.text = var_41_4
				arg_38_1.typewritter.percent = 0

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(false)
				arg_38_1:RecordContent(arg_38_1.text_.text)
			end

			local var_41_8 = math.max(var_41_1, arg_38_1.talkMaxDuration)

			if var_41_0 <= arg_38_1.time_ and arg_38_1.time_ < var_41_0 + var_41_8 then
				arg_38_1.typewritter.percent = (arg_38_1.time_ - var_41_0) / var_41_8

				arg_38_1.typewritter:SetDirty()
			end

			if arg_38_1.time_ >= var_41_0 + var_41_8 and arg_38_1.time_ < var_41_0 + var_41_8 + arg_41_0 then
				arg_38_1.typewritter.percent = 1

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(true)
			end
		end
	end,
	Play419012010 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 419012010
		arg_42_1.duration_ = 5

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play419012011(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = arg_42_1.actors_["1095ui_story"]
			local var_45_1 = 0

			if var_45_1 < arg_42_1.time_ and arg_42_1.time_ <= var_45_1 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.characterEffect1095ui_story == nil then
				arg_42_1.var_.characterEffect1095ui_story = var_45_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_45_2 = 0.200000002980232

			if var_45_1 <= arg_42_1.time_ and arg_42_1.time_ < var_45_1 + var_45_2 and not isNil(var_45_0) then
				local var_45_3 = (arg_42_1.time_ - var_45_1) / var_45_2

				if arg_42_1.var_.characterEffect1095ui_story and not isNil(var_45_0) then
					local var_45_4 = Mathf.Lerp(0, 0.5, var_45_3)

					arg_42_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_42_1.var_.characterEffect1095ui_story.fillRatio = var_45_4
				end
			end

			if arg_42_1.time_ >= var_45_1 + var_45_2 and arg_42_1.time_ < var_45_1 + var_45_2 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.characterEffect1095ui_story then
				local var_45_5 = 0.5

				arg_42_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_42_1.var_.characterEffect1095ui_story.fillRatio = var_45_5
			end

			local var_45_6 = 0

			if var_45_6 < arg_42_1.time_ and arg_42_1.time_ <= var_45_6 + arg_45_0 then
				arg_42_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action4_1")
			end

			local var_45_7 = 0

			if var_45_7 < arg_42_1.time_ and arg_42_1.time_ <= var_45_7 + arg_45_0 then
				arg_42_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_shengqiA", "EmotionTimelineAnimator")
			end

			local var_45_8 = 0
			local var_45_9 = 0.2

			if var_45_8 < arg_42_1.time_ and arg_42_1.time_ <= var_45_8 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0
				arg_42_1.dialogCg_.alpha = 1

				arg_42_1.dialog_:SetActive(true)
				SetActive(arg_42_1.leftNameGo_, false)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_42_1.iconTrs_.gameObject, false)
				arg_42_1.callingController_:SetSelectedState("normal")

				local var_45_10 = arg_42_1:GetWordFromCfg(419012010)
				local var_45_11 = arg_42_1:FormatText(var_45_10.content)

				arg_42_1.text_.text = var_45_11

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_12 = 8
				local var_45_13 = utf8.len(var_45_11)
				local var_45_14 = var_45_12 <= 0 and var_45_9 or var_45_9 * (var_45_13 / var_45_12)

				if var_45_14 > 0 and var_45_9 < var_45_14 then
					arg_42_1.talkMaxDuration = var_45_14

					if var_45_14 + var_45_8 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_14 + var_45_8
					end
				end

				arg_42_1.text_.text = var_45_11
				arg_42_1.typewritter.percent = 0

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(false)
				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_15 = math.max(var_45_9, arg_42_1.talkMaxDuration)

			if var_45_8 <= arg_42_1.time_ and arg_42_1.time_ < var_45_8 + var_45_15 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_8) / var_45_15

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_8 + var_45_15 and arg_42_1.time_ < var_45_8 + var_45_15 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play419012011 = function(arg_46_0, arg_46_1)
		arg_46_1.time_ = 0
		arg_46_1.frameCnt_ = 0
		arg_46_1.state_ = "playing"
		arg_46_1.curTalkId_ = 419012011
		arg_46_1.duration_ = 5

		SetActive(arg_46_1.tipsGo_, false)

		function arg_46_1.onSingleLineFinish_()
			arg_46_1.onSingleLineUpdate_ = nil
			arg_46_1.onSingleLineFinish_ = nil
			arg_46_1.state_ = "waiting"
		end

		function arg_46_1.playNext_(arg_48_0)
			if arg_48_0 == 1 then
				arg_46_0:Play419012012(arg_46_1)
			end
		end

		function arg_46_1.onSingleLineUpdate_(arg_49_0)
			local var_49_0 = arg_46_1.actors_["1095ui_story"]
			local var_49_1 = 0

			if var_49_1 < arg_46_1.time_ and arg_46_1.time_ <= var_49_1 + arg_49_0 and not isNil(var_49_0) and arg_46_1.var_.characterEffect1095ui_story == nil then
				arg_46_1.var_.characterEffect1095ui_story = var_49_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_49_2 = 0.200000002980232

			if var_49_1 <= arg_46_1.time_ and arg_46_1.time_ < var_49_1 + var_49_2 and not isNil(var_49_0) then
				local var_49_3 = (arg_46_1.time_ - var_49_1) / var_49_2

				if arg_46_1.var_.characterEffect1095ui_story and not isNil(var_49_0) then
					arg_46_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_46_1.time_ >= var_49_1 + var_49_2 and arg_46_1.time_ < var_49_1 + var_49_2 + arg_49_0 and not isNil(var_49_0) and arg_46_1.var_.characterEffect1095ui_story then
				arg_46_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_49_4 = 0
			local var_49_5 = 0.55

			if var_49_4 < arg_46_1.time_ and arg_46_1.time_ <= var_49_4 + arg_49_0 then
				arg_46_1.talkMaxDuration = 0
				arg_46_1.dialogCg_.alpha = 1

				arg_46_1.dialog_:SetActive(true)
				SetActive(arg_46_1.leftNameGo_, true)

				local var_49_6 = arg_46_1:FormatText(StoryNameCfg[471].name)

				arg_46_1.leftNameTxt_.text = var_49_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_46_1.leftNameTxt_.transform)

				arg_46_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_46_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_46_1:RecordName(arg_46_1.leftNameTxt_.text)
				SetActive(arg_46_1.iconTrs_.gameObject, false)
				arg_46_1.callingController_:SetSelectedState("normal")

				local var_49_7 = arg_46_1:GetWordFromCfg(419012011)
				local var_49_8 = arg_46_1:FormatText(var_49_7.content)

				arg_46_1.text_.text = var_49_8

				LuaForUtil.ClearLinePrefixSymbol(arg_46_1.text_)

				local var_49_9 = 22
				local var_49_10 = utf8.len(var_49_8)
				local var_49_11 = var_49_9 <= 0 and var_49_5 or var_49_5 * (var_49_10 / var_49_9)

				if var_49_11 > 0 and var_49_5 < var_49_11 then
					arg_46_1.talkMaxDuration = var_49_11

					if var_49_11 + var_49_4 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_11 + var_49_4
					end
				end

				arg_46_1.text_.text = var_49_8
				arg_46_1.typewritter.percent = 0

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(false)
				arg_46_1:RecordContent(arg_46_1.text_.text)
			end

			local var_49_12 = math.max(var_49_5, arg_46_1.talkMaxDuration)

			if var_49_4 <= arg_46_1.time_ and arg_46_1.time_ < var_49_4 + var_49_12 then
				arg_46_1.typewritter.percent = (arg_46_1.time_ - var_49_4) / var_49_12

				arg_46_1.typewritter:SetDirty()
			end

			if arg_46_1.time_ >= var_49_4 + var_49_12 and arg_46_1.time_ < var_49_4 + var_49_12 + arg_49_0 then
				arg_46_1.typewritter.percent = 1

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(true)
			end
		end
	end,
	Play419012012 = function(arg_50_0, arg_50_1)
		arg_50_1.time_ = 0
		arg_50_1.frameCnt_ = 0
		arg_50_1.state_ = "playing"
		arg_50_1.curTalkId_ = 419012012
		arg_50_1.duration_ = 5

		SetActive(arg_50_1.tipsGo_, false)

		function arg_50_1.onSingleLineFinish_()
			arg_50_1.onSingleLineUpdate_ = nil
			arg_50_1.onSingleLineFinish_ = nil
			arg_50_1.state_ = "waiting"
		end

		function arg_50_1.playNext_(arg_52_0)
			if arg_52_0 == 1 then
				arg_50_0:Play419012013(arg_50_1)
			end
		end

		function arg_50_1.onSingleLineUpdate_(arg_53_0)
			local var_53_0 = arg_50_1.actors_["1045ui_story"]
			local var_53_1 = 0

			if var_53_1 < arg_50_1.time_ and arg_50_1.time_ <= var_53_1 + arg_53_0 and not isNil(var_53_0) and arg_50_1.var_.characterEffect1045ui_story == nil then
				arg_50_1.var_.characterEffect1045ui_story = var_53_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_53_2 = 0.200000002980232

			if var_53_1 <= arg_50_1.time_ and arg_50_1.time_ < var_53_1 + var_53_2 and not isNil(var_53_0) then
				local var_53_3 = (arg_50_1.time_ - var_53_1) / var_53_2

				if arg_50_1.var_.characterEffect1045ui_story and not isNil(var_53_0) then
					arg_50_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_50_1.time_ >= var_53_1 + var_53_2 and arg_50_1.time_ < var_53_1 + var_53_2 + arg_53_0 and not isNil(var_53_0) and arg_50_1.var_.characterEffect1045ui_story then
				arg_50_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_53_4 = arg_50_1.actors_["1095ui_story"]
			local var_53_5 = 0

			if var_53_5 < arg_50_1.time_ and arg_50_1.time_ <= var_53_5 + arg_53_0 and not isNil(var_53_4) and arg_50_1.var_.characterEffect1095ui_story == nil then
				arg_50_1.var_.characterEffect1095ui_story = var_53_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_53_6 = 0.200000002980232

			if var_53_5 <= arg_50_1.time_ and arg_50_1.time_ < var_53_5 + var_53_6 and not isNil(var_53_4) then
				local var_53_7 = (arg_50_1.time_ - var_53_5) / var_53_6

				if arg_50_1.var_.characterEffect1095ui_story and not isNil(var_53_4) then
					local var_53_8 = Mathf.Lerp(0, 0.5, var_53_7)

					arg_50_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_50_1.var_.characterEffect1095ui_story.fillRatio = var_53_8
				end
			end

			if arg_50_1.time_ >= var_53_5 + var_53_6 and arg_50_1.time_ < var_53_5 + var_53_6 + arg_53_0 and not isNil(var_53_4) and arg_50_1.var_.characterEffect1095ui_story then
				local var_53_9 = 0.5

				arg_50_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_50_1.var_.characterEffect1095ui_story.fillRatio = var_53_9
			end

			local var_53_10 = 0
			local var_53_11 = 0.125

			if var_53_10 < arg_50_1.time_ and arg_50_1.time_ <= var_53_10 + arg_53_0 then
				arg_50_1.talkMaxDuration = 0
				arg_50_1.dialogCg_.alpha = 1

				arg_50_1.dialog_:SetActive(true)
				SetActive(arg_50_1.leftNameGo_, true)

				local var_53_12 = arg_50_1:FormatText(StoryNameCfg[1202].name)

				arg_50_1.leftNameTxt_.text = var_53_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_50_1.leftNameTxt_.transform)

				arg_50_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_50_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_50_1:RecordName(arg_50_1.leftNameTxt_.text)
				SetActive(arg_50_1.iconTrs_.gameObject, false)
				arg_50_1.callingController_:SetSelectedState("normal")

				local var_53_13 = arg_50_1:GetWordFromCfg(419012012)
				local var_53_14 = arg_50_1:FormatText(var_53_13.content)

				arg_50_1.text_.text = var_53_14

				LuaForUtil.ClearLinePrefixSymbol(arg_50_1.text_)

				local var_53_15 = 5
				local var_53_16 = utf8.len(var_53_14)
				local var_53_17 = var_53_15 <= 0 and var_53_11 or var_53_11 * (var_53_16 / var_53_15)

				if var_53_17 > 0 and var_53_11 < var_53_17 then
					arg_50_1.talkMaxDuration = var_53_17

					if var_53_17 + var_53_10 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_17 + var_53_10
					end
				end

				arg_50_1.text_.text = var_53_14
				arg_50_1.typewritter.percent = 0

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(false)
				arg_50_1:RecordContent(arg_50_1.text_.text)
			end

			local var_53_18 = math.max(var_53_11, arg_50_1.talkMaxDuration)

			if var_53_10 <= arg_50_1.time_ and arg_50_1.time_ < var_53_10 + var_53_18 then
				arg_50_1.typewritter.percent = (arg_50_1.time_ - var_53_10) / var_53_18

				arg_50_1.typewritter:SetDirty()
			end

			if arg_50_1.time_ >= var_53_10 + var_53_18 and arg_50_1.time_ < var_53_10 + var_53_18 + arg_53_0 then
				arg_50_1.typewritter.percent = 1

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(true)
			end
		end
	end,
	Play419012013 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 419012013
		arg_54_1.duration_ = 5

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play419012014(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = arg_54_1.actors_["1095ui_story"]
			local var_57_1 = 0

			if var_57_1 < arg_54_1.time_ and arg_54_1.time_ <= var_57_1 + arg_57_0 and not isNil(var_57_0) and arg_54_1.var_.characterEffect1095ui_story == nil then
				arg_54_1.var_.characterEffect1095ui_story = var_57_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_2 = 0.200000002980232

			if var_57_1 <= arg_54_1.time_ and arg_54_1.time_ < var_57_1 + var_57_2 and not isNil(var_57_0) then
				local var_57_3 = (arg_54_1.time_ - var_57_1) / var_57_2

				if arg_54_1.var_.characterEffect1095ui_story and not isNil(var_57_0) then
					arg_54_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_54_1.time_ >= var_57_1 + var_57_2 and arg_54_1.time_ < var_57_1 + var_57_2 + arg_57_0 and not isNil(var_57_0) and arg_54_1.var_.characterEffect1095ui_story then
				arg_54_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_57_4 = arg_54_1.actors_["1045ui_story"]
			local var_57_5 = 0

			if var_57_5 < arg_54_1.time_ and arg_54_1.time_ <= var_57_5 + arg_57_0 and not isNil(var_57_4) and arg_54_1.var_.characterEffect1045ui_story == nil then
				arg_54_1.var_.characterEffect1045ui_story = var_57_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_6 = 0.200000002980232

			if var_57_5 <= arg_54_1.time_ and arg_54_1.time_ < var_57_5 + var_57_6 and not isNil(var_57_4) then
				local var_57_7 = (arg_54_1.time_ - var_57_5) / var_57_6

				if arg_54_1.var_.characterEffect1045ui_story and not isNil(var_57_4) then
					local var_57_8 = Mathf.Lerp(0, 0.5, var_57_7)

					arg_54_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_54_1.var_.characterEffect1045ui_story.fillRatio = var_57_8
				end
			end

			if arg_54_1.time_ >= var_57_5 + var_57_6 and arg_54_1.time_ < var_57_5 + var_57_6 + arg_57_0 and not isNil(var_57_4) and arg_54_1.var_.characterEffect1045ui_story then
				local var_57_9 = 0.5

				arg_54_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_54_1.var_.characterEffect1045ui_story.fillRatio = var_57_9
			end

			local var_57_10 = 0

			if var_57_10 < arg_54_1.time_ and arg_54_1.time_ <= var_57_10 + arg_57_0 then
				arg_54_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_57_11 = 0
			local var_57_12 = 0.575

			if var_57_11 < arg_54_1.time_ and arg_54_1.time_ <= var_57_11 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0
				arg_54_1.dialogCg_.alpha = 1

				arg_54_1.dialog_:SetActive(true)
				SetActive(arg_54_1.leftNameGo_, true)

				local var_57_13 = arg_54_1:FormatText(StoryNameCfg[471].name)

				arg_54_1.leftNameTxt_.text = var_57_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_54_1.leftNameTxt_.transform)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1.leftNameTxt_.text)
				SetActive(arg_54_1.iconTrs_.gameObject, false)
				arg_54_1.callingController_:SetSelectedState("normal")

				local var_57_14 = arg_54_1:GetWordFromCfg(419012013)
				local var_57_15 = arg_54_1:FormatText(var_57_14.content)

				arg_54_1.text_.text = var_57_15

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_16 = 23
				local var_57_17 = utf8.len(var_57_15)
				local var_57_18 = var_57_16 <= 0 and var_57_12 or var_57_12 * (var_57_17 / var_57_16)

				if var_57_18 > 0 and var_57_12 < var_57_18 then
					arg_54_1.talkMaxDuration = var_57_18

					if var_57_18 + var_57_11 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_18 + var_57_11
					end
				end

				arg_54_1.text_.text = var_57_15
				arg_54_1.typewritter.percent = 0

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(false)
				arg_54_1:RecordContent(arg_54_1.text_.text)
			end

			local var_57_19 = math.max(var_57_12, arg_54_1.talkMaxDuration)

			if var_57_11 <= arg_54_1.time_ and arg_54_1.time_ < var_57_11 + var_57_19 then
				arg_54_1.typewritter.percent = (arg_54_1.time_ - var_57_11) / var_57_19

				arg_54_1.typewritter:SetDirty()
			end

			if arg_54_1.time_ >= var_57_11 + var_57_19 and arg_54_1.time_ < var_57_11 + var_57_19 + arg_57_0 then
				arg_54_1.typewritter.percent = 1

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(true)
			end
		end
	end,
	Play419012014 = function(arg_58_0, arg_58_1)
		arg_58_1.time_ = 0
		arg_58_1.frameCnt_ = 0
		arg_58_1.state_ = "playing"
		arg_58_1.curTalkId_ = 419012014
		arg_58_1.duration_ = 5

		SetActive(arg_58_1.tipsGo_, false)

		function arg_58_1.onSingleLineFinish_()
			arg_58_1.onSingleLineUpdate_ = nil
			arg_58_1.onSingleLineFinish_ = nil
			arg_58_1.state_ = "waiting"
		end

		function arg_58_1.playNext_(arg_60_0)
			if arg_60_0 == 1 then
				arg_58_0:Play419012015(arg_58_1)
			end
		end

		function arg_58_1.onSingleLineUpdate_(arg_61_0)
			local var_61_0 = arg_58_1.actors_["1045ui_story"]
			local var_61_1 = 0

			if var_61_1 < arg_58_1.time_ and arg_58_1.time_ <= var_61_1 + arg_61_0 and not isNil(var_61_0) and arg_58_1.var_.characterEffect1045ui_story == nil then
				arg_58_1.var_.characterEffect1045ui_story = var_61_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_61_2 = 0.200000002980232

			if var_61_1 <= arg_58_1.time_ and arg_58_1.time_ < var_61_1 + var_61_2 and not isNil(var_61_0) then
				local var_61_3 = (arg_58_1.time_ - var_61_1) / var_61_2

				if arg_58_1.var_.characterEffect1045ui_story and not isNil(var_61_0) then
					arg_58_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_58_1.time_ >= var_61_1 + var_61_2 and arg_58_1.time_ < var_61_1 + var_61_2 + arg_61_0 and not isNil(var_61_0) and arg_58_1.var_.characterEffect1045ui_story then
				arg_58_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_61_4 = arg_58_1.actors_["1095ui_story"]
			local var_61_5 = 0

			if var_61_5 < arg_58_1.time_ and arg_58_1.time_ <= var_61_5 + arg_61_0 and not isNil(var_61_4) and arg_58_1.var_.characterEffect1095ui_story == nil then
				arg_58_1.var_.characterEffect1095ui_story = var_61_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_61_6 = 0.200000002980232

			if var_61_5 <= arg_58_1.time_ and arg_58_1.time_ < var_61_5 + var_61_6 and not isNil(var_61_4) then
				local var_61_7 = (arg_58_1.time_ - var_61_5) / var_61_6

				if arg_58_1.var_.characterEffect1095ui_story and not isNil(var_61_4) then
					local var_61_8 = Mathf.Lerp(0, 0.5, var_61_7)

					arg_58_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_58_1.var_.characterEffect1095ui_story.fillRatio = var_61_8
				end
			end

			if arg_58_1.time_ >= var_61_5 + var_61_6 and arg_58_1.time_ < var_61_5 + var_61_6 + arg_61_0 and not isNil(var_61_4) and arg_58_1.var_.characterEffect1095ui_story then
				local var_61_9 = 0.5

				arg_58_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_58_1.var_.characterEffect1095ui_story.fillRatio = var_61_9
			end

			local var_61_10 = 0

			if var_61_10 < arg_58_1.time_ and arg_58_1.time_ <= var_61_10 + arg_61_0 then
				arg_58_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action4_2")
			end

			local var_61_11 = 0

			if var_61_11 < arg_58_1.time_ and arg_58_1.time_ <= var_61_11 + arg_61_0 then
				arg_58_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_jingyaC", "EmotionTimelineAnimator")
			end

			local var_61_12 = 0
			local var_61_13 = 0.575

			if var_61_12 < arg_58_1.time_ and arg_58_1.time_ <= var_61_12 + arg_61_0 then
				arg_58_1.talkMaxDuration = 0
				arg_58_1.dialogCg_.alpha = 1

				arg_58_1.dialog_:SetActive(true)
				SetActive(arg_58_1.leftNameGo_, true)

				local var_61_14 = arg_58_1:FormatText(StoryNameCfg[1202].name)

				arg_58_1.leftNameTxt_.text = var_61_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_58_1.leftNameTxt_.transform)

				arg_58_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_58_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_58_1:RecordName(arg_58_1.leftNameTxt_.text)
				SetActive(arg_58_1.iconTrs_.gameObject, false)
				arg_58_1.callingController_:SetSelectedState("normal")

				local var_61_15 = arg_58_1:GetWordFromCfg(419012014)
				local var_61_16 = arg_58_1:FormatText(var_61_15.content)

				arg_58_1.text_.text = var_61_16

				LuaForUtil.ClearLinePrefixSymbol(arg_58_1.text_)

				local var_61_17 = 23
				local var_61_18 = utf8.len(var_61_16)
				local var_61_19 = var_61_17 <= 0 and var_61_13 or var_61_13 * (var_61_18 / var_61_17)

				if var_61_19 > 0 and var_61_13 < var_61_19 then
					arg_58_1.talkMaxDuration = var_61_19

					if var_61_19 + var_61_12 > arg_58_1.duration_ then
						arg_58_1.duration_ = var_61_19 + var_61_12
					end
				end

				arg_58_1.text_.text = var_61_16
				arg_58_1.typewritter.percent = 0

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(false)
				arg_58_1:RecordContent(arg_58_1.text_.text)
			end

			local var_61_20 = math.max(var_61_13, arg_58_1.talkMaxDuration)

			if var_61_12 <= arg_58_1.time_ and arg_58_1.time_ < var_61_12 + var_61_20 then
				arg_58_1.typewritter.percent = (arg_58_1.time_ - var_61_12) / var_61_20

				arg_58_1.typewritter:SetDirty()
			end

			if arg_58_1.time_ >= var_61_12 + var_61_20 and arg_58_1.time_ < var_61_12 + var_61_20 + arg_61_0 then
				arg_58_1.typewritter.percent = 1

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(true)
			end
		end
	end,
	Play419012015 = function(arg_62_0, arg_62_1)
		arg_62_1.time_ = 0
		arg_62_1.frameCnt_ = 0
		arg_62_1.state_ = "playing"
		arg_62_1.curTalkId_ = 419012015
		arg_62_1.duration_ = 5

		SetActive(arg_62_1.tipsGo_, false)

		function arg_62_1.onSingleLineFinish_()
			arg_62_1.onSingleLineUpdate_ = nil
			arg_62_1.onSingleLineFinish_ = nil
			arg_62_1.state_ = "waiting"
		end

		function arg_62_1.playNext_(arg_64_0)
			if arg_64_0 == 1 then
				arg_62_0:Play419012016(arg_62_1)
			end
		end

		function arg_62_1.onSingleLineUpdate_(arg_65_0)
			local var_65_0 = arg_62_1.actors_["1045ui_story"]
			local var_65_1 = 0

			if var_65_1 < arg_62_1.time_ and arg_62_1.time_ <= var_65_1 + arg_65_0 and not isNil(var_65_0) and arg_62_1.var_.characterEffect1045ui_story == nil then
				arg_62_1.var_.characterEffect1045ui_story = var_65_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_65_2 = 0.200000002980232

			if var_65_1 <= arg_62_1.time_ and arg_62_1.time_ < var_65_1 + var_65_2 and not isNil(var_65_0) then
				local var_65_3 = (arg_62_1.time_ - var_65_1) / var_65_2

				if arg_62_1.var_.characterEffect1045ui_story and not isNil(var_65_0) then
					local var_65_4 = Mathf.Lerp(0, 0.5, var_65_3)

					arg_62_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_62_1.var_.characterEffect1045ui_story.fillRatio = var_65_4
				end
			end

			if arg_62_1.time_ >= var_65_1 + var_65_2 and arg_62_1.time_ < var_65_1 + var_65_2 + arg_65_0 and not isNil(var_65_0) and arg_62_1.var_.characterEffect1045ui_story then
				local var_65_5 = 0.5

				arg_62_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_62_1.var_.characterEffect1045ui_story.fillRatio = var_65_5
			end

			local var_65_6 = 0
			local var_65_7 = 1.1

			if var_65_6 < arg_62_1.time_ and arg_62_1.time_ <= var_65_6 + arg_65_0 then
				arg_62_1.talkMaxDuration = 0
				arg_62_1.dialogCg_.alpha = 1

				arg_62_1.dialog_:SetActive(true)
				SetActive(arg_62_1.leftNameGo_, false)

				arg_62_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_62_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_62_1:RecordName(arg_62_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_62_1.iconTrs_.gameObject, false)
				arg_62_1.callingController_:SetSelectedState("normal")

				local var_65_8 = arg_62_1:GetWordFromCfg(419012015)
				local var_65_9 = arg_62_1:FormatText(var_65_8.content)

				arg_62_1.text_.text = var_65_9

				LuaForUtil.ClearLinePrefixSymbol(arg_62_1.text_)

				local var_65_10 = 44
				local var_65_11 = utf8.len(var_65_9)
				local var_65_12 = var_65_10 <= 0 and var_65_7 or var_65_7 * (var_65_11 / var_65_10)

				if var_65_12 > 0 and var_65_7 < var_65_12 then
					arg_62_1.talkMaxDuration = var_65_12

					if var_65_12 + var_65_6 > arg_62_1.duration_ then
						arg_62_1.duration_ = var_65_12 + var_65_6
					end
				end

				arg_62_1.text_.text = var_65_9
				arg_62_1.typewritter.percent = 0

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(false)
				arg_62_1:RecordContent(arg_62_1.text_.text)
			end

			local var_65_13 = math.max(var_65_7, arg_62_1.talkMaxDuration)

			if var_65_6 <= arg_62_1.time_ and arg_62_1.time_ < var_65_6 + var_65_13 then
				arg_62_1.typewritter.percent = (arg_62_1.time_ - var_65_6) / var_65_13

				arg_62_1.typewritter:SetDirty()
			end

			if arg_62_1.time_ >= var_65_6 + var_65_13 and arg_62_1.time_ < var_65_6 + var_65_13 + arg_65_0 then
				arg_62_1.typewritter.percent = 1

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(true)
			end
		end
	end,
	Play419012016 = function(arg_66_0, arg_66_1)
		arg_66_1.time_ = 0
		arg_66_1.frameCnt_ = 0
		arg_66_1.state_ = "playing"
		arg_66_1.curTalkId_ = 419012016
		arg_66_1.duration_ = 5

		SetActive(arg_66_1.tipsGo_, false)

		function arg_66_1.onSingleLineFinish_()
			arg_66_1.onSingleLineUpdate_ = nil
			arg_66_1.onSingleLineFinish_ = nil
			arg_66_1.state_ = "waiting"
		end

		function arg_66_1.playNext_(arg_68_0)
			if arg_68_0 == 1 then
				arg_66_0:Play419012017(arg_66_1)
			end
		end

		function arg_66_1.onSingleLineUpdate_(arg_69_0)
			local var_69_0 = arg_66_1.actors_["1095ui_story"]
			local var_69_1 = 0

			if var_69_1 < arg_66_1.time_ and arg_66_1.time_ <= var_69_1 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.characterEffect1095ui_story == nil then
				arg_66_1.var_.characterEffect1095ui_story = var_69_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_69_2 = 0.200000002980232

			if var_69_1 <= arg_66_1.time_ and arg_66_1.time_ < var_69_1 + var_69_2 and not isNil(var_69_0) then
				local var_69_3 = (arg_66_1.time_ - var_69_1) / var_69_2

				if arg_66_1.var_.characterEffect1095ui_story and not isNil(var_69_0) then
					arg_66_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_66_1.time_ >= var_69_1 + var_69_2 and arg_66_1.time_ < var_69_1 + var_69_2 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.characterEffect1095ui_story then
				arg_66_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_69_4 = 0
			local var_69_5 = 0.6

			if var_69_4 < arg_66_1.time_ and arg_66_1.time_ <= var_69_4 + arg_69_0 then
				arg_66_1.talkMaxDuration = 0
				arg_66_1.dialogCg_.alpha = 1

				arg_66_1.dialog_:SetActive(true)
				SetActive(arg_66_1.leftNameGo_, true)

				local var_69_6 = arg_66_1:FormatText(StoryNameCfg[471].name)

				arg_66_1.leftNameTxt_.text = var_69_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_66_1.leftNameTxt_.transform)

				arg_66_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_66_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_66_1:RecordName(arg_66_1.leftNameTxt_.text)
				SetActive(arg_66_1.iconTrs_.gameObject, false)
				arg_66_1.callingController_:SetSelectedState("normal")

				local var_69_7 = arg_66_1:GetWordFromCfg(419012016)
				local var_69_8 = arg_66_1:FormatText(var_69_7.content)

				arg_66_1.text_.text = var_69_8

				LuaForUtil.ClearLinePrefixSymbol(arg_66_1.text_)

				local var_69_9 = 24
				local var_69_10 = utf8.len(var_69_8)
				local var_69_11 = var_69_9 <= 0 and var_69_5 or var_69_5 * (var_69_10 / var_69_9)

				if var_69_11 > 0 and var_69_5 < var_69_11 then
					arg_66_1.talkMaxDuration = var_69_11

					if var_69_11 + var_69_4 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_11 + var_69_4
					end
				end

				arg_66_1.text_.text = var_69_8
				arg_66_1.typewritter.percent = 0

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(false)
				arg_66_1:RecordContent(arg_66_1.text_.text)
			end

			local var_69_12 = math.max(var_69_5, arg_66_1.talkMaxDuration)

			if var_69_4 <= arg_66_1.time_ and arg_66_1.time_ < var_69_4 + var_69_12 then
				arg_66_1.typewritter.percent = (arg_66_1.time_ - var_69_4) / var_69_12

				arg_66_1.typewritter:SetDirty()
			end

			if arg_66_1.time_ >= var_69_4 + var_69_12 and arg_66_1.time_ < var_69_4 + var_69_12 + arg_69_0 then
				arg_66_1.typewritter.percent = 1

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(true)
			end
		end
	end,
	Play419012017 = function(arg_70_0, arg_70_1)
		arg_70_1.time_ = 0
		arg_70_1.frameCnt_ = 0
		arg_70_1.state_ = "playing"
		arg_70_1.curTalkId_ = 419012017
		arg_70_1.duration_ = 5

		SetActive(arg_70_1.tipsGo_, false)

		function arg_70_1.onSingleLineFinish_()
			arg_70_1.onSingleLineUpdate_ = nil
			arg_70_1.onSingleLineFinish_ = nil
			arg_70_1.state_ = "waiting"
		end

		function arg_70_1.playNext_(arg_72_0)
			if arg_72_0 == 1 then
				arg_70_0:Play419012018(arg_70_1)
			end
		end

		function arg_70_1.onSingleLineUpdate_(arg_73_0)
			local var_73_0 = 0
			local var_73_1 = 0.6

			if var_73_0 < arg_70_1.time_ and arg_70_1.time_ <= var_73_0 + arg_73_0 then
				arg_70_1.talkMaxDuration = 0
				arg_70_1.dialogCg_.alpha = 1

				arg_70_1.dialog_:SetActive(true)
				SetActive(arg_70_1.leftNameGo_, true)

				local var_73_2 = arg_70_1:FormatText(StoryNameCfg[471].name)

				arg_70_1.leftNameTxt_.text = var_73_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_70_1.leftNameTxt_.transform)

				arg_70_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_70_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_70_1:RecordName(arg_70_1.leftNameTxt_.text)
				SetActive(arg_70_1.iconTrs_.gameObject, false)
				arg_70_1.callingController_:SetSelectedState("normal")

				local var_73_3 = arg_70_1:GetWordFromCfg(419012017)
				local var_73_4 = arg_70_1:FormatText(var_73_3.content)

				arg_70_1.text_.text = var_73_4

				LuaForUtil.ClearLinePrefixSymbol(arg_70_1.text_)

				local var_73_5 = 24
				local var_73_6 = utf8.len(var_73_4)
				local var_73_7 = var_73_5 <= 0 and var_73_1 or var_73_1 * (var_73_6 / var_73_5)

				if var_73_7 > 0 and var_73_1 < var_73_7 then
					arg_70_1.talkMaxDuration = var_73_7

					if var_73_7 + var_73_0 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_7 + var_73_0
					end
				end

				arg_70_1.text_.text = var_73_4
				arg_70_1.typewritter.percent = 0

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(false)
				arg_70_1:RecordContent(arg_70_1.text_.text)
			end

			local var_73_8 = math.max(var_73_1, arg_70_1.talkMaxDuration)

			if var_73_0 <= arg_70_1.time_ and arg_70_1.time_ < var_73_0 + var_73_8 then
				arg_70_1.typewritter.percent = (arg_70_1.time_ - var_73_0) / var_73_8

				arg_70_1.typewritter:SetDirty()
			end

			if arg_70_1.time_ >= var_73_0 + var_73_8 and arg_70_1.time_ < var_73_0 + var_73_8 + arg_73_0 then
				arg_70_1.typewritter.percent = 1

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(true)
			end
		end
	end,
	Play419012018 = function(arg_74_0, arg_74_1)
		arg_74_1.time_ = 0
		arg_74_1.frameCnt_ = 0
		arg_74_1.state_ = "playing"
		arg_74_1.curTalkId_ = 419012018
		arg_74_1.duration_ = 9

		SetActive(arg_74_1.tipsGo_, false)

		function arg_74_1.onSingleLineFinish_()
			arg_74_1.onSingleLineUpdate_ = nil
			arg_74_1.onSingleLineFinish_ = nil
			arg_74_1.state_ = "waiting"
		end

		function arg_74_1.playNext_(arg_76_0)
			if arg_76_0 == 1 then
				arg_74_0:Play419012019(arg_74_1)
			end
		end

		function arg_74_1.onSingleLineUpdate_(arg_77_0)
			local var_77_0 = arg_74_1.actors_["1095ui_story"].transform
			local var_77_1 = 1.96599999815226

			if var_77_1 < arg_74_1.time_ and arg_74_1.time_ <= var_77_1 + arg_77_0 then
				arg_74_1.var_.moveOldPos1095ui_story = var_77_0.localPosition
			end

			local var_77_2 = 0.001

			if var_77_1 <= arg_74_1.time_ and arg_74_1.time_ < var_77_1 + var_77_2 then
				local var_77_3 = (arg_74_1.time_ - var_77_1) / var_77_2
				local var_77_4 = Vector3.New(0, 100, 0)

				var_77_0.localPosition = Vector3.Lerp(arg_74_1.var_.moveOldPos1095ui_story, var_77_4, var_77_3)

				local var_77_5 = manager.ui.mainCamera.transform.position - var_77_0.position

				var_77_0.forward = Vector3.New(var_77_5.x, var_77_5.y, var_77_5.z)

				local var_77_6 = var_77_0.localEulerAngles

				var_77_6.z = 0
				var_77_6.x = 0
				var_77_0.localEulerAngles = var_77_6
			end

			if arg_74_1.time_ >= var_77_1 + var_77_2 and arg_74_1.time_ < var_77_1 + var_77_2 + arg_77_0 then
				var_77_0.localPosition = Vector3.New(0, 100, 0)

				local var_77_7 = manager.ui.mainCamera.transform.position - var_77_0.position

				var_77_0.forward = Vector3.New(var_77_7.x, var_77_7.y, var_77_7.z)

				local var_77_8 = var_77_0.localEulerAngles

				var_77_8.z = 0
				var_77_8.x = 0
				var_77_0.localEulerAngles = var_77_8
			end

			local var_77_9 = arg_74_1.actors_["1045ui_story"].transform
			local var_77_10 = 1.96599999815226

			if var_77_10 < arg_74_1.time_ and arg_74_1.time_ <= var_77_10 + arg_77_0 then
				arg_74_1.var_.moveOldPos1045ui_story = var_77_9.localPosition
			end

			local var_77_11 = 0.001

			if var_77_10 <= arg_74_1.time_ and arg_74_1.time_ < var_77_10 + var_77_11 then
				local var_77_12 = (arg_74_1.time_ - var_77_10) / var_77_11
				local var_77_13 = Vector3.New(0, 100, 0)

				var_77_9.localPosition = Vector3.Lerp(arg_74_1.var_.moveOldPos1045ui_story, var_77_13, var_77_12)

				local var_77_14 = manager.ui.mainCamera.transform.position - var_77_9.position

				var_77_9.forward = Vector3.New(var_77_14.x, var_77_14.y, var_77_14.z)

				local var_77_15 = var_77_9.localEulerAngles

				var_77_15.z = 0
				var_77_15.x = 0
				var_77_9.localEulerAngles = var_77_15
			end

			if arg_74_1.time_ >= var_77_10 + var_77_11 and arg_74_1.time_ < var_77_10 + var_77_11 + arg_77_0 then
				var_77_9.localPosition = Vector3.New(0, 100, 0)

				local var_77_16 = manager.ui.mainCamera.transform.position - var_77_9.position

				var_77_9.forward = Vector3.New(var_77_16.x, var_77_16.y, var_77_16.z)

				local var_77_17 = var_77_9.localEulerAngles

				var_77_17.z = 0
				var_77_17.x = 0
				var_77_9.localEulerAngles = var_77_17
			end

			local var_77_18 = 0

			if var_77_18 < arg_74_1.time_ and arg_74_1.time_ <= var_77_18 + arg_77_0 then
				arg_74_1.mask_.enabled = true
				arg_74_1.mask_.raycastTarget = true

				arg_74_1:SetGaussion(false)
			end

			local var_77_19 = 2

			if var_77_18 <= arg_74_1.time_ and arg_74_1.time_ < var_77_18 + var_77_19 then
				local var_77_20 = (arg_74_1.time_ - var_77_18) / var_77_19
				local var_77_21 = Color.New(0, 0, 0)

				var_77_21.a = Mathf.Lerp(0, 1, var_77_20)
				arg_74_1.mask_.color = var_77_21
			end

			if arg_74_1.time_ >= var_77_18 + var_77_19 and arg_74_1.time_ < var_77_18 + var_77_19 + arg_77_0 then
				local var_77_22 = Color.New(0, 0, 0)

				var_77_22.a = 1
				arg_74_1.mask_.color = var_77_22
			end

			local var_77_23 = 2

			if var_77_23 < arg_74_1.time_ and arg_74_1.time_ <= var_77_23 + arg_77_0 then
				arg_74_1.mask_.enabled = true
				arg_74_1.mask_.raycastTarget = true

				arg_74_1:SetGaussion(false)
			end

			local var_77_24 = 2

			if var_77_23 <= arg_74_1.time_ and arg_74_1.time_ < var_77_23 + var_77_24 then
				local var_77_25 = (arg_74_1.time_ - var_77_23) / var_77_24
				local var_77_26 = Color.New(0, 0, 0)

				var_77_26.a = Mathf.Lerp(1, 0, var_77_25)
				arg_74_1.mask_.color = var_77_26
			end

			if arg_74_1.time_ >= var_77_23 + var_77_24 and arg_74_1.time_ < var_77_23 + var_77_24 + arg_77_0 then
				local var_77_27 = Color.New(0, 0, 0)
				local var_77_28 = 0

				arg_74_1.mask_.enabled = false
				var_77_27.a = var_77_28
				arg_74_1.mask_.color = var_77_27
			end

			local var_77_29 = "I18f"

			if arg_74_1.bgs_[var_77_29] == nil then
				local var_77_30 = Object.Instantiate(arg_74_1.paintGo_)

				var_77_30:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_77_29)
				var_77_30.name = var_77_29
				var_77_30.transform.parent = arg_74_1.stage_.transform
				var_77_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_74_1.bgs_[var_77_29] = var_77_30
			end

			local var_77_31 = 2

			if var_77_31 < arg_74_1.time_ and arg_74_1.time_ <= var_77_31 + arg_77_0 then
				local var_77_32 = manager.ui.mainCamera.transform.localPosition
				local var_77_33 = Vector3.New(0, 0, 10) + Vector3.New(var_77_32.x, var_77_32.y, 0)
				local var_77_34 = arg_74_1.bgs_.I18f

				var_77_34.transform.localPosition = var_77_33
				var_77_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_77_35 = var_77_34:GetComponent("SpriteRenderer")

				if var_77_35 and var_77_35.sprite then
					local var_77_36 = (var_77_34.transform.localPosition - var_77_32).z
					local var_77_37 = manager.ui.mainCameraCom_
					local var_77_38 = 2 * var_77_36 * Mathf.Tan(var_77_37.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_77_39 = var_77_38 * var_77_37.aspect
					local var_77_40 = var_77_35.sprite.bounds.size.x
					local var_77_41 = var_77_35.sprite.bounds.size.y
					local var_77_42 = var_77_39 / var_77_40
					local var_77_43 = var_77_38 / var_77_41
					local var_77_44 = var_77_43 < var_77_42 and var_77_42 or var_77_43

					var_77_34.transform.localScale = Vector3.New(var_77_44, var_77_44, 0)
				end

				for iter_77_0, iter_77_1 in pairs(arg_74_1.bgs_) do
					if iter_77_0 ~= "I18f" then
						iter_77_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_74_1.frameCnt_ <= 1 then
				arg_74_1.dialog_:SetActive(false)
			end

			local var_77_45 = 4
			local var_77_46 = 0.4

			if var_77_45 < arg_74_1.time_ and arg_74_1.time_ <= var_77_45 + arg_77_0 then
				arg_74_1.talkMaxDuration = 0

				arg_74_1.dialog_:SetActive(true)

				local var_77_47 = LeanTween.value(arg_74_1.dialog_, 0, 1, 0.3)

				var_77_47:setOnUpdate(LuaHelper.FloatAction(function(arg_78_0)
					arg_74_1.dialogCg_.alpha = arg_78_0
				end))
				var_77_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_74_1.dialog_)
					var_77_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_74_1.duration_ = arg_74_1.duration_ + 0.3

				SetActive(arg_74_1.leftNameGo_, true)

				local var_77_48 = arg_74_1:FormatText(StoryNameCfg[471].name)

				arg_74_1.leftNameTxt_.text = var_77_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_74_1.leftNameTxt_.transform)

				arg_74_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_74_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_74_1:RecordName(arg_74_1.leftNameTxt_.text)
				SetActive(arg_74_1.iconTrs_.gameObject, true)
				arg_74_1.iconController_:SetSelectedState("hero")

				arg_74_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_74_1.callingController_:SetSelectedState("normal")

				arg_74_1.keyicon_.color = Color.New(1, 1, 1)
				arg_74_1.icon_.color = Color.New(1, 1, 1)

				local var_77_49 = arg_74_1:GetWordFromCfg(419012018)
				local var_77_50 = arg_74_1:FormatText(var_77_49.content)

				arg_74_1.text_.text = var_77_50

				LuaForUtil.ClearLinePrefixSymbol(arg_74_1.text_)

				local var_77_51 = 16
				local var_77_52 = utf8.len(var_77_50)
				local var_77_53 = var_77_51 <= 0 and var_77_46 or var_77_46 * (var_77_52 / var_77_51)

				if var_77_53 > 0 and var_77_46 < var_77_53 then
					arg_74_1.talkMaxDuration = var_77_53
					var_77_45 = var_77_45 + 0.3

					if var_77_53 + var_77_45 > arg_74_1.duration_ then
						arg_74_1.duration_ = var_77_53 + var_77_45
					end
				end

				arg_74_1.text_.text = var_77_50
				arg_74_1.typewritter.percent = 0

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(false)
				arg_74_1:RecordContent(arg_74_1.text_.text)
			end

			local var_77_54 = var_77_45 + 0.3
			local var_77_55 = math.max(var_77_46, arg_74_1.talkMaxDuration)

			if var_77_54 <= arg_74_1.time_ and arg_74_1.time_ < var_77_54 + var_77_55 then
				arg_74_1.typewritter.percent = (arg_74_1.time_ - var_77_54) / var_77_55

				arg_74_1.typewritter:SetDirty()
			end

			if arg_74_1.time_ >= var_77_54 + var_77_55 and arg_74_1.time_ < var_77_54 + var_77_55 + arg_77_0 then
				arg_74_1.typewritter.percent = 1

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(true)
			end
		end
	end,
	Play419012019 = function(arg_80_0, arg_80_1)
		arg_80_1.time_ = 0
		arg_80_1.frameCnt_ = 0
		arg_80_1.state_ = "playing"
		arg_80_1.curTalkId_ = 419012019
		arg_80_1.duration_ = 5

		SetActive(arg_80_1.tipsGo_, false)

		function arg_80_1.onSingleLineFinish_()
			arg_80_1.onSingleLineUpdate_ = nil
			arg_80_1.onSingleLineFinish_ = nil
			arg_80_1.state_ = "waiting"
		end

		function arg_80_1.playNext_(arg_82_0)
			if arg_82_0 == 1 then
				arg_80_0:Play419012020(arg_80_1)
			end
		end

		function arg_80_1.onSingleLineUpdate_(arg_83_0)
			local var_83_0 = arg_80_1.actors_["1095ui_story"].transform
			local var_83_1 = 0

			if var_83_1 < arg_80_1.time_ and arg_80_1.time_ <= var_83_1 + arg_83_0 then
				arg_80_1.var_.moveOldPos1095ui_story = var_83_0.localPosition
			end

			local var_83_2 = 0.001

			if var_83_1 <= arg_80_1.time_ and arg_80_1.time_ < var_83_1 + var_83_2 then
				local var_83_3 = (arg_80_1.time_ - var_83_1) / var_83_2
				local var_83_4 = Vector3.New(0, 100, 0)

				var_83_0.localPosition = Vector3.Lerp(arg_80_1.var_.moveOldPos1095ui_story, var_83_4, var_83_3)

				local var_83_5 = manager.ui.mainCamera.transform.position - var_83_0.position

				var_83_0.forward = Vector3.New(var_83_5.x, var_83_5.y, var_83_5.z)

				local var_83_6 = var_83_0.localEulerAngles

				var_83_6.z = 0
				var_83_6.x = 0
				var_83_0.localEulerAngles = var_83_6
			end

			if arg_80_1.time_ >= var_83_1 + var_83_2 and arg_80_1.time_ < var_83_1 + var_83_2 + arg_83_0 then
				var_83_0.localPosition = Vector3.New(0, 100, 0)

				local var_83_7 = manager.ui.mainCamera.transform.position - var_83_0.position

				var_83_0.forward = Vector3.New(var_83_7.x, var_83_7.y, var_83_7.z)

				local var_83_8 = var_83_0.localEulerAngles

				var_83_8.z = 0
				var_83_8.x = 0
				var_83_0.localEulerAngles = var_83_8
			end

			local var_83_9 = arg_80_1.actors_["1095ui_story"]
			local var_83_10 = 0

			if var_83_10 < arg_80_1.time_ and arg_80_1.time_ <= var_83_10 + arg_83_0 and not isNil(var_83_9) and arg_80_1.var_.characterEffect1095ui_story == nil then
				arg_80_1.var_.characterEffect1095ui_story = var_83_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_83_11 = 0.200000002980232

			if var_83_10 <= arg_80_1.time_ and arg_80_1.time_ < var_83_10 + var_83_11 and not isNil(var_83_9) then
				local var_83_12 = (arg_80_1.time_ - var_83_10) / var_83_11

				if arg_80_1.var_.characterEffect1095ui_story and not isNil(var_83_9) then
					local var_83_13 = Mathf.Lerp(0, 0.5, var_83_12)

					arg_80_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_80_1.var_.characterEffect1095ui_story.fillRatio = var_83_13
				end
			end

			if arg_80_1.time_ >= var_83_10 + var_83_11 and arg_80_1.time_ < var_83_10 + var_83_11 + arg_83_0 and not isNil(var_83_9) and arg_80_1.var_.characterEffect1095ui_story then
				local var_83_14 = 0.5

				arg_80_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_80_1.var_.characterEffect1095ui_story.fillRatio = var_83_14
			end

			local var_83_15 = 0.05
			local var_83_16 = 1

			if var_83_15 < arg_80_1.time_ and arg_80_1.time_ <= var_83_15 + arg_83_0 then
				local var_83_17 = "play"
				local var_83_18 = "effect"

				arg_80_1:AudioAction(var_83_17, var_83_18, "se_story_140", "se_story_140_car04", "")
			end

			local var_83_19 = 0
			local var_83_20 = 1.15

			if var_83_19 < arg_80_1.time_ and arg_80_1.time_ <= var_83_19 + arg_83_0 then
				arg_80_1.talkMaxDuration = 0
				arg_80_1.dialogCg_.alpha = 1

				arg_80_1.dialog_:SetActive(true)
				SetActive(arg_80_1.leftNameGo_, false)

				arg_80_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_80_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_80_1:RecordName(arg_80_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_80_1.iconTrs_.gameObject, false)
				arg_80_1.callingController_:SetSelectedState("normal")

				local var_83_21 = arg_80_1:GetWordFromCfg(419012019)
				local var_83_22 = arg_80_1:FormatText(var_83_21.content)

				arg_80_1.text_.text = var_83_22

				LuaForUtil.ClearLinePrefixSymbol(arg_80_1.text_)

				local var_83_23 = 46
				local var_83_24 = utf8.len(var_83_22)
				local var_83_25 = var_83_23 <= 0 and var_83_20 or var_83_20 * (var_83_24 / var_83_23)

				if var_83_25 > 0 and var_83_20 < var_83_25 then
					arg_80_1.talkMaxDuration = var_83_25

					if var_83_25 + var_83_19 > arg_80_1.duration_ then
						arg_80_1.duration_ = var_83_25 + var_83_19
					end
				end

				arg_80_1.text_.text = var_83_22
				arg_80_1.typewritter.percent = 0

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(false)
				arg_80_1:RecordContent(arg_80_1.text_.text)
			end

			local var_83_26 = math.max(var_83_20, arg_80_1.talkMaxDuration)

			if var_83_19 <= arg_80_1.time_ and arg_80_1.time_ < var_83_19 + var_83_26 then
				arg_80_1.typewritter.percent = (arg_80_1.time_ - var_83_19) / var_83_26

				arg_80_1.typewritter:SetDirty()
			end

			if arg_80_1.time_ >= var_83_19 + var_83_26 and arg_80_1.time_ < var_83_19 + var_83_26 + arg_83_0 then
				arg_80_1.typewritter.percent = 1

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(true)
			end
		end
	end,
	Play419012020 = function(arg_84_0, arg_84_1)
		arg_84_1.time_ = 0
		arg_84_1.frameCnt_ = 0
		arg_84_1.state_ = "playing"
		arg_84_1.curTalkId_ = 419012020
		arg_84_1.duration_ = 5

		SetActive(arg_84_1.tipsGo_, false)

		function arg_84_1.onSingleLineFinish_()
			arg_84_1.onSingleLineUpdate_ = nil
			arg_84_1.onSingleLineFinish_ = nil
			arg_84_1.state_ = "waiting"
		end

		function arg_84_1.playNext_(arg_86_0)
			if arg_86_0 == 1 then
				arg_84_0:Play419012021(arg_84_1)
			end
		end

		function arg_84_1.onSingleLineUpdate_(arg_87_0)
			local var_87_0 = arg_84_1.actors_["1095ui_story"].transform
			local var_87_1 = 0

			if var_87_1 < arg_84_1.time_ and arg_84_1.time_ <= var_87_1 + arg_87_0 then
				arg_84_1.var_.moveOldPos1095ui_story = var_87_0.localPosition
			end

			local var_87_2 = 0.001

			if var_87_1 <= arg_84_1.time_ and arg_84_1.time_ < var_87_1 + var_87_2 then
				local var_87_3 = (arg_84_1.time_ - var_87_1) / var_87_2
				local var_87_4 = Vector3.New(0, 100, 0)

				var_87_0.localPosition = Vector3.Lerp(arg_84_1.var_.moveOldPos1095ui_story, var_87_4, var_87_3)

				local var_87_5 = manager.ui.mainCamera.transform.position - var_87_0.position

				var_87_0.forward = Vector3.New(var_87_5.x, var_87_5.y, var_87_5.z)

				local var_87_6 = var_87_0.localEulerAngles

				var_87_6.z = 0
				var_87_6.x = 0
				var_87_0.localEulerAngles = var_87_6
			end

			if arg_84_1.time_ >= var_87_1 + var_87_2 and arg_84_1.time_ < var_87_1 + var_87_2 + arg_87_0 then
				var_87_0.localPosition = Vector3.New(0, 100, 0)

				local var_87_7 = manager.ui.mainCamera.transform.position - var_87_0.position

				var_87_0.forward = Vector3.New(var_87_7.x, var_87_7.y, var_87_7.z)

				local var_87_8 = var_87_0.localEulerAngles

				var_87_8.z = 0
				var_87_8.x = 0
				var_87_0.localEulerAngles = var_87_8
			end

			local var_87_9 = 0
			local var_87_10 = 1.5

			if var_87_9 < arg_84_1.time_ and arg_84_1.time_ <= var_87_9 + arg_87_0 then
				arg_84_1.talkMaxDuration = 0
				arg_84_1.dialogCg_.alpha = 1

				arg_84_1.dialog_:SetActive(true)
				SetActive(arg_84_1.leftNameGo_, false)

				arg_84_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_84_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_84_1:RecordName(arg_84_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_84_1.iconTrs_.gameObject, false)
				arg_84_1.callingController_:SetSelectedState("normal")

				local var_87_11 = arg_84_1:GetWordFromCfg(419012020)
				local var_87_12 = arg_84_1:FormatText(var_87_11.content)

				arg_84_1.text_.text = var_87_12

				LuaForUtil.ClearLinePrefixSymbol(arg_84_1.text_)

				local var_87_13 = 60
				local var_87_14 = utf8.len(var_87_12)
				local var_87_15 = var_87_13 <= 0 and var_87_10 or var_87_10 * (var_87_14 / var_87_13)

				if var_87_15 > 0 and var_87_10 < var_87_15 then
					arg_84_1.talkMaxDuration = var_87_15

					if var_87_15 + var_87_9 > arg_84_1.duration_ then
						arg_84_1.duration_ = var_87_15 + var_87_9
					end
				end

				arg_84_1.text_.text = var_87_12
				arg_84_1.typewritter.percent = 0

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(false)
				arg_84_1:RecordContent(arg_84_1.text_.text)
			end

			local var_87_16 = math.max(var_87_10, arg_84_1.talkMaxDuration)

			if var_87_9 <= arg_84_1.time_ and arg_84_1.time_ < var_87_9 + var_87_16 then
				arg_84_1.typewritter.percent = (arg_84_1.time_ - var_87_9) / var_87_16

				arg_84_1.typewritter:SetDirty()
			end

			if arg_84_1.time_ >= var_87_9 + var_87_16 and arg_84_1.time_ < var_87_9 + var_87_16 + arg_87_0 then
				arg_84_1.typewritter.percent = 1

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(true)
			end
		end
	end,
	Play419012021 = function(arg_88_0, arg_88_1)
		arg_88_1.time_ = 0
		arg_88_1.frameCnt_ = 0
		arg_88_1.state_ = "playing"
		arg_88_1.curTalkId_ = 419012021
		arg_88_1.duration_ = 5

		SetActive(arg_88_1.tipsGo_, false)

		function arg_88_1.onSingleLineFinish_()
			arg_88_1.onSingleLineUpdate_ = nil
			arg_88_1.onSingleLineFinish_ = nil
			arg_88_1.state_ = "waiting"
		end

		function arg_88_1.playNext_(arg_90_0)
			if arg_90_0 == 1 then
				arg_88_0:Play419012022(arg_88_1)
			end
		end

		function arg_88_1.onSingleLineUpdate_(arg_91_0)
			local var_91_0 = arg_88_1.actors_["1095ui_story"].transform
			local var_91_1 = 0

			if var_91_1 < arg_88_1.time_ and arg_88_1.time_ <= var_91_1 + arg_91_0 then
				arg_88_1.var_.moveOldPos1095ui_story = var_91_0.localPosition
			end

			local var_91_2 = 0.001

			if var_91_1 <= arg_88_1.time_ and arg_88_1.time_ < var_91_1 + var_91_2 then
				local var_91_3 = (arg_88_1.time_ - var_91_1) / var_91_2
				local var_91_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_91_0.localPosition = Vector3.Lerp(arg_88_1.var_.moveOldPos1095ui_story, var_91_4, var_91_3)

				local var_91_5 = manager.ui.mainCamera.transform.position - var_91_0.position

				var_91_0.forward = Vector3.New(var_91_5.x, var_91_5.y, var_91_5.z)

				local var_91_6 = var_91_0.localEulerAngles

				var_91_6.z = 0
				var_91_6.x = 0
				var_91_0.localEulerAngles = var_91_6
			end

			if arg_88_1.time_ >= var_91_1 + var_91_2 and arg_88_1.time_ < var_91_1 + var_91_2 + arg_91_0 then
				var_91_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_91_7 = manager.ui.mainCamera.transform.position - var_91_0.position

				var_91_0.forward = Vector3.New(var_91_7.x, var_91_7.y, var_91_7.z)

				local var_91_8 = var_91_0.localEulerAngles

				var_91_8.z = 0
				var_91_8.x = 0
				var_91_0.localEulerAngles = var_91_8
			end

			local var_91_9 = arg_88_1.actors_["1095ui_story"]
			local var_91_10 = 0

			if var_91_10 < arg_88_1.time_ and arg_88_1.time_ <= var_91_10 + arg_91_0 and not isNil(var_91_9) and arg_88_1.var_.characterEffect1095ui_story == nil then
				arg_88_1.var_.characterEffect1095ui_story = var_91_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_91_11 = 0.200000002980232

			if var_91_10 <= arg_88_1.time_ and arg_88_1.time_ < var_91_10 + var_91_11 and not isNil(var_91_9) then
				local var_91_12 = (arg_88_1.time_ - var_91_10) / var_91_11

				if arg_88_1.var_.characterEffect1095ui_story and not isNil(var_91_9) then
					arg_88_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_88_1.time_ >= var_91_10 + var_91_11 and arg_88_1.time_ < var_91_10 + var_91_11 + arg_91_0 and not isNil(var_91_9) and arg_88_1.var_.characterEffect1095ui_story then
				arg_88_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_91_13 = 0

			if var_91_13 < arg_88_1.time_ and arg_88_1.time_ <= var_91_13 + arg_91_0 then
				arg_88_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_91_14 = 0

			if var_91_14 < arg_88_1.time_ and arg_88_1.time_ <= var_91_14 + arg_91_0 then
				arg_88_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_91_15 = 0
			local var_91_16 = 1.475

			if var_91_15 < arg_88_1.time_ and arg_88_1.time_ <= var_91_15 + arg_91_0 then
				arg_88_1.talkMaxDuration = 0
				arg_88_1.dialogCg_.alpha = 1

				arg_88_1.dialog_:SetActive(true)
				SetActive(arg_88_1.leftNameGo_, true)

				local var_91_17 = arg_88_1:FormatText(StoryNameCfg[471].name)

				arg_88_1.leftNameTxt_.text = var_91_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_88_1.leftNameTxt_.transform)

				arg_88_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_88_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_88_1:RecordName(arg_88_1.leftNameTxt_.text)
				SetActive(arg_88_1.iconTrs_.gameObject, false)
				arg_88_1.callingController_:SetSelectedState("normal")

				local var_91_18 = arg_88_1:GetWordFromCfg(419012021)
				local var_91_19 = arg_88_1:FormatText(var_91_18.content)

				arg_88_1.text_.text = var_91_19

				LuaForUtil.ClearLinePrefixSymbol(arg_88_1.text_)

				local var_91_20 = 59
				local var_91_21 = utf8.len(var_91_19)
				local var_91_22 = var_91_20 <= 0 and var_91_16 or var_91_16 * (var_91_21 / var_91_20)

				if var_91_22 > 0 and var_91_16 < var_91_22 then
					arg_88_1.talkMaxDuration = var_91_22

					if var_91_22 + var_91_15 > arg_88_1.duration_ then
						arg_88_1.duration_ = var_91_22 + var_91_15
					end
				end

				arg_88_1.text_.text = var_91_19
				arg_88_1.typewritter.percent = 0

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(false)
				arg_88_1:RecordContent(arg_88_1.text_.text)
			end

			local var_91_23 = math.max(var_91_16, arg_88_1.talkMaxDuration)

			if var_91_15 <= arg_88_1.time_ and arg_88_1.time_ < var_91_15 + var_91_23 then
				arg_88_1.typewritter.percent = (arg_88_1.time_ - var_91_15) / var_91_23

				arg_88_1.typewritter:SetDirty()
			end

			if arg_88_1.time_ >= var_91_15 + var_91_23 and arg_88_1.time_ < var_91_15 + var_91_23 + arg_91_0 then
				arg_88_1.typewritter.percent = 1

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(true)
			end
		end
	end,
	Play419012022 = function(arg_92_0, arg_92_1)
		arg_92_1.time_ = 0
		arg_92_1.frameCnt_ = 0
		arg_92_1.state_ = "playing"
		arg_92_1.curTalkId_ = 419012022
		arg_92_1.duration_ = 5

		SetActive(arg_92_1.tipsGo_, false)

		function arg_92_1.onSingleLineFinish_()
			arg_92_1.onSingleLineUpdate_ = nil
			arg_92_1.onSingleLineFinish_ = nil
			arg_92_1.state_ = "waiting"
		end

		function arg_92_1.playNext_(arg_94_0)
			if arg_94_0 == 1 then
				arg_92_0:Play419012023(arg_92_1)
			end
		end

		function arg_92_1.onSingleLineUpdate_(arg_95_0)
			local var_95_0 = arg_92_1.actors_["1045ui_story"].transform
			local var_95_1 = 0

			if var_95_1 < arg_92_1.time_ and arg_92_1.time_ <= var_95_1 + arg_95_0 then
				arg_92_1.var_.moveOldPos1045ui_story = var_95_0.localPosition
			end

			local var_95_2 = 0.001

			if var_95_1 <= arg_92_1.time_ and arg_92_1.time_ < var_95_1 + var_95_2 then
				local var_95_3 = (arg_92_1.time_ - var_95_1) / var_95_2
				local var_95_4 = Vector3.New(0.7, -1, -6.05)

				var_95_0.localPosition = Vector3.Lerp(arg_92_1.var_.moveOldPos1045ui_story, var_95_4, var_95_3)

				local var_95_5 = manager.ui.mainCamera.transform.position - var_95_0.position

				var_95_0.forward = Vector3.New(var_95_5.x, var_95_5.y, var_95_5.z)

				local var_95_6 = var_95_0.localEulerAngles

				var_95_6.z = 0
				var_95_6.x = 0
				var_95_0.localEulerAngles = var_95_6
			end

			if arg_92_1.time_ >= var_95_1 + var_95_2 and arg_92_1.time_ < var_95_1 + var_95_2 + arg_95_0 then
				var_95_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_95_7 = manager.ui.mainCamera.transform.position - var_95_0.position

				var_95_0.forward = Vector3.New(var_95_7.x, var_95_7.y, var_95_7.z)

				local var_95_8 = var_95_0.localEulerAngles

				var_95_8.z = 0
				var_95_8.x = 0
				var_95_0.localEulerAngles = var_95_8
			end

			local var_95_9 = arg_92_1.actors_["1045ui_story"]
			local var_95_10 = 0

			if var_95_10 < arg_92_1.time_ and arg_92_1.time_ <= var_95_10 + arg_95_0 and not isNil(var_95_9) and arg_92_1.var_.characterEffect1045ui_story == nil then
				arg_92_1.var_.characterEffect1045ui_story = var_95_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_95_11 = 0.200000002980232

			if var_95_10 <= arg_92_1.time_ and arg_92_1.time_ < var_95_10 + var_95_11 and not isNil(var_95_9) then
				local var_95_12 = (arg_92_1.time_ - var_95_10) / var_95_11

				if arg_92_1.var_.characterEffect1045ui_story and not isNil(var_95_9) then
					arg_92_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_92_1.time_ >= var_95_10 + var_95_11 and arg_92_1.time_ < var_95_10 + var_95_11 + arg_95_0 and not isNil(var_95_9) and arg_92_1.var_.characterEffect1045ui_story then
				arg_92_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_95_13 = arg_92_1.actors_["1095ui_story"]
			local var_95_14 = 0

			if var_95_14 < arg_92_1.time_ and arg_92_1.time_ <= var_95_14 + arg_95_0 and not isNil(var_95_13) and arg_92_1.var_.characterEffect1095ui_story == nil then
				arg_92_1.var_.characterEffect1095ui_story = var_95_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_95_15 = 0.200000002980232

			if var_95_14 <= arg_92_1.time_ and arg_92_1.time_ < var_95_14 + var_95_15 and not isNil(var_95_13) then
				local var_95_16 = (arg_92_1.time_ - var_95_14) / var_95_15

				if arg_92_1.var_.characterEffect1095ui_story and not isNil(var_95_13) then
					local var_95_17 = Mathf.Lerp(0, 0.5, var_95_16)

					arg_92_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_92_1.var_.characterEffect1095ui_story.fillRatio = var_95_17
				end
			end

			if arg_92_1.time_ >= var_95_14 + var_95_15 and arg_92_1.time_ < var_95_14 + var_95_15 + arg_95_0 and not isNil(var_95_13) and arg_92_1.var_.characterEffect1095ui_story then
				local var_95_18 = 0.5

				arg_92_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_92_1.var_.characterEffect1095ui_story.fillRatio = var_95_18
			end

			local var_95_19 = 0

			if var_95_19 < arg_92_1.time_ and arg_92_1.time_ <= var_95_19 + arg_95_0 then
				arg_92_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action1_1")
			end

			local var_95_20 = 0

			if var_95_20 < arg_92_1.time_ and arg_92_1.time_ <= var_95_20 + arg_95_0 then
				arg_92_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_renzhen", "EmotionTimelineAnimator")
			end

			local var_95_21 = 0
			local var_95_22 = 0.75

			if var_95_21 < arg_92_1.time_ and arg_92_1.time_ <= var_95_21 + arg_95_0 then
				arg_92_1.talkMaxDuration = 0
				arg_92_1.dialogCg_.alpha = 1

				arg_92_1.dialog_:SetActive(true)
				SetActive(arg_92_1.leftNameGo_, true)

				local var_95_23 = arg_92_1:FormatText(StoryNameCfg[1202].name)

				arg_92_1.leftNameTxt_.text = var_95_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_92_1.leftNameTxt_.transform)

				arg_92_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_92_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_92_1:RecordName(arg_92_1.leftNameTxt_.text)
				SetActive(arg_92_1.iconTrs_.gameObject, false)
				arg_92_1.callingController_:SetSelectedState("normal")

				local var_95_24 = arg_92_1:GetWordFromCfg(419012022)
				local var_95_25 = arg_92_1:FormatText(var_95_24.content)

				arg_92_1.text_.text = var_95_25

				LuaForUtil.ClearLinePrefixSymbol(arg_92_1.text_)

				local var_95_26 = 30
				local var_95_27 = utf8.len(var_95_25)
				local var_95_28 = var_95_26 <= 0 and var_95_22 or var_95_22 * (var_95_27 / var_95_26)

				if var_95_28 > 0 and var_95_22 < var_95_28 then
					arg_92_1.talkMaxDuration = var_95_28

					if var_95_28 + var_95_21 > arg_92_1.duration_ then
						arg_92_1.duration_ = var_95_28 + var_95_21
					end
				end

				arg_92_1.text_.text = var_95_25
				arg_92_1.typewritter.percent = 0

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(false)
				arg_92_1:RecordContent(arg_92_1.text_.text)
			end

			local var_95_29 = math.max(var_95_22, arg_92_1.talkMaxDuration)

			if var_95_21 <= arg_92_1.time_ and arg_92_1.time_ < var_95_21 + var_95_29 then
				arg_92_1.typewritter.percent = (arg_92_1.time_ - var_95_21) / var_95_29

				arg_92_1.typewritter:SetDirty()
			end

			if arg_92_1.time_ >= var_95_21 + var_95_29 and arg_92_1.time_ < var_95_21 + var_95_29 + arg_95_0 then
				arg_92_1.typewritter.percent = 1

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(true)
			end
		end
	end,
	Play419012023 = function(arg_96_0, arg_96_1)
		arg_96_1.time_ = 0
		arg_96_1.frameCnt_ = 0
		arg_96_1.state_ = "playing"
		arg_96_1.curTalkId_ = 419012023
		arg_96_1.duration_ = 5

		SetActive(arg_96_1.tipsGo_, false)

		function arg_96_1.onSingleLineFinish_()
			arg_96_1.onSingleLineUpdate_ = nil
			arg_96_1.onSingleLineFinish_ = nil
			arg_96_1.state_ = "waiting"
		end

		function arg_96_1.playNext_(arg_98_0)
			if arg_98_0 == 1 then
				arg_96_0:Play419012024(arg_96_1)
			end
		end

		function arg_96_1.onSingleLineUpdate_(arg_99_0)
			local var_99_0 = 0
			local var_99_1 = 0.575

			if var_99_0 < arg_96_1.time_ and arg_96_1.time_ <= var_99_0 + arg_99_0 then
				arg_96_1.talkMaxDuration = 0
				arg_96_1.dialogCg_.alpha = 1

				arg_96_1.dialog_:SetActive(true)
				SetActive(arg_96_1.leftNameGo_, true)

				local var_99_2 = arg_96_1:FormatText(StoryNameCfg[1202].name)

				arg_96_1.leftNameTxt_.text = var_99_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_96_1.leftNameTxt_.transform)

				arg_96_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_96_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_96_1:RecordName(arg_96_1.leftNameTxt_.text)
				SetActive(arg_96_1.iconTrs_.gameObject, false)
				arg_96_1.callingController_:SetSelectedState("normal")

				local var_99_3 = arg_96_1:GetWordFromCfg(419012023)
				local var_99_4 = arg_96_1:FormatText(var_99_3.content)

				arg_96_1.text_.text = var_99_4

				LuaForUtil.ClearLinePrefixSymbol(arg_96_1.text_)

				local var_99_5 = 23
				local var_99_6 = utf8.len(var_99_4)
				local var_99_7 = var_99_5 <= 0 and var_99_1 or var_99_1 * (var_99_6 / var_99_5)

				if var_99_7 > 0 and var_99_1 < var_99_7 then
					arg_96_1.talkMaxDuration = var_99_7

					if var_99_7 + var_99_0 > arg_96_1.duration_ then
						arg_96_1.duration_ = var_99_7 + var_99_0
					end
				end

				arg_96_1.text_.text = var_99_4
				arg_96_1.typewritter.percent = 0

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(false)
				arg_96_1:RecordContent(arg_96_1.text_.text)
			end

			local var_99_8 = math.max(var_99_1, arg_96_1.talkMaxDuration)

			if var_99_0 <= arg_96_1.time_ and arg_96_1.time_ < var_99_0 + var_99_8 then
				arg_96_1.typewritter.percent = (arg_96_1.time_ - var_99_0) / var_99_8

				arg_96_1.typewritter:SetDirty()
			end

			if arg_96_1.time_ >= var_99_0 + var_99_8 and arg_96_1.time_ < var_99_0 + var_99_8 + arg_99_0 then
				arg_96_1.typewritter.percent = 1

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(true)
			end
		end
	end,
	Play419012024 = function(arg_100_0, arg_100_1)
		arg_100_1.time_ = 0
		arg_100_1.frameCnt_ = 0
		arg_100_1.state_ = "playing"
		arg_100_1.curTalkId_ = 419012024
		arg_100_1.duration_ = 5

		SetActive(arg_100_1.tipsGo_, false)

		function arg_100_1.onSingleLineFinish_()
			arg_100_1.onSingleLineUpdate_ = nil
			arg_100_1.onSingleLineFinish_ = nil
			arg_100_1.state_ = "waiting"
		end

		function arg_100_1.playNext_(arg_102_0)
			if arg_102_0 == 1 then
				arg_100_0:Play419012025(arg_100_1)
			end
		end

		function arg_100_1.onSingleLineUpdate_(arg_103_0)
			local var_103_0 = arg_100_1.actors_["1095ui_story"].transform
			local var_103_1 = 0

			if var_103_1 < arg_100_1.time_ and arg_100_1.time_ <= var_103_1 + arg_103_0 then
				arg_100_1.var_.moveOldPos1095ui_story = var_103_0.localPosition
			end

			local var_103_2 = 0.001

			if var_103_1 <= arg_100_1.time_ and arg_100_1.time_ < var_103_1 + var_103_2 then
				local var_103_3 = (arg_100_1.time_ - var_103_1) / var_103_2
				local var_103_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_103_0.localPosition = Vector3.Lerp(arg_100_1.var_.moveOldPos1095ui_story, var_103_4, var_103_3)

				local var_103_5 = manager.ui.mainCamera.transform.position - var_103_0.position

				var_103_0.forward = Vector3.New(var_103_5.x, var_103_5.y, var_103_5.z)

				local var_103_6 = var_103_0.localEulerAngles

				var_103_6.z = 0
				var_103_6.x = 0
				var_103_0.localEulerAngles = var_103_6
			end

			if arg_100_1.time_ >= var_103_1 + var_103_2 and arg_100_1.time_ < var_103_1 + var_103_2 + arg_103_0 then
				var_103_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_103_7 = manager.ui.mainCamera.transform.position - var_103_0.position

				var_103_0.forward = Vector3.New(var_103_7.x, var_103_7.y, var_103_7.z)

				local var_103_8 = var_103_0.localEulerAngles

				var_103_8.z = 0
				var_103_8.x = 0
				var_103_0.localEulerAngles = var_103_8
			end

			local var_103_9 = arg_100_1.actors_["1095ui_story"]
			local var_103_10 = 0

			if var_103_10 < arg_100_1.time_ and arg_100_1.time_ <= var_103_10 + arg_103_0 and not isNil(var_103_9) and arg_100_1.var_.characterEffect1095ui_story == nil then
				arg_100_1.var_.characterEffect1095ui_story = var_103_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_11 = 0.200000002980232

			if var_103_10 <= arg_100_1.time_ and arg_100_1.time_ < var_103_10 + var_103_11 and not isNil(var_103_9) then
				local var_103_12 = (arg_100_1.time_ - var_103_10) / var_103_11

				if arg_100_1.var_.characterEffect1095ui_story and not isNil(var_103_9) then
					arg_100_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_100_1.time_ >= var_103_10 + var_103_11 and arg_100_1.time_ < var_103_10 + var_103_11 + arg_103_0 and not isNil(var_103_9) and arg_100_1.var_.characterEffect1095ui_story then
				arg_100_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_103_13 = arg_100_1.actors_["1045ui_story"]
			local var_103_14 = 0

			if var_103_14 < arg_100_1.time_ and arg_100_1.time_ <= var_103_14 + arg_103_0 and not isNil(var_103_13) and arg_100_1.var_.characterEffect1045ui_story == nil then
				arg_100_1.var_.characterEffect1045ui_story = var_103_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_15 = 0.200000002980232

			if var_103_14 <= arg_100_1.time_ and arg_100_1.time_ < var_103_14 + var_103_15 and not isNil(var_103_13) then
				local var_103_16 = (arg_100_1.time_ - var_103_14) / var_103_15

				if arg_100_1.var_.characterEffect1045ui_story and not isNil(var_103_13) then
					local var_103_17 = Mathf.Lerp(0, 0.5, var_103_16)

					arg_100_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_100_1.var_.characterEffect1045ui_story.fillRatio = var_103_17
				end
			end

			if arg_100_1.time_ >= var_103_14 + var_103_15 and arg_100_1.time_ < var_103_14 + var_103_15 + arg_103_0 and not isNil(var_103_13) and arg_100_1.var_.characterEffect1045ui_story then
				local var_103_18 = 0.5

				arg_100_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_100_1.var_.characterEffect1045ui_story.fillRatio = var_103_18
			end

			local var_103_19 = 0

			if var_103_19 < arg_100_1.time_ and arg_100_1.time_ <= var_103_19 + arg_103_0 then
				arg_100_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_103_20 = 0

			if var_103_20 < arg_100_1.time_ and arg_100_1.time_ <= var_103_20 + arg_103_0 then
				arg_100_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileA_weixiao", "EmotionTimelineAnimator")
			end

			local var_103_21 = 0
			local var_103_22 = 0.325

			if var_103_21 < arg_100_1.time_ and arg_100_1.time_ <= var_103_21 + arg_103_0 then
				arg_100_1.talkMaxDuration = 0
				arg_100_1.dialogCg_.alpha = 1

				arg_100_1.dialog_:SetActive(true)
				SetActive(arg_100_1.leftNameGo_, true)

				local var_103_23 = arg_100_1:FormatText(StoryNameCfg[471].name)

				arg_100_1.leftNameTxt_.text = var_103_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_100_1.leftNameTxt_.transform)

				arg_100_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_100_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_100_1:RecordName(arg_100_1.leftNameTxt_.text)
				SetActive(arg_100_1.iconTrs_.gameObject, false)
				arg_100_1.callingController_:SetSelectedState("normal")

				local var_103_24 = arg_100_1:GetWordFromCfg(419012024)
				local var_103_25 = arg_100_1:FormatText(var_103_24.content)

				arg_100_1.text_.text = var_103_25

				LuaForUtil.ClearLinePrefixSymbol(arg_100_1.text_)

				local var_103_26 = 13
				local var_103_27 = utf8.len(var_103_25)
				local var_103_28 = var_103_26 <= 0 and var_103_22 or var_103_22 * (var_103_27 / var_103_26)

				if var_103_28 > 0 and var_103_22 < var_103_28 then
					arg_100_1.talkMaxDuration = var_103_28

					if var_103_28 + var_103_21 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_28 + var_103_21
					end
				end

				arg_100_1.text_.text = var_103_25
				arg_100_1.typewritter.percent = 0

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(false)
				arg_100_1:RecordContent(arg_100_1.text_.text)
			end

			local var_103_29 = math.max(var_103_22, arg_100_1.talkMaxDuration)

			if var_103_21 <= arg_100_1.time_ and arg_100_1.time_ < var_103_21 + var_103_29 then
				arg_100_1.typewritter.percent = (arg_100_1.time_ - var_103_21) / var_103_29

				arg_100_1.typewritter:SetDirty()
			end

			if arg_100_1.time_ >= var_103_21 + var_103_29 and arg_100_1.time_ < var_103_21 + var_103_29 + arg_103_0 then
				arg_100_1.typewritter.percent = 1

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(true)
			end
		end
	end,
	Play419012025 = function(arg_104_0, arg_104_1)
		arg_104_1.time_ = 0
		arg_104_1.frameCnt_ = 0
		arg_104_1.state_ = "playing"
		arg_104_1.curTalkId_ = 419012025
		arg_104_1.duration_ = 5

		SetActive(arg_104_1.tipsGo_, false)

		function arg_104_1.onSingleLineFinish_()
			arg_104_1.onSingleLineUpdate_ = nil
			arg_104_1.onSingleLineFinish_ = nil
			arg_104_1.state_ = "waiting"
		end

		function arg_104_1.playNext_(arg_106_0)
			if arg_106_0 == 1 then
				arg_104_0:Play419012026(arg_104_1)
			end
		end

		function arg_104_1.onSingleLineUpdate_(arg_107_0)
			local var_107_0 = arg_104_1.actors_["1045ui_story"].transform
			local var_107_1 = 0

			if var_107_1 < arg_104_1.time_ and arg_104_1.time_ <= var_107_1 + arg_107_0 then
				arg_104_1.var_.moveOldPos1045ui_story = var_107_0.localPosition

				local var_107_2 = "1045ui_story"

				arg_104_1:ShowWeapon(arg_104_1.var_[var_107_2 .. "Animator"].transform, false)
			end

			local var_107_3 = 0.001

			if var_107_1 <= arg_104_1.time_ and arg_104_1.time_ < var_107_1 + var_107_3 then
				local var_107_4 = (arg_104_1.time_ - var_107_1) / var_107_3
				local var_107_5 = Vector3.New(0.7, -1, -6.05)

				var_107_0.localPosition = Vector3.Lerp(arg_104_1.var_.moveOldPos1045ui_story, var_107_5, var_107_4)

				local var_107_6 = manager.ui.mainCamera.transform.position - var_107_0.position

				var_107_0.forward = Vector3.New(var_107_6.x, var_107_6.y, var_107_6.z)

				local var_107_7 = var_107_0.localEulerAngles

				var_107_7.z = 0
				var_107_7.x = 0
				var_107_0.localEulerAngles = var_107_7
			end

			if arg_104_1.time_ >= var_107_1 + var_107_3 and arg_104_1.time_ < var_107_1 + var_107_3 + arg_107_0 then
				var_107_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_107_8 = manager.ui.mainCamera.transform.position - var_107_0.position

				var_107_0.forward = Vector3.New(var_107_8.x, var_107_8.y, var_107_8.z)

				local var_107_9 = var_107_0.localEulerAngles

				var_107_9.z = 0
				var_107_9.x = 0
				var_107_0.localEulerAngles = var_107_9
			end

			local var_107_10 = arg_104_1.actors_["1045ui_story"]
			local var_107_11 = 0

			if var_107_11 < arg_104_1.time_ and arg_104_1.time_ <= var_107_11 + arg_107_0 and not isNil(var_107_10) and arg_104_1.var_.characterEffect1045ui_story == nil then
				arg_104_1.var_.characterEffect1045ui_story = var_107_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_107_12 = 0.200000002980232

			if var_107_11 <= arg_104_1.time_ and arg_104_1.time_ < var_107_11 + var_107_12 and not isNil(var_107_10) then
				local var_107_13 = (arg_104_1.time_ - var_107_11) / var_107_12

				if arg_104_1.var_.characterEffect1045ui_story and not isNil(var_107_10) then
					arg_104_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_104_1.time_ >= var_107_11 + var_107_12 and arg_104_1.time_ < var_107_11 + var_107_12 + arg_107_0 and not isNil(var_107_10) and arg_104_1.var_.characterEffect1045ui_story then
				arg_104_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_107_14 = arg_104_1.actors_["1095ui_story"]
			local var_107_15 = 0

			if var_107_15 < arg_104_1.time_ and arg_104_1.time_ <= var_107_15 + arg_107_0 and not isNil(var_107_14) and arg_104_1.var_.characterEffect1095ui_story == nil then
				arg_104_1.var_.characterEffect1095ui_story = var_107_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_107_16 = 0.200000002980232

			if var_107_15 <= arg_104_1.time_ and arg_104_1.time_ < var_107_15 + var_107_16 and not isNil(var_107_14) then
				local var_107_17 = (arg_104_1.time_ - var_107_15) / var_107_16

				if arg_104_1.var_.characterEffect1095ui_story and not isNil(var_107_14) then
					local var_107_18 = Mathf.Lerp(0, 0.5, var_107_17)

					arg_104_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_104_1.var_.characterEffect1095ui_story.fillRatio = var_107_18
				end
			end

			if arg_104_1.time_ >= var_107_15 + var_107_16 and arg_104_1.time_ < var_107_15 + var_107_16 + arg_107_0 and not isNil(var_107_14) and arg_104_1.var_.characterEffect1095ui_story then
				local var_107_19 = 0.5

				arg_104_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_104_1.var_.characterEffect1095ui_story.fillRatio = var_107_19
			end

			local var_107_20 = 0

			if var_107_20 < arg_104_1.time_ and arg_104_1.time_ <= var_107_20 + arg_107_0 then
				arg_104_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action3_1")
			end

			local var_107_21 = 0

			if var_107_21 < arg_104_1.time_ and arg_104_1.time_ <= var_107_21 + arg_107_0 then
				arg_104_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_kunraoA_sikao", "EmotionTimelineAnimator")
			end

			local var_107_22 = 0
			local var_107_23 = 0.9

			if var_107_22 < arg_104_1.time_ and arg_104_1.time_ <= var_107_22 + arg_107_0 then
				arg_104_1.talkMaxDuration = 0
				arg_104_1.dialogCg_.alpha = 1

				arg_104_1.dialog_:SetActive(true)
				SetActive(arg_104_1.leftNameGo_, true)

				local var_107_24 = arg_104_1:FormatText(StoryNameCfg[1202].name)

				arg_104_1.leftNameTxt_.text = var_107_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_104_1.leftNameTxt_.transform)

				arg_104_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_104_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_104_1:RecordName(arg_104_1.leftNameTxt_.text)
				SetActive(arg_104_1.iconTrs_.gameObject, false)
				arg_104_1.callingController_:SetSelectedState("normal")

				local var_107_25 = arg_104_1:GetWordFromCfg(419012025)
				local var_107_26 = arg_104_1:FormatText(var_107_25.content)

				arg_104_1.text_.text = var_107_26

				LuaForUtil.ClearLinePrefixSymbol(arg_104_1.text_)

				local var_107_27 = 30
				local var_107_28 = utf8.len(var_107_26)
				local var_107_29 = var_107_27 <= 0 and var_107_23 or var_107_23 * (var_107_28 / var_107_27)

				if var_107_29 > 0 and var_107_23 < var_107_29 then
					arg_104_1.talkMaxDuration = var_107_29

					if var_107_29 + var_107_22 > arg_104_1.duration_ then
						arg_104_1.duration_ = var_107_29 + var_107_22
					end
				end

				arg_104_1.text_.text = var_107_26
				arg_104_1.typewritter.percent = 0

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(false)
				arg_104_1:RecordContent(arg_104_1.text_.text)
			end

			local var_107_30 = math.max(var_107_23, arg_104_1.talkMaxDuration)

			if var_107_22 <= arg_104_1.time_ and arg_104_1.time_ < var_107_22 + var_107_30 then
				arg_104_1.typewritter.percent = (arg_104_1.time_ - var_107_22) / var_107_30

				arg_104_1.typewritter:SetDirty()
			end

			if arg_104_1.time_ >= var_107_22 + var_107_30 and arg_104_1.time_ < var_107_22 + var_107_30 + arg_107_0 then
				arg_104_1.typewritter.percent = 1

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(true)
			end
		end
	end,
	Play419012026 = function(arg_108_0, arg_108_1)
		arg_108_1.time_ = 0
		arg_108_1.frameCnt_ = 0
		arg_108_1.state_ = "playing"
		arg_108_1.curTalkId_ = 419012026
		arg_108_1.duration_ = 5

		SetActive(arg_108_1.tipsGo_, false)

		function arg_108_1.onSingleLineFinish_()
			arg_108_1.onSingleLineUpdate_ = nil
			arg_108_1.onSingleLineFinish_ = nil
			arg_108_1.state_ = "waiting"
		end

		function arg_108_1.playNext_(arg_110_0)
			if arg_110_0 == 1 then
				arg_108_0:Play419012027(arg_108_1)
			end
		end

		function arg_108_1.onSingleLineUpdate_(arg_111_0)
			local var_111_0 = arg_108_1.actors_["1045ui_story"]
			local var_111_1 = 0

			if var_111_1 < arg_108_1.time_ and arg_108_1.time_ <= var_111_1 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.characterEffect1045ui_story == nil then
				arg_108_1.var_.characterEffect1045ui_story = var_111_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_111_2 = 0.200000002980232

			if var_111_1 <= arg_108_1.time_ and arg_108_1.time_ < var_111_1 + var_111_2 and not isNil(var_111_0) then
				local var_111_3 = (arg_108_1.time_ - var_111_1) / var_111_2

				if arg_108_1.var_.characterEffect1045ui_story and not isNil(var_111_0) then
					local var_111_4 = Mathf.Lerp(0, 0.5, var_111_3)

					arg_108_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_108_1.var_.characterEffect1045ui_story.fillRatio = var_111_4
				end
			end

			if arg_108_1.time_ >= var_111_1 + var_111_2 and arg_108_1.time_ < var_111_1 + var_111_2 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.characterEffect1045ui_story then
				local var_111_5 = 0.5

				arg_108_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_108_1.var_.characterEffect1045ui_story.fillRatio = var_111_5
			end

			local var_111_6 = 0
			local var_111_7 = 0.875

			if var_111_6 < arg_108_1.time_ and arg_108_1.time_ <= var_111_6 + arg_111_0 then
				arg_108_1.talkMaxDuration = 0
				arg_108_1.dialogCg_.alpha = 1

				arg_108_1.dialog_:SetActive(true)
				SetActive(arg_108_1.leftNameGo_, false)

				arg_108_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_108_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_108_1:RecordName(arg_108_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_108_1.iconTrs_.gameObject, false)
				arg_108_1.callingController_:SetSelectedState("normal")

				local var_111_8 = arg_108_1:GetWordFromCfg(419012026)
				local var_111_9 = arg_108_1:FormatText(var_111_8.content)

				arg_108_1.text_.text = var_111_9

				LuaForUtil.ClearLinePrefixSymbol(arg_108_1.text_)

				local var_111_10 = 35
				local var_111_11 = utf8.len(var_111_9)
				local var_111_12 = var_111_10 <= 0 and var_111_7 or var_111_7 * (var_111_11 / var_111_10)

				if var_111_12 > 0 and var_111_7 < var_111_12 then
					arg_108_1.talkMaxDuration = var_111_12

					if var_111_12 + var_111_6 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_12 + var_111_6
					end
				end

				arg_108_1.text_.text = var_111_9
				arg_108_1.typewritter.percent = 0

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(false)
				arg_108_1:RecordContent(arg_108_1.text_.text)
			end

			local var_111_13 = math.max(var_111_7, arg_108_1.talkMaxDuration)

			if var_111_6 <= arg_108_1.time_ and arg_108_1.time_ < var_111_6 + var_111_13 then
				arg_108_1.typewritter.percent = (arg_108_1.time_ - var_111_6) / var_111_13

				arg_108_1.typewritter:SetDirty()
			end

			if arg_108_1.time_ >= var_111_6 + var_111_13 and arg_108_1.time_ < var_111_6 + var_111_13 + arg_111_0 then
				arg_108_1.typewritter.percent = 1

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(true)
			end
		end
	end,
	Play419012027 = function(arg_112_0, arg_112_1)
		arg_112_1.time_ = 0
		arg_112_1.frameCnt_ = 0
		arg_112_1.state_ = "playing"
		arg_112_1.curTalkId_ = 419012027
		arg_112_1.duration_ = 5

		SetActive(arg_112_1.tipsGo_, false)

		function arg_112_1.onSingleLineFinish_()
			arg_112_1.onSingleLineUpdate_ = nil
			arg_112_1.onSingleLineFinish_ = nil
			arg_112_1.state_ = "waiting"
		end

		function arg_112_1.playNext_(arg_114_0)
			if arg_114_0 == 1 then
				arg_112_0:Play419012028(arg_112_1)
			end
		end

		function arg_112_1.onSingleLineUpdate_(arg_115_0)
			local var_115_0 = arg_112_1.actors_["1095ui_story"].transform
			local var_115_1 = 0

			if var_115_1 < arg_112_1.time_ and arg_112_1.time_ <= var_115_1 + arg_115_0 then
				arg_112_1.var_.moveOldPos1095ui_story = var_115_0.localPosition
			end

			local var_115_2 = 0.001

			if var_115_1 <= arg_112_1.time_ and arg_112_1.time_ < var_115_1 + var_115_2 then
				local var_115_3 = (arg_112_1.time_ - var_115_1) / var_115_2
				local var_115_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_115_0.localPosition = Vector3.Lerp(arg_112_1.var_.moveOldPos1095ui_story, var_115_4, var_115_3)

				local var_115_5 = manager.ui.mainCamera.transform.position - var_115_0.position

				var_115_0.forward = Vector3.New(var_115_5.x, var_115_5.y, var_115_5.z)

				local var_115_6 = var_115_0.localEulerAngles

				var_115_6.z = 0
				var_115_6.x = 0
				var_115_0.localEulerAngles = var_115_6
			end

			if arg_112_1.time_ >= var_115_1 + var_115_2 and arg_112_1.time_ < var_115_1 + var_115_2 + arg_115_0 then
				var_115_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_115_7 = manager.ui.mainCamera.transform.position - var_115_0.position

				var_115_0.forward = Vector3.New(var_115_7.x, var_115_7.y, var_115_7.z)

				local var_115_8 = var_115_0.localEulerAngles

				var_115_8.z = 0
				var_115_8.x = 0
				var_115_0.localEulerAngles = var_115_8
			end

			local var_115_9 = arg_112_1.actors_["1095ui_story"]
			local var_115_10 = 0

			if var_115_10 < arg_112_1.time_ and arg_112_1.time_ <= var_115_10 + arg_115_0 and not isNil(var_115_9) and arg_112_1.var_.characterEffect1095ui_story == nil then
				arg_112_1.var_.characterEffect1095ui_story = var_115_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_115_11 = 0.200000002980232

			if var_115_10 <= arg_112_1.time_ and arg_112_1.time_ < var_115_10 + var_115_11 and not isNil(var_115_9) then
				local var_115_12 = (arg_112_1.time_ - var_115_10) / var_115_11

				if arg_112_1.var_.characterEffect1095ui_story and not isNil(var_115_9) then
					arg_112_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_112_1.time_ >= var_115_10 + var_115_11 and arg_112_1.time_ < var_115_10 + var_115_11 + arg_115_0 and not isNil(var_115_9) and arg_112_1.var_.characterEffect1095ui_story then
				arg_112_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_115_13 = 0

			if var_115_13 < arg_112_1.time_ and arg_112_1.time_ <= var_115_13 + arg_115_0 then
				arg_112_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_115_14 = 0

			if var_115_14 < arg_112_1.time_ and arg_112_1.time_ <= var_115_14 + arg_115_0 then
				arg_112_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_kuaileA_weixiao", "EmotionTimelineAnimator")
			end

			local var_115_15 = 0
			local var_115_16 = 1

			if var_115_15 < arg_112_1.time_ and arg_112_1.time_ <= var_115_15 + arg_115_0 then
				arg_112_1.talkMaxDuration = 0
				arg_112_1.dialogCg_.alpha = 1

				arg_112_1.dialog_:SetActive(true)
				SetActive(arg_112_1.leftNameGo_, true)

				local var_115_17 = arg_112_1:FormatText(StoryNameCfg[471].name)

				arg_112_1.leftNameTxt_.text = var_115_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_112_1.leftNameTxt_.transform)

				arg_112_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_112_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_112_1:RecordName(arg_112_1.leftNameTxt_.text)
				SetActive(arg_112_1.iconTrs_.gameObject, false)
				arg_112_1.callingController_:SetSelectedState("normal")

				local var_115_18 = arg_112_1:GetWordFromCfg(419012027)
				local var_115_19 = arg_112_1:FormatText(var_115_18.content)

				arg_112_1.text_.text = var_115_19

				LuaForUtil.ClearLinePrefixSymbol(arg_112_1.text_)

				local var_115_20 = 40
				local var_115_21 = utf8.len(var_115_19)
				local var_115_22 = var_115_20 <= 0 and var_115_16 or var_115_16 * (var_115_21 / var_115_20)

				if var_115_22 > 0 and var_115_16 < var_115_22 then
					arg_112_1.talkMaxDuration = var_115_22

					if var_115_22 + var_115_15 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_22 + var_115_15
					end
				end

				arg_112_1.text_.text = var_115_19
				arg_112_1.typewritter.percent = 0

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(false)
				arg_112_1:RecordContent(arg_112_1.text_.text)
			end

			local var_115_23 = math.max(var_115_16, arg_112_1.talkMaxDuration)

			if var_115_15 <= arg_112_1.time_ and arg_112_1.time_ < var_115_15 + var_115_23 then
				arg_112_1.typewritter.percent = (arg_112_1.time_ - var_115_15) / var_115_23

				arg_112_1.typewritter:SetDirty()
			end

			if arg_112_1.time_ >= var_115_15 + var_115_23 and arg_112_1.time_ < var_115_15 + var_115_23 + arg_115_0 then
				arg_112_1.typewritter.percent = 1

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(true)
			end
		end
	end,
	Play419012028 = function(arg_116_0, arg_116_1)
		arg_116_1.time_ = 0
		arg_116_1.frameCnt_ = 0
		arg_116_1.state_ = "playing"
		arg_116_1.curTalkId_ = 419012028
		arg_116_1.duration_ = 5

		SetActive(arg_116_1.tipsGo_, false)

		function arg_116_1.onSingleLineFinish_()
			arg_116_1.onSingleLineUpdate_ = nil
			arg_116_1.onSingleLineFinish_ = nil
			arg_116_1.state_ = "waiting"
		end

		function arg_116_1.playNext_(arg_118_0)
			if arg_118_0 == 1 then
				arg_116_0:Play419012029(arg_116_1)
			end
		end

		function arg_116_1.onSingleLineUpdate_(arg_119_0)
			local var_119_0 = 0
			local var_119_1 = 0.45

			if var_119_0 < arg_116_1.time_ and arg_116_1.time_ <= var_119_0 + arg_119_0 then
				arg_116_1.talkMaxDuration = 0
				arg_116_1.dialogCg_.alpha = 1

				arg_116_1.dialog_:SetActive(true)
				SetActive(arg_116_1.leftNameGo_, true)

				local var_119_2 = arg_116_1:FormatText(StoryNameCfg[471].name)

				arg_116_1.leftNameTxt_.text = var_119_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_116_1.leftNameTxt_.transform)

				arg_116_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_116_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_116_1:RecordName(arg_116_1.leftNameTxt_.text)
				SetActive(arg_116_1.iconTrs_.gameObject, false)
				arg_116_1.callingController_:SetSelectedState("normal")

				local var_119_3 = arg_116_1:GetWordFromCfg(419012028)
				local var_119_4 = arg_116_1:FormatText(var_119_3.content)

				arg_116_1.text_.text = var_119_4

				LuaForUtil.ClearLinePrefixSymbol(arg_116_1.text_)

				local var_119_5 = 18
				local var_119_6 = utf8.len(var_119_4)
				local var_119_7 = var_119_5 <= 0 and var_119_1 or var_119_1 * (var_119_6 / var_119_5)

				if var_119_7 > 0 and var_119_1 < var_119_7 then
					arg_116_1.talkMaxDuration = var_119_7

					if var_119_7 + var_119_0 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_7 + var_119_0
					end
				end

				arg_116_1.text_.text = var_119_4
				arg_116_1.typewritter.percent = 0

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(false)
				arg_116_1:RecordContent(arg_116_1.text_.text)
			end

			local var_119_8 = math.max(var_119_1, arg_116_1.talkMaxDuration)

			if var_119_0 <= arg_116_1.time_ and arg_116_1.time_ < var_119_0 + var_119_8 then
				arg_116_1.typewritter.percent = (arg_116_1.time_ - var_119_0) / var_119_8

				arg_116_1.typewritter:SetDirty()
			end

			if arg_116_1.time_ >= var_119_0 + var_119_8 and arg_116_1.time_ < var_119_0 + var_119_8 + arg_119_0 then
				arg_116_1.typewritter.percent = 1

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(true)
			end
		end
	end,
	Play419012029 = function(arg_120_0, arg_120_1)
		arg_120_1.time_ = 0
		arg_120_1.frameCnt_ = 0
		arg_120_1.state_ = "playing"
		arg_120_1.curTalkId_ = 419012029
		arg_120_1.duration_ = 5

		SetActive(arg_120_1.tipsGo_, false)

		function arg_120_1.onSingleLineFinish_()
			arg_120_1.onSingleLineUpdate_ = nil
			arg_120_1.onSingleLineFinish_ = nil
			arg_120_1.state_ = "waiting"
		end

		function arg_120_1.playNext_(arg_122_0)
			if arg_122_0 == 1 then
				arg_120_0:Play419012030(arg_120_1)
			end
		end

		function arg_120_1.onSingleLineUpdate_(arg_123_0)
			local var_123_0 = arg_120_1.actors_["1045ui_story"].transform
			local var_123_1 = 0

			if var_123_1 < arg_120_1.time_ and arg_120_1.time_ <= var_123_1 + arg_123_0 then
				arg_120_1.var_.moveOldPos1045ui_story = var_123_0.localPosition
			end

			local var_123_2 = 0.001

			if var_123_1 <= arg_120_1.time_ and arg_120_1.time_ < var_123_1 + var_123_2 then
				local var_123_3 = (arg_120_1.time_ - var_123_1) / var_123_2
				local var_123_4 = Vector3.New(0.7, -1, -6.05)

				var_123_0.localPosition = Vector3.Lerp(arg_120_1.var_.moveOldPos1045ui_story, var_123_4, var_123_3)

				local var_123_5 = manager.ui.mainCamera.transform.position - var_123_0.position

				var_123_0.forward = Vector3.New(var_123_5.x, var_123_5.y, var_123_5.z)

				local var_123_6 = var_123_0.localEulerAngles

				var_123_6.z = 0
				var_123_6.x = 0
				var_123_0.localEulerAngles = var_123_6
			end

			if arg_120_1.time_ >= var_123_1 + var_123_2 and arg_120_1.time_ < var_123_1 + var_123_2 + arg_123_0 then
				var_123_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_123_7 = manager.ui.mainCamera.transform.position - var_123_0.position

				var_123_0.forward = Vector3.New(var_123_7.x, var_123_7.y, var_123_7.z)

				local var_123_8 = var_123_0.localEulerAngles

				var_123_8.z = 0
				var_123_8.x = 0
				var_123_0.localEulerAngles = var_123_8
			end

			local var_123_9 = arg_120_1.actors_["1045ui_story"]
			local var_123_10 = 0

			if var_123_10 < arg_120_1.time_ and arg_120_1.time_ <= var_123_10 + arg_123_0 and not isNil(var_123_9) and arg_120_1.var_.characterEffect1045ui_story == nil then
				arg_120_1.var_.characterEffect1045ui_story = var_123_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_123_11 = 0.200000002980232

			if var_123_10 <= arg_120_1.time_ and arg_120_1.time_ < var_123_10 + var_123_11 and not isNil(var_123_9) then
				local var_123_12 = (arg_120_1.time_ - var_123_10) / var_123_11

				if arg_120_1.var_.characterEffect1045ui_story and not isNil(var_123_9) then
					arg_120_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_120_1.time_ >= var_123_10 + var_123_11 and arg_120_1.time_ < var_123_10 + var_123_11 + arg_123_0 and not isNil(var_123_9) and arg_120_1.var_.characterEffect1045ui_story then
				arg_120_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_123_13 = arg_120_1.actors_["1095ui_story"]
			local var_123_14 = 0

			if var_123_14 < arg_120_1.time_ and arg_120_1.time_ <= var_123_14 + arg_123_0 and not isNil(var_123_13) and arg_120_1.var_.characterEffect1095ui_story == nil then
				arg_120_1.var_.characterEffect1095ui_story = var_123_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_123_15 = 0.200000002980232

			if var_123_14 <= arg_120_1.time_ and arg_120_1.time_ < var_123_14 + var_123_15 and not isNil(var_123_13) then
				local var_123_16 = (arg_120_1.time_ - var_123_14) / var_123_15

				if arg_120_1.var_.characterEffect1095ui_story and not isNil(var_123_13) then
					local var_123_17 = Mathf.Lerp(0, 0.5, var_123_16)

					arg_120_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_120_1.var_.characterEffect1095ui_story.fillRatio = var_123_17
				end
			end

			if arg_120_1.time_ >= var_123_14 + var_123_15 and arg_120_1.time_ < var_123_14 + var_123_15 + arg_123_0 and not isNil(var_123_13) and arg_120_1.var_.characterEffect1095ui_story then
				local var_123_18 = 0.5

				arg_120_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_120_1.var_.characterEffect1095ui_story.fillRatio = var_123_18
			end

			local var_123_19 = 0

			if var_123_19 < arg_120_1.time_ and arg_120_1.time_ <= var_123_19 + arg_123_0 then
				arg_120_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045actionlink/1045action439")
			end

			local var_123_20 = 0

			if var_123_20 < arg_120_1.time_ and arg_120_1.time_ <= var_123_20 + arg_123_0 then
				arg_120_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_123_21 = 0
			local var_123_22 = 0.175

			if var_123_21 < arg_120_1.time_ and arg_120_1.time_ <= var_123_21 + arg_123_0 then
				arg_120_1.talkMaxDuration = 0
				arg_120_1.dialogCg_.alpha = 1

				arg_120_1.dialog_:SetActive(true)
				SetActive(arg_120_1.leftNameGo_, true)

				local var_123_23 = arg_120_1:FormatText(StoryNameCfg[1202].name)

				arg_120_1.leftNameTxt_.text = var_123_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_120_1.leftNameTxt_.transform)

				arg_120_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_120_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_120_1:RecordName(arg_120_1.leftNameTxt_.text)
				SetActive(arg_120_1.iconTrs_.gameObject, false)
				arg_120_1.callingController_:SetSelectedState("normal")

				local var_123_24 = arg_120_1:GetWordFromCfg(419012029)
				local var_123_25 = arg_120_1:FormatText(var_123_24.content)

				arg_120_1.text_.text = var_123_25

				LuaForUtil.ClearLinePrefixSymbol(arg_120_1.text_)

				local var_123_26 = 7
				local var_123_27 = utf8.len(var_123_25)
				local var_123_28 = var_123_26 <= 0 and var_123_22 or var_123_22 * (var_123_27 / var_123_26)

				if var_123_28 > 0 and var_123_22 < var_123_28 then
					arg_120_1.talkMaxDuration = var_123_28

					if var_123_28 + var_123_21 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_28 + var_123_21
					end
				end

				arg_120_1.text_.text = var_123_25
				arg_120_1.typewritter.percent = 0

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(false)
				arg_120_1:RecordContent(arg_120_1.text_.text)
			end

			local var_123_29 = math.max(var_123_22, arg_120_1.talkMaxDuration)

			if var_123_21 <= arg_120_1.time_ and arg_120_1.time_ < var_123_21 + var_123_29 then
				arg_120_1.typewritter.percent = (arg_120_1.time_ - var_123_21) / var_123_29

				arg_120_1.typewritter:SetDirty()
			end

			if arg_120_1.time_ >= var_123_21 + var_123_29 and arg_120_1.time_ < var_123_21 + var_123_29 + arg_123_0 then
				arg_120_1.typewritter.percent = 1

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(true)
			end
		end
	end,
	Play419012030 = function(arg_124_0, arg_124_1)
		arg_124_1.time_ = 0
		arg_124_1.frameCnt_ = 0
		arg_124_1.state_ = "playing"
		arg_124_1.curTalkId_ = 419012030
		arg_124_1.duration_ = 5

		SetActive(arg_124_1.tipsGo_, false)

		function arg_124_1.onSingleLineFinish_()
			arg_124_1.onSingleLineUpdate_ = nil
			arg_124_1.onSingleLineFinish_ = nil
			arg_124_1.state_ = "waiting"
		end

		function arg_124_1.playNext_(arg_126_0)
			if arg_126_0 == 1 then
				arg_124_0:Play419012031(arg_124_1)
			end
		end

		function arg_124_1.onSingleLineUpdate_(arg_127_0)
			local var_127_0 = arg_124_1.actors_["1095ui_story"].transform
			local var_127_1 = 0

			if var_127_1 < arg_124_1.time_ and arg_124_1.time_ <= var_127_1 + arg_127_0 then
				arg_124_1.var_.moveOldPos1095ui_story = var_127_0.localPosition
			end

			local var_127_2 = 0.001

			if var_127_1 <= arg_124_1.time_ and arg_124_1.time_ < var_127_1 + var_127_2 then
				local var_127_3 = (arg_124_1.time_ - var_127_1) / var_127_2
				local var_127_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_127_0.localPosition = Vector3.Lerp(arg_124_1.var_.moveOldPos1095ui_story, var_127_4, var_127_3)

				local var_127_5 = manager.ui.mainCamera.transform.position - var_127_0.position

				var_127_0.forward = Vector3.New(var_127_5.x, var_127_5.y, var_127_5.z)

				local var_127_6 = var_127_0.localEulerAngles

				var_127_6.z = 0
				var_127_6.x = 0
				var_127_0.localEulerAngles = var_127_6
			end

			if arg_124_1.time_ >= var_127_1 + var_127_2 and arg_124_1.time_ < var_127_1 + var_127_2 + arg_127_0 then
				var_127_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_127_7 = manager.ui.mainCamera.transform.position - var_127_0.position

				var_127_0.forward = Vector3.New(var_127_7.x, var_127_7.y, var_127_7.z)

				local var_127_8 = var_127_0.localEulerAngles

				var_127_8.z = 0
				var_127_8.x = 0
				var_127_0.localEulerAngles = var_127_8
			end

			local var_127_9 = arg_124_1.actors_["1095ui_story"]
			local var_127_10 = 0

			if var_127_10 < arg_124_1.time_ and arg_124_1.time_ <= var_127_10 + arg_127_0 and not isNil(var_127_9) and arg_124_1.var_.characterEffect1095ui_story == nil then
				arg_124_1.var_.characterEffect1095ui_story = var_127_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_127_11 = 0.200000002980232

			if var_127_10 <= arg_124_1.time_ and arg_124_1.time_ < var_127_10 + var_127_11 and not isNil(var_127_9) then
				local var_127_12 = (arg_124_1.time_ - var_127_10) / var_127_11

				if arg_124_1.var_.characterEffect1095ui_story and not isNil(var_127_9) then
					arg_124_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_124_1.time_ >= var_127_10 + var_127_11 and arg_124_1.time_ < var_127_10 + var_127_11 + arg_127_0 and not isNil(var_127_9) and arg_124_1.var_.characterEffect1095ui_story then
				arg_124_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_127_13 = arg_124_1.actors_["1045ui_story"]
			local var_127_14 = 0

			if var_127_14 < arg_124_1.time_ and arg_124_1.time_ <= var_127_14 + arg_127_0 and not isNil(var_127_13) and arg_124_1.var_.characterEffect1045ui_story == nil then
				arg_124_1.var_.characterEffect1045ui_story = var_127_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_127_15 = 0.200000002980232

			if var_127_14 <= arg_124_1.time_ and arg_124_1.time_ < var_127_14 + var_127_15 and not isNil(var_127_13) then
				local var_127_16 = (arg_124_1.time_ - var_127_14) / var_127_15

				if arg_124_1.var_.characterEffect1045ui_story and not isNil(var_127_13) then
					local var_127_17 = Mathf.Lerp(0, 0.5, var_127_16)

					arg_124_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_124_1.var_.characterEffect1045ui_story.fillRatio = var_127_17
				end
			end

			if arg_124_1.time_ >= var_127_14 + var_127_15 and arg_124_1.time_ < var_127_14 + var_127_15 + arg_127_0 and not isNil(var_127_13) and arg_124_1.var_.characterEffect1045ui_story then
				local var_127_18 = 0.5

				arg_124_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_124_1.var_.characterEffect1045ui_story.fillRatio = var_127_18
			end

			local var_127_19 = 0

			if var_127_19 < arg_124_1.time_ and arg_124_1.time_ <= var_127_19 + arg_127_0 then
				arg_124_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_127_20 = 0
			local var_127_21 = 0.375

			if var_127_20 < arg_124_1.time_ and arg_124_1.time_ <= var_127_20 + arg_127_0 then
				arg_124_1.talkMaxDuration = 0
				arg_124_1.dialogCg_.alpha = 1

				arg_124_1.dialog_:SetActive(true)
				SetActive(arg_124_1.leftNameGo_, true)

				local var_127_22 = arg_124_1:FormatText(StoryNameCfg[471].name)

				arg_124_1.leftNameTxt_.text = var_127_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_124_1.leftNameTxt_.transform)

				arg_124_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_124_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_124_1:RecordName(arg_124_1.leftNameTxt_.text)
				SetActive(arg_124_1.iconTrs_.gameObject, false)
				arg_124_1.callingController_:SetSelectedState("normal")

				local var_127_23 = arg_124_1:GetWordFromCfg(419012030)
				local var_127_24 = arg_124_1:FormatText(var_127_23.content)

				arg_124_1.text_.text = var_127_24

				LuaForUtil.ClearLinePrefixSymbol(arg_124_1.text_)

				local var_127_25 = 15
				local var_127_26 = utf8.len(var_127_24)
				local var_127_27 = var_127_25 <= 0 and var_127_21 or var_127_21 * (var_127_26 / var_127_25)

				if var_127_27 > 0 and var_127_21 < var_127_27 then
					arg_124_1.talkMaxDuration = var_127_27

					if var_127_27 + var_127_20 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_27 + var_127_20
					end
				end

				arg_124_1.text_.text = var_127_24
				arg_124_1.typewritter.percent = 0

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(false)
				arg_124_1:RecordContent(arg_124_1.text_.text)
			end

			local var_127_28 = math.max(var_127_21, arg_124_1.talkMaxDuration)

			if var_127_20 <= arg_124_1.time_ and arg_124_1.time_ < var_127_20 + var_127_28 then
				arg_124_1.typewritter.percent = (arg_124_1.time_ - var_127_20) / var_127_28

				arg_124_1.typewritter:SetDirty()
			end

			if arg_124_1.time_ >= var_127_20 + var_127_28 and arg_124_1.time_ < var_127_20 + var_127_28 + arg_127_0 then
				arg_124_1.typewritter.percent = 1

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(true)
			end
		end
	end,
	Play419012031 = function(arg_128_0, arg_128_1)
		arg_128_1.time_ = 0
		arg_128_1.frameCnt_ = 0
		arg_128_1.state_ = "playing"
		arg_128_1.curTalkId_ = 419012031
		arg_128_1.duration_ = 5

		SetActive(arg_128_1.tipsGo_, false)

		function arg_128_1.onSingleLineFinish_()
			arg_128_1.onSingleLineUpdate_ = nil
			arg_128_1.onSingleLineFinish_ = nil
			arg_128_1.state_ = "waiting"
		end

		function arg_128_1.playNext_(arg_130_0)
			if arg_130_0 == 1 then
				arg_128_0:Play419012032(arg_128_1)
			end
		end

		function arg_128_1.onSingleLineUpdate_(arg_131_0)
			local var_131_0 = arg_128_1.actors_["1045ui_story"].transform
			local var_131_1 = 0

			if var_131_1 < arg_128_1.time_ and arg_128_1.time_ <= var_131_1 + arg_131_0 then
				arg_128_1.var_.moveOldPos1045ui_story = var_131_0.localPosition
			end

			local var_131_2 = 0.001

			if var_131_1 <= arg_128_1.time_ and arg_128_1.time_ < var_131_1 + var_131_2 then
				local var_131_3 = (arg_128_1.time_ - var_131_1) / var_131_2
				local var_131_4 = Vector3.New(0.7, -1, -6.05)

				var_131_0.localPosition = Vector3.Lerp(arg_128_1.var_.moveOldPos1045ui_story, var_131_4, var_131_3)

				local var_131_5 = manager.ui.mainCamera.transform.position - var_131_0.position

				var_131_0.forward = Vector3.New(var_131_5.x, var_131_5.y, var_131_5.z)

				local var_131_6 = var_131_0.localEulerAngles

				var_131_6.z = 0
				var_131_6.x = 0
				var_131_0.localEulerAngles = var_131_6
			end

			if arg_128_1.time_ >= var_131_1 + var_131_2 and arg_128_1.time_ < var_131_1 + var_131_2 + arg_131_0 then
				var_131_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_131_7 = manager.ui.mainCamera.transform.position - var_131_0.position

				var_131_0.forward = Vector3.New(var_131_7.x, var_131_7.y, var_131_7.z)

				local var_131_8 = var_131_0.localEulerAngles

				var_131_8.z = 0
				var_131_8.x = 0
				var_131_0.localEulerAngles = var_131_8
			end

			local var_131_9 = arg_128_1.actors_["1045ui_story"]
			local var_131_10 = 0

			if var_131_10 < arg_128_1.time_ and arg_128_1.time_ <= var_131_10 + arg_131_0 and not isNil(var_131_9) and arg_128_1.var_.characterEffect1045ui_story == nil then
				arg_128_1.var_.characterEffect1045ui_story = var_131_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_131_11 = 0.200000002980232

			if var_131_10 <= arg_128_1.time_ and arg_128_1.time_ < var_131_10 + var_131_11 and not isNil(var_131_9) then
				local var_131_12 = (arg_128_1.time_ - var_131_10) / var_131_11

				if arg_128_1.var_.characterEffect1045ui_story and not isNil(var_131_9) then
					arg_128_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_128_1.time_ >= var_131_10 + var_131_11 and arg_128_1.time_ < var_131_10 + var_131_11 + arg_131_0 and not isNil(var_131_9) and arg_128_1.var_.characterEffect1045ui_story then
				arg_128_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_131_13 = arg_128_1.actors_["1095ui_story"]
			local var_131_14 = 0

			if var_131_14 < arg_128_1.time_ and arg_128_1.time_ <= var_131_14 + arg_131_0 and not isNil(var_131_13) and arg_128_1.var_.characterEffect1095ui_story == nil then
				arg_128_1.var_.characterEffect1095ui_story = var_131_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_131_15 = 0.200000002980232

			if var_131_14 <= arg_128_1.time_ and arg_128_1.time_ < var_131_14 + var_131_15 and not isNil(var_131_13) then
				local var_131_16 = (arg_128_1.time_ - var_131_14) / var_131_15

				if arg_128_1.var_.characterEffect1095ui_story and not isNil(var_131_13) then
					local var_131_17 = Mathf.Lerp(0, 0.5, var_131_16)

					arg_128_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_128_1.var_.characterEffect1095ui_story.fillRatio = var_131_17
				end
			end

			if arg_128_1.time_ >= var_131_14 + var_131_15 and arg_128_1.time_ < var_131_14 + var_131_15 + arg_131_0 and not isNil(var_131_13) and arg_128_1.var_.characterEffect1095ui_story then
				local var_131_18 = 0.5

				arg_128_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_128_1.var_.characterEffect1095ui_story.fillRatio = var_131_18
			end

			local var_131_19 = 0

			if var_131_19 < arg_128_1.time_ and arg_128_1.time_ <= var_131_19 + arg_131_0 then
				arg_128_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_kunraoA_sikao", "EmotionTimelineAnimator")
			end

			local var_131_20 = 0
			local var_131_21 = 0.25

			if var_131_20 < arg_128_1.time_ and arg_128_1.time_ <= var_131_20 + arg_131_0 then
				arg_128_1.talkMaxDuration = 0
				arg_128_1.dialogCg_.alpha = 1

				arg_128_1.dialog_:SetActive(true)
				SetActive(arg_128_1.leftNameGo_, true)

				local var_131_22 = arg_128_1:FormatText(StoryNameCfg[1202].name)

				arg_128_1.leftNameTxt_.text = var_131_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_128_1.leftNameTxt_.transform)

				arg_128_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_128_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_128_1:RecordName(arg_128_1.leftNameTxt_.text)
				SetActive(arg_128_1.iconTrs_.gameObject, false)
				arg_128_1.callingController_:SetSelectedState("normal")

				local var_131_23 = arg_128_1:GetWordFromCfg(419012031)
				local var_131_24 = arg_128_1:FormatText(var_131_23.content)

				arg_128_1.text_.text = var_131_24

				LuaForUtil.ClearLinePrefixSymbol(arg_128_1.text_)

				local var_131_25 = 41
				local var_131_26 = utf8.len(var_131_24)
				local var_131_27 = var_131_25 <= 0 and var_131_21 or var_131_21 * (var_131_26 / var_131_25)

				if var_131_27 > 0 and var_131_21 < var_131_27 then
					arg_128_1.talkMaxDuration = var_131_27

					if var_131_27 + var_131_20 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_27 + var_131_20
					end
				end

				arg_128_1.text_.text = var_131_24
				arg_128_1.typewritter.percent = 0

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(false)
				arg_128_1:RecordContent(arg_128_1.text_.text)
			end

			local var_131_28 = math.max(var_131_21, arg_128_1.talkMaxDuration)

			if var_131_20 <= arg_128_1.time_ and arg_128_1.time_ < var_131_20 + var_131_28 then
				arg_128_1.typewritter.percent = (arg_128_1.time_ - var_131_20) / var_131_28

				arg_128_1.typewritter:SetDirty()
			end

			if arg_128_1.time_ >= var_131_20 + var_131_28 and arg_128_1.time_ < var_131_20 + var_131_28 + arg_131_0 then
				arg_128_1.typewritter.percent = 1

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(true)
			end
		end
	end,
	Play419012032 = function(arg_132_0, arg_132_1)
		arg_132_1.time_ = 0
		arg_132_1.frameCnt_ = 0
		arg_132_1.state_ = "playing"
		arg_132_1.curTalkId_ = 419012032
		arg_132_1.duration_ = 5

		SetActive(arg_132_1.tipsGo_, false)

		function arg_132_1.onSingleLineFinish_()
			arg_132_1.onSingleLineUpdate_ = nil
			arg_132_1.onSingleLineFinish_ = nil
			arg_132_1.state_ = "waiting"
		end

		function arg_132_1.playNext_(arg_134_0)
			if arg_134_0 == 1 then
				arg_132_0:Play419012033(arg_132_1)
			end
		end

		function arg_132_1.onSingleLineUpdate_(arg_135_0)
			local var_135_0 = arg_132_1.actors_["1045ui_story"]
			local var_135_1 = 0

			if var_135_1 < arg_132_1.time_ and arg_132_1.time_ <= var_135_1 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.characterEffect1045ui_story == nil then
				arg_132_1.var_.characterEffect1045ui_story = var_135_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_135_2 = 0.200000002980232

			if var_135_1 <= arg_132_1.time_ and arg_132_1.time_ < var_135_1 + var_135_2 and not isNil(var_135_0) then
				local var_135_3 = (arg_132_1.time_ - var_135_1) / var_135_2

				if arg_132_1.var_.characterEffect1045ui_story and not isNil(var_135_0) then
					local var_135_4 = Mathf.Lerp(0, 0.5, var_135_3)

					arg_132_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_132_1.var_.characterEffect1045ui_story.fillRatio = var_135_4
				end
			end

			if arg_132_1.time_ >= var_135_1 + var_135_2 and arg_132_1.time_ < var_135_1 + var_135_2 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.characterEffect1045ui_story then
				local var_135_5 = 0.5

				arg_132_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_132_1.var_.characterEffect1045ui_story.fillRatio = var_135_5
			end

			local var_135_6 = 0
			local var_135_7 = 0.925

			if var_135_6 < arg_132_1.time_ and arg_132_1.time_ <= var_135_6 + arg_135_0 then
				arg_132_1.talkMaxDuration = 0
				arg_132_1.dialogCg_.alpha = 1

				arg_132_1.dialog_:SetActive(true)
				SetActive(arg_132_1.leftNameGo_, false)

				arg_132_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_132_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_132_1:RecordName(arg_132_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_132_1.iconTrs_.gameObject, false)
				arg_132_1.callingController_:SetSelectedState("normal")

				local var_135_8 = arg_132_1:GetWordFromCfg(419012032)
				local var_135_9 = arg_132_1:FormatText(var_135_8.content)

				arg_132_1.text_.text = var_135_9

				LuaForUtil.ClearLinePrefixSymbol(arg_132_1.text_)

				local var_135_10 = 37
				local var_135_11 = utf8.len(var_135_9)
				local var_135_12 = var_135_10 <= 0 and var_135_7 or var_135_7 * (var_135_11 / var_135_10)

				if var_135_12 > 0 and var_135_7 < var_135_12 then
					arg_132_1.talkMaxDuration = var_135_12

					if var_135_12 + var_135_6 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_12 + var_135_6
					end
				end

				arg_132_1.text_.text = var_135_9
				arg_132_1.typewritter.percent = 0

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(false)
				arg_132_1:RecordContent(arg_132_1.text_.text)
			end

			local var_135_13 = math.max(var_135_7, arg_132_1.talkMaxDuration)

			if var_135_6 <= arg_132_1.time_ and arg_132_1.time_ < var_135_6 + var_135_13 then
				arg_132_1.typewritter.percent = (arg_132_1.time_ - var_135_6) / var_135_13

				arg_132_1.typewritter:SetDirty()
			end

			if arg_132_1.time_ >= var_135_6 + var_135_13 and arg_132_1.time_ < var_135_6 + var_135_13 + arg_135_0 then
				arg_132_1.typewritter.percent = 1

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(true)
			end
		end
	end,
	Play419012033 = function(arg_136_0, arg_136_1)
		arg_136_1.time_ = 0
		arg_136_1.frameCnt_ = 0
		arg_136_1.state_ = "playing"
		arg_136_1.curTalkId_ = 419012033
		arg_136_1.duration_ = 5

		SetActive(arg_136_1.tipsGo_, false)

		function arg_136_1.onSingleLineFinish_()
			arg_136_1.onSingleLineUpdate_ = nil
			arg_136_1.onSingleLineFinish_ = nil
			arg_136_1.state_ = "waiting"
		end

		function arg_136_1.playNext_(arg_138_0)
			if arg_138_0 == 1 then
				arg_136_0:Play419012034(arg_136_1)
			end
		end

		function arg_136_1.onSingleLineUpdate_(arg_139_0)
			local var_139_0 = arg_136_1.actors_["1045ui_story"].transform
			local var_139_1 = 0

			if var_139_1 < arg_136_1.time_ and arg_136_1.time_ <= var_139_1 + arg_139_0 then
				arg_136_1.var_.moveOldPos1045ui_story = var_139_0.localPosition
			end

			local var_139_2 = 0.001

			if var_139_1 <= arg_136_1.time_ and arg_136_1.time_ < var_139_1 + var_139_2 then
				local var_139_3 = (arg_136_1.time_ - var_139_1) / var_139_2
				local var_139_4 = Vector3.New(0.7, -1, -6.05)

				var_139_0.localPosition = Vector3.Lerp(arg_136_1.var_.moveOldPos1045ui_story, var_139_4, var_139_3)

				local var_139_5 = manager.ui.mainCamera.transform.position - var_139_0.position

				var_139_0.forward = Vector3.New(var_139_5.x, var_139_5.y, var_139_5.z)

				local var_139_6 = var_139_0.localEulerAngles

				var_139_6.z = 0
				var_139_6.x = 0
				var_139_0.localEulerAngles = var_139_6
			end

			if arg_136_1.time_ >= var_139_1 + var_139_2 and arg_136_1.time_ < var_139_1 + var_139_2 + arg_139_0 then
				var_139_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_139_7 = manager.ui.mainCamera.transform.position - var_139_0.position

				var_139_0.forward = Vector3.New(var_139_7.x, var_139_7.y, var_139_7.z)

				local var_139_8 = var_139_0.localEulerAngles

				var_139_8.z = 0
				var_139_8.x = 0
				var_139_0.localEulerAngles = var_139_8
			end

			local var_139_9 = arg_136_1.actors_["1045ui_story"]
			local var_139_10 = 0

			if var_139_10 < arg_136_1.time_ and arg_136_1.time_ <= var_139_10 + arg_139_0 and not isNil(var_139_9) and arg_136_1.var_.characterEffect1045ui_story == nil then
				arg_136_1.var_.characterEffect1045ui_story = var_139_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_139_11 = 0.200000002980232

			if var_139_10 <= arg_136_1.time_ and arg_136_1.time_ < var_139_10 + var_139_11 and not isNil(var_139_9) then
				local var_139_12 = (arg_136_1.time_ - var_139_10) / var_139_11

				if arg_136_1.var_.characterEffect1045ui_story and not isNil(var_139_9) then
					arg_136_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_136_1.time_ >= var_139_10 + var_139_11 and arg_136_1.time_ < var_139_10 + var_139_11 + arg_139_0 and not isNil(var_139_9) and arg_136_1.var_.characterEffect1045ui_story then
				arg_136_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_139_13 = 0

			if var_139_13 < arg_136_1.time_ and arg_136_1.time_ <= var_139_13 + arg_139_0 then
				arg_136_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action9_2")
			end

			local var_139_14 = 0

			if var_139_14 < arg_136_1.time_ and arg_136_1.time_ <= var_139_14 + arg_139_0 then
				arg_136_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_renzhen", "EmotionTimelineAnimator")
			end

			local var_139_15 = 0
			local var_139_16 = 1.075

			if var_139_15 < arg_136_1.time_ and arg_136_1.time_ <= var_139_15 + arg_139_0 then
				arg_136_1.talkMaxDuration = 0
				arg_136_1.dialogCg_.alpha = 1

				arg_136_1.dialog_:SetActive(true)
				SetActive(arg_136_1.leftNameGo_, true)

				local var_139_17 = arg_136_1:FormatText(StoryNameCfg[1202].name)

				arg_136_1.leftNameTxt_.text = var_139_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_136_1.leftNameTxt_.transform)

				arg_136_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_136_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_136_1:RecordName(arg_136_1.leftNameTxt_.text)
				SetActive(arg_136_1.iconTrs_.gameObject, false)
				arg_136_1.callingController_:SetSelectedState("normal")

				local var_139_18 = arg_136_1:GetWordFromCfg(419012033)
				local var_139_19 = arg_136_1:FormatText(var_139_18.content)

				arg_136_1.text_.text = var_139_19

				LuaForUtil.ClearLinePrefixSymbol(arg_136_1.text_)

				local var_139_20 = 43
				local var_139_21 = utf8.len(var_139_19)
				local var_139_22 = var_139_20 <= 0 and var_139_16 or var_139_16 * (var_139_21 / var_139_20)

				if var_139_22 > 0 and var_139_16 < var_139_22 then
					arg_136_1.talkMaxDuration = var_139_22

					if var_139_22 + var_139_15 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_22 + var_139_15
					end
				end

				arg_136_1.text_.text = var_139_19
				arg_136_1.typewritter.percent = 0

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(false)
				arg_136_1:RecordContent(arg_136_1.text_.text)
			end

			local var_139_23 = math.max(var_139_16, arg_136_1.talkMaxDuration)

			if var_139_15 <= arg_136_1.time_ and arg_136_1.time_ < var_139_15 + var_139_23 then
				arg_136_1.typewritter.percent = (arg_136_1.time_ - var_139_15) / var_139_23

				arg_136_1.typewritter:SetDirty()
			end

			if arg_136_1.time_ >= var_139_15 + var_139_23 and arg_136_1.time_ < var_139_15 + var_139_23 + arg_139_0 then
				arg_136_1.typewritter.percent = 1

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(true)
			end
		end
	end,
	Play419012034 = function(arg_140_0, arg_140_1)
		arg_140_1.time_ = 0
		arg_140_1.frameCnt_ = 0
		arg_140_1.state_ = "playing"
		arg_140_1.curTalkId_ = 419012034
		arg_140_1.duration_ = 5

		SetActive(arg_140_1.tipsGo_, false)

		function arg_140_1.onSingleLineFinish_()
			arg_140_1.onSingleLineUpdate_ = nil
			arg_140_1.onSingleLineFinish_ = nil
			arg_140_1.state_ = "waiting"
		end

		function arg_140_1.playNext_(arg_142_0)
			if arg_142_0 == 1 then
				arg_140_0:Play419012035(arg_140_1)
			end
		end

		function arg_140_1.onSingleLineUpdate_(arg_143_0)
			local var_143_0 = 0
			local var_143_1 = 1.325

			if var_143_0 < arg_140_1.time_ and arg_140_1.time_ <= var_143_0 + arg_143_0 then
				arg_140_1.talkMaxDuration = 0
				arg_140_1.dialogCg_.alpha = 1

				arg_140_1.dialog_:SetActive(true)
				SetActive(arg_140_1.leftNameGo_, true)

				local var_143_2 = arg_140_1:FormatText(StoryNameCfg[1202].name)

				arg_140_1.leftNameTxt_.text = var_143_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_140_1.leftNameTxt_.transform)

				arg_140_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_140_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_140_1:RecordName(arg_140_1.leftNameTxt_.text)
				SetActive(arg_140_1.iconTrs_.gameObject, false)
				arg_140_1.callingController_:SetSelectedState("normal")

				local var_143_3 = arg_140_1:GetWordFromCfg(419012034)
				local var_143_4 = arg_140_1:FormatText(var_143_3.content)

				arg_140_1.text_.text = var_143_4

				LuaForUtil.ClearLinePrefixSymbol(arg_140_1.text_)

				local var_143_5 = 53
				local var_143_6 = utf8.len(var_143_4)
				local var_143_7 = var_143_5 <= 0 and var_143_1 or var_143_1 * (var_143_6 / var_143_5)

				if var_143_7 > 0 and var_143_1 < var_143_7 then
					arg_140_1.talkMaxDuration = var_143_7

					if var_143_7 + var_143_0 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_7 + var_143_0
					end
				end

				arg_140_1.text_.text = var_143_4
				arg_140_1.typewritter.percent = 0

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(false)
				arg_140_1:RecordContent(arg_140_1.text_.text)
			end

			local var_143_8 = math.max(var_143_1, arg_140_1.talkMaxDuration)

			if var_143_0 <= arg_140_1.time_ and arg_140_1.time_ < var_143_0 + var_143_8 then
				arg_140_1.typewritter.percent = (arg_140_1.time_ - var_143_0) / var_143_8

				arg_140_1.typewritter:SetDirty()
			end

			if arg_140_1.time_ >= var_143_0 + var_143_8 and arg_140_1.time_ < var_143_0 + var_143_8 + arg_143_0 then
				arg_140_1.typewritter.percent = 1

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(true)
			end
		end
	end,
	Play419012035 = function(arg_144_0, arg_144_1)
		arg_144_1.time_ = 0
		arg_144_1.frameCnt_ = 0
		arg_144_1.state_ = "playing"
		arg_144_1.curTalkId_ = 419012035
		arg_144_1.duration_ = 5

		SetActive(arg_144_1.tipsGo_, false)

		function arg_144_1.onSingleLineFinish_()
			arg_144_1.onSingleLineUpdate_ = nil
			arg_144_1.onSingleLineFinish_ = nil
			arg_144_1.state_ = "waiting"
		end

		function arg_144_1.playNext_(arg_146_0)
			if arg_146_0 == 1 then
				arg_144_0:Play419012036(arg_144_1)
			end
		end

		function arg_144_1.onSingleLineUpdate_(arg_147_0)
			local var_147_0 = 0
			local var_147_1 = 1.125

			if var_147_0 < arg_144_1.time_ and arg_144_1.time_ <= var_147_0 + arg_147_0 then
				arg_144_1.talkMaxDuration = 0
				arg_144_1.dialogCg_.alpha = 1

				arg_144_1.dialog_:SetActive(true)
				SetActive(arg_144_1.leftNameGo_, true)

				local var_147_2 = arg_144_1:FormatText(StoryNameCfg[1202].name)

				arg_144_1.leftNameTxt_.text = var_147_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_144_1.leftNameTxt_.transform)

				arg_144_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_144_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_144_1:RecordName(arg_144_1.leftNameTxt_.text)
				SetActive(arg_144_1.iconTrs_.gameObject, false)
				arg_144_1.callingController_:SetSelectedState("normal")

				local var_147_3 = arg_144_1:GetWordFromCfg(419012035)
				local var_147_4 = arg_144_1:FormatText(var_147_3.content)

				arg_144_1.text_.text = var_147_4

				LuaForUtil.ClearLinePrefixSymbol(arg_144_1.text_)

				local var_147_5 = 45
				local var_147_6 = utf8.len(var_147_4)
				local var_147_7 = var_147_5 <= 0 and var_147_1 or var_147_1 * (var_147_6 / var_147_5)

				if var_147_7 > 0 and var_147_1 < var_147_7 then
					arg_144_1.talkMaxDuration = var_147_7

					if var_147_7 + var_147_0 > arg_144_1.duration_ then
						arg_144_1.duration_ = var_147_7 + var_147_0
					end
				end

				arg_144_1.text_.text = var_147_4
				arg_144_1.typewritter.percent = 0

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(false)
				arg_144_1:RecordContent(arg_144_1.text_.text)
			end

			local var_147_8 = math.max(var_147_1, arg_144_1.talkMaxDuration)

			if var_147_0 <= arg_144_1.time_ and arg_144_1.time_ < var_147_0 + var_147_8 then
				arg_144_1.typewritter.percent = (arg_144_1.time_ - var_147_0) / var_147_8

				arg_144_1.typewritter:SetDirty()
			end

			if arg_144_1.time_ >= var_147_0 + var_147_8 and arg_144_1.time_ < var_147_0 + var_147_8 + arg_147_0 then
				arg_144_1.typewritter.percent = 1

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(true)
			end
		end
	end,
	Play419012036 = function(arg_148_0, arg_148_1)
		arg_148_1.time_ = 0
		arg_148_1.frameCnt_ = 0
		arg_148_1.state_ = "playing"
		arg_148_1.curTalkId_ = 419012036
		arg_148_1.duration_ = 5

		SetActive(arg_148_1.tipsGo_, false)

		function arg_148_1.onSingleLineFinish_()
			arg_148_1.onSingleLineUpdate_ = nil
			arg_148_1.onSingleLineFinish_ = nil
			arg_148_1.state_ = "waiting"
		end

		function arg_148_1.playNext_(arg_150_0)
			if arg_150_0 == 1 then
				arg_148_0:Play419012037(arg_148_1)
			end
		end

		function arg_148_1.onSingleLineUpdate_(arg_151_0)
			local var_151_0 = arg_148_1.actors_["1095ui_story"].transform
			local var_151_1 = 0

			if var_151_1 < arg_148_1.time_ and arg_148_1.time_ <= var_151_1 + arg_151_0 then
				arg_148_1.var_.moveOldPos1095ui_story = var_151_0.localPosition
			end

			local var_151_2 = 0.001

			if var_151_1 <= arg_148_1.time_ and arg_148_1.time_ < var_151_1 + var_151_2 then
				local var_151_3 = (arg_148_1.time_ - var_151_1) / var_151_2
				local var_151_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_151_0.localPosition = Vector3.Lerp(arg_148_1.var_.moveOldPos1095ui_story, var_151_4, var_151_3)

				local var_151_5 = manager.ui.mainCamera.transform.position - var_151_0.position

				var_151_0.forward = Vector3.New(var_151_5.x, var_151_5.y, var_151_5.z)

				local var_151_6 = var_151_0.localEulerAngles

				var_151_6.z = 0
				var_151_6.x = 0
				var_151_0.localEulerAngles = var_151_6
			end

			if arg_148_1.time_ >= var_151_1 + var_151_2 and arg_148_1.time_ < var_151_1 + var_151_2 + arg_151_0 then
				var_151_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_151_7 = manager.ui.mainCamera.transform.position - var_151_0.position

				var_151_0.forward = Vector3.New(var_151_7.x, var_151_7.y, var_151_7.z)

				local var_151_8 = var_151_0.localEulerAngles

				var_151_8.z = 0
				var_151_8.x = 0
				var_151_0.localEulerAngles = var_151_8
			end

			local var_151_9 = arg_148_1.actors_["1095ui_story"]
			local var_151_10 = 0

			if var_151_10 < arg_148_1.time_ and arg_148_1.time_ <= var_151_10 + arg_151_0 and not isNil(var_151_9) and arg_148_1.var_.characterEffect1095ui_story == nil then
				arg_148_1.var_.characterEffect1095ui_story = var_151_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_151_11 = 0.200000002980232

			if var_151_10 <= arg_148_1.time_ and arg_148_1.time_ < var_151_10 + var_151_11 and not isNil(var_151_9) then
				local var_151_12 = (arg_148_1.time_ - var_151_10) / var_151_11

				if arg_148_1.var_.characterEffect1095ui_story and not isNil(var_151_9) then
					arg_148_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_148_1.time_ >= var_151_10 + var_151_11 and arg_148_1.time_ < var_151_10 + var_151_11 + arg_151_0 and not isNil(var_151_9) and arg_148_1.var_.characterEffect1095ui_story then
				arg_148_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_151_13 = arg_148_1.actors_["1045ui_story"]
			local var_151_14 = 0

			if var_151_14 < arg_148_1.time_ and arg_148_1.time_ <= var_151_14 + arg_151_0 and not isNil(var_151_13) and arg_148_1.var_.characterEffect1045ui_story == nil then
				arg_148_1.var_.characterEffect1045ui_story = var_151_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_151_15 = 0.200000002980232

			if var_151_14 <= arg_148_1.time_ and arg_148_1.time_ < var_151_14 + var_151_15 and not isNil(var_151_13) then
				local var_151_16 = (arg_148_1.time_ - var_151_14) / var_151_15

				if arg_148_1.var_.characterEffect1045ui_story and not isNil(var_151_13) then
					local var_151_17 = Mathf.Lerp(0, 0.5, var_151_16)

					arg_148_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_148_1.var_.characterEffect1045ui_story.fillRatio = var_151_17
				end
			end

			if arg_148_1.time_ >= var_151_14 + var_151_15 and arg_148_1.time_ < var_151_14 + var_151_15 + arg_151_0 and not isNil(var_151_13) and arg_148_1.var_.characterEffect1045ui_story then
				local var_151_18 = 0.5

				arg_148_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_148_1.var_.characterEffect1045ui_story.fillRatio = var_151_18
			end

			local var_151_19 = 0

			if var_151_19 < arg_148_1.time_ and arg_148_1.time_ <= var_151_19 + arg_151_0 then
				arg_148_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_151_20 = 0

			if var_151_20 < arg_148_1.time_ and arg_148_1.time_ <= var_151_20 + arg_151_0 then
				arg_148_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_151_21 = 0
			local var_151_22 = 0.1

			if var_151_21 < arg_148_1.time_ and arg_148_1.time_ <= var_151_21 + arg_151_0 then
				arg_148_1.talkMaxDuration = 0
				arg_148_1.dialogCg_.alpha = 1

				arg_148_1.dialog_:SetActive(true)
				SetActive(arg_148_1.leftNameGo_, true)

				local var_151_23 = arg_148_1:FormatText(StoryNameCfg[471].name)

				arg_148_1.leftNameTxt_.text = var_151_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_148_1.leftNameTxt_.transform)

				arg_148_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_148_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_148_1:RecordName(arg_148_1.leftNameTxt_.text)
				SetActive(arg_148_1.iconTrs_.gameObject, false)
				arg_148_1.callingController_:SetSelectedState("normal")

				local var_151_24 = arg_148_1:GetWordFromCfg(419012036)
				local var_151_25 = arg_148_1:FormatText(var_151_24.content)

				arg_148_1.text_.text = var_151_25

				LuaForUtil.ClearLinePrefixSymbol(arg_148_1.text_)

				local var_151_26 = 4
				local var_151_27 = utf8.len(var_151_25)
				local var_151_28 = var_151_26 <= 0 and var_151_22 or var_151_22 * (var_151_27 / var_151_26)

				if var_151_28 > 0 and var_151_22 < var_151_28 then
					arg_148_1.talkMaxDuration = var_151_28

					if var_151_28 + var_151_21 > arg_148_1.duration_ then
						arg_148_1.duration_ = var_151_28 + var_151_21
					end
				end

				arg_148_1.text_.text = var_151_25
				arg_148_1.typewritter.percent = 0

				arg_148_1.typewritter:SetDirty()
				arg_148_1:ShowNextGo(false)
				arg_148_1:RecordContent(arg_148_1.text_.text)
			end

			local var_151_29 = math.max(var_151_22, arg_148_1.talkMaxDuration)

			if var_151_21 <= arg_148_1.time_ and arg_148_1.time_ < var_151_21 + var_151_29 then
				arg_148_1.typewritter.percent = (arg_148_1.time_ - var_151_21) / var_151_29

				arg_148_1.typewritter:SetDirty()
			end

			if arg_148_1.time_ >= var_151_21 + var_151_29 and arg_148_1.time_ < var_151_21 + var_151_29 + arg_151_0 then
				arg_148_1.typewritter.percent = 1

				arg_148_1.typewritter:SetDirty()
				arg_148_1:ShowNextGo(true)
			end
		end
	end,
	Play419012037 = function(arg_152_0, arg_152_1)
		arg_152_1.time_ = 0
		arg_152_1.frameCnt_ = 0
		arg_152_1.state_ = "playing"
		arg_152_1.curTalkId_ = 419012037
		arg_152_1.duration_ = 5

		SetActive(arg_152_1.tipsGo_, false)

		function arg_152_1.onSingleLineFinish_()
			arg_152_1.onSingleLineUpdate_ = nil
			arg_152_1.onSingleLineFinish_ = nil
			arg_152_1.state_ = "waiting"
		end

		function arg_152_1.playNext_(arg_154_0)
			if arg_154_0 == 1 then
				arg_152_0:Play419012038(arg_152_1)
			end
		end

		function arg_152_1.onSingleLineUpdate_(arg_155_0)
			local var_155_0 = arg_152_1.actors_["1045ui_story"].transform
			local var_155_1 = 0

			if var_155_1 < arg_152_1.time_ and arg_152_1.time_ <= var_155_1 + arg_155_0 then
				arg_152_1.var_.moveOldPos1045ui_story = var_155_0.localPosition
			end

			local var_155_2 = 0.001

			if var_155_1 <= arg_152_1.time_ and arg_152_1.time_ < var_155_1 + var_155_2 then
				local var_155_3 = (arg_152_1.time_ - var_155_1) / var_155_2
				local var_155_4 = Vector3.New(0.7, -1, -6.05)

				var_155_0.localPosition = Vector3.Lerp(arg_152_1.var_.moveOldPos1045ui_story, var_155_4, var_155_3)

				local var_155_5 = manager.ui.mainCamera.transform.position - var_155_0.position

				var_155_0.forward = Vector3.New(var_155_5.x, var_155_5.y, var_155_5.z)

				local var_155_6 = var_155_0.localEulerAngles

				var_155_6.z = 0
				var_155_6.x = 0
				var_155_0.localEulerAngles = var_155_6
			end

			if arg_152_1.time_ >= var_155_1 + var_155_2 and arg_152_1.time_ < var_155_1 + var_155_2 + arg_155_0 then
				var_155_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_155_7 = manager.ui.mainCamera.transform.position - var_155_0.position

				var_155_0.forward = Vector3.New(var_155_7.x, var_155_7.y, var_155_7.z)

				local var_155_8 = var_155_0.localEulerAngles

				var_155_8.z = 0
				var_155_8.x = 0
				var_155_0.localEulerAngles = var_155_8
			end

			local var_155_9 = arg_152_1.actors_["1045ui_story"]
			local var_155_10 = 0

			if var_155_10 < arg_152_1.time_ and arg_152_1.time_ <= var_155_10 + arg_155_0 and not isNil(var_155_9) and arg_152_1.var_.characterEffect1045ui_story == nil then
				arg_152_1.var_.characterEffect1045ui_story = var_155_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_155_11 = 0.200000002980232

			if var_155_10 <= arg_152_1.time_ and arg_152_1.time_ < var_155_10 + var_155_11 and not isNil(var_155_9) then
				local var_155_12 = (arg_152_1.time_ - var_155_10) / var_155_11

				if arg_152_1.var_.characterEffect1045ui_story and not isNil(var_155_9) then
					arg_152_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_152_1.time_ >= var_155_10 + var_155_11 and arg_152_1.time_ < var_155_10 + var_155_11 + arg_155_0 and not isNil(var_155_9) and arg_152_1.var_.characterEffect1045ui_story then
				arg_152_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_155_13 = arg_152_1.actors_["1095ui_story"]
			local var_155_14 = 0

			if var_155_14 < arg_152_1.time_ and arg_152_1.time_ <= var_155_14 + arg_155_0 and not isNil(var_155_13) and arg_152_1.var_.characterEffect1095ui_story == nil then
				arg_152_1.var_.characterEffect1095ui_story = var_155_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_155_15 = 0.200000002980232

			if var_155_14 <= arg_152_1.time_ and arg_152_1.time_ < var_155_14 + var_155_15 and not isNil(var_155_13) then
				local var_155_16 = (arg_152_1.time_ - var_155_14) / var_155_15

				if arg_152_1.var_.characterEffect1095ui_story and not isNil(var_155_13) then
					local var_155_17 = Mathf.Lerp(0, 0.5, var_155_16)

					arg_152_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_152_1.var_.characterEffect1095ui_story.fillRatio = var_155_17
				end
			end

			if arg_152_1.time_ >= var_155_14 + var_155_15 and arg_152_1.time_ < var_155_14 + var_155_15 + arg_155_0 and not isNil(var_155_13) and arg_152_1.var_.characterEffect1095ui_story then
				local var_155_18 = 0.5

				arg_152_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_152_1.var_.characterEffect1095ui_story.fillRatio = var_155_18
			end

			local var_155_19 = 0

			if var_155_19 < arg_152_1.time_ and arg_152_1.time_ <= var_155_19 + arg_155_0 then
				arg_152_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action2_1")
			end

			local var_155_20 = 0

			if var_155_20 < arg_152_1.time_ and arg_152_1.time_ <= var_155_20 + arg_155_0 then
				arg_152_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_155_21 = 0
			local var_155_22 = 0.6

			if var_155_21 < arg_152_1.time_ and arg_152_1.time_ <= var_155_21 + arg_155_0 then
				arg_152_1.talkMaxDuration = 0
				arg_152_1.dialogCg_.alpha = 1

				arg_152_1.dialog_:SetActive(true)
				SetActive(arg_152_1.leftNameGo_, true)

				local var_155_23 = arg_152_1:FormatText(StoryNameCfg[1202].name)

				arg_152_1.leftNameTxt_.text = var_155_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_152_1.leftNameTxt_.transform)

				arg_152_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_152_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_152_1:RecordName(arg_152_1.leftNameTxt_.text)
				SetActive(arg_152_1.iconTrs_.gameObject, false)
				arg_152_1.callingController_:SetSelectedState("normal")

				local var_155_24 = arg_152_1:GetWordFromCfg(419012037)
				local var_155_25 = arg_152_1:FormatText(var_155_24.content)

				arg_152_1.text_.text = var_155_25

				LuaForUtil.ClearLinePrefixSymbol(arg_152_1.text_)

				local var_155_26 = 24
				local var_155_27 = utf8.len(var_155_25)
				local var_155_28 = var_155_26 <= 0 and var_155_22 or var_155_22 * (var_155_27 / var_155_26)

				if var_155_28 > 0 and var_155_22 < var_155_28 then
					arg_152_1.talkMaxDuration = var_155_28

					if var_155_28 + var_155_21 > arg_152_1.duration_ then
						arg_152_1.duration_ = var_155_28 + var_155_21
					end
				end

				arg_152_1.text_.text = var_155_25
				arg_152_1.typewritter.percent = 0

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(false)
				arg_152_1:RecordContent(arg_152_1.text_.text)
			end

			local var_155_29 = math.max(var_155_22, arg_152_1.talkMaxDuration)

			if var_155_21 <= arg_152_1.time_ and arg_152_1.time_ < var_155_21 + var_155_29 then
				arg_152_1.typewritter.percent = (arg_152_1.time_ - var_155_21) / var_155_29

				arg_152_1.typewritter:SetDirty()
			end

			if arg_152_1.time_ >= var_155_21 + var_155_29 and arg_152_1.time_ < var_155_21 + var_155_29 + arg_155_0 then
				arg_152_1.typewritter.percent = 1

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(true)
			end
		end
	end,
	Play419012038 = function(arg_156_0, arg_156_1)
		arg_156_1.time_ = 0
		arg_156_1.frameCnt_ = 0
		arg_156_1.state_ = "playing"
		arg_156_1.curTalkId_ = 419012038
		arg_156_1.duration_ = 5

		SetActive(arg_156_1.tipsGo_, false)

		function arg_156_1.onSingleLineFinish_()
			arg_156_1.onSingleLineUpdate_ = nil
			arg_156_1.onSingleLineFinish_ = nil
			arg_156_1.state_ = "waiting"
		end

		function arg_156_1.playNext_(arg_158_0)
			if arg_158_0 == 1 then
				arg_156_0:Play419012039(arg_156_1)
			end
		end

		function arg_156_1.onSingleLineUpdate_(arg_159_0)
			local var_159_0 = 0

			if var_159_0 < arg_156_1.time_ and arg_156_1.time_ <= var_159_0 + arg_159_0 then
				arg_156_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_nanguoA", "EmotionTimelineAnimator")
			end

			local var_159_1 = 0
			local var_159_2 = 0.4

			if var_159_1 < arg_156_1.time_ and arg_156_1.time_ <= var_159_1 + arg_159_0 then
				arg_156_1.talkMaxDuration = 0
				arg_156_1.dialogCg_.alpha = 1

				arg_156_1.dialog_:SetActive(true)
				SetActive(arg_156_1.leftNameGo_, true)

				local var_159_3 = arg_156_1:FormatText(StoryNameCfg[1202].name)

				arg_156_1.leftNameTxt_.text = var_159_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_156_1.leftNameTxt_.transform)

				arg_156_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_156_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_156_1:RecordName(arg_156_1.leftNameTxt_.text)
				SetActive(arg_156_1.iconTrs_.gameObject, false)
				arg_156_1.callingController_:SetSelectedState("normal")

				local var_159_4 = arg_156_1:GetWordFromCfg(419012038)
				local var_159_5 = arg_156_1:FormatText(var_159_4.content)

				arg_156_1.text_.text = var_159_5

				LuaForUtil.ClearLinePrefixSymbol(arg_156_1.text_)

				local var_159_6 = 24
				local var_159_7 = utf8.len(var_159_5)
				local var_159_8 = var_159_6 <= 0 and var_159_2 or var_159_2 * (var_159_7 / var_159_6)

				if var_159_8 > 0 and var_159_2 < var_159_8 then
					arg_156_1.talkMaxDuration = var_159_8

					if var_159_8 + var_159_1 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_8 + var_159_1
					end
				end

				arg_156_1.text_.text = var_159_5
				arg_156_1.typewritter.percent = 0

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(false)
				arg_156_1:RecordContent(arg_156_1.text_.text)
			end

			local var_159_9 = math.max(var_159_2, arg_156_1.talkMaxDuration)

			if var_159_1 <= arg_156_1.time_ and arg_156_1.time_ < var_159_1 + var_159_9 then
				arg_156_1.typewritter.percent = (arg_156_1.time_ - var_159_1) / var_159_9

				arg_156_1.typewritter:SetDirty()
			end

			if arg_156_1.time_ >= var_159_1 + var_159_9 and arg_156_1.time_ < var_159_1 + var_159_9 + arg_159_0 then
				arg_156_1.typewritter.percent = 1

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(true)
			end
		end
	end,
	Play419012039 = function(arg_160_0, arg_160_1)
		arg_160_1.time_ = 0
		arg_160_1.frameCnt_ = 0
		arg_160_1.state_ = "playing"
		arg_160_1.curTalkId_ = 419012039
		arg_160_1.duration_ = 5

		SetActive(arg_160_1.tipsGo_, false)

		function arg_160_1.onSingleLineFinish_()
			arg_160_1.onSingleLineUpdate_ = nil
			arg_160_1.onSingleLineFinish_ = nil
			arg_160_1.state_ = "waiting"
		end

		function arg_160_1.playNext_(arg_162_0)
			if arg_162_0 == 1 then
				arg_160_0:Play419012040(arg_160_1)
			end
		end

		function arg_160_1.onSingleLineUpdate_(arg_163_0)
			local var_163_0 = arg_160_1.actors_["1095ui_story"]
			local var_163_1 = 0

			if var_163_1 < arg_160_1.time_ and arg_160_1.time_ <= var_163_1 + arg_163_0 and not isNil(var_163_0) and arg_160_1.var_.characterEffect1095ui_story == nil then
				arg_160_1.var_.characterEffect1095ui_story = var_163_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_163_2 = 0.200000002980232

			if var_163_1 <= arg_160_1.time_ and arg_160_1.time_ < var_163_1 + var_163_2 and not isNil(var_163_0) then
				local var_163_3 = (arg_160_1.time_ - var_163_1) / var_163_2

				if arg_160_1.var_.characterEffect1095ui_story and not isNil(var_163_0) then
					arg_160_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_160_1.time_ >= var_163_1 + var_163_2 and arg_160_1.time_ < var_163_1 + var_163_2 + arg_163_0 and not isNil(var_163_0) and arg_160_1.var_.characterEffect1095ui_story then
				arg_160_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_163_4 = arg_160_1.actors_["1045ui_story"]
			local var_163_5 = 0

			if var_163_5 < arg_160_1.time_ and arg_160_1.time_ <= var_163_5 + arg_163_0 and not isNil(var_163_4) and arg_160_1.var_.characterEffect1045ui_story == nil then
				arg_160_1.var_.characterEffect1045ui_story = var_163_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_163_6 = 0.200000002980232

			if var_163_5 <= arg_160_1.time_ and arg_160_1.time_ < var_163_5 + var_163_6 and not isNil(var_163_4) then
				local var_163_7 = (arg_160_1.time_ - var_163_5) / var_163_6

				if arg_160_1.var_.characterEffect1045ui_story and not isNil(var_163_4) then
					local var_163_8 = Mathf.Lerp(0, 0.5, var_163_7)

					arg_160_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_160_1.var_.characterEffect1045ui_story.fillRatio = var_163_8
				end
			end

			if arg_160_1.time_ >= var_163_5 + var_163_6 and arg_160_1.time_ < var_163_5 + var_163_6 + arg_163_0 and not isNil(var_163_4) and arg_160_1.var_.characterEffect1045ui_story then
				local var_163_9 = 0.5

				arg_160_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_160_1.var_.characterEffect1045ui_story.fillRatio = var_163_9
			end

			local var_163_10 = 0

			if var_163_10 < arg_160_1.time_ and arg_160_1.time_ <= var_163_10 + arg_163_0 then
				arg_160_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_163_11 = 0

			if var_163_11 < arg_160_1.time_ and arg_160_1.time_ <= var_163_11 + arg_163_0 then
				arg_160_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_163_12 = 0
			local var_163_13 = 0.75

			if var_163_12 < arg_160_1.time_ and arg_160_1.time_ <= var_163_12 + arg_163_0 then
				arg_160_1.talkMaxDuration = 0
				arg_160_1.dialogCg_.alpha = 1

				arg_160_1.dialog_:SetActive(true)
				SetActive(arg_160_1.leftNameGo_, true)

				local var_163_14 = arg_160_1:FormatText(StoryNameCfg[471].name)

				arg_160_1.leftNameTxt_.text = var_163_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_160_1.leftNameTxt_.transform)

				arg_160_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_160_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_160_1:RecordName(arg_160_1.leftNameTxt_.text)
				SetActive(arg_160_1.iconTrs_.gameObject, false)
				arg_160_1.callingController_:SetSelectedState("normal")

				local var_163_15 = arg_160_1:GetWordFromCfg(419012039)
				local var_163_16 = arg_160_1:FormatText(var_163_15.content)

				arg_160_1.text_.text = var_163_16

				LuaForUtil.ClearLinePrefixSymbol(arg_160_1.text_)

				local var_163_17 = 30
				local var_163_18 = utf8.len(var_163_16)
				local var_163_19 = var_163_17 <= 0 and var_163_13 or var_163_13 * (var_163_18 / var_163_17)

				if var_163_19 > 0 and var_163_13 < var_163_19 then
					arg_160_1.talkMaxDuration = var_163_19

					if var_163_19 + var_163_12 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_19 + var_163_12
					end
				end

				arg_160_1.text_.text = var_163_16
				arg_160_1.typewritter.percent = 0

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(false)
				arg_160_1:RecordContent(arg_160_1.text_.text)
			end

			local var_163_20 = math.max(var_163_13, arg_160_1.talkMaxDuration)

			if var_163_12 <= arg_160_1.time_ and arg_160_1.time_ < var_163_12 + var_163_20 then
				arg_160_1.typewritter.percent = (arg_160_1.time_ - var_163_12) / var_163_20

				arg_160_1.typewritter:SetDirty()
			end

			if arg_160_1.time_ >= var_163_12 + var_163_20 and arg_160_1.time_ < var_163_12 + var_163_20 + arg_163_0 then
				arg_160_1.typewritter.percent = 1

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(true)
			end
		end
	end,
	Play419012040 = function(arg_164_0, arg_164_1)
		arg_164_1.time_ = 0
		arg_164_1.frameCnt_ = 0
		arg_164_1.state_ = "playing"
		arg_164_1.curTalkId_ = 419012040
		arg_164_1.duration_ = 5

		SetActive(arg_164_1.tipsGo_, false)

		function arg_164_1.onSingleLineFinish_()
			arg_164_1.onSingleLineUpdate_ = nil
			arg_164_1.onSingleLineFinish_ = nil
			arg_164_1.state_ = "waiting"
		end

		function arg_164_1.playNext_(arg_166_0)
			if arg_166_0 == 1 then
				arg_164_0:Play419012041(arg_164_1)
			end
		end

		function arg_164_1.onSingleLineUpdate_(arg_167_0)
			local var_167_0 = arg_164_1.actors_["1045ui_story"].transform
			local var_167_1 = 0

			if var_167_1 < arg_164_1.time_ and arg_164_1.time_ <= var_167_1 + arg_167_0 then
				arg_164_1.var_.moveOldPos1045ui_story = var_167_0.localPosition
			end

			local var_167_2 = 0.001

			if var_167_1 <= arg_164_1.time_ and arg_164_1.time_ < var_167_1 + var_167_2 then
				local var_167_3 = (arg_164_1.time_ - var_167_1) / var_167_2
				local var_167_4 = Vector3.New(0.7, -1, -6.05)

				var_167_0.localPosition = Vector3.Lerp(arg_164_1.var_.moveOldPos1045ui_story, var_167_4, var_167_3)

				local var_167_5 = manager.ui.mainCamera.transform.position - var_167_0.position

				var_167_0.forward = Vector3.New(var_167_5.x, var_167_5.y, var_167_5.z)

				local var_167_6 = var_167_0.localEulerAngles

				var_167_6.z = 0
				var_167_6.x = 0
				var_167_0.localEulerAngles = var_167_6
			end

			if arg_164_1.time_ >= var_167_1 + var_167_2 and arg_164_1.time_ < var_167_1 + var_167_2 + arg_167_0 then
				var_167_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_167_7 = manager.ui.mainCamera.transform.position - var_167_0.position

				var_167_0.forward = Vector3.New(var_167_7.x, var_167_7.y, var_167_7.z)

				local var_167_8 = var_167_0.localEulerAngles

				var_167_8.z = 0
				var_167_8.x = 0
				var_167_0.localEulerAngles = var_167_8
			end

			local var_167_9 = arg_164_1.actors_["1045ui_story"]
			local var_167_10 = 0

			if var_167_10 < arg_164_1.time_ and arg_164_1.time_ <= var_167_10 + arg_167_0 and not isNil(var_167_9) and arg_164_1.var_.characterEffect1045ui_story == nil then
				arg_164_1.var_.characterEffect1045ui_story = var_167_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_167_11 = 0.200000002980232

			if var_167_10 <= arg_164_1.time_ and arg_164_1.time_ < var_167_10 + var_167_11 and not isNil(var_167_9) then
				local var_167_12 = (arg_164_1.time_ - var_167_10) / var_167_11

				if arg_164_1.var_.characterEffect1045ui_story and not isNil(var_167_9) then
					arg_164_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_164_1.time_ >= var_167_10 + var_167_11 and arg_164_1.time_ < var_167_10 + var_167_11 + arg_167_0 and not isNil(var_167_9) and arg_164_1.var_.characterEffect1045ui_story then
				arg_164_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_167_13 = arg_164_1.actors_["1095ui_story"]
			local var_167_14 = 0

			if var_167_14 < arg_164_1.time_ and arg_164_1.time_ <= var_167_14 + arg_167_0 and not isNil(var_167_13) and arg_164_1.var_.characterEffect1095ui_story == nil then
				arg_164_1.var_.characterEffect1095ui_story = var_167_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_167_15 = 0.200000002980232

			if var_167_14 <= arg_164_1.time_ and arg_164_1.time_ < var_167_14 + var_167_15 and not isNil(var_167_13) then
				local var_167_16 = (arg_164_1.time_ - var_167_14) / var_167_15

				if arg_164_1.var_.characterEffect1095ui_story and not isNil(var_167_13) then
					local var_167_17 = Mathf.Lerp(0, 0.5, var_167_16)

					arg_164_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_164_1.var_.characterEffect1095ui_story.fillRatio = var_167_17
				end
			end

			if arg_164_1.time_ >= var_167_14 + var_167_15 and arg_164_1.time_ < var_167_14 + var_167_15 + arg_167_0 and not isNil(var_167_13) and arg_164_1.var_.characterEffect1095ui_story then
				local var_167_18 = 0.5

				arg_164_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_164_1.var_.characterEffect1095ui_story.fillRatio = var_167_18
			end

			local var_167_19 = 0

			if var_167_19 < arg_164_1.time_ and arg_164_1.time_ <= var_167_19 + arg_167_0 then
				arg_164_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action2_2")
			end

			local var_167_20 = 0

			if var_167_20 < arg_164_1.time_ and arg_164_1.time_ <= var_167_20 + arg_167_0 then
				arg_164_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_167_21 = 0
			local var_167_22 = 0.1

			if var_167_21 < arg_164_1.time_ and arg_164_1.time_ <= var_167_21 + arg_167_0 then
				arg_164_1.talkMaxDuration = 0
				arg_164_1.dialogCg_.alpha = 1

				arg_164_1.dialog_:SetActive(true)
				SetActive(arg_164_1.leftNameGo_, true)

				local var_167_23 = arg_164_1:FormatText(StoryNameCfg[1202].name)

				arg_164_1.leftNameTxt_.text = var_167_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_164_1.leftNameTxt_.transform)

				arg_164_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_164_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_164_1:RecordName(arg_164_1.leftNameTxt_.text)
				SetActive(arg_164_1.iconTrs_.gameObject, false)
				arg_164_1.callingController_:SetSelectedState("normal")

				local var_167_24 = arg_164_1:GetWordFromCfg(419012040)
				local var_167_25 = arg_164_1:FormatText(var_167_24.content)

				arg_164_1.text_.text = var_167_25

				LuaForUtil.ClearLinePrefixSymbol(arg_164_1.text_)

				local var_167_26 = 4
				local var_167_27 = utf8.len(var_167_25)
				local var_167_28 = var_167_26 <= 0 and var_167_22 or var_167_22 * (var_167_27 / var_167_26)

				if var_167_28 > 0 and var_167_22 < var_167_28 then
					arg_164_1.talkMaxDuration = var_167_28

					if var_167_28 + var_167_21 > arg_164_1.duration_ then
						arg_164_1.duration_ = var_167_28 + var_167_21
					end
				end

				arg_164_1.text_.text = var_167_25
				arg_164_1.typewritter.percent = 0

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(false)
				arg_164_1:RecordContent(arg_164_1.text_.text)
			end

			local var_167_29 = math.max(var_167_22, arg_164_1.talkMaxDuration)

			if var_167_21 <= arg_164_1.time_ and arg_164_1.time_ < var_167_21 + var_167_29 then
				arg_164_1.typewritter.percent = (arg_164_1.time_ - var_167_21) / var_167_29

				arg_164_1.typewritter:SetDirty()
			end

			if arg_164_1.time_ >= var_167_21 + var_167_29 and arg_164_1.time_ < var_167_21 + var_167_29 + arg_167_0 then
				arg_164_1.typewritter.percent = 1

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(true)
			end
		end
	end,
	Play419012041 = function(arg_168_0, arg_168_1)
		arg_168_1.time_ = 0
		arg_168_1.frameCnt_ = 0
		arg_168_1.state_ = "playing"
		arg_168_1.curTalkId_ = 419012041
		arg_168_1.duration_ = 5

		SetActive(arg_168_1.tipsGo_, false)

		function arg_168_1.onSingleLineFinish_()
			arg_168_1.onSingleLineUpdate_ = nil
			arg_168_1.onSingleLineFinish_ = nil
			arg_168_1.state_ = "waiting"
		end

		function arg_168_1.playNext_(arg_170_0)
			if arg_170_0 == 1 then
				arg_168_0:Play419012042(arg_168_1)
			end
		end

		function arg_168_1.onSingleLineUpdate_(arg_171_0)
			local var_171_0 = arg_168_1.actors_["1095ui_story"].transform
			local var_171_1 = 0

			if var_171_1 < arg_168_1.time_ and arg_168_1.time_ <= var_171_1 + arg_171_0 then
				arg_168_1.var_.moveOldPos1095ui_story = var_171_0.localPosition
			end

			local var_171_2 = 0.001

			if var_171_1 <= arg_168_1.time_ and arg_168_1.time_ < var_171_1 + var_171_2 then
				local var_171_3 = (arg_168_1.time_ - var_171_1) / var_171_2
				local var_171_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_171_0.localPosition = Vector3.Lerp(arg_168_1.var_.moveOldPos1095ui_story, var_171_4, var_171_3)

				local var_171_5 = manager.ui.mainCamera.transform.position - var_171_0.position

				var_171_0.forward = Vector3.New(var_171_5.x, var_171_5.y, var_171_5.z)

				local var_171_6 = var_171_0.localEulerAngles

				var_171_6.z = 0
				var_171_6.x = 0
				var_171_0.localEulerAngles = var_171_6
			end

			if arg_168_1.time_ >= var_171_1 + var_171_2 and arg_168_1.time_ < var_171_1 + var_171_2 + arg_171_0 then
				var_171_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_171_7 = manager.ui.mainCamera.transform.position - var_171_0.position

				var_171_0.forward = Vector3.New(var_171_7.x, var_171_7.y, var_171_7.z)

				local var_171_8 = var_171_0.localEulerAngles

				var_171_8.z = 0
				var_171_8.x = 0
				var_171_0.localEulerAngles = var_171_8
			end

			local var_171_9 = arg_168_1.actors_["1095ui_story"]
			local var_171_10 = 0

			if var_171_10 < arg_168_1.time_ and arg_168_1.time_ <= var_171_10 + arg_171_0 and not isNil(var_171_9) and arg_168_1.var_.characterEffect1095ui_story == nil then
				arg_168_1.var_.characterEffect1095ui_story = var_171_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_171_11 = 0.200000002980232

			if var_171_10 <= arg_168_1.time_ and arg_168_1.time_ < var_171_10 + var_171_11 and not isNil(var_171_9) then
				local var_171_12 = (arg_168_1.time_ - var_171_10) / var_171_11

				if arg_168_1.var_.characterEffect1095ui_story and not isNil(var_171_9) then
					arg_168_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_168_1.time_ >= var_171_10 + var_171_11 and arg_168_1.time_ < var_171_10 + var_171_11 + arg_171_0 and not isNil(var_171_9) and arg_168_1.var_.characterEffect1095ui_story then
				arg_168_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_171_13 = arg_168_1.actors_["1045ui_story"]
			local var_171_14 = 0

			if var_171_14 < arg_168_1.time_ and arg_168_1.time_ <= var_171_14 + arg_171_0 and not isNil(var_171_13) and arg_168_1.var_.characterEffect1045ui_story == nil then
				arg_168_1.var_.characterEffect1045ui_story = var_171_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_171_15 = 0.200000002980232

			if var_171_14 <= arg_168_1.time_ and arg_168_1.time_ < var_171_14 + var_171_15 and not isNil(var_171_13) then
				local var_171_16 = (arg_168_1.time_ - var_171_14) / var_171_15

				if arg_168_1.var_.characterEffect1045ui_story and not isNil(var_171_13) then
					local var_171_17 = Mathf.Lerp(0, 0.5, var_171_16)

					arg_168_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_168_1.var_.characterEffect1045ui_story.fillRatio = var_171_17
				end
			end

			if arg_168_1.time_ >= var_171_14 + var_171_15 and arg_168_1.time_ < var_171_14 + var_171_15 + arg_171_0 and not isNil(var_171_13) and arg_168_1.var_.characterEffect1045ui_story then
				local var_171_18 = 0.5

				arg_168_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_168_1.var_.characterEffect1045ui_story.fillRatio = var_171_18
			end

			local var_171_19 = 0

			if var_171_19 < arg_168_1.time_ and arg_168_1.time_ <= var_171_19 + arg_171_0 then
				arg_168_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_171_20 = 0

			if var_171_20 < arg_168_1.time_ and arg_168_1.time_ <= var_171_20 + arg_171_0 then
				arg_168_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_171_21 = 0
			local var_171_22 = 0.9

			if var_171_21 < arg_168_1.time_ and arg_168_1.time_ <= var_171_21 + arg_171_0 then
				arg_168_1.talkMaxDuration = 0
				arg_168_1.dialogCg_.alpha = 1

				arg_168_1.dialog_:SetActive(true)
				SetActive(arg_168_1.leftNameGo_, true)

				local var_171_23 = arg_168_1:FormatText(StoryNameCfg[471].name)

				arg_168_1.leftNameTxt_.text = var_171_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_168_1.leftNameTxt_.transform)

				arg_168_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_168_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_168_1:RecordName(arg_168_1.leftNameTxt_.text)
				SetActive(arg_168_1.iconTrs_.gameObject, false)
				arg_168_1.callingController_:SetSelectedState("normal")

				local var_171_24 = arg_168_1:GetWordFromCfg(419012041)
				local var_171_25 = arg_168_1:FormatText(var_171_24.content)

				arg_168_1.text_.text = var_171_25

				LuaForUtil.ClearLinePrefixSymbol(arg_168_1.text_)

				local var_171_26 = 36
				local var_171_27 = utf8.len(var_171_25)
				local var_171_28 = var_171_26 <= 0 and var_171_22 or var_171_22 * (var_171_27 / var_171_26)

				if var_171_28 > 0 and var_171_22 < var_171_28 then
					arg_168_1.talkMaxDuration = var_171_28

					if var_171_28 + var_171_21 > arg_168_1.duration_ then
						arg_168_1.duration_ = var_171_28 + var_171_21
					end
				end

				arg_168_1.text_.text = var_171_25
				arg_168_1.typewritter.percent = 0

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(false)
				arg_168_1:RecordContent(arg_168_1.text_.text)
			end

			local var_171_29 = math.max(var_171_22, arg_168_1.talkMaxDuration)

			if var_171_21 <= arg_168_1.time_ and arg_168_1.time_ < var_171_21 + var_171_29 then
				arg_168_1.typewritter.percent = (arg_168_1.time_ - var_171_21) / var_171_29

				arg_168_1.typewritter:SetDirty()
			end

			if arg_168_1.time_ >= var_171_21 + var_171_29 and arg_168_1.time_ < var_171_21 + var_171_29 + arg_171_0 then
				arg_168_1.typewritter.percent = 1

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(true)
			end
		end
	end,
	Play419012042 = function(arg_172_0, arg_172_1)
		arg_172_1.time_ = 0
		arg_172_1.frameCnt_ = 0
		arg_172_1.state_ = "playing"
		arg_172_1.curTalkId_ = 419012042
		arg_172_1.duration_ = 5

		SetActive(arg_172_1.tipsGo_, false)

		function arg_172_1.onSingleLineFinish_()
			arg_172_1.onSingleLineUpdate_ = nil
			arg_172_1.onSingleLineFinish_ = nil
			arg_172_1.state_ = "waiting"
		end

		function arg_172_1.playNext_(arg_174_0)
			if arg_174_0 == 1 then
				arg_172_0:Play419012043(arg_172_1)
			end
		end

		function arg_172_1.onSingleLineUpdate_(arg_175_0)
			local var_175_0 = 0
			local var_175_1 = 0.975

			if var_175_0 < arg_172_1.time_ and arg_172_1.time_ <= var_175_0 + arg_175_0 then
				arg_172_1.talkMaxDuration = 0
				arg_172_1.dialogCg_.alpha = 1

				arg_172_1.dialog_:SetActive(true)
				SetActive(arg_172_1.leftNameGo_, true)

				local var_175_2 = arg_172_1:FormatText(StoryNameCfg[471].name)

				arg_172_1.leftNameTxt_.text = var_175_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_172_1.leftNameTxt_.transform)

				arg_172_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_172_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_172_1:RecordName(arg_172_1.leftNameTxt_.text)
				SetActive(arg_172_1.iconTrs_.gameObject, false)
				arg_172_1.callingController_:SetSelectedState("normal")

				local var_175_3 = arg_172_1:GetWordFromCfg(419012042)
				local var_175_4 = arg_172_1:FormatText(var_175_3.content)

				arg_172_1.text_.text = var_175_4

				LuaForUtil.ClearLinePrefixSymbol(arg_172_1.text_)

				local var_175_5 = 39
				local var_175_6 = utf8.len(var_175_4)
				local var_175_7 = var_175_5 <= 0 and var_175_1 or var_175_1 * (var_175_6 / var_175_5)

				if var_175_7 > 0 and var_175_1 < var_175_7 then
					arg_172_1.talkMaxDuration = var_175_7

					if var_175_7 + var_175_0 > arg_172_1.duration_ then
						arg_172_1.duration_ = var_175_7 + var_175_0
					end
				end

				arg_172_1.text_.text = var_175_4
				arg_172_1.typewritter.percent = 0

				arg_172_1.typewritter:SetDirty()
				arg_172_1:ShowNextGo(false)
				arg_172_1:RecordContent(arg_172_1.text_.text)
			end

			local var_175_8 = math.max(var_175_1, arg_172_1.talkMaxDuration)

			if var_175_0 <= arg_172_1.time_ and arg_172_1.time_ < var_175_0 + var_175_8 then
				arg_172_1.typewritter.percent = (arg_172_1.time_ - var_175_0) / var_175_8

				arg_172_1.typewritter:SetDirty()
			end

			if arg_172_1.time_ >= var_175_0 + var_175_8 and arg_172_1.time_ < var_175_0 + var_175_8 + arg_175_0 then
				arg_172_1.typewritter.percent = 1

				arg_172_1.typewritter:SetDirty()
				arg_172_1:ShowNextGo(true)
			end
		end
	end,
	Play419012043 = function(arg_176_0, arg_176_1)
		arg_176_1.time_ = 0
		arg_176_1.frameCnt_ = 0
		arg_176_1.state_ = "playing"
		arg_176_1.curTalkId_ = 419012043
		arg_176_1.duration_ = 5

		SetActive(arg_176_1.tipsGo_, false)

		function arg_176_1.onSingleLineFinish_()
			arg_176_1.onSingleLineUpdate_ = nil
			arg_176_1.onSingleLineFinish_ = nil
			arg_176_1.state_ = "waiting"
		end

		function arg_176_1.playNext_(arg_178_0)
			if arg_178_0 == 1 then
				arg_176_0:Play419012044(arg_176_1)
			end
		end

		function arg_176_1.onSingleLineUpdate_(arg_179_0)
			local var_179_0 = 0

			if var_179_0 < arg_176_1.time_ and arg_176_1.time_ <= var_179_0 + arg_179_0 then
				arg_176_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_179_1 = 0
			local var_179_2 = 1.075

			if var_179_1 < arg_176_1.time_ and arg_176_1.time_ <= var_179_1 + arg_179_0 then
				arg_176_1.talkMaxDuration = 0
				arg_176_1.dialogCg_.alpha = 1

				arg_176_1.dialog_:SetActive(true)
				SetActive(arg_176_1.leftNameGo_, true)

				local var_179_3 = arg_176_1:FormatText(StoryNameCfg[471].name)

				arg_176_1.leftNameTxt_.text = var_179_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_176_1.leftNameTxt_.transform)

				arg_176_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_176_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_176_1:RecordName(arg_176_1.leftNameTxt_.text)
				SetActive(arg_176_1.iconTrs_.gameObject, false)
				arg_176_1.callingController_:SetSelectedState("normal")

				local var_179_4 = arg_176_1:GetWordFromCfg(419012043)
				local var_179_5 = arg_176_1:FormatText(var_179_4.content)

				arg_176_1.text_.text = var_179_5

				LuaForUtil.ClearLinePrefixSymbol(arg_176_1.text_)

				local var_179_6 = 43
				local var_179_7 = utf8.len(var_179_5)
				local var_179_8 = var_179_6 <= 0 and var_179_2 or var_179_2 * (var_179_7 / var_179_6)

				if var_179_8 > 0 and var_179_2 < var_179_8 then
					arg_176_1.talkMaxDuration = var_179_8

					if var_179_8 + var_179_1 > arg_176_1.duration_ then
						arg_176_1.duration_ = var_179_8 + var_179_1
					end
				end

				arg_176_1.text_.text = var_179_5
				arg_176_1.typewritter.percent = 0

				arg_176_1.typewritter:SetDirty()
				arg_176_1:ShowNextGo(false)
				arg_176_1:RecordContent(arg_176_1.text_.text)
			end

			local var_179_9 = math.max(var_179_2, arg_176_1.talkMaxDuration)

			if var_179_1 <= arg_176_1.time_ and arg_176_1.time_ < var_179_1 + var_179_9 then
				arg_176_1.typewritter.percent = (arg_176_1.time_ - var_179_1) / var_179_9

				arg_176_1.typewritter:SetDirty()
			end

			if arg_176_1.time_ >= var_179_1 + var_179_9 and arg_176_1.time_ < var_179_1 + var_179_9 + arg_179_0 then
				arg_176_1.typewritter.percent = 1

				arg_176_1.typewritter:SetDirty()
				arg_176_1:ShowNextGo(true)
			end
		end
	end,
	Play419012044 = function(arg_180_0, arg_180_1)
		arg_180_1.time_ = 0
		arg_180_1.frameCnt_ = 0
		arg_180_1.state_ = "playing"
		arg_180_1.curTalkId_ = 419012044
		arg_180_1.duration_ = 5

		SetActive(arg_180_1.tipsGo_, false)

		function arg_180_1.onSingleLineFinish_()
			arg_180_1.onSingleLineUpdate_ = nil
			arg_180_1.onSingleLineFinish_ = nil
			arg_180_1.state_ = "waiting"
		end

		function arg_180_1.playNext_(arg_182_0)
			if arg_182_0 == 1 then
				arg_180_0:Play419012045(arg_180_1)
			end
		end

		function arg_180_1.onSingleLineUpdate_(arg_183_0)
			local var_183_0 = arg_180_1.actors_["1045ui_story"].transform
			local var_183_1 = 0

			if var_183_1 < arg_180_1.time_ and arg_180_1.time_ <= var_183_1 + arg_183_0 then
				arg_180_1.var_.moveOldPos1045ui_story = var_183_0.localPosition
			end

			local var_183_2 = 0.001

			if var_183_1 <= arg_180_1.time_ and arg_180_1.time_ < var_183_1 + var_183_2 then
				local var_183_3 = (arg_180_1.time_ - var_183_1) / var_183_2
				local var_183_4 = Vector3.New(0.7, -1, -6.05)

				var_183_0.localPosition = Vector3.Lerp(arg_180_1.var_.moveOldPos1045ui_story, var_183_4, var_183_3)

				local var_183_5 = manager.ui.mainCamera.transform.position - var_183_0.position

				var_183_0.forward = Vector3.New(var_183_5.x, var_183_5.y, var_183_5.z)

				local var_183_6 = var_183_0.localEulerAngles

				var_183_6.z = 0
				var_183_6.x = 0
				var_183_0.localEulerAngles = var_183_6
			end

			if arg_180_1.time_ >= var_183_1 + var_183_2 and arg_180_1.time_ < var_183_1 + var_183_2 + arg_183_0 then
				var_183_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_183_7 = manager.ui.mainCamera.transform.position - var_183_0.position

				var_183_0.forward = Vector3.New(var_183_7.x, var_183_7.y, var_183_7.z)

				local var_183_8 = var_183_0.localEulerAngles

				var_183_8.z = 0
				var_183_8.x = 0
				var_183_0.localEulerAngles = var_183_8
			end

			local var_183_9 = arg_180_1.actors_["1045ui_story"]
			local var_183_10 = 0

			if var_183_10 < arg_180_1.time_ and arg_180_1.time_ <= var_183_10 + arg_183_0 and not isNil(var_183_9) and arg_180_1.var_.characterEffect1045ui_story == nil then
				arg_180_1.var_.characterEffect1045ui_story = var_183_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_183_11 = 0.200000002980232

			if var_183_10 <= arg_180_1.time_ and arg_180_1.time_ < var_183_10 + var_183_11 and not isNil(var_183_9) then
				local var_183_12 = (arg_180_1.time_ - var_183_10) / var_183_11

				if arg_180_1.var_.characterEffect1045ui_story and not isNil(var_183_9) then
					arg_180_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_180_1.time_ >= var_183_10 + var_183_11 and arg_180_1.time_ < var_183_10 + var_183_11 + arg_183_0 and not isNil(var_183_9) and arg_180_1.var_.characterEffect1045ui_story then
				arg_180_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_183_13 = arg_180_1.actors_["1095ui_story"]
			local var_183_14 = 0

			if var_183_14 < arg_180_1.time_ and arg_180_1.time_ <= var_183_14 + arg_183_0 and not isNil(var_183_13) and arg_180_1.var_.characterEffect1095ui_story == nil then
				arg_180_1.var_.characterEffect1095ui_story = var_183_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_183_15 = 0.200000002980232

			if var_183_14 <= arg_180_1.time_ and arg_180_1.time_ < var_183_14 + var_183_15 and not isNil(var_183_13) then
				local var_183_16 = (arg_180_1.time_ - var_183_14) / var_183_15

				if arg_180_1.var_.characterEffect1095ui_story and not isNil(var_183_13) then
					local var_183_17 = Mathf.Lerp(0, 0.5, var_183_16)

					arg_180_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_180_1.var_.characterEffect1095ui_story.fillRatio = var_183_17
				end
			end

			if arg_180_1.time_ >= var_183_14 + var_183_15 and arg_180_1.time_ < var_183_14 + var_183_15 + arg_183_0 and not isNil(var_183_13) and arg_180_1.var_.characterEffect1095ui_story then
				local var_183_18 = 0.5

				arg_180_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_180_1.var_.characterEffect1095ui_story.fillRatio = var_183_18
			end

			local var_183_19 = 0

			if var_183_19 < arg_180_1.time_ and arg_180_1.time_ <= var_183_19 + arg_183_0 then
				arg_180_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045action/1045action3_1")
			end

			local var_183_20 = 0

			if var_183_20 < arg_180_1.time_ and arg_180_1.time_ <= var_183_20 + arg_183_0 then
				arg_180_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_shengqiA", "EmotionTimelineAnimator")
			end

			local var_183_21 = 0
			local var_183_22 = 0.625

			if var_183_21 < arg_180_1.time_ and arg_180_1.time_ <= var_183_21 + arg_183_0 then
				arg_180_1.talkMaxDuration = 0
				arg_180_1.dialogCg_.alpha = 1

				arg_180_1.dialog_:SetActive(true)
				SetActive(arg_180_1.leftNameGo_, true)

				local var_183_23 = arg_180_1:FormatText(StoryNameCfg[1202].name)

				arg_180_1.leftNameTxt_.text = var_183_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_180_1.leftNameTxt_.transform)

				arg_180_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_180_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_180_1:RecordName(arg_180_1.leftNameTxt_.text)
				SetActive(arg_180_1.iconTrs_.gameObject, false)
				arg_180_1.callingController_:SetSelectedState("normal")

				local var_183_24 = arg_180_1:GetWordFromCfg(419012044)
				local var_183_25 = arg_180_1:FormatText(var_183_24.content)

				arg_180_1.text_.text = var_183_25

				LuaForUtil.ClearLinePrefixSymbol(arg_180_1.text_)

				local var_183_26 = 26
				local var_183_27 = utf8.len(var_183_25)
				local var_183_28 = var_183_26 <= 0 and var_183_22 or var_183_22 * (var_183_27 / var_183_26)

				if var_183_28 > 0 and var_183_22 < var_183_28 then
					arg_180_1.talkMaxDuration = var_183_28

					if var_183_28 + var_183_21 > arg_180_1.duration_ then
						arg_180_1.duration_ = var_183_28 + var_183_21
					end
				end

				arg_180_1.text_.text = var_183_25
				arg_180_1.typewritter.percent = 0

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(false)
				arg_180_1:RecordContent(arg_180_1.text_.text)
			end

			local var_183_29 = math.max(var_183_22, arg_180_1.talkMaxDuration)

			if var_183_21 <= arg_180_1.time_ and arg_180_1.time_ < var_183_21 + var_183_29 then
				arg_180_1.typewritter.percent = (arg_180_1.time_ - var_183_21) / var_183_29

				arg_180_1.typewritter:SetDirty()
			end

			if arg_180_1.time_ >= var_183_21 + var_183_29 and arg_180_1.time_ < var_183_21 + var_183_29 + arg_183_0 then
				arg_180_1.typewritter.percent = 1

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(true)
			end
		end
	end,
	Play419012045 = function(arg_184_0, arg_184_1)
		arg_184_1.time_ = 0
		arg_184_1.frameCnt_ = 0
		arg_184_1.state_ = "playing"
		arg_184_1.curTalkId_ = 419012045
		arg_184_1.duration_ = 5

		SetActive(arg_184_1.tipsGo_, false)

		function arg_184_1.onSingleLineFinish_()
			arg_184_1.onSingleLineUpdate_ = nil
			arg_184_1.onSingleLineFinish_ = nil
			arg_184_1.state_ = "waiting"
		end

		function arg_184_1.playNext_(arg_186_0)
			if arg_186_0 == 1 then
				arg_184_0:Play419012046(arg_184_1)
			end
		end

		function arg_184_1.onSingleLineUpdate_(arg_187_0)
			local var_187_0 = 0
			local var_187_1 = 0.95

			if var_187_0 < arg_184_1.time_ and arg_184_1.time_ <= var_187_0 + arg_187_0 then
				arg_184_1.talkMaxDuration = 0
				arg_184_1.dialogCg_.alpha = 1

				arg_184_1.dialog_:SetActive(true)
				SetActive(arg_184_1.leftNameGo_, true)

				local var_187_2 = arg_184_1:FormatText(StoryNameCfg[1202].name)

				arg_184_1.leftNameTxt_.text = var_187_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_184_1.leftNameTxt_.transform)

				arg_184_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_184_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_184_1:RecordName(arg_184_1.leftNameTxt_.text)
				SetActive(arg_184_1.iconTrs_.gameObject, false)
				arg_184_1.callingController_:SetSelectedState("normal")

				local var_187_3 = arg_184_1:GetWordFromCfg(419012045)
				local var_187_4 = arg_184_1:FormatText(var_187_3.content)

				arg_184_1.text_.text = var_187_4

				LuaForUtil.ClearLinePrefixSymbol(arg_184_1.text_)

				local var_187_5 = 38
				local var_187_6 = utf8.len(var_187_4)
				local var_187_7 = var_187_5 <= 0 and var_187_1 or var_187_1 * (var_187_6 / var_187_5)

				if var_187_7 > 0 and var_187_1 < var_187_7 then
					arg_184_1.talkMaxDuration = var_187_7

					if var_187_7 + var_187_0 > arg_184_1.duration_ then
						arg_184_1.duration_ = var_187_7 + var_187_0
					end
				end

				arg_184_1.text_.text = var_187_4
				arg_184_1.typewritter.percent = 0

				arg_184_1.typewritter:SetDirty()
				arg_184_1:ShowNextGo(false)
				arg_184_1:RecordContent(arg_184_1.text_.text)
			end

			local var_187_8 = math.max(var_187_1, arg_184_1.talkMaxDuration)

			if var_187_0 <= arg_184_1.time_ and arg_184_1.time_ < var_187_0 + var_187_8 then
				arg_184_1.typewritter.percent = (arg_184_1.time_ - var_187_0) / var_187_8

				arg_184_1.typewritter:SetDirty()
			end

			if arg_184_1.time_ >= var_187_0 + var_187_8 and arg_184_1.time_ < var_187_0 + var_187_8 + arg_187_0 then
				arg_184_1.typewritter.percent = 1

				arg_184_1.typewritter:SetDirty()
				arg_184_1:ShowNextGo(true)
			end
		end
	end,
	Play419012046 = function(arg_188_0, arg_188_1)
		arg_188_1.time_ = 0
		arg_188_1.frameCnt_ = 0
		arg_188_1.state_ = "playing"
		arg_188_1.curTalkId_ = 419012046
		arg_188_1.duration_ = 5

		SetActive(arg_188_1.tipsGo_, false)

		function arg_188_1.onSingleLineFinish_()
			arg_188_1.onSingleLineUpdate_ = nil
			arg_188_1.onSingleLineFinish_ = nil
			arg_188_1.state_ = "waiting"
		end

		function arg_188_1.playNext_(arg_190_0)
			if arg_190_0 == 1 then
				arg_188_0:Play419012047(arg_188_1)
			end
		end

		function arg_188_1.onSingleLineUpdate_(arg_191_0)
			local var_191_0 = arg_188_1.actors_["1095ui_story"]
			local var_191_1 = 0

			if var_191_1 < arg_188_1.time_ and arg_188_1.time_ <= var_191_1 + arg_191_0 and not isNil(var_191_0) and arg_188_1.var_.characterEffect1095ui_story == nil then
				arg_188_1.var_.characterEffect1095ui_story = var_191_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_191_2 = 0.200000002980232

			if var_191_1 <= arg_188_1.time_ and arg_188_1.time_ < var_191_1 + var_191_2 and not isNil(var_191_0) then
				local var_191_3 = (arg_188_1.time_ - var_191_1) / var_191_2

				if arg_188_1.var_.characterEffect1095ui_story and not isNil(var_191_0) then
					arg_188_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_188_1.time_ >= var_191_1 + var_191_2 and arg_188_1.time_ < var_191_1 + var_191_2 + arg_191_0 and not isNil(var_191_0) and arg_188_1.var_.characterEffect1095ui_story then
				arg_188_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_191_4 = arg_188_1.actors_["1045ui_story"]
			local var_191_5 = 0

			if var_191_5 < arg_188_1.time_ and arg_188_1.time_ <= var_191_5 + arg_191_0 and not isNil(var_191_4) and arg_188_1.var_.characterEffect1045ui_story == nil then
				arg_188_1.var_.characterEffect1045ui_story = var_191_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_191_6 = 0.200000002980232

			if var_191_5 <= arg_188_1.time_ and arg_188_1.time_ < var_191_5 + var_191_6 and not isNil(var_191_4) then
				local var_191_7 = (arg_188_1.time_ - var_191_5) / var_191_6

				if arg_188_1.var_.characterEffect1045ui_story and not isNil(var_191_4) then
					local var_191_8 = Mathf.Lerp(0, 0.5, var_191_7)

					arg_188_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_188_1.var_.characterEffect1045ui_story.fillRatio = var_191_8
				end
			end

			if arg_188_1.time_ >= var_191_5 + var_191_6 and arg_188_1.time_ < var_191_5 + var_191_6 + arg_191_0 and not isNil(var_191_4) and arg_188_1.var_.characterEffect1045ui_story then
				local var_191_9 = 0.5

				arg_188_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_188_1.var_.characterEffect1045ui_story.fillRatio = var_191_9
			end

			local var_191_10 = 0
			local var_191_11 = 0.375

			if var_191_10 < arg_188_1.time_ and arg_188_1.time_ <= var_191_10 + arg_191_0 then
				arg_188_1.talkMaxDuration = 0
				arg_188_1.dialogCg_.alpha = 1

				arg_188_1.dialog_:SetActive(true)
				SetActive(arg_188_1.leftNameGo_, true)

				local var_191_12 = arg_188_1:FormatText(StoryNameCfg[471].name)

				arg_188_1.leftNameTxt_.text = var_191_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_188_1.leftNameTxt_.transform)

				arg_188_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_188_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_188_1:RecordName(arg_188_1.leftNameTxt_.text)
				SetActive(arg_188_1.iconTrs_.gameObject, false)
				arg_188_1.callingController_:SetSelectedState("normal")

				local var_191_13 = arg_188_1:GetWordFromCfg(419012046)
				local var_191_14 = arg_188_1:FormatText(var_191_13.content)

				arg_188_1.text_.text = var_191_14

				LuaForUtil.ClearLinePrefixSymbol(arg_188_1.text_)

				local var_191_15 = 15
				local var_191_16 = utf8.len(var_191_14)
				local var_191_17 = var_191_15 <= 0 and var_191_11 or var_191_11 * (var_191_16 / var_191_15)

				if var_191_17 > 0 and var_191_11 < var_191_17 then
					arg_188_1.talkMaxDuration = var_191_17

					if var_191_17 + var_191_10 > arg_188_1.duration_ then
						arg_188_1.duration_ = var_191_17 + var_191_10
					end
				end

				arg_188_1.text_.text = var_191_14
				arg_188_1.typewritter.percent = 0

				arg_188_1.typewritter:SetDirty()
				arg_188_1:ShowNextGo(false)
				arg_188_1:RecordContent(arg_188_1.text_.text)
			end

			local var_191_18 = math.max(var_191_11, arg_188_1.talkMaxDuration)

			if var_191_10 <= arg_188_1.time_ and arg_188_1.time_ < var_191_10 + var_191_18 then
				arg_188_1.typewritter.percent = (arg_188_1.time_ - var_191_10) / var_191_18

				arg_188_1.typewritter:SetDirty()
			end

			if arg_188_1.time_ >= var_191_10 + var_191_18 and arg_188_1.time_ < var_191_10 + var_191_18 + arg_191_0 then
				arg_188_1.typewritter.percent = 1

				arg_188_1.typewritter:SetDirty()
				arg_188_1:ShowNextGo(true)
			end
		end
	end,
	Play419012047 = function(arg_192_0, arg_192_1)
		arg_192_1.time_ = 0
		arg_192_1.frameCnt_ = 0
		arg_192_1.state_ = "playing"
		arg_192_1.curTalkId_ = 419012047
		arg_192_1.duration_ = 5

		SetActive(arg_192_1.tipsGo_, false)

		function arg_192_1.onSingleLineFinish_()
			arg_192_1.onSingleLineUpdate_ = nil
			arg_192_1.onSingleLineFinish_ = nil
			arg_192_1.state_ = "waiting"
		end

		function arg_192_1.playNext_(arg_194_0)
			if arg_194_0 == 1 then
				arg_192_0:Play419012048(arg_192_1)
			end
		end

		function arg_192_1.onSingleLineUpdate_(arg_195_0)
			local var_195_0 = arg_192_1.actors_["1095ui_story"]
			local var_195_1 = 0

			if var_195_1 < arg_192_1.time_ and arg_192_1.time_ <= var_195_1 + arg_195_0 and not isNil(var_195_0) and arg_192_1.var_.characterEffect1095ui_story == nil then
				arg_192_1.var_.characterEffect1095ui_story = var_195_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_195_2 = 0.200000002980232

			if var_195_1 <= arg_192_1.time_ and arg_192_1.time_ < var_195_1 + var_195_2 and not isNil(var_195_0) then
				local var_195_3 = (arg_192_1.time_ - var_195_1) / var_195_2

				if arg_192_1.var_.characterEffect1095ui_story and not isNil(var_195_0) then
					local var_195_4 = Mathf.Lerp(0, 0.5, var_195_3)

					arg_192_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_192_1.var_.characterEffect1095ui_story.fillRatio = var_195_4
				end
			end

			if arg_192_1.time_ >= var_195_1 + var_195_2 and arg_192_1.time_ < var_195_1 + var_195_2 + arg_195_0 and not isNil(var_195_0) and arg_192_1.var_.characterEffect1095ui_story then
				local var_195_5 = 0.5

				arg_192_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_192_1.var_.characterEffect1095ui_story.fillRatio = var_195_5
			end

			local var_195_6 = 0
			local var_195_7 = 1.375

			if var_195_6 < arg_192_1.time_ and arg_192_1.time_ <= var_195_6 + arg_195_0 then
				arg_192_1.talkMaxDuration = 0
				arg_192_1.dialogCg_.alpha = 1

				arg_192_1.dialog_:SetActive(true)
				SetActive(arg_192_1.leftNameGo_, false)

				arg_192_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_192_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_192_1:RecordName(arg_192_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_192_1.iconTrs_.gameObject, false)
				arg_192_1.callingController_:SetSelectedState("normal")

				local var_195_8 = arg_192_1:GetWordFromCfg(419012047)
				local var_195_9 = arg_192_1:FormatText(var_195_8.content)

				arg_192_1.text_.text = var_195_9

				LuaForUtil.ClearLinePrefixSymbol(arg_192_1.text_)

				local var_195_10 = 55
				local var_195_11 = utf8.len(var_195_9)
				local var_195_12 = var_195_10 <= 0 and var_195_7 or var_195_7 * (var_195_11 / var_195_10)

				if var_195_12 > 0 and var_195_7 < var_195_12 then
					arg_192_1.talkMaxDuration = var_195_12

					if var_195_12 + var_195_6 > arg_192_1.duration_ then
						arg_192_1.duration_ = var_195_12 + var_195_6
					end
				end

				arg_192_1.text_.text = var_195_9
				arg_192_1.typewritter.percent = 0

				arg_192_1.typewritter:SetDirty()
				arg_192_1:ShowNextGo(false)
				arg_192_1:RecordContent(arg_192_1.text_.text)
			end

			local var_195_13 = math.max(var_195_7, arg_192_1.talkMaxDuration)

			if var_195_6 <= arg_192_1.time_ and arg_192_1.time_ < var_195_6 + var_195_13 then
				arg_192_1.typewritter.percent = (arg_192_1.time_ - var_195_6) / var_195_13

				arg_192_1.typewritter:SetDirty()
			end

			if arg_192_1.time_ >= var_195_6 + var_195_13 and arg_192_1.time_ < var_195_6 + var_195_13 + arg_195_0 then
				arg_192_1.typewritter.percent = 1

				arg_192_1.typewritter:SetDirty()
				arg_192_1:ShowNextGo(true)
			end
		end
	end,
	Play419012048 = function(arg_196_0, arg_196_1)
		arg_196_1.time_ = 0
		arg_196_1.frameCnt_ = 0
		arg_196_1.state_ = "playing"
		arg_196_1.curTalkId_ = 419012048
		arg_196_1.duration_ = 5

		SetActive(arg_196_1.tipsGo_, false)

		function arg_196_1.onSingleLineFinish_()
			arg_196_1.onSingleLineUpdate_ = nil
			arg_196_1.onSingleLineFinish_ = nil
			arg_196_1.state_ = "waiting"
		end

		function arg_196_1.playNext_(arg_198_0)
			if arg_198_0 == 1 then
				arg_196_0:Play419012049(arg_196_1)
			end
		end

		function arg_196_1.onSingleLineUpdate_(arg_199_0)
			local var_199_0 = arg_196_1.actors_["1095ui_story"].transform
			local var_199_1 = 0

			if var_199_1 < arg_196_1.time_ and arg_196_1.time_ <= var_199_1 + arg_199_0 then
				arg_196_1.var_.moveOldPos1095ui_story = var_199_0.localPosition
			end

			local var_199_2 = 0.001

			if var_199_1 <= arg_196_1.time_ and arg_196_1.time_ < var_199_1 + var_199_2 then
				local var_199_3 = (arg_196_1.time_ - var_199_1) / var_199_2
				local var_199_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_199_0.localPosition = Vector3.Lerp(arg_196_1.var_.moveOldPos1095ui_story, var_199_4, var_199_3)

				local var_199_5 = manager.ui.mainCamera.transform.position - var_199_0.position

				var_199_0.forward = Vector3.New(var_199_5.x, var_199_5.y, var_199_5.z)

				local var_199_6 = var_199_0.localEulerAngles

				var_199_6.z = 0
				var_199_6.x = 0
				var_199_0.localEulerAngles = var_199_6
			end

			if arg_196_1.time_ >= var_199_1 + var_199_2 and arg_196_1.time_ < var_199_1 + var_199_2 + arg_199_0 then
				var_199_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_199_7 = manager.ui.mainCamera.transform.position - var_199_0.position

				var_199_0.forward = Vector3.New(var_199_7.x, var_199_7.y, var_199_7.z)

				local var_199_8 = var_199_0.localEulerAngles

				var_199_8.z = 0
				var_199_8.x = 0
				var_199_0.localEulerAngles = var_199_8
			end

			local var_199_9 = arg_196_1.actors_["1095ui_story"]
			local var_199_10 = 0

			if var_199_10 < arg_196_1.time_ and arg_196_1.time_ <= var_199_10 + arg_199_0 and not isNil(var_199_9) and arg_196_1.var_.characterEffect1095ui_story == nil then
				arg_196_1.var_.characterEffect1095ui_story = var_199_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_199_11 = 0.200000002980232

			if var_199_10 <= arg_196_1.time_ and arg_196_1.time_ < var_199_10 + var_199_11 and not isNil(var_199_9) then
				local var_199_12 = (arg_196_1.time_ - var_199_10) / var_199_11

				if arg_196_1.var_.characterEffect1095ui_story and not isNil(var_199_9) then
					arg_196_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_196_1.time_ >= var_199_10 + var_199_11 and arg_196_1.time_ < var_199_10 + var_199_11 + arg_199_0 and not isNil(var_199_9) and arg_196_1.var_.characterEffect1095ui_story then
				arg_196_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_199_13 = 0

			if var_199_13 < arg_196_1.time_ and arg_196_1.time_ <= var_199_13 + arg_199_0 then
				arg_196_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_199_14 = 0

			if var_199_14 < arg_196_1.time_ and arg_196_1.time_ <= var_199_14 + arg_199_0 then
				arg_196_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/expr_wubiaoqing", "EmotionTimelineAnimator")
			end

			local var_199_15 = 0
			local var_199_16 = 0.9

			if var_199_15 < arg_196_1.time_ and arg_196_1.time_ <= var_199_15 + arg_199_0 then
				arg_196_1.talkMaxDuration = 0
				arg_196_1.dialogCg_.alpha = 1

				arg_196_1.dialog_:SetActive(true)
				SetActive(arg_196_1.leftNameGo_, true)

				local var_199_17 = arg_196_1:FormatText(StoryNameCfg[471].name)

				arg_196_1.leftNameTxt_.text = var_199_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_196_1.leftNameTxt_.transform)

				arg_196_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_196_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_196_1:RecordName(arg_196_1.leftNameTxt_.text)
				SetActive(arg_196_1.iconTrs_.gameObject, false)
				arg_196_1.callingController_:SetSelectedState("normal")

				local var_199_18 = arg_196_1:GetWordFromCfg(419012048)
				local var_199_19 = arg_196_1:FormatText(var_199_18.content)

				arg_196_1.text_.text = var_199_19

				LuaForUtil.ClearLinePrefixSymbol(arg_196_1.text_)

				local var_199_20 = 36
				local var_199_21 = utf8.len(var_199_19)
				local var_199_22 = var_199_20 <= 0 and var_199_16 or var_199_16 * (var_199_21 / var_199_20)

				if var_199_22 > 0 and var_199_16 < var_199_22 then
					arg_196_1.talkMaxDuration = var_199_22

					if var_199_22 + var_199_15 > arg_196_1.duration_ then
						arg_196_1.duration_ = var_199_22 + var_199_15
					end
				end

				arg_196_1.text_.text = var_199_19
				arg_196_1.typewritter.percent = 0

				arg_196_1.typewritter:SetDirty()
				arg_196_1:ShowNextGo(false)
				arg_196_1:RecordContent(arg_196_1.text_.text)
			end

			local var_199_23 = math.max(var_199_16, arg_196_1.talkMaxDuration)

			if var_199_15 <= arg_196_1.time_ and arg_196_1.time_ < var_199_15 + var_199_23 then
				arg_196_1.typewritter.percent = (arg_196_1.time_ - var_199_15) / var_199_23

				arg_196_1.typewritter:SetDirty()
			end

			if arg_196_1.time_ >= var_199_15 + var_199_23 and arg_196_1.time_ < var_199_15 + var_199_23 + arg_199_0 then
				arg_196_1.typewritter.percent = 1

				arg_196_1.typewritter:SetDirty()
				arg_196_1:ShowNextGo(true)
			end
		end
	end,
	Play419012049 = function(arg_200_0, arg_200_1)
		arg_200_1.time_ = 0
		arg_200_1.frameCnt_ = 0
		arg_200_1.state_ = "playing"
		arg_200_1.curTalkId_ = 419012049
		arg_200_1.duration_ = 5

		SetActive(arg_200_1.tipsGo_, false)

		function arg_200_1.onSingleLineFinish_()
			arg_200_1.onSingleLineUpdate_ = nil
			arg_200_1.onSingleLineFinish_ = nil
			arg_200_1.state_ = "waiting"
		end

		function arg_200_1.playNext_(arg_202_0)
			if arg_202_0 == 1 then
				arg_200_0:Play419012050(arg_200_1)
			end
		end

		function arg_200_1.onSingleLineUpdate_(arg_203_0)
			local var_203_0 = arg_200_1.actors_["1045ui_story"].transform
			local var_203_1 = 0

			if var_203_1 < arg_200_1.time_ and arg_200_1.time_ <= var_203_1 + arg_203_0 then
				arg_200_1.var_.moveOldPos1045ui_story = var_203_0.localPosition
			end

			local var_203_2 = 0.001

			if var_203_1 <= arg_200_1.time_ and arg_200_1.time_ < var_203_1 + var_203_2 then
				local var_203_3 = (arg_200_1.time_ - var_203_1) / var_203_2
				local var_203_4 = Vector3.New(0.7, -1, -6.05)

				var_203_0.localPosition = Vector3.Lerp(arg_200_1.var_.moveOldPos1045ui_story, var_203_4, var_203_3)

				local var_203_5 = manager.ui.mainCamera.transform.position - var_203_0.position

				var_203_0.forward = Vector3.New(var_203_5.x, var_203_5.y, var_203_5.z)

				local var_203_6 = var_203_0.localEulerAngles

				var_203_6.z = 0
				var_203_6.x = 0
				var_203_0.localEulerAngles = var_203_6
			end

			if arg_200_1.time_ >= var_203_1 + var_203_2 and arg_200_1.time_ < var_203_1 + var_203_2 + arg_203_0 then
				var_203_0.localPosition = Vector3.New(0.7, -1, -6.05)

				local var_203_7 = manager.ui.mainCamera.transform.position - var_203_0.position

				var_203_0.forward = Vector3.New(var_203_7.x, var_203_7.y, var_203_7.z)

				local var_203_8 = var_203_0.localEulerAngles

				var_203_8.z = 0
				var_203_8.x = 0
				var_203_0.localEulerAngles = var_203_8
			end

			local var_203_9 = arg_200_1.actors_["1045ui_story"]
			local var_203_10 = 0

			if var_203_10 < arg_200_1.time_ and arg_200_1.time_ <= var_203_10 + arg_203_0 and not isNil(var_203_9) and arg_200_1.var_.characterEffect1045ui_story == nil then
				arg_200_1.var_.characterEffect1045ui_story = var_203_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_203_11 = 0.200000002980232

			if var_203_10 <= arg_200_1.time_ and arg_200_1.time_ < var_203_10 + var_203_11 and not isNil(var_203_9) then
				local var_203_12 = (arg_200_1.time_ - var_203_10) / var_203_11

				if arg_200_1.var_.characterEffect1045ui_story and not isNil(var_203_9) then
					arg_200_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_200_1.time_ >= var_203_10 + var_203_11 and arg_200_1.time_ < var_203_10 + var_203_11 + arg_203_0 and not isNil(var_203_9) and arg_200_1.var_.characterEffect1045ui_story then
				arg_200_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_203_13 = arg_200_1.actors_["1095ui_story"]
			local var_203_14 = 0

			if var_203_14 < arg_200_1.time_ and arg_200_1.time_ <= var_203_14 + arg_203_0 and not isNil(var_203_13) and arg_200_1.var_.characterEffect1095ui_story == nil then
				arg_200_1.var_.characterEffect1095ui_story = var_203_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_203_15 = 0.200000002980232

			if var_203_14 <= arg_200_1.time_ and arg_200_1.time_ < var_203_14 + var_203_15 and not isNil(var_203_13) then
				local var_203_16 = (arg_200_1.time_ - var_203_14) / var_203_15

				if arg_200_1.var_.characterEffect1095ui_story and not isNil(var_203_13) then
					local var_203_17 = Mathf.Lerp(0, 0.5, var_203_16)

					arg_200_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_200_1.var_.characterEffect1095ui_story.fillRatio = var_203_17
				end
			end

			if arg_200_1.time_ >= var_203_14 + var_203_15 and arg_200_1.time_ < var_203_14 + var_203_15 + arg_203_0 and not isNil(var_203_13) and arg_200_1.var_.characterEffect1095ui_story then
				local var_203_18 = 0.5

				arg_200_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_200_1.var_.characterEffect1095ui_story.fillRatio = var_203_18
			end

			local var_203_19 = 0

			if var_203_19 < arg_200_1.time_ and arg_200_1.time_ <= var_203_19 + arg_203_0 then
				arg_200_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/story1045/story1045actionlink/1045action434")
			end

			local var_203_20 = 0

			if var_203_20 < arg_200_1.time_ and arg_200_1.time_ <= var_203_20 + arg_203_0 then
				arg_200_1:PlayTimeline("1045ui_story", "StoryTimeline/CharAction/public_expression/expr_renzhen", "EmotionTimelineAnimator")
			end

			local var_203_21 = 0
			local var_203_22 = 0.65

			if var_203_21 < arg_200_1.time_ and arg_200_1.time_ <= var_203_21 + arg_203_0 then
				arg_200_1.talkMaxDuration = 0
				arg_200_1.dialogCg_.alpha = 1

				arg_200_1.dialog_:SetActive(true)
				SetActive(arg_200_1.leftNameGo_, true)

				local var_203_23 = arg_200_1:FormatText(StoryNameCfg[1202].name)

				arg_200_1.leftNameTxt_.text = var_203_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_200_1.leftNameTxt_.transform)

				arg_200_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_200_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_200_1:RecordName(arg_200_1.leftNameTxt_.text)
				SetActive(arg_200_1.iconTrs_.gameObject, false)
				arg_200_1.callingController_:SetSelectedState("normal")

				local var_203_24 = arg_200_1:GetWordFromCfg(419012049)
				local var_203_25 = arg_200_1:FormatText(var_203_24.content)

				arg_200_1.text_.text = var_203_25

				LuaForUtil.ClearLinePrefixSymbol(arg_200_1.text_)

				local var_203_26 = 26
				local var_203_27 = utf8.len(var_203_25)
				local var_203_28 = var_203_26 <= 0 and var_203_22 or var_203_22 * (var_203_27 / var_203_26)

				if var_203_28 > 0 and var_203_22 < var_203_28 then
					arg_200_1.talkMaxDuration = var_203_28

					if var_203_28 + var_203_21 > arg_200_1.duration_ then
						arg_200_1.duration_ = var_203_28 + var_203_21
					end
				end

				arg_200_1.text_.text = var_203_25
				arg_200_1.typewritter.percent = 0

				arg_200_1.typewritter:SetDirty()
				arg_200_1:ShowNextGo(false)
				arg_200_1:RecordContent(arg_200_1.text_.text)
			end

			local var_203_29 = math.max(var_203_22, arg_200_1.talkMaxDuration)

			if var_203_21 <= arg_200_1.time_ and arg_200_1.time_ < var_203_21 + var_203_29 then
				arg_200_1.typewritter.percent = (arg_200_1.time_ - var_203_21) / var_203_29

				arg_200_1.typewritter:SetDirty()
			end

			if arg_200_1.time_ >= var_203_21 + var_203_29 and arg_200_1.time_ < var_203_21 + var_203_29 + arg_203_0 then
				arg_200_1.typewritter.percent = 1

				arg_200_1.typewritter:SetDirty()
				arg_200_1:ShowNextGo(true)
			end
		end
	end,
	Play419012050 = function(arg_204_0, arg_204_1)
		arg_204_1.time_ = 0
		arg_204_1.frameCnt_ = 0
		arg_204_1.state_ = "playing"
		arg_204_1.curTalkId_ = 419012050
		arg_204_1.duration_ = 5

		SetActive(arg_204_1.tipsGo_, false)

		function arg_204_1.onSingleLineFinish_()
			arg_204_1.onSingleLineUpdate_ = nil
			arg_204_1.onSingleLineFinish_ = nil
			arg_204_1.state_ = "waiting"
		end

		function arg_204_1.playNext_(arg_206_0)
			if arg_206_0 == 1 then
				arg_204_0:Play419012051(arg_204_1)
			end
		end

		function arg_204_1.onSingleLineUpdate_(arg_207_0)
			local var_207_0 = arg_204_1.actors_["1095ui_story"].transform
			local var_207_1 = 0

			if var_207_1 < arg_204_1.time_ and arg_204_1.time_ <= var_207_1 + arg_207_0 then
				arg_204_1.var_.moveOldPos1095ui_story = var_207_0.localPosition
			end

			local var_207_2 = 0.001

			if var_207_1 <= arg_204_1.time_ and arg_204_1.time_ < var_207_1 + var_207_2 then
				local var_207_3 = (arg_204_1.time_ - var_207_1) / var_207_2
				local var_207_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_207_0.localPosition = Vector3.Lerp(arg_204_1.var_.moveOldPos1095ui_story, var_207_4, var_207_3)

				local var_207_5 = manager.ui.mainCamera.transform.position - var_207_0.position

				var_207_0.forward = Vector3.New(var_207_5.x, var_207_5.y, var_207_5.z)

				local var_207_6 = var_207_0.localEulerAngles

				var_207_6.z = 0
				var_207_6.x = 0
				var_207_0.localEulerAngles = var_207_6
			end

			if arg_204_1.time_ >= var_207_1 + var_207_2 and arg_204_1.time_ < var_207_1 + var_207_2 + arg_207_0 then
				var_207_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_207_7 = manager.ui.mainCamera.transform.position - var_207_0.position

				var_207_0.forward = Vector3.New(var_207_7.x, var_207_7.y, var_207_7.z)

				local var_207_8 = var_207_0.localEulerAngles

				var_207_8.z = 0
				var_207_8.x = 0
				var_207_0.localEulerAngles = var_207_8
			end

			local var_207_9 = arg_204_1.actors_["1095ui_story"]
			local var_207_10 = 0

			if var_207_10 < arg_204_1.time_ and arg_204_1.time_ <= var_207_10 + arg_207_0 and not isNil(var_207_9) and arg_204_1.var_.characterEffect1095ui_story == nil then
				arg_204_1.var_.characterEffect1095ui_story = var_207_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_207_11 = 0.200000002980232

			if var_207_10 <= arg_204_1.time_ and arg_204_1.time_ < var_207_10 + var_207_11 and not isNil(var_207_9) then
				local var_207_12 = (arg_204_1.time_ - var_207_10) / var_207_11

				if arg_204_1.var_.characterEffect1095ui_story and not isNil(var_207_9) then
					arg_204_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_204_1.time_ >= var_207_10 + var_207_11 and arg_204_1.time_ < var_207_10 + var_207_11 + arg_207_0 and not isNil(var_207_9) and arg_204_1.var_.characterEffect1095ui_story then
				arg_204_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_207_13 = arg_204_1.actors_["1045ui_story"]
			local var_207_14 = 0

			if var_207_14 < arg_204_1.time_ and arg_204_1.time_ <= var_207_14 + arg_207_0 and not isNil(var_207_13) and arg_204_1.var_.characterEffect1045ui_story == nil then
				arg_204_1.var_.characterEffect1045ui_story = var_207_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_207_15 = 0.200000002980232

			if var_207_14 <= arg_204_1.time_ and arg_204_1.time_ < var_207_14 + var_207_15 and not isNil(var_207_13) then
				local var_207_16 = (arg_204_1.time_ - var_207_14) / var_207_15

				if arg_204_1.var_.characterEffect1045ui_story and not isNil(var_207_13) then
					local var_207_17 = Mathf.Lerp(0, 0.5, var_207_16)

					arg_204_1.var_.characterEffect1045ui_story.fillFlat = true
					arg_204_1.var_.characterEffect1045ui_story.fillRatio = var_207_17
				end
			end

			if arg_204_1.time_ >= var_207_14 + var_207_15 and arg_204_1.time_ < var_207_14 + var_207_15 + arg_207_0 and not isNil(var_207_13) and arg_204_1.var_.characterEffect1045ui_story then
				local var_207_18 = 0.5

				arg_204_1.var_.characterEffect1045ui_story.fillFlat = true
				arg_204_1.var_.characterEffect1045ui_story.fillRatio = var_207_18
			end

			local var_207_19 = 0

			if var_207_19 < arg_204_1.time_ and arg_204_1.time_ <= var_207_19 + arg_207_0 then
				arg_204_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_207_20 = 0
			local var_207_21 = 0.125

			if var_207_20 < arg_204_1.time_ and arg_204_1.time_ <= var_207_20 + arg_207_0 then
				arg_204_1.talkMaxDuration = 0
				arg_204_1.dialogCg_.alpha = 1

				arg_204_1.dialog_:SetActive(true)
				SetActive(arg_204_1.leftNameGo_, true)

				local var_207_22 = arg_204_1:FormatText(StoryNameCfg[471].name)

				arg_204_1.leftNameTxt_.text = var_207_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_204_1.leftNameTxt_.transform)

				arg_204_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_204_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_204_1:RecordName(arg_204_1.leftNameTxt_.text)
				SetActive(arg_204_1.iconTrs_.gameObject, false)
				arg_204_1.callingController_:SetSelectedState("normal")

				local var_207_23 = arg_204_1:GetWordFromCfg(419012050)
				local var_207_24 = arg_204_1:FormatText(var_207_23.content)

				arg_204_1.text_.text = var_207_24

				LuaForUtil.ClearLinePrefixSymbol(arg_204_1.text_)

				local var_207_25 = 5
				local var_207_26 = utf8.len(var_207_24)
				local var_207_27 = var_207_25 <= 0 and var_207_21 or var_207_21 * (var_207_26 / var_207_25)

				if var_207_27 > 0 and var_207_21 < var_207_27 then
					arg_204_1.talkMaxDuration = var_207_27

					if var_207_27 + var_207_20 > arg_204_1.duration_ then
						arg_204_1.duration_ = var_207_27 + var_207_20
					end
				end

				arg_204_1.text_.text = var_207_24
				arg_204_1.typewritter.percent = 0

				arg_204_1.typewritter:SetDirty()
				arg_204_1:ShowNextGo(false)
				arg_204_1:RecordContent(arg_204_1.text_.text)
			end

			local var_207_28 = math.max(var_207_21, arg_204_1.talkMaxDuration)

			if var_207_20 <= arg_204_1.time_ and arg_204_1.time_ < var_207_20 + var_207_28 then
				arg_204_1.typewritter.percent = (arg_204_1.time_ - var_207_20) / var_207_28

				arg_204_1.typewritter:SetDirty()
			end

			if arg_204_1.time_ >= var_207_20 + var_207_28 and arg_204_1.time_ < var_207_20 + var_207_28 + arg_207_0 then
				arg_204_1.typewritter.percent = 1

				arg_204_1.typewritter:SetDirty()
				arg_204_1:ShowNextGo(true)
			end
		end
	end,
	Play419012051 = function(arg_208_0, arg_208_1)
		arg_208_1.time_ = 0
		arg_208_1.frameCnt_ = 0
		arg_208_1.state_ = "playing"
		arg_208_1.curTalkId_ = 419012051
		arg_208_1.duration_ = 5

		SetActive(arg_208_1.tipsGo_, false)

		function arg_208_1.onSingleLineFinish_()
			arg_208_1.onSingleLineUpdate_ = nil
			arg_208_1.onSingleLineFinish_ = nil
			arg_208_1.state_ = "waiting"
			arg_208_1.auto_ = false
		end

		function arg_208_1.playNext_(arg_210_0)
			arg_208_1.onStoryFinished_()
		end

		function arg_208_1.onSingleLineUpdate_(arg_211_0)
			local var_211_0 = arg_208_1.actors_["1045ui_story"]
			local var_211_1 = 0

			if var_211_1 < arg_208_1.time_ and arg_208_1.time_ <= var_211_1 + arg_211_0 and not isNil(var_211_0) and arg_208_1.var_.characterEffect1045ui_story == nil then
				arg_208_1.var_.characterEffect1045ui_story = var_211_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_211_2 = 0.200000002980232

			if var_211_1 <= arg_208_1.time_ and arg_208_1.time_ < var_211_1 + var_211_2 and not isNil(var_211_0) then
				local var_211_3 = (arg_208_1.time_ - var_211_1) / var_211_2

				if arg_208_1.var_.characterEffect1045ui_story and not isNil(var_211_0) then
					arg_208_1.var_.characterEffect1045ui_story.fillFlat = false
				end
			end

			if arg_208_1.time_ >= var_211_1 + var_211_2 and arg_208_1.time_ < var_211_1 + var_211_2 + arg_211_0 and not isNil(var_211_0) and arg_208_1.var_.characterEffect1045ui_story then
				arg_208_1.var_.characterEffect1045ui_story.fillFlat = false
			end

			local var_211_4 = arg_208_1.actors_["1095ui_story"]
			local var_211_5 = 0

			if var_211_5 < arg_208_1.time_ and arg_208_1.time_ <= var_211_5 + arg_211_0 and not isNil(var_211_4) and arg_208_1.var_.characterEffect1095ui_story == nil then
				arg_208_1.var_.characterEffect1095ui_story = var_211_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_211_6 = 0.200000002980232

			if var_211_5 <= arg_208_1.time_ and arg_208_1.time_ < var_211_5 + var_211_6 and not isNil(var_211_4) then
				local var_211_7 = (arg_208_1.time_ - var_211_5) / var_211_6

				if arg_208_1.var_.characterEffect1095ui_story and not isNil(var_211_4) then
					local var_211_8 = Mathf.Lerp(0, 0.5, var_211_7)

					arg_208_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_208_1.var_.characterEffect1095ui_story.fillRatio = var_211_8
				end
			end

			if arg_208_1.time_ >= var_211_5 + var_211_6 and arg_208_1.time_ < var_211_5 + var_211_6 + arg_211_0 and not isNil(var_211_4) and arg_208_1.var_.characterEffect1095ui_story then
				local var_211_9 = 0.5

				arg_208_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_208_1.var_.characterEffect1095ui_story.fillRatio = var_211_9
			end

			local var_211_10 = 0
			local var_211_11 = 0.475

			if var_211_10 < arg_208_1.time_ and arg_208_1.time_ <= var_211_10 + arg_211_0 then
				arg_208_1.talkMaxDuration = 0
				arg_208_1.dialogCg_.alpha = 1

				arg_208_1.dialog_:SetActive(true)
				SetActive(arg_208_1.leftNameGo_, true)

				local var_211_12 = arg_208_1:FormatText(StoryNameCfg[1202].name)

				arg_208_1.leftNameTxt_.text = var_211_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_208_1.leftNameTxt_.transform)

				arg_208_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_208_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_208_1:RecordName(arg_208_1.leftNameTxt_.text)
				SetActive(arg_208_1.iconTrs_.gameObject, false)
				arg_208_1.callingController_:SetSelectedState("normal")

				local var_211_13 = arg_208_1:GetWordFromCfg(419012051)
				local var_211_14 = arg_208_1:FormatText(var_211_13.content)

				arg_208_1.text_.text = var_211_14

				LuaForUtil.ClearLinePrefixSymbol(arg_208_1.text_)

				local var_211_15 = 19
				local var_211_16 = utf8.len(var_211_14)
				local var_211_17 = var_211_15 <= 0 and var_211_11 or var_211_11 * (var_211_16 / var_211_15)

				if var_211_17 > 0 and var_211_11 < var_211_17 then
					arg_208_1.talkMaxDuration = var_211_17

					if var_211_17 + var_211_10 > arg_208_1.duration_ then
						arg_208_1.duration_ = var_211_17 + var_211_10
					end
				end

				arg_208_1.text_.text = var_211_14
				arg_208_1.typewritter.percent = 0

				arg_208_1.typewritter:SetDirty()
				arg_208_1:ShowNextGo(false)
				arg_208_1:RecordContent(arg_208_1.text_.text)
			end

			local var_211_18 = math.max(var_211_11, arg_208_1.talkMaxDuration)

			if var_211_10 <= arg_208_1.time_ and arg_208_1.time_ < var_211_10 + var_211_18 then
				arg_208_1.typewritter.percent = (arg_208_1.time_ - var_211_10) / var_211_18

				arg_208_1.typewritter:SetDirty()
			end

			if arg_208_1.time_ >= var_211_10 + var_211_18 and arg_208_1.time_ < var_211_10 + var_211_18 + arg_211_0 then
				arg_208_1.typewritter.percent = 1

				arg_208_1.typewritter:SetDirty()
				arg_208_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I18g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I18f"
	},
	voices = {}
}
