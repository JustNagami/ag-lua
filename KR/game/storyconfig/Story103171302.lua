return {
	Play317132001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317132001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317132002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K09f"

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
				local var_4_5 = arg_1_1.bgs_.K09f

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
					if iter_4_0 ~= "K09f" then
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
				local var_4_19 = Color.New(0, 0, 0)

				var_4_19.a = Mathf.Lerp(1, 0, var_4_18)
				arg_1_1.mask_.color = var_4_19
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				local var_4_20 = Color.New(0, 0, 0)
				local var_4_21 = 0

				arg_1_1.mask_.enabled = false
				var_4_20.a = var_4_21
				arg_1_1.mask_.color = var_4_20
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

			local var_4_28 = 0.433333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo.awb")

				local var_4_32 = ""
				local var_4_33 = manager.audio:GetAudioName("bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo")

				if var_4_33 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_33 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_33

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_33
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

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.625

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(317132001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 25
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play317132002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 317132002
		arg_9_1.duration_ = 4.1

		local var_9_0 = {
			zh = 2.533,
			ja = 4.1
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play317132003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "1093ui_story"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(Asset.Load("Char/" .. var_12_0), arg_9_1.stage_.transform)

				var_12_1.name = var_12_0
				var_12_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_0] = var_12_1

				local var_12_2 = var_12_1:GetComponentInChildren(typeof(CharacterEffect))

				var_12_2.enabled = true

				local var_12_3 = GameObjectTools.GetOrAddComponent(var_12_1, typeof(DynamicBoneHelper))

				if var_12_3 then
					var_12_3:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_2.transform, false)

				arg_9_1.var_[var_12_0 .. "Animator"] = var_12_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_0 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_0 .. "LipSync"] = var_12_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_4 = arg_9_1.actors_["1093ui_story"].transform
			local var_12_5 = 0

			if var_12_5 < arg_9_1.time_ and arg_9_1.time_ <= var_12_5 + arg_12_0 then
				arg_9_1.var_.moveOldPos1093ui_story = var_12_4.localPosition
			end

			local var_12_6 = 0.001

			if var_12_5 <= arg_9_1.time_ and arg_9_1.time_ < var_12_5 + var_12_6 then
				local var_12_7 = (arg_9_1.time_ - var_12_5) / var_12_6
				local var_12_8 = Vector3.New(0, -1.11, -5.88)

				var_12_4.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1093ui_story, var_12_8, var_12_7)

				local var_12_9 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_9.x, var_12_9.y, var_12_9.z)

				local var_12_10 = var_12_4.localEulerAngles

				var_12_10.z = 0
				var_12_10.x = 0
				var_12_4.localEulerAngles = var_12_10
			end

			if arg_9_1.time_ >= var_12_5 + var_12_6 and arg_9_1.time_ < var_12_5 + var_12_6 + arg_12_0 then
				var_12_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_12_11 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_11.x, var_12_11.y, var_12_11.z)

				local var_12_12 = var_12_4.localEulerAngles

				var_12_12.z = 0
				var_12_12.x = 0
				var_12_4.localEulerAngles = var_12_12
			end

			local var_12_13 = arg_9_1.actors_["1093ui_story"]
			local var_12_14 = 0

			if var_12_14 < arg_9_1.time_ and arg_9_1.time_ <= var_12_14 + arg_12_0 and arg_9_1.var_.characterEffect1093ui_story == nil then
				arg_9_1.var_.characterEffect1093ui_story = var_12_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_15 = 0.200000002980232

			if var_12_14 <= arg_9_1.time_ and arg_9_1.time_ < var_12_14 + var_12_15 then
				local var_12_16 = (arg_9_1.time_ - var_12_14) / var_12_15

				if arg_9_1.var_.characterEffect1093ui_story then
					arg_9_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_14 + var_12_15 and arg_9_1.time_ < var_12_14 + var_12_15 + arg_12_0 and arg_9_1.var_.characterEffect1093ui_story then
				arg_9_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_12_17 = 0

			if var_12_17 < arg_9_1.time_ and arg_9_1.time_ <= var_12_17 + arg_12_0 then
				arg_9_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_12_18 = 0

			if var_12_18 < arg_9_1.time_ and arg_9_1.time_ <= var_12_18 + arg_12_0 then
				arg_9_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_12_19 = 0
			local var_12_20 = 0.4

			if var_12_19 < arg_9_1.time_ and arg_9_1.time_ <= var_12_19 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_21 = arg_9_1:FormatText(StoryNameCfg[73].name)

				arg_9_1.leftNameTxt_.text = var_12_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_22 = arg_9_1:GetWordFromCfg(317132002)
				local var_12_23 = arg_9_1:FormatText(var_12_22.content)

				arg_9_1.text_.text = var_12_23

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_24 = 16
				local var_12_25 = utf8.len(var_12_23)
				local var_12_26 = var_12_24 <= 0 and var_12_20 or var_12_20 * (var_12_25 / var_12_24)

				if var_12_26 > 0 and var_12_20 < var_12_26 then
					arg_9_1.talkMaxDuration = var_12_26

					if var_12_26 + var_12_19 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_26 + var_12_19
					end
				end

				arg_9_1.text_.text = var_12_23
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317132", "317132002", "story_v_out_317132.awb") ~= 0 then
					local var_12_27 = manager.audio:GetVoiceLength("story_v_out_317132", "317132002", "story_v_out_317132.awb") / 1000

					if var_12_27 + var_12_19 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_27 + var_12_19
					end

					if var_12_22.prefab_name ~= "" and arg_9_1.actors_[var_12_22.prefab_name] ~= nil then
						local var_12_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_22.prefab_name].transform, "story_v_out_317132", "317132002", "story_v_out_317132.awb")

						arg_9_1:RecordAudio("317132002", var_12_28)
						arg_9_1:RecordAudio("317132002", var_12_28)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_317132", "317132002", "story_v_out_317132.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_317132", "317132002", "story_v_out_317132.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_29 = math.max(var_12_20, arg_9_1.talkMaxDuration)

			if var_12_19 <= arg_9_1.time_ and arg_9_1.time_ < var_12_19 + var_12_29 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_19) / var_12_29

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_19 + var_12_29 and arg_9_1.time_ < var_12_19 + var_12_29 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play317132003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 317132003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play317132004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1093ui_story"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos1093ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(0, 100, 0)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1093ui_story, var_16_4, var_16_3)

				local var_16_5 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_5.x, var_16_5.y, var_16_5.z)

				local var_16_6 = var_16_0.localEulerAngles

				var_16_6.z = 0
				var_16_6.x = 0
				var_16_0.localEulerAngles = var_16_6
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(0, 100, 0)

				local var_16_7 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_7.x, var_16_7.y, var_16_7.z)

				local var_16_8 = var_16_0.localEulerAngles

				var_16_8.z = 0
				var_16_8.x = 0
				var_16_0.localEulerAngles = var_16_8
			end

			local var_16_9 = 0
			local var_16_10 = 0.55

			if var_16_9 < arg_13_1.time_ and arg_13_1.time_ <= var_16_9 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_11 = arg_13_1:GetWordFromCfg(317132003)
				local var_16_12 = arg_13_1:FormatText(var_16_11.content)

				arg_13_1.text_.text = var_16_12

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_13 = 22
				local var_16_14 = utf8.len(var_16_12)
				local var_16_15 = var_16_13 <= 0 and var_16_10 or var_16_10 * (var_16_14 / var_16_13)

				if var_16_15 > 0 and var_16_10 < var_16_15 then
					arg_13_1.talkMaxDuration = var_16_15

					if var_16_15 + var_16_9 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_15 + var_16_9
					end
				end

				arg_13_1.text_.text = var_16_12
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_16 = math.max(var_16_10, arg_13_1.talkMaxDuration)

			if var_16_9 <= arg_13_1.time_ and arg_13_1.time_ < var_16_9 + var_16_16 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_9) / var_16_16

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_9 + var_16_16 and arg_13_1.time_ < var_16_9 + var_16_16 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play317132004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 317132004
		arg_17_1.duration_ = 1.3

		local var_17_0 = {
			zh = 1.033,
			ja = 1.3
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play317132005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "2079ui_story"

			if arg_17_1.actors_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(Asset.Load("Char/" .. var_20_0), arg_17_1.stage_.transform)

				var_20_1.name = var_20_0
				var_20_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.actors_[var_20_0] = var_20_1

				local var_20_2 = var_20_1:GetComponentInChildren(typeof(CharacterEffect))

				var_20_2.enabled = true

				local var_20_3 = GameObjectTools.GetOrAddComponent(var_20_1, typeof(DynamicBoneHelper))

				if var_20_3 then
					var_20_3:EnableDynamicBone(false)
				end

				arg_17_1:ShowWeapon(var_20_2.transform, false)

				arg_17_1.var_[var_20_0 .. "Animator"] = var_20_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_17_1.var_[var_20_0 .. "Animator"].applyRootMotion = true
				arg_17_1.var_[var_20_0 .. "LipSync"] = var_20_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_20_4 = arg_17_1.actors_["2079ui_story"].transform
			local var_20_5 = 0

			if var_20_5 < arg_17_1.time_ and arg_17_1.time_ <= var_20_5 + arg_20_0 then
				arg_17_1.var_.moveOldPos2079ui_story = var_20_4.localPosition
			end

			local var_20_6 = 0.001

			if var_20_5 <= arg_17_1.time_ and arg_17_1.time_ < var_20_5 + var_20_6 then
				local var_20_7 = (arg_17_1.time_ - var_20_5) / var_20_6
				local var_20_8 = Vector3.New(0, -1.28, -5.6)

				var_20_4.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos2079ui_story, var_20_8, var_20_7)

				local var_20_9 = manager.ui.mainCamera.transform.position - var_20_4.position

				var_20_4.forward = Vector3.New(var_20_9.x, var_20_9.y, var_20_9.z)

				local var_20_10 = var_20_4.localEulerAngles

				var_20_10.z = 0
				var_20_10.x = 0
				var_20_4.localEulerAngles = var_20_10
			end

			if arg_17_1.time_ >= var_20_5 + var_20_6 and arg_17_1.time_ < var_20_5 + var_20_6 + arg_20_0 then
				var_20_4.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_20_11 = manager.ui.mainCamera.transform.position - var_20_4.position

				var_20_4.forward = Vector3.New(var_20_11.x, var_20_11.y, var_20_11.z)

				local var_20_12 = var_20_4.localEulerAngles

				var_20_12.z = 0
				var_20_12.x = 0
				var_20_4.localEulerAngles = var_20_12
			end

			local var_20_13 = arg_17_1.actors_["2079ui_story"]
			local var_20_14 = 0

			if var_20_14 < arg_17_1.time_ and arg_17_1.time_ <= var_20_14 + arg_20_0 and arg_17_1.var_.characterEffect2079ui_story == nil then
				arg_17_1.var_.characterEffect2079ui_story = var_20_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_15 = 0.200000002980232

			if var_20_14 <= arg_17_1.time_ and arg_17_1.time_ < var_20_14 + var_20_15 then
				local var_20_16 = (arg_17_1.time_ - var_20_14) / var_20_15

				if arg_17_1.var_.characterEffect2079ui_story then
					arg_17_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_17_1.time_ >= var_20_14 + var_20_15 and arg_17_1.time_ < var_20_14 + var_20_15 + arg_20_0 and arg_17_1.var_.characterEffect2079ui_story then
				arg_17_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_20_17 = 0

			if var_20_17 < arg_17_1.time_ and arg_17_1.time_ <= var_20_17 + arg_20_0 then
				arg_17_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_20_18 = 0

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 then
				arg_17_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_20_19 = 0
			local var_20_20 = 0.15

			if var_20_19 < arg_17_1.time_ and arg_17_1.time_ <= var_20_19 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_21 = arg_17_1:FormatText(StoryNameCfg[529].name)

				arg_17_1.leftNameTxt_.text = var_20_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_22 = arg_17_1:GetWordFromCfg(317132004)
				local var_20_23 = arg_17_1:FormatText(var_20_22.content)

				arg_17_1.text_.text = var_20_23

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_24 = 6
				local var_20_25 = utf8.len(var_20_23)
				local var_20_26 = var_20_24 <= 0 and var_20_20 or var_20_20 * (var_20_25 / var_20_24)

				if var_20_26 > 0 and var_20_20 < var_20_26 then
					arg_17_1.talkMaxDuration = var_20_26

					if var_20_26 + var_20_19 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_26 + var_20_19
					end
				end

				arg_17_1.text_.text = var_20_23
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317132", "317132004", "story_v_out_317132.awb") ~= 0 then
					local var_20_27 = manager.audio:GetVoiceLength("story_v_out_317132", "317132004", "story_v_out_317132.awb") / 1000

					if var_20_27 + var_20_19 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_27 + var_20_19
					end

					if var_20_22.prefab_name ~= "" and arg_17_1.actors_[var_20_22.prefab_name] ~= nil then
						local var_20_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_22.prefab_name].transform, "story_v_out_317132", "317132004", "story_v_out_317132.awb")

						arg_17_1:RecordAudio("317132004", var_20_28)
						arg_17_1:RecordAudio("317132004", var_20_28)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_317132", "317132004", "story_v_out_317132.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_317132", "317132004", "story_v_out_317132.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_29 = math.max(var_20_20, arg_17_1.talkMaxDuration)

			if var_20_19 <= arg_17_1.time_ and arg_17_1.time_ < var_20_19 + var_20_29 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_19) / var_20_29

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_19 + var_20_29 and arg_17_1.time_ < var_20_19 + var_20_29 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play317132005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 317132005
		arg_21_1.duration_ = 1.17

		local var_21_0 = {
			zh = 1.066,
			ja = 1.166
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play317132006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = "1015ui_story"

			if arg_21_1.actors_[var_24_0] == nil then
				local var_24_1 = Object.Instantiate(Asset.Load("Char/" .. var_24_0), arg_21_1.stage_.transform)

				var_24_1.name = var_24_0
				var_24_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.actors_[var_24_0] = var_24_1

				local var_24_2 = var_24_1:GetComponentInChildren(typeof(CharacterEffect))

				var_24_2.enabled = true

				local var_24_3 = GameObjectTools.GetOrAddComponent(var_24_1, typeof(DynamicBoneHelper))

				if var_24_3 then
					var_24_3:EnableDynamicBone(false)
				end

				arg_21_1:ShowWeapon(var_24_2.transform, false)

				arg_21_1.var_[var_24_0 .. "Animator"] = var_24_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_21_1.var_[var_24_0 .. "Animator"].applyRootMotion = true
				arg_21_1.var_[var_24_0 .. "LipSync"] = var_24_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_24_4 = arg_21_1.actors_["1015ui_story"].transform
			local var_24_5 = 0

			if var_24_5 < arg_21_1.time_ and arg_21_1.time_ <= var_24_5 + arg_24_0 then
				arg_21_1.var_.moveOldPos1015ui_story = var_24_4.localPosition
			end

			local var_24_6 = 0.001

			if var_24_5 <= arg_21_1.time_ and arg_21_1.time_ < var_24_5 + var_24_6 then
				local var_24_7 = (arg_21_1.time_ - var_24_5) / var_24_6
				local var_24_8 = Vector3.New(0, -1.15, -6.2)

				var_24_4.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1015ui_story, var_24_8, var_24_7)

				local var_24_9 = manager.ui.mainCamera.transform.position - var_24_4.position

				var_24_4.forward = Vector3.New(var_24_9.x, var_24_9.y, var_24_9.z)

				local var_24_10 = var_24_4.localEulerAngles

				var_24_10.z = 0
				var_24_10.x = 0
				var_24_4.localEulerAngles = var_24_10
			end

			if arg_21_1.time_ >= var_24_5 + var_24_6 and arg_21_1.time_ < var_24_5 + var_24_6 + arg_24_0 then
				var_24_4.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_24_11 = manager.ui.mainCamera.transform.position - var_24_4.position

				var_24_4.forward = Vector3.New(var_24_11.x, var_24_11.y, var_24_11.z)

				local var_24_12 = var_24_4.localEulerAngles

				var_24_12.z = 0
				var_24_12.x = 0
				var_24_4.localEulerAngles = var_24_12
			end

			local var_24_13 = arg_21_1.actors_["1015ui_story"]
			local var_24_14 = 0

			if var_24_14 < arg_21_1.time_ and arg_21_1.time_ <= var_24_14 + arg_24_0 and arg_21_1.var_.characterEffect1015ui_story == nil then
				arg_21_1.var_.characterEffect1015ui_story = var_24_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_15 = 0.200000002980232

			if var_24_14 <= arg_21_1.time_ and arg_21_1.time_ < var_24_14 + var_24_15 then
				local var_24_16 = (arg_21_1.time_ - var_24_14) / var_24_15

				if arg_21_1.var_.characterEffect1015ui_story then
					arg_21_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_14 + var_24_15 and arg_21_1.time_ < var_24_14 + var_24_15 + arg_24_0 and arg_21_1.var_.characterEffect1015ui_story then
				arg_21_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_24_17 = 0

			if var_24_17 < arg_21_1.time_ and arg_21_1.time_ <= var_24_17 + arg_24_0 then
				arg_21_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_24_18 = 0

			if var_24_18 < arg_21_1.time_ and arg_21_1.time_ <= var_24_18 + arg_24_0 then
				arg_21_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_24_19 = arg_21_1.actors_["2079ui_story"].transform
			local var_24_20 = 0

			if var_24_20 < arg_21_1.time_ and arg_21_1.time_ <= var_24_20 + arg_24_0 then
				arg_21_1.var_.moveOldPos2079ui_story = var_24_19.localPosition
			end

			local var_24_21 = 0.001

			if var_24_20 <= arg_21_1.time_ and arg_21_1.time_ < var_24_20 + var_24_21 then
				local var_24_22 = (arg_21_1.time_ - var_24_20) / var_24_21
				local var_24_23 = Vector3.New(0, 100, 0)

				var_24_19.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos2079ui_story, var_24_23, var_24_22)

				local var_24_24 = manager.ui.mainCamera.transform.position - var_24_19.position

				var_24_19.forward = Vector3.New(var_24_24.x, var_24_24.y, var_24_24.z)

				local var_24_25 = var_24_19.localEulerAngles

				var_24_25.z = 0
				var_24_25.x = 0
				var_24_19.localEulerAngles = var_24_25
			end

			if arg_21_1.time_ >= var_24_20 + var_24_21 and arg_21_1.time_ < var_24_20 + var_24_21 + arg_24_0 then
				var_24_19.localPosition = Vector3.New(0, 100, 0)

				local var_24_26 = manager.ui.mainCamera.transform.position - var_24_19.position

				var_24_19.forward = Vector3.New(var_24_26.x, var_24_26.y, var_24_26.z)

				local var_24_27 = var_24_19.localEulerAngles

				var_24_27.z = 0
				var_24_27.x = 0
				var_24_19.localEulerAngles = var_24_27
			end

			local var_24_28 = arg_21_1.actors_["2079ui_story"]
			local var_24_29 = 0

			if var_24_29 < arg_21_1.time_ and arg_21_1.time_ <= var_24_29 + arg_24_0 and arg_21_1.var_.characterEffect2079ui_story == nil then
				arg_21_1.var_.characterEffect2079ui_story = var_24_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_30 = 0.200000002980232

			if var_24_29 <= arg_21_1.time_ and arg_21_1.time_ < var_24_29 + var_24_30 then
				local var_24_31 = (arg_21_1.time_ - var_24_29) / var_24_30

				if arg_21_1.var_.characterEffect2079ui_story then
					local var_24_32 = Mathf.Lerp(0, 0.5, var_24_31)

					arg_21_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_21_1.var_.characterEffect2079ui_story.fillRatio = var_24_32
				end
			end

			if arg_21_1.time_ >= var_24_29 + var_24_30 and arg_21_1.time_ < var_24_29 + var_24_30 + arg_24_0 and arg_21_1.var_.characterEffect2079ui_story then
				local var_24_33 = 0.5

				arg_21_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_21_1.var_.characterEffect2079ui_story.fillRatio = var_24_33
			end

			local var_24_34 = 0
			local var_24_35 = 0.125

			if var_24_34 < arg_21_1.time_ and arg_21_1.time_ <= var_24_34 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_36 = arg_21_1:FormatText(StoryNameCfg[479].name)

				arg_21_1.leftNameTxt_.text = var_24_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_37 = arg_21_1:GetWordFromCfg(317132005)
				local var_24_38 = arg_21_1:FormatText(var_24_37.content)

				arg_21_1.text_.text = var_24_38

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_39 = 5
				local var_24_40 = utf8.len(var_24_38)
				local var_24_41 = var_24_39 <= 0 and var_24_35 or var_24_35 * (var_24_40 / var_24_39)

				if var_24_41 > 0 and var_24_35 < var_24_41 then
					arg_21_1.talkMaxDuration = var_24_41

					if var_24_41 + var_24_34 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_41 + var_24_34
					end
				end

				arg_21_1.text_.text = var_24_38
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317132", "317132005", "story_v_out_317132.awb") ~= 0 then
					local var_24_42 = manager.audio:GetVoiceLength("story_v_out_317132", "317132005", "story_v_out_317132.awb") / 1000

					if var_24_42 + var_24_34 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_42 + var_24_34
					end

					if var_24_37.prefab_name ~= "" and arg_21_1.actors_[var_24_37.prefab_name] ~= nil then
						local var_24_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_37.prefab_name].transform, "story_v_out_317132", "317132005", "story_v_out_317132.awb")

						arg_21_1:RecordAudio("317132005", var_24_43)
						arg_21_1:RecordAudio("317132005", var_24_43)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_317132", "317132005", "story_v_out_317132.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_317132", "317132005", "story_v_out_317132.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_44 = math.max(var_24_35, arg_21_1.talkMaxDuration)

			if var_24_34 <= arg_21_1.time_ and arg_21_1.time_ < var_24_34 + var_24_44 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_34) / var_24_44

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_34 + var_24_44 and arg_21_1.time_ < var_24_34 + var_24_44 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play317132006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 317132006
		arg_25_1.duration_ = 2

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play317132007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["2079ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos2079ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, -1.28, -5.6)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos2079ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["2079ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect2079ui_story == nil then
				arg_25_1.var_.characterEffect2079ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect2079ui_story then
					arg_25_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect2079ui_story then
				arg_25_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_28_14 = arg_25_1.actors_["1015ui_story"].transform
			local var_28_15 = 0

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				arg_25_1.var_.moveOldPos1015ui_story = var_28_14.localPosition
			end

			local var_28_16 = 0.001

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_16 then
				local var_28_17 = (arg_25_1.time_ - var_28_15) / var_28_16
				local var_28_18 = Vector3.New(0, 100, 0)

				var_28_14.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1015ui_story, var_28_18, var_28_17)

				local var_28_19 = manager.ui.mainCamera.transform.position - var_28_14.position

				var_28_14.forward = Vector3.New(var_28_19.x, var_28_19.y, var_28_19.z)

				local var_28_20 = var_28_14.localEulerAngles

				var_28_20.z = 0
				var_28_20.x = 0
				var_28_14.localEulerAngles = var_28_20
			end

			if arg_25_1.time_ >= var_28_15 + var_28_16 and arg_25_1.time_ < var_28_15 + var_28_16 + arg_28_0 then
				var_28_14.localPosition = Vector3.New(0, 100, 0)

				local var_28_21 = manager.ui.mainCamera.transform.position - var_28_14.position

				var_28_14.forward = Vector3.New(var_28_21.x, var_28_21.y, var_28_21.z)

				local var_28_22 = var_28_14.localEulerAngles

				var_28_22.z = 0
				var_28_22.x = 0
				var_28_14.localEulerAngles = var_28_22
			end

			local var_28_23 = 0
			local var_28_24 = 0.125

			if var_28_23 < arg_25_1.time_ and arg_25_1.time_ <= var_28_23 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_25 = arg_25_1:FormatText(StoryNameCfg[530].name)

				arg_25_1.leftNameTxt_.text = var_28_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_26 = arg_25_1:GetWordFromCfg(317132006)
				local var_28_27 = arg_25_1:FormatText(var_28_26.content)

				arg_25_1.text_.text = var_28_27

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_28 = 6
				local var_28_29 = utf8.len(var_28_27)
				local var_28_30 = var_28_28 <= 0 and var_28_24 or var_28_24 * (var_28_29 / var_28_28)

				if var_28_30 > 0 and var_28_24 < var_28_30 then
					arg_25_1.talkMaxDuration = var_28_30

					if var_28_30 + var_28_23 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_30 + var_28_23
					end
				end

				arg_25_1.text_.text = var_28_27
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317132", "317132006", "story_v_out_317132.awb") ~= 0 then
					local var_28_31 = manager.audio:GetVoiceLength("story_v_out_317132", "317132006", "story_v_out_317132.awb") / 1000

					if var_28_31 + var_28_23 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_31 + var_28_23
					end

					if var_28_26.prefab_name ~= "" and arg_25_1.actors_[var_28_26.prefab_name] ~= nil then
						local var_28_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_26.prefab_name].transform, "story_v_out_317132", "317132006", "story_v_out_317132.awb")

						arg_25_1:RecordAudio("317132006", var_28_32)
						arg_25_1:RecordAudio("317132006", var_28_32)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_317132", "317132006", "story_v_out_317132.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_317132", "317132006", "story_v_out_317132.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_33 = math.max(var_28_24, arg_25_1.talkMaxDuration)

			if var_28_23 <= arg_25_1.time_ and arg_25_1.time_ < var_28_23 + var_28_33 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_23) / var_28_33

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_23 + var_28_33 and arg_25_1.time_ < var_28_23 + var_28_33 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play317132007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 317132007
		arg_29_1.duration_ = 3.6

		local var_29_0 = {
			zh = 3.333,
			ja = 3.6
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play317132008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["2079ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos2079ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, -1.28, -5.6)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos2079ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["2079ui_story"]
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 and arg_29_1.var_.characterEffect2079ui_story == nil then
				arg_29_1.var_.characterEffect2079ui_story = var_32_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_11 = 0.200000002980232

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11

				if arg_29_1.var_.characterEffect2079ui_story then
					arg_29_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 and arg_29_1.var_.characterEffect2079ui_story then
				arg_29_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_32_13 = 0

			if var_32_13 < arg_29_1.time_ and arg_29_1.time_ <= var_32_13 + arg_32_0 then
				arg_29_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_32_15 = "2078ui_story"

			if arg_29_1.actors_[var_32_15] == nil then
				local var_32_16 = Object.Instantiate(Asset.Load("Char/" .. var_32_15), arg_29_1.stage_.transform)

				var_32_16.name = var_32_15
				var_32_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_15] = var_32_16

				local var_32_17 = var_32_16:GetComponentInChildren(typeof(CharacterEffect))

				var_32_17.enabled = true

				local var_32_18 = GameObjectTools.GetOrAddComponent(var_32_16, typeof(DynamicBoneHelper))

				if var_32_18 then
					var_32_18:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_17.transform, false)

				arg_29_1.var_[var_32_15 .. "Animator"] = var_32_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_15 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_15 .. "LipSync"] = var_32_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_19 = arg_29_1.actors_["2078ui_story"]
			local var_32_20 = 0

			if var_32_20 < arg_29_1.time_ and arg_29_1.time_ <= var_32_20 + arg_32_0 and arg_29_1.var_.characterEffect2078ui_story == nil then
				arg_29_1.var_.characterEffect2078ui_story = var_32_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_21 = 0.200000002980232

			if var_32_20 <= arg_29_1.time_ and arg_29_1.time_ < var_32_20 + var_32_21 then
				local var_32_22 = (arg_29_1.time_ - var_32_20) / var_32_21

				if arg_29_1.var_.characterEffect2078ui_story then
					local var_32_23 = Mathf.Lerp(0, 0.5, var_32_22)

					arg_29_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_29_1.var_.characterEffect2078ui_story.fillRatio = var_32_23
				end
			end

			if arg_29_1.time_ >= var_32_20 + var_32_21 and arg_29_1.time_ < var_32_20 + var_32_21 + arg_32_0 and arg_29_1.var_.characterEffect2078ui_story then
				local var_32_24 = 0.5

				arg_29_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_29_1.var_.characterEffect2078ui_story.fillRatio = var_32_24
			end

			local var_32_25 = 0
			local var_32_26 = 0.6

			if var_32_25 < arg_29_1.time_ and arg_29_1.time_ <= var_32_25 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_27 = arg_29_1:FormatText(StoryNameCfg[529].name)

				arg_29_1.leftNameTxt_.text = var_32_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_28 = arg_29_1:GetWordFromCfg(317132007)
				local var_32_29 = arg_29_1:FormatText(var_32_28.content)

				arg_29_1.text_.text = var_32_29

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_30 = 24
				local var_32_31 = utf8.len(var_32_29)
				local var_32_32 = var_32_30 <= 0 and var_32_26 or var_32_26 * (var_32_31 / var_32_30)

				if var_32_32 > 0 and var_32_26 < var_32_32 then
					arg_29_1.talkMaxDuration = var_32_32

					if var_32_32 + var_32_25 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_32 + var_32_25
					end
				end

				arg_29_1.text_.text = var_32_29
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317132", "317132007", "story_v_out_317132.awb") ~= 0 then
					local var_32_33 = manager.audio:GetVoiceLength("story_v_out_317132", "317132007", "story_v_out_317132.awb") / 1000

					if var_32_33 + var_32_25 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_33 + var_32_25
					end

					if var_32_28.prefab_name ~= "" and arg_29_1.actors_[var_32_28.prefab_name] ~= nil then
						local var_32_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_28.prefab_name].transform, "story_v_out_317132", "317132007", "story_v_out_317132.awb")

						arg_29_1:RecordAudio("317132007", var_32_34)
						arg_29_1:RecordAudio("317132007", var_32_34)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_317132", "317132007", "story_v_out_317132.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_317132", "317132007", "story_v_out_317132.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_35 = math.max(var_32_26, arg_29_1.talkMaxDuration)

			if var_32_25 <= arg_29_1.time_ and arg_29_1.time_ < var_32_25 + var_32_35 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_25) / var_32_35

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_25 + var_32_35 and arg_29_1.time_ < var_32_25 + var_32_35 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play317132008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 317132008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
			arg_33_1.auto_ = false
		end

		function arg_33_1.playNext_(arg_35_0)
			arg_33_1.onStoryFinished_()
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["2079ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos2079ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, 100, 0)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos2079ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, 100, 0)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["2079ui_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and arg_33_1.var_.characterEffect2079ui_story == nil then
				arg_33_1.var_.characterEffect2079ui_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect2079ui_story then
					local var_36_13 = Mathf.Lerp(0, 0.5, var_36_12)

					arg_33_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_33_1.var_.characterEffect2079ui_story.fillRatio = var_36_13
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect2079ui_story then
				local var_36_14 = 0.5

				arg_33_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_33_1.var_.characterEffect2079ui_story.fillRatio = var_36_14
			end

			local var_36_15 = 0
			local var_36_16 = 1.05

			if var_36_15 < arg_33_1.time_ and arg_33_1.time_ <= var_36_15 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_17 = arg_33_1:GetWordFromCfg(317132008)
				local var_36_18 = arg_33_1:FormatText(var_36_17.content)

				arg_33_1.text_.text = var_36_18

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_19 = 42
				local var_36_20 = utf8.len(var_36_18)
				local var_36_21 = var_36_19 <= 0 and var_36_16 or var_36_16 * (var_36_20 / var_36_19)

				if var_36_21 > 0 and var_36_16 < var_36_21 then
					arg_33_1.talkMaxDuration = var_36_21

					if var_36_21 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_21 + var_36_15
					end
				end

				arg_33_1.text_.text = var_36_18
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_22 = math.max(var_36_16, arg_33_1.talkMaxDuration)

			if var_36_15 <= arg_33_1.time_ and arg_33_1.time_ < var_36_15 + var_36_22 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_15) / var_36_22

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_15 + var_36_22 and arg_33_1.time_ < var_36_15 + var_36_22 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09f"
	},
	voices = {
		"story_v_out_317132.awb"
	}
}
